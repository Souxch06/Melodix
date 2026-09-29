import * as React from 'react';

import {
  clearPlaybackSession,
  INITIAL_PLAYER_STATE,
  loadPlaybackSession,
  melodixPlayer,
} from '@services';
import type {
  PlaybackSession,
  PlayerState,
  PlayerTrack,
  RepeatMode,
} from '@services';

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
  /** File avancée (Phase 2) : ajout fin / lecture suivante / suppression. */
  addToQueue: (track: PlayerTrack) => void;
  playNext: (track: PlayerTrack) => void;
  removeFromQueue: (queueIndex: number) => void;
  moveInQueue: (from: number, to: number) => void;
  /** Session persistée VISIBLE (carte « Reprendre »), null sinon. */
  pendingRestore: PlaybackSession | null;
  /** Reprendre : restaure file/morceau/position puis joue — action explicite. */
  resumeSession: () => Promise<void>;
  /** Ignorer : supprime définitivement la session sauvegardée. */
  dismissSession: () => Promise<void>;
  cycleRepeat: () => void;
  /** Paramètres : activer/désactiver explicitement la répétition de la file. */
  setRepeat: (mode: RepeatMode) => void;
  /** Paramètres : lecture en arrière-plan (réglage appliqué au moteur expo-av). */
  setStaysActiveInBackground: (enabled: boolean) => Promise<void>;
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
  addToQueue: () => {},
  playNext: () => {},
  removeFromQueue: () => {},
  moveInQueue: () => {},
  pendingRestore: null,
  resumeSession: async () => {},
  dismissSession: async () => {},
  cycleRepeat: () => {},
  setRepeat: () => {},
  setStaysActiveInBackground: async () => {},
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
  const [pendingRestore, setPendingRestore] =
    React.useState<PlaybackSession | null>(null);

  React.useEffect(() => melodixPlayer.subscribe(setState), []);

  // Restauration au boot : la session persistée est SEULEMENT PROPOSÉE
  // (jamais lue automatiquement — pas d'audio sans action utilisateur).
  React.useEffect(() => {
    let isMounted = true;

    void loadPlaybackSession().then((session) => {
      if (isMounted && session) {
        setPendingRestore(session);
      }
    });

    return () => {
      isMounted = false;
    };
  }, []);

  // Dès qu'une autre lecture démarre, la carte « Reprendre » n'a plus lieu
  // d'exister (la nouvelle session recréera sa propre persistance).
  React.useEffect(() => {
    if (pendingRestore && state.status === 'playing') {
      setPendingRestore(null);
    }
  }, [pendingRestore, state.status]);

  const resumeSession = React.useCallback(async () => {
    setPendingRestore((current) => {
      if (current) {
        // Ferme la carte immédiatement, restaure côté moteur, purge après.
        void melodixPlayer.restoreSession(current);
        void clearPlaybackSession();
      }

      return null;
    });
  }, []);

  const dismissSession = React.useCallback(async () => {
    setPendingRestore(null);
    await clearPlaybackSession();
  }, []);

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
      addToQueue: melodixPlayer.addToQueue,
      playNext: melodixPlayer.playNext,
      removeFromQueue: melodixPlayer.removeFromQueue,
      moveInQueue: melodixPlayer.moveInQueue,
      pendingRestore,
      resumeSession,
      dismissSession,
      cycleRepeat: melodixPlayer.cycleRepeat,
      setRepeat: melodixPlayer.setRepeat,
      setStaysActiveInBackground: melodixPlayer.setStaysActiveInBackground,
      stop: melodixPlayer.stop,
      clearNotice: melodixPlayer.clearNotice,
      hasActiveSession: state.current !== null,
      providerName: state.resolved?.provider ?? null,
    }),
    [state, pendingRestore, resumeSession, dismissSession]
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
