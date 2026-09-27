import { Categories } from '@config';

import { getLibrary } from '../getLibrary';
import { getUserFollowedArtists } from '../artists';
import { getSavedAlbums } from '../albums';
import { getSavedShows } from '../shows';
import { getSavedPlaylists } from '../playlists';

jest.mock('../artists', () => ({ getUserFollowedArtists: jest.fn() }));
jest.mock('../albums', () => ({ getSavedAlbums: jest.fn() }));
jest.mock('../shows', () => ({ getSavedShows: jest.fn() }));
jest.mock('../playlists', () => ({ getSavedPlaylists: jest.fn() }));
jest.mock('../config', () => ({ fileSystemMiddleware: jest.fn() }));

const item = (id: string, type: string) => ({
  id,
  type,
  title: id,
  subtitle: '',
  imageURL: '',
});

describe('getLibrary', () => {
  beforeEach(() => {
    jest.spyOn(console, 'warn').mockImplementation(() => {});
  });

  it('keeps the other categories when one request is refused', async () => {
    (getUserFollowedArtists as jest.Mock).mockRejectedValueOnce({
      response: { status: 403 },
    });
    (getSavedAlbums as jest.Mock).mockResolvedValueOnce([item('a1', 'album')]);
    (getSavedShows as jest.Mock).mockRejectedValueOnce(new Error('403'));
    (getSavedPlaylists as jest.Mock).mockResolvedValueOnce([
      item('p1', 'playlist'),
    ]);

    const library = await getLibrary();

    expect(library[Categories.FOLLOWED_ARTISTS]).toEqual([]);
    expect(library[Categories.SAVED_PODCASTS]).toEqual([]);
    expect(library[Categories.SAVED_ALBUMS]).toHaveLength(1);
    expect(library[Categories.SAVED_PLAYLISTS]).toHaveLength(1);
    expect(library[Categories.ALL].map(({ id }) => id)).toEqual(['p1', 'a1']);
  });
});
