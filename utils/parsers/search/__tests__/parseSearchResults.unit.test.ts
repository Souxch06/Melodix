import { parseSearchResults } from '../parseSearchResults';

describe('parseSearchResults', () => {
  it('groups results by type, drops null entries and opens songs on their album', () => {
    const results = parseSearchResults({
      artists: {
        items: [
          {
            id: 'artist-1',
            name: 'Daft Punk',
            images: [{ url: 'artist.jpg' }],
          },
          null,
        ],
      },
      tracks: {
        items: [
          {
            id: 'track-1',
            name: 'One More Time',
            artists: [{ name: 'Daft Punk' }],
            album: { id: 'album-1', images: [] },
          },
        ],
      },
      albums: {
        items: [
          {
            id: 'album-1',
            name: 'Discovery',
            album_type: 'album',
            artists: [{ name: 'Daft Punk' }],
            images: null,
          },
          {
            id: 'album-2',
            name: 'Hit',
            album_type: 'single',
            artists: [{ name: 'X' }, { name: 'Y' }],
          },
        ],
      },
      playlists: {
        items: [
          null,
          {
            id: 'playlist-1',
            name: 'French Touch',
            owner: { display_name: 'Souxch06' },
            images: [{ url: 'playlist.jpg' }],
          },
        ],
      },
    });

    expect(results.artists).toEqual([
      {
        id: 'artist-1',
        type: 'artist',
        title: 'Daft Punk',
        subtitle: 'Artist',
        imageURL: 'artist.jpg',
      },
    ]);
    expect(results.tracks).toEqual([
      {
        id: 'album-1',
        type: 'album',
        title: 'One More Time',
        subtitle: 'Daft Punk',
        imageURL: '',
      },
    ]);
    expect(results.albums.map(({ subtitle }) => subtitle)).toEqual([
      'Daft Punk',
      'Single \u2022 X, Y',
    ]);
    expect(results.playlists).toEqual([
      {
        id: 'playlist-1',
        type: 'playlist',
        title: 'French Touch',
        subtitle: 'Souxch06',
        imageURL: 'playlist.jpg',
      },
    ]);
  });

  it('returns empty groups for an empty response', () => {
    expect(parseSearchResults({})).toEqual({
      artists: [],
      tracks: [],
      albums: [],
      playlists: [],
    });
  });
});
