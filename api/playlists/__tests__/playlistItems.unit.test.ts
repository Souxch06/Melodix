/**
 * I-2 — repli backend de getPlaylistItems (playlists éditoriales/algorithmiques
 * et mode invité) : durée + album du DTO sont propagés aux TrackModel, sinon
 * badge de disponibilité et lecture matchaient avec des métadonnées jetées.
 */
import { getPlaylistItems } from '../playlist';
import { backendGetPlaylist } from '../../backend';

jest.mock('@services', () => ({
  isSpotifySessionActive: jest.fn(async () => false),
  SpotifyApiError: class SpotifyApiError extends Error {
    public kind: string;
    constructor(errorKind: string, message: string) {
      super(message);
      this.kind = errorKind;
    }
  },
}));

jest.mock('../../backend', () => ({
  backendGetPlaylist: jest.fn(),
}));

const backendGetPlaylistMock = backendGetPlaylist as jest.Mock;

describe('getPlaylistItems — repli backend (I-2)', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('propage durée + album du DTO vers les TrackModel', async () => {
    backendGetPlaylistMock.mockResolvedValue({
      id: 'pl',
      title: 'Playlist',
      owner: 'Spotify',
      coverUrl: null,
      description: null,
      tracks: [
        {
          id: 'a',
          title: 'Song A',
          artists: ['Art A'],
          album: 'Album P',
          durationMs: 200_000,
          coverUrl: 'https://cover/a.jpg',
          audiusMatch: null,
        },
        {
          id: 'b',
          title: 'Song B',
          artists: ['Art B'],
          album: null,
          durationMs: null,
          coverUrl: null,
          audiusMatch: null,
        },
      ],
    });

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 0,
    });

    expect(items).toHaveLength(2);
    expect(items[0]).toMatchObject({
      id: 'a',
      durationMs: 200_000,
      albumName: 'Album P',
    });
    // Source incomplète → null propagé, jamais d'invention.
    expect(items[1]).toMatchObject({ id: 'b', durationMs: null, albumName: null });
  });
});
