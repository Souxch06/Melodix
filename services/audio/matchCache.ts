import AsyncStorage from '@react-native-async-storage/async-storage';

import type { TrackSource } from './types';
import { sourceKeyOf } from './sourceKey';

/**
 * Cache des décisions de matching : { cacheKey: entry } dans un document
 * JSON unique (des centaines d'entrées restent très en dessous des limites
 * AsyncStorage).
 *
 * v2 : chaque décision mémorise AUSSI le provider (« audius » | « youtube ») —
 * cas exigés :
 *
 *     Spotify 123 → Audius 456 (score 78)
 *     Spotify 123 → YouTube ABC (score 62)
 *     Spotify 123 → unavailable (providerId: null, matchId: null)
 *
 * - TTL : les entrées périmées sont écartées au chargement ;
 * - négatif connus (matchId: null) revisités JAMAIS avant expiration ;
 * - un échec de lecture invalide l'entrée immédiatement (player.ts) : le
 *   flux disparu « guérit » à la prochaine lecture ;
 * - clearMatchCache/removeMatchCacheEntry = mécanisme « refaire le
 *   matching » explicitement requis ;
 * - migration : les caches v1 (sans providerId) deviennent Audius, la
 *   source décisionnelle d'alors (sans perte, sans recherche refaite).
 */

export const MATCH_CACHE_VERSION = 2;
export const MATCH_CACHE_LEGACY_VERSION = 1;

export type MatchCacheEntry = {
  version: number;
  matchedAt: number;
  /** null = négatif connu (indisponible) ; sinon 'audius' | 'youtube'. */
  providerId: string | null;
  /** null = négatif connu : aucune correspondance fiable n'existait. */
  matchId: string | null;
  score: number;
};

export type MatchCache = Record<string, MatchCacheEntry>;

export const MATCH_CACHE_STORAGE_KEY = '@melodix/match-cache';
export const MATCH_CACHE_TTL_MS = 30 * 24 * 60 * 60 * 1000; // 30 jours
const MAX_ENTRIES = 500;

const isValidEntry = (value: unknown): value is MatchCacheEntry =>
  !!value &&
  typeof value === 'object' &&
  typeof (value as MatchCacheEntry).matchedAt === 'number' &&
  ((value as MatchCacheEntry).providerId === null ||
    typeof (value as MatchCacheEntry).providerId === 'string') &&
  ((value as MatchCacheEntry).matchId === null ||
    typeof (value as MatchCacheEntry).matchId === 'string') &&
  typeof (value as MatchCacheEntry).score === 'number';

const migrateLegacyEntry = (value: unknown): MatchCacheEntry | null => {
  // v1 : { version: 1, matchedAt, matchId, score } — la source était Audius.
  const record = value as {
    version?: unknown;
    matchedAt?: unknown;
    matchId?: unknown;
    score?: unknown;
  } | null;

  if (
    !record ||
    record.version !== MATCH_CACHE_LEGACY_VERSION ||
    typeof record.matchedAt !== 'number' ||
    typeof record.score !== 'number' ||
    (record.matchId !== null && typeof record.matchId !== 'string')
  ) {
    return null;
  }

  return {
    version: MATCH_CACHE_VERSION,
    matchedAt: record.matchedAt,
    providerId: record.matchId === null ? null : 'audius',
    matchId: (record.matchId as string | null) ?? null,
    score: record.score,
  };
};

export const loadMatchCache = (raw: string | null): MatchCache => {
  if (!raw) {
    return {};
  }

  try {
    const parsed = JSON.parse(raw) as Record<string, unknown>;
    const now = Date.now();
    const cache: MatchCache = {};

    for (const [key, value] of Object.entries(parsed)) {
      let entry: MatchCacheEntry | null = null;

      if (
        isValidEntry(value) &&
        (value as MatchCacheEntry).version === MATCH_CACHE_VERSION
      ) {
        entry = value as MatchCacheEntry;
      } else {
        entry = migrateLegacyEntry(value);
      }

      if (!entry) {
        continue;
      }

      if (now - entry.matchedAt > MATCH_CACHE_TTL_MS) {
        continue;
      }

      cache[key] = entry;
    }

    return cache;
  } catch {
    return {};
  }
};

export const persistMatchCache = (cache: MatchCache): Promise<void> => {
  const entries = Object.entries(cache)
    .sort(([, a], [, b]) => a.matchedAt - b.matchedAt)
    .slice(-MAX_ENTRIES);

  return AsyncStorage.setItem(
    MATCH_CACHE_STORAGE_KEY,
    JSON.stringify(Object.fromEntries(entries))
  ).catch((error) => console.warn('Failed to persist the match cache', error));
};

export const writeMatchCacheEntry = (
  cache: MatchCache,
  source: TrackSource,
  providerId: string | null,
  matchId: string | null,
  score: number,
  now = Date.now()
): MatchCache => {
  cache[sourceKeyOf(source)] = {
    version: MATCH_CACHE_VERSION,
    matchedAt: now,
    providerId,
    matchId,
    score,
  };

  return cache;
};

/** Réévaluer UNE piste la prochaine fois (mécanisme « refaire le matching »). */
export const removeMatchCacheEntry = (
  cache: MatchCache,
  cacheKey: string
): MatchCache => {
  delete cache[cacheKey];
  return cache;
};

/** Purge complète persistante — « tout rematcher » (ex. menu diagnostic). */
export const clearMatchCacheStorage = async (): Promise<void> => {
  try {
    await AsyncStorage.removeItem(MATCH_CACHE_STORAGE_KEY);
  } catch {
    // Non bloquant.
  }
};
