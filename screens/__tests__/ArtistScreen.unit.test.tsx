import * as React from 'react';
import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getArtist } from '@api';
import { ArtistScreen } from '../ArtistScreen';

const mockBack = jest.fn();
const mockPlayQueue = jest.fn(async () => {});
const mockAddToQueue = jest.fn();
const mockPlayNext = jest.fn();

jest.mock('expo-router', () => ({
  useRouter: () => ({ back: mockBack }),
}));

jest.mock('@api', () => ({
  getArtist: jest.fn(),
}));

jest.mock('@context', () => ({
  usePlayer: () => ({
    playQueue: mockPlayQueue,
    addToQueue: mockAddToQueue,
    playNext: mockPlayNext,
  }),
}));

jest.mock('../../components/Card', () => ({
  Card: ({ title }: { title: string }) => {
    const { Text } = jest.requireActual('react-native');
    return <Text>{title}</Text>;
  },
}));

jest.mock('../../components/Player/QueueActionMenu', () => ({
  QueueActionMenu: ({ visible }: { visible: boolean }) => {
    const { View } = jest.requireActual('react-native');
    return visible ? <View testID="artist-action-menu" /> : null;
  },
}));

const getArtistMock = getArtist as jest.MockedFunction<typeof getArtist>;

beforeEach(() => {
  jest.clearAllMocks();
  mockPlayQueue.mockResolvedValue(undefined);
});

describe('ArtistScreen', () => {
  it('remplace le placeholder par les métadonnées réelles de l artiste', async () => {
    getArtistMock.mockResolvedValue({
      id: 'artist-1',
      type: 'artist',
      name: 'Daft Punk',
      imageURL: 'https://img.example/artist.jpg',
    });

    const { getByTestId, getByText } = render(
      <ArtistScreen artistId="artist-1" />
    );

    expect(getByTestId('artist-loading')).toBeTruthy();
    await waitFor(() => expect(getByTestId('artist-screen')).toBeTruthy());
    expect(getByText('Daft Punk')).toBeTruthy();
    expect(
      getByText('Aucun titre ni album public disponible pour cet artiste.')
    ).toBeTruthy();
    expect(getArtistMock).toHaveBeenCalledWith('artist-1');

    fireEvent.press(getByTestId('artist-back'));
    expect(mockBack).toHaveBeenCalledTimes(1);
  });

  it('affiche et lit les titres réels, expose les actions et la discographie', async () => {
    getArtistMock.mockResolvedValue({
      id: 'artist-1',
      type: 'artist',
      name: 'Daft Punk',
      imageURL: '',
      topTracks: [
        {
          id: 'track-1',
          title: 'One More Time',
          subtitle: 'Daft Punk',
          albumName: 'Discovery',
          durationMs: 320_000,
        },
        { id: 'track-2', title: 'Digital Love', subtitle: 'Daft Punk' },
      ],
      albums: [
        {
          id: 'album-1',
          type: 'album',
          title: 'Discovery',
          subtitle: 'Daft Punk',
          imageURL: '',
        },
      ],
    });

    const { getByTestId, getByText } = render(
      <ArtistScreen artistId="artist-1" />
    );
    await waitFor(() => expect(getByTestId('artist-top-tracks')).toBeTruthy());

    expect(getByText('Discovery')).toBeTruthy();
    fireEvent.press(getByTestId('artist-track-track-2'));
    expect(mockPlayQueue).toHaveBeenCalledWith(
      expect.arrayContaining([
        expect.objectContaining({ id: 'spotify:track-1' }),
        expect.objectContaining({ id: 'spotify:track-2' }),
      ]),
      1
    );

    fireEvent.press(getByTestId('artist-track-actions-track-1'));
    expect(getByTestId('artist-action-menu')).toBeTruthy();
  });

  it('affiche une erreur récupérable et relance réellement la requête', async () => {
    getArtistMock
      .mockRejectedValueOnce(new Error('network'))
      .mockResolvedValueOnce({
        id: 'artist-2',
        type: 'artist',
        name: 'Air',
        imageURL: '',
      });

    const { getByTestId, getByText } = render(
      <ArtistScreen artistId="artist-2" />
    );

    await waitFor(() => expect(getByTestId('artist-load-error')).toBeTruthy());
    fireEvent.press(getByTestId('artist-load-retry'));

    await waitFor(() => expect(getByText('Air')).toBeTruthy());
    expect(getArtistMock).toHaveBeenCalledTimes(2);
  });
});
