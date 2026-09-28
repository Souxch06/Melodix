/**
 * Configuration Expo de Melodix.
 *
 * Melodix 3.0 : AUCUNE configuration Spotify n'est requise — ni pour
 * l'utilisateur, ni pour compiler l'application. L'app est un lecteur UI +
 * client API ; les métadonnées (recherche, albums, playlists…) viennent du
 * backend Melodix (voir server/), l'audio d'Audius.
 *
 * Variables d'environnement facultatives (fichier .env ou variables de CI) :
 * - MELODIX_BACKEND_URL : URL du backend Melodix qui fournit les métadonnées
 *   Spotify (ex. https://melodix-api.exemple.fr). Sans elle, l'application
 *   fonctionne quand même : la recherche retombe sur le catalogue Audius
 *   local et les sections personnelles sur l'historique local.
 * - AUDIUS_API_KEY : clé API Audius (gratuite, dashboard Audius) intégrée à
 *   l'application par le mainteneur — jamais par l'utilisateur. Sans elle,
 *   l'app interroge les nœuds publics de découverte Audius.
 * - SPOTIFY_CLIENT_ID : Client ID de l'application Spotify du mainteneur
 *   (OAuth Authorization Code + PKCE ; aucun Client Secret — PKCE l'exclut).
 *   Rôle UNIQUE : l'écran de connexion. Jamais saisi par l'utilisateur.
 *   Le workflow Android la recopie aussi vers EXPO_PUBLIC_SPOTIFY_CLIENT_ID :
 *   les variables EXPO_PUBLIC_* sont INLINÉES par Metro dans le bundle JS au
 *   build, voie robuste en APK bare (ne dépend pas de l'asset natif
 *   app.config généré par expo-constants — doublon volontaire des deux canaux,
 *   l'app prend la première source disponible, voir services/spotify/authConfig).
 *
 * Aucun secret n'est intégré à l'APK : les tokens Spotify éphémères vivent
 * exclusivement CÔTÉ SERVEUR (techniques Web Player non officielles,
 * isolées et remplaçables — voir server/src/spotify/).
 */
const melodixBackendUrl = process.env.MELODIX_BACKEND_URL || '';
const audiusApiKey = process.env.AUDIUS_API_KEY || '';
const spotifyClientId = process.env.SPOTIFY_CLIENT_ID || '';

module.exports = {
  expo: {
    name: 'Melodix',
    slug: 'melodix',
    version: '4.1.1',
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
      versionCode: 41100,
      adaptiveIcon: {
        foregroundImage: './assets/images/adaptive-icon.png',
        backgroundImage: './assets/images/adaptive-icon-background.png',
      },
    },
    ios: {
      bundleIdentifier: 'com.souxch06.melodix',
      infoPlist: {
        UIBackgroundModes: ['audio'],
      },
    },
    web: {
      bundler: 'metro',
      favicon: './assets/images/logo.png',
    },
    experiments: {
      typedRoutes: true,
    },
    extra: {
      melodixBackendUrl,
      spotifyClientId,
      audiusApiKey,
      router: {
        origin: false,
      },
    },
  },
};
