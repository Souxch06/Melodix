/**
 * I-8 — « Écoutés récemment » : une tuile reste TOUJOURS fonctionnelle.
 *  - albumId connu     → navigation vers l'ALBUM (`/album/{albumId}`) ;
 *  - albumId inconnu   → JAMAIS `/album/<trackId>` : lecture DIRECTE du
 *    morceau (snapshot historique, clé de queue conservée, jamais de
 *    double préfixe de source) ;
 *  - anciennes entrées (sans albumId/track) → aucune erreur, lecture
 *    directe avec l'identité minimale disponible.
 */
import * as React from 'react';

import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getRecentlyPlayed } from '@api';
import type { PlayerTrack } from '@services';

import { RecentlyPlayed } from '../RecentlyPlayed';

const mockPush = jest.fn();
const mockPlayQueue = jest.fn(async (_q: PlayerTrack[], _i: number) => {});
const getRecentlyPlayedMock = getRecentlyPlayed as unknown as jest.Mock;

jest.mock('@api', () => ({
  getRecentlyPlayed: jest.fn(),
  updateRecentlyPlayed: jest.fn(async () => {
    throw new Error('update skipped in UI tests (voir playHistory/API)');
  }),
}));

jest.mock('expo-router', () => ({
  useRouter: () => ({ push: mockPush }),
  useSegments: () => ['(tabs)', 'home'],
}));

jest.mock('@hooks', () => ({
  useApplicationDimensions: () => ({ width: 400, height: 800 }),
}));

jest.mock('@context', () => ({
  usePlayer: () => ({
    current: null,
    status: 'idle',
    playQueue: mockPlayQueue,
  }),
}));

const renderWith = async (
  items: Parameters<typeof getRecentlyPlayedMock.mockResolvedValue>[0]
) => {
  getRecentlyPlayedMock.mockResolvedValue(items);
  const screen = render(<RecentlyPlayed />);
  await waitFor(() => {
    expect(screen.queryByText(items[0]?.title ?? '___none___')).toBeTruthy();
  });
  return screen;
};

beforeEach(() => {
  mockPush.mockClear();
  mockPlayQueue.mockClear();
  getRecentlyPlayedMock.mockReset();
});

describe('RecentlyPlayed — navigation album (I-8)', () => {
  it('entrée AVEC albumId → /album/{albumId}, JAMAIS l id du morceau', async () => {
    const { getByText } = await renderWith([
      {
        id: 'spotify:trk-7',
        title: 'The Album',
        imageURL: '',
        albumId: 'alb-99',
        track: { id: 'spotify:trk-7', title: 'Song', subtitle: 'Artist' },
      },
    ]);

    fireEvent.press(getByText('The Album'));

    expect(mockPush).toHaveBeenCalledTimes(1);
    expect(mockPush).toHaveBeenCalledWith('/(tabs)/home/album/alb-99');
    expect(mockPlayQueue).not.toHaveBeenCalled();
  });

  it('entrée SANS albumId → lecture directe, AUCUN /album/spotify:<trackId>', async () => {
    const { getByText } = await renderWith([
      {
        id: 'spotify:trk-3',
        title: 'Song Three',
        imageURL: 'https://img/3.jpg',
        albumId: null,
        track: {
          id: 'spotify:trk-3',
          title: 'Song Three',
          subtitle: 'Artist A, Artist B',
          albumName: 'Album X',
          durationMs: 201_000,
        },
      },
    ]);

    fireEvent.press(getByText('Song Three'));

    expect(mockPush).not.toHaveBeenCalled();
    expect(mockPlayQueue).toHaveBeenCalledTimes(1);
    const [queue, startIndex] = mockPlayQueue.mock.calls[0];
    expect(startIndex).toBe(0);
    expect(queue[0]).toEqual({
      // Clé de queue CONSERVÉE (cache/historique réutilisés) + métadonnées
      // I-2 du snapshot + JAMAIS de double préfixe dans la source.
      id: 'spotify:trk-3',
      title: 'Song Three',
      artists: ['Artist A', 'Artist B'],
      album: 'Album X',
      durationMillis: 201_000,
      imageURL: 'https://img/3.jpg',
      source: { provider: null, id: 'trk-3' },
    });
  });

  it('ancienne entrée (sans albumId NI snapshot) → aucune erreur, lecture directe minimale', async () => {
    const { getByText } = await renderWith([
      { id: 'spotify:old-5', title: 'Old Tune', imageURL: '' } as never,
    ]);

    fireEvent.press(getByText('Old Tune'));

    expect(mockPush).not.toHaveBeenCalled();
    expect(mockPlayQueue).toHaveBeenCalledTimes(1);
    expect(mockPlayQueue.mock.calls[0][0][0]).toMatchObject({
      id: 'spotify:old-5',
      title: 'Old Tune',
      artists: [],
      source: { provider: null, id: 'old-5' },
    });
  });

  it('entrée Audius native : lecture directe avec source audius (pas de matching)', async () => {
    const { getByText } = await renderWith([
      {
        id: 'audius:aud-8',
        title: 'Audius Tune',
        imageURL: '',
        albumId: null,
        track: { id: 'audius:aud-8', title: 'Audius Tune', subtitle: 'DJ' },
      },
    ]);

    fireEvent.press(getByText('Audius Tune'));

    expect(mockPush).not.toHaveBeenCalled();
    expect(mockPlayQueue.mock.calls[0][0][0]).toMatchObject({
      id: 'audius:aud-8',
      source: { provider: 'audius', id: 'aud-8' },
    });
  });
});
