export const EN_GB = {
  header: {
    home: 'Home',
    search: 'Search',
    library: 'Your Library',
  },
  router: {
    home: 'Home',
    search: 'Search',
    library: 'Your Library',
  },
  libraryCategories: {
    album: 'Albums',
    artist: 'Artists',
    downloaded: 'Downloaded',
    playlist: 'Playlists',
    show: 'Podcasts',
  },
  type: {
    album: 'Album',
    albums: 'Albums',
    artist: 'Artist',
    artists: 'Artists',
    compilation: 'Compilation',
    playlist: 'Playlist',
    playlists: 'Playlists',
    podcast: 'Podcast',
    podcasts: 'Podcasts',
    single: 'Single',
    singles: 'Singles',
  },
  moreOf: 'More of: ',
  updated: 'Updated: ',
  released: 'Released: ',
  showAll: 'Show all',
  tracks: 'tracks',
  saves: 'saves',
  yourPlaylist: 'Your Playlists',
  madeForYou: 'Made For You',
  yourTopArtists: (key: number | string) => `Your Recent Top ${key} Artists`,
  yourTopAlbums: (key: number | string) => `Your Recent Top ${key} Albums`,
  basedOnYourTopArtists: 'Based on your Top Artists',
  basedOnYourTopGenres: 'Based on your Top Genres',
  basedOnYourTopTracks: 'Based on your Top Tracks',
  afterListening: (key: string) => `After listening ${key}`,
  recommendations: 'Recommendations',
  songs: 'Songs',
  searchPlaceholder: 'Artists, songs, albums, playlists',
  searchHint: 'Search the Spotify catalogue.',
  searchNoResults: (query: string) => `No results for "${query}".`,
  searchError: 'Search is unavailable right now. Please try again.',
  browseAll: 'Browse all',
  featuredPlaylists: 'Popular Playlists',

  // Découverte Audius (catalogue libre) : aucun login n'existe dans
  // Melodix 3.0 ; les libellés profil/lecteur sont en français (fr-fr.ts).
  trendingTracks: 'Trending tracks',
  trendingPlaylists: 'Trending playlists',
  trendingAlbums: 'Trending albums',
  audiusUnknownArtist: 'Unknown artist',
  guestHomeHint:
    'Guest mode: the free Audius catalog, no account needed. Tap any track to listen — open the search tab to explore it all.',
  playerPlay: 'Play',
  playerPause: 'Pause',
  playerNext: 'Next track',
  playerStop: 'Close the player',
  playerLoading: 'Loading…',
  playerError: 'Playback failed. Try another track.',
  playerUnavailable: 'Audio playback is unavailable on this device.',
};

// Écran de connexion + session OAuth (anglais — base de l'interface,
// aucun détail technique affiché).
export const EN_GB_LOGIN = {
  loginWelcome: 'Melodix',
  loginTagline: 'Your music. Your universe.',
  loginHeaderNotation: '×', // separator between the Melodix and Spotify logos
  loginDescription:
    'Find your personal playlists and listen to them, without typing any key: everything goes through the official Spotify page.',
  loginContinue: 'Continue with Spotify',
  loginConnecting: 'Connecting to Spotify...',
  loginExchanging: 'Preparing your session...',
  loginValidate: 'Try again',
  loginDiagnosticLabel: 'Diagnostic',
  // Exact causes (diagnostic section) — title = REAL cause, never wrongly generic.
  loginCancelledTitle: 'Sign-in cancelled',
  loginCancelledBody: 'You can try again whenever you like.',
  loginOAuthRefusedTitle: 'Spotify refused the connection',
  loginOAuthRefusedBody:
    'Make sure you authorize Melodix on the Spotify page, then try again.',
  loginCallbackFailedTitle: 'Unable to return from Spotify',
  loginCallbackFailedBody:
    'The return from Spotify to Melodix failed. Please try signing in again.',
  loginNetworkTitle: 'Unable to reach Spotify',
  loginNetworkBody: 'Check your internet connection, then try again.',
  loginUnknownTitle: 'Unable to connect to Spotify',
  loginUnknownBody: 'Please try again in a few moments.',
  loginNotConfigured: 'Spotify sign-in is not configured',
  loginNotConfiguredBody:
    'Spotify sign-in is not yet configured on this version of Melodix.\nPlease use a properly configured version.',
  loginPrivacyNote:
    'Secure sign-in with Spotify. You will never be asked for a key: you sign in on the official Spotify page, then return to Melodix.',
  loginSecureFootnote: 'Secure sign-in with Spotify',
  loginSessionExpired: 'Your Spotify session has expired.\nSign in again to continue.',
  loginFetchFailed: 'Unable to load your playlists.\nPlease try again later.',
  loginSignOut: 'Sign out',
  loginSignOutConfirmTitle: 'Sign out of Spotify?',
  loginSignOutConfirmMessage:
    'Your Spotify session will be removed from this device. Your local favorites and history are preserved.',
  loginSignOutConfirm: 'Sign out',
};
