/**
 * Recherche de catalogue via la persisted query GraphQL `searchDesktop`
 * (technique interne Web Player, non officielle, isolée ici).
 *
 * Sortie : listes de formes BRUTES normalisables (titre, artistes, uri…),
 * jamais de DTO — c'est spotifyMetadataProvider qui construit les DTO.
 * Le module est tolérant aux rotations légères de schéma (il explore les
 * formes `data.searchV2.tracks.items[].track | .item.data | .data`).
 */

import {
  SPOTIFY_PARTNER_API_URL,
  SPOTIFY_SEARCH_DESKTOP_HASH,
} from '../config/constants';
import { env } from '../config/env';
import { httpGet } from '../net/httpClient';
import { createLogger } from '../logging/logger';
import { getSpotifyAccessToken } from './accessToken';
import type { SpotifyGraphQLSearchResponse } from './types';

const logger = createLogger('SpotifySearch');

export type SpotifyRawTrackHit = {
  id: string;
  title: string;
  artists: string[];
  album: string | null;
  durationMs: number | null;
  coverUrl: string | null;
};

export type SpotifyRawAlbumHit = {
  id: string;
  title: string;
  artists: string[];
  coverUrl: string | null;
};

const spotifyUriId = (uri: unknown): { type: string; id: string } | null => {
  if (typeof uri !== 'string') {
    return null;
  }
  const parts = uri.split(':');
  if (parts.length !== 3 || !parts[2]) {
    return null;
  }
  return { type: parts[1], id: parts[2] };
};

const asRecord = (value: unknown): Record<string, unknown> | null =>
  value !== null && typeof value === 'object'
    ? (value as Record<string, unknown>)
    : null;

const pickString = (value: unknown): string | null =>
  typeof value === 'string' && value.length > 0 ? value : null;

/** Extrait les noms d'artistes de la forme { artists: { items: [{ profile: { name } }] } }. */
const extractArtistNames = (node: unknown): string[] => {
  const artistsNode = asRecord(asRecord(node)?.artists);
  const items = Array.isArray(artistsNode?.items) ? artistsNode.items : [];
  const names: string[] = [];
  for (const item of items) {
    const profile = asRecord(asRecord(item)?.profile);
    const name = pickString(profile?.name);
    if (name) {
      names.push(name);
    }
  }
  return names;
};

const extractDurationMs = (node: unknown): number | null => {
  const duration = asRecord(asRecord(node)?.duration);
  const total = duration?.totalMilliseconds;
  return typeof total === 'number' && total > 0 ? total : null;
};

const firstSourceUrl = (coverArtNode: unknown): string | null => {
  const sources = asRecord(coverArtNode)?.sources;
  if (!Array.isArray(sources)) {
    return null;
  }
  for (const source of sources) {
    const url = pickString(asRecord(source)?.url);
    if (url) {
      return url;
    }
  }
  return null;
};

const extractCoverUrl = (node: unknown): string | null => {
  const trackNode = asRecord(node);
  // Formes observées : albumOfTrack.coverArt.sources[] ou coverArt.sources[].
  return (
    firstSourceUrl(asRecord(trackNode?.albumOfTrack)?.coverArt) ??
    firstSourceUrl(trackNode?.coverArt)
  );
};

const unwrapTrackItem = (item: unknown): SpotifyRawTrackHit | null => {
  const itemNode = asRecord(item);
  if (!itemNode) {
    return null;
  }

  // Formes rencontrées : { track: {...} } ou { item: { data: {...} } } ou { data: {...} }.
  const trackNode =
    asRecord(itemNode.track) ??
    asRecord(asRecord(itemNode.item)?.data) ??
    asRecord(itemNode.data);
  if (!trackNode) {
    return null;
  }

  const parsed = spotifyUriId(trackNode.uri);
  const title = pickString(trackNode.name);
  if (!parsed || !title) {
    return null;
  }

  const albumNode = asRecord(trackNode.albumOfTrack);

  return {
    id: parsed.id,
    title,
    artists: extractArtistNames(trackNode),
    album: pickString(albumNode?.name),
    durationMs: extractDurationMs(trackNode),
    coverUrl: extractCoverUrl(trackNode),
  };
};

const unwrapAlbumItem = (item: unknown): SpotifyRawAlbumHit | null => {
  const itemNode = asRecord(item);
  if (!itemNode) {
    return null;
  }
  const albumNode =
    asRecord(itemNode.data) ?? asRecord(asRecord(itemNode.item)?.data);
  if (!albumNode) {
    return null;
  }

  const parsed = spotifyUriId(albumNode.uri);
  const title = pickString(albumNode.name);
  if (!parsed || !title) {
    return null;
  }

  return {
    id: parsed.id,
    title,
    artists: extractArtistNames(albumNode),
    coverUrl: firstSourceUrl(albumNode.coverArt),
  };
};

const getSearchHash = (): string =>
  env.spotify.searchHashOverride || SPOTIFY_SEARCH_DESKTOP_HASH;

/**
 * Recherche brute : pistes (+ albums en bonus quand le type est demandé).
 */
export const spotifyGraphQLSearch = async (
  query: string,
  limit: number
): Promise<{ tracks: SpotifyRawTrackHit[]; albums: SpotifyRawAlbumHit[] }> => {
  const accessToken = await getSpotifyAccessToken();

  const variables = {
    searchTerm: query,
    offset: 0,
    limit: Math.min(Math.max(limit, 1), 20),
    numberOfTopResults: 5,
  };
  const extensions = {
    persistedQuery: { version: 1, sha256Hash: getSearchHash() },
  };

  const url = new URL(`${SPOTIFY_PARTNER_API_URL}/query`);
  url.searchParams.set('operationName', 'searchDesktop');
  url.searchParams.set('variables', JSON.stringify(variables));
  url.searchParams.set('extensions', JSON.stringify(extensions));

  const response = await httpGet<SpotifyGraphQLSearchResponse>(url.toString(), {
    headers: {
      Authorization: `Bearer ${accessToken}`,
      'app-platform': 'WebPlayer',
    },
  });

  const search = response?.data?.searchV2 ?? response?.data?.search;
  if (!search) {
    throw new Error('réponse GraphQL sans section de recherche');
  }

  const trackItems = Array.isArray(search.tracks?.items)
    ? search.tracks!.items!
    : [];
  const albumItems = Array.isArray(search.albums?.items)
    ? search.albums!.items!
    : [];

  const tracks = trackItems
    .map(unwrapTrackItem)
    .filter((hit): hit is SpotifyRawTrackHit => hit !== null);
  const albums = albumItems
    .map(unwrapAlbumItem)
    .filter((hit): hit is SpotifyRawAlbumHit => hit !== null);

  logger.info(
    `recherche "${query.slice(0, 60)}" → ${tracks.length} pistes, ${albums.length} albums`
  );

  return { tracks, albums };
};
