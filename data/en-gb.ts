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
  loginWelcomeTitle: 'Welcome to Melodix',
  loginConnectHint: 'Your music. Your playlists. Your universe.',
  loginRedirectNote: 'Secure sign-in with Spotify',
  loginContinue: 'Continue with Spotify',
  loginConnecting: 'Connecting to Spotify…',
  loginExchanging: 'Finishing sign-in…',
  loginSuccess: "You're connected!",
  loginValidate: 'Try again',
  // HUMAN messages only — no technical detail on screen.
  loginErrorGenericTitle: 'Unable to sign in to Spotify.',
  loginErrorGenericBody: 'Check your internet connection, then try again.',
  loginCancelledTitle: 'Sign-in cancelled',
  loginCancelledBody: 'You can try again whenever you like.',
  loginOAuthRefusedTitle: 'Spotify refused the connection',
  loginOAuthRefusedBody:
    'Make sure you authorize Melodix on the Spotify page, then try again.',
  loginNotConfigured: 'Spotify sign-in is unavailable right now.',
  loginNotConfiguredBody: 'Please try again later.',
  loginPrivacyNote:
    'Secure sign-in with Spotify. You will never be asked for a key: you sign in on the official Spotify page, then return to Melodix.',
  loginSecureFootnote: 'Secure sign-in with Spotify',
  loginSessionExpired:
    'Your Spotify session has expired.\nSign in again to continue.',
  loginFetchFailed: 'Unable to load your playlists.\nPlease try again later.',
  loginSignOut: 'Sign out',
  loginSignOutConfirmTitle: 'Sign out of Spotify?',
  loginSignOutConfirmMessage:
    'Your Spotify session will be removed from this device. Your local favorites and history are preserved.',
  loginSignOutConfirm: 'Sign out',
  accountSpotifySection: 'Spotify account',
  accountSignOut: 'Sign out',
};

// Playlists: dynamic availability stat, provider badges, unavailable notice.
// Local profile (avatar, top-left): data stored on the device.
export const EN_GB_ACCOUNT = {
  accountTitle: 'Melodix',
  accountLocalInfo:
    'No account required: your favorites, library and history are stored only on this device.',
  accountClearHistory: 'Clear listening history',
  accountHistoryCleared: 'History cleared.',
  accountCancel: 'Cancel',
};

// Home screen (real Spotify data: greeting, sections, empty/error states).
// Lecteur : miroir anglais de FR_FR_PLAYER (les messages critiques du player
// restent surchargés en français dans la base via fr-fr.ts).
export const EN_GB_PLAYER = {
  playerPlay: 'Play',
  playerPause: 'Pause',
  playerNext: 'Next track',
  playerPrevious: 'Previous track',
  playerStop: 'Close the player',
  playerLoading: 'Loading…',
  playerShuffle: 'Shuffle',
  playerRepeat: 'Repeat',
  playerRepeatOne: 'Repeat track',
  playerVolume: 'Volume',
  playerSeek: 'Position',
  playerUpNext: 'Up next',
  playerExpand: 'Expand player',
  playerClose: 'Collapse player',
  playerStreamedWith: (provider: string) => `Playing via ${provider}`,
  playerTrackUnavailable: (title: string) =>
    `"${title}" is not available on Audius.`,
  playerMatchUncertain: (title: string) =>
    `No reliable match for "${title}": no audio is playing.`,
  playerTrackPlayFailed: (title: string) => `Playback of "${title}" failed.`,
  playerError: 'Playback failed. Try another track.',
  playerQueueTitle: 'Queue',
  playerQueuePlaying: 'Now playing',
  playerQueueEmpty: 'The queue is empty.',
  playerQueueAdd: 'Add to queue',
  playerQueuePlayNext: 'Play next',
  playerQueueRemove: 'Remove from queue',
  playerQueueMoveUp: 'Move up in queue',
  playerQueueMoveDown: 'Move down in queue',
  playerQueueTrackActions: (title: string) =>
    `Actions for "${title}": add to queue or play next`,
  playerResumeTitle: 'Resume listening',
  playerResumeAction: 'Resume',
  playerResumeDismiss: 'Dismiss',
  playerResumePosition: (position: string) => `Resume at ${position}`,
  playerUnavailable: 'Audio is unavailable on this device.',
};

export const EN_GB_HOME = {
  homeHello: (name: string) => `Hello, ${name}`,
  homeGreetingMorning: (name: string) => `Good morning, ${name} 👋`,
  homeGreetingEvening: (name: string) => `Good evening, ${name} 👋`,
  homeGreetingNight: (name: string) => `Good night, ${name} 👋`,
  homeListenPrompt: 'What do you want to listen to?',
  homeYourPlaylists: 'Your playlists',
  homeRecentlyPlayed: 'Recently played',
  homeForYou: 'For you',
  homePlaylistsEmptyTitle: 'No playlists yet',
  homePlaylistsEmptyBody: 'Your Spotify playlists will show up here.',
  homeRefresh: 'Refresh',
  homeLoadErrorTitle: 'Could not load your Spotify data.',
  homeRetry: 'Try again',
  homeSettings: 'Account settings',
};

// Settings screen (sections, rows, helpers, FAQ, about) — real strings.
export const EN_GB_SETTINGS = {
  settingsTitle: 'Settings',
  settingsBack: 'Back',
  settingsSectionAccount: 'Account',
  settingsConnectedSpotify: 'Connected to Spotify',
  settingsCheckingSession: 'Checking the session…',
  settingsLocalAccount: 'Local account',
  settingsSpotifyAccount: 'Spotify account',
  settingsSessionExpiry: (minutes: number) =>
    minutes > 0 ? `Session valid for ~${minutes} min` : 'Session expiring soon',
  settingsSessionCanRefresh: 'Automatic renewal available',
  settingsSessionNoRefresh: 'Sign-in required at the next expiration',
  settingsSignOut: 'Sign out',
  settingsSignOutTitle: 'Are you sure you want to sign out of Melodix?',
  settingsCancel: 'Cancel',
  settingsSignOutConfirm: 'Sign out',
  settingsSectionAppearance: 'Appearance',
  settingsTheme: 'Theme',
  settingsThemeDark: 'Dark',
  settingsThemeLight: 'Light',
  settingsThemeSystem: 'System',
  settingsComingSoon: 'Coming soon',
  settingsAccent: 'Accent color',
  settingsSectionPlayback: 'Playback',
  settingsBackgroundAudio: 'Background playback',
  settingsBackgroundAudioHint:
    'Keeps audio playing while Melodix is in the background',
  settingsRepeatAll: 'Repeat queue',
  settingsRepeatAllHint: 'Replays the queue when it ends',
  settingsShuffle: 'Shuffle',
  settingsShuffleHint: 'Shuffle the current queue order',
  settingsStartupVolume: 'Startup volume',
  settingsStartupVolumeHint: (volume: number) =>
    `Applied when the engine starts: ${volume} %`,
  settingsSectionAudio: 'Audio',
  settingsPreferredSource: 'Preferred audio source',
  settingsSourceAudius: 'Audius — primary',
  settingsSourceYouTube: 'YouTube — fallback',
  settingsCascadeInfo:
    'Current order: Audius first, then YouTube as a fallback. Every track is matched in this order and marked unavailable only if no reliable source fits.',
  settingsSectionStorage: 'Data & storage',
  settingsMatchCache: 'Match cache',
  settingsCacheSizeUnavailable: 'size unavailable',
  settingsClearCache: 'Clear cache',
  settingsClearCacheTitle: 'Clear the audio cache?',
  settingsClearCacheConfirm: 'Clear',
  settingsCacheCleared: 'Cache cleared.',
  settingsSectionLanguage: 'Language',
  settingsLanguage: 'Language',
  settingsFrench: 'Français',
  settingsEnglish: 'English',
  settingsSectionHelp: 'Help',
  settingsFaq: 'FAQ',
  settingsReportProblem: 'Report a problem',
  settingsAboutLogin: 'About Spotify sign-in',
  settingsPlaybackIssues: 'Playback issues',
  settingsSectionAbout: 'About',
  settingsVersion: 'Version',
  settingsTerms: 'Terms of use',
  settingsPrivacy: 'Privacy policy',
  settingsLicenses: 'Open-source licenses',
  settingsGithub: 'GitHub',
  settingsCredits: 'Credits',
  settingsCreditsBody: 'Spotify · Audius · YouTube · Expo · React Native',
  // Aide (faq.tsx) — contenu RÉEL utile, aucune promesse fictive.
  faqIntro:
    'Answers to the most common questions about Melodix, built from how the app really works.',
  faqLoginQ: 'Why do I sign in with Spotify?',
  faqLoginA:
    'Melodix reads your Spotify playlists and profile. The sign-in uses the official Spotify page (Authorization Code + PKCE): Melodix never sees your password and never asks for one.',
  faqPlaybackQ: 'Why is a track “unavailable”?',
  faqPlaybackA:
    'Audio never comes from Spotify. Each track is matched against Audius first, then YouTube as a fallback. “Unavailable” is shown only when no reliable match is found.',
  faqSourcesQ: 'Where does the sound come from?',
  faqSourcesA:
    'From public catalogues: Audius in priority (independent artists), otherwise YouTube. The match is cached on your device so replays are instant.',
  faqCacheQ: 'What does clearing the cache do?',
  faqCacheA:
    'It forgets the track-source matches stored on the device. The next playback re-searches Audius then YouTube. Your account, playlists and history are untouched.',
  faqAccountQ: 'Where is my data stored?',
  faqAccountA:
    'On your device only: playback history, settings and the Spotify session (encrypted store). Melodix keeps no user profile server-side.',
  // À propos (about.tsx)
  aboutTermsBody:
    'Melodix is a personal music companion app. Sign in with your own Spotify account and use the app for personal, non-commercial listening. The Spotify, Audius and YouTube names and content belong to their respective owners.',
  aboutPrivacyBody:
    'Melodix stores your data only on your device: listening history, preferences and the encrypted Spotify session. Nothing is uploaded to any Melodix server. Signing out permanently removes the local session.',
  aboutLicensesBody:
    'Built with: Expo (MIT), React Native (MIT), React Navigation (MIT), expo-av / expo-auth-session (MIT), AsyncStorage (MIT). Catalogues: Spotify Web API, Audius API, YouTube — each under its own terms.',
};

export const EN_GB_PLAYLIST = {
  playlistAvailabilityInfo: (available: number, total: number) =>
    `${available}/${total} tracks available`,
  trackUnavailableNotice:
    'This track is unavailable on the current playback sources.',
  providerAudius: 'Audius',
  providerYouTube: 'YouTube',
  providerUnavailable: 'Unavailable',
};
