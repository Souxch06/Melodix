/**
 * CHAÎNE COMPLÈTE DE RÉSOLUTION — bout en bout, jusqu'au moteur de lecture.
 *
 * Le brief exige un test prouvant la chaîne ENTIERE :
 *
 *   piste Spotify (métadonnées) → Audius consulte et ne trouve rien →
 *   YouTube (fallback multi-stratégies) trouve un match → le backend
 *   sélectionné est YouTube → le PlayerController reçoit LA PISTE RÉSOLUE
 *   (provider + sourceId + score) et passe en lecture.
 *
 * C'est la preuve qu'un échec Audius n'est JAMAIS interprété comme « track
 * unavailable » avant que YouTube soit réellement essayé, et que le match
 * YouTube remonte bien jusqu'au moteur (pas seulement jusqu'au resolver).
 */
import AsyncStorage from '@react-native-async-storage/async-storage';

import { melodixPlayer, PlayerTrack, spotifyTrackSource } from '../player';
import { __testSetAudioProviders } from '../audio';
import type { AudioProvider, ResolvedStream } from '../audio';

jest.mock('expo-constants', () => ({ expoConfig: { extra: {} } }));

// expo-av stub minimal : crée un Sound qui se met en lecture (isPlaying=true)
// au premier status — la frontière « playing = confirmation runtime » est
// respectée (le moteur n'invente pas playing, c'est le mock qui confirme).
jest.mock('expo-av', () => {
  const makeSound = () => ({
    unloadAsync: jest.fn(async () => {}),
    playAsync: jest.fn(async () => ({
      isLoaded: true,
      isPlaying: true,
      isBuffering: false,
    })),
    pauseAsync: jest.fn(async () => ({
      isLoaded: true,
      isPlaying: false,
      isBuffering: false,
    })),
    setPositionAsync: jest.fn(async () => {}),
    setVolumeAsync: jest.fn(async () => {}),
  });

  return {
    Audio: {
      setAudioModeAsync: jest.fn(async () => {}),
      Sound: {
        createAsync: jest.fn(
          async (
            _source: { uri: string },
            _initial: Record<string, unknown>,
            onStatus?: (status: Record<string, unknown>) => void
          ) => {
            // Confirmation runtime immédiate (comme un flux qui charge).
            onStatus?.({
              isLoaded: true,
              isPlaying: true,
              isBuffering: false,
              positionMillis: 0,
            });

            return {
              sound: makeSound(),
              status: {
                isLoaded: true,
                isPlaying: true,
                isBuffering: false,
                positionMillis: 0,
              },
            };
          }
        ),
      },
    },
  };
});

type ProviderOverrides = Partial<{
  id: AudioProvider['id'];
  displayName: string;
  resolveMatch: AudioProvider['resolveMatch'];
  resolveSource: AudioProvider['resolveSource'];
}>;

const makeProvider = (overrides: ProviderOverrides = {}): AudioProvider => ({
  id: 'audius',
  displayName: 'Audius',
  matches: jest.fn(async () => []),
  resolveMatch: jest.fn(async () => ({ sourceId: 'aud-good', score: 0.9 })),
  resolveSource: jest.fn(
    async (sourceId: string): Promise<ResolvedStream | null> => ({
      uri: `https://stream/${sourceId}`,
    })
  ),
  ...overrides,
});

const spotifyTrack: PlayerTrack = {
  id: 'spotify:abc123',
  title: 'Song',
  artists: ['Artist'],
  album: 'Album',
  durationMillis: 200_000,
  isrc: null,
  explicit: null,
  imageURL: '',
  source: spotifyTrackSource('abc123'),
};

const flush = (times = 6) =>
  new Promise<void>((resolve) => {
    let count = 0;
    const tick = () => {
      count += 1;
      if (count >= times) {
        resolve();
        return;
      }
      setTimeout(tick, 0);
    };
    tick();
  });

describe('chaîne complète Spotify → Audius (rien) → YouTube → PlayerController', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    await melodixPlayer.__testReset();
  });

  it('Audius muet → YouTube sert, backend YouTube, le moteur reçoit la piste résolue', async () => {
    const audius = makeProvider({
      id: 'audius',
      displayName: 'Audius',
      resolveMatch: jest.fn(async () => null), // rien trouvé
    });
    const youtube = makeProvider({
      id: 'youtube',
      displayName: 'YouTube',
      resolveMatch: jest.fn(async () => ({ sourceId: 'yt-1', score: 0.7 })),
    });
    __testSetAudioProviders({ audius, youtube });

    await melodixPlayer.playQueue([spotifyTrack], 0);
    await flush();

    const state = melodixPlayer.getState();

    // 1. Les métadonnées Spotify sont bien passées à la cascade.
    expect(audius.resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({ title: 'Song', artists: ['Artist'] })
    );

    // 2. Audius a ÉTÉ consulté et a répondu « rien » — et n'a PAS été
    //    interprété comme « indisponible » : le fallback YouTube est essayé.
    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(youtube.resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({ title: 'Song', artists: ['Artist'] })
    );

    // 3. Le backend sélectionné est YouTube : c'est SON flux qui est résolu,
    //    pas celui d'Audius.
    expect(audius.resolveSource).not.toHaveBeenCalled();
    expect(youtube.resolveSource).toHaveBeenCalledWith('yt-1');

    // 4. Le PlayerController reçoit LA PISTE RÉSOLUE (provider + sourceId +
    //    score 0..100) et passe en lecture.
    expect(state.resolved).toEqual({
      provider: 'YouTube',
      sourceId: 'yt-1',
      score: 70,
    });
    expect(state.status).toBe('playing');
    expect(state.current?.id).toBe('spotify:abc123');
  });

  it('inversement : Audius match → backend Audius, YouTube jamais consulté', async () => {
    const audius = makeProvider({
      id: 'audius',
      displayName: 'Audius',
      resolveMatch: jest.fn(async () => ({ sourceId: 'aud-1', score: 0.9 })),
    });
    const youtube = makeProvider({
      id: 'youtube',
      displayName: 'YouTube',
      resolveMatch: jest.fn(async () => ({ sourceId: 'yt-1', score: 0.8 })),
    });
    __testSetAudioProviders({ audius, youtube });

    await melodixPlayer.playQueue([spotifyTrack], 0);
    await flush();

    const state = melodixPlayer.getState();

    expect(audius.resolveSource).toHaveBeenCalledWith('aud-1');
    // La cascade s'arrête au premier match fiable : YouTube n'est jamais
    // touché (pas de requête superflue, pas de double résolu).
    expect(youtube.resolveMatch).not.toHaveBeenCalled();
    expect(state.resolved).toEqual({
      provider: 'Audius',
      sourceId: 'aud-1',
      score: 90,
    });
    expect(state.status).toBe('playing');
  });

  it('Audius + YouTube muets → statut unavailable, JAMAIS de faux match servi', async () => {
    const audius = makeProvider({
      id: 'audius',
      displayName: 'Audius',
      resolveMatch: jest.fn(async () => null),
    });
    const youtube = makeProvider({
      id: 'youtube',
      displayName: 'YouTube',
      resolveMatch: jest.fn(async () => null),
    });
    __testSetAudioProviders({ audius, youtube });

    await melodixPlayer.playQueue([spotifyTrack], 0);
    await flush();

    const state = melodixPlayer.getState();

    // Les deux fournisseurs ont été consultés et n'ont rien servi.
    expect(audius.resolveMatch).toHaveBeenCalled();
    expect(youtube.resolveMatch).toHaveBeenCalled();
    // Aucun flux n'a été résolu : le moteur annonce la panne proprement
    // (jamais un faux morceau, jamais playing sans confirmation, jamais
    // bloqué dans un état de chargement).
    expect(state.resolved).toBeNull();
    expect(state.status).not.toBe('playing');
    expect(['loading', 'buffering', 'resolving']).not.toContain(state.status);
    expect(state.notice?.kind).toBe('not-available');
  });
});
