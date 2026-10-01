/**
 * M-6 — « Artistes en tête » : il n'existe PAS de page artiste dans
 * l'application. Les cartes artiste sont donc explicitement INERTES :
 * un appui ne navigue NULLE PART (jamais la route stub /artist/{id}),
 * et un refus Spotify (permission manquante) masque la section entière.
 */
import * as React from 'react';

import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getUserTopArtists } from '@api';

import { TopArtists } from '../index';

const mockPush = jest.fn();
const getUserTopArtistsMock = getUserTopArtists as unknown as jest.Mock;

jest.mock('@api', () => ({
  getUserTopArtists: jest.fn(),
}));

jest.mock('expo-router', () => ({
  useRouter: () => ({ push: mockPush }),
  useSegments: () => ['(tabs)', 'home'],
}));

jest.mock('@hooks', () => ({
  useApplicationDimensions: () => ({ width: 400, height: 800 }),
}));

const artist = (id: string, title: string) => ({
  id,
  type: 'artist' as const,
  title,
  imageURL: '',
  subtitle: '',
});

beforeEach(() => {
  mockPush.mockClear();
  getUserTopArtistsMock.mockReset();
});

describe('TopArtists — cartes artiste inertes (M-6, page artiste en pause)', () => {
  it('refus Spotify (permission refusée) : la section N’EST PAS affichée', async () => {
    getUserTopArtistsMock.mockRejectedValue(new Error('missing permission'));
    const screen = render(<TopArtists />);

    await waitFor(() => {
      expect(screen.toJSON()).toBeNull();
    });
  });

  it('appui sur un artiste : JAMAIS de navigation (pas de page artiste)', async () => {
    getUserTopArtistsMock.mockResolvedValue([
      artist('ar1', 'Neffex'),
      artist('ar2', 'Billie Eilish'),
    ]);
    const screen = render(<TopArtists />);

    await waitFor(() => {
      expect(screen.getByText('Neffex')).toBeTruthy();
    });

    fireEvent.press(screen.getByText('Neffex'));
    fireEvent.press(screen.getByText('Billie Eilish'));

    expect(mockPush).not.toHaveBeenCalled();
  });
});
