import {
  INITIAL_SPOTIFY_WEB_STATE,
  normalizeSpotifyWebState,
  type SpotifyWebPlaybackInput,
} from './spotifyWebState';
import { classifySpotifyWebBridgeMessage } from './spotifyWebBridge';
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
  'ready' | 'state-updated' | 'error-updated' | 'ignored' | 'rejected';

/**
 * Isolated backend prototype. It is not selected by PlayerContext and cannot
 * alter the existing Audius -> YouTube engine or persisted playback session.
 */
export class SpotifyWebBackend implements PlaybackBackend {
  readonly id = 'spotify-web' as const;
  private state = INITIAL_SPOTIFY_WEB_STATE;
  private listeners = new Set<PlaybackBackendListener>();
  private runtime: SpotifyWebRuntimeCommands | null = null;
  private runtimeSession = 0;
  private commandSequence = 0;
  private bridgeReady = false;

  getState = (): PlaybackBackendState => this.state;

  subscribe = (listener: PlaybackBackendListener): (() => void) => {
    this.listeners.add(listener);
    listener(this.state);
    return () => this.listeners.delete(listener);
  };

  attachRuntime = (runtime: SpotifyWebRuntimeCommands | null): void => {
    this.runtime = runtime;
    this.runtimeSession += 1;
    this.commandSequence += 1;
    this.bridgeReady = false;
  };

  /** Starts a fresh document lifecycle and invalidates late messages/results. */
  beginRuntimeSession = (): number => {
    this.runtimeSession += 1;
    this.commandSequence += 1;
    this.bridgeReady = false;
    this.updateState({ status: 'loading' });
    return this.runtimeSession;
  };

  markRuntimeUnavailable = (
    session: number,
    errorCode: 'bridge_timeout' | 'renderer_destroyed'
  ): boolean => {
    if (session !== this.runtimeSession) return false;
    this.bridgeReady = false;
    this.commandSequence += 1;
    this.updateState({ status: 'error', errorCode });
    return true;
  };

  isBridgeReady = (): boolean => this.bridgeReady;

  updateState = (input: SpotifyWebPlaybackInput): void => {
    this.state = normalizeSpotifyWebState(input);
    this.listeners.forEach((listener) => listener(this.state));
  };

  /** Accepts validated protocol data without ever logging the raw envelope. */
  receiveBridgeMessage = (raw: unknown): SpotifyWebBridgeResult => {
    const result = classifySpotifyWebBridgeMessage(raw);
    if (result.kind === 'ignored') return 'ignored';
    if (result.kind === 'rejected') return 'rejected';
    const { message } = result;
    if (message.type === 'ready') {
      this.bridgeReady = true;
      return 'ready';
    }
    // A document must complete the versioned handshake before it can mutate
    // player state. This rejects delayed messages from a destroyed renderer.
    if (!this.bridgeReady) return 'rejected';
    if (message.type === 'state') {
      this.updateState(message.payload);
      return 'state-updated';
    }
    this.updateState({ status: 'error', errorCode: message.code });
    return 'error-updated';
  };

  private runLatestCommand = async (
    invoke: (runtime: SpotifyWebRuntimeCommands) => Promise<boolean>
  ): Promise<boolean> => {
    const runtime = this.runtime;
    if (!runtime || !this.bridgeReady) return false;
    const sequence = ++this.commandSequence;
    const session = this.runtimeSession;
    try {
      const accepted = await invoke(runtime);
      return (
        accepted === true &&
        sequence === this.commandSequence &&
        session === this.runtimeSession &&
        runtime === this.runtime
      );
    } catch {
      return false;
    }
  };

  play = async (): Promise<boolean> =>
    this.runLatestCommand((runtime) => runtime.play());

  pause = async (): Promise<boolean> =>
    this.runLatestCommand((runtime) => runtime.pause());

  seek = async (positionMillis: number): Promise<boolean> => {
    if (!Number.isFinite(positionMillis) || positionMillis < 0) return false;
    return this.runLatestCommand((runtime) => runtime.seek(positionMillis));
  };

  next = async (): Promise<boolean> =>
    this.runLatestCommand((runtime) => runtime.next());

  previous = async (): Promise<boolean> =>
    this.runLatestCommand((runtime) => runtime.previous());

  destroy = (): void => {
    this.runtime = null;
    this.runtimeSession += 1;
    this.commandSequence += 1;
    this.bridgeReady = false;
    this.listeners.clear();
    this.state = INITIAL_SPOTIFY_WEB_STATE;
  };
}
