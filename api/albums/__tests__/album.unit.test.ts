import { isSpotifySessionActive, SpotifyApiError } from '@services';

import { getSpotifyAlbum } from '../../spotify/album';
import { backendGetAlbum } from '../../backend';

import { getAlbum } from '../album';

// Contrat de cascade — IDENTIQUE à api/playlists/playlist.ts :
//   session Spotify active → source complète du compte ;
//   session morte / source indisponible → repli backend Melodix ;
//   session réellement expirée → ERREUR remontée (reconnexion), jamais un
//   repli silencieux qui masquerait une session morte.

jest.mock('@services', () => ({
  isSpotifySessionActive: jest.fn(),
  SpotifyApiError: class SpotifyApiErrorMock {
    kind: string;
    message: string;
    status?: number;
    constructor(kind: string, message: string, status?: number) {
      this.kind = kind;
      this.message = message;
      this.status = status;
    }
  },
}));

jest.mock('../../backend', () => ({
  backendGetAlbum: jest.fn(),
  backendGetArtist: jest.fn(),
  dtoAlbumToLibraryItem: jest.fn(),
  dtoTrackToTrackModel: jest.fn(),
}));

jest.mock('../../spotify/album', () => ({
  getSpotifyAlbum: jest.fn(),
}));

jest.mock('../../spotify/artist', () => ({
  getSpotifyArtist: jest.fn(),
}));

const mockedIsSpotifySessionActive =
  isSpotifySessionActive as jest.MockedFunction<typeof isSpotifySessionActive>;
const mockedGetSpotifyAlbum = getSpotifyAlbum as jest.MockedFunction<
  typeof getSpotifyAlbum
>;
const mockedBackendGetAlbum = backendGetAlbum as jest.MockedFunction<
  typeof backendGetAlbum
>;

const backendDto: import('../../backend/dto').AlbumMetadataDTO = {
  id: 'al-1',
  artists: ['Daft Punk'],
  title: 'Discovery',
  coverUrl: 'https://img.example/backend.jpg',
  releaseDate: '2001-03-12',
  tracks: [
    {
      id: 'tr-1',
      title: 'One More Time',
      artists: ['Daft Punk'],
      album: 'Discovery',
      durationMs: 320_000,
      coverUrl: 'https://img.example/backend.jpg',
      audiusMatch: null,
    },
  ],
};

let warnSpy: jest.SpyInstance;
let errorSpy: jest.SpyInstance;

beforeEach(() => {
  jest.clearAllMocks();
  mockedIsSpotifySessionActive.mockResolvedValue(false);
  warnSpy = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  errorSpy = jest.spyOn(console, 'error').mockImplementation(() => undefined);
});

afterEach(() => {
  warnSpy.mockRestore();
  errorSpy.mockRestore();
});

describe('getAlbum — cascade session → backend', () => {
  it('uses the Spotify session when one is active, with no backend call', async () => {
    mockedIsSpotifySessionActive.mockResolvedValue(true);
    mockedGetSpotifyAlbum.mockResolvedValue({
      id: 'al-1',
      type: 'album',
      albumType: 'album',
      name: 'Discovery',
      imageURL: 'https://i.scdn.co/discovery.jpg',
      artists: [{ type: 'artist', id: 'ar-1' }],
      releaseDate: '2001-03-12',
      tracks: { total: 14, items: [] },
      duration: 0,
      copyrights: [],
      genres: [],
      label: '',
    });

    const album = await getAlbum('al-1');

    expect(mockedGetSpotifyAlbum).toHaveBeenCalledWith('al-1');
    expect(mockedBackendGetAlbum).not.toHaveBeenCalled();
    expect(album.tracks.total).toBe(14);
  });

  it('falls back to the backend when the session source is unavailable', async () => {
    mockedIsSpotifySessionActive.mockResolvedValue(true);
    mockedGetSpotifyAlbum.mockRejectedValue(new Error('spotify down'));
    mockedBackendGetAlbum.mockResolvedValue(backendDto);

    const album = await getAlbum('al-1');

    expect(mockedBackendGetAlbum).toHaveBeenCalledWith('al-1');
    expect(album.tracks.items[0]).toMatchObject({
      id: 'tr-1',
      title: 'One More Time',
      subtitle: 'Daft Punk',
      durationMs: 320_000,
    });
    // Le repli est journalisé avec sa CAUSE, jamais en silence.
    expect(warnSpy).toHaveBeenCalled();
  });

  it('propagates a dead session so the screen can reconnect', async () => {
    mockedIsSpotifySessionActive.mockResolvedValue(true);
    mockedGetSpotifyAlbum.mockRejectedValue(
      new SpotifyApiError('unauthenticated', 'expirée', 401)
    );

    await expect(getAlbum('al-1')).rejects.toBeInstanceOf(SpotifyApiError);
    expect(mockedBackendGetAlbum).not.toHaveBeenCalled();
  });

  it('never calls Spotify when no session is active', async () => {
    mockedIsSpotifySessionActive.mockResolvedValue(false);
    mockedBackendGetAlbum.mockResolvedValue(backendDto);

    await getAlbum('al-1');

    expect(mockedGetSpotifyAlbum).not.toHaveBeenCalled();
    expect(mockedBackendGetAlbum).toHaveBeenCalledTimes(1);
  });

  it('propagates a backend failure instead of inventing an empty album', async () => {
    mockedIsSpotifySessionActive.mockResolvedValue(false);
    mockedBackendGetAlbum.mockRejectedValue(new Error('backend down'));

    await expect(getAlbum('al-1')).rejects.toThrow('backend down');
    expect(errorSpy).toHaveBeenCalled();
  });
});
