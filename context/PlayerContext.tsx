import * as React from 'react';

import { INITIAL_PLAYER_STATE, melodixPlayer } from '@services';
import type { PlayerState, PlayerTrack, RepeatMode } from '@services';

export type PlayerContextType = PlayerState & {
  playQueue: (tracks: PlayerTrack[], startIndex?: number) => Promise<void>;
  playTrack: (track: PlayerTrack) => Promise<void>;
  playAtIndex: (index: number) => Promise<void>;
  togglePlayPause: () => Promise<void>;
  next: () => Promise<void>;
  previous: () => Promise<void>;
  seekTo: (positionMillis: number) => Promise<void>;
  setVolume: (volume: number) => Promise<void>;
  toggleShuffle: () => void;
  cycleRepeat: () => void;
  stop: () => Promise<void>;
  clearNotice: () => void;
  /** True while a playback session exists (players visible), whatever status. */
  hasActiveSession: boolean;
  /** Human name of the provider actually streaming the current track. */
  providerName: string | null;
};

const defaultActions = {
  playQueue: async () => {},
  playTrack: async () => {},
  playAtIndex: async () => {},
  togglePlayPause: async () => {},
  next: async () => {},
  previous: async () => {},
  seekTo: async () => {},
  setVolume: async () => {},
  toggleShuffle: () => {},
  cycleRepeat: () => {},
  stop: async () => {},
  clearNotice: () => {},
  hasActiveSession: false,
  providerName: null,
};

export const PlayerContext = React.createContext<PlayerContextType>({
  ...INITIAL_PLAYER_STATE,
  ...defaultActions,
});

export const PlayerProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, setState] = React.useState<PlayerState>(INITIAL_PLAYER_STATE);

  React.useEffect(() => melodixPlayer.subscribe(setState), []);

  const value = React.useMemo<PlayerContextType>(
    () => ({
      ...state,
      playQueue: melodixPlayer.playQueue,
      playTrack: melodixPlayer.playTrack,
      playAtIndex: melodixPlayer.playAtIndex,
      togglePlayPause: melodixPlayer.togglePlayPause,
      next: melodixPlayer.next,
      previous: melodixPlayer.previous,
      seekTo: melodixPlayer.seekTo,
      setVolume: melodixPlayer.setVolume,
      toggleShuffle: melodixPlayer.toggleShuffle,
      cycleRepeat: melodixPlayer.cycleRepeat,
      stop: melodixPlayer.stop,
      clearNotice: melodixPlayer.clearNotice,
      hasActiveSession: state.current !== null,
      providerName: state.resolved?.provider ?? null,
    }),
    [state]
  );

  return (
    <PlayerContext.Provider value={value}>{children}</PlayerContext.Provider>
  );
};

export const usePlayer = (): PlayerContextType => {
  const context = React.useContext(PlayerContext);

  if (context === null) {
    throw new Error('Failed to access player context: "context" is null');
  }

  return context;
};

// Re-export RepeatMode for consumers of the context.
export type { RepeatMode };
