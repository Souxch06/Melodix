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

// Écran de connexion + session OAuth (anglais — base de l'interface).
export const EN_GB_LOGIN = {
  loginWelcome: 'Welcome to Melodix',
  loginTagline: 'Sign in with Spotify',
  loginDescription:
    'Get back your personal playlists and listen to them via Audius, without typing any key: everything goes through the official Spotify page.',
  loginContinue: 'Continue with Spotify',
  loginContinueWithoutAccount: 'Explore without an account',
  loginConnecting: 'Connecting to Spotify…',
  loginExchanging: 'Preparing your session…',
  loginPrivacyNote:
    'You will never be asked for a key. You sign in only on the official Spotify page, then return to Melodix.',
  loginCancelled: 'Sign-in cancelled.',
  loginUnavailable:
    'Spotify is temporarily unavailable.\nPlease try again in a few moments.',
  loginNotConfigured:
    'Spotify sign-in is not configured in this build.\nYou can keep exploring locally: Audius library, favorites and history on this device.',
  loginSessionExpired: 'Your Spotify session has expired.\nSign in again to continue.',
  loginFetchFailed: 'Unable to load your playlists.\nPlease try again later.',
  loginSignOut: 'Sign out',
  loginSignOutConfirmTitle: 'Sign out of Spotify?',
  loginSignOutConfirmMessage:
    'Your Spotify session will be removed from this device. Your local favorites and history are preserved.',
  loginSignOutConfirm: 'Sign out',
};
