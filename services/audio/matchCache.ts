import AsyncStorage from '@react-native-async-storage/async-storage';

import type { TrackSource } from './types';
import { sourceKeyOf } from './sourceKey';

/**
 * Cache des décisions de matching : { cacheKey: entry } dans un document
 * JSON unique (des centaines d'entrées restent très en dessous des limites
 * AsyncStorage).
 *
 * v4 : invalide les décisions antérieures aux portes strictes radio/extended/
 *      sped/slowed et aux diagnostics de rejet détaillés.
 * v3 : invalidait les anciens négatifs après l'ajout ISRC + matching fuzzy.
 * v2 : chaque décision mémorisait AUSSI le provider (« audius » | « youtube ») —
 * cas exigés :
 *
 *     Spotify 123 → Audius 456 (score 78)
 *     Spotify 123 → YouTube ABC (score 62)
 *     Spotify 123 → unavailable (providerId: null, matchId: null)
 *
 * - TTL : 30 jours pour un match positif, 24 h seulement pour un négatif ;
 * - un échec de flux n'est jamais transformé en négatif : une panne CDN ne
 *   doit pas rendre le morceau durablement indisponible ;
 * - clearMatchCache/removeMatchCacheEntry = mécanisme « refaire le
 *   matching » explicitement requis ;
 * - migration : les caches v1 (sans providerId) deviennent Audius, la
 *   source décisionnelle d'alors (sans perte, sans recherche refaite).
 */

export const MATCH_CACHE_VERSION = 4;
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
export const MATCH_CACHE_TTL_MS = 30 * 24 * 60 * 60 * 1000; // positif : 30 jours
/** Un catalogue évolue : un « introuvable » doit être retenté rapidement. */
export const MATCH_CACHE_NEGATIVE_TTL_MS = 24 * 60 * 60 * 1000; // 24 heures
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

      const ttl =
        entry.matchId === null
          ? MATCH_CACHE_NEGATIVE_TTL_MS
          : MATCH_CACHE_TTL_MS;
      if (now - entry.matchedAt > ttl) {
        continue;
      }

      cache[key] = entry;
    }

    return cache;
  } catch {
    return {};
  }
};

/**
 * Persiste par FUSION : relit le document stocké puis fusionne — les entrées
 * reçues GAGNENT — avant de réécrire (LRU 500 conservées). Deux écrivains
 * concurrents (player + écran de playlist) ne se suppriment plus jamais
 * silencieusement leurs clés mutuelles (perte de décisions d'avant).
 *
 * ⚠️ Par construction, une fusion ne SUPPRIME rien : pour invalider une clé
 * (« refaire le matching »), utiliser deleteMatchCacheEntryFromStorage.
 */
export const persistMatchCache = async (cache: MatchCache): Promise<void> => {
  try {
    const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
    const stored = loadMatchCache(raw);
    const merged: MatchCache = { ...stored, ...cache };
    const entries = Object.entries(merged)
      .sort(([, a], [, b]) => a.matchedAt - b.matchedAt)
      .slice(-MAX_ENTRIES);

    await AsyncStorage.setItem(
      MATCH_CACHE_STORAGE_KEY,
      JSON.stringify(Object.fromEntries(entries))
    );
  } catch (error) {
    console.warn('Failed to persist the match cache', error);
  }
};

/**
 * Suppression CIBLÉE persistante — transaction SANS fusion : lire le
 * document → retirer la clé → réécrire le document COMPLET tel quel.
 * Contrairement à persistMatchCache (qui fusionne), les autres clés ne sont
 * ni ajoutées ni supprimées, et la clé visée est réellement effacée : c'est
 * le socle du « refaire le matching » ciblé (I-3). Fenêtre bornée : une
 * écriture concurrente tombée EXACTEMENT entre la lecture et la réécriture
 * pourrait être perdue — bornée à quelques ms et sans corruption possible.
 */
export const deleteMatchCacheEntryFromStorage = async (
  cacheKey: string
): Promise<void> => {
  try {
    const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
    const cache = loadMatchCache(raw);

    if (!(cacheKey in cache)) {
      return; // rien à retirer — aucun réécriture inutile
    }

    delete cache[cacheKey];
    await AsyncStorage.setItem(MATCH_CACHE_STORAGE_KEY, JSON.stringify(cache));
  } catch {
    // Non bloquant : l'appelant relance sa file quoi qu'il arrive.
  }
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
