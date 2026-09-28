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
 *
 * Aucun secret n'est intégré à l'APK : les tokens Spotify éphémères vivent
 * exclusivement CÔTÉ SERVEUR (techniques Web Player non officielles,
 * isolées et remplaçables — voir server/src/spotify/).
 */
const melodixBackendUrl = process.env.MELODIX_BACKEND_URL || '';
const audiusApiKey = process.env.AUDIUS_API_KEY || '';

module.exports = {
  expo: {
    name: 'Melodix',
    slug: 'melodix',
    version: '3.0.0',
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
      versionCode: 30000,
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
      audiusApiKey,
      router: {
        origin: false,
      },
    },
  },
};
