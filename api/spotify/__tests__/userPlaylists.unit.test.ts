import AsyncStorage from '@react-native-async-storage/async-storage';

import { spotifyApiGet } from '@services';
import {
  getUserPlaylists,
  invalidateUserPlaylistsCache,
  __resetUserPlaylistsMemoryCacheForTests,
} from '../userPlaylists';

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
  spotifyDiag: jest.fn(),
  spotifyLog: jest.fn(),
}));

const apiMock = spotifyApiGet as jest.Mock;

const playlist = (id: string, name: string, total = 3) => ({
  id,
  name,
  description: `desc ${id}`,
  images: [{ url: `img-${id}` }],
  owner: { id: `owner-${id}`, display_name: `Owner ${id}` },
  tracks: { total },
  collaborative: false,
  public: true,
});

describe('api/spotify/userPlaylists — playlists personnelles', () => {
  beforeEach(async () => {
    await invalidateUserPlaylistsCache();
    await AsyncStorage.clear();
    apiMock.mockReset();
  });

  it('PAGINATION COMPLÈTE : suit les liens next jusqu à épuisement', async () => {
    const p1 = Array.from({ length: 50 }, (_, i) => playlist(`p1-${i}`, `A${i}`));
    const p2 = Array.from({ length: 50 }, (_, i) => playlist(`p2-${i}`, `B${i}`));
    const p3 = Array.from({ length: 23 }, (_, i) => playlist(`p3-${i}`, `C${i}`));

    apiMock
      .mockResolvedValueOnce({
        items: p1,
        next: 'https://api.spotify.com/v1/me/playlists?offset=50&limit=50',
      })
      .mockResolvedValueOnce({
        items: p2,
        next: 'https://api.spotify.com/v1/me/playlists?offset=100&limit=50',
      })
      .mockResolvedValueOnce({ items: p3, next: null });

    const playlists = await getUserPlaylists({ forceRefresh: true });

    expect(playlists).toHaveLength(123);
    expect(apiMock).toHaveBeenCalledTimes(3);
    expect(playlists[0].id).toBe('p1-0');
    expect(playlists[122].id).toBe('p3-22');
  });

  it('mapping complet : id, nom, image, propriétaire, nombre de titres', async () => {
    apiMock.mockResolvedValueOnce({ items: [playlist('ab', 'Ma playlist', 42)], next: null });

    const [item] = await getUserPlaylists({ forceRefresh: true });

    expect(item).toMatchObject({
      id: 'ab',
      type: 'playlist',
      title: 'Ma playlist',
      imageURL: 'img-ab',
      subtitle: 'Par Owner ab',
      totalTracks: 42,
      ownerId: 'owner-ab',
    });
  });

  it('entrées invalides filtrées (sans id ou sans nom)', async () => {
    apiMock.mockResolvedValueOnce({
      items: [{ name: 'Sans id' }, playlist('ok', 'OK'), null, { id: 'noname' }],
      next: null,
    });

    const items = await getUserPlaylists({ forceRefresh: true });
    expect(items).toHaveLength(1);
    expect(items[0].id).toBe('ok');
  });

  it('cache mémoire : deuxième lecture sans nouvel appel', async () => {
    apiMock.mockResolvedValue({ items: [playlist('x', 'Cached')], next: null });

    await getUserPlaylists({ forceRefresh: true });
    const second = await getUserPlaylists();

    expect(second).toHaveLength(1);
    expect(apiMock).toHaveBeenCalledTimes(1);
  });

  it('forceRefresh invalide le cache (synchronisation Spotify)', async () => {
    apiMock
      .mockResolvedValueOnce({ items: [playlist('v1', 'Avant')], next: null })
      .mockResolvedValueOnce({ items: [playlist('v2', 'Apres')], next: null });

    const before = await getUserPlaylists({ forceRefresh: true });
    expect(before[0].id).toBe('v1');

    const after = await getUserPlaylists({ forceRefresh: true });
    expect(after[0].id).toBe('v2');
    expect(apiMock).toHaveBeenCalledTimes(2);
  });

  it('erreur propagée typée (l écran décide du message)', async () => {
    apiMock.mockRejectedValueOnce(new Error('down'));
    await expect(getUserPlaylists({ forceRefresh: true })).rejects.toThrow('down');
  });

  it('le cache persisté survit à un vidage du cache mémoire', async () => {
    apiMock.mockResolvedValue({ items: [playlist('persist', 'P')], next: null });
    await getUserPlaylists({ forceRefresh: true });

    // Simule un redémarrage de l app : mémoire perdue, AsyncStorage intact.
    __resetUserPlaylistsMemoryCacheForTests();

    const items = await getUserPlaylists();
    expect(items).toHaveLength(1);
    expect(apiMock).toHaveBeenCalledTimes(1);
  });
});
