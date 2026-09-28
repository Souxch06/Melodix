import AsyncStorage from '@react-native-async-storage/async-storage';

import type { TrackSource } from './types';
import { sourceKeyOf } from './sourceKey';

/**
 * Local cache of source→Audius match decisions: { cacheKey: entry } in one
 * JSON document (a few hundred entries stay well under AsyncStorage limits).
 * Saves repeated Audius searches and makes replays instant.
 *
 * - TTL: stale entries are dropped on load;
 * - a failed play invalidates the entry immediately (see player.ts), so a
 *   match whose stream disappeared heals at the next playback;
 * - the document is trimmed to MAX_ENTRIES entries on write (oldest first).
 */

export const MATCH_CACHE_VERSION = 1;

export type MatchCacheEntry = {
  version: number;
  matchedAt: number;
  /** null = known negative: no reliable Audius match exists. */
  matchId: string | null;
  score: number;
};

export type MatchCache = Record<string, MatchCacheEntry>;

export const MATCH_CACHE_STORAGE_KEY = '@melodix/match-cache';
export const MATCH_CACHE_TTL_MS = 30 * 24 * 60 * 60 * 1000; // 30 days
const MAX_ENTRIES = 500;

const isValidEntry = (value: unknown): value is MatchCacheEntry =>
  !!value &&
  typeof value === 'object' &&
  (value as MatchCacheEntry).version === MATCH_CACHE_VERSION &&
  typeof (value as MatchCacheEntry).matchedAt === 'number' &&
  ((value as MatchCacheEntry).matchId === null ||
    typeof (value as MatchCacheEntry).matchId === 'string') &&
  typeof (value as MatchCacheEntry).score === 'number';

export const loadMatchCache = (raw: string | null): MatchCache => {
  if (!raw) {
    return {};
  }

  try {
    const parsed = JSON.parse(raw) as Record<string, unknown>;
    const now = Date.now();
    const cache: MatchCache = {};

    for (const [key, value] of Object.entries(parsed)) {
      if (!isValidEntry(value)) {
        continue;
      }

      if (now - value.matchedAt > MATCH_CACHE_TTL_MS) {
        continue;
      }

      cache[key] = value;
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
  matchId: string | null,
  score: number,
  now = Date.now()
): MatchCache => {
  cache[sourceKeyOf(source)] = {
    version: MATCH_CACHE_VERSION,
    matchedAt: now,
    matchId,
    score,
  };

  return cache;
};
