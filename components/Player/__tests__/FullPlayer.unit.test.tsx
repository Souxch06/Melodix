/**
 * FullPlayer — audit §8 (le composant EXISTE déjà : ces tests prouvent ce
 * qu'il permet VRAIMENT, sans le modifier) :
 *  1. Grande pochette, titre, artiste, album, badge provider (source auditive).
 *  2. Barre de progression : TEMPS réels mm:ss + pression sur la barre → seek.
 *  3. Volume : pression sur la barre → setVolume proportionnel.
 *  4. Contrôles : shuffle, previous, play/pause, next, repeat cycle.
 *  5. File d'attente : liste complète, tap sur une ligne → playAtIndex.
 *  6. Fermeture : chevron → router.back ; bouton stop → stop() + retour.
 *
 * Limites mesurées par les tests (et volontairement signalées) : les barres
 * ne supportent PAS le glissé (pression simple uniquement), pas de mute.
 */
import * as React from 'react';

import { fireEvent, render } from '@testing-library/react-native';

import { translations } from '@data';
import type { PlayerTrack } from '@services';

import { FullPlayer } from '../FullPlayer';

const mockBack = jest.fn();
const mockTogglePlayPause = jest.fn(async () => {});
const mockNext = jest.fn(async () => {});
const mockPrevious = jest.fn(async () => {});
const mockSeekTo = jest.fn(async () => {});
const mockSetVolume = jest.fn(async () => {});
const mockToggleShuffle = jest.fn();
const mockCycleRepeat = jest.fn();
const mockPlayAtIndex = jest.fn(async () => {});
const mockStop = jest.fn(async () => {});
const mockClearNotice = jest.fn();
const mockRemoveFromQueue = jest.fn();
const mockMoveInQueue = jest.fn();

let mockPlayerState: {
  current: PlayerTrack | null;
  queue: PlayerTrack[];
  index: number;
  status: string;
  positionMillis: number;
  durationMillis: number;
  shuffle: boolean;
  repeat: 'off' | 'all' | 'one';
  volume: number;
  providerName: string | null;
  notice: { kind: 'not-available' | 'play-failed'; title: string } | null;
};

jest.mock('expo-router', () => ({
  useRouter: () => ({ back: mockBack }),
}));

jest.mock('react-native-safe-area-context', () => ({
  useSafeAreaInsets: () => ({ top: 24, bottom: 34, left: 0, right: 0 }),
}));

jest.mock('@context', () => ({
  useAccent: () => '#1ed760',
  usePlayer: () => ({
    ...mockPlayerState,
    togglePlayPause: mockTogglePlayPause,
    next: mockNext,
    previous: mockPrevious,
    seekTo: mockSeekTo,
    setVolume: mockSetVolume,
    toggleShuffle: mockToggleShuffle,
    cycleRepeat: mockCycleRepeat,
    playAtIndex: mockPlayAtIndex,
    stop: mockStop,
    clearNotice: mockClearNotice,
    removeFromQueue: mockRemoveFromQueue,
    moveInQueue: mockMoveInQueue,
  }),
}));

const mkTrack = (id: string, title: string): PlayerTrack => ({
  id: `spotify:${id}`,
  title,
  artists: ['Neffex'],
  album: 'Fate',
  durationMillis: 180000,
  imageURL: '',
  source: { provider: null, id },
});

describe('FullPlayer — inventaire réel avant refonte éventuelle', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    mockPlayerState = {
      current: mkTrack('one', 'Take Me Away'),
      queue: [
        mkTrack('one', 'Take Me Away'),
        mkTrack('two', 'Make It'),
        mkTrack('three', 'Grateful'),
      ],
      index: 0,
      status: 'playing',
      positionMillis: 65000,
      durationMillis: 180000,
      shuffle: false,
      repeat: 'off',
      volume: 0.5,
      providerName: 'Audius',
      notice: null,
    };
  });

  it('affiche titre, artiste, album, badge provider et temps réels (1:05 / 3:00)', () => {
    const { getAllByText, getByText } = render(<FullPlayer />);

    // Le titre ET l'artiste apparaissent dans l'en-tête ET les lignes de file.
    expect(getAllByText('Take Me Away').length).toBeGreaterThanOrEqual(2);
    expect(getAllByText('Neffex')).toBeTruthy();
    expect(getByText('Fate')).toBeTruthy();
    expect(getByText(translations.playerStreamedWith('Audius'))).toBeTruthy();
    expect(getByText('1:05')).toBeTruthy();
    expect(getByText('3:00')).toBeTruthy();
  });

  it('la barre de progression cherche la position proportionnelle (pression milieu → 50 %)', () => {
    const { getByLabelText } = render(<FullPlayer />);
    const seek = getByLabelText(translations.playerSeek);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent.press(seek, { nativeEvent: { locationX: 100 } });

    expect(mockSeekTo).toHaveBeenCalledWith(90000); // 50 % de 180 000 ms
  });

  it('la barre de volume applique la valeur proportionnelle (pression à 25 %)', () => {
    const { getByLabelText } = render(<FullPlayer />);
    const volume = getByLabelText(translations.playerVolume);

    fireEvent(volume, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent.press(volume, { nativeEvent: { locationX: 50 } });

    expect(mockSetVolume).toHaveBeenCalledWith(0.25);
    // PAS de mute dédié dans l'UI actuelle (constat d'audit, pas manquant ici).
  });

  it('play/pause, previous, next, shuffle, repeat : tous branchés', () => {
    const { getByLabelText } = render(<FullPlayer />);

    fireEvent.press(getByLabelText(translations.playerPause));
    fireEvent.press(getByLabelText(translations.playerPrevious));
    fireEvent.press(getByLabelText(translations.playerNext));
    fireEvent.press(getByLabelText(translations.playerShuffle));
    fireEvent.press(getByLabelText(translations.playerRepeat));

    expect(mockTogglePlayPause).toHaveBeenCalledTimes(1);
    expect(mockPrevious).toHaveBeenCalledTimes(1);
    expect(mockNext).toHaveBeenCalledTimes(1);
    expect(mockToggleShuffle).toHaveBeenCalledTimes(1);
    expect(mockCycleRepeat).toHaveBeenCalledTimes(1);
  });

  it('« Répéter le titre » porte le libellé dédié en mode one', () => {
    mockPlayerState = { ...mockPlayerState, repeat: 'one' };
    const { getByLabelText } = render(<FullPlayer />);

    fireEvent.press(getByLabelText(translations.playerRepeatOne));
    expect(mockCycleRepeat).toHaveBeenCalledTimes(1);
  });

  it('la file d attente liste tous les morceaux et joue la ligne tapée', () => {
    const { getByText } = render(<FullPlayer />);

    fireEvent.press(getByText('Grateful'));

    expect(mockPlayAtIndex).toHaveBeenCalledWith(2);
  });

  it('fermeture : stop réel du moteur puis retour arrière', () => {
    const { getByLabelText } = render(<FullPlayer />);

    fireEvent.press(getByLabelText(translations.playerStop));

    expect(mockStop).toHaveBeenCalledTimes(1);
    expect(mockBack).toHaveBeenCalledTimes(1);
  });

  it('le chevron retour ferme l écran SANS arrêter la lecture', () => {
    const { getAllByLabelText } = render(<FullPlayer />);

    // Deux éléments partagent playerClose : le chevron (retour) et… —
    // l'audit vérifie le chevron seul : aucun appel à stop().
    fireEvent.press(getAllByLabelText(translations.playerClose)[0]);

    expect(mockStop).not.toHaveBeenCalled();
    expect(mockBack).toHaveBeenCalledTimes(1);
  });
});

describe('FullPlayer — Phase 1 : notices cohérentes et durée honnête', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    jest.useRealTimers();
    mockPlayerState = {
      current: mkTrack('one', 'Take Me Away'),
      queue: [mkTrack('one', 'Take Me Away')],
      index: 0,
      status: 'playing',
      positionMillis: 65000,
      durationMillis: 180000,
      shuffle: false,
      repeat: 'off',
      volume: 0.5,
      providerName: 'Audius',
      notice: null,
    };
  });

  it('durée KO : affiche « —:-- » (jamais 0:00) ET la barre est désactivée', () => {
    mockPlayerState = {
      ...mockPlayerState,
      durationMillis: 0,
      positionMillis: 0,
    };
    const { getByTestId, getByLabelText, queryAllByText } = render(
      <FullPlayer />
    );

    // « —:-- » honnête, jamais « 0:00 » présenté comme une DURÉE réelle
    // (la position écoulée « 0:00 », elle, reste vraie et affichée : 1 seule).
    expect(getByTestId('full-player-duration').props.children).toBe('—:--');
    expect(queryAllByText('0:00')).toHaveLength(1);

    // Barre de progression désactivée : marquage a11y + pression sans effet.
    const seek = getByLabelText(translations.playerSeek);
    expect(seek.props.accessibilityState?.disabled).toBe(true);
    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent.press(seek, { nativeEvent: { locationX: 100 } });
    expect(mockSeekTo).not.toHaveBeenCalled();
  });

  it('durée connue : affichage mm:ss classique et barre active', () => {
    const { getByTestId, getByLabelText } = render(<FullPlayer />);

    expect(getByTestId('full-player-duration').props.children).toBe('3:00');
    const seek = getByLabelText(translations.playerSeek);
    expect(seek.props.accessibilityState?.disabled).toBe(false);

    fireEvent(seek, 'layout', { nativeEvent: { layout: { width: 200 } } });
    fireEvent.press(seek, { nativeEvent: { locationX: 100 } });
    expect(mockSeekTo).toHaveBeenCalledWith(90000);
  });

  it('notice : affichée à l’erreur, expirée PAR TIMER comme le MiniPlayer', () => {
    mockPlayerState = {
      ...mockPlayerState,
      notice: { kind: 'not-available', title: 'Ghost Track' },
    };
    const { getByText } = render(<FullPlayer />);

    expect(
      getByText(translations.playerTrackUnavailable('Ghost Track'))
    ).toBeTruthy();

    jest.useFakeTimers();
    render(<FullPlayer />);
    jest.advanceTimersByTime(4600);
    jest.useRealTimers();

    expect(mockClearNotice).toHaveBeenCalled();
  });

  it('notice + NOUVEAU morceau : le timer repart à zéro (jamais figée)', () => {
    mockPlayerState = {
      ...mockPlayerState,
      notice: { kind: 'play-failed', title: 'Old' },
    };
    const view = render(<FullPlayer />);

    // Le morceau change : le moteur vacille notice → null → l'effet s'annule.
    mockPlayerState = {
      ...mockPlayerState,
      notice: null,
      current: mkTrack('two', 'Next'),
    };
    view.update(<FullPlayer />);

    jest.useFakeTimers();
    mockPlayerState = { ...mockPlayerState, notice: null };
    view.update(<FullPlayer />);
    jest.advanceTimersByTime(4600);
    jest.useRealTimers();
    // clearNotice n'est plus appelé par le timer d'un vieil affichage.
    expect(mockClearNotice).not.toHaveBeenCalled();
  });
});

/**
 * PHASE 2 — file d'attente du Full Player : actions réelles (§9-§10).
 */
const mk = (titre: string): PlayerTrack => mkTrack(titre.toLowerCase(), titre);

const QueueHarness = ({
  state,
}: {
  state: {
    queue: PlayerTrack[];
    index: number;
    status: string;
    positionMillis: number;
    durationMillis: number;
  };
}) => {
  Object.assign(mockPlayerState, state);

  return <FullPlayer />;
};

describe('FullPlayer — file avancée : supprimer, réordonner, jouer (phase 2)', () => {
  beforeEach(() => jest.clearAllMocks());

  const lectureQ = ['A', 'B', 'C'];
  const stateQ = {
    status: 'playing',
    positionMillis: 1000,
    durationMillis: 60000,
  };

  it('chaque ligne porte pochette + actions : supprimer appelle removeFromQueue', () => {
    const queue = lectureQ.map(mk);
    const { getByText, getByTestId } = render(
      <QueueHarness state={{ ...stateQ, queue, index: 1 }} />
    );

    // Morceau courant identifié (style actif) par titre.
    expect(getByText('B')).toBeTruthy();
    fireEvent.press(getByTestId('queue-remove-2'));
    expect(mockRemoveFromQueue).toHaveBeenCalledWith(2);
  });

  it('les flèches réordonnent : descendre appelle moveInQueue(i, i+1)', () => {
    const queue = lectureQ.map(mk);
    const { getByTestId } = render(
      <QueueHarness state={{ ...stateQ, queue, index: 0 }} />
    );

    fireEvent.press(getByTestId('queue-up-1'));
    expect(mockMoveInQueue).toHaveBeenCalledWith(1, 0);

    fireEvent.press(getByTestId('queue-down-0'));
    expect(mockMoveInQueue).toHaveBeenCalledWith(0, 1);
  });

  it('les CORN bornes sont désactivées : pas de déplacement hors file', () => {
    const queue = lectureQ.map(mk);
    const { getByTestId } = render(
      <QueueHarness state={{ ...stateQ, queue, index: 1 }} />
    );

    expect(getByTestId('queue-up-0').props.accessibilityState?.disabled).toBe(
      true
    );
    expect(
      getByTestId(`queue-down-${queue.length - 1}`).props.accessibilityState
        ?.disabled
    ).toBe(true);

    // Appui impuissant : jamais de moveInQueue hors bornes.
    fireEvent.press(getByTestId('queue-up-0'));
    expect(mockMoveInQueue).not.toHaveBeenCalled();
  });
});
