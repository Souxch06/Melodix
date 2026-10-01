/**
 * Phase 2/3 — « Vos albums en tête » (extension I-8) :
 *  - albumId connu → navigation vers l'ALBUM RÉEL (jamais un id morceau) ;
 *  - albumId absent → JAMAIS de fausse route album : lecture directe du
 *    morceau échantillon (identité historique) ;
 *  - squelette → aucune action.
 */
import * as React from 'react';

import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { getUserTopAlbums } from '@api';
import type { PlayerTrack } from '@services';

import { TopAlbums } from '../index';

const mockPush = jest.fn();
const mockPlayQueue = jest.fn(async (_q: PlayerTrack[], _i: number) => {});
const getUserTopAlbumsMock = getUserTopAlbums as unknown as jest.Mock;

jest.mock('@api', () => ({
  getUserTopAlbums: jest.fn(),
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
  items: Parameters<typeof getUserTopAlbumsMock.mockResolvedValue>[0]
) => {
  getUserTopAlbumsMock.mockResolvedValue(items);
  const screen = render(<TopAlbums />);
  await waitFor(() => {
    expect(screen.queryByText(items[0]?.item.title ?? '__none__')).toBeTruthy();
  });
  return screen;
};

beforeEach(() => {
  mockPush.mockClear();
  mockPlayQueue.mockClear();
  getUserTopAlbumsMock.mockReset();
});

describe('TopAlbums — navigation sans faux album (extension I-8)', () => {
  it('albumId connu → /album/{albumId} (un VRAI album, jamais un trackId)', async () => {
    const { getByText } = await renderWith([
      {
        item: {
          id: 'alb-123',
          type: 'album',
          title: 'The Album',
          subtitle: 'Artist',
          imageURL: '',
        },
      },
    ]);

    fireEvent.press(getByText('The Album'));

    expect(mockPush).toHaveBeenCalledTimes(1);
    expect(mockPush).toHaveBeenCalledWith('/(tabs)/home/album/alb-123');
    expect(mockPlayQueue).not.toHaveBeenCalled();
  });

  it('albumId INCONNU → lecture directe, AUCUN /album/<trackId>', async () => {
    const { getByText } = await renderWith([
      {
        item: {
          id: '',
          type: 'album',
          title: 'Mere',
          subtitle: 'Artist',
          imageURL: 'img',
        },
        fallbackTrack: {
          id: 'spotify:track-100',
          title: 'Song',
          subtitle: 'Artist',
          albumName: 'Mere',
          durationMs: 180_000,
        },
      },
    ]);

    fireEvent.press(getByText('Mere'));

    expect(mockPush).not.toHaveBeenCalled();
    expect(mockPlayQueue).toHaveBeenCalledTimes(1);
    expect(mockPlayQueue.mock.calls[0][0][0]).toEqual({
      id: 'spotify:track-100',
      title: 'Song',
      artists: ['Artist'],
      album: 'Mere',
      durationMillis: 180_000,
      imageURL: 'img',
      source: { provider: null, id: 'track-100' },
    });
  });

  it('section vide → rien rendu', async () => {
    getUserTopAlbumsMock.mockResolvedValue([]);
    const screen = render(<TopAlbums />);
    await waitFor(() =>
      expect(screen.UNSAFE_queryAllByType('View' as never)).toBeTruthy()
    );
    expect(screen.queryByText(/Album/)).toBeNull();
    expect(mockPush).not.toHaveBeenCalled();
    expect(mockPlayQueue).not.toHaveBeenCalled();
  });
});
