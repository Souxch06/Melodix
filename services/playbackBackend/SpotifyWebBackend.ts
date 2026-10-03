import {
  INITIAL_SPOTIFY_WEB_STATE,
  normalizeSpotifyWebState,
  type SpotifyWebPlaybackInput,
} from './spotifyWebState';
import { parseSpotifyWebBridgeMessage } from './spotifyWebBridge';
import type {
  PlaybackBackend,
  PlaybackBackendListener,
  PlaybackBackendState,
} from './types';

export type SpotifyWebRuntimeCommands = {
  play: () => Promise<boolean>;
  pause: () => Promise<boolean>;
  seek: (positionMillis: number) => Promise<boolean>;
  next: () => Promise<boolean>;
  previous: () => Promise<boolean>;
};

export type SpotifyWebBridgeResult =
  | 'ready'
  | 'state-updated'
  | 'error-updated'
  | 'rejected';

/**
 * Isolated backend prototype. It is not selected by PlayerContext and cannot
 * alter the existing Audius -> YouTube engine or persisted playback session.
 */
export class SpotifyWebBackend implements PlaybackBackend {
  readonly id = 'spotify-web' as const;
  private state = INITIAL_SPOTIFY_WEB_STATE;
  private listeners = new Set<PlaybackBackendListener>();
  private runtime: SpotifyWebRuntimeCommands | null = null;

  getState = (): PlaybackBackendState => this.state;

  subscribe = (listener: PlaybackBackendListener): (() => void) => {
    this.listeners.add(listener);
    listener(this.state);
    return () => this.listeners.delete(listener);
  };

  attachRuntime = (runtime: SpotifyWebRuntimeCommands | null): void => {
    this.runtime = runtime;
  };

  updateState = (input: SpotifyWebPlaybackInput): void => {
    this.state = normalizeSpotifyWebState(input);
    this.listeners.forEach((listener) => listener(this.state));
  };

  /** Accepts validated protocol data without ever logging the raw envelope. */
  receiveBridgeMessage = (raw: unknown): SpotifyWebBridgeResult => {
    const message = parseSpotifyWebBridgeMessage(raw);
    if (!message) return 'rejected';
    if (message.type === 'ready') return 'ready';
    if (message.type === 'state') {
      this.updateState(message.payload);
      return 'state-updated';
    }
    this.updateState({ status: 'error', errorCode: message.code });
    return 'error-updated';
  };

  play = async (): Promise<boolean> => (await this.runtime?.play()) ?? false;

  pause = async (): Promise<boolean> => (await this.runtime?.pause()) ?? false;

  seek = async (positionMillis: number): Promise<boolean> => {
    if (!Number.isFinite(positionMillis) || positionMillis < 0) return false;
    return (await this.runtime?.seek(positionMillis)) ?? false;
  };

  next = async (): Promise<boolean> => (await this.runtime?.next()) ?? false;

  previous = async (): Promise<boolean> =>
    (await this.runtime?.previous()) ?? false;

  destroy = (): void => {
    this.runtime = null;
    this.listeners.clear();
    this.state = INITIAL_SPOTIFY_WEB_STATE;
  };
}
