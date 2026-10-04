import { spotifyApiGet } from '@services';

import { getSpotifyArtist, getSpotifyArtistAlbums } from '../artist';

// Mapping de GET /v1/artists/{id} (+ /albums, /top-tracks) : la session du
// compte est la SEULE source qui fournisse les vrais top titres et la
// discographie paginée.

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
}));

const mockedGet = spotifyApiGet as jest.MockedFunction<typeof spotifyApiGet>;

const ARTIST = {
  id: 'ar-1',
  name: 'Daft Punk',
  images: [{ url: 'https://i.scdn.co/artist.jpg' }],
  genres: ['french house'],
};

const TOP_TRACKS = {
  tracks: [
    {
      id: 'tr-1',
      name: 'One More Time',
      duration_ms: 320_000,
      explicit: false,
      artists: [{ id: 'ar-1', name: 'Daft Punk' }],
      album: {
        id: 'al-1',
        name: 'Discovery',
        images: [{ url: 'https://i.scdn.co/album.jpg' }],
      },
      external_ids: { isrc: 'usrt19901234' },
    },
    { name: 'sans id' },
    null,
  ],
};

const ALBUMS_PAGE = {
  items: [
    {
      id: 'al-1',
      name: 'Discovery',
      album_type: 'album',
      images: [{ url: 'https://i.scdn.co/album.jpg' }],
      release_date: '2001-03-12',
      total_tracks: 14,
      artists: [{ id: 'ar-1', name: 'Daft Punk' }],
    },
    { name: 'sans id' },
    null,
  ],
};

beforeEach(() => {
  jest.clearAllMocks();
});

describe('getSpotifyArtist', () => {
  it('maps identity, top tracks and discography', async () => {
    mockedGet.mockImplementation(async (path: string) => {
      if (path.startsWith('/artists/ar-1/top-tracks')) return TOP_TRACKS;
      if (path.startsWith('/artists/ar-1/albums')) return ALBUMS_PAGE;
      return ARTIST;
    });

    const artist = await getSpotifyArtist('ar-1');

    expect(artist).toMatchObject({
      type: 'artist',
      id: 'ar-1',
      name: 'Daft Punk',
      imageURL: 'https://i.scdn.co/artist.jpg',
    });
    expect(artist.topTracks).toHaveLength(1);
    expect(artist.topTracks?.[0]).toMatchObject({
      id: 'tr-1',
      title: 'One More Time',
      subtitle: 'Daft Punk',
      durationMs: 320_000,
      albumName: 'Discovery',
      isrc: 'USRT19901234',
    });
    expect(artist.albums).toHaveLength(1);
    expect(artist.albums?.[0]).toMatchObject({
      id: 'al-1',
      type: 'album',
      title: 'Discovery',
      subtitle: 'Daft Punk',
    });
  });

  it('asks for the artist, its top tracks (with market) and its albums', async () => {
    mockedGet.mockImplementation(async (path: string) => {
      if (path.startsWith('/artists/ar-1/top-tracks')) return TOP_TRACKS;
      if (path.startsWith('/artists/ar-1/albums')) return ALBUMS_PAGE;
      return ARTIST;
    });

    await getSpotifyArtist('ar-1');

    const paths = mockedGet.mock.calls.map(([path]) => path);
    expect(paths).toContain('/artists/ar-1');
    expect(paths).toContain('/artists/ar-1/top-tracks?market=FR');
    expect(paths).toContain(
      '/artists/ar-1/albums?limit=20&include_groups=album%2Csingle%2Ccompilation'
    );
  });

  it('still returns the artist when top tracks or albums fail', async () => {
    // Spotify refuse /top-tracks sans market valide, ou 404 sur certains
    // comptes : l'écran doit rester utilisable.
    mockedGet.mockImplementation(async (path: string) => {
      if (path.startsWith('/artists/ar-1/top-tracks')) {
        throw new Error('no market');
      }
      if (path.startsWith('/artists/ar-1/albums')) {
        throw new Error('gone');
      }
      return ARTIST;
    });

    const artist = await getSpotifyArtist('ar-1');

    expect(artist.name).toBe('Daft Punk');
    expect(artist.topTracks).toEqual([]);
    expect(artist.albums).toEqual([]);
  });

  it('rejects an answer with no identity instead of an empty artist', async () => {
    mockedGet.mockResolvedValue({ name: 'Sans id' });

    await expect(getSpotifyArtist('ar-2')).rejects.toThrow(/sans identifiant/i);
  });

  it('propagates the identity error (the screen falls back to the backend)', async () => {
    mockedGet.mockRejectedValue(new Error('spotify down'));

    await expect(getSpotifyArtist('ar-1')).rejects.toThrow('spotify down');
  });
});

describe('getSpotifyArtistAlbums', () => {
  it('paginates the discography with a bounded limit', async () => {
    mockedGet.mockResolvedValue(ALBUMS_PAGE);

    const albums = await getSpotifyArtistAlbums('ar-1', 50);

    expect(mockedGet).toHaveBeenCalledWith(
      '/artists/ar-1/albums?limit=50&include_groups=album%2Csingle%2Ccompilation'
    );
    expect(albums).toHaveLength(1);
  });

  it('clamps the requested limit to the Spotify ceiling', async () => {
    mockedGet.mockResolvedValue(ALBUMS_PAGE);

    await getSpotifyArtistAlbums('ar-1', 900);

    expect(mockedGet.mock.calls[0][0]).toContain('limit=50');
  });

  it('returns an empty discography rather than throwing on an odd payload', async () => {
    mockedGet.mockResolvedValue(null);

    await expect(getSpotifyArtistAlbums('ar-1')).resolves.toEqual([]);
  });
});
