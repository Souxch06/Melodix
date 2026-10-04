import { spotifyApiGet } from '@services';

import { searchSpotifyCatalog } from '../search';

// Vérifie le MAPPAGE de la réponse /v1/search : c'est ici que se joue la
// différence entre une recherche qui renvoie vraiment des artistes et des
// playlists, et une qui les laisse vides (l'ancien comportement).

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
}));

const mockedGet = spotifyApiGet as jest.MockedFunction<typeof spotifyApiGet>;

const SPOTIFY_SEARCH_RESPONSE = {
  tracks: {
    items: [
      {
        id: '4uLU6hMCjMI75M1A2tKUQC',
        name: 'One More Time',
        duration_ms: 320_000,
        explicit: false,
        artists: [{ id: 'ar1', name: 'Daft Punk' }],
        album: {
          id: 'al1',
          name: 'Discovery',
          images: [{ url: 'https://i.scdn.co/album.jpg' }],
        },
        external_ids: { isrc: 'usrt19901234' },
      },
      // Ligne à jeter : pas d'identifiant.
      { name: 'fantôme', artists: [{ name: 'inconnu' }] },
    ],
  },
  artists: {
    items: [
      {
        id: 'ar1',
        name: 'Daft Punk',
        images: [{ url: 'https://i.scdn.co/artist.jpg' }],
      },
    ],
  },
  albums: {
    items: [
      {
        id: 'al1',
        name: 'Discovery',
        album_type: 'album',
        images: [{ url: 'https://i.scdn.co/album.jpg' }],
        release_date: '2001-03-12',
        total_tracks: 14,
        artists: [{ id: 'ar1', name: 'Daft Punk' }],
      },
    ],
  },
  playlists: {
    items: [
      {
        id: 'pl1',
        name: 'French Touch',
        description: 'Les classiques',
        images: [{ url: 'https://i.scdn.co/pl.jpg' }],
        owner: { display_name: 'SpotiFan', id: 'fan' },
        tracks: { total: 42 },
      },
    ],
  },
};

beforeEach(() => {
  jest.clearAllMocks();
});

it('maps every Spotify search type into its own section', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  const results = await searchSpotifyCatalog('daft punk');

  expect(results.artists).toHaveLength(1);
  expect(results.tracks).toHaveLength(1);
  expect(results.albums).toHaveLength(1);
  expect(results.playlists).toHaveLength(1);
});

it('asks Spotify for the four types with a bounded limit', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  await searchSpotifyCatalog('daft punk', 10);

  const path = mockedGet.mock.calls[0][0];
  expect(path).toContain('/search?');
  expect(path).toContain('type=track%2Cartist%2Calbum%2Cplaylist');
  expect(path).toContain('limit=10');
  // La requête est encodée : pas d'espace nu ni d'injection possible.
  expect(path).toContain('q=daft+punk');
});

it('clamps the limit to the Spotify ceiling of 20', async () => {
  mockedGet.mockResolvedValue({ tracks: { items: [] } });

  await searchSpotifyCatalog('daft punk', 500);

  expect(mockedGet.mock.calls[0][0]).toContain('limit=20');
});

it('keeps the matching metadata on tracks (duration, album, uppercase ISRC)', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  const [track] = (await searchSpotifyCatalog('daft punk')).tracks;

  expect(track).toMatchObject({
    id: '4uLU6hMCjMI75M1A2tKUQC',
    type: 'track',
    title: 'One More Time',
    subtitle: 'Daft Punk',
    imageURL: 'https://i.scdn.co/album.jpg',
    durationMs: 320_000,
    albumName: 'Discovery',
    isrc: 'USRT19901234',
  });
});

it('joins every artist of a track into the subtitle', async () => {
  mockedGet.mockResolvedValue({
    tracks: {
      items: [
        {
          id: 't1',
          name: 'Encore',
          artists: [
            { id: 'a', name: 'Jay-Z' },
            { id: 'b', name: 'Linkin Park' },
          ],
        },
      ],
    },
  });

  const [track] = (await searchSpotifyCatalog('encore')).tracks;

  expect(track.subtitle).toBe('Jay-Z, Linkin Park');
});

it('drops hits without an id or a name instead of rendering a broken card', async () => {
  mockedGet.mockResolvedValue({
    tracks: {
      items: [
        { id: 'ok', name: 'Valide' },
        { id: 'sans-nom' },
        { name: 'sans-id' },
        null,
      ],
    },
    artists: { items: [null, { id: 'x', name: 'Valide' }] },
    albums: { items: [null, { id: 'y' }] },
    playlists: { items: [null, { id: 'z', name: 'Valide' }] },
  });

  const results = await searchSpotifyCatalog('q');

  expect(results.tracks.map((t) => t.id)).toEqual(['ok']);
  expect(results.artists.map((a) => a.id)).toEqual(['x']);
  expect(results.albums).toEqual([]);
  expect(results.playlists.map((p) => p.id)).toEqual(['z']);
});

it('names the playlist owner and its track count', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  const [playlist] = (await searchSpotifyCatalog('french touch')).playlists;

  expect(playlist.subtitle).toBe('Par SpotiFan');
  expect(playlist.totalTracks).toBe(42);
});

it('tolerates a Spotify answer that omits a whole type', async () => {
  // Spotify peut ne pas renvoyer les playlists pour certains comptes.
  mockedGet.mockResolvedValue({
    tracks: { items: [{ id: 't', name: 'Seul' }] },
  });

  const results = await searchSpotifyCatalog('seul');

  expect(results.tracks).toHaveLength(1);
  expect(results.artists).toEqual([]);
  expect(results.albums).toEqual([]);
  expect(results.playlists).toEqual([]);
});

it('never calls Spotify on an empty query', async () => {
  const results = await searchSpotifyCatalog('   ');

  expect(mockedGet).not.toHaveBeenCalled();
  expect(results).toEqual({
    tracks: [],
    artists: [],
    albums: [],
    playlists: [],
  });
});

it('uses items.total for playlists when tracks.total is absent', async () => {
  mockedGet.mockResolvedValue({
    playlists: {
      items: [
        {
          id: 'p',
          name: 'Nouvelle forme',
          owner: { id: 'fan' },
          items: { total: 7 },
        },
      ],
    },
  });

  const [playlist] = (await searchSpotifyCatalog('nouvelle forme')).playlists;

  expect(playlist.totalTracks).toBe(7);
  // Sans display_name, l'identifiant propriétaire sert de repli.
  expect(playlist.subtitle).toBe('Par fan');
});

it('propagates the Spotify error to the caller (no silent empty result)', async () => {
  mockedGet.mockRejectedValue(new Error('spotify down'));

  await expect(searchSpotifyCatalog('daft punk')).rejects.toThrow(
    'spotify down'
  );
});
