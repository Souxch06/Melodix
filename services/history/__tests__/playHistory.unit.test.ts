import { TrackModel } from '@models';

import {
  clearPlayHistory,
  getRecentlyPlayedAlbumLike,
  getRecentlyPlayedTracks,
  getTopAlbumsFromHistory,
  getTopArtistsFromHistory,
  hasPlayHistory,
  MAX_HISTORY,
  recordPlay,
} from '../playHistory';

const track = (id: string, artist = 'Artist', album?: string): TrackModel => ({
  id,
  title: `Track ${id}`,
  subtitle: artist,
});

describe('playHistory (historique local)', () => {
  beforeEach(async () => {
    await clearPlayHistory();
  });

  afterAll(async () => {
    await clearPlayHistory();
  });

  it('enregistre les lectures, les plus récentes d abord', async () => {
    expect(await hasPlayHistory()).toBe(false);

    await recordPlay(track('1'));
    await recordPlay(track('2'));

    const recent = await getRecentlyPlayedTracks();
    expect(recent.map(({ track: t }) => t.id)).toEqual(['2', '1']);
    expect(await hasPlayHistory()).toBe(true);
  });

  it('déduplique : rejouer un morceau le remonte en tête', async () => {
    await recordPlay(track('1'));
    await recordPlay(track('2'));
    await recordPlay(track('1'));

    const recent = await getRecentlyPlayedTracks();
    expect(recent.map(({ track: t }) => t.id)).toEqual(['1', '2']);
    expect(recent).toHaveLength(2);
  });

  it('borne la taille à MAX_HISTORY', async () => {
    for (let i = 0; i < MAX_HISTORY + 20; i += 1) {
      await recordPlay(track(`bulk-${i}`));
    }
    const recent = await getRecentlyPlayedTracks(MAX_HISTORY + 20);
    expect(recent).toHaveLength(MAX_HISTORY);
    // Le plus ancien (bulk-0) a été évincé.
    expect(recent.find(({ track: t }) => t.id === 'bulk-0')).toBeUndefined();
    expect(recent[0].track.id).toBe(`bulk-${MAX_HISTORY + 19}`);
  });

  it('getRecentlyPlayedAlbumLike privilégie l album sans doublonner', async () => {
    await recordPlay(track('a', 'Daft Punk'), { albumTitle: 'Discovery' });
    await recordPlay(track('b', 'Daft Punk'), { albumTitle: 'Discovery' });
    await recordPlay(track('c', 'Air'), { albumTitle: 'Moon Safari' });

    const items = await getRecentlyPlayedAlbumLike();
    expect(items.map((item) => item.title)).toEqual([
      'Moon Safari',
      'Discovery',
    ]);
  });

  it('top artistes/albums = compte de lectures, à égalité le plus récent', async () => {
    await recordPlay(track('1', 'A'), { albumTitle: 'Album A' });
    await recordPlay(track('2', 'B'), { albumTitle: 'Album B' });
    await recordPlay(track('3', 'B'), { albumTitle: 'Album B' });

    const top = await getTopArtistsFromHistory(1);
    expect(top).toHaveLength(1);
    expect(top[0].name).toBe('B');
    expect(top[0].count).toBe(2);

    const topAlbums = await getTopAlbumsFromHistory(1);
    expect(topAlbums[0].title).toBe('Album B');
    expect(topAlbums[0].count).toBe(2);
  });

  it('getTopAlbumsFromHistory ignore les lectures sans album', async () => {
    await recordPlay(track('orphan', 'Solo'));
    expect(await getTopAlbumsFromHistory(5)).toEqual([]);
  });

  it('clearPlayHistory remet tout à zéro', async () => {
    await recordPlay(track('x'));
    await clearPlayHistory();
    expect(await hasPlayHistory()).toBe(false);
    expect(await getRecentlyPlayedTracks()).toEqual([]);
  });

  it('snapshot sans état de lecture transitoire', async () => {
    const playingTrack = { ...track('live'), isPlaying: true };
    await recordPlay(playingTrack);
    const [entry] = await getRecentlyPlayedTracks();
    expect(entry.track.isPlaying).toBe(false);
  });
});
