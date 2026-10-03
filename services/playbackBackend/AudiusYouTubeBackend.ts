import { melodixPlayer } from '../player';
import type { PlayerState } from '../player';
import type {
  PlaybackBackend,
  PlaybackBackendListener,
  PlaybackBackendState,
} from './types';

const normalizeExistingState = (state: PlayerState): PlaybackBackendState => ({
  backendId: 'audius-youtube',
  status:
    state.status === 'unavailable'
      ? 'error'
      : state.status === 'idle' ||
          state.status === 'loading' ||
          state.status === 'playing' ||
          state.status === 'paused' ||
          state.status === 'error'
        ? state.status
        : 'error',
  trackId: state.current?.id ?? null,
  title: state.current?.title ?? null,
  artists: state.current?.artists ?? [],
  artworkUrl: state.current?.imageURL || null,
  durationMillis:
    Number.isFinite(state.durationMillis) && state.durationMillis >= 0
      ? state.durationMillis
      : 0,
  positionMillis:
    Number.isFinite(state.positionMillis) && state.positionMillis >= 0
      ? state.positionMillis
      : 0,
  isPlaying: state.status === 'playing',
  isLoading: state.status === 'loading' || state.buffering,
  errorCode:
    state.status === 'error' || state.status === 'unavailable'
      ? state.status
      : null,
});

/** Adapter only: the existing engine remains the sole production backend. */
export class AudiusYouTubeBackend implements PlaybackBackend {
  readonly id = 'audius-youtube' as const;

  getState = (): PlaybackBackendState =>
    normalizeExistingState(melodixPlayer.getState());

  subscribe = (listener: PlaybackBackendListener): (() => void) =>
    melodixPlayer.subscribe((state) => listener(normalizeExistingState(state)));

  play = async (): Promise<boolean> => {
    const before = melodixPlayer.getState().status;
    if (before !== 'playing') await melodixPlayer.togglePlayPause();
    return melodixPlayer.getState().status === 'playing';
  };

  pause = async (): Promise<boolean> => {
    if (melodixPlayer.getState().status === 'playing') {
      await melodixPlayer.togglePlayPause();
    }
    return melodixPlayer.getState().status === 'paused';
  };

  seek = async (positionMillis: number): Promise<boolean> => {
    if (
      !Number.isFinite(positionMillis) ||
      positionMillis < 0 ||
      !melodixPlayer.getState().current
    ) {
      return false;
    }
    await melodixPlayer.seekTo(positionMillis);
    return true;
  };

  next = async (): Promise<boolean> => {
    if (!melodixPlayer.getState().current) return false;
    await melodixPlayer.next();
    return true;
  };

  previous = async (): Promise<boolean> => {
    if (!melodixPlayer.getState().current) return false;
    await melodixPlayer.previous();
    return true;
  };

  destroy = (): void => undefined;
}
