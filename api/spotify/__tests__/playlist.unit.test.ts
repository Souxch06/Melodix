/**
 * Endpoint des morceaux d'une playlist Spotify — CONTRAT ACTUEL DE L'API :
 *   GET /v1/playlists/{id}/items, pages de 50 (≤ 50), pagination intégrale
 *   jusqu'à next === null, nouveau format d'item `{ item: ... }` (legacy
 *   `{ track: ... }` accepté), filtrage des épisodes/fichiers locaux/pistes
 *   défaillantes, repli complet vers /tracks sur 404 transitoire.
 */
import { SpotifyApiError, spotifyApiGet } from '@services';
import {
  getSpotifyPlaylist,
  getSpotifyPlaylistTracks,
  getSpotifyPlaylistTracksPage,
} from '../playlist';

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
  spotifyLog: jest.fn(),
  SpotifyApiError: class SpotifyApiError extends Error {
    public kind: string;
    public status?: number;
    constructor(kind: string, message: string, status?: number) {
      super(message);
      this.name = 'SpotifyApiError';
      this.kind = kind;
      this.status = status;
    }
  },
}));

const apiMock = spotifyApiGet as jest.Mock;

/** Morceau Spotify au NOUVEAU format /items (wrapper `item`). */
const item = (id: string, name: string, artists: string[], ms = 200_000) => ({
  item: {
    id,
    name,
    type: 'track',
    duration_ms: ms,
    explicit: true,
    artists: artists.map((artist) => ({ id: `a-${artist}`, name: artist })),
    album: { id: 'alb', name: 'Mon Album', images: [{ url: `cover-${id}` }] },
    is_local: false,
  },
});

/** Format LEGACY (wrapper `track`) — doit rester accepté. */
const legacy = (id: string, name: string, artists: string[], ms = 200_000) => ({
  track: {
    id,
    name,
    type: 'track',
    duration_ms: ms,
    explicit: true,
    artists: artists.map((artist) => ({ id: `a-${artist}`, name: artist })),
    album: { id: 'alb', name: 'Mon Album', images: [{ url: `cover-${id}` }] },
    is_local: false,
  },
});

describe('api/spotify/playlist — endpoint /items (contrat actuel)', () => {
  beforeEach(() => {
    apiMock.mockReset();
  });

  it('getSpotifyPlaylist (métadonnées) : mapping inchangé', async () => {
    apiMock.mockResolvedValueOnce({
      id: 'pl-1',
      name: 'Chill Vibes',
      description: 'période douce',
      images: [{ url: 'cover' }],
      owner: { id: 'user-9', display_name: 'Julien' },
      tracks: { total: 87 },
    });

    const result = await getSpotifyPlaylist('pl-1');

    expect(result).toMatchObject({
      type: 'playlist',
      id: 'pl-1',
      title: 'Chill Vibes',
      imageURL: 'cover',
      ownerId: 'user-9',
      tracks: { total: 87 },
    });
    expect(result.subtitle).toContain('Julien');
  });

  it('PAGINATION COMPLÈTE : URL initiale /items limit=50, next suivi jusqu à null', async () => {
    apiMock
      .mockResolvedValueOnce({
        items: [item('t1', 'Song A', ['Alpha', 'Beta'], 123_456)],
        next: 'https://api.spotify.com/v1/playlists/pl/items?offset=50&limit=50',
        total: 2,
      })
      .mockResolvedValueOnce({
        items: [item('t2', 'Song B', ['Gamma'])],
        next: null,
        total: 2,
      });

    const tracks = await getSpotifyPlaylistTracks('pl');

    expect(tracks.map(({ id }) => id)).toEqual(['t1', 't2']);
    expect(tracks[0].subtitle).toBe('Alpha, Beta');
    expect((tracks[0] as { durationMs?: number }).durationMs).toBe(123_456);
    expect(tracks[0].explicit).toBe(true);
    expect(tracks[0].imageURL).toBe('cover-t1');

    const [firstUrl] = apiMock.mock.calls[0] as [string];
    expect(firstUrl).toContain('/playlists/pl/items');
    expect(firstUrl).toContain('limit=50');
    expect(firstUrl).not.toContain('limit=100');
  });

  it('NOUVEAU FORMAT : wrapper item prioritaire ; legacy track accepté', async () => {
    apiMock.mockResolvedValueOnce({
      items: [
        { item: { id: 'n1', name: 'Neuf', artists: [{ name: 'A' }] }, track: { id: 'ignorer' } },
        legacy('l1', 'Legacy', ['B']),
      ],
      next: null,
    });

    const tracks = await getSpotifyPlaylistTracks('pl');
    expect(tracks.map(({ id }) => id)).toEqual(['n1', 'l1']);
  });

  it('FILTRAGE : épisodes, fichiers locaux et items incomplets exclus', async () => {
    apiMock.mockResolvedValueOnce({
      items: [
        { item: { id: 'e1', name: 'Episode 12', type: 'episode' } }, // podcast → rejeté
        { item: { id: 'loc', name: 'Local MP3', is_local: true, artists: [{ name: 'Moi' }] } },
        { item: null }, // indisponible / droits retirés
        { item: { id: 'or', name: undefined } }, // données incomplètes
        item('ok', 'Bonne', ['Auteur']),
      ],
      next: null,
    });

    const tracks = await getSpotifyPlaylistTracks('pl');
    expect(tracks.map(({ id }) => id)).toEqual(['ok']);
  });

  it('REPLI : /items répond 404 → reprise INTÉGRALE sur /tracks, limit ≤ 50', async () => {
    apiMock
      .mockRejectedValueOnce(new SpotifyApiError('http', 'not found', 404))
      .mockResolvedValueOnce({
        items: [legacy('x1', 'Ancienne', ['Legacy'])],
        next: null,
        total: 1,
      });

    const tracks = await getSpotifyPlaylistTracks('pl');

    expect(tracks).toHaveLength(1);
    expect(tracks[0].id).toBe('x1');
    const [fallbackUrl] = apiMock.mock.calls[1] as [string];
    expect(fallbackUrl).toContain('/playlists/pl/tracks');
    expect(fallbackUrl).toContain('limit=50');
    expect(fallbackUrl).not.toContain('limit=100');
  });

  it('erreurs NON 404 propagées (401/session, réseau…)', async () => {
    apiMock.mockRejectedValueOnce(new SpotifyApiError('network', 'offline'));
    await expect(getSpotifyPlaylistTracks('pl')).rejects.toMatchObject({
      kind: 'network',
    });
    expect(apiMock).toHaveBeenCalledTimes(1);
  });

  it('page native : borne limit à 50, offset ≥ 0, même repli 404', async () => {
    apiMock.mockResolvedValueOnce({ items: [item('p1', 'Page', ['Un'])], next: null });

    await getSpotifyPlaylistTracksPage('pl', { limit: 500, offset: -4 });

    const [url] = apiMock.mock.calls[0] as [string];
    expect(url).toContain('/playlists/pl/items');
    expect(url).toContain('limit=50'); // 500 borné à 50, JAMAIS 100
    expect(url).toContain('offset=0');

    apiMock.mockReset();
    apiMock
      .mockRejectedValueOnce(new SpotifyApiError('http', 'not found', 404))
      .mockResolvedValueOnce({ items: [legacy('pf', 'Fallback', ['Deux'])], next: null });

    const page = await getSpotifyPlaylistTracksPage('pl', { limit: 30, offset: 5 });
    expect(page.map(({ id }) => id)).toEqual(['pf']);
    const [fbUrl] = apiMock.mock.calls[1] as [string];
    expect(fbUrl).toContain('/playlists/pl/tracks');
    expect(fbUrl).toContain('limit=30'); // la page demandée est respectée
  });
});
