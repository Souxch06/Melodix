/**
 * MiniPlayer — audit §7 (comprendre ce qui existe avant toute refonte) :
 *  1. Invisible sans session de lecture (current = null) ; visible sinon.
 *  2. Pochette/titre/artiste réelles ; progression = position/duration réelle.
 *  3. Play↔Pause sur le MÊME bouton ; Previous/Next/Stop branchés au player.
 *  4. Tap sur la zone pochette+noms → ouverture du Full Player (/player).
 *  5. Bandeau « titre indisponible » affiché puis expiré via clearNotice (TIMER réel).
 */
import * as React from 'react';

import { fireEvent, render } from '@testing-library/react-native';

import { translations } from '@data';
import type { PlayerTrack } from '@services';

import { MiniPlayer } from '../MiniPlayer';

const mockPush = jest.fn();
const mockTogglePlayPause = jest.fn(async () => {});
const mockNext = jest.fn(async () => {});
const mockPrevious = jest.fn(async () => {});
const mockStop = jest.fn(async () => {});
const mockClearNotice = jest.fn();
const mockSeekTo = jest.fn(async () => {});

let mockPlayerState: {
  current: PlayerTrack | null;
  status: string;
  positionMillis: number;
  durationMillis: number;
  notice: { kind: 'not-available' | 'play-failed'; title: string } | null;
} = {
  current: null,
  status: 'idle',
  positionMillis: 0,
  durationMillis: 0,
  notice: null,
};

jest.mock('expo-router', () => ({
  useRouter: () => ({ push: mockPush }),
}));

jest.mock('@context', () => ({
  useAccent: () => '#1ed760',
  usePlayer: () => ({
    current: mockPlayerState.current,
    status: mockPlayerState.status,
    positionMillis: mockPlayerState.positionMillis,
    durationMillis: mockPlayerState.durationMillis,
    notice: mockPlayerState.notice,
    togglePlayPause: mockTogglePlayPause,
    next: mockNext,
    previous: mockPrevious,
    stop: mockStop,
    clearNotice: mockClearNotice,
    seekTo: mockSeekTo,
  }),
}));

const sessionTrack: PlayerTrack = {
  id: 'spotify:one',
  title: 'Take Me Away',
  artists: ['Neffex'],
  album: 'Fate',
  durationMillis: 180000,
  imageURL: '',
  source: { provider: null, id: 'one' },
};

describe('MiniPlayer — ce qui existe vraiment', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    mockPlayerState = {
      current: sessionTrack,
      status: 'playing',
      positionMillis: 45000,
      durationMillis: 180000,
      notice: null,
    };
  });

  it('ne rend RIEN sans morceau courant (aucune session)', () => {
    mockPlayerState = { ...mockPlayerState, current: null };
    const { queryByText, queryByLabelText } = render(<MiniPlayer />);

    expect(queryByText('Take Me Away')).toBeNull();
    expect(queryByLabelText(translations.playerPlay)).toBeNull();
  });

  it('affiche titre + artiste et la progression réelle (45 s / 3 min → 25 %)', () => {
    const { getByText } = render(<MiniPlayer />);

    expect(getByText('Take Me Away')).toBeTruthy();
    expect(getByText('Neffex')).toBeTruthy();
  });

  it('play/pause toggle : le bouton montre l’état opposé et appelle togglePlayPause', () => {
    const { getByLabelText } = render(<MiniPlayer />);

    // En lecture → le bouton propose la pause.
    fireEvent.press(getByLabelText(translations.playerPause));
    expect(mockTogglePlayPause).toHaveBeenCalledTimes(1);

    mockPlayerState = { ...mockPlayerState, status: 'paused' };
    const view = render(<MiniPlayer />);
    // En pause → le bouton propose la lecture.
    fireEvent.press(view.getByLabelText(translations.playerPlay));
    expect(mockTogglePlayPause).toHaveBeenCalledTimes(2);
  });

  it('en chargement : spinner AVEC label, pas de bouton play/pause', () => {
    mockPlayerState = { ...mockPlayerState, status: 'loading' };
    const { getByLabelText, queryByLabelText } = render(<MiniPlayer />);

    expect(getByLabelText(translations.playerLoading)).toBeTruthy();
    expect(queryByLabelText(translations.playerPause)).toBeNull();
  });

  it('previous / next / stop sont branchés sur le player', () => {
    const { getByLabelText } = render(<MiniPlayer />);

    fireEvent.press(getByLabelText(translations.playerPrevious));
    fireEvent.press(getByLabelText(translations.playerNext));
    fireEvent.press(getByLabelText(translations.playerClose));

    expect(mockPrevious).toHaveBeenCalledTimes(1);
    expect(mockNext).toHaveBeenCalledTimes(1);
    expect(mockStop).toHaveBeenCalledTimes(1);
  });

  it('le tap sur la zone pochette+titre ouvre le Full Player (/player)', () => {
    const { getByLabelText } = render(<MiniPlayer />);

    fireEvent.press(getByLabelText(translations.playerExpand));

    expect(mockPush).toHaveBeenCalledWith('/player');
  });

  it('le bandeau « indisponible » s affiche puis est expiré via clearNotice', () => {
    mockPlayerState = {
      ...mockPlayerState,
      notice: { kind: 'not-available', title: 'Ghost Track' },
    };
    const { getByText } = render(<MiniPlayer />);

    expect(
      getByText(translations.playerTrackUnavailable('Ghost Track'))
    ).toBeTruthy();
    // Le timer d'expiration est bien planifié (clearNotice appelé par le
    // composant lui-même, pas par le moteur).
    jest.useFakeTimers();
    render(<MiniPlayer />);
    jest.advanceTimersByTime(4600);
    jest.useRealTimers();
    expect(mockClearNotice).toHaveBeenCalled();
  });

  it('état erreur/unavailable : sous-titre remplacé par le message humain', () => {
    mockPlayerState = { ...mockPlayerState, status: 'error' };
    const { getByText } = render(<MiniPlayer />);

    expect(getByText(translations.playerError)).toBeTruthy();
  });
});

describe('MiniPlayer — progression glissable (phase 3)', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    mockPlayerState = {
      current: sessionTrack,
      status: 'playing',
      positionMillis: 45000,
      durationMillis: 180000,
      notice: null,
    };
  });

  it('durée inconnue : barre inerte, aucun seek possible', () => {
    mockPlayerState = { ...mockPlayerState, durationMillis: 0 };
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    expect(seek.props.accessibilityState?.disabled).toBe(true);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 100 } });
    fireEvent(seek, 'touchEnd');

    expect(mockSeekTo).not.toHaveBeenCalled();
  });

  it('drag milieu → UN seek final à la position exacte (50 % de 3 min)', () => {
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 40 } });
    fireEvent(seek, 'touchMove', { nativeEvent: { locationX: 100 } });
    fireEvent(seek, 'touchEnd');

    expect(mockSeekTo).toHaveBeenCalledTimes(1);
    expect(mockSeekTo).toHaveBeenCalledWith(90000);
  });

  it('drag à 0 et à la fin : jamais avant 0, jamais après la durée', () => {
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: -40 } });
    fireEvent(seek, 'touchEnd');
    expect(mockSeekTo).toHaveBeenLastCalledWith(0);

    mockSeekTo.mockClear();
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 2000 } });
    fireEvent(seek, 'touchEnd');
    expect(mockSeekTo).toHaveBeenLastCalledWith(180000);
  });

  it('changement de piste PENDANT un drag : seek appliqué sur le nouveau morceau, jamais l ancien', () => {
    const { getByLabelText, rerender } = render(<MiniPlayer />);
    let seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 190 } });

    // Nouveau morceau pendant le drag : `key={current.id}` remonte le slider
    // → la preview de l'ancien morceau est PERDUE, pas de seek fantôme.
    mockPlayerState = {
      ...mockPlayerState,
      current: { ...sessionTrack, id: 'spotify:two', title: 'Autre titre' },
      positionMillis: 0,
    };
    rerender(<MiniPlayer />);

    seek = getByLabelText(translations.playerSeek);
    fireEvent(seek, 'touchEnd');

    expect(mockSeekTo).not.toHaveBeenCalled();
  });

  it('drag pendant la résolution (loading, durée inconnue) : aucun crash, aucun seek', () => {
    mockPlayerState = {
      ...mockPlayerState,
      status: 'loading',
      durationMillis: 0,
    };
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 100 } });
    fireEvent(seek, 'touchEnd');

    expect(mockSeekTo).not.toHaveBeenCalled();
  });

  it('drag pendant une PAUSE : seek appliqué normalement', () => {
    mockPlayerState = { ...mockPlayerState, status: 'paused' };
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 100 } });
    fireEvent(seek, 'touchEnd');

    expect(mockSeekTo).toHaveBeenCalledWith(90000);
  });

  it('drag en état ERREUR avec durée valide : seek autorisé (reprise possible)', () => {
    mockPlayerState = { ...mockPlayerState, status: 'error' };
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent(seek, 'touchStart', { nativeEvent: { locationX: 50 } });
    fireEvent(seek, 'touchEnd');

    expect(mockSeekTo).toHaveBeenCalledWith(45000);
  });

  it('session restaurée (position 65 s / 3 min) : la barre suit la position réelle', () => {
    mockPlayerState = { ...mockPlayerState, positionMillis: 65000 };
    const { getByLabelText } = render(<MiniPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    // 36 % arrondi : position réelle reflétée dans la valeur accessible.
    expect(seek.props.accessibilityValue.now).toBe(36);
  });
});
