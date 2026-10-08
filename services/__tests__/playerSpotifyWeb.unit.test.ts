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
import type {
  SpotifyWebAttemptOutcome,
  SpotifyWebPlaybackAttemptInput,
} from '../playbackBackend/spotifyWebPlaybackIntegration';

jest.mock('expo-constants', () => ({ expoConfig: { extra: {} } }));

// expo-av stub minimal (même contrat que player.unit.test.ts).
// eslint-disable-next-line @typescript-eslint/no-explicit-any
let mockCreatedSounds: any[] = [];

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
          _onStatus?: (status: Record<string, unknown>) => void
        ) => {
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
  // Photo de disponibilité dérivée de `isReady` (cohérence du double) ;
  // les blockers sont pilotables séparément (cas porte fermée).
  let readinessBlockers: string[] = [];
  const isReadyMock = jest.fn(() => true);
  // Pas d'annotation stricte ici : les méthodes `jest.fn` doivent garder
  // leurs handleurs de mock (mockResolvedValue/mockImplementation/…).
  const port = {
    isReady: isReadyMock,
    getReadiness: jest.fn(() => ({
      ready: isReadyMock(),
      blockers: readinessBlockers,
    })),
    setReadinessBlockersForTesting: (blockers: string[]): void => {
      readinessBlockers = blockers;
    },
    isViewVisible: jest.fn(() => false),
    setViewVisible: jest.fn(),
    attempt: jest.fn(
      async (
        _input: SpotifyWebPlaybackAttemptInput
      ): Promise<SpotifyWebAttemptOutcome> => ({
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

  it('échec réel (timeout de confirmation) → VRAIE erreur Spotify Web, pas de cascade', async () => {
    fake.port.attempt.mockResolvedValue({
      status: 'failed',
      code: 'confirmation-timeout',
      attempts: [],
    });

    const seenStatuses: string[] = [];
    const unsubscribe = melodixPlayer.subscribe((s) => {
      seenStatuses.push(s.status);
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();
    unsubscribe();

    const state = melodixPlayer.getState();
    // Jamais un « unavailable » inventé ni un relais Audius/YouTube :
    // erreur réelle PUBLIÉE (statut « error ») + notice avec le code réel.
    // File d'une piste → retour à l'idle, la notice reste visible.
    expect(seenStatuses).toContain('error');
    expect(seenStatuses).not.toContain('unavailable');
    expect(state.resolved).toBeNull();
    expect(state.notice).toEqual({
      kind: 'play-failed',
      title: 'Track abc',
      code: 'confirmation-timeout',
    });
    expect(provider.resolveMatch).not.toHaveBeenCalled();
    expect(provider.resolveSource).not.toHaveBeenCalled();
    expect(mockCreatedSounds).toHaveLength(0);
  });

  it('porte fermée par décision → erreur immédiate (pas d’attente), pas de cascade', async () => {
    fake.port.isReady.mockReturnValue(false);
    fake.port.setReadinessBlockersForTesting(['flag-local-desactive']);

    const seenStatuses: string[] = [];
    const unsubscribe = melodixPlayer.subscribe((s) => {
      seenStatuses.push(s.status);
    });
    const started = Date.now();
    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();
    unsubscribe();
    // Immédiat : aucune grace bornée quand la porte est fermée.
    expect(Date.now() - started).toBeLessThan(1_000);

    const state = melodixPlayer.getState();
    expect(seenStatuses).toContain('error');
    expect(state.notice?.code).toBe('spotify-web-disabled');
    expect(fake.port.setViewVisible).toHaveBeenCalledWith(true);
    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(provider.resolveMatch).not.toHaveBeenCalled();
    expect(mockCreatedSounds).toHaveLength(0);
  });

  it('hôte/pont non prêt → grace bornée, puis vraie erreur (pas de cascade)', async () => {
    fake.port.isReady.mockReturnValue(false);
    fake.port.setReadinessBlockersForTesting(['pont-non-pret']);
    melodixPlayer.__testSetSpotifyWebReadyGraceMs(30);

    const seenStatuses: string[] = [];
    const unsubscribe = melodixPlayer.subscribe((s) => {
      seenStatuses.push(s.status);
    });
    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();
    unsubscribe();

    const state = melodixPlayer.getState();
    expect(seenStatuses).toContain('error');
    expect(state.notice?.code).toBe('spotify-web-engine-not-ready');
    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(provider.resolveMatch).not.toHaveBeenCalled();
    expect(mockCreatedSounds).toHaveLength(0);
  });

  it('hôte/pont non prêt puis prêt pendant la grace → la tentative a lieu', async () => {
    fake.port.isReady.mockReturnValue(false);
    fake.port.setReadinessBlockersForTesting(['pont-non-pret']);
    melodixPlayer.__testSetSpotifyWebReadyGraceMs(500);
    setTimeout(() => fake.port.isReady.mockReturnValue(true), 60);

    fake.port.attempt.mockImplementation(async () => {
      fake.publish({ status: 'playing', trackId: 'abc' });
      return {
        status: 'confirmed',
        trackId: 'abc',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    expect(fake.port.attempt).toHaveBeenCalledTimes(1);
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');
  });

  it('piste audius: (sans identifiant Spotify) → jamais tentée', async () => {
    await melodixPlayer.playTrack(audiusTrack('a1'));
    await flush();

    expect(fake.port.attempt).not.toHaveBeenCalled();
    expect(fake.port.setViewVisible).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('avance AUTOMATIQUE sur piste Spotify → tentative Spotify Web (vue rouverte si masquée)', async () => {
    // Le 1er morceau est confirmé via Spotify Web.
    fake.port.attempt.mockImplementation(async (input) => {
      fake.publish({
        status: 'playing',
        trackId: input.track.trackId,
        durationMillis: 200_000,
      });
      return {
        status: 'confirmed',
        trackId: input.track.trackId,
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');

    // La vue est masquée (l'utilisateur l'a fermée) — l'avance automatique
    // doit MAINTENANT tenter Spotify Web (seule source, Mission v7) en
    // rouvrant la vue : plus de « pas de tentative sans vue visible ».
    fake.port.setViewVisible.mockClear();
    fake.port.attempt.mockClear();
    fake.port.isViewVisible.mockReturnValue(false);

    // Fin RÉELLE publiée par la page → avance auto.
    fake.publish({
      status: 'ended',
      trackId: 'a',
      positionMillis: 200_000,
      durationMillis: 200_000,
    });
    await flush();

    expect(fake.port.setViewVisible).toHaveBeenCalledWith(true);
    expect(fake.port.attempt).toHaveBeenCalledTimes(1);
    expect(fake.port.attempt).toHaveBeenCalledWith(
      expect.objectContaining({ trackKey: 'spotify:b' })
    );
    expect(melodixPlayer.getState().index).toBe(1);
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');
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
    // Chaque tentative est confirmée pour LA PISTE TENTÉE (identité réelle).
    fake.port.attempt.mockImplementation(async (input) => {
      fake.publish({
        status: 'playing',
        trackId: input.track.trackId,
        durationMillis: 200_000,
      });
      return {
        status: 'confirmed',
        trackId: input.track.trackId,
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
    // Mission v7 : le morceau suivant (Spotify) est tenté sur Spotify Web
    // (seule source) — jamais de cascade Audius.
    expect(fake.port.attempt).toHaveBeenCalledTimes(1);
    expect(fake.port.attempt).toHaveBeenCalledWith(
      expect.objectContaining({ trackKey: 'spotify:b' })
    );
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');
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

  it('erreur publiée (pont mort) → piste en échec, avance sur Spotify Web', async () => {
    fake.port.attempt.mockImplementation(async (input) => {
      fake.publish({
        status: 'playing',
        trackId: input.track.trackId,
        durationMillis: 100_000,
      });
      return {
        status: 'confirmed',
        trackId: input.track.trackId,
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a'), spotifyTrack('b')], 0);
    await flush();

    fake.port.attempt.mockClear();
    fake.publish({
      status: 'error',
      trackId: 'a',
      errorCode: 'renderer_destroyed',
    });
    await flush();

    // Mission v7 : l'avancement retente la suite sur Spotify Web (seule
    // source) — jamais de cascade Audius.
    expect(melodixPlayer.getState().index).toBe(1);
    expect(fake.port.attempt).toHaveBeenCalledTimes(1);
    expect(fake.port.attempt).toHaveBeenCalledWith(
      expect.objectContaining({ trackKey: 'spotify:b' })
    );
    expect(melodixPlayer.getState().resolved?.provider).toBe('Spotify Web');
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

  it('reprise tapée (play sur piste pausée) → commande port, vue ouverte', async () => {
    fake.port.attempt.mockImplementation(async () => {
      fake.publish({ status: 'playing', trackId: 'a' });
      return {
        status: 'confirmed',
        trackId: 'a',
        plan: { kind: 'ready' } as never,
        confirmedAtMillis: Date.now(),
      };
    });
    await melodixPlayer.playQueue([spotifyTrack('a')], 0);
    await flush();
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(fake.port.setViewVisible).toHaveBeenCalledWith(true);
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

  it('sans port attaché (défaut) → VRAIE erreur Spotify Web, pas de cascade', async () => {
    melodixPlayer.attachSpotifyWebSource(null);

    const seenStatuses: string[] = [];
    const unsubscribe = melodixPlayer.subscribe((s) => {
      seenStatuses.push(s.status);
    });
    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();
    unsubscribe();

    const state = melodixPlayer.getState();
    expect(seenStatuses).toContain('error');
    expect(state.notice?.code).toBe('spotify-web-port-missing');
    expect(state.resolved).toBeNull();
    expect(provider.resolveMatch).not.toHaveBeenCalled();
    expect(mockCreatedSounds).toHaveLength(0);
  });
});

/**
 * V17 — Miroir logcat de la chaîne [MelodixSpotifyWeb].
 *
 * La smoke CI sur émulateur (APK release, sans run-as) ne peut lire que le
 * logcat. L'INVARIAnte de mission : `playback-confirmed` est la SEULE ligne
 * qui accompagne un `playing` moteur, et elle n'existe qu'après une
 * confirmation RÉELLE de la page. Sans compte Spotify (CI), elle ne doit
 * jamais apparaître ; un verdict non confirmé produit au contraire une
 * ligne `playback-error code=<code contrôlé>`. On teste le MOTEUR ici :
 * la vue (montage/handshake/bridge-state) est couverte dans
 * SpotifyWebHostView.unit.test.tsx.
 */
describe('melodixPlayer — V17 : miroir logcat [MelodixSpotifyWeb]', () => {
  let logSpy: jest.SpyInstance;

  const webLogLines = (): string[] =>
    logSpy.mock.calls
      .map((c) => (typeof c[0] === 'string' ? c[0] : ''))
      .filter((l) => l.startsWith('[MelodixSpotifyWeb]'));

  beforeEach(async () => {
    await AsyncStorage.clear();
    mockCreatedSounds = [];
    __testSetAudioProviders({});
    await melodixPlayer.__testReset();
    logSpy = jest.spyOn(console, 'log').mockImplementation(() => {});
  });

  afterEach(async () => {
    logSpy.mockRestore();
    melodixPlayer.attachSpotifyWebSource(null);
    await melodixPlayer.__testReset();
  });

  it('confirmation RÉELLE → exactement une ligne « playback-confirmed » (et un `playing` moteur)', async () => {
    const fake = makeFakePort();
    melodixPlayer.attachSpotifyWebSource(fake.port);
    fake.port.attempt.mockResolvedValue({
      status: 'confirmed',
      trackId: 'abc',
      plan: { kind: 'ready' } as never,
      confirmedAtMillis: Date.now(),
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    expect(webLogLines()).toEqual(['[MelodixSpotifyWeb] playback-confirmed']);
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('verdict NON confirmé → « playback-error code=… », JAMAIS « playback-confirmed »', async () => {
    const fake = makeFakePort();
    melodixPlayer.attachSpotifyWebSource(fake.port);
    fake.port.attempt.mockResolvedValue({
      status: 'failed',
      code: 'confirmation-timeout',
      attempts: [],
    });

    await melodixPlayer.playTrack(spotifyTrack('abc'));
    await flush();

    // Une seule ligne miroir, avec le code contrôlé du verdict.
    expect(webLogLines()).toEqual([
      '[MelodixSpotifyWeb] playback-error code=confirmation-timeout',
    ]);
    // Le moteur n'émet PAS `playing` sur une non-confirmation.
    expect(melodixPlayer.getState().status).not.toBe('playing');
    expect(melodixPlayer.getState().resolved).toBeNull();
  });
});
