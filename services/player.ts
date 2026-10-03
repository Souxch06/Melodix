import AsyncStorage from '@react-native-async-storage/async-storage';
import { AppState } from 'react-native';

import { appendDiagLog } from '../modules/melodix-media';

import {
  DEFAULT_AUDIO_PROVIDER_ID,
  getAudioProvider,
  getAudioProviders,
  MATCH_CACHE_STORAGE_KEY,
  resolveWithProviders,
} from './audio';
import type { AudioProvider, ResolvedStream, TrackSource } from './audio';
import { recordPlay } from './history/playHistory';
import {
  createMatchResolutionTimestamp,
  loadMatchCache,
  persistMatchCache,
  writeMatchCacheEntry,
} from './audio/matchCache';
import type { MatchCache } from './audio/matchCache';
import {
  clearPlaybackSession,
  PLAYBACK_SESSION_VERSION,
  savePlaybackSession,
  windowQueueForSession,
} from './playbackSession';
import type { PlaybackSession } from './playbackSession';
import { sanitizeErrorForLog } from './logSanitize';

/**
 * Melodix player engine.
 *
 * Queues mixes tracks from different sources: a track described by Spotify
 * metadata carries `{ provider: null }` and is MATCHED by the cascade —
 * Audius d'abord, YouTube en fallback (services/audio/trackResolver.ts) —
 * then streamed via the matched provider; a track already attached to a
 * provider id ('audius:xyz' / 'youtube:abc') is streamed directly by that
 * provider. When a track has no reliable match — or its stream fails — the
 * player reports a notice, marks the track as failed for this session and
 * SKIPS to the next playable one. It never substitutes a wrong track.
 */

export type PlayerTrack = {
  /** Logical id for the UI ('spotify:<id>' / 'audius:<id>' keys the cache). */
  id: string;
  title: string;
  artists: string[];
  album?: string | null;
  durationMillis?: number | null;
  /** ISRC Spotify facultatif : signal fort pour la recherche/mise en relation. */
  isrc?: string | null;
  /** Album d'origine (I-8) quand l'écran le connaît — sert à l'historique. */
  albumId?: string | null;
  imageURL: string;
  source: TrackSource;
};

export type PlayerStatus =
  | 'idle'
  | 'loading'
  | 'playing'
  | 'paused'
  | 'error'
  | 'unavailable';

export type RepeatMode = 'off' | 'all' | 'one';

export type PlayerNotice = {
  kind: 'not-available' | 'play-failed';
  title: string;
};

export type ResolverInfo = {
  provider: string;
  sourceId: string;
  score: number;
};

type ResolvedPlayback = {
  provider: AudioProvider;
  resolved: ResolvedStream;
  info: ResolverInfo;
};

export type PlayerState = {
  queue: PlayerTrack[];
  index: number;
  order: number[] | null;
  orderPointer: number;
  current: PlayerTrack | null;
  status: PlayerStatus;
  positionMillis: number;
  durationMillis: number;
  /** Buffering runtime distinct de `loading`: le Sound existe et conserve
   * son intention play/pause pendant que le réseau se recharge. */
  buffering: boolean;
  shuffle: boolean;
  repeat: RepeatMode;
  volume: number;
  resolved: ResolverInfo | null;
  notice: PlayerNotice | null;
};

export type PlayerListener = (state: PlayerState) => void;

type AvPlaybackStatus = {
  isLoaded?: boolean;
  isPlaying?: boolean;
  isBuffering?: boolean;
  didJustFinish?: boolean;
  positionMillis?: number;
  durationMillis?: number | null;
  error?: string;
};

type AvSound = {
  unloadAsync: () => Promise<unknown>;
  playAsync: () => Promise<unknown>;
  pauseAsync: () => Promise<unknown>;
  setPositionAsync: (positionMillis: number) => Promise<unknown>;
  setVolumeAsync: (volume: number) => Promise<unknown>;
};

type ExpoAvModule = {
  Audio?: {
    setAudioModeAsync: (mode: Record<string, unknown>) => Promise<unknown>;
    Sound: {
      createAsync: (
        source: { uri: string },
        initialStatus: Record<string, unknown>,
        onPlaybackStatusUpdate?: (status: AvPlaybackStatus) => void
      ) => Promise<{ sound: AvSound }>;
    };
  };
};

export const INITIAL_PLAYER_STATE: PlayerState = {
  queue: [],
  index: -1,
  order: null,
  orderPointer: -1,
  current: null,
  status: 'idle',
  positionMillis: 0,
  durationMillis: 0,
  buffering: false,
  shuffle: false,
  repeat: 'off',
  volume: 1,
  resolved: null,
  notice: null,
};

const RESTART_THRESHOLD_MS = 3000;

// Fisher-Yates over [0..length), with `firstIndex` pinned at position 0.
const buildShuffledOrder = (length: number, firstIndex: number): number[] => {
  const rest = Array.from({ length }, (_, idx) => idx).filter(
    (idx) => idx !== firstIndex
  );

  for (let i = rest.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [rest[i], rest[j]] = [rest[j], rest[i]];
  }

  return [firstIndex, ...rest];
};

// UI-friendly constructors ---------------------------------------------------

/** A Spotify-source track in the queue (metadata-only, matched at play). */
export const spotifyTrackSource = (id: string): TrackSource => ({
  provider: null,
  id,
});

/** A native Audius-source track (already identified, no matching). */
export const audiusTrackSource = (id: string): TrackSource => ({
  provider: 'audius',
  id,
});

/**
 * Id logique de file d'attente pour un TrackModel.id : `audius:*` reste tel
 * quel (fournisseur natif), tout le reste est une métadonnée catalogue à
 * matcher (`spotify:`).
 */
export const queueIdForTrackId = (trackId: string): string =>
  trackId.startsWith('audius:') ? trackId : `spotify:${trackId}`;

/** Source de lecture associée (même règle que queueIdForTrackId). */
export const sourceForTrackId = (trackId: string): TrackSource =>
  trackId.startsWith('audius:')
    ? audiusTrackSource(trackId.slice('audius:'.length))
    : spotifyTrackSource(trackId);

class MelodixPlayer {
  private state: PlayerState = INITIAL_PLAYER_STATE;
  private listeners = new Set<PlayerListener>();
  private sound: AvSound | null = null;
  /** Tous les remplacements attendent la libération native précédente : mettre
   * `sound = null` avant `unloadAsync()` ne doit jamais permettre à un nouveau
   * Sound de démarrer pendant que l'ancien joue encore. */
  private unloadQueue: Promise<void> = Promise.resolve();
  private avModule: ExpoAvModule | null | undefined;
  private audioModeReady = false;
  /** Réglage « Lecture en arrière-plan » (paramètres) — défaut historique. */
  private staysActiveInBackground = true;
  private matchCache: MatchCache | null = null;
  /** Déduplique le chargement initial : deux play concurrents doivent partager
   * la même carte mémoire, sinon le dernier getItem peut oublier la décision
   * écrite par l'autre requête et refaire inutilement le matching. */
  private matchCacheLoad: Promise<MatchCache> | null = null;
  /** Deux commandes simultanées pour la même métadonnée partagent aussi la
   * résolution provider/URL, pas seulement le chargement du cache. */
  private resolutionLoads = new Map<string, Promise<ResolvedPlayback | null>>();
  private failedKeys = new Set<string>();
  /** Monceau actif actuel : tout resolve/chargement d'un token périmé est
   * ignoré et son éventuel Sound immédiatement déchargé (anti-double-lecture). */
  private playToken = 0;
  /** 5D : didJustFinish consommé UNE SEULE FOIS par session de lecture —
   * empêche la double transition « fin → next → next » si expo-av réémet
   * didJustFinish=true sur un nouveau tick du même vieux son pendant la
   * résolution du morceau suivant (field collant jusqu'à l'unload). */
  private lastFinishHandledForToken = -1;
  /** Une erreur de flux peut être réémise plusieurs fois par expo-av avant
   * l'unload. Une seule transition/avance est autorisée par Sound. */
  private lastFailureHandledForToken = -1;
  /** Seek à consommer au démarrage effectif du son visé UNIQUEMENT (jamais
   * appliqué à un autre morceau : tag d'identité — voir pendingSeekForId). */
  private pendingSeekMillis = 0;
  /** Morceau auquel le seek pendant est destiné (sans ce tag, un changement
   * de morceau AVANT l'arrivée du son faisait atterrir la cible de seek du
   * morceau A sur le morceau B). */
  private pendingSeekForId: string | null = null;
  /** Persistance session : dernière écriture + état déjà écrit (anti-spam). */
  private lastPersistedAt = 0;
  private sessionDirty = false;
  private appStateSubscribed = false;
  /** Diagnostic appareil : position au plus toutes les 10 s, jamais d'URL. */
  private lastPlaybackDiagAt = 0;
  /** Sérialise les commandes pause/reprise : un double geste pendant une
   * opération native lente doit finir dans l'état du DERNIER geste. */
  private transportQueue: Promise<void> = Promise.resolve();
  private transportIntent: boolean | null = null;
  private transportCommandToken = 0;

  getState = (): PlayerState => this.state;

  subscribe = (listener: PlayerListener): (() => void) => {
    this.listeners.add(listener);
    listener(this.state);

    return () => this.listeners.delete(listener);
  };

  private emit = (partial: Partial<PlayerState>) => {
    const next = { ...this.state, ...partial };

    // Frontière numérique unique : aucun callback natif, payload restauré ou
    // modèle distant malformé ne doit injecter NaN/Infinity/négatif dans
    // l'état partagé par React et MediaSession.
    next.durationMillis =
      Number.isFinite(next.durationMillis) && next.durationMillis >= 0
        ? next.durationMillis
        : this.state.durationMillis;
    next.positionMillis =
      Number.isFinite(next.positionMillis) && next.positionMillis >= 0
        ? next.positionMillis
        : this.state.positionMillis;
    if (next.durationMillis > 0) {
      next.positionMillis = Math.min(next.positionMillis, next.durationMillis);
    }
    next.volume = Number.isFinite(next.volume)
      ? Math.min(1, Math.max(0, next.volume))
      : this.state.volume;

    // `orderPointer` est exposé à React au même titre que queue/index. Le
    // recalculer à chaque mutation évite un pointeur resté à 0 après
    // next/remove/move en shuffle, même si les helpers moteur utilisent index.
    next.orderPointer =
      next.shuffle && next.order?.length === next.queue.length
        ? next.order.indexOf(next.index)
        : -1;
    this.state = next;
    this.listeners.forEach((listener) => listener(this.state));
  };

  // --- expo-av lifecycle ----------------------------------------------------

  private getAv = (): ExpoAvModule | null => {
    if (this.avModule !== undefined) {
      return this.avModule;
    }

    try {
      // Chargement paresseux intentionnel : expo-av est natif et indisponible
      // sous l'env de test — un import statique casserait les suites Jest.
      // eslint-disable-next-line @typescript-eslint/no-var-requires
      this.avModule = require('expo-av') as ExpoAvModule;
    } catch (error) {
      console.error('expo-av is unavailable:', error);
      this.avModule = null;
    }

    return this.avModule;
  };

  private ensureAudioMode = async () => {
    if (this.audioModeReady) {
      return;
    }

    const av = this.getAv();

    if (!av?.Audio) {
      throw new Error('expo-av Audio is unavailable');
    }

    await av.Audio.setAudioModeAsync({
      playsInSilentModeIOS: true,
      staysActiveInBackground: this.staysActiveInBackground,
      shouldDuckAndroid: true,
      playThroughEarpieceAndroid: false,
    });

    this.audioModeReady = true;
  };

  /**
   * Réglage « Lecture en arrière-plan » des paramètres. Additif : change le
   * mode audio expo-av et mémorise le choix pour les prochaines sessions de
   * lecture — sans toucher au pipeline de lecture. Si un son est en cours,
   * expo-av applique le nouveau mode immédiatement.
   */
  setStaysActiveInBackground = async (enabled: boolean): Promise<void> => {
    if (this.staysActiveInBackground === enabled) {
      return;
    }

    this.staysActiveInBackground = enabled;

    const av = this.getAv();
    if (!av?.Audio) {
      return; // module natif indisponible (tests) — choix mémorisé pour plus tard
    }

    try {
      await av.Audio.setAudioModeAsync({
        playsInSilentModeIOS: true,
        staysActiveInBackground: enabled,
        shouldDuckAndroid: true,
        playThroughEarpieceAndroid: false,
      });
    } catch (error) {
      console.warn('Failed to update the background audio mode:', error);
    }
  };

  private unloadCurrent = async () => {
    const sound = this.sound;
    this.sound = null;

    if (!sound) {
      await this.unloadQueue;
      return;
    }

    const operation = this.unloadQueue.then(async () => {
      try {
        await sound.unloadAsync();
      } catch (error) {
        console.warn('Failed to unload the previous sound:', error);
      }
    });
    // La chaîne ne rejette jamais (erreur déjà tolérée), ce qui garantit que
    // les unload suivants ne restent pas bloqués derrière une panne native.
    this.unloadQueue = operation;
    await operation;
  };

  /**
   * Handler AV scopé par token (5D) : tout status d'un Sound ORPHELIN
   * (token périmé — l'utilisateur est passé à un autre morceau) est ignoré.
   * Sans cette garde, le vieux son pouvait pousser position/fin après le
   * départ de l'utilisateur — et rejouer `advanceAuto` sur le mauvais index.
   */
  private makeStatusHandler = (token: number) => {
    return (status: AvPlaybackStatus) => {
      if (this.playToken !== token) {
        return; // son orphelin : émission parfaitement ignorée
      }
      // expo-av peut publier le statut initial AVANT que createAsync rende le
      // Sound. Ce callback ne doit pas faire passer `loading` à `playing` : le
      // garde post-create le prendrait alors pour une commande concurrente et
      // déchargerait le Sound valide comme s'il était orphelin.
      if (this.state.status === 'loading' && this.sound === null) {
        return;
      }

      this.onPlaybackStatusUpdate(token, status);
    };
  };

  private onPlaybackStatusUpdate = (
    token: number,
    status: AvPlaybackStatus
  ) => {
    if (status?.isLoaded === false) {
      if (
        status.error &&
        this.state.status === 'playing' &&
        this.lastFailureHandledForToken !== token
      ) {
        this.lastFailureHandledForToken = token;
        void this.handleStreamFailure('play-failed', token);
      }

      return;
    }

    // Certains callbacks expo-av (focus audio, buffering, fin) omettent la
    // position/durée ou publient momentanément NaN/0. Ne jamais effacer une
    // valeur fiable : mini-player, plein écran et MediaSession partagent cet
    // état. Un zéro de position reste valide hors buffering (seek/restart).
    const reportedPosition = status?.positionMillis;
    const validPosition =
      typeof reportedPosition === 'number' &&
      Number.isFinite(reportedPosition) &&
      reportedPosition >= 0 &&
      !(
        status.isBuffering === true &&
        reportedPosition === 0 &&
        this.state.positionMillis > 0
      );
    const reportedDuration = status?.durationMillis;
    const validDuration =
      typeof reportedDuration === 'number' &&
      Number.isFinite(reportedDuration) &&
      reportedDuration > 0;
    const playbackState: Partial<PlayerState> = {
      positionMillis: validPosition
        ? reportedPosition
        : this.state.positionMillis,
      durationMillis: validDuration
        ? reportedDuration
        : this.state.durationMillis,
      ...(typeof status.isBuffering === 'boolean'
        ? { buffering: status.isBuffering }
        : {}),
    };

    // Une interruption Audio Focus peut mettre le Sound en pause sans passer
    // par togglePlayPause(). Refléter l'état RÉEL évite une notification qui
    // resterait sur PLAYING. Le buffering et didJustFinish sont exclus : ils
    // ne constituent pas une pause utilisateur et la transition de fin gère
    // elle-même le prochain morceau.
    if (!status.didJustFinish && !status.isBuffering) {
      if (status.isPlaying === true) {
        playbackState.status = 'playing';
      } else if (
        status.isPlaying === false &&
        this.state.status === 'playing'
      ) {
        playbackState.status = 'paused';
      }
    }

    this.emit(playbackState);

    const now = Date.now();
    if (
      typeof status.isPlaying === 'boolean' &&
      (now - this.lastPlaybackDiagAt >= 10_000 || status.didJustFinish)
    ) {
      this.lastPlaybackDiagAt = now;
      appendDiagLog(
        `PLAYER_STATE state=${status.isPlaying ? 'PLAYING' : 'PAUSED'} ` +
          `positionMs=${playbackState.positionMillis ?? 0} ` +
          `durationMs=${playbackState.durationMillis ?? 0} ` +
          `buffering=${status.isBuffering === true} finished=${status.didJustFinish === true}`
      );
    }

    // Persistance SOBRE : au plus une écriture toutes les 8 s pendant la
    // lecture (jamais à chaque tick 500 ms) — la dernière position suffit.
    if (status?.isPlaying && Date.now() - this.lastPersistedAt > 8000) {
      this.sessionDirty = true;
      this.persistSession();
    }

    if (status?.didJustFinish) {
      // 5D : UNE SEULE avance par session de lecture. expo-av peut renvoyer
      // didJustFinish=true sur un tick ultérieur du même son (fin collée) ;
      // sans garde, cela déclenchait une SECONDE transition (saut à N+2).
      if (this.lastFinishHandledForToken !== token) {
        this.lastFinishHandledForToken = token;
        void this.advanceAuto();
      }
    }
  };

  // --- order helpers --------------------------------------------------------

  private getOrderedIndices = (): number[] => {
    const { queue, order } = this.state;

    if (order && order.length === queue.length) {
      return order;
    }

    return queue.map((_, idx) => idx);
  };

  private getOrderedPointer = (): number => {
    // Position of state.index inside the ordered list; -1 when unknown.
    if (this.state.index < 0) {
      return -1;
    }

    return this.getOrderedIndices().indexOf(this.state.index);
  };

  // --- resolution (source track → stream) -----------------------------------

  private ensureCache = async (): Promise<MatchCache> => {
    if (this.matchCache) {
      return this.matchCache;
    }
    if (this.matchCacheLoad) {
      return this.matchCacheLoad;
    }

    const loading = (async (): Promise<MatchCache> => {
      try {
        const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
        this.matchCache = loadMatchCache(raw);
      } catch (error) {
        console.warn('Failed to load the match cache:', error);
        this.matchCache = {};
      }
      return this.matchCache;
    })();
    this.matchCacheLoad = loading;

    try {
      return await loading;
    } finally {
      if (this.matchCacheLoad === loading) {
        this.matchCacheLoad = null;
      }
    }
  };

  private resolveTrack = (
    track: PlayerTrack
  ): Promise<ResolvedPlayback | null> => {
    // L'id seul ne suffit pas si une vue vient d'enrichir les métadonnées
    // (ISRC/durée) pendant une résolution précédente. La clé garde donc tous
    // les signaux susceptibles de modifier le choix strict du matcher.
    const key = [
      track.id,
      track.source.provider ?? 'metadata',
      track.source.id,
      track.title,
      track.artists.join('\u001f'),
      track.album ?? '',
      track.durationMillis ?? '',
      track.isrc ?? '',
    ].join('\u001e');
    const existing = this.resolutionLoads.get(key);
    if (existing) {
      return existing;
    }

    const loading = this.resolveTrackUnshared(track);
    this.resolutionLoads.set(key, loading);
    const cleanup = () => {
      if (this.resolutionLoads.get(key) === loading) {
        this.resolutionLoads.delete(key);
      }
    };
    void loading.then(cleanup, cleanup);
    return loading;
  };

  private resolveTrackUnshared = async (
    track: PlayerTrack
  ): Promise<ResolvedPlayback | null> => {
    // Native provider track (ex. 'audius:xyz' ou 'youtube:abc') : lecture
    // directe via SON provider, sans matching — comportement inchangé.
    if (track.source.provider) {
      const nativeProvider = getAudioProvider(track.source.provider);
      const resolved = await nativeProvider.resolveSource(track.source.id);

      return resolved
        ? {
            provider: nativeProvider,
            resolved,
            info: {
              provider: nativeProvider.displayName,
              sourceId: track.source.id,
              score: 1,
            },
          }
        : null;
    }

    // Métadonnées seules : cascade Audius → YouTube. Horodater le DÉBUT
    // empêche cette requête, si elle termine très tard, d'écraser dans le
    // stockage une résolution concurrente lancée plus récemment.
    const resolutionStartedAt = createMatchResolutionTimestamp();
    const cache = await this.ensureCache();
    const cached = cache[track.id];
    let providerId: string | null = null;
    let matchId: string | null = null;
    let score = 0;

    if (cached) {
      if (cached.matchId === null) {
        return null; // Négatif connu : ni Audius ni YouTube — jamais refait.
      }

      providerId = cached.providerId ?? DEFAULT_AUDIO_PROVIDER_ID;
      matchId = cached.matchId;
      score = cached.score;
    } else {
      const outcome = await resolveWithProviders(
        {
          title: track.title,
          artists: track.artists,
          album: track.album ?? null,
          durationMillis: track.durationMillis ?? null,
          isrc: track.isrc ?? null,
        },
        getAudioProviders()
      );

      if (outcome.status === 'matched') {
        providerId = outcome.provider.id;
        matchId = outcome.sourceId;
        score = Math.round(outcome.score * 100);
        writeMatchCacheEntry(
          cache,
          track.source,
          providerId,
          matchId,
          score,
          resolutionStartedAt
        );
        void persistMatchCache(cache);
      } else if (outcome.status === 'no-match') {
        // Négatif PROUVÉ (tous les providers ont répondu « introuvable ») :
        // le cache négatif 30 jours évite la re-recherche à chaque lecture.
        writeMatchCacheEntry(
          cache,
          track.source,
          null,
          null,
          0,
          resolutionStartedAt
        );
        void persistMatchCache(cache);
      }
      // I-5 : 'error' (panne réseau/timeout/provider) → RIEN d'écrit. Le
      // morceau est sauté proprement maintenant, réessayable plus tard —
      // jamais 30 jours d'« indisponible » pour une panne.
    }

    if (!matchId || !providerId) {
      return null;
    }

    // CASCADE DE LECTURE pour CE morceau (fallback en cours de lecture, §2) :
    //
    //   match (ex. Audius) → resolveSource ?  OUI → lecture
    //                                  \  NON → fournisseurs SUIVANTS de
    //                                            l'ordre (YouTube) pour le
    //                                            MÊME morceau, décision
    //                                            persistée dans LE cache ;
    //                    dernier provider mort → UNE seule « guérison » en
    //                                            relançant la cascade entière
    //                                            (nouveau match possible un jour) ;
    //                    même match mort re-servi → négatif confirmé (jamais
    //                                            de boucle infinie, jamais de
    //                                            rematch global inutile).
    const query = {
      title: track.title,
      artists: track.artists,
      album: track.album ?? null,
      durationMillis: track.durationMillis ?? null,
      isrc: track.isrc ?? null,
    };
    const chain = getAudioProviders();
    let chainIndex = Math.max(
      0,
      chain.findIndex((provider) => provider.id === providerId)
    );
    // Guérison (re-cascade complète) : UNIQUEMENT pour une décision issue du
    // cache dont le flux est mort — la cascade n'a pas tourné cette session-ci.
    // Un match FRAIS vient déjà de la chaîne entière : la relancer n'apprend
    // rien → jamais de recherche réseau inutile (règle §2).
    let healedOnce = cached ? false : true;

    // Borné : chaque tour consomme un fournisseur RESTANT ou la guérison
    // unique — la garde `attempt` est une ceinture de sécurité.
    for (let attempt = 0; attempt <= chain.length + 1; attempt++) {
      const provider = getAudioProvider(providerId);
      const resolved = await provider.resolveSource(matchId as string);

      if (resolved) {
        return {
          provider,
          resolved,
          info: {
            provider: provider.displayName,
            sourceId: matchId as string,
            score,
          },
        };
      }

      // Flux mort : tenter les fournisseurs RESTANTS, dans l'ordre de la
      // cascade (réutilise TrackResolver + cache existants — aucun 3e système).
      const remaining = chain.slice(chainIndex + 1);
      let outcome = remaining.length
        ? await resolveWithProviders(query, remaining)
        : null;

      if (outcome?.status !== 'matched' && !healedOnce) {
        // Bout de chaîne : une seule re-cascade complète (ancienne guérison
        // d'un match périmé) avant de déclarer le morceau indisponible.
        healedOnce = true;
        outcome = await resolveWithProviders(query, chain);
      }

      // I-5 : la re-cascade n'a pas pu trancher (panne réseau/timeout) —
      // on abandonne CE tour sans graver de négatif durable : le morceau
      // restera re-tentable, alors que l'ancien code verrouillait 30 jours.
      if (outcome?.status === 'error') {
        return null;
      }

      const match = outcome?.status === 'matched' ? outcome : null;
      const isNewMatch =
        match !== null &&
        !(
          match.provider.id === providerId &&
          match.sourceId === (matchId as string)
        );

      if (!isNewMatch || !match) {
        // Un match de métadonnées suivi d'un flux indisponible n'est PAS la
        // preuve que le titre est absent : le CDN/provider peut être en panne.
        // Conserver la décision positive permet de retenter le flux plus tard,
        // sans graver à tort 24 h d'indisponibilité. Seul le `no-match` initial
        // de tous les providers produit une entrée négative.
        return null;
      }

      // Nouvelle décision RÉELLE : persister et tenter immédiatement SON flux
      // (même morceau — c'est le fallback, pas un skip ni un nouveau système).
      providerId = match.provider.id;
      matchId = match.sourceId;
      score = Math.round(match.score * 100);
      chainIndex = chain.findIndex((provider) => provider.id === providerId);
      writeMatchCacheEntry(cache, track.source, providerId, matchId, score);
      void persistMatchCache(cache);
    }

    return null;
  };

  // --- skip logic -----------------------------------------------------------

  private markFailed = (track: PlayerTrack, kind: PlayerNotice['kind']) => {
    this.failedKeys.add(track.id);
    this.emit({ notice: { kind, title: track.title } });
  };

  private advanceAfterFailure = async () => {
    // Comme une fin naturelle, un échec ne doit JAMAIS reboucler une file en
    // repeat-off. On inspecte d'abord uniquement la suite ; le début de file
    // n'est admissible qu'en repeat-all. Les morceaux déjà échoués pendant
    // cette session restent exclus pour éviter toute boucle de panne.
    const indices = this.getOrderedIndices();
    const pointer = this.getOrderedPointer();
    const candidates = [
      ...indices.slice(pointer + 1),
      ...(this.state.repeat === 'all' ? indices.slice(0, pointer + 1) : []),
    ];

    for (const nextIndex of candidates) {
      const candidate = this.state.queue[nextIndex];

      if (candidate && !this.failedKeys.has(candidate.id)) {
        await this.playIndex(nextIndex);
        return;
      }
    }

    // Fin de file ou plus rien de jouable.
    await this.stop();
  };

  private advanceAuto = async () => {
    const { repeat, index } = this.state;

    if (repeat === 'one' && index >= 0) {
      await this.playIndex(index);
      return;
    }

    const indices = this.getOrderedIndices();
    const pointer = this.getOrderedPointer();
    const nextPointer = pointer + 1;

    if (nextPointer >= indices.length) {
      if (repeat === 'all' && indices.length) {
        await this.playIndex(indices[0]);
        return;
      }

      await this.stop();
      return;
    }

    await this.playIndex(indices[nextPointer]);
  };

  private advanceManual = async (direction: 1 | -1) => {
    const indices = this.getOrderedIndices();

    if (!indices.length || this.state.index < 0) {
      return;
    }

    const pointer = this.getOrderedPointer();
    const nextPointer = pointer + direction;

    if (nextPointer < 0 || nextPointer >= indices.length) {
      // Les actions manuelles ignorent repeat-one (l'utilisateur demande
      // explicitement de changer), mais respectent la frontière de file :
      // repeat-all boucle ; repeat-off s'arrête en fin et reste au début pour
      // previous. L'ancien modulo bouclait même quand repeat était désactivé.
      if (this.state.repeat === 'all') {
        const wrapped = nextPointer < 0 ? indices.length - 1 : 0;
        await this.playIndex(indices[wrapped]);
      } else if (direction === 1) {
        await this.stop();
      } else {
        await this.seekTo(0);
      }
      return;
    }

    await this.playIndex(indices[nextPointer]);
  };

  private handleStreamFailure = async (
    kind: PlayerNotice['kind'],
    token: number
  ) => {
    const track = this.state.current;

    if (!track || this.playToken !== token) {
      return;
    }

    this.markFailed(track, kind);
    await this.unloadCurrent();
    if (this.playToken !== token) {
      return; // une commande plus récente a gagné pendant l'unload natif
    }
    await this.advanceAfterFailure();
  };

  // --- public API -----------------------------------------------------------

  playQueue = async (tracks: PlayerTrack[], startIndex = 0) => {
    const validTracks = tracks.filter((track) =>
      Boolean(track?.id && track?.title)
    );

    if (!validTracks.length) {
      return;
    }

    const requestedIndex = Math.min(
      Math.max(Number.isFinite(startIndex) ? Math.trunc(startIndex) : 0, 0),
      validTracks.length - 1
    );
    const requestedId = validTracks[requestedIndex].id;
    const seen = new Set<string>();
    const queue = validTracks.filter((track) => {
      if (seen.has(track.id)) return false;
      seen.add(track.id);
      return true;
    });
    // Si l'index visait une occurrence dupliquée, lire l'unique occurrence du
    // même morceau plutôt qu'un voisin déplacé par la déduplication.
    const index = Math.max(
      0,
      queue.findIndex((track) => track.id === requestedId)
    );

    const requestToken = ++this.playToken; // invalide toute requête précédente
    await this.unloadCurrent();
    if (this.playToken !== requestToken) {
      return; // une lecture/stop plus récent a gagné pendant l'unload
    }
    this.failedKeys = new Set();
    this.emit({
      queue,
      index,
      current: queue[index],
      status: 'loading',
      buffering: true,
      order: this.state.shuffle
        ? buildShuffledOrder(queue.length, index)
        : null,
      positionMillis: 0,
      durationMillis: 0,
      resolved: null,
    });
    await this.playIndex(index);
  };

  playTrack = async (track: PlayerTrack) => this.playQueue([track], 0);

  /** Starts the queue at a specific element (queue rows of the full player). */
  playAtIndex = async (index: number) => {
    if (index < 0 || index >= this.state.queue.length) {
      return;
    }

    await this.playIndex(index);
  };

  private playIndex = async (index: number) => {
    const { queue } = this.state;
    const track = queue[index];

    if (!track) {
      await this.stop();
      return;
    }

    const token = ++this.playToken;
    // Les commandes transport de l'ancien Sound ne doivent ni retarder ni
    // inverser une commande destinée à ce nouveau morceau.
    this.transportCommandToken += 1;
    this.transportIntent = null;
    this.transportQueue = Promise.resolve();
    const isStale = () => this.playToken !== token;

    appendDiagLog(
      `PLAYER_PLAY_REQUEST trackId=${track.id} index=${index} ` +
        `titleLength=${track.title.length} artists=${track.artists.length} ` +
        `hasIsrc=${Boolean(track.isrc)}`
    );
    const metadataDuration =
      typeof track.durationMillis === 'number' &&
      Number.isFinite(track.durationMillis) &&
      track.durationMillis > 0
        ? track.durationMillis
        : 0;
    const pendingPosition =
      this.pendingSeekForId === track.id ? this.pendingSeekMillis : 0;
    // Changer d'index invalide immédiatement les valeurs du morceau précédent.
    // Sans ce reset, B pouvait afficher/projeter la position, la durée et le
    // provider de A pendant toute sa résolution (voire jusqu'au premier tick).
    this.emit({
      index,
      current: track,
      status: 'loading',
      buffering: true,
      positionMillis: pendingPosition,
      durationMillis: metadataDuration,
      resolved: null,
    });
    this.persistSession(); // nouveau morceau pointe la session vers lui
    this.ensureAppStatePersistence();

    const av = this.getAv();

    if (!av?.Audio) {
      this.emit({ status: 'unavailable', buffering: false });
      return;
    }

    try {
      const result = await this.resolveTrack(track);

      // Un autre morceau a pris la main pendant ce resolve : ignorer la fin.
      if (isStale()) {
        return;
      }

      if (!result) {
        if (this.state.current?.id !== track.id) {
          return; // The user moved on while we were resolving.
        }

        this.markFailed(track, 'not-available');
        await this.unloadCurrent();
        await this.advanceAfterFailure();
        return;
      }

      appendDiagLog(
        `PLAYER_SOURCE_RESOLVED trackId=${track.id} provider=${result.provider.id} ` +
          `sourceId=${result.info.sourceId} score=${result.info.score}`
      );
      await this.ensureAudioMode();
      if (isStale()) {
        return;
      }

      await this.unloadCurrent();
      if (isStale()) {
        return;
      }
      const { sound } = await av.Audio.Sound.createAsync(
        { uri: result.resolved.uri },
        {
          shouldPlay: true,
          progressUpdateIntervalMillis: 500,
          volume: this.state.volume,
        },
        this.makeStatusHandler(token)
      );
      // The user may have skipped to another track while this one was loading —
      // ce son ORPHELIN est déchargé immédiatement (jamais deux sons ensemble).
      if (
        isStale() ||
        this.state.current?.id !== track.id ||
        this.state.status !== 'loading'
      ) {
        try {
          await sound.unloadAsync();
        } catch {
          // déchargement best-effort
        }
        return;
      }

      this.sound = sound;
      // Une panne de flux est sessionnelle, pas une condamnation définitive :
      // si l'utilisateur retente ce morceau et qu'il démarre réellement, il
      // redevient candidat pour repeat-all et les avances ultérieures.
      this.failedKeys.delete(track.id);
      appendDiagLog(
        `PLAYER_SOUND_LOADED trackId=${track.id} provider=${result.provider.id}`
      );
      this.emit({
        status: 'playing',
        buffering: false,
        resolved: result.info,
        // Un nouveau morceau commence : toute notice d'erreur disparaît —
        // jamais affichée sur le morceau suivant (cohérent mini/plein écran).
        notice: null,
        durationMillis: track.durationMillis ?? this.state.durationMillis,
      });
      appendDiagLog(
        `[MEDIA_DIAG] PLAYBACK_STARTED trackId=${track.id} ` +
          `provider=${result.provider.id} state=PLAYING`
      );

      // Seek en attente : consommé UNE fois, UNIQUEMENT pour le morceau visé
      // — un seek destiné à A ne se retrouve jamais appliqué à B.
      if (this.pendingSeekMillis > 0) {
        const target =
          this.state.durationMillis > 0
            ? Math.min(this.pendingSeekMillis, this.state.durationMillis)
            : this.pendingSeekMillis;
        const targetForId = this.pendingSeekForId;
        this.pendingSeekMillis = 0;
        this.pendingSeekForId = null;
        if (targetForId === track.id) {
          try {
            await sound.setPositionAsync(target);
            if (isStale() || this.sound !== sound) {
              return; // seek différé de l'ancien morceau terminé trop tard
            }
            this.emit({ positionMillis: target });
          } catch (seekError) {
            if (!isStale()) {
              console.warn('Restore seek failed (tolerated):', seekError);
            }
          }
        }
      }

      // Historique de lecture LOCAL (sans compte) : alimente les sections
      // « Écoutés récemment », « en tête », seeds de recommandations.
      // Fire-and-forget : l'historique ne doit jamais perturber la lecture.
      void recordPlay(
        {
          id: track.id,
          title: track.title,
          subtitle: track.artists.join(', '),
          imageURL: track.imageURL || undefined,
          // Snapshot complet (I-2) : la relecture directe depuis
          // l'historique matche avec les mêmes métadonnées.
          albumName: track.album ?? null,
          durationMs: track.durationMillis ?? null,
          // Conserver le signal exact jusque dans « Écoutés récemment » :
          // une relecture ne doit pas perdre l'ISRC obtenu depuis Spotify.
          isrc: track.isrc ?? null,
        },
        {
          albumTitle: track.album ?? undefined,
          // I-8 : albumId conservé quand l'écran d'origine le connaît —
          // « Écoutés récemment » pourra naviguer vers l'ALBUM.
          albumId: track.albumId ?? null,
        }
      ).catch(() => undefined);
    } catch (error) {
      // M-7 : l'erreur expo-av peut citer l'URL SIGNÉE du flux → assainie.
      console.error(
        `Failed to play "${track.title}" (${track.id}):`,
        sanitizeErrorForLog(error)
      );

      if (!isStale() && this.state.current?.id === track.id) {
        this.markFailed(track, 'play-failed');
        await this.unloadCurrent();
        await this.advanceAfterFailure();
      }
    }
  };

  togglePlayPause = async () => {
    if (this.state.status === 'loading') {
      // Pendant la résolution, aucun Sound n'existe encore. Ne jamais relancer
      // playIndex depuis un toggle qui devait être une pause.
      return;
    }

    if (!this.sound) {
      if (this.state.current && this.state.index >= 0) {
        await this.playIndex(this.state.index);
      }
      return;
    }

    const sound = this.sound;
    const playToken = this.playToken;
    // L'intention en vol prime sur l'état React, qui ne change qu'après la
    // réponse native. Deux taps rapides deviennent donc pause PUIS play, au
    // lieu de deux pauses concurrentes laissant l'UI dans le mauvais état.
    const desiredPlaying = !(
      this.transportIntent ?? this.state.status === 'playing'
    );
    this.transportIntent = desiredPlaying;
    const commandToken = ++this.transportCommandToken;

    const operation = this.transportQueue.then(async () => {
      if (this.playToken !== playToken || this.sound !== sound) return;
      try {
        if (desiredPlaying) {
          await sound.playAsync();
        } else {
          await sound.pauseAsync();
        }
        if (
          this.transportCommandToken !== commandToken ||
          this.playToken !== playToken ||
          this.sound !== sound
        ) {
          return;
        }
        this.emit({
          status: desiredPlaying ? 'playing' : 'paused',
          buffering: false,
        });
        appendDiagLog(
          `PLAYER_STATE state=${desiredPlaying ? 'PLAYING' : 'PAUSED'} ` +
            `trackId=${this.state.current?.id ?? 'none'}`
        );
        if (!desiredPlaying) this.persistSession();
      } catch (error) {
        console.error(
          desiredPlaying ? 'Failed to resume:' : 'Failed to pause:',
          error
        );
        if (
          this.transportCommandToken === commandToken &&
          this.playToken === playToken &&
          this.sound === sound
        ) {
          this.emit({ status: 'error', buffering: false });
        }
      } finally {
        if (this.transportCommandToken === commandToken) {
          this.transportIntent = null;
        }
      }
    });

    // Une panne native ne doit jamais bloquer les commandes suivantes.
    this.transportQueue = operation.then(
      () => undefined,
      () => undefined
    );
    await operation;
  };

  next = async () => {
    if (this.state.status === 'loading' && this.state.current) {
      // Invalider AVANT l'unload : si le resolver courant termine pendant une
      // libération native lente, il ne doit jamais créer un Sound dépassé.
      const requestToken = ++this.playToken;
      await this.unloadCurrent();
      if (this.playToken !== requestToken) {
        return; // une commande plus récente a gagné pendant l'unload
      }
    }

    await this.advanceManual(1);
  };

  previous = async () => {
    const { positionMillis, index } = this.state;

    if (positionMillis > RESTART_THRESHOLD_MS && index >= 0) {
      await this.seekTo(0);
      return;
    }

    await this.advanceManual(-1);
  };

  seekTo = async (positionMillis: number) => {
    // Une valeur invalide issue d'un slider/callback transitoire ne doit pas
    // téléporter la lecture au début ni contaminer l'état central.
    if (!Number.isFinite(positionMillis)) {
      return;
    }

    const upperBound =
      this.state.durationMillis > 0
        ? this.state.durationMillis
        : Number.POSITIVE_INFINITY;
    const clamped = Math.min(upperBound, Math.max(0, positionMillis));

    if (this.sound) {
      const sound = this.sound;
      const token = this.playToken;
      try {
        await sound.setPositionAsync(clamped);
      } catch (error) {
        console.error('Seek failed:', error);
        return; // les événements du Sound restent la source de vérité
      }
      if (this.playToken !== token || this.sound !== sound) {
        return; // seek de l'ancien morceau terminé après un changement
      }
    } else if (this.state.status === 'loading') {
      // 5D §3 (seek avant durée connue) : pas de sound à commander — on
      // mémorise la cible dans le MÊME canal que la restauration de session,
      // elle sera appliquée à l'arrivée du son (pendingSeekMillis consommé
      // une seule fois au démarrage effectif) — TAGUÉE au morceau courant.
      this.pendingSeekMillis = clamped;
      this.pendingSeekForId = this.state.current?.id ?? null;
    } else {
      return;
    }

    this.emit({ positionMillis: clamped });
  };

  setVolume = async (volume: number) => {
    if (!Number.isFinite(volume)) {
      return;
    }

    const clamped = Math.min(1, Math.max(0, volume));
    const sound = this.sound;

    // Le volume est une intention globale, pas un accusé de réception de
    // l'ancien Sound. Le publier avant l'appel natif garantit qu'un morceau
    // créé pendant un setVolumeAsync lent démarre déjà au bon niveau.
    this.emit({ volume: clamped });

    if (sound) {
      try {
        await sound.setVolumeAsync(clamped);
      } catch (error) {
        console.error('Volume change failed:', error);
      }
    }
  };

  toggleShuffle = () => {
    const { shuffle, index, queue } = this.state;

    if (shuffle) {
      this.emit({ shuffle: false, order: null, orderPointer: -1 });
      return;
    }

    if (!queue.length || index < 0) {
      this.emit({ shuffle: true });
      return;
    }

    this.emit({
      shuffle: true,
      order: buildShuffledOrder(queue.length, index),
      orderPointer: 0,
    });
  };

  cycleRepeat = () => {
    const order: RepeatMode[] = ['off', 'all', 'one'];
    const next = order[(order.indexOf(this.state.repeat) + 1) % order.length];

    this.emit({ repeat: next });
  };

  /** Réglage explicite (paramètres → switch « Répéter la file »). Additif. */
  setRepeat = (mode: RepeatMode) => {
    if (this.state.repeat !== mode) {
      this.emit({ repeat: mode });
    }
  };

  clearNotice = () => {
    if (this.state.notice) {
      this.emit({ notice: null });
    }
  };

  // --- file d'attente avancée (Phase 2) — additif ----------------------------
  // Invariants conservés : `queue` = liste ORIGINALE jamais remplacée;
  // `order` (shuffle) est remappé à chaque mutation ; `index` pointe vers le
  // même morceau ; repeat/shuffle/jeton de lecture restent intacts.

  /** Remappage d'une position après un déplacement from→to. */
  private remapMovedPosition = (
    pos: number,
    from: number,
    to: number
  ): number => {
    if (pos === from) {
      return to;
    }
    if (from < to) {
      return pos > from && pos <= to ? pos - 1 : pos;
    }
    return pos < from && pos >= to ? pos + 1 : pos;
  };

  /** Persistance sobre, fire-and-forget : jamais bloquante pour la lecture. */
  private persistSession = (): void => {
    const { queue, index, positionMillis, shuffle, repeat, volume } =
      this.state;

    if (!queue.length || index < 0 || index >= queue.length) {
      return; // rien de jouable à retenir
    }

    this.lastPersistedAt = Date.now();
    this.sessionDirty = false;

    // File > 200 (I-1) : fenêtre centrée sur le morceau COURANT avec index
    // réaligné — sinon l'index dépassait la tranche persistée et la session
    // était rejetée silencieusement à la restauration (« Reprendre » perdu).
    const windowed = windowQueueForSession(queue, index);

    void savePlaybackSession({
      version: PLAYBACK_SESSION_VERSION,
      savedAt: this.lastPersistedAt,
      queue: windowed.queue,
      index: windowed.index,
      positionMillis,
      shuffle,
      repeat,
      volume,
    }).catch(() => undefined);
  };

  /** Écriture aussi quand l'app passe en arrière-plan (sans timer natif). */
  private ensureAppStatePersistence = (): void => {
    if (this.appStateSubscribed) {
      return;
    }
    this.appStateSubscribed = true;

    try {
      AppState.addEventListener('change', (nextState: string) => {
        if (nextState === 'background' || nextState === 'inactive') {
          this.persistSession();
        }
      });
    } catch {
      // AppState indisponible (environnement de test) : ponctualité suffisante.
    }
  };

  /**
   * Ajoute plusieurs morceaux en fin de file, sans recopier un morceau déjà
   * présent ni un doublon du lot. Une seule émission/persistance garantit que
   * mini-player, plein écran et MediaSession voient une mutation atomique.
   */
  addTracksToQueue = (tracks: PlayerTrack[]): void => {
    const { queue, order } = this.state;
    const seen = new Set(queue.map((item) => item.id));
    const additions = tracks.filter((track) => {
      if (!track?.id || !track?.title || seen.has(track.id)) {
        return false;
      }
      seen.add(track.id);
      return true;
    });

    if (!additions.length) {
      return;
    }

    const nextQueue = [...queue, ...additions];
    const nextOrder =
      order && order.length === queue.length
        ? [...order, ...additions.map((_, offset) => queue.length + offset)]
        : order;

    this.emit({ queue: nextQueue, order: nextOrder });
    this.persistSession();
    this.ensureAppStatePersistence();
  };

  /** « Ajouter à la file » : version unitaire de l'opération centralisée. */
  addToQueue = (track: PlayerTrack): void => {
    this.addTracksToQueue([track]);
  };

  /** Vide la file et ferme la session/audio de manière identique à Stop. */
  clearQueue = async (): Promise<void> => {
    await this.stop();
  };

  /** « Lire ensuite » : inséré JUSTE après le morceau courant. */
  playNext = (track: PlayerTrack): void => {
    if (!track?.id || !track?.title) {
      return;
    }

    const { queue, order, index } = this.state;
    const existingIndex = queue.findIndex((item) => item.id === track.id);

    if (index < 0 || index >= queue.length) {
      // Pas de session active (index hors file — ex. après addToQueue sur
      // file vide/dormante) : « Lire ensuite » LANCE la lecture. Ajouter
      // silencieusement rendait l'action invisible (M-1 : current === null
      // → MiniPlayer masqué, utilisateur sans aucun retour). Un morceau déjà
      // présent est joué à sa place au lieu d'être dupliqué.
      const nextQueue = existingIndex >= 0 ? queue : [...queue, track];
      void this.playQueue(
        nextQueue,
        existingIndex >= 0 ? existingIndex : nextQueue.length - 1
      );
      return;
    }

    // « Lire ensuite » est aussi une opération de déduplication : si la piste
    // existe déjà ailleurs, la déplacer plutôt que créer deux entrées portant
    // le même identifiant. Le morceau courant demandé à nouveau est un no-op.
    if (existingIndex === index) {
      return;
    }

    const queueWithoutExisting =
      existingIndex >= 0
        ? queue.filter((_, position) => position !== existingIndex)
        : [...queue];
    const nextCurrentIndex =
      existingIndex >= 0 && existingIndex < index ? index - 1 : index;
    const insertAt = nextCurrentIndex + 1;
    const nextQueue = [...queueWithoutExisting];
    nextQueue.splice(insertAt, 0, track);

    let nextOrder = order;
    if (order && order.length === queue.length) {
      const withoutExisting =
        existingIndex >= 0
          ? order
              .filter((pos) => pos !== existingIndex)
              .map((pos) => (pos > existingIndex ? pos - 1 : pos))
          : [...order];
      nextOrder = withoutExisting.map((pos) =>
        pos >= insertAt ? pos + 1 : pos
      );
      const pointer = nextOrder.indexOf(nextCurrentIndex);
      nextOrder.splice(pointer >= 0 ? pointer + 1 : 0, 0, insertAt);
    }

    this.emit({ queue: nextQueue, index: nextCurrentIndex, order: nextOrder });
    this.persistSession();
    this.ensureAppStatePersistence();
  };

  /**
   * « Supprimer de la file ». Si l'élément est le morceau courant : sa lecture
   * est abandonnée proprement (jeton) et le SUIVANT de l'ordre remappé est
   * joué ; fin de file → stop.
   */
  removeFromQueue = (queueIndex: number): void => {
    const { queue, order, index, current } = this.state;

    if (queueIndex < 0 || queueIndex >= queue.length) {
      return;
    }

    const isOrderConsistent = Boolean(order && order.length === queue.length);
    const remap = (pos: number): number => (pos > queueIndex ? pos - 1 : pos);
    const nextQueue = queue.filter((_, i) => i !== queueIndex);
    const nextOrder = isOrderConsistent
      ? (order as number[]).filter((pos) => pos !== queueIndex).map(remap)
      : order;
    const removingCurrent = current && queueIndex === index;

    if (!removingCurrent) {
      this.emit({
        queue: nextQueue,
        index: index > queueIndex ? index - 1 : index,
        order: nextOrder,
      });
      this.persistSession();
      this.ensureAppStatePersistence();
      return;
    }

    // Cible suivante : l'élément qui suit le supprimé DANS L'ORDRE (wrap inclus).
    let targetIndex: number | null = null;

    if (isOrderConsistent) {
      const oldPointer = (order as number[]).indexOf(queueIndex);

      for (let step = 1; step <= (order as number[]).length; step++) {
        const candidate = (order as number[])[
          (oldPointer + step) % (order as number[]).length
        ];

        if (candidate !== queueIndex) {
          targetIndex = remap(candidate);
          break;
        }
      }
    } else if (nextQueue.length) {
      targetIndex = Math.min(queueIndex, nextQueue.length - 1);
    }

    this.playToken += 1; // abandon propre de la résolution en vol éventuelle
    void this.unloadCurrent();

    if (targetIndex === null || !nextQueue.length) {
      void this.stop(); // plus rien de jouable → session purgée proprement
      return;
    }

    this.emit({ queue: nextQueue, index: targetIndex, order: nextOrder });
    void this.playIndex(targetIndex);
  };

  /** « Réordonner » : déplace FROM vers TO, sans changer le morceau courant. */
  moveInQueue = (from: number, to: number): void => {
    const { queue, order, index } = this.state;
    const toClamped = Math.min(Math.max(to, 0), queue.length - 1);

    if (from < 0 || from >= queue.length || from === toClamped) {
      return;
    }

    const nextQueue = [...queue];
    const [moved] = nextQueue.splice(from, 1);
    nextQueue.splice(toClamped, 0, moved);

    this.emit({
      queue: nextQueue,
      index: this.remapMovedPosition(index, from, toClamped),
      order:
        order && order.length === queue.length
          ? order.map((pos) => this.remapMovedPosition(pos, from, toClamped))
          : order,
    });
    this.persistSession();
    this.ensureAppStatePersistence();
  };

  /**
   * « Reprendre la lecture » : restaure file + morceau + position depuis la
   * session persistée, puis JOUE. Aucun auto-play au boot — cette méthode
   * n'est appelée que sur action utilisateur explicite.
   */
  restoreSession = async (session: PlaybackSession): Promise<void> => {
    const queue = session.queue.filter((track) => track?.id && track?.title);
    if (!queue.length) {
      return;
    }

    const index = Math.min(Math.max(session.index, 0), queue.length - 1);
    const shuffle = session.shuffle === true;
    const restoredPosition =
      Number.isFinite(session.positionMillis) && session.positionMillis >= 0
        ? session.positionMillis
        : 0;

    const requestToken = ++this.playToken;
    this.failedKeys = new Set();
    await this.unloadCurrent();
    if (this.playToken !== requestToken) {
      return;
    }

    this.emit({
      queue,
      index,
      current: queue[index],
      status: 'idle',
      buffering: false,
      // L'ordre de lecture shuffle est REBATI (il n'est pas persisté) : file
      // originale intacte, courant épinglé — mêmes règles que playQueue().
      order: shuffle ? buildShuffledOrder(queue.length, index) : null,
      orderPointer: shuffle ? 0 : -1,
      shuffle,
      repeat: session.repeat,
      volume: session.volume,
      positionMillis: restoredPosition,
      durationMillis: 0,
      resolved: null,
      notice: null,
    });

    this.pendingSeekMillis = restoredPosition;
    this.pendingSeekForId = queue[index]?.id ?? null;
    await this.playIndex(index);
  };

  stop = async () => {
    const requestToken = ++this.playToken; // tout resolve en vol devient orphelin
    this.transportCommandToken += 1;
    this.transportIntent = null;
    this.transportQueue = Promise.resolve();
    this.pendingSeekMillis = 0;
    this.pendingSeekForId = null;
    await this.unloadCurrent();
    if (this.playToken !== requestToken) {
      return; // une lecture plus récente a gagné pendant l'unload
    }
    // Fermeture explicite : la session persistée est PURGÉE (Reprendre =
    // uniquement les sessions interrompues, jamais les arrêts volontaires).
    void clearPlaybackSession().catch(() => undefined);
    this.emit({
      ...INITIAL_PLAYER_STATE,
      // Preferences AND last failure notice survive a queue change/stop (le
      // bandeau « titre indisponible » reste visible le temps de son timer UI).
      shuffle: this.state.shuffle,
      repeat: this.state.repeat,
      volume: this.state.volume,
      notice: this.state.notice,
    });
  };

  // Test-only: complete engine reset (match cache + failures + preferences).
  __testReset = async () => {
    await this.unloadCurrent();
    this.matchCache = null;
    this.matchCacheLoad = null;
    this.resolutionLoads.clear();
    this.failedKeys = new Set();
    this.pendingSeekMillis = 0;
    this.pendingSeekForId = null;
    this.transportCommandToken += 1;
    this.transportIntent = null;
    this.transportQueue = Promise.resolve();
    this.lastPersistedAt = 0;
    this.sessionDirty = false;
    this.state = { ...INITIAL_PLAYER_STATE };
    this.listeners.forEach((listener) => listener(this.state));
  };
}

export const melodixPlayer = new MelodixPlayer();
