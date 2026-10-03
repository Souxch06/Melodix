export type PlaybackBackendId = 'audius-youtube' | 'spotify-web';

export type PlaybackBackendStatus =
  | 'idle'
  | 'loading'
  | 'playing'
  | 'paused'
  | 'error';

export type PlaybackBackendState = {
  backendId: PlaybackBackendId;
  status: PlaybackBackendStatus;
  trackId: string | null;
  title: string | null;
  artists: string[];
  artworkUrl: string | null;
  durationMillis: number;
  positionMillis: number;
  isPlaying: boolean;
  isLoading: boolean;
  errorCode: string | null;
};

export type PlaybackBackendListener = (state: PlaybackBackendState) => void;

/**
 * Boundary between Melodix UI / MediaSession commands and a playback engine.
 * The existing PlayerContext is intentionally not migrated in this prototype.
 */
export interface PlaybackBackend {
  readonly id: PlaybackBackendId;
  getState(): PlaybackBackendState;
  subscribe(listener: PlaybackBackendListener): () => void;
  play(): Promise<boolean>;
  pause(): Promise<boolean>;
  seek(positionMillis: number): Promise<boolean>;
  next(): Promise<boolean>;
  previous(): Promise<boolean>;
  destroy(): void;
}
