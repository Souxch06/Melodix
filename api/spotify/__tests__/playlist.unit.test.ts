import { spotifyApiGet } from '@services';
import {
  getSpotifyPlaylist,
  getSpotifyPlaylistTracks,
  getSpotifyPlaylistTracksPage,
} from '../playlist';

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
}));

const apiMock = spotifyApiGet as jest.Mock;

const track = (id: string, name: string, artists: string[], ms = 200_000) => ({
  track: {
    id,
    name,
    duration_ms: ms,
    explicit: true,
    artists: artists.map((name) => ({ id: `a-${name}`, name })),
    album: { id: 'alb', name: 'Mon Album', images: [{ url: `cover-${id}` }] },
    is_local: false,
  },
});

describe('api/spotify/playlist — contenu d une playlist Spotify', () => {
  beforeEach(() => {
    apiMock.mockReset();
  });

  describe('getSpotifyPlaylist (métadonnées)', () => {
    it('mappe titre, description, image, propriétaire et total', async () => {
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
        description: 'période douce',
        imageURL: 'cover',
        ownerId: 'user-9',
        tracks: { total: 87 },
      });
      expect(result.subtitle).toContain('Julien');
    });
  });

  describe('getSpotifyPlaylistTracks (tous les morceaux)', () => {
    it('PAGINATION COMPLÈTE : suit next, conserve la durée et TOUS les artistes', async () => {
      apiMock
        .mockResolvedValueOnce({
          items: [
            track('t1', 'Song A', ['Alpha', 'Beta'], 123_456),
            track('t2', 'Song B', ['Gamma']),
          ],
          next: 'https://api.spotify.com/v1/playlists/pl/tracks?offset=2&limit=2',
          total: 3,
        })
        .mockResolvedValueOnce({
          items: [track('t3', 'Song C', ['Delta'])],
          next: null,
          total: 3,
        });

      const tracks = await getSpotifyPlaylistTracks('pl');

      expect(tracks.map(({ id }) => id)).toEqual(['t1', 't2', 't3']);
      // Artistes multiples CONSERVÉS, joints par virgule.
      expect(tracks[0].subtitle).toBe('Alpha, Beta');
      // Durée/ms en extension du modèle (transmise à la queue du player).
      expect((tracks[0] as { durationMs?: number }).durationMs).toBe(123_456);
      expect(tracks[0].explicit).toBe(true);
      expect(tracks[0].imageURL).toBe('cover-t1');
    });

    it('filtre les entrées vides plutôt que de lever', async () => {
      apiMock.mockResolvedValueOnce({
        items: [
          { track: null },
          { track: { id: 'sans-nom' } },
          track('ok', 'Bonne', ['Auteur']),
          null,
        ],
        next: null,
      });

      const tracks = await getSpotifyPlaylistTracks('pl');
      expect(tracks).toHaveLength(1);
      expect(tracks[0].id).toBe('ok');
    });
  });

  describe('getSpotifyPlaylistTracksPage (page native)', () => {
    it('borne limit à 100 et offset >= 0 dans l URL', async () => {
      apiMock.mockResolvedValueOnce({ items: [track('x', 'X', ['Y'])], next: null });

      await getSpotifyPlaylistTracksPage('pl', { limit: 500, offset: -4 });

      const [url] = apiMock.mock.calls[0] as [string];
      expect(url).toContain('limit=100');
      expect(url).toContain('offset=0');
      expect(url).toContain('playlists/pl/tracks');
    });

    it('renvoie la page mappée (les ids spotify restent nus)', async () => {
      apiMock.mockResolvedValueOnce({
        items: [track('s1', 'First', ['One', 'Two'])],
        next: null,
      });

      const page = await getSpotifyPlaylistTracksPage('pl', {
        limit: 20,
        offset: 0,
      });

      // id nu (pas de préfixe) : le player le préfixe au moment de la queue,
      // puis audiusTrackMatcher fait la correspondance pour l audio.
      expect(page[0].id).toBe('s1');
      expect(page[0].subtitle).toBe('One, Two');
    });
  });
});
