import { spotifyApiGet } from '@services';

import {
  getSpotifySavedTracks,
  getSpotifySavedTracksCount,
} from '../savedTracks';

// GET /v1/me/tracks paginé : la vraie bibliothèque du compte. Points
// sensibles : le curseur `next` (jamais un offset calculé), la borne
// mémoire, et le fait que les métadonnées de matching survivent au mapping.

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
}));

const mockedGet = spotifyApiGet as jest.MockedFunction<typeof spotifyApiGet>;

const item = (id: string, isrc?: string | null) => ({
  track: {
    id,
    name: `Titre ${id}`,
    duration_ms: 200_000,
    explicit: true,
    artists: [{ id: 'a1', name: 'Artiste A' }],
    album: {
      id: 'al1',
      name: 'Album A',
      images: [{ url: 'https://i.scdn.co/album.jpg' }],
    },
    ...(isrc !== undefined ? { external_ids: { isrc } } : {}),
  },
});

const page = (
  ids: string[],
  next: string | null
): {
  items: ReturnType<typeof item>[];
  next: string | null;
  total: number;
} => ({
  items: ids.map((id) => item(id)),
  next,
  total: ids.length,
});

beforeEach(() => {
  jest.clearAllMocks();
});

it('maps saved tracks with their matching metadata', async () => {
  mockedGet.mockResolvedValue({
    items: [item('t1', 'usrt19901234')],
    next: null,
    total: 1,
  });

  const [track] = await getSpotifySavedTracks();

  expect(track).toMatchObject({
    id: 't1',
    title: 'Titre t1',
    subtitle: 'Artiste A',
    imageURL: 'https://i.scdn.co/album.jpg',
    isSaved: true,
    explicit: true,
    durationMs: 200_000,
    albumName: 'Album A',
    isrc: 'USRT19901234',
  });
});

it('follows the official next cursor across pages', async () => {
  mockedGet
    .mockResolvedValueOnce(
      page(['t1', 't2'], 'https://api.spotify.com/v1/me/tracks?offset=2')
    )
    .mockResolvedValueOnce(page(['t3'], null));

  const tracks = await getSpotifySavedTracks();

  expect(mockedGet).toHaveBeenCalledTimes(2);
  // Le second appel réutilise le curseur TEL QUEL — pas d'offset reconstruit.
  expect(mockedGet.mock.calls[1][0]).toBe(
    'https://api.spotify.com/v1/me/tracks?offset=2'
  );
  expect(tracks.map((t) => t.id)).toEqual(['t1', 't2', 't3']);
});

it('stops at the requested ceiling', async () => {
  mockedGet.mockResolvedValue(
    page(['t1', 't2', 't3'], 'https://api.spotify.com/v1/me/tracks?offset=3')
  );

  const tracks = await getSpotifySavedTracks(2);

  expect(tracks.map((t) => t.id)).toEqual(['t1', 't2']);
  // Une seule page chargée : on ne télécharge pas au-delà du besoin.
  expect(mockedGet).toHaveBeenCalledTimes(1);
});

it('never loads more than 20 pages (memory guard)', async () => {
  // 20 pages pleines puis encore un curseur : on s'arrête net.
  mockedGet.mockImplementation(async () =>
    page(
      Array.from({ length: 50 }, (_, i) => `t${i}`),
      'https://api.spotify.com/v1/me/tracks?offset=999'
    )
  );

  const tracks = await getSpotifySavedTracks(10_000);

  expect(mockedGet).toHaveBeenCalledTimes(20);
  expect(tracks).toHaveLength(1000);
});

it('drops entries without a track or an id', async () => {
  mockedGet.mockResolvedValue({
    items: [{ track: null }, { track: { name: 'sans id' } }, item('ok')],
    next: null,
  });

  const tracks = await getSpotifySavedTracks();

  expect(tracks.map((t) => t.id)).toEqual(['ok']);
});

it('returns an empty list for a library with no likes', async () => {
  mockedGet.mockResolvedValue({ items: [], next: null, total: 0 });

  await expect(getSpotifySavedTracks()).resolves.toEqual([]);
});

it('reads the total without loading the whole library', async () => {
  mockedGet.mockResolvedValue({ items: [], next: null, total: 1284 });

  await expect(getSpotifySavedTracksCount()).resolves.toBe(1284);
  expect(mockedGet).toHaveBeenCalledWith('/me/tracks?limit=1');
});

it('propagates a Spotify failure so the screen can show a retry', async () => {
  mockedGet.mockRejectedValue(new Error('spotify down'));

  await expect(getSpotifySavedTracks()).rejects.toThrow('spotify down');
});
