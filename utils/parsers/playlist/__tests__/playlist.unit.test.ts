import { PlaylistItemResponseType, PlaylistResponseType } from '@config';

import { parseToPlaylist } from '../parseToPlaylist';
import { parseFromPlaylistItemsToTracks } from '../parseFromPlaylistItemsToTracks';

const basePlaylist = {
  type: 'playlist',
  id: 'playlist-1',
  collaborative: false,
  description: 'Summer hits',
  href: '',
  name: 'Road trip',
  owner: {
    display_name: 'Souxch06',
    href: '',
    id: 'user-1',
    type: 'user',
    uri: '',
  },
  primary_color: null,
  public: true,
  snapshot_id: '',
  uri: '',
  images: [{ url: 'cover.jpg', height: null, width: null }],
  followers: { total: 1234 },
} as unknown as PlaylistResponseType;

const track = (id: string | null, durationMs = 60000) => ({
  id,
  name: `Track ${id}`,
  duration_ms: durationMs,
  explicit: false,
  artists: [{ name: 'Artist A' }, { name: 'Artist B' }],
  album: { images: [{ url: `${id}.jpg` }] },
});

describe('parseToPlaylist', () => {
  it('reads the February 2026 shape (items / item)', () => {
    const playlist = parseToPlaylist({
      ...basePlaylist,
      items: {
        total: 2,
        items: [{ item: track('t1') }, { item: track('t2', 120000) }],
      },
    });

    expect(playlist).toMatchObject({
      id: 'playlist-1',
      title: 'Road trip',
      subtitle: 'Souxch06',
      ownerId: 'user-1',
      imageURL: 'cover.jpg',
      tracks: { total: 2 },
    });
    expect(playlist.info).toContain('1,234');
  });

  it('still reads the legacy shape (tracks / track)', () => {
    const playlist = parseToPlaylist({
      ...basePlaylist,
      tracks: { total: 1, items: [{ track: track('t1') }] },
    });

    expect(playlist.tracks.total).toBe(1);
  });

  it('handles playlists returned without contents or cover', () => {
    // Playlists the user does not own come without `items` since February 2026.
    const playlist = parseToPlaylist({
      ...basePlaylist,
      images: [],
      followers: undefined,
    } as unknown as PlaylistResponseType);

    expect(playlist.tracks.total).toBe(0);
    expect(playlist.imageURL).toBe('');
    expect(playlist.info).toBe('');
  });
});

describe('parseFromPlaylistItemsToTracks', () => {
  it('supports `item` and `track`, and skips unavailable or local items', () => {
    const items = [
      { item: track('t1') },
      { track: track('t2') },
      { item: null },
      { item: track(null) },
      { item: { ...track('t3'), album: { images: [] } } },
    ] as PlaylistItemResponseType[];

    expect(parseFromPlaylistItemsToTracks(items)).toEqual([
      {
        id: 't1',
        title: 'Track t1',
        subtitle: 'Artist A, Artist B',
        imageURL: 't1.jpg',
        explicit: false,
      },
      {
        id: 't2',
        title: 'Track t2',
        subtitle: 'Artist A, Artist B',
        imageURL: 't2.jpg',
        explicit: false,
      },
      {
        id: 't3',
        title: 'Track t3',
        subtitle: 'Artist A, Artist B',
        imageURL: '',
        explicit: false,
      },
    ]);
  });
});
