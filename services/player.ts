import AsyncStorage from '@react-native-async-storage/async-storage';
import { AppState } from 'react-native';

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

export type PlayerState = {
  queue: PlayerTrack[];
  index: number;
  order: number[] | null;
  orderPointer: number;
  current: PlayerTrack | null;
  status: PlayerStatus;
  positionMillis: number;
  durationMillis: number;
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
  private avModule: ExpoAvModule | null | undefined;
  private audioModeReady = false;
  /** Réglage « Lecture en arrière-plan » (paramètres) — défaut historique. */
  private staysActiveInBackground = true;
  private matchCache: MatchCache | null = null;
  private failedKeys = new Set<string>();
  /** Monceau actif actuel : tout resolve/chargement d'un token périmé est
   * ignoré et son éventuel Sound immédiatement déchargé (anti-double-lecture). */
  private playToken = 0;
  /** 5D : didJustFinish consommé UNE SEULE FOIS par session de lecture —
   * empêche la double transition « fin → next → next » si expo-av réémet
   * didJustFinish=true sur un nouveau tick du même vieux son pendant la
   * résolution du morceau suivant (field collant jusqu'à l'unload). */
  private lastFinishHandledForToken = -1;
  /** DIAG 4.4.5-diagnostic : SOUND_PLAYING n'est tracé qu'une fois par son. */
  /** Seek à consommer au prochain démarrage effectif du son (restauration). */
  private pendingSeekMillis = 0;
  /** Persistance session : dernière écriture + état déjà écrit (anti-spam). */
  private lastPersistedAt = 0;
  private sessionDirty = false;
  private appStateSubscribed = false;

  getState = (): PlayerState => this.state;

  subscribe = (listener: PlayerListener): (() => void) => {
    this.listeners.add(listener);
    listener(this.state);

    return () => this.listeners.delete(listener);
  };

  private emit = (partial: Partial<PlayerState>) => {
    this.state = { ...this.state, ...partial };
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

    if (sound) {
      try {
        await sound.unloadAsync();
      } catch (error) {
        console.warn('Failed to unload the previous sound:', error);
      }
    }
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

      this.onPlaybackStatusUpdate(token, status);
    };
  };

  private onPlaybackStatusUpdate = (
    token: number,
    status: AvPlaybackStatus
  ) => {
    if (status?.isLoaded === false) {
      if (status.error && this.state.status === 'playing') {
        void this.handleStreamFailure('play-failed');
      }

      return;
    }

    this.emit({
      positionMillis: status?.positionMillis ?? 0,
      durationMillis: status?.durationMillis ?? 0,
    });

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

    try {
      const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
      this.matchCache = loadMatchCache(raw);
    } catch (error) {
      console.warn('Failed to load the match cache:', error);
      this.matchCache = {};
    }

    return this.matchCache;
  };

  private resolveTrack = async (
    track: PlayerTrack
  ): Promise<{
    provider: AudioProvider;
    resolved: ResolvedStream;
    info: ResolverInfo;
  } | null> => {
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

    // Métadonnées seules : cascade Audius → YouTube. Le cache v2 mémorise
    // AUSSI le provider retenu (jamais de re-recherche sans nécessité).
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
        },
        getAudioProviders()
      );

      if (outcome.status === 'matched') {
        providerId = outcome.provider.id;
        matchId = outcome.sourceId;
        score = Math.round(outcome.score * 100);
        writeMatchCacheEntry(cache, track.source, providerId, matchId, score);
        void persistMatchCache(cache);
      } else if (outcome.status === 'no-match') {
        // Négatif PROUVÉ (tous les providers ont répondu « introuvable ») :
        // le cache négatif 30 jours évite la re-recherche à chaque lecture.
        writeMatchCacheEntry(cache, track.source, null, null, 0);
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
        // Même flux mort re-servi (ou négatif PROUVÉ) : négatif confirmé —
        // le morceau sera sauté proprement, et jamais re-recherché avant TTL.
        writeMatchCacheEntry(cache, track.source, null, null, 0);
        void persistMatchCache(cache);
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
    // Scan the ordered queue for the next track not yet failed this session.
    const indices = this.getOrderedIndices();
    const pointer = this.getOrderedPointer();

    for (let step = 1; step <= indices.length; step++) {
      const nextIndex = indices[(pointer + step) % indices.length];
      const candidate = this.state.queue[nextIndex];

      if (candidate && !this.failedKeys.has(candidate.id)) {
        await this.playIndex(nextIndex);
        return;
      }
    }

    // Nothing playable left in this queue.
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
    // Manual skip wraps around in one direction only (end → start / start → end).
    const wrappedPointer =
      ((nextPointer % indices.length) + indices.length) % indices.length;

    await this.playIndex(indices[wrappedPointer]);
  };

  private handleStreamFailure = async (kind: PlayerNotice['kind']) => {
    const track = this.state.current;

    if (!track) {
      return;
    }

    this.markFailed(track, kind);
    await this.unloadCurrent();
    await this.advanceAfterFailure();
  };

  // --- public API -----------------------------------------------------------

  playQueue = async (tracks: PlayerTrack[], startIndex = 0) => {
    const queue = tracks.filter((track) => Boolean(track?.id && track?.title));

    if (!queue.length) {
      return;
    }

    const index = Math.min(Math.max(startIndex, 0), queue.length - 1);

    this.playToken += 1; // invalide tout resolve d'un morceau précédent
    await this.unloadCurrent();
    this.failedKeys = new Set();
    this.emit({
      queue,
      index,
      current: queue[index],
      status: 'loading',
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
    const isStale = () => this.playToken !== token;

    this.emit({ index, current: track, status: 'loading' });
    this.persistSession(); // nouveau morceau pointe la session vers lui
    this.ensureAppStatePersistence();

    const av = this.getAv();

    if (!av?.Audio) {
      this.emit({ status: 'unavailable' });
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

      await this.ensureAudioMode();
      if (isStale()) {
        return;
      }

      await this.unloadCurrent();
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
      this.emit({
        status: 'playing',
        resolved: result.info,
        // Un nouveau morceau commence : toute notice d'erreur disparaît —
        // jamais affichée sur le morceau suivant (cohérent mini/plein écran).
        notice: null,
        durationMillis: track.durationMillis ?? this.state.durationMillis,
      });

      // Reprise de session : position mémorisée consommée UNE fois le son prêt.
      if (this.pendingSeekMillis > 0) {
        const target = this.pendingSeekMillis;
        this.pendingSeekMillis = 0;
        try {
          await sound.setPositionAsync(target);
          this.emit({ positionMillis: target });
        } catch (seekError) {
          console.warn('Restore seek failed (tolerated):', seekError);
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
        },
        {
          albumTitle: track.album ?? undefined,
          // I-8 : albumId conservé quand l'écran d'origine le connaît —
          // « Écoutés récemment » pourra naviguer vers l'ALBUM.
          albumId: track.albumId ?? null,
        }
      ).catch(() => undefined);
    } catch (error) {
      console.error(`Failed to play "${track.title}" (${track.id}):`, error);

      if (!isStale() && this.state.current?.id === track.id) {
        this.markFailed(track, 'play-failed');
        await this.unloadCurrent();
        await this.advanceAfterFailure();
      }
    }
  };

  togglePlayPause = async () => {
    if (this.state.status === 'loading') {
      // 5D race §2 : pendant la résolution/chargement le sound n'existe pas
      // encore — « toggle » ici aurait RELANCÉ playIndex (pause devenue un
      // redémarrage, double résolution). Comportement prévisible : on ignore
      // le geste ; l'UI reste cohérente jusqu'au vrai démarrage.
      return;
    }

    if (!this.sound) {
      if (this.state.current && this.state.index >= 0) {
        await this.playIndex(this.state.index);
      }

      return;
    }

    if (this.state.status === 'playing') {
      try {
        await this.sound.pauseAsync();
        this.emit({ status: 'paused' });
        this.persistSession(); // position figée : moment idéal d'écrire
      } catch (error) {
        console.error('Failed to pause:', error);
        this.emit({ status: 'error' });
      }

      return;
    }

    try {
      await this.sound.playAsync();
      this.emit({ status: 'playing' });
    } catch (error) {
      console.error('Failed to resume:', error);
      this.emit({ status: 'error' });
    }
  };

  next = async () => {
    if (this.state.status === 'loading' && this.state.current) {
      // Let the current resolve finish; treat manual next as a queue move.
      await this.unloadCurrent();
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
    const clamped = Math.max(0, positionMillis);

    if (this.sound) {
      try {
        await this.sound.setPositionAsync(clamped);
      } catch (error) {
        console.error('Seek failed:', error);
      }
    } else if (this.state.status === 'loading') {
      // 5D §3 (seek avant durée connue) : pas de sound à commander — on
      // mémorise la cible dans le MÊME canal que la restauration de session,
      // elle sera appliquée à l'arrivée du son (pendingSeekMillis consommé
      // une seule fois au démarrage effectif).
      this.pendingSeekMillis = clamped;
    }

    this.emit({ positionMillis: clamped });
  };

  setVolume = async (volume: number) => {
    const clamped = Math.min(1, Math.max(0, volume));

    if (this.sound) {
      try {
        await this.sound.setVolumeAsync(clamped);
      } catch (error) {
        console.error('Volume change failed:', error);
      }
    }

    this.emit({ volume: clamped });
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

  /** « Ajouter à la file » : fin de la queue (+ fin d'ordre en shuffle). */
  addToQueue = (track: PlayerTrack): void => {
    if (!track?.id || !track?.title) {
      return;
    }

    const { queue, order } = this.state;
    const nextQueue = [...queue, track];
    const nextOrder =
      order && order.length === queue.length
        ? [...order, nextQueue.length - 1]
        : order;

    this.emit({ queue: nextQueue, order: nextOrder });
    this.persistSession();
    this.ensureAppStatePersistence();
  };

  /** « Lire ensuite » : inséré JUSTE après le morceau courant. */
  playNext = (track: PlayerTrack): void => {
    if (!track?.id || !track?.title) {
      return;
    }

    const { queue, order, index } = this.state;

    if (!queue.length || index < 0) {
      this.addToQueue(track); // pas de session : fin de file
      return;
    }

    const insertAt = index + 1;
    const nextQueue = [...queue];
    nextQueue.splice(insertAt, 0, track);

    let nextOrder = order;
    if (order && order.length === queue.length) {
      // Positions décalées hors de l'index inséré uniquement.
      nextOrder = order.map((pos) => (pos >= insertAt ? pos + 1 : pos));
      const pointer = nextOrder.indexOf(index);
      nextOrder.splice(pointer >= 0 ? pointer + 1 : 0, 0, insertAt);
    }

    this.emit({ queue: nextQueue, order: nextOrder });
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

    this.playToken += 1;
    this.failedKeys = new Set();
    await this.unloadCurrent();

    this.emit({
      queue,
      index,
      current: queue[index],
      status: 'idle',
      // L'ordre de lecture shuffle est REBATI (il n'est pas persisté) : file
      // originale intacte, courant épinglé — mêmes règles que playQueue().
      order: shuffle ? buildShuffledOrder(queue.length, index) : null,
      orderPointer: shuffle ? 0 : -1,
      shuffle,
      repeat: session.repeat,
      volume: session.volume,
      positionMillis: session.positionMillis,
      durationMillis: 0,
      resolved: null,
      notice: null,
    });

    this.pendingSeekMillis = Math.max(0, session.positionMillis);
    await this.playIndex(index);
  };

  stop = async () => {
    this.playToken += 1; // tout resolve en vol devient orphelin
    await this.unloadCurrent();
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
    this.failedKeys = new Set();
    this.pendingSeekMillis = 0;
    this.lastPersistedAt = 0;
    this.sessionDirty = false;
    this.state = { ...INITIAL_PLAYER_STATE };
    this.listeners.forEach((listener) => listener(this.state));
  };
}

export const melodixPlayer = new MelodixPlayer();
