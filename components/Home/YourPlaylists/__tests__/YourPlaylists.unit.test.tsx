import * as React from 'react';
import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getSavedPlaylists } from '@api';
import { translations } from '@data';

import { YourPlaylists } from '..';

const mockPush = jest.fn();

jest.mock('@context', () => ({
  useUserData: () => ({
    userData: { id: 'owner-1', displayName: 'Julien', imageURL: '' },
    sessionStatus: 'spotify',
  }),
}));

jest.mock('@api', () => ({
  getSavedPlaylists: jest.fn(),
}));

// Le Slider est validé par ses propres tests : ici on capture juste ses props.
jest.mock('../../../Slider', () => {
  const ReactActual = jest.requireActual('react');
  const { Text, View } = jest.requireActual('react-native');
  return {
    Slider: (props: { title: string; slides: { title: string }[] | null }) =>
      ReactActual.createElement(
        View,
        { testID: 'yp-slider' },
        ReactActual.createElement(Text, { testID: 'yp-slider-title' }, props.title),
        ReactActual.createElement(
          Text,
          { testID: 'yp-slider-count' },
          String(props.slides ? props.slides.length : 'null')
        )
      ),
  };
});

jest.mock('expo-router', () => ({
  useRouter: () => ({ push: mockPush }),
}));

const playlist = (id: string, ownerId: string, title: string) => ({
  id,
  type: 'playlist' as const,
  title,
  imageURL: 'https://img/1.png',
  subtitle: '12 morceaux',
  ownerId,
});

describe('YourPlaylists — playlists Spotify réelles de l accueil', () => {
  beforeEach(() => {
    (getSavedPlaylists as jest.Mock).mockReset();
  });

  it('charge et affiche les playlists du compte (Slider « Tes playlists »)', async () => {
    (getSavedPlaylists as jest.Mock).mockResolvedValue([
      playlist('p1', 'owner-1', 'Gym Mix'),
      playlist('p2', 'owner-1', 'Soirées'),
      playlist('p3', 'autre', 'Communauté'),
    ]);

    const { getByTestId, queryByTestId } = render(<YourPlaylists />);

    await waitFor(() => expect(getByTestId('yp-slider')).toBeTruthy());
    expect(getByTestId('yp-slider-title').props.children).toBe('Tes playlists');
    // Seules les playlists dont l'utilisateur est propriétaire passent.
    expect(getByTestId('yp-slider-count').props.children).toBe('2');
    expect(queryByTestId('home-playlists-empty')).toBeNull();
    expect(queryByTestId('home-playlists-error')).toBeNull();
  });

  it('aucune playlist → vraie interface vide + bouton Actualiser (refetch)', async () => {
    (getSavedPlaylists as jest.Mock).mockResolvedValueOnce([]);

    const { getByTestId, getByText, queryByTestId } = render(<YourPlaylists />);

    await waitFor(() => expect(getByTestId('home-playlists-empty')).toBeTruthy());
    expect(getByText(translations.homePlaylistsEmptyTitle)).toBeTruthy();
    expect(getByText(translations.homePlaylistsEmptyBody)).toBeTruthy();
    expect(queryByTestId('yp-slider')).toBeNull();

    // Actualiser déclenche un nouveau chargement qui trouve des playlists.
    (getSavedPlaylists as jest.Mock).mockResolvedValueOnce([
      playlist('p9', 'owner-1', 'Nouvelle'),
    ]);
    fireEvent.press(getByTestId('home-playlists-refresh'));

    await waitFor(() => expect(getByTestId('yp-slider')).toBeTruthy());
    expect((getSavedPlaylists as jest.Mock).mock.calls.length).toBe(2);
    expect(getByTestId('yp-slider-count').props.children).toBe('1');
  });

  it('erreur Spotify → message humain + Réessayer (refetch réussi ensuite)', async () => {
    (getSavedPlaylists as jest.Mock).mockRejectedValueOnce(new Error('HTTP 500'));

    const { getByTestId, getByText, queryByTestId } = render(<YourPlaylists />);

    await waitFor(() => expect(getByTestId('home-playlists-error')).toBeTruthy());
    expect(getByText('Impossible de charger tes données Spotify.')).toBeTruthy();
    expect(getByText(translations.homeRetry)).toBeTruthy();
    expect(queryByTestId('home-playlists-empty')).toBeNull();

    (getSavedPlaylists as jest.Mock).mockResolvedValueOnce([
      playlist('p1', 'owner-1', 'Gym Mix'),
    ]);
    fireEvent.press(getByTestId('home-playlists-retry'));

    await waitFor(() => expect(getByTestId('yp-slider')).toBeTruthy());
    expect((getSavedPlaylists as jest.Mock).mock.calls.length).toBe(2);
    expect(queryByTestId('home-playlists-error')).toBeNull();
  });

  it('chargement → skeleton (3 cartes placeholders du Slider)', async () => {
    let resolveFetch: (value: unknown[]) => void = () => {};
    (getSavedPlaylists as jest.Mock).mockImplementation(
      () =>
        new Promise((resolve) => {
          resolveFetch = resolve;
        })
    );

    const { getByTestId } = render(<YourPlaylists />);

    await waitFor(() => expect(getByTestId('yp-slider')).toBeTruthy());
    expect(getByTestId('yp-slider-count').props.children).toBe('3');

    resolveFetch([]);
    await waitFor(() => expect(getByTestId('home-playlists-empty')).toBeTruthy());
  });
});
