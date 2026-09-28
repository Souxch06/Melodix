export {
  INITIAL_PLAYER_STATE,
  melodixPlayer,
  queueIdForTrackId,
  sourceForTrackId,
  spotifyTrackSource,
  audiusTrackSource,
} from './player';
export type {
  PlayerListener,
  PlayerState,
  PlayerStatus,
  PlayerTrack,
  RepeatMode,
  ResolverInfo,
} from './player';

export {
  DEFAULT_AUDIO_PROVIDER_ID,
  getAudioProvider,
  matchSongs,
  normalizeAlbumText,
  normalizeArtistText,
  normalizeTitleText,
  sourceKeyOf,
  stripFeatureSuffix,
  UNKNOWN_MATCH,
} from './audio';
export type {
  AudioProvider,
  AudioProviderMatch,
  AudioSourceQuery,
  MatchCache,
  MatchCacheEntry,
  ResolvedStream,
  SongFingerprint,
  SongMatchCandidate,
  SongMatchResult,
  TrackSource,
} from './audio';
export {
  loadMatchCache,
  MATCH_CACHE_STORAGE_KEY,
  MATCH_CACHE_TTL_MS,
  persistMatchCache,
  writeMatchCacheEntry,
} from './audio';

export {
  clearPlayHistory,
  getRecentlyPlayedAlbumLike,
  getRecentlyPlayedTracks,
  getTopAlbumsFromHistory,
  getTopArtistsFromHistory,
  hasPlayHistory,
  MAX_HISTORY,
  PLAY_HISTORY_STORAGE_KEY,
  recordPlay,
} from './history/playHistory';
export type { PlayHistoryEntry } from './history/playHistory';

export {
  checkSaved,
  clearLocalLibrary,
  getSavedTrack,
  isSaved,
  listSavedItems,
  listSavedTracks,
  LOCAL_LIBRARY_STORAGE_KEY,
  removeSavedItem,
  removeSavedTrack,
  saveItem,
  saveTrack,
  toggleSavedTrack,
} from './library/localLibrary';
export type {
  LocalItemEntry,
  LocalLibraryEntityType,
  LocalTrackEntry,
} from './library/localLibrary';

export {
  runAccountlessMigration,
  __resetMigrationFlagForTests,
} from './library/localUserMigration';

export {
  BackendError,
  backendGet,
  getBackendBaseUrl,
  isBackendConfigured,
} from './backend';
export type { BackendErrorKind } from './backend';
