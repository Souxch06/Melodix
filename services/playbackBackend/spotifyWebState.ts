import type { PlaybackBackendState } from './types';

export type SpotifyWebPlaybackInput = {
  status?: unknown;
  trackId?: unknown;
  title?: unknown;
  artists?: unknown;
  artworkUrl?: unknown;
  durationMillis?: unknown;
  positionMillis?: unknown;
  isPlaying?: unknown;
  isLoading?: unknown;
  errorCode?: unknown;
};

const finiteNonNegative = (value: unknown): number =>
  typeof value === 'number' && Number.isFinite(value) && value >= 0 ? value : 0;

const optionalText = (value: unknown, maxLength: number): string | null => {
  if (typeof value !== 'string') return null;
  const text = value.trim();
  return text ? text.slice(0, maxLength) : null;
};

const safeArtists = (value: unknown): string[] => {
  if (!Array.isArray(value)) return [];
  return value
    .slice(0, 20)
    .map((artist) => optionalText(artist, 256))
    .filter((artist): artist is string => artist !== null);
};

const safeArtwork = (value: unknown): string | null => {
  const text = optionalText(value, 2048);
  if (!text) return null;
  try {
    const parsed = new URL(text);
    return parsed.protocol === 'https:' ? text : null;
  } catch {
    return null;
  }
};

/** Pure, strict normalization before data can reach UI or MediaSession. */
export const normalizeSpotifyWebState = (
  input: SpotifyWebPlaybackInput
): PlaybackBackendState => {
  const inferredStatus =
    input.isLoading === true
      ? 'loading'
      : input.isPlaying === true
        ? 'playing'
        : input.isPlaying === false
          ? 'paused'
          : 'idle';
  const status =
    input.status === 'loading' ||
    input.status === 'playing' ||
    input.status === 'paused' ||
    input.status === 'error'
      ? input.status
      : inferredStatus;
  const durationMillis = finiteNonNegative(input.durationMillis);
  const rawPosition = finiteNonNegative(input.positionMillis);

  return {
    backendId: 'spotify-web',
    status,
    trackId: optionalText(input.trackId, 256),
    title: optionalText(input.title, 512),
    artists: safeArtists(input.artists),
    artworkUrl: safeArtwork(input.artworkUrl),
    durationMillis,
    positionMillis:
      durationMillis > 0 ? Math.min(rawPosition, durationMillis) : rawPosition,
    isPlaying: status === 'playing',
    isLoading: status === 'loading',
    errorCode:
      status === 'error'
        ? (optionalText(input.errorCode, 64) ?? 'unknown')
        : null,
  };
};

export const INITIAL_SPOTIFY_WEB_STATE = normalizeSpotifyWebState({});
