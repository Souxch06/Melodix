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
  buildMediaSessionPayload,
  handleMediaCommand,
  initMediaBridge,
  isMediaBridgeEnabled,
  setMediaBridgeEnabled,
  teardownMediaBridge,
} from './mediaBridge';

export {
  clearPlaybackSession,
  loadPlaybackSession,
  PLAYBACK_SESSION_MAX_QUEUE,
  PLAYBACK_SESSION_STORAGE_KEY,
  PLAYBACK_SESSION_VERSION,
  savePlaybackSession,
} from './playbackSession';
export type { PlaybackSession } from './playbackSession';

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
  clearMatchCacheStorage,
  getAudioProviders,
  deleteMatchCacheEntryFromStorage,
  loadMatchCache,
  MATCH_CACHE_STORAGE_KEY,
  MATCH_CACHE_TTL_MS,
  MATCH_CACHE_VERSION,
  persistMatchCache,
  removeMatchCacheEntry,
  resolveWithProviders,
  ResolveQueue,
  RESOLVE_QUEUE_CONCURRENCY,
  writeMatchCacheEntry,
} from './audio';
export type { ProviderChainOutcome, ResolvedTrack } from './audio';

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
export { playerTrackFromHistoryEntry } from './history/historyPlayerTrack';

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

// Connexion Spotify (OAuth PKCE), session et client API officiel.
export {
  getSpotifyClientId,
  isSpotifyLoginConfigured,
  SPOTIFY_SCOPES,
  SPOTIFY_DISCOVERY,
  SPOTIFY_REDIRECT_SCHEME,
  SPOTIFY_REDIRECT_PATH,
} from './spotify/authConfig';
export {
  saveSession,
  loadSession,
  clearSession,
  clearSessionAccessOnly,
  getValidAccessToken,
  isSpotifySessionActive,
  describeSession,
  redeemAuthorizationCode,
} from './spotify/session';
export type { LoginOutcome, SpotifySession } from './spotify/session';
export { spotifyApiGet, SpotifyApiError } from './spotify/apiClient';
export {
  sanitizeErrorDescription,
  spotifyDiag,
  spotifyLog,
} from './spotify/devLog';
export { useSpotifyAuth } from './spotify/useSpotifyAuth';
export type { SpotifyAuthState } from './spotify/useSpotifyAuth';
export type { SpotifyApiErrorKind } from './spotify/apiClient';
export {
  ACCENT_PRESETS,
  DEFAULT_PREFERENCES,
  accentHexOf,
  loadPreferences,
  savePreferences,
} from './preferences';
export type { AppLanguage, Preferences, ThemeMode } from './preferences';
