/**
 * Audius integration (Open Audio Protocol, https://docs.audius.org).
 *
 * Used internally as the default AUDIO provider: Melodix keeps the library,
 * playlists and metadata on Spotify, and matches each track the user plays
 * to an Audius stream (services/audio). No account is required to speak to
 * Audius: requests only carry the `app_name` identifier, plus an optional API
 * key of the app maintainer for higher rate limits.
 */

export { AUDIUS_APP_NAME, AUDIUS_HOST_CACHE_KEY } from './constants';
export {
  audiusGet,
  AUDIUS_GATEWAY_URL,
  AudiusRequestError,
  getAudiusApiKey,
  getAudiusStreamUrl,
  resetAudiusHosts,
} from './client';
export type { AudiusRequestErrorKind } from './client';
export { searchAudiusTracks } from './searchTracks';
export type { AudiusTrackMatch } from './searchTracks';
export {
  audiusTrackToLibraryItem,
  audiusTrackToTrackModel,
  getAudiusTrendingPlaylists,
  getAudiusTrendingTracks,
} from './trending';
