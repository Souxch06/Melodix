export { AudiusYouTubeBackend } from './AudiusYouTubeBackend';
export {
  getSpotifyWebPhysicalValidation,
  getSpotifyWebPhysicalValidationEvidence,
  isSpotifyWebPlaybackEnabled,
  recordSpotifyWebPhysicalValidation,
  resetSpotifyWebPlaybackFeatureForTesting,
  resolveSpotifyWebPlaybackActivation,
  setSpotifyWebPlaybackEnabled,
} from './spotifyWebFeature';
export type {
  SpotifyWebActivationDecision,
  SpotifyWebPhysicalValidation,
  SpotifyWebPlaybackEngagement,
} from './spotifyWebFeature';
export { buildBackendMediaSessionPayload } from './mediaProjection';
export {
  DEFAULT_SPOTIFY_WEB_COMMAND_TIMEOUT_MS,
  SpotifyWebBackend,
} from './SpotifyWebBackend';
export { SPOTIFY_WEB_MEDIA_SESSION_PROBE } from './spotifyWebMediaSessionProbe';
export type {
  SpotifyWebBackendOptions,
  SpotifyWebBridgeResult,
  SpotifyWebBridgeTransport,
  SpotifyWebCommandScheduler,
  SpotifyWebRuntimeCommands,
} from './SpotifyWebBackend';
export {
  INITIAL_SPOTIFY_WEB_STATE,
  mapSpotifyWebBridgePayload,
  normalizeSpotifyWebState,
} from './spotifyWebState';
export type { SpotifyWebPlaybackInput } from './spotifyWebState';
export {
  buildSpotifyWebBridgeCommandMessage,
  parseSpotifyWebBridgeMessage,
  parseSpotifyWebCommand,
  SPOTIFY_WEB_BRIDGE_SUPPORTED_VERSIONS,
  SPOTIFY_WEB_BRIDGE_VERSION,
} from './spotifyWebBridge';
export type {
  SpotifyWebBridgeCommandName,
  SpotifyWebBridgeMessage,
  SpotifyWebCommand,
  SpotifyWebRuntimeCapabilities,
} from './spotifyWebBridge';
export {
  classifySpotifyWebUrl,
  DEFAULT_SPOTIFY_WEB_AUTO_RECONNECT_BASE_DELAY_MS,
  DEFAULT_SPOTIFY_WEB_AUTO_RECONNECT_MAX_ATTEMPTS,
  DEFAULT_SPOTIFY_WEB_AUTO_RECONNECT_MAX_DELAY_MS,
  DEFAULT_SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS,
  diagnosticPageLabel,
  isAllowedSpotifyWebNavigation,
  SpotifyWebRuntime,
} from './spotifyWebRuntime';
export type {
  SpotifyWebDiagnosticCode,
  SpotifyWebPageKind,
  SpotifyWebRuntimeBackendPort,
  SpotifyWebRuntimeLossCause,
  SpotifyWebRuntimeOptions,
  SpotifyWebRuntimePhase,
  SpotifyWebRuntimeReconnectScope,
  SpotifyWebRuntimeScheduler,
  SpotifyWebRuntimeSnapshot,
} from './spotifyWebRuntime';
export type {
  PlaybackBackend,
  PlaybackBackendId,
  PlaybackBackendListener,
  PlaybackBackendState,
  PlaybackBackendStatus,
  PlaybackBackendTrack,
} from './types';
export {
  ALL_BACKEND_FAILURE_CATEGORIES,
  allowsNegativeCache,
  classifyBackendFailure,
  isRetryableFailure,
  NEGATIVE_CACHE_MUST_STAY_EXCLUSIVE,
} from './backendFailure';
export type {
  BackendFailureCategory,
  BackendFailureDisposition,
} from './backendFailure';
export {
  derivePlaybackProof,
  isSanitizedSpotifyWebDiagnostic,
  SPOTIFY_WEB_DIAGNOSTIC_CAUSES,
  SPOTIFY_WEB_DIAGNOSTIC_CODES,
  SPOTIFY_WEB_DIAGNOSTIC_LIMIT,
  SPOTIFY_WEB_DIAGNOSTIC_SEQUENCE,
  SPOTIFY_WEB_PLAYBACK_PROOF_CODES,
  SpotifyWebDiagnosticLog,
} from './spotifyWebDiagnostics';
export type { SpotifyWebDiagnosticRecord } from './spotifyWebDiagnostics';
