/**
 * Playlists personnelles du compte Spotify connecté (GET /v1/me/playlists).
 *
 * - PAGINATION COMPLÈTE : on suit `next` jusqu'à épuisement — jamais limité
 *   aux 20/50 premières playlists ;
 * - cache mémoire+AsyncStorage TTL 10 min : ouvrir/revenir à la bibliothèque
 *   ne re-questionne pas Spotify en boucle ; un refresh utilisateur invalide
 *   le cache (Spotify reste la source de vérité — cf. invalidate…) ;
 * - en cas d'échec : exception `SpotifyApiError` typée (messages utilisateur
 *   gérés côté écran).
 */
import AsyncStorage from '@react-native-async-storage/async-storage';

import { spotifyApiGet, spotifyDiag, spotifyLog } from '@services';
import { LibraryItemModel } from '@models';

const CACHE_STORAGE_KEY = '@melodix/spotify-user-playlists';
const CACHE_TTL_MS = 10 * 60 * 1000;
const PAGE_SIZE = 50;

type SpotifyPlaylistRaw = {
  id?: string;
  name?: string;
  description?: string | null;
  images?: { url?: string }[] | null;
  owner?: { id?: string; display_name?: string | null } | null;
  tracks?: { total?: number } | null;
  collaborative?: boolean;
  public?: boolean | null;
};

type PagedResult<T> = {
  items?: T[] | null;
  total?: number;
  limit?: number;
  offset?: number;
  next?: string | null;
};

type PlaylistCacheEnvelope = {
  cachedAt: number;
  data: LibraryItemModel[];
};

let memoryCache: { cachedAt: number; data: LibraryItemModel[] } | null = null;

const toLibraryItem = (
  raw: SpotifyPlaylistRaw | null
): LibraryItemModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  return {
    id: raw.id,
    type: 'playlist',
    title: raw.name,
    subtitle: `Par ${raw.owner?.display_name || raw.owner?.id || 'Spotify'}`,
    imageURL: raw.images?.[0]?.url ?? '',
    totalTracks:
      typeof raw.tracks?.total === 'number' ? raw.tracks.total : undefined,
    ownerId: raw.owner?.id,
  };
};

const readPersistedCache = async (): Promise<PlaylistCacheEnvelope | null> => {
  try {
    const raw = await AsyncStorage.getItem(CACHE_STORAGE_KEY);
    if (!raw) {
      return null;
    }
    const parsed = JSON.parse(raw) as PlaylistCacheEnvelope;
    if (!Array.isArray(parsed?.data) || typeof parsed?.cachedAt !== 'number') {
      return null;
    }
    return parsed;
  } catch {
    return null;
  }
};

const persistCache = async (data: LibraryItemModel[]): Promise<void> => {
  memoryCache = { cachedAt: Date.now(), data };
  try {
    await AsyncStorage.setItem(
      CACHE_STORAGE_KEY,
      JSON.stringify({ cachedAt: Date.now(), data } as PlaylistCacheEnvelope)
    );
  } catch {
    // Le cache est une optimisation : un stockage indisponible n'est pas fatal.
  }
};

/** Tests uniquement : vide le cache MÉMOIRE (le cache AsyncStorage persiste). */
export const __resetUserPlaylistsMemoryCacheForTests = (): void => {
  memoryCache = null;
};

/** Invalidation explicite (pull-to-refresh, déconnexion, ajout d'un morceau). */
export const invalidateUserPlaylistsCache = async (): Promise<void> => {
  memoryCache = null;
  try {
    await AsyncStorage.removeItem(CACHE_STORAGE_KEY);
  } catch {
    // Non bloquant.
  }
};

const fetchAllUserPlaylists = async (): Promise<LibraryItemModel[]> => {
  const collected: SpotifyPlaylistRaw[] = [];
  let nextPath: string | null =
    `/me/playlists?limit=${PAGE_SIZE}&offset=0`;

  spotifyDiag('PLAYLISTS', 'START');
  try {
    // Suit les liens `next` de la pagination Spotify jusqu'à épuisement.
    while (nextPath) {
      const page: PagedResult<SpotifyPlaylistRaw> = await spotifyApiGet<PagedResult<SpotifyPlaylistRaw>>(nextPath);
      const items = Array.isArray(page?.items) ? page.items : [];
      collected.push(...items);
      nextPath = page?.next ?? null;
    }
  } catch (error) {
    const kind =
      error && typeof error === 'object' && 'kind' in error
        ? String((error as { kind?: unknown }).kind)
        : 'exception';
    spotifyDiag('PLAYLISTS', `FAILED(${kind})`);
    spotifyLog('playlists.fetch.failed', { cause: kind });
    throw error;
  }

  spotifyDiag('PLAYLISTS', `SUCCESS(${collected.length})`);
  return collected
    .map(toLibraryItem)
    .filter((item): item is LibraryItemModel => !!item);
};

/**
 * Toutes les playlists personnelles (propriétaire + suivies + collaboratives),
 * du plus récent accès mis en cache, Spotify sinon.
 */
export const getUserPlaylists = async ({
  forceRefresh = false,
}: { forceRefresh?: boolean } = {}): Promise<LibraryItemModel[]> => {
  if (!forceRefresh) {
    const now = Date.now();
    if (memoryCache && now - memoryCache.cachedAt < CACHE_TTL_MS) {
      return memoryCache.data;
    }

    const persisted = await readPersistedCache();
    if (persisted && now - persisted.cachedAt < CACHE_TTL_MS) {
      memoryCache = persisted;
      return persisted.data;
    }
  }

  const data = await fetchAllUserPlaylists();
  await persistCache(data);
  return data;
};
