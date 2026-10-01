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
    expect(items[1]).toMatchObject({
      id: 'b',
      durationMs: null,
      albumName: null,
    });
  });
});

describe('getPlaylistItems — repli backend : pagination (I-7)', () => {
  const backendTracksOf = (count: number) => ({
    id: 'pl',
    title: 'Playlist',
    owner: 'Spotify',
    coverUrl: null,
    description: null,
    tracks: Array.from({ length: count }, (_, i) => ({
      id: `t${i}`,
      title: `Song ${i}`,
      artists: ['Art'],
      album: `Album ${i}`,
      durationMs: 100_000 + i,
      coverUrl: null,
      audiusMatch: null,
    })),
  });

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('100 tracks : page 0 (offset=0, limit=50) → morceaux 0..49', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(100));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 0,
    });

    expect(items).toHaveLength(50);
    expect(items[0].id).toBe('t0');
    expect(items[49].id).toBe('t49');
    // Métadonnées I-2 conservées sur la page servie.
    expect(items[0]).toMatchObject({
      durationMs: 100_000,
      albumName: 'Album 0',
    });
    expect(items[49]).toMatchObject({
      durationMs: 100_049,
      albumName: 'Album 49',
    });
  });

  it('100 tracks : page 1 (offset=50, limit=50) → morceaux 50..99', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(100));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 50,
    });

    expect(items).toHaveLength(50);
    expect(items[0].id).toBe('t50');
    expect(items[49].id).toBe('t99');
  });

  it('page 0 puis page 1 : aucun doublon entre les pages', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(100));

    const page0 = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 0,
    });
    const page1 = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 50,
    });
    const ids0 = new Set(page0.map(({ id }) => id));

    expect(page1.some(({ id }) => ids0.has(id))).toBe(false);
  });

  it('100 tracks : offset=100 (fin atteinte) → []', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(100));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 100,
    });

    expect(items).toEqual([]);
  });

  it('dernière page partielle : 75 tracks, offset=50 → 25 morceaux', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(75));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 50,
    });

    expect(items).toHaveLength(25);
    expect(items[0].id).toBe('t50');
    expect(items[24].id).toBe('t74');
  });

  it('playlist plus courte que limit : 30 tracks → 30 morceaux', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(30));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 0,
    });

    expect(items).toHaveLength(30);
  });

  it('playlist exactement égale à limit : 50 tracks → 50, page suivante []', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(50));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 0,
    });
    const after = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 50,
    });

    expect(items).toHaveLength(50);
    expect(after).toEqual([]);
  });

  it('playlist vide → []', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(0));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: 0,
    });

    expect(items).toEqual([]);
  });

  it('bornes sûres : offset négatif traité comme 0', async () => {
    backendGetPlaylistMock.mockResolvedValue(backendTracksOf(100));

    const items = await getPlaylistItems({
      playlistId: 'pl',
      limit: 50,
      offset: -10,
    });

    expect(items).toHaveLength(50);
    expect(items[0].id).toBe('t0');
  });
});
