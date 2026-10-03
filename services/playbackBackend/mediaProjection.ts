import type { MediaSessionPayload } from '../../modules/melodix-media';
import type { PlaybackBackendState } from './types';

/**
 * Pure future projection point for Media3. Not connected in phase one: the
 * production mediaBridge continues to follow melodixPlayer exclusively.
 */
export const buildBackendMediaSessionPayload = (
  state: PlaybackBackendState
): MediaSessionPayload | null => {
  if (!state.trackId || !state.title) return null;
  const duration =
    Number.isFinite(state.durationMillis) && state.durationMillis >= 0
      ? state.durationMillis
      : 0;
  const rawPosition =
    Number.isFinite(state.positionMillis) && state.positionMillis >= 0
      ? state.positionMillis
      : 0;
  return {
    trackId: state.trackId,
    title: state.title,
    artist: state.artist ?? '',
    album: null,
    artworkUrl: state.artworkUrl,
    durationMillis: duration,
    positionMillis:
      duration > 0 ? Math.min(rawPosition, duration) : rawPosition,
    isPlaying: state.status === 'playing',
  };
};
