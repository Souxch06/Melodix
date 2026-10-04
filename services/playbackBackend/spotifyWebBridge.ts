import type { SpotifyWebPlaybackInput } from './spotifyWebState';

/**
 * Versioned envelope protocol between the injected WebView bridge and Melodix.
 *
 * v1 semantics are frozen (existing guarantees): exact key sets, no unknown
 * fields, no raw logging. v2 is additive: extended playback statuses
 * (`buffering`, `ended`), a bounded `source` label on state payloads, a
 * `positionState` capability bit and correlated command responses
 * (`command-response`). Unknown versions stay rejected, malformed known
 * messages stay rejected, and future known-shape types stay ignored.
 */
export const SPOTIFY_WEB_BRIDGE_VERSION = 2 as const;
export const SPOTIFY_WEB_BRIDGE_SUPPORTED_VERSIONS = [1, 2] as const;
const MAX_MESSAGE_LENGTH = 32_768;

const SAFE_CODE_PATTERN = /^[a-z0-9_-]{1,64}$/i;
const SAFE_ID_PATTERN = /^[A-Za-z0-9_-]{1,40}$/;

export type SpotifyWebBridgeCommandName =
  | 'play'
  | 'pause'
  | 'toggle'
  | 'seek'
  | 'next'
  | 'previous';

export type SpotifyWebCommand =
  | { version: 1; command: 'play' | 'pause' | 'next' | 'previous' }
  | { version: 1; command: 'seek'; positionMillis: number }
  | {
      version: 2;
      requestId: string;
      command: 'play' | 'pause' | 'toggle' | 'next' | 'previous';
    }
  | { version: 2; requestId: string; command: 'seek'; positionMillis: number };

export type SpotifyWebRuntimeCapabilities = {
  mediaSession: boolean;
  eme: boolean;
  widevine: boolean;
  positionState?: boolean;
};

export type SpotifyWebBridgeMessage =
  | { version: 1 | 2; type: 'ready' }
  | { version: 1 | 2; type: 'state'; payload: SpotifyWebPlaybackInput }
  | {
      version: 1 | 2;
      type: 'capabilities';
      payload: SpotifyWebRuntimeCapabilities;
    }
  | { version: 1 | 2; type: 'error'; code: string }
  | {
      version: 2;
      type: 'command-response';
      requestId: string;
      accepted: boolean;
      code?: string;
    };

export type SpotifyWebBridgeParseResult =
  | { kind: 'accepted'; message: SpotifyWebBridgeMessage }
  | { kind: 'ignored' }
  | { kind: 'rejected' };

const isRecord = (value: unknown): value is Record<string, unknown> =>
  typeof value === 'object' && value !== null && !Array.isArray(value);

const hasOnlyKeys = (
  value: Record<string, unknown>,
  allowed: readonly string[]
): boolean => Object.keys(value).every((key) => allowed.includes(key));

const isOptionalText = (value: unknown, maxLength = 2048): boolean =>
  value === undefined ||
  (typeof value === 'string' && value.length <= maxLength);

const isOptionalFiniteNumber = (value: unknown): boolean =>
  value === undefined || (typeof value === 'number' && Number.isFinite(value));

const STATUS_KEYS_V1 = [
  'idle',
  'loading',
  'playing',
  'paused',
  'error',
] as const;
const STATUS_KEYS_V2 = [...STATUS_KEYS_V1, 'buffering', 'ended'] as const;

const PLAYBACK_PAYLOAD_KEYS_V1 = [
  'status',
  'trackId',
  'title',
  'artists',
  'artworkUrl',
  'durationMillis',
  'positionMillis',
  'isPlaying',
  'isLoading',
  'errorCode',
] as const;
const PLAYBACK_PAYLOAD_KEYS_V2 = [
  ...PLAYBACK_PAYLOAD_KEYS_V1,
  'source',
] as const;

const isPlaybackPayload = (
  value: Record<string, unknown>,
  extended: boolean
): value is SpotifyWebPlaybackInput => {
  if (
    !hasOnlyKeys(
      value,
      extended ? PLAYBACK_PAYLOAD_KEYS_V2 : PLAYBACK_PAYLOAD_KEYS_V1
    )
  ) {
    return false;
  }
  const statuses: readonly string[] = extended
    ? STATUS_KEYS_V2
    : STATUS_KEYS_V1;
  const validStatus =
    value.status === undefined ||
    (typeof value.status === 'string' && statuses.includes(value.status));
  const validArtists =
    value.artists === undefined ||
    (Array.isArray(value.artists) &&
      value.artists.length <= 20 &&
      value.artists.every(
        (artist) => typeof artist === 'string' && artist.length <= 256
      ));
  const validSource = !extended || isOptionalText(value.source, 64);
  return (
    validStatus &&
    validArtists &&
    validSource &&
    isOptionalText(value.trackId) &&
    isOptionalText(value.title) &&
    isOptionalText(value.artworkUrl) &&
    isOptionalText(value.errorCode) &&
    isOptionalFiniteNumber(value.durationMillis) &&
    isOptionalFiniteNumber(value.positionMillis) &&
    (value.isPlaying === undefined || typeof value.isPlaying === 'boolean') &&
    (value.isLoading === undefined || typeof value.isLoading === 'boolean')
  );
};

const CAPABILITY_KEYS_V1 = ['mediaSession', 'eme', 'widevine'] as const;
const CAPABILITY_KEYS_V2 = [...CAPABILITY_KEYS_V1, 'positionState'] as const;

/**
 * Strictly validates a runtime bridge envelope. Unknown fields are rejected so
 * cookies, tokens, credentials or arbitrary upstream payloads cannot cross the
 * boundary accidentally. No raw message is logged.
 */
export const parseSpotifyWebBridgeMessage = (
  raw: unknown
): SpotifyWebBridgeMessage | null => {
  if (
    typeof raw !== 'string' ||
    raw.length === 0 ||
    raw.length > MAX_MESSAGE_LENGTH
  ) {
    return null;
  }

  let value: unknown;
  try {
    value = JSON.parse(raw);
  } catch {
    return null;
  }
  if (!isRecord(value) || (value.version !== 1 && value.version !== 2)) {
    return null;
  }
  const version = value.version as 1 | 2;
  const extended = version === 2;

  if (value.type === 'ready' && hasOnlyKeys(value, ['version', 'type'])) {
    return { version, type: 'ready' };
  }
  if (
    value.type === 'state' &&
    hasOnlyKeys(value, ['version', 'type', 'payload']) &&
    isRecord(value.payload) &&
    isPlaybackPayload(value.payload, extended)
  ) {
    return { version, type: 'state', payload: value.payload };
  }
  if (
    value.type === 'capabilities' &&
    hasOnlyKeys(value, ['version', 'type', 'payload']) &&
    isRecord(value.payload) &&
    hasOnlyKeys(
      value.payload,
      extended ? CAPABILITY_KEYS_V2 : CAPABILITY_KEYS_V1
    ) &&
    typeof value.payload.mediaSession === 'boolean' &&
    typeof value.payload.eme === 'boolean' &&
    typeof value.payload.widevine === 'boolean' &&
    (value.payload.positionState === undefined ||
      typeof value.payload.positionState === 'boolean')
  ) {
    const capabilities: SpotifyWebRuntimeCapabilities = {
      mediaSession: value.payload.mediaSession,
      eme: value.payload.eme,
      widevine: value.payload.widevine,
    };
    if (extended && typeof value.payload.positionState === 'boolean') {
      capabilities.positionState = value.payload.positionState;
    }
    return { version, type: 'capabilities', payload: capabilities };
  }
  if (
    value.type === 'error' &&
    hasOnlyKeys(value, ['version', 'type', 'code']) &&
    typeof value.code === 'string' &&
    SAFE_CODE_PATTERN.test(value.code)
  ) {
    return { version, type: 'error', code: value.code };
  }
  if (
    extended &&
    value.type === 'command-response' &&
    hasOnlyKeys(value, ['version', 'type', 'requestId', 'accepted', 'code']) &&
    typeof value.requestId === 'string' &&
    SAFE_ID_PATTERN.test(value.requestId) &&
    typeof value.accepted === 'boolean' &&
    (value.code === undefined ||
      (typeof value.code === 'string' && SAFE_CODE_PATTERN.test(value.code)))
  ) {
    const message: SpotifyWebBridgeMessage = {
      version: 2,
      type: 'command-response',
      requestId: value.requestId,
      accepted: value.accepted,
      ...(typeof value.code === 'string' ? { code: value.code } : {}),
    };
    return message;
  }
  return null;
};

/**
 * Distinguishes forward-compatible unknown message types from malformed known
 * messages. Neither branch exposes or logs the raw payload.
 */
const KNOWN_TYPES_V1 = ['ready', 'state', 'capabilities', 'error'] as const;
const KNOWN_TYPES_V2 = [...KNOWN_TYPES_V1, 'command-response'] as const;

export const classifySpotifyWebBridgeMessage = (
  raw: unknown
): SpotifyWebBridgeParseResult => {
  const message = parseSpotifyWebBridgeMessage(raw);
  if (message) return { kind: 'accepted', message };
  if (
    typeof raw !== 'string' ||
    raw.length === 0 ||
    raw.length > MAX_MESSAGE_LENGTH
  ) {
    return { kind: 'rejected' };
  }
  try {
    const value: unknown = JSON.parse(raw);
    if (
      isRecord(value) &&
      (value.version === 1 || value.version === 2) &&
      typeof value.type === 'string'
    ) {
      const known: readonly string[] =
        value.version === 2 ? KNOWN_TYPES_V2 : KNOWN_TYPES_V1;
      if (!known.includes(value.type)) {
        return { kind: 'ignored' };
      }
    }
  } catch {
    // Malformed JSON is rejected below.
  }
  return { kind: 'rejected' };
};

/**
 * Parses a control command envelope (RN-side contract, also usable by any
 * future native transport). v1 keeps its frozen shape; v2 adds `toggle` and
 * a strict request id used for response correlation.
 */
export const parseSpotifyWebCommand = (
  value: unknown
): SpotifyWebCommand | null => {
  if (!isRecord(value) || (value.version !== 1 && value.version !== 2)) {
    return null;
  }
  const version = value.version as 1 | 2;
  if (version === 1) {
    if (
      (value.command === 'play' ||
        value.command === 'pause' ||
        value.command === 'next' ||
        value.command === 'previous') &&
      hasOnlyKeys(value, ['version', 'command'])
    ) {
      return { version: 1, command: value.command };
    }
    if (
      value.command === 'seek' &&
      hasOnlyKeys(value, ['version', 'command', 'positionMillis']) &&
      typeof value.positionMillis === 'number' &&
      Number.isFinite(value.positionMillis) &&
      value.positionMillis >= 0
    ) {
      return {
        version: 1,
        command: 'seek',
        positionMillis: value.positionMillis,
      };
    }
    return null;
  }
  if (
    typeof value.requestId !== 'string' ||
    !SAFE_ID_PATTERN.test(value.requestId)
  ) {
    return null;
  }
  const requestId = value.requestId;
  // Outbound wire envelopes carry the constant `type: 'command'`; the
  // command contract accepts it but never propagates unknown fields.
  if (value.type !== undefined && value.type !== 'command') {
    return null;
  }
  if (
    (value.command === 'play' ||
      value.command === 'pause' ||
      value.command === 'toggle' ||
      value.command === 'next' ||
      value.command === 'previous') &&
    hasOnlyKeys(value, ['version', 'type', 'command', 'requestId'])
  ) {
    return { version: 2, requestId, command: value.command };
  }
  if (
    value.command === 'seek' &&
    hasOnlyKeys(value, [
      'version',
      'type',
      'command',
      'requestId',
      'positionMillis',
    ]) &&
    typeof value.positionMillis === 'number' &&
    Number.isFinite(value.positionMillis) &&
    value.positionMillis >= 0
  ) {
    return {
      version: 2,
      requestId,
      command: 'seek',
      positionMillis: value.positionMillis,
    };
  }
  return null;
};

/**
 * Builds the exact outbound command envelope sent to the page. Returns null
 * for any input that would produce an out-of-contract message, so callers can
 * never leak a malformed or oversized payload into the WebView.
 */
export const buildSpotifyWebBridgeCommandMessage = (
  command: SpotifyWebBridgeCommandName,
  requestId: string,
  positionMillis?: number
): string | null => {
  if (!SAFE_ID_PATTERN.test(requestId)) return null;
  if (command === 'seek') {
    if (
      typeof positionMillis !== 'number' ||
      !Number.isFinite(positionMillis) ||
      positionMillis < 0
    ) {
      return null;
    }
    return JSON.stringify({
      version: SPOTIFY_WEB_BRIDGE_VERSION,
      type: 'command',
      requestId,
      command,
      positionMillis,
    });
  }
  if (positionMillis !== undefined) return null;
  if (
    command !== 'play' &&
    command !== 'pause' &&
    command !== 'toggle' &&
    command !== 'next' &&
    command !== 'previous'
  ) {
    return null;
  }
  return JSON.stringify({
    version: SPOTIFY_WEB_BRIDGE_VERSION,
    type: 'command',
    requestId,
    command,
  });
};
