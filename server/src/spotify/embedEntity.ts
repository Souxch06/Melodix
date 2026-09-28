/**
 * Métadonnées par ID via les pages publiques `/embed/<type>/<id>`
 * (technique non officielle documentée par la référence : les pages
 * open.spotify.com ne rendent plus d'OG tags ; le blob `__NEXT_DATA__`
 * embarque l'entité et, souvent, la trackList).
 *
 * Extraction TOLÉRANTE : la forme JSON bouge, on explore de façon bornée
 * (profondeur limitée) plutôt que de coder des chemins fragiles.
 */

import { SPOTIFY_WEB_BASE_URL } from '../config/constants';
import { httpGet } from '../net/httpClient';
import { createLogger } from '../logging/logger';
import type { SpotifyEmbedEntity, SpotifyEmbedTrackListItem } from './types';

const logger = createLogger('SpotifyEmbed');

const NEXT_DATA_REGEX = /<script id="__NEXT_DATA__"[^>]*>(.+?)<\/script>/s;

const MAX_WALK_DEPTH = 10;
/** Sécurité : borne le nombre de nœuds visités par extraction. */
const MAX_WALK_NODES = 5000;

const asRecord = (value: unknown): Record<string, unknown> | null =>
  value !== null && typeof value === 'object'
    ? (value as Record<string, unknown>)
    : null;

export const spotifyIdFromUri = (uri: unknown): string | null => {
  if (typeof uri !== 'string') {
    return null;
  }
  const parts = uri.split(':');
  return parts.length === 3 && parts[2] ? parts[2] : null;
};

class BoundedWalk {
  visited = 0;
  exceeded(): boolean {
    this.visited += 1;
    return this.visited > MAX_WALK_NODES;
  }
}

/**
 * Explore le blob à la recherche d'une entité « name + uri(type) »
 * de type souhaité.
 */
const findEntity = (
  node: unknown,
  wantedType: string,
  walk: BoundedWalk,
  depth = 0
): SpotifyEmbedEntity | null => {
  if (depth > MAX_WALK_DEPTH || node === null || typeof node !== 'object') {
    return null;
  }
  if (walk.exceeded()) {
    return null;
  }

  const record = node as Record<string, unknown>;
  if (
    typeof record.name === 'string' &&
    typeof record.uri === 'string' &&
    typeof record.type === 'string' &&
    record.type.toLowerCase() === wantedType
  ) {
    return record as unknown as SpotifyEmbedEntity;
  }

  for (const value of Object.values(record)) {
    const found = findEntity(value, wantedType, walk, depth + 1);
    if (found) {
      return found;
    }
  }
  return null;
};

/** Cherche un tableau de pistes { uri, title, subtitle, duration }. */
const findTrackList = (
  node: unknown,
  walk: BoundedWalk,
  depth = 0
): SpotifyEmbedTrackListItem[] | null => {
  if (depth > MAX_WALK_DEPTH || node === null || typeof node !== 'object') {
    return null;
  }
  if (walk.exceeded()) {
    return null;
  }

  if (Array.isArray(node)) {
    const items = node
      .map(asRecord)
      .filter(
        (item): item is Record<string, unknown> =>
          item !== null &&
          typeof item.uri === 'string' &&
          typeof item.title === 'string'
      );
    if (items.length > 0) {
      return items as unknown as SpotifyEmbedTrackListItem[];
    }
    return null;
  }

  const record = node as Record<string, unknown>;
  for (const value of Object.values(record)) {
    const found = findTrackList(value, walk, depth + 1);
    if (found) {
      return found;
    }
  }
  return null;
};

const parseNextData = (html: string): unknown | null => {
  const match = html.match(NEXT_DATA_REGEX);
  if (!match) {
    return null;
  }
  try {
    return JSON.parse(match[1]);
  } catch {
    return null;
  }
};

export type EmbedPayload = {
  entity: SpotifyEmbedEntity | null;
  trackList: SpotifyEmbedTrackListItem[];
};

/**
 * Récupère l'entité + la trackList éventuelle d'une ressource publique.
 */
export const fetchEmbedPayload = async (
  type: 'track' | 'album' | 'playlist' | 'artist',
  id: string
): Promise<EmbedPayload> => {
  const embedUrl = `${SPOTIFY_WEB_BASE_URL}/embed/${type}/${id}`;
  const html = await httpGet<string>(embedUrl, { retries: 1 });

  if (typeof html !== 'string') {
    logger.warn(`embed ${type}/${id} : réponse non textuelle`);
    return { entity: null, trackList: [] };
  }

  const nextData = parseNextData(html);
  if (!nextData) {
    logger.warn(`embed ${type}/${id} : __NEXT_DATA__ absent`);
    return { entity: null, trackList: [] };
  }

  const entity = findEntity(nextData, type, new BoundedWalk());
  const trackList = findTrackList(nextData, new BoundedWalk()) ?? [];

  if (!entity) {
    logger.warn(`embed ${type}/${id} : entité introuvable`);
  }

  return { entity, trackList };
};

/** Best-effort artiste.subtitle → liste d'artistes. */
export const subtitleToArtists = (subtitle: unknown): string[] => {
  if (typeof subtitle !== 'string' || !subtitle.trim()) {
    return [];
  }
  return subtitle
    .split(/,\s*|\s+&\s+/)
    .map((part) => part.trim())
    .filter(Boolean);
};

export const entityCoverUrl = (entity: SpotifyEmbedEntity): string | null => {
  const visual = entity.visualIdentity?.image;
  if (Array.isArray(visual)) {
    const biggest = visual
      .filter((img) => typeof img?.url === 'string' && img.url)
      .sort((a, b) => (b.maxWidth ?? 0) - (a.maxWidth ?? 0));
    if (biggest.length > 0) {
      return biggest[0].url ?? null;
    }
  }
  const sources = entity.coverArt?.sources;
  if (Array.isArray(sources) && sources.length > 0) {
    const first = sources.find((s) => typeof s?.url === 'string' && s.url);
    if (first) {
      return first.url ?? null;
    }
  }
  return null;
};
