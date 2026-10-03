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
const mockAppendDiagLog = jest.fn();
const mockRequestNotificationPermission = jest.fn<boolean | null, []>(
  () => null
);
let commandListener: ((command: unknown) => void) | null = null;

jest.mock('../../modules/melodix-media', () => ({
  updateSession: (...args: never[]) => mockUpdateSession(...args),
  stopSession: () => mockStopSession(),
  appendDiagLog: (line: string) => mockAppendDiagLog(line),
  isMelodixMediaAvailable: () => true,
  requestMediaNotificationPermission: () => mockRequestNotificationPermission(),
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
            // Contrat expo-av réel : les commandes rendent le statut natif.
            // Le bridge ne doit jamais dépendre d'un état inventé par le test.
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
            unloadAsync: jest.fn(async () => {}),
            setPositionAsync: jest.fn(async () => {}),
            setVolumeAsync: jest.fn(async () => {}),
          };

          return {
            sound,
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

/**
 * Phase 5C : état morceau « chargé en données sensibles » — l'objet SOURCE
 * transporte volontairement une URL de flux + des tokens (comme peuvent le
 * faire les providers audio). La projection ne doit JAMAIS les laisser
 * passer : le module natif/la notification ne connaissent que l'affichage.
 */
const payloadLongSensible = (): Partial<PlayerState>[] => [
  {
    current: {
      id: 'spotify:sensible',
      title: 'Vault',
      artists: ['Trio'],
      album: 'Vox',
      durationMillis: 180_000,
      imageURL: 'https://img/cover.jpg',
      source: spotifyTrackSource('sensible'),
      // Champs parasites : flux + tokens qui DOIVENT rester hors projection.
      streamUrl: 'https://stream/vault?token=abc',
      youtubeUri: 'https://youtube/watch?v=dQw4w9WgXcQ',
      accessToken: 'Bearer client_secret_000',
      audiusUrl: 'https://audius.co/stream/vault',
    } as unknown as PlayerState['current'],
    status: 'playing',
    durationMillis: 180_000,
    positionMillis: 12_000,
  },
];

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

  it('restauration asynchrone du réglage : projette immédiatement une lecture déjà active', async () => {
    setMediaBridgeEnabled(false);
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();
    expect(mockUpdateSession).not.toHaveBeenCalled();

    setMediaBridgeEnabled(true);

    expect(mockUpdateSession).toHaveBeenCalledWith(
      expect.objectContaining({ title: 'Photo', isPlaying: true })
    );
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

  it('une pochette ou un album corrigé invalide la signature native', async () => {
    await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
    await flush();
    mockUpdateSession.mockClear();

    const current = melodixPlayer.getState().current;
    expect(current).not.toBeNull();
    if (current) {
      current.imageURL = 'https://img/corrected.jpg';
      current.album = 'Corrected album';
    }
    await melodixPlayer.seekTo(0); // émission même état/seconde, métadonnées neuves

    expect(mockUpdateSession).toHaveBeenCalledTimes(1);
    expect(mockUpdateSession).toHaveBeenLastCalledWith(
      expect.objectContaining({
        artworkUrl: 'https://img/corrected.jpg',
        album: 'Corrected album',
      })
    );
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

  it('builder pur : NaN ne traverse jamais vers MediaSession', () => {
    const payload = buildMediaSessionPayload({
      ...melodixPlayer.getState(),
      current: {
        ...morceau('x', 'Valeurs transitoires'),
        durationMillis: Number.NaN,
      },
      status: 'playing',
      durationMillis: Number.NaN,
      positionMillis: Number.NaN,
    });

    expect(payload).toMatchObject({
      durationMillis: 0,
      positionMillis: 0,
      isPlaying: true,
    });
  });

  it('builder pur : position infinie ou au-delà de la durée est bornée', () => {
    const base = {
      ...melodixPlayer.getState(),
      current: morceau('x', 'Bornes'),
      status: 'playing' as const,
      durationMillis: 180_000,
    };

    expect(
      buildMediaSessionPayload({
        ...base,
        positionMillis: Number.POSITIVE_INFINITY,
      })
    ).toMatchObject({ positionMillis: 0, durationMillis: 180_000 });
    expect(
      buildMediaSessionPayload({ ...base, positionMillis: 250_000 })
    ).toMatchObject({ positionMillis: 180_000, durationMillis: 180_000 });
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
    it('SCÉNARIO §5 complet : play→pause→play→next→previous→seek→stop, chaque projection vérifiée', async () => {
      mockUpdateSession.mockClear();

      await melodixPlayer.playQueue(
        [morceau('a', 'Photo'), morceau('b', 'Again')],
        0
      );
      await flush();

      const payloads = (): Record<string, unknown>[] =>
        mockUpdateSession.mock.calls.map(
          (call) => call[0] as Record<string, unknown>
        );

      // PLAY : première projection active (isPlaying=true, morceau 'a').
      expect(mockUpdateSession).toHaveBeenCalledTimes(1);
      expect(payloads().at(-1)).toMatchObject({
        isPlaying: true,
        trackId: 'spotify:a',
      });

      // PAUSE système → moteur pausé → projection isPlaying=false.
      commandListener?.({ command: 'pause' });
      await flush();
      expect(payloads().at(-1)).toMatchObject({
        isPlaying: false,
        trackId: 'spotify:a',
      });

      // REPRISE système → projection isPlaying=true du même morceau.
      commandListener?.({ command: 'play' });
      await flush();
      expect(payloads().at(-1)).toMatchObject({
        isPlaying: true,
        trackId: 'spotify:a',
      });

      // NEXT système → morceau 'b' projeté (nouvelle métadonnée).
      commandListener?.({ command: 'next' });
      await flush();
      expect(payloads().at(-1)).toMatchObject({
        trackId: 'spotify:b',
        isPlaying: true,
      });

      // PREVIOUS à > 3 s? position 0 → moteur recule vers 'a'.
      commandListener?.({ command: 'previous' });
      await flush();
      expect(payloads().at(-1)).toMatchObject({
        trackId: 'spotify:a',
        isPlaying: true,
      });

      // SEEK système → moteur consulte la MÊME méthode seekTo, projection bornée.
      commandListener?.({ command: 'seek', positionMillis: 30_000 });
      await flush();
      expect(
        (payloads().at(-1)?.positionMillis as number) ?? -1
      ).toBeGreaterThanOrEqual(0);

      // STOP système → moteur arrêté → session native FERMÉE (stopSession).
      commandListener?.({ command: 'stop' });
      await flush();
      expect(mockStopSession).toHaveBeenCalled();
      expect(melodixPlayer.getState().status).not.toBe('playing');
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
    it('zéro boucle commande → état → commande (§7) : aucune oscillation', async () => {
      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      const toggleSpy = jest.spyOn(melodixPlayer, 'togglePlayPause');

      // Android PAUSE → JS pause → projection isPlaying=false : la projection
      // ne re-déclenche JAMAIS une commande ni côté natif ni côté moteur.
      commandListener?.({ command: 'pause' });
      await flush();
      await flush();
      expect(toggleSpy).toHaveBeenCalledTimes(1);
      const pushesApresPause = mockUpdateSession.mock.calls.length;
      await flush();
      expect(toggleSpy).toHaveBeenCalledTimes(1); // aucune réexécution
      expect(mockUpdateSession.mock.calls.length).toBe(pushesApresPause);
      expect(
        (mockUpdateSession.mock.calls.at(-1)?.[0] as { isPlaying: boolean })
          .isPlaying
      ).toBe(false);

      // Android PLAY (reprise) → exactement UNE exécution, aucune oscillation.
      commandListener?.({ command: 'play' });
      await flush();
      await flush();
      expect(toggleSpy).toHaveBeenCalledTimes(2);
      await flush();
      expect(toggleSpy).toHaveBeenCalledTimes(2);
      expect(melodixPlayer.getState().status).toBe('playing');
    });

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

      // `next` sur une file d'un seul titre termine désormais correctement la
      // session quand repeat=off. Relancer côté moteur prouve que le handler
      // direct fonctionne encore, sans réabonner le bridge démonté.
      await melodixPlayer.playQueue([morceau('b', 'Grateful')], 0);
      await flush();
      const toggleSpy = jest.spyOn(melodixPlayer, 'togglePlayPause');
      handleMediaCommand({ command: 'pause' }); // handler direct : moteur ok
      expect(toggleSpy).toHaveBeenCalledTimes(1);
      expect(mockUpdateSession).not.toHaveBeenCalled();
    });
  });

  describe("sécurité payload (phase 5C) — la notification ne voit que l'affichage", () => {
    it('clés EXACTES : uniquement les 8 champs de projection, zéro clé sensible', () => {
      payloadLongSensible().forEach((etat) => {
        const payload = buildMediaSessionPayload(etat as PlayerState);

        expect(payload).not.toBeNull();
        expect(Object.keys(payload!).sort()).toEqual([
          'album',
          'artist',
          'artworkUrl',
          'durationMillis',
          'isPlaying',
          'positionMillis',
          'title',
          'trackId',
        ]);
      });
    });

    it('scan sous-chaînes : jamais de tokens/secret ni URL de flux Audius/YouTube', () => {
      const payload = buildMediaSessionPayload(
        payloadLongSensible()[0] as PlayerState
      )!;
      const serialized = JSON.stringify(payload).toLowerCase();

      // Même si l'objet source TRANSPORTE ces valeurs, elles ne doivent en
      // aucun cas fuiter dans la projection vers la notification (§5/6 5C).
      [
        'stream',
        'token',
        'secret',
        'client_secret',
        'access_token',
        'bearer',
        'audius',
        'youtube',
      ].forEach((aiguille) => expect(serialized).not.toContain(aiguille));
    });

    it('Android 13+ : demande la visibilité notification une seule fois à la première lecture', async () => {
      mockRequestNotificationPermission.mockClear();
      mockRequestNotificationPermission.mockReturnValue(false);

      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();
      await melodixPlayer.stop();
      await flush();
      await melodixPlayer.playQueue([morceau('b', 'Again')], 0);
      await flush();

      expect(mockRequestNotificationPermission).toHaveBeenCalledTimes(1);
      expect(melodixPlayer.getState().status).toBe('playing');
    });

    it('5C.2 : service natif KO → projection tolérée, lecture audio PRESERVÉE', async () => {
      // Simulation du crash potentiel ciblé par 5C.2 : le natif jette.
      mockUpdateSession.mockImplementationOnce(() => {
        throw new Error('native session boom');
      });

      await melodixPlayer.playQueue([morceau('a', 'Photo')], 0);
      await flush();

      // Le moteur tourne indifféremment : MediaSession = couche OPTIONNELLE.
      expect(melodixPlayer.getState().status).toBe('playing');

      mockUpdateSession.mockReset();
    });

    it('changement de morceau : la NOUVELLE pochette est projetée à la MediaSession', async () => {
      await melodixPlayer.playQueue(
        [morceau('a', 'Photo'), morceau('b', 'Again')],
        0
      );
      await flush();

      const avecA = {
        ...morceau('b', 'Again', ['Autre']),
        imageURL: 'https://img/nouvelle.png',
      };
      await melodixPlayer.playQueue([avecA], 0);
      await flush();

      const dernier = mockUpdateSession.mock.calls.at(-1)?.[0] as {
        artworkUrl: string | null;
        title: string;
      };

      expect(dernier.title).toBe('Again');
      expect(dernier.artworkUrl).toBe('https://img/nouvelle.png');
    });
  });
});
