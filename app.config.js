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
 * - SPOTIFY_REDIRECT_URI : redirect URI OAuth (vaut au minimum
 *   'melodix://callback' — valeur par défaut déclarée dans le manifest).
 *   Sert à éprouver d'autres configurations sans changer l'architecture.
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
// ▸ Client ID PAR DÉFAUT intégré au build : l'ID public de l'application
//   de référence (OAuth Authorization Code + PKCE — aucun Client Secret, la
//   connexion passe par l'écran officiel de Spotify). SPOTIFY_CLIENT_ID en
//   variable de build surclasserait cette valeur — aucun champ utilisateur.
const spotifyClientId =
  process.env.SPOTIFY_CLIENT_ID || '089d841ccc194c10a77afad9e1c11d54';
// ▸ Redirect OAuth PAR DÉFAUT : celui validé par l'application ci-dessus.
//   Le scheme natif `melodix` reste TOUJOURS déclaré dans le manifest (la
//   clé `scheme` ci-dessous) ; la valeur dynamique ajoute l'intent-filter
//   du scheme externe pour que Android route le retour navigateur.
const spotifyRedirectUri =
  process.env.SPOTIFY_REDIRECT_URI || 'comspotifytestsdk://callback';

// Deep link OAuth : le scheme NATIF `melodix` (clé `scheme` ci-dessous) reste
// TOUJOURS déclaré — valeur par défaut officielle de Melodix. Si un redirect
// de TEST configuré utilise un AUTRE scheme (ex. éprouver l'OAuth avec l'app
// publique de référence Spotify), on AJOUTE l'intent-filter correspondant
// pour que Android route le retour navigateur vers l'app. AUCUN contournement
// de la vérification côté Spotify : le dashboard de l'app Spotify cible doit
// déclarer exactement ce redirect, sinon Spotify le refuse.
const redirectMatch = spotifyRedirectUri.match(
  /^([a-z][a-z0-9+.-]*):\/\/([^/]+)(\/.*)?$/i
);
const extraIntentFilters =
  redirectMatch && redirectMatch[1].toLowerCase() !== 'melodix'
    ? [
        {
          action: 'VIEW',
          data: [{ scheme: redirectMatch[1], host: redirectMatch[2] }],
          category: ['BROWSABLE', 'DEFAULT'],
        },
      ]
    : [];
if (extraIntentFilters.length > 0) {
  // Trace build CI : quel redirect hors défaut est bagué dans l'APK.
  console.log(
    `[app.config] SPOTIFY_REDIRECT_URI externe → intent-filter ajouté : ${spotifyRedirectUri}`
  );
}

module.exports = {
  expo: {
    name: 'Melodix',
    slug: 'melodix',
    version: '4.3.0',
    orientation: 'portrait',
    icon: './assets/images/icon.png',
    scheme: 'melodix',
    userInterfaceStyle: 'dark',
    plugins: [
      'expo-router',
      // Phase 5A : MediaSession/Foreground Service Android (manifest généré,
      // idempotent). android/ reste NON versionné (prebuild).
      './modules/melodix-media/plugin/withMelodixMedia',
    ],
    splash: {
      image: './assets/images/splash.png',
      resizeMode: 'contain',
      backgroundColor: '#121212',
    },
    android: {
      package: 'com.souxch06.melodix',
      versionCode: 43000,
      intentFilters: extraIntentFilters,
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
      spotifyRedirectUri,
      audiusApiKey,
      router: {
        origin: false,
      },
    },
  },
};
