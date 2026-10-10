export { getBrowseCategories } from './browseCategories';
export { searchCatalog, SEARCH_LIMIT } from './searchCatalog';
export {
  searchCatalogProgressive,
  resetProgressiveSearchEngine,
  playableQueueIdOf,
  SOURCE_TIMEOUTS_MS,
  SEARCH_HARD_LIMIT_MS,
  AUDIUS_SEARCH_LIMIT,
  BACKEND_SEARCH_LIMIT,
} from './progressiveSearch';
export type {
  ProgressiveSearchUpdate,
  ProgressiveSearchHandle,
  ProgressiveSearchOptions,
  ProgressiveSearchSourceState,
} from './progressiveSearch';
export {
  mergeAndRankResults,
  normalizeForSearch,
  rankItems,
  dedupeItems,
  matchScore,
  trackDedupeKey,
  SEARCH_SOURCE_PRIORITY,
} from './searchRanking';
export type { SearchSourceId } from './searchRanking';
export {
  configureSearchCache,
  getSearchCacheTtlMs,
  getSearchCacheEntry,
  putSearchCacheEntry,
  clearSearchCache,
  searchCacheSize,
  searchCacheEntryAgeMs,
  DEFAULT_SEARCH_CACHE_TTL_MS,
  SEARCH_CACHE_MAX_ENTRIES,
} from './searchResultsCache';
export type { SearchCacheEntry } from './searchResultsCache';
export {
  isSpotifySearchCircuitOpen,
  openSpotifySearchCircuit,
  resetSpotifySearchCircuit,
  classifySpotifySearchError,
  SPOTIFY_SEARCH_CIRCUIT_TTL_MS,
} from './spotifySearchCircuit';
