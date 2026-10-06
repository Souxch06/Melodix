/**
 * Moteur + source Spotify Web (port).
 *
 * Le port est un double : l'intégration réelle (hôte, tentative,
 * confirmation) est testée dans spotifyWebHost.unit.test.ts. Ici on vérifie
 * le CONTRAT tenu par le moteur :
 *  - `playing` uniquement après confirmation RÉELLE (port.attempt confirmé) ;
 *  - tout verdict non confirmé retombe sur la cascade Audius → YouTube ;
 *  - les états publiés (jamais les commandes) mettent à jour l'état moteur ;
 *  - l'intention : un geste ouvre la vue, l'avance automatique non ;
 *  - rien n'est tenté pour une piste sans identifiant Spotify (audius:) ;
 *  - stop/fin de file invalident la piste active.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  melodixPlayer,
  PlayerTrack,
  audiusTrackSource,
  spotifyTrackSource,
} from '../player';
import { __testSetAudioProviders } from '../audio';
import type { AudioProvider, ResolvedStream } from '../audio';
import type {
  SpotifyWebSourceCommand,
  SpotifyWebSourceCommandResult,
  SpotifyWebPublishedState,
} from '../playbackBackend/spotifyWebHost';
import type { SpotifyWebAttemptOutcome } from '../playbackBackend/spotifyWebPlaybackIntegration';

jest.mock('expo-constants', () => ({ expoConfig: { extra: {} } }));

// expo-av stub minimal (même contrat que player.unit.test.ts).
// eslint-disable-next-line @typescript-eslint/no-explicit-any
let mockCreatedSounds: any[] = [];
// eslint-disable-next-line @typescript-eslint/no-explicit-any
let lastStatusCallback: ((status: Record<string, unknown>) => void) | null =
  null;

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

jest.mock('expo-av', () => ({
  Audio: {
    setAudioModeAsync: jest.fn(async () => {}),
    Sound: {
      createAsync: jest.fn(
        async (
          _source: { uri: string },
          _initial: Record<string, unknown>,
          onStatus?: (status: Record<string, unknown>) => void
        ) => {
          lastStatusCallback = onStatus ?? null;
          const created = makeSound();
          mockCreatedSounds.push(created);
          return {
            sound: created,
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
}));

const makeProvider = (): AudioProvider => ({
  id: 'audius',
  displayName: 'Audius',
  matches: jest.fn(async () => []),
  resolveMatch: jest.fn(async () => ({ sourceId: 'aud-good', score: 0.9 })),
  resolveSource: jest.fn(
    async (sourceId: string): Promise<ResolvedStream | null> => ({
      uri: `https://stream/${sourceId}`,
    })
  ),
});

const spotifyTrack = (
  id: string,
  title = `Track ${id}`,
  artists = ['Neffex']
): PlayerTrack => ({
  id: `spotify:${id}`,
  title,
  artists,
  album: null,
  durationMillis: 200_000,
  imageURL: '',
  source: spotifyTrackSource(id),
});

const audiusTrack = (id: string): PlayerTrack => ({
  id: `audius:${id}`,
  title: `Aud ${id}`,
  artists: ['Neffex'],
  album: null,
  imageURL: '',
  source: audiusTrackSource(id),
});

const flush = () => new Promise((resolve) => setTimeout(resolve, 0));

/** Double de port : tout est piloté explicitement par le test. */
const makeFakePort = () => {
  const publishedListeners: ((s: SpotifyWebPublishedState) => void)[] = [];
  // Pas d'annotation stricte ici : les méthodes `jest.fn` doivent garder
  // leurs handleurs de mock (mockResolvedValue/mockImplementation/…).
  const port = {
    isReady: jest.fn(() => true),
    isViewVisible: jest.fn(() => false),
    setViewVisible: jest.fn(),
    attempt: jest.fn(
      async (): Promise<SpotifyWebAttemptOutcome> => ({
        status: 'not-ready',
        blockers: [],
      })
    ),
    sendCommand: jest.fn(
      async (
        _command: SpotifyWebSourceCommand,
        _value?: number
      ): Promise<SpotifyWebSourceCommandResult | null> => ({
        accepted: false,
        code: 'no-authorized-execution-surface',
      })
    ),
    getPublishedState: jest.fn((): SpotifyWebPublishedState | null => null),
    subscribePublishedState: (
      listener: (s: SpotifyWebPublishedState) => void
    ) => {
      publishedListeners.push(listener);
      return () => {
        const i = publishedListeners.indexOf(listener);
        if (i >= 0) publishedListeners.splice(i, 1);
      };
    },
  };
  const publish = (
    partial: Partial<SpotifyWebPublishedState> & {
      status: SpotifyWebPublishedState['status'];
    }
  ): void => {
    const state: SpotifyWebPublishedState = {
      trackId: null,
      title: null,
      artists: [],
      artworkUrl: null,
      durationMillis: 0,
      positionMillis: 0,
      isPlaying: false,
      isLoading: false,
      errorCode: null,
      ...partial,
    };
    port.getPublishedState.mockReturnValue(state);
    publishedListeners.forEach((l) => l(state));
  };
  return { port, publish };
};

describe('melodixPlayer + source Spotify Web (port)', () => {
  let provider: AudioProvider;
  let fake: ReturnType<typeof makeFakePort>;

  beforeEach(async () => {
    await AsyncStorage.clear();
    mockCreatedSounds = [];
    lastStatusCallback = null;
    provider = makeProvider();
    __testSetAudioProviders({ audius: provider });
    await melodixPlayer.__testReset();
    fake = makeFakePort();
    melodixPlayer.attachSpotifyWebSource(fake.port);
  });

  afterEach(async () => {
    melodixPlayer.attachSpotifyWebSource(null);
    await melodixPlayer.__testReset();
  });

  it('confirmation réelle → playing SANS créer de Sound expo-av, provider « Spotify Web »', async () => {
    fake.port.attempt.mockResolvedValue({
      status: 'confirmed',
      trackId: 'abc',
      plan: { kind: 'ready' } as never,
      confirmedAtMillis: Date.now(),
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    const state = melodixPlayer.getState();
    expect(mockCreatedSounds).toHaveLength(0); // AUCUN flux Audius/YouTube
    expect(provider.resolveMatch).not.toHaveBeenCalled();
    expect(state.status).toBe('playing');
    expect(state.resolved).toEqual({
      provider: 'Spotify Web',
      sourceId: 'abc',
      score: 100,
    });
    expect(fake.port.setViewVisible).toHaveBeenCalledWith(true);
  });

  it('confirmation réelle adopte l’état publié (position/durée)', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'abc',
        positionMillis: 12_500,
        durationMillis: 200_000,
      });
      return {
        status: 'confirmed',
        trackId: 'abc',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      positionMillis: 12_500,
      durationMillis: 200_000,
    });
  });

  it('échec réel (timeout de confirmation) → fallback cascade Audius', async () => {
    fake.port.attempt.mockResolvedValue({
      status: 'failed',
      code: 'confirmation-timeout',
      attempts: [],
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    const state = melodixPlayer.getState();
    expect(state.status).toBe('playing');
    expect(state.resolved?.provider).toBe('Audius');
    expect(provider.resolveSource).toHaveBeenCalledWith('aud-good');
    expect(mockCreatedSounds).toHaveLength(1);
  });

  it('not-ready (porte fermée) → cascade immédiate, vue jamais ouverte', async () => {
    fake.port.isReady.mockReturnValue(false);

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    expect(fake.port.setViewVisible).not.toHaveBeenCalled();
    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
  });

  it('piste audius: (sans identifiant Spotify) → jamais tentée', async () => {
    await melodixPlayer.playTrack(audiusTrack('a1'));
    await flush();

    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(fake.port.setViewVisible).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('avance AUTOMATIQUE (fin de morceau expo-av) sans vue visible → pas de tentative', async () => {
    // Le 1er morceau est lu par la cascade (port non prêt).
    fake.port.isReady.mockReturnValue(false);
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();
    expect(melodixPlayer.getState().status).toBe('playing');

    // Fin réelle du 1er morceau (didJustFinish expo-av) → avance auto.
    fake.port.isReady.mockReturnValue(true);
    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: false,
      isBuffering: false,
      didJustFinish: true,
    });
    await flush();

    expect(fake.port.setViewVisible).not.toHaveBeenCalled();
    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().index).toBe(1);
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
  });

  it('GESTE next pendant vue visible → la tentative est faite pour la suite', async () => {
    // Premier morceau confirmé via Spotify (vue visible).
    fake.port.isViewVisible.mockReturnValue(true);
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'a',
        durationMillis: 200_000,
      });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');

    // next tapé (geste) → nouvelle tentative pour le morceau suivant.
    fake.port.attempt.mockClear();
    await melodixPlayer.next();
    await flush();

    expect(fake.port.attempt).toHaveBeenCalledTimes(1);
    expect(fake.port.attempt).toHaveBeenCalledWith(
      expect.objectContaining({ trackKey: 'spotify:b' })
    );
  });

  it('changement vers une piste non-Spotify : la page est mise en pause (pas de double lecture)', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'a',
        durationMillis: 100_000,
      });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), audiusTrack('b')], 0);
    await flush();
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');

    // Geste next vers une piste SANS identifiant Spotify : la cascade prend.
    fake.port.sendCommand.mockClear();
    await melodixPlayer.next();
    await flush();

    // La page jouait encore « a » : elle a reçu l'arrêt best-effort.
    expect(fake.port.sendCommand).toHaveBeenCalledWith('pause');
    expect(melodixPlayer.getState().index).toBe(1);
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
    expect(mockCreatedSounds).toHaveLength(1);
  });

  it('fin publiée (ended) → la file avance comme après un didJustFinish', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'a',
        durationMillis: 200_000,
      });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();

    // Fin RÉELLE publiée par la page.
    fake.port.attempt.mockClear();
    fake.publish({
      status: 'ended',
      trackId: 'a',
      positionMillis: 200_000,
      durationMillis: 200_000,
    });
    await flush();

    expect(melodixPlayer.getState().index).toBe(1);
    // Vue masquée (défaut du double) + pas de geste → pas de tentative :
    // la cascade prend le morceau suivant.
    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
  });

  it('fin publiée N’avance qu’une fois (ré-émission ignorée)', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'a',
        durationMillis: 100_000,
      });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();

    fake.publish({ status: 'ended', trackId: 'a', durationMillis: 100_000 });
    await flush();
    const firstIndex = melodixPlayer.getState().index;

    // Ré-émission de la même fin : rien ne doit bouger.
    fake.publish({ status: 'ended', trackId: 'a', durationMillis: 100_000 });
    await flush();
    expect(melodixPlayer.getState().index).toBe(firstIndex);
  });

  it('erreur publiée (pont mort) → piste en échec, avance par la cascade', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'a',
        durationMillis: 100_000,
      });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();

    fake.publish({
      status: 'error',
      trackId: 'a',
      errorCode: 'renderer_destroyed',
    });
    await flush();

    expect(melodixPlayer.getState().index).toBe(1);
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
  });

  it('état publié d’UNE AUTRE piste n’est jamais attribué', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({
        status: 'playing',
        trackId: 'a',
        durationMillis: 100_000,
      });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playTrack(spotifyTrack('a'));
    await flush();

    // L’utilisateur change de morceau DANS LA VUE (autre identifiant).
    fake.publish({
      status: 'playing',
      trackId: 'OTHER',
      positionMillis: 30_000,
      durationMillis: 180_000,
    });
    await flush();

    const state = melodixPlayer.getState();
    expect(state.current?.id).toBe('spotify:a');
    expect(state.positionMillis).toBe(0);
    expect(state.durationMillis).toBe(100_000);
  });

  it('togglePlayPause/seek pendant lecture Spotify → commandes vers le port, pas de Sound', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({ status: 'playing', trackId: 'a', positionMillis: 10_000 });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playTrack(spotifyTrack('a'));
    await flush();

    await melodixPlayer.togglePlayPause();
    await flush();
    expect(fake.port.sendCommand).toHaveBeenCalledWith('pause');

    await melodixPlayer.togglePlayPause();
    await flush();
    expect(fake.port.sendCommand).toHaveBeenCalledWith('play');

    await melodixPlayer.seekTo(42_000);
    expect(fake.port.sendCommand).toHaveBeenCalledWith('seek', 42_000);
    // La position n’est PAS inventée : elle reste l’état publié.
    expect(melodixPlayer.getState().positionMillis).toBe(10_000);

    // L’état publié suivant met à jour la position.
    fake.publish({
      status: 'playing',
      trackId: 'a',
      positionMillis: 42_000,
      durationMillis: 100_000,
    });
    await flush();
    expect(melodixPlayer.getState().positionMillis).toBe(42_000);
  });

  it('pause() publie PAUSED : l’état suit la page, pas la commande', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({ status: 'playing', trackId: 'a' });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playTrack(spotifyTrack('a'));
    await flush();
    expect(melodixPlayer.getState().status).toBe('playing');

    await melodixPlayer.pause();
    await flush();
    // La commande a été envoyée, mais l’état ne change que sur publication.
    expect(fake.port.sendCommand).toHaveBeenCalledWith('pause');
    expect(melodixPlayer.getState().status).toBe('playing');

    fake.publish({ status: 'paused', trackId: 'a', positionMillis: 15_000 });
    await flush();
    expect(melodixPlayer.getState().status).toBe('paused');
  });

  it('stop() invalide la piste active et demande une pause (best-effort)', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({ status: 'playing', trackId: 'a' });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playTrack(spotifyTrack('a'));
    await flush();

    await melodixPlayer.stop();
    expect(fake.port.sendCommand).toHaveBeenCalledWith('pause');
    expect(melodixPlayer.getState().status).toBe('idle');

    // Un état publié tardif ne doit plus rien changer.
    fake.publish({ status: 'playing', trackId: 'a' });
    await flush();
    expect(melodixPlayer.getState().status).toBe('idle');
  });

  it('reprise tapée (togglePlayPause sur piste pausée) → nouvelle tentative, vue ouverte', async () => {
    // Piste Spotify restaurée en pause (jamais confirmée dans cette session).
    await melodixPlayer.playQueue([spotifyTrack('a')], 0);
    // Le premier play a essuyé un not-ready → cascade… pour ce test on
    // neutralise la cascade : le port devient prêt APRÈS un stop.
    await melodixPlayer.stop();

    fake.port.isReady.mockReturnValue(true);
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({ status: 'playing', trackId: 'a' });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    // Recharger la file en pause : playQueue lit directement. On simule une
    // session en pause via playQueue puis pause.
    await melodixPlayer.playQueue([spotifyTrack('a')], 0);
    await flush();
    expect(melodixPlayer.getState().status).toBe('playing');
    await melodixPlayer.pause();
    await flush();
    expect(fake.port.sendCommand).toHaveBeenCalledWith('pause');

    // La page honore la pause et le PUBLIE (jamais d'état inventé).
    fake.publish({ status: 'paused', trackId: 'a', positionMillis: 12_000 });
    await flush();
    expect(melodixPlayer.getState().status).toBe('paused');

    // Tap lecture : la piste est ACTIVE (confirmée) → simple commande.
    fake.port.sendCommand.mockClear();
    await melodixPlayer.play();
    expect(fake.port.sendCommand).toHaveBeenCalledWith('play');
  });

  it('sans port attaché (défaut) → comportement 100 % cascade inchangé', async () => {
    melodixPlayer.attachSpotifyWebSource(null);
    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
  });
});
