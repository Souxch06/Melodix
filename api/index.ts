// Data layer : backend Melodix (métadonnées Spotify, sans compte) + Audius
// (audio + contenus de découverte) + bibliothèque/historique LOCAUX.

export {
  getAlbum,
  getArtistAlbums,
  getRecentlyPlayed,
  getSavedAlbums,
  getUserTopAlbums,
  updateRecentlyPlayed,
  checkSavedAlbums,
} from './albums';
export type { UserTopAlbumModel } from './albums';

export {
  getArtist,
  getUserTopArtists,
  getUserFollowedArtists,
} from './artists';

export {
  getSavedPlaylists,
  getFeaturedPlaylists,
  getPlaylist,
  getPlaylistItems,
  checkSavedPlaylists,
} from './playlists';

export {
  getRecommendationsFromArtistSeeds,
  getRecommendationsFromTopArtistSeed,
  getRecommendations,
} from './recommendations';

export { getBrowseCategories, SEARCH_LIMIT, searchCatalog } from './search';

export { getSavedShows } from './shows';

export {
  checkSavedTracks,
  getSavedTracks,
  getSpotifySavedTracks,
  getSpotifySavedTracksCount,
} from './tracks';

export { checkSavedItems } from './library';
export type { LibraryItemType } from './library';

export { getCurrentUser } from './spotify/me';
export {
  getUserPlaylists,
  invalidateUserPlaylistsCache,
} from './spotify/userPlaylists';
export {
  getSpotifyPlaylist,
  getSpotifyPlaylistTracks,
  getSpotifyPlaylistTracksPage,
} from './spotify/playlist';

export { getLibrary } from './getLibrary';
export type { LibraryType } from './getLibrary';

// Backend Melodix (métadonnées, DTO → modèles)
export {
  backendGetAlbum,
  backendGetArtist,
  backendGetPlaylist,
  backendGetTrack,
  backendSearchAlbums,
  backendSearchCatalog,
  backendSearchTracks,
} from './backend';
export type {
  AlbumMetadataDTO,
  ArtistMetadataDTO,
  PlaylistMetadataDTO,
  TrackMetadataDTO,
} from './backend';

// Audius (audio + découverte)
export {
  AUDIUS_APP_NAME,
  AUDIUS_GATEWAY_URL,
  AUDIUS_HOST_CACHE_KEY,
  AudiusRequestError,
  audiusGet,
  audiusTrackToLibraryItem,
  audiusTrackToTrackModel,
  getAudiusApiKey,
  getAudiusStreamUrl,
  getAudiusTrendingPlaylists,
  getAudiusTrendingTracks,
  resetAudiusHosts,
  searchAudiusTracks,
} from './audius';
export type { AudiusRequestErrorKind, AudiusTrackMatch } from './audius';
