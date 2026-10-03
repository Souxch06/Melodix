import type { SpotifyWebPlaybackInput } from './spotifyWebState';

export type SpotifyWebCommand = { command: 'play' } | { command: 'pause' };

export const parseSpotifyWebCommand = (
  value: unknown
): SpotifyWebCommand | null => {
  if (!isRecord(value)) return null;
  if (value.command === 'play' || value.command === 'pause') {
    return { command: value.command };
  }
  return null;
};

export type SpotifyWebBridgeMessage =
  | { type: 'ready'; version: 1 }
  | { type: 'state'; payload: SpotifyWebPlaybackInput }
  | { type: 'error'; code: string };

const isRecord = (value: unknown): value is Record<string, unknown> =>
  typeof value === 'object' && value !== null && !Array.isArray(value);

/**
 * Validates a future runtime bridge envelope. This parser is deliberately not
 * connected to DOM scraping or credential/cookie extraction in phase one.
 */
export const parseSpotifyWebBridgeMessage = (
  raw: unknown
): SpotifyWebBridgeMessage | null => {
  if (typeof raw !== 'string' || raw.length === 0 || raw.length > 32_768) {
    return null;
  }

  let value: unknown;
  try {
    value = JSON.parse(raw);
  } catch {
    return null;
  }
  if (!isRecord(value)) return null;

  if (value.type === 'ready' && value.version === 1) {
    return { type: 'ready', version: 1 };
  }
  if (value.type === 'state' && isRecord(value.payload)) {
    return { type: 'state', payload: value.payload };
  }
  if (
    value.type === 'error' &&
    typeof value.code === 'string' &&
    /^[a-z0-9_-]{1,64}$/i.test(value.code)
  ) {
    return { type: 'error', code: value.code };
  }
  return null;
};
