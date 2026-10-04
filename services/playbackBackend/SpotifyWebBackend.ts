import {
  buildSpotifyWebBridgeCommandMessage,
  classifySpotifyWebBridgeMessage,
  type SpotifyWebBridgeCommandName,
  type SpotifyWebRuntimeCapabilities,
} from './spotifyWebBridge';
import {
  INITIAL_SPOTIFY_WEB_STATE,
  mapSpotifyWebBridgePayload,
  normalizeSpotifyWebState,
  type SpotifyWebPlaybackInput,
} from './spotifyWebState';
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
  /** Only meaningful on protocol v2; legacy adapters may omit it. */
  toggle?: () => Promise<boolean>;
};

/**
 * Sends one already-serialized bridge envelope to the page (WebView
 * `postMessage`). Returning false means "not delivered" and fails the
 * correlated command immediately, without leaving a pending entry.
 */
export type SpotifyWebBridgeTransport = {
  send: (rawMessage: string) => boolean;
};

export type SpotifyWebCommandScheduler = {
  set: (callback: () => void, delayMs: number) => unknown;
  clear: (handle: unknown) => void;
};

export const DEFAULT_SPOTIFY_WEB_COMMAND_TIMEOUT_MS = 5_000;

export type SpotifyWebBackendOptions = {
  commandTimeoutMillis?: number;
  scheduler?: SpotifyWebCommandScheduler;
};

const defaultCommandScheduler: SpotifyWebCommandScheduler = {
  set: (callback, delayMs) => setTimeout(callback, delayMs),
  clear: (handle) => {
    clearTimeout(handle as ReturnType<typeof setTimeout>);
  },
};

export type SpotifyWebBridgeResult =
  | 'ready'
  | 'state-updated'
  | 'capabilities-updated'
  | 'error-updated'
  | 'command-response'
  | 'ignored'
  | 'rejected';

/**
 * Physical-test diagnostic of the last bridge command. `code` is always a
 * controlled safe identifier (never page content), used to distinguish an
 * honest page refusal from an expiry or a disconnection.
 */
export type SpotifyWebCommandOutcome = {
  accepted: boolean;
  code: string | null;
};

type PendingCommand = {
  sequence: number;
  session: number;
  settle: (accepted: boolean, code: string | null) => void;
};

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
  private capabilities: SpotifyWebRuntimeCapabilities | null = null;
  private bridgeTransport: SpotifyWebBridgeTransport | null = null;
  private pendingCommands = new Map<string, PendingCommand>();
  private requestSequence = 0;
  private lastCommandOutcome: SpotifyWebCommandOutcome | null = null;
  private lastStateSource: string | null = null;
  private readonly commandTimeoutMillis: number;
  private readonly scheduler: SpotifyWebCommandScheduler;

  constructor(options: SpotifyWebBackendOptions = {}) {
    this.commandTimeoutMillis =
      typeof options.commandTimeoutMillis === 'number' &&
      Number.isFinite(options.commandTimeoutMillis) &&
      options.commandTimeoutMillis > 0
        ? Math.trunc(options.commandTimeoutMillis)
        : DEFAULT_SPOTIFY_WEB_COMMAND_TIMEOUT_MS;
    this.scheduler = options.scheduler ?? defaultCommandScheduler;
  }

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
    this.capabilities = null;
    this.flushPendingCommands();
  };

  /**
   * Attaches the real WebView transport used to deliver v2 commands. Detaching
   * (or replacing) it settles every correlated pending command as refused:
   * nothing survives a bridge disconnection.
   */
  attachBridgeTransport = (
    transport: SpotifyWebBridgeTransport | null
  ): void => {
    this.bridgeTransport = transport;
    this.flushPendingCommands();
  };

  /** Starts a fresh document lifecycle and invalidates late messages/results. */
  beginRuntimeSession = (): number => {
    this.runtimeSession += 1;
    this.commandSequence += 1;
    this.bridgeReady = false;
    this.capabilities = null;
    this.lastStateSource = null;
    this.flushPendingCommands();
    this.updateState({ status: 'loading' });
    return this.runtimeSession;
  };

  markRuntimeUnavailable = (
    session: number,
    errorCode: 'bridge_timeout' | 'renderer_destroyed'
  ): boolean => {
    if (session !== this.runtimeSession) return false;
    this.bridgeReady = false;
    this.capabilities = null;
    this.lastStateSource = null;
    this.commandSequence += 1;
    this.flushPendingCommands();
    this.updateState({ status: 'error', errorCode });
    return true;
  };

  isBridgeReady = (): boolean => this.bridgeReady;

  getRuntimeCapabilities = (): SpotifyWebRuntimeCapabilities | null =>
    this.capabilities ? { ...this.capabilities } : null;

  /** Last bridge command outcome for diagnostics (never any page content). */
  getLastCommandOutcome = (): SpotifyWebCommandOutcome | null =>
    this.lastCommandOutcome ? { ...this.lastCommandOutcome } : null;

  /**
   * Bounded `source` label of the last accepted state payload (e.g.
   * 'media-session'). Proves the state came from what the page published;
   * reset with every new document session.
   */
  getLastStateSource = (): string | null => this.lastStateSource;

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
      this.updateState(mapSpotifyWebBridgePayload(message.payload));
      const source = message.payload.source;
      this.lastStateSource =
        typeof source === 'string' ? source.slice(0, 64) : null;
      return 'state-updated';
    }
    if (message.type === 'capabilities') {
      this.capabilities = { ...message.payload };
      return 'capabilities-updated';
    }
    if (message.type === 'command-response') {
      const pending = this.pendingCommands.get(message.requestId);
      if (!pending) {
        // Unknown, duplicated or already-expired request: no side effect.
        return 'ignored';
      }
      this.pendingCommands.delete(message.requestId);
      const fresh =
        pending.session === this.runtimeSession &&
        pending.sequence === this.commandSequence;
      pending.settle(
        fresh && message.accepted === true,
        fresh ? (message.code ?? null) : 'stale'
      );
      return 'command-response';
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

  /**
   * Real correlated command: the promise resolves true only when the page
   * answers `accepted: true` for this exact request id, before expiry and on
   * the current session. It never mutates playback state — `playing` only
   * ever comes from a published Web Player state message.
   */
  private beginBridgeCommand = (
    command: SpotifyWebBridgeCommandName,
    positionMillis?: number
  ): Promise<boolean> => {
    const transport = this.bridgeTransport;
    if (!transport || !this.bridgeReady) {
      this.lastCommandOutcome = {
        accepted: false,
        code: this.bridgeReady ? 'transport-unavailable' : 'bridge-unavailable',
      };
      return Promise.resolve(false);
    }
    const requestId = `c${++this.requestSequence}`;
    const raw = buildSpotifyWebBridgeCommandMessage(
      command,
      requestId,
      positionMillis
    );
    if (raw === null) {
      this.lastCommandOutcome = { accepted: false, code: 'invalid-command' };
      return Promise.resolve(false);
    }
    return new Promise<boolean>((resolve) => {
      const sequence = ++this.commandSequence;
      const session = this.runtimeSession;
      let expiryTimer: unknown = null;
      let settled = false;
      const settle = (accepted: boolean, code: string | null): void => {
        if (settled) return;
        settled = true;
        this.pendingCommands.delete(requestId);
        if (expiryTimer !== null) {
          this.scheduler.clear(expiryTimer);
          expiryTimer = null;
        }
        this.lastCommandOutcome = { accepted: accepted === true, code };
        resolve(accepted === true);
      };
      this.pendingCommands.set(requestId, {
        sequence,
        session,
        settle,
      });
      // The expiry is armed before delivery so a response arriving
      // synchronously inside `send` cannot leak a live timer.
      expiryTimer = this.scheduler.set(
        () => settle(false, 'expired'),
        this.commandTimeoutMillis
      );
      let delivered = false;
      try {
        delivered = transport.send(raw) === true;
      } catch {
        delivered = false;
      }
      if (!delivered) settle(false, 'undelivered');
    });
  };

  private flushPendingCommands = (): void => {
    if (this.pendingCommands.size === 0) return;
    const pending = [...this.pendingCommands.values()];
    this.pendingCommands.clear();
    pending.forEach((entry) => entry.settle(false, 'disconnected'));
  };

  private runCommand = (
    name: SpotifyWebBridgeCommandName,
    invoke: (runtime: SpotifyWebRuntimeCommands) => Promise<boolean>,
    positionMillis?: number
  ): Promise<boolean> => {
    if (this.runtime) return this.runLatestCommand(invoke);
    return this.beginBridgeCommand(name, positionMillis);
  };

  play = async (): Promise<boolean> =>
    this.runCommand('play', (runtime) => runtime.play());

  pause = async (): Promise<boolean> =>
    this.runCommand('pause', (runtime) => runtime.pause());

  toggle = async (): Promise<boolean> => {
    if (this.runtime) {
      if (!this.runtime.toggle) return false;
      return this.runLatestCommand((runtime) => runtime.toggle!());
    }
    return this.runCommand('toggle', () => Promise.resolve(false));
  };

  seek = async (positionMillis: number): Promise<boolean> => {
    if (!Number.isFinite(positionMillis) || positionMillis < 0) return false;
    return this.runCommand(
      'seek',
      (runtime) => runtime.seek(positionMillis),
      positionMillis
    );
  };

  next = async (): Promise<boolean> =>
    this.runCommand('next', (runtime) => runtime.next());

  previous = async (): Promise<boolean> =>
    this.runCommand('previous', (runtime) => runtime.previous());

  destroy = (): void => {
    this.runtime = null;
    this.runtimeSession += 1;
    this.commandSequence += 1;
    this.bridgeReady = false;
    this.capabilities = null;
    this.bridgeTransport = null;
    this.lastStateSource = null;
    this.flushPendingCommands();
    // Purge the diagnostic after the settle pass: a teardown must not leave
    // a stale outcome behind for a future owner reusing this instance.
    this.lastCommandOutcome = null;
    this.listeners.clear();
    this.state = INITIAL_SPOTIFY_WEB_STATE;
  };
}
