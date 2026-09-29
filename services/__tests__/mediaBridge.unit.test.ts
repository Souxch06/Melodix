/**
 * mediaBridge (phase 5A) — pont moteur ↔ MediaSession Android.
 *
 * Couverture exigée par le cahier (§11) :
 *  Projection : métadonnées exactes (titre/artistes/album/pochette/durée/
 *    position/etat) ; activée/désactivée par le réglage ; dédupliquée.
 *  Commandes : play/pause SÉCURISÉES par état, next, previous, seek, stop.
 *  Anti-autoplay : AUCUNE projection/service au boot ni sur session dormante.
 *  Résilience : module natif absent/jetant → le player ne crashe jamais.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';

import type { AudioProvider } from '../audio/types';
import { __testSetAudioProviders } from '../audio';
import {
  buildMediaSessionPayload,
  handleMediaCommand,
  initMediaBridge,
  setMediaBridgeEnabled,
  teardownMediaBridge,
} from '../mediaBridge';
import { melodixPlayer, spotifyTrackSource } from '../player';
import type { PlayerState, PlayerTrack } from '../player';
import { PLAYBACK_SESSION_VERSION } from '../playbackSession';
import type { PlaybackSession } from '../playbackSession';

// Le module natif local est mocké : le bridge parle à CES mocks.
const mockUpdateSession = jest.fn();
const mockStopSession = jest.fn();
let commandListener: ((command: unknown) => void) | null = null;

jest.mock('../../modules/melodix-media', () => ({
  updateSession: (...args: never[]) => mockUpdateSession(...args),
  stopSession: () => mockStopSession(),
  isMelodixMediaAvailable: () => true,
  addMediaCommandListener: (listener: (command: unknown) => void) => {
    commandListener = listener;

    return jest.fn();
  },
}));

jest.mock('expo-av', () => ({
  __esModule: true,
  Audio: {
    setAudioModeAsync: jest.fn(async () => {}),
    Sound: {
      createAsync: jest.fn(
        async (
          _source: { uri: string },
          _initial: Record<string, unknown>,
          onStatus?: (status: Record<string, unknown>) => void
        ) => {
          void onStatus;
          const sound = {
            playAsync: jest.fn(async () => {}),
            pauseAsync: jest.fn(async () => {}),
            unloadAsync: jest.fn(async () => {}),
            setPositionAsync: jest.fn(async () => {}),
            setVolumeAsync: jest.fn(async () => {}),
          };

          return { sound };
        }
      ),
    },
  },
}));

const makeProvider = (): AudioProvider => ({
  id: 'audius',
  displayName: 'Audius',
  matches: jest.fn(async () => []),
  resolveMatch: jest.fn(async () => ({ sourceId: 'aud-x', score: 0.9 })),
  resolveSource: jest.fn(async () => ({ uri: 'https://stream/aud-x' })),
});

const morceau = (
  id: string,
  titre: string,
  artistes = ['Neffex', 'Grimm']
) => ({
  id: `spotify:${id}`,
  title: titre,
  artists: artistes,
  album: 'Good',
  durationMillis: 200_000,
  imageURL: 'https://img/p.jpg',
  source: spotifyTrackSource(id),
});

const flush = () => new Promise((resolve) => setTimeout(resolve, 0));

describe('mediaBridge — projection MediaSession (phase 5A)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    jest.clearAllMocks();
    commandListener = null;
    teardownMediaBridge();
    __testSetAudioProviders({ audius: makeProvider() });
    await melodixPlayer.__testReset();
    setMediaBridgeEnabled(true);
    initMediaBridge();
  });

  afterEach(() => {
    teardownMediaBridge();
  });

  it('ANTI-AUTOPLAY : au boot, sans aucune lecture — AUCUNE projection, AUCUN service', () => {
    // Session persistée au boot (Phase 2) : le bridge doit rester muet.
    expect(mockUpdateSession).not.toHaveBeenCalled();
    expect(mockStopSession).not.toHaveBeenCalled();
  });

  it('réglage DÉSACTIVÉ : jouer un morceau ne projette rien vers le natif', async () => {
    setMediaBridgeEnabled(false);

    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();

    expect(mockUpdateSession).not.toHaveBeenCalled();
    expect(mockStopSession).not.toHaveBeenCalled();
  });

  it('lecture : projection EXACTE (titre, artistes joints, album, pochette, durée, position)', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();

    expect(mockUpdateSession).toHaveBeenCalledWith(
      expect.objectContaining({
        trackId: 'spotify:a',
        title: 'Photo',
        artist: 'Neffex, Grimm',
        album: 'Good',
        artworkUrl: 'https://img/p.jpg',
        positionMillis: 0,
        isPlaying: true,
      })
    );
    // AUCUNE URL de flux dans la projection (contrat §5: jamais l'audio).
    const payload = mockUpdateSession.mock.calls[0][0] as Record<
      string,
      unknown
    >;

    expect(JSON.stringify(Object.keys(payload))).not.toContain('uri');
    expect(JSON.stringify(payload)).not.toContain('https://stream');
  });

  it('durée : métadonnée du morceau quand la durée réelle n est pas encore connue', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();

    const payload = mockUpdateSession.mock.calls[0][0] as {
      durationMillis: number;
    };

    expect(payload.durationMillis).toBe(200_000);
  });

  it('pause : projection isPlaying=false relayée', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();
    await melodixPlayer.togglePlayPause(); // pause

    const etats = mockUpdateSession.mock.calls.map(
      (call) => (call[0] as { isPlaying: boolean }).isPlaying
    );

    expect(etats).toContain(true);
    expect(etats[etats.length - 1]).toBe(false);

    await melodixPlayer.togglePlayPause(); // reprise
    const dernier = mockUpdateSession.mock.calls.at(-1)?.[0] as {
      isPlaying: boolean;
    };

    expect(dernier.isPlaying).toBe(true);
  });

  it('déduplication : deux états identiques (même seconde) = UNE projection', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();

    mockUpdateSession.mockClear();
    await melodixPlayer.seekTo(0); // position inchangée (même seconde)
    await melodixPlayer.seekTo(400); // même seconde arrondie

    expect(mockUpdateSession).not.toHaveBeenCalled();

    await melodixPlayer.seekTo(65_000); // seconde arrondie différente
    expect(mockUpdateSession).toHaveBeenCalledTimes(1);
    expect(
      (mockUpdateSession.mock.calls[0][0] as { positionMillis: number })
        .positionMillis
    ).toBe(65_000);
  });

  it('changement de morceau : nouvelle projection (nouvelle signature)', async () => {
    await melodixPlayer.playQueue(
      [morceau('a', 'Photo'), morceau('b', 'Again')],
      0
    );
    await flush();
    const apresA = mockUpdateSession.mock.calls.length;

    await melodixPlayer.next();
    await flush();

    expect(mockUpdateSession.mock.calls.length).toBeGreaterThan(apresA);
    const dernier = mockUpdateSession.mock.calls.at(-1)?.[0] as {
      title: string;
      trackId: string;
    };

    expect(dernier.title).toBe('Again');
    expect(dernier.trackId).toBe('spotify:b');
  });

  it('stop moteur explicite : fermeture de la session native (une seule fois)', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();

    await melodixPlayer.stop();

    expect(mockStopSession).toHaveBeenCalledTimes(1);

    // Un second état idle n appelle pas une 2e fermeture (pas activée).
    await melodixPlayer.stop();
    expect(mockStopSession).toHaveBeenCalledTimes(1);
  });

  it('réactivation du réglage APRÈS lecture : la projection reprend au prochain état', async () => {
    setMediaBridgeEnabled(false);
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();
    expect(mockUpdateSession).not.toHaveBeenCalled();

    setMediaBridgeEnabled(true);
    await melodixPlayer.seekTo(10_000); // nouvel état → projection
    expect(mockUpdateSession).toHaveBeenCalled();
  });

  it('désactivation PENDANT une lecture : fermeture native immédiate', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();

    setMediaBridgeEnabled(false);
    expect(mockStopSession).toHaveBeenCalledTimes(1);
  });

  it('builder pur : album/artwork absents → null, position jamais négative', () => {
    const payload = buildMediaSessionPayload({
      ...melodixPlayer.getState(),
      current: { ...morceau('x', 'Sans album'), album: null, imageURL: '' },
      status: 'paused',
      durationMillis: 0,
      positionMillis: 0,
    });

    expect(payload).toEqual({
      trackId: 'spotify:x',
      title: 'Sans album',
      artist: 'Neffex, Grimm',
      album: null,
      artworkUrl: null,
      durationMillis: 200_000,
      positionMillis: 0,
      isPlaying: false,
    });
  });

  describe('commandes système → moteur (jamais de toggle perdu)', () => {
    it('PLAY quand paused → lecture ; PLAY quand playing → AUCUN toggle', async () => {
      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      const toggleSpy = jest.spyOn(melodixPlayer, 'togglePlayPause');

      commandListener?.({ command: 'play' }); // déjà en lecture
      expect(toggleSpy).not.toHaveBeenCalled();

      await melodixPlayer.togglePlayPause(); // mise en pause (compte 1)
      toggleSpy.mockClear();
      commandListener?.({ command: 'play' }); // PLAY système → lecture
      expect(toggleSpy).toHaveBeenCalledTimes(1);
    });

    it('PAUSE quand playing → pause ; PAUSE quand paused → RIEN', async () => {
      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      const toggleSpy = jest.spyOn(melodixPlayer, 'togglePlayPause');

      commandListener?.({ command: 'pause' });
      expect(toggleSpy).toHaveBeenCalledTimes(1);
      await flush(); // togglePlayPause est asynchrone
      expect(melodixPlayer.getState().status).toBe('paused');

      toggleSpy.mockClear();
      commandListener?.({ command: 'pause' }); // déjà en pause
      expect(toggleSpy).not.toHaveBeenCalled();
    });

    it('NEXT / PREVIOUS / SEEK / STOP relèvent les mêmes méthodes moteur', async () => {
      await melodixPlayer.playQueue(
        [morceau('a', 'Photo'), morceau('b', 'Again')],
        0
      );
      await flush();

      const nextSpy = jest.spyOn(melodixPlayer, 'next');
      const previousSpy = jest.spyOn(melodixPlayer, 'previous');
      const seekSpy = jest.spyOn(melodixPlayer, 'seekTo');
      const stopSpy = jest.spyOn(melodixPlayer, 'stop');

      commandListener?.({ command: 'next' });
      commandListener?.({ command: 'previous' });
      commandListener?.({ command: 'seek', positionMillis: 42_000 });
      commandListener?.({ command: 'stop' });

      expect(nextSpy).toHaveBeenCalledTimes(1);
      expect(previousSpy).toHaveBeenCalledTimes(1);
      expect(seekSpy).toHaveBeenCalledWith(42_000);
      expect(stopSpy).toHaveBeenCalledTimes(1);
    });
  });

  describe('anti-autoplay VERROUILLÉ (durcissement du contrat §9)', () => {
    /** Émet directement un état moteur : émission HYPOTHÉTIQUE qu'un futur
     * chemin de restauration automatique produirait — le verrou doit tenir
     * quelle que soit la source de l'émission. */
    const emitEngineState = (partial: Partial<PlayerState>): void => {
      (
        melodixPlayer as unknown as {
          emit: (next: Partial<PlayerState>) => void;
        }
      ).emit(partial);
    };

    const etatRestaure = (
      track: PlayerTrack,
      status: PlayerState['status']
    ): Partial<PlayerState> => ({
      queue: [track],
      index: 0,
      current: track,
      status,
      positionMillis: 12_345,
      durationMillis: 0,
      resolved: null,
    });

    it('PAUSED avec morceau au boot (restauration automatique) → JAMAIS updateSession/stopSession', () => {
      expect(melodixPlayer.getState().status).toBe('idle'); // boot propre

      emitEngineState(etatRestaure(morceau('r', 'Fantôme'), 'paused'));

      expect(melodixPlayer.getState().current).not.toBeNull();
      expect(melodixPlayer.getState().status).toBe('paused');
      expect(mockUpdateSession).not.toHaveBeenCalled();
      expect(mockStopSession).not.toHaveBeenCalled();

      // Un retour à idle depuis cet état DORMANT ne sollicite rien non plus.
      emitEngineState({ current: null, status: 'idle' });
      expect(mockUpdateSession).not.toHaveBeenCalled();
      expect(mockStopSession).not.toHaveBeenCalled();
    });

    it('états transitoires IDLE/LOADING avec morceau (avant le premier son) → AUCUNE projection', () => {
      emitEngineState(etatRestaure(morceau('r', 'Fantôme'), 'idle'));
      emitEngineState(etatRestaure(morceau('r', 'Fantôme'), 'loading'));

      expect(mockUpdateSession).not.toHaveBeenCalled();
      expect(mockStopSession).not.toHaveBeenCalled();
    });

    it('resumeSession() explicite (restoreSession moteur) → la lecture RÉELLE active MediaSession', async () => {
      const session: PlaybackSession = {
        version: PLAYBACK_SESSION_VERSION,
        savedAt: Date.now(),
        queue: [morceau('r', 'Retour'), morceau('s', 'Suite')],
        index: 1,
        positionMillis: 30_000,
        shuffle: false,
        repeat: 'off',
        volume: 1,
      };

      await melodixPlayer.restoreSession(session);
      await flush();
      await flush();

      expect(melodixPlayer.getState().status).toBe('playing');
      expect(mockUpdateSession).toHaveBeenCalled();

      // L'activation n'a eu lieu QUE sur le statut 'playing' du moteur :
      // la TOUTE PREMIÈRE projection est isPlaying=true — les états
      // transitoires 'idle'/'loading' de restoreSession n'ont rien poussé.
      const premier = mockUpdateSession.mock.calls[0][0] as {
        trackId: string;
        isPlaying: boolean;
      };

      expect(premier.trackId).toBe('spotify:s'); // index restauré
      expect(premier.isPlaying).toBe(true);
    });

    it('PLAYING → PAUSED → projection autorisée ; STOP depuis la pause → stopSession', async () => {
      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      expect(mockUpdateSession).toHaveBeenCalled();

      await melodixPlayer.togglePlayPause(); // PAUSE après une vraie lecture
      expect(melodixPlayer.getState().status).toBe('paused');
      const dernier = mockUpdateSession.mock.calls.at(-1)?.[0] as {
        isPlaying: boolean;
      };

      expect(dernier.isPlaying).toBe(false); // la pause projette normalement

      mockStopSession.mockClear();
      await melodixPlayer.stop();
      expect(mockStopSession).toHaveBeenCalledTimes(1);
    });

    it('commandes PLAY/PAUSE inchangées : PLAY quand paused (post-lecture) relance ET projette', async () => {
      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      await melodixPlayer.togglePlayPause(); // pause (session activée)
      mockUpdateSession.mockClear();

      commandListener?.({ command: 'play' }); // PLAY système
      await flush();

      expect(melodixPlayer.getState().status).toBe('playing');
      expect(mockUpdateSession).toHaveBeenCalled();
      const dernier = mockUpdateSession.mock.calls.at(-1)?.[0] as {
        isPlaying: boolean;
      };

      expect(dernier.isPlaying).toBe(true);
    });
  });

  describe('résilience (§11)', () => {
    it('updateSession lève : la lecture ne crashe JAMAIS (erreur aval)', async () => {
      mockUpdateSession.mockImplementationOnce(() => {
        throw new Error('native boom');
      });

      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();

      expect(melodixPlayer.getState().status).toBe('playing');
    });

    it('teardown : plus aucune projection ni commande après démontage', async () => {
      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      mockUpdateSession.mockClear();

      teardownMediaBridge();
      await melodixPlayer.next();
      await flush();

      expect(mockUpdateSession).not.toHaveBeenCalled();

      const toggleSpy = jest.spyOn(melodixPlayer, 'togglePlayPause');
      handleMediaCommand({ command: 'pause' }); // handler direct : moteur ok
      expect(toggleSpy).toHaveBeenCalledTimes(1);
    });
  });
});
