import * as React from 'react';
import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getArtist } from '@api';
import { ArtistScreen } from '../ArtistScreen';

const mockBack = jest.fn();

jest.mock('expo-router', () => ({
  useRouter: () => ({ back: mockBack }),
}));

jest.mock('@api', () => ({
  getArtist: jest.fn(),
}));

const getArtistMock = getArtist as jest.MockedFunction<typeof getArtist>;

beforeEach(() => {
  jest.clearAllMocks();
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
    expect(getArtistMock).toHaveBeenCalledWith('artist-1');

    fireEvent.press(getByTestId('artist-back'));
    expect(mockBack).toHaveBeenCalledTimes(1);
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
