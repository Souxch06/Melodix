/**
 * SpotifyMetadataProvider — façade serveur, IMPLÉMENTATION REMPLAÇABLE.
 *
 * Contrat (interface utilisée par les routes) :
 *   searchTracks(query, limit) → TrackMetadataDTO[]
 *   searchAlbums(query, limit) → AlbumMetadataDTO[]
 *   getTrack(id)               → TrackMetadataDTO
 *   getAlbum(id)               → AlbumMetadataDTO
 *   getPlaylist(id)            → PlaylistMetadataDTO
 *   getArtist(id)              → ArtistMetadataDTO
 *
 * Garanties propres à Melodix :
 * - jamais d'audio (métadonnées UNIQUEMENT) ;
 * - tokens éphémères serveur-side, jamais émis vers le client ;
 * - chaque appel passe par le service guard (budget + circuit breaker) :
 *   en cas de refus ou d'échec → ApiError PROVIDER_UNAVAILABLE (503) ;
 * - cache TTL (recherche + métadonnées) pour limiter l'empreinte réseau ;
 * - DTO triés de manière DÉTERMINISTE (score de pertinence de la requête,
 *   puis id) : une même requête renvoie toujours le même ordre.
 */

import { env } from '../config/env';
import {
  ApiError,
  type AlbumMetadataDTO,
  type ArtistMetadataDTO,
  type PlaylistMetadataDTO,
  type SearchResultsDTO,
  type TrackMetadataDTO,
} from '../config/types';
import { TtlCache } from '../cache/ttlCache';
import { getServiceGuard } from '../net/serviceGuard';
import { createLogger } from '../logging/logger';
import { spotifyGraphQLSearch } from './graphQLSearch';
import {
  entityCoverUrl,
  fetchEmbedPayload,
  spotifyIdFromUri,
  subtitleToArtists,
} from './embedEntity';
import type { SpotifyEmbedTrackListItem } from './types';
import { normalizeArtist, normalizeTitle, tokenSimilarity } from './normalization';

const logger = createLogger('SpotifyProvider');

const searchCache = new TtlCache();
const metadataCache = new TtlCache();

const guard = () => getServiceGuard('spotify');

const ID_PATTERN = /^[A-Za-z0-9]{10,40}$/;

const requireId = (raw: string): string => {
  const id = String(raw ?? '').trim();
  if (!ID_PATTERN.test(id)) {
    throw new ApiError('BAD_REQUEST', 'Identifiant invalide.', 400);
  }
  return id;
};

/**
 * Exécute un appel upstream protégé par le guard.
 * Non cacheable en cas d'échec : le guard enregistre l'échec et peut ouvrir
 * le circuit.
 */
const guardedCall = async <T>(operation: () => Promise<T>): Promise<T> => {
  const serviceGuard = guard();
  if (!serviceGuard.acquire()) {
    throw new ApiError(
      'PROVIDER_UNAVAILABLE',
      'Service de recherche temporairement indisponible.',
      503,
      'service guard: blocked'
    );
  }
  try {
    const result = await operation();
    serviceGuard.recordSuccess();
    return result;
  } catch (error) {
    serviceGuard.recordFailure();
    logger.error(
      `appel provider en échec : ${error instanceof Error ? error.message : error}`
    );
    throw new ApiError(
      'PROVIDER_UNAVAILABLE',
      'Service de recherche temporairement indisponible.',
      503,
      error instanceof Error ? error.message : String(error)
    );
  }
};

const toTrackDTO = (hit: {
  id: string;
  title: string;
  artists: string[];
  album: string | null;
  durationMs: number | null;
  coverUrl: string | null;
}): TrackMetadataDTO => ({
  id: hit.id,
  title: hit.title,
  artists: hit.artists,
  album: hit.album,
  durationMs: hit.durationMs,
  coverUrl: hit.coverUrl,
  audiusMatch: null,
});

const toAlbumDTO = (hit: {
  id: string;
  title: string;
  artists: string[];
  coverUrl: string | null;
}): AlbumMetadataDTO => ({
  id: hit.id,
  title: hit.title,
  artists: hit.artists,
  coverUrl: hit.coverUrl,
  releaseDate: null,
  tracks: null,
});

/** TrackList embed → DTO pistes (entrées incomplètes ignorées). */
const embedTrackListToDTOs = (
  trackList: SpotifyEmbedTrackListItem[],
  album: string | null
): TrackMetadataDTO[] => {
  const tracks: TrackMetadataDTO[] = [];
  for (const item of trackList) {
    const trackId = spotifyIdFromUri(item.uri);
    if (!trackId || !item.title) {
      continue;
    }
    tracks.push({
      id: trackId,
      title: item.title,
      artists: subtitleToArtists(item.subtitle),
      album,
      durationMs:
        typeof item.duration === 'number' && item.duration > 0
          ? item.duration
          : null,
      coverUrl: null,
      audiusMatch: null,
    });
  }
  return tracks;
};

/** Pertinence vs requête (titre + artistes), ordre déterministe. */
const byQueryRelevance = <T extends { id: string; title: string; artists: string[] }>(
  query: string
): ((a: T, b: T) => number) => {
  const normalizedQuery = normalizeTitle(query).base;
  const queryArtists = normalizeArtist(query);
  const score = (candidate: T): number => {
    const titleScore = tokenSimilarity(
      normalizedQuery,
      normalizeTitle(candidate.title).base
    );
    const artistScore = candidate.artists.length
      ? Math.max(
          ...candidate.artists.map((artist) =>
            tokenSimilarity(queryArtists, normalizeArtist(artist))
          ),
          0
        )
      : 0;
    return 0.7 * titleScore + 0.3 * artistScore;
  };
  return (a, b) => {
    const diff = score(b) - score(a);
    if (Math.abs(diff) > 1e-9) {
      return diff;
    }
    return a.id < b.id ? -1 : a.id > b.id ? 1 : 0;
  };
};

export type SpotifyProviderDeps = {
  search: typeof spotifyGraphQLSearch;
  fetchEmbed: typeof fetchEmbedPayload;
};

const defaultDeps: SpotifyProviderDeps = {
  search: spotifyGraphQLSearch,
  fetchEmbed: fetchEmbedPayload,
};

/**
 * Fabrique le provider. `deps` n'est fourni qu'en test : l'interface
 * publique (spotifyMetadataProvider) reste une instance unique pour les
 * routes.
 */
export const createSpotifyMetadataProvider = (
  deps: SpotifyProviderDeps = defaultDeps,
  caches: { search: TtlCache; metadata: TtlCache } = {
    search: searchCache,
    metadata: metadataCache,
  }
) => ({
  async search(
    query: string,
    limit: number,
    types: readonly ('tracks' | 'albums')[]
  ): Promise<SearchResultsDTO> {
    const q = String(query ?? '').trim();
    if (!q) {
      return { tracks: [], albums: [] };
    }

    const cacheKey = `search:${q.toLowerCase()}:${limit}:${types.join(',')}`;
    const cached = caches.search.get<SearchResultsDTO>(cacheKey);
    if (cached) {
      logger.debug('cache hit recherche');
      return cached;
    }

    const { tracks, albums } = await guardedCall(() =>
      deps.search(q, limit)
    );

    const result: SearchResultsDTO = {
      tracks: types.includes('tracks')
        ? tracks
            .map(toTrackDTO)
            .sort(byQueryRelevance(q))
            .slice(0, limit)
        : [],
      albums: types.includes('albums')
        ? albums
            .map(toAlbumDTO)
            .sort(byQueryRelevance(q))
            .slice(0, limit)
        : [],
    };

    caches.search.set(cacheKey, result, env.cache.searchTtlSeconds);
    return result;
  },

  async getTrack(id: string): Promise<TrackMetadataDTO> {
    const trackId = requireId(id);
    const cacheKey = `track:${trackId}`;
    const cached = caches.metadata.get<TrackMetadataDTO>(cacheKey);
    if (cached) {
      return cached;
    }

    const { entity } = await guardedCall(() =>
      deps.fetchEmbed('track', trackId)
    );
    if (!entity?.name) {
      throw new ApiError('NOT_FOUND', 'Titre introuvable.', 404, 'embed: no entity');
    }

    const dto: TrackMetadataDTO = {
      id: trackId,
      title: entity.name,
      artists: subtitleToArtists(entity.subtitle),
      album: null,
      durationMs:
        typeof entity.duration === 'number' && entity.duration > 0
          ? entity.duration
          : null,
      coverUrl: entityCoverUrl(entity),
      audiusMatch: null,
    };

    caches.metadata.set(cacheKey, dto, env.cache.metadataTtlSeconds);
    return dto;
  },

  async getAlbum(id: string): Promise<AlbumMetadataDTO> {
    const albumId = requireId(id);
    const cacheKey = `album:${albumId}`;
    const cached = caches.metadata.get<AlbumMetadataDTO>(cacheKey);
    if (cached) {
      return cached;
    }

    const { entity, trackList } = await guardedCall(() =>
      deps.fetchEmbed('album', albumId)
    );
    if (!entity?.name) {
      throw new ApiError('NOT_FOUND', 'Album introuvable.', 404, 'embed: no entity');
    }

    const tracks: TrackMetadataDTO[] = embedTrackListToDTOs(
      trackList,
      entity.name ?? null
    );

    const dto: AlbumMetadataDTO = {
      id: albumId,
      title: entity.name,
      artists: subtitleToArtists(entity.subtitle),
      coverUrl: entityCoverUrl(entity),
      releaseDate: null,
      tracks: tracks.length > 0 ? tracks : null,
    };

    caches.metadata.set(cacheKey, dto, env.cache.metadataTtlSeconds);
    return dto;
  },

  async getPlaylist(id: string): Promise<PlaylistMetadataDTO> {
    const playlistId = requireId(id);
    const cacheKey = `playlist:${playlistId}`;
    const cached = caches.metadata.get<PlaylistMetadataDTO>(cacheKey);
    if (cached) {
      return cached;
    }

    const { entity, trackList } = await guardedCall(() =>
      deps.fetchEmbed('playlist', playlistId)
    );
    if (!entity?.name) {
      throw new ApiError(
        'NOT_FOUND',
        'Playlist introuvable.',
        404,
        'embed: no entity'
      );
    }

    const tracks: TrackMetadataDTO[] = embedTrackListToDTOs(
      trackList,
      null
    );

    const dto: PlaylistMetadataDTO = {
      id: playlistId,
      title: entity.name,
      owner: typeof entity.subtitle === 'string' ? entity.subtitle : null,
      coverUrl: entityCoverUrl(entity),
      description:
        typeof entity.description === 'string' ? entity.description : null,
      tracks: tracks.length > 0 ? tracks : null,
    };

    caches.metadata.set(cacheKey, dto, env.cache.metadataTtlSeconds);
    return dto;
  },

  async getArtist(id: string): Promise<ArtistMetadataDTO> {
    const artistId = requireId(id);
    const cacheKey = `artist:${artistId}`;
    const cached = caches.metadata.get<ArtistMetadataDTO>(cacheKey);
    if (cached) {
      return cached;
    }

    const { entity, trackList } = await guardedCall(() =>
      deps.fetchEmbed('artist', artistId)
    );
    if (!entity?.name) {
      throw new ApiError('NOT_FOUND', 'Artiste introuvable.', 404, 'embed: no entity');
    }

    const topTracks: TrackMetadataDTO[] = embedTrackListToDTOs(trackList, null);

    const dto: ArtistMetadataDTO = {
      id: artistId,
      name: entity.name,
      imageUrl: entityCoverUrl(entity),
      topTracks: topTracks.length > 0 ? topTracks : null,
      albums: null,
    };

    caches.metadata.set(cacheKey, dto, env.cache.metadataTtlSeconds);
    return dto;
  },
});

/**
 * Instance unique utilisée par les routes.
 */
export const spotifyMetadataProvider = createSpotifyMetadataProvider();

export type SpotifyMetadataProvider = typeof spotifyMetadataProvider;
