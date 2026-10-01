/**
 * Endpoint des morceaux d'une playlist Spotify — CONTRAT ACTUEL DE L'API :
 *   GET /v1/playlists/{id}/items, pages de 50 (≤ 50), pagination intégrale
 *   jusqu'à next === null, format d'item `{ item: ... }` (legacy
 *   `{ track: ... }` accepté), filtrage des épisodes/fichiers locaux/pistes
 *   défaillantes.
 *
 * 5C.1 : l'ancien endpoint /tracks est RETIRÉ par Spotify (changelog
 * officiel février 2026) — un 404 /items est PROPAGÉ (plus de repli), et
 * les compteurs de diagnostic (reçus → valides → créés → transmis) sont
 * journalisés via spotifyLog('playlist.items.counts' / '.page').
 */
import { SpotifyApiError, spotifyApiGet, spotifyLog } from '@services';
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
const logMock = spotifyLog as jest.Mock;

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
    logMock.mockClear();
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

  it('métadonnées : lit items.total (rename `tracks`→`items`, API 2026)', async () => {
    apiMock.mockResolvedValueOnce({
      id: 'pl-2',
      name: 'Hits',
      owner: { id: 'spotify' },
      items: { total: 42 },
    });

    const result = await getSpotifyPlaylist('pl-2');

    expect(result.tracks.total).toBe(42);
    expect(result.info).toContain('42');
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
        {
          item: { id: 'n1', name: 'Neuf', artists: [{ name: 'A' }] },
          track: { id: 'ignorer' },
        },
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
        {
          item: {
            id: 'loc',
            name: 'Local MP3',
            is_local: true,
            artists: [{ name: 'Moi' }],
          },
        },
        { item: null }, // indisponible / droits retirés
        { item: { id: 'or', name: undefined } }, // données incomplètes
        item('ok', 'Bonne', ['Auteur']),
      ],
      next: null,
    });

    const tracks = await getSpotifyPlaylistTracks('pl');
    expect(tracks.map(({ id }) => id)).toEqual(['ok']);
  });

  it('5C.1 : /items répond 404 → erreur PROPAGÉE, aucun appel /tracks (endpoint retiré)', async () => {
    apiMock.mockRejectedValueOnce(
      new SpotifyApiError('http', 'not found', 404)
    );

    await expect(getSpotifyPlaylistTracks('pl')).rejects.toMatchObject({
      kind: 'http',
      status: 404,
    });

    // Endpoint /tracks OFFICIELLEMENT RETIRÉ (février 2026) : un seul appel,
    // jamais de second 404 silencieux qui masquait la vraie cause.
    expect(apiMock).toHaveBeenCalledTimes(1);
    const [onlyUrl] = apiMock.mock.calls[0] as [string];
    expect(onlyUrl).toContain('/playlists/pl/items');
  });

  it('erreurs NON 404 propagées (401/session, réseau…)', async () => {
    apiMock.mockRejectedValueOnce(new SpotifyApiError('network', 'offline'));
    await expect(getSpotifyPlaylistTracks('pl')).rejects.toMatchObject({
      kind: 'network',
    });
    expect(apiMock).toHaveBeenCalledTimes(1);
  });

  it('page native : borne limit à 50, offset ≥ 0', async () => {
    apiMock.mockResolvedValueOnce({
      items: [item('p1', 'Page', ['Un'])],
      next: null,
    });

    await getSpotifyPlaylistTracksPage('pl', { limit: 500, offset: -4 });

    const [url] = apiMock.mock.calls[0] as [string];
    expect(url).toContain('/playlists/pl/items');
    expect(url).toContain('limit=50'); // 500 borné à 50, JAMAIS 100
    expect(url).toContain('offset=0');
  });

  it('5C.1 : page native 404 → propagée, jamais de repli /tracks', async () => {
    apiMock.mockRejectedValueOnce(
      new SpotifyApiError('http', 'not found', 404)
    );

    await expect(
      getSpotifyPlaylistTracksPage('pl', { limit: 30, offset: 5 })
    ).rejects.toMatchObject({ kind: 'http', status: 404 });

    expect(apiMock).toHaveBeenCalledTimes(1);
  });

  it('5C.1 — COMPTEURS DEV : reçus → valides → créés → transmis journalisés', async () => {
    apiMock.mockResolvedValueOnce({
      items: [
        item('t1', 'Song A', ['Alpha']),
        { item: { id: 'e1', name: 'Episode', type: 'episode' } }, // filtré
        { item: null }, // indisponible
      ],
      next: null,
      total: 3,
    });

    await getSpotifyPlaylistTracksPage('pl', { limit: 50, offset: 0 });

    const counters = logMock.mock.calls
      .filter((call) => call[0] === 'playlist.items.counts')
      .map((call) => call[1] as Record<string, unknown>);

    expect(counters).toHaveLength(1);
    expect(counters[0]).toMatchObject({
      itemsReceived: 3,
      tracksValid: 1,
      tracksCreated: 1,
      sentToScreen: 1,
    });

    // Chemin intégral : mêmes compteurs agrégés sur toutes les pages.
    apiMock.mockReset();
    logMock.mockClear();
    apiMock.mockResolvedValueOnce({
      items: [item('t2', 'Song B', ['Beta'])],
      next: null,
      total: 1,
    });

    await getSpotifyPlaylistTracks('pl');

    const total = logMock.mock.calls
      .filter((call) => call[0] === 'playlist.items.counts')
      .map((call) => call[1] as Record<string, unknown>);
    expect(total).toHaveLength(1);
    expect(total[0]).toMatchObject({
      itemsReceived: 1,
      tracksValid: 1,
      tracksCreated: 1,
      sentToScreen: 1,
    });
  });
});
