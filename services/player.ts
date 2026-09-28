import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  DEFAULT_AUDIO_PROVIDER_ID,
  getAudioProvider,
  MATCH_CACHE_STORAGE_KEY,
} from './audio';
import type { AudioProvider, ResolvedStream, TrackSource } from './audio';
import { recordPlay } from './history/playHistory';
import {
  loadMatchCache,
  persistMatchCache,
  writeMatchCacheEntry,
} from './audio/matchCache';
import type { MatchCache } from './audio/matchCache';

/**
 * Melodix player engine.
 *
 * Queues mixes tracks from different sources: a track described by Spotify
 * metadata carries `{ provider: null }` and is MATCHED to the default audio
 * provider (Audius) at play time; a track already attached to a provider id
 * is streamed directly. When a track has no reliable match — or its stream
 * fails — the player reports a notice, marks the track as failed for this
 * session and skips to the next playable one. It never substitutes a wrong
 * track.
 */

export type PlayerTrack = {
  /** Logical id for the UI ('spotify:<id>' / 'audius:<id>' keys the cache). */
  id: string;
  title: string;
  artists: string[];
  album?: string | null;
  durationMillis?: number | null;
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
  private matchCache: MatchCache | null = null;
  private failedKeys = new Set<string>();

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
      staysActiveInBackground: true,
      shouldDuckAndroid: true,
      playThroughEarpieceAndroid: false,
    });

    this.audioModeReady = true;
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

  private onPlaybackStatusUpdate = (status: AvPlaybackStatus) => {
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

    if (status?.didJustFinish) {
      void this.advanceAuto();
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
  ): Promise<{ provider: AudioProvider; resolved: ResolvedStream; info: ResolverInfo } | null> => {
    const provider = getAudioProvider(
      track.source.provider ?? DEFAULT_AUDIO_PROVIDER_ID
    );

    // Native provider track: stream directly, no matching involved.
    if (track.source.provider) {
      const resolved = await provider.resolveSource(track.source.id);

      return resolved
        ? {
            provider,
            resolved,
            info: {
              provider: provider.displayName,
              sourceId: track.source.id,
              score: 1,
            },
          }
        : null;
    }

    // Metadata-only track: check the decision cache first.
    const cache = await this.ensureCache();
    const cached = cache[track.id];
    let matchId: string | null = null;
    let score = 0;

    if (cached) {
      if (cached.matchId === null) {
        return null; // Known negative: never searched again pointlessly.
      }

      matchId = cached.matchId;
      score = cached.score;
    } else {
      const match = await provider.resolveMatch({
        title: track.title,
        artists: track.artists,
        album: track.album ?? null,
        durationMillis: track.durationMillis ?? null,
      });

      matchId = match?.sourceId ?? null;
      score = Math.round((match?.score ?? 0) * 100);
      writeMatchCacheEntry(cache, track.source, matchId, score);
      void persistMatchCache(cache);
    }

    if (!matchId) {
      return null;
    }

    const resolved = await provider.resolveSource(matchId);

    if (resolved) {
      return {
        provider,
        resolved,
        info: { provider: provider.displayName, sourceId: matchId, score },
      };
    }

    // Cached match whose stream is dead: drop the entry and re-search once.
    if (cached) {
      delete cache[track.id];
      void persistMatchCache(cache);

      const match = await provider.resolveMatch({
        title: track.title,
        artists: track.artists,
        album: track.album ?? null,
        durationMillis: track.durationMillis ?? null,
      });

      writeMatchCacheEntry(cache, track.source, match?.sourceId ?? null, Math.round((match?.score ?? 0) * 100));
      void persistMatchCache(cache);

      if (!match) {
        return null;
      }

      const retry = await provider.resolveSource(match.sourceId);

      return retry
        ? {
            provider,
            resolved: retry,
            info: {
              provider: provider.displayName,
              sourceId: match.sourceId,
              score: Math.round(match.score * 100),
            },
          }
        : null;
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

    await this.unloadCurrent();
    this.failedKeys = new Set();
    this.emit({
      queue,
      index,
      current: queue[index],
      status: 'loading',
      order: this.state.shuffle ? buildShuffledOrder(queue.length, index) : null,
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

    this.emit({ index, current: track, status: 'loading' });

    const av = this.getAv();

    if (!av?.Audio) {
      this.emit({ status: 'unavailable' });
      return;
    }

    try {
      const result = await this.resolveTrack(track);

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
      await this.unloadCurrent();
      const { sound } = await av.Audio.Sound.createAsync(
        { uri: result.resolved.uri },
        {
          shouldPlay: true,
          progressUpdateIntervalMillis: 500,
          volume: this.state.volume,
        },
        this.onPlaybackStatusUpdate
      );

      // The user may have skipped to another track while this one was loading.
      if (
        this.state.current?.id !== track.id ||
        this.state.status !== 'loading'
      ) {
        await sound.unloadAsync();
        return;
      }

      this.sound = sound;
      this.emit({
        status: 'playing',
        resolved: result.info,
        // La notice d'un titre sauté n'est PAS effacée ici : le bandeau du
        // lecteur (mini/plein) la montre puis l'expire via clearNotice().
        durationMillis: track.durationMillis ?? this.state.durationMillis,
      });

      // Historique de lecture LOCAL (sans compte) : alimente les sections
      // « Écoutés récemment », « en tête », seeds de recommandations.
      // Fire-and-forget : l'historique ne doit jamais perturber la lecture.
      void recordPlay(
        {
          id: track.id,
          title: track.title,
          subtitle: track.artists.join(', '),
          imageURL: track.imageURL || undefined,
        },
        { albumTitle: track.album ?? undefined }
      ).catch(() => undefined);
    } catch (error) {
      console.error(`Failed to play "${track.title}" (${track.id}):`, error);

      if (this.state.current?.id === track.id) {
        this.markFailed(track, 'play-failed');
        await this.unloadCurrent();
        await this.advanceAfterFailure();
      }
    }
  };

  togglePlayPause = async () => {
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

  clearNotice = () => {
    if (this.state.notice) {
      this.emit({ notice: null });
    }
  };

  stop = async () => {
    await this.unloadCurrent();
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
    this.state = { ...INITIAL_PLAYER_STATE };
    this.listeners.forEach((listener) => listener(this.state));
  };
}

export const melodixPlayer = new MelodixPlayer();
