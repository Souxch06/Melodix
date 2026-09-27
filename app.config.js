/**
 * Configuration Expo de Melodix.
 *
 * Variable d'environnement facultative (fichier .env ou variable de CI) :
 * - SPOTIFY_CLIENT_ID : Client ID de ton application Spotify. S'il est absent,
 *   l'application le demande au premier lancement.
 *
 * Aucun secret n'est nécessaire : la connexion utilise le flux OAuth
 * « Authorization Code + PKCE ».
 */
const clientID = process.env.SPOTIFY_CLIENT_ID || process.env.CLIENT_ID || '';

module.exports = {
  expo: {
    name: 'Melodix',
    slug: 'melodix',
    version: '1.1.0',
    orientation: 'portrait',
    icon: './assets/images/icon.png',
    scheme: 'melodix',
    userInterfaceStyle: 'dark',
    plugins: ['expo-router'],
    splash: {
      image: './assets/images/splash.png',
      resizeMode: 'contain',
      backgroundColor: '#121212',
    },
    android: {
      package: 'com.souxch06.melodix',
      versionCode: 10100,
      adaptiveIcon: {
        foregroundImage: './assets/images/adaptive-icon.png',
        backgroundImage: './assets/images/adaptive-icon-background.png',
      },
    },
    ios: {
      bundleIdentifier: 'com.souxch06.melodix',
    },
    web: {
      bundler: 'metro',
      favicon: './assets/images/logo.png',
    },
    experiments: {
      typedRoutes: true,
    },
    extra: {
      clientID,
      tokenKey: process.env.TOKEN_KEY || 'melodix.token',
      refreshTokenKey: process.env.REFRESH_TOKEN_KEY || 'melodix.refresh-token',
      expirationKey: process.env.EXPIRATION_KEY || 'melodix.token-expiration',
      authorizationEndpoint:
        process.env.AUTHORIZATION_ENDPOINT ||
        'https://accounts.spotify.com/authorize',
      tokenEndpoint:
        process.env.TOKEN_ENDPOINT || 'https://accounts.spotify.com/api/token',
      router: {
        origin: false,
      },
    },
  },
};
