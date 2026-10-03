import * as React from 'react';
import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getRecentlyPlayedTracks, removePlayHistoryEntry } from '@services';
import { HistoryScreen } from '../HistoryScreen';

const mockBack = jest.fn();
const mockPlayTrack = jest.fn(async () => {});

jest.mock('expo-router', () => ({
  useRouter: () => ({ back: mockBack }),
}));

jest.mock('@react-navigation/native', () => ({
  useFocusEffect: (effect: () => void | (() => void)) => {
    const ReactActual = jest.requireActual('react') as typeof React;
    const effectRef = ReactActual.useRef(effect);
    effectRef.current = effect;
    ReactActual.useEffect(() => effectRef.current(), [effect]);
  },
}));

jest.mock('@context', () => ({
  usePlayer: () => ({ playTrack: mockPlayTrack }),
}));

jest.mock('@services', () => ({
  getRecentlyPlayedTracks: jest.fn(),
  removePlayHistoryEntry: jest.fn(async () => {}),
  playerTrackFromHistoryEntry: jest.fn(({ id, title, imageURL }) => ({
    id,
    title,
    artists: [],
    imageURL,
    source: { provider: null, id },
  })),
}));

const getHistoryMock = getRecentlyPlayedTracks as jest.MockedFunction<
  typeof getRecentlyPlayedTracks
>;
const removeHistoryMock = removePlayHistoryEntry as jest.MockedFunction<
  typeof removePlayHistoryEntry
>;

const entries = [
  {
    track: { id: 'spotify:one', title: 'One', subtitle: 'Artist' },
    playedAt: 2,
  },
  {
    track: { id: 'spotify:two', title: 'Two', subtitle: 'Artist' },
    playedAt: 1,
  },
];

beforeEach(() => {
  jest.clearAllMocks();
  getHistoryMock.mockResolvedValue(entries);
});

describe('HistoryScreen', () => {
  it('affiche l historique chronologique et relit une entrée', async () => {
    const { getByText, getByTestId } = render(<HistoryScreen />);

    await waitFor(() => expect(getByText('One')).toBeTruthy());
    expect(getByText('Two')).toBeTruthy();

    fireEvent.press(getByTestId('history-play-spotify:one'));
    expect(mockPlayTrack).toHaveBeenCalledWith(
      expect.objectContaining({ id: 'spotify:one', title: 'One' })
    );
  });

  it('supprime une entrée immédiatement et la persistance correspondante', async () => {
    const { getByText, getByTestId, queryByText } = render(<HistoryScreen />);
    await waitFor(() => expect(getByText('One')).toBeTruthy());

    fireEvent.press(getByTestId('history-remove-spotify:one'));

    await waitFor(() => expect(queryByText('One')).toBeNull());
    expect(removeHistoryMock).toHaveBeenCalledWith('spotify:one');
    expect(getByText('Two')).toBeTruthy();
  });

  it('différencie erreur, retry et historique réellement vide', async () => {
    getHistoryMock
      .mockRejectedValueOnce(new Error('storage unavailable'))
      .mockResolvedValueOnce([]);

    const { getByTestId } = render(<HistoryScreen />);
    await waitFor(() => expect(getByTestId('history-error')).toBeTruthy());

    fireEvent.press(getByTestId('history-retry'));
    await waitFor(() => expect(getByTestId('history-empty')).toBeTruthy());
    expect(getHistoryMock).toHaveBeenCalledTimes(2);
  });
});
