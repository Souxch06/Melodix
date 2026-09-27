/**
 * Configuration Expo de Melodix.
 *
 * Connexion : par défaut, l'utilisateur colle le token d'accès affiché sur
 * developer.spotify.com (valable 1 heure). Pour une connexion permanente, il
 * peut aussi utiliser le Client ID de sa propre application Spotify.
 *
 * Variable d'environnement facultative (fichier .env ou variable de CI) :
 * - SPOTIFY_CLIENT_ID : Client ID intégré à l'application. L'écran de connexion
 *   propose alors directement « Se connecter avec Spotify ».
 *
 * Aucun secret n'est intégré : la connexion permanente utilise le flux OAuth
 * « Authorization Code + PKCE », et un token ne doit jamais figurer ici.
 */
const clientID = process.env.SPOTIFY_CLIENT_ID || process.env.CLIENT_ID || '';

module.exports = {
  expo: {
    name: 'Melodix',
    slug: 'melodix',
    version: '1.2.0',
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
      versionCode: 10200,
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
