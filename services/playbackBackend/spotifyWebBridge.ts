import type { SpotifyWebPlaybackInput } from './spotifyWebState';

export const SPOTIFY_WEB_BRIDGE_VERSION = 1 as const;
const MAX_MESSAGE_LENGTH = 32_768;

export type SpotifyWebCommand =
  | { version: 1; command: 'play' }
  | { version: 1; command: 'pause' }
  | { version: 1; command: 'seek'; positionMillis: number }
  | { version: 1; command: 'next' }
  | { version: 1; command: 'previous' };

export type SpotifyWebBridgeMessage =
  | { version: 1; type: 'ready' }
  | { version: 1; type: 'state'; payload: SpotifyWebPlaybackInput }
  | { version: 1; type: 'error'; code: string };

const isRecord = (value: unknown): value is Record<string, unknown> =>
  typeof value === 'object' && value !== null && !Array.isArray(value);

const hasOnlyKeys = (
  value: Record<string, unknown>,
  allowed: readonly string[]
): boolean => Object.keys(value).every((key) => allowed.includes(key));

const isOptionalText = (value: unknown): boolean =>
  value === undefined || (typeof value === 'string' && value.length <= 2048);

const isOptionalFiniteNumber = (value: unknown): boolean =>
  value === undefined || (typeof value === 'number' && Number.isFinite(value));

const isPlaybackPayload = (
  value: Record<string, unknown>
): value is SpotifyWebPlaybackInput => {
  if (
    !hasOnlyKeys(value, [
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
    ])
  ) {
    return false;
  }
  const validStatus =
    value.status === undefined ||
    value.status === 'idle' ||
    value.status === 'loading' ||
    value.status === 'playing' ||
    value.status === 'paused' ||
    value.status === 'error';
  const validArtists =
    value.artists === undefined ||
    (Array.isArray(value.artists) &&
      value.artists.length <= 20 &&
      value.artists.every(
        (artist) => typeof artist === 'string' && artist.length <= 256
      ));
  return (
    validStatus &&
    validArtists &&
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

export const parseSpotifyWebCommand = (
  value: unknown
): SpotifyWebCommand | null => {
  if (!isRecord(value) || value.version !== SPOTIFY_WEB_BRIDGE_VERSION) {
    return null;
  }
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
};

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
  if (!isRecord(value) || value.version !== SPOTIFY_WEB_BRIDGE_VERSION) {
    return null;
  }

  if (value.type === 'ready' && hasOnlyKeys(value, ['version', 'type'])) {
    return { version: 1, type: 'ready' };
  }
  if (
    value.type === 'state' &&
    hasOnlyKeys(value, ['version', 'type', 'payload']) &&
    isRecord(value.payload) &&
    isPlaybackPayload(value.payload)
  ) {
    return { version: 1, type: 'state', payload: value.payload };
  }
  if (
    value.type === 'error' &&
    hasOnlyKeys(value, ['version', 'type', 'code']) &&
    typeof value.code === 'string' &&
    /^[a-z0-9_-]{1,64}$/i.test(value.code)
  ) {
    return { version: 1, type: 'error', code: value.code };
  }
  return null;
};
