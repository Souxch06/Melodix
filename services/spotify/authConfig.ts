/**
 * Configuration de la connexion Spotify (OAuth Authorization Code + PKCE).
 *
 * INVARIANTS DE SÉCURITÉ :
 * - AUCUN Client Secret ici (PKCE l'exclut ; le mobile est un client public) ;
 * - le Client ID est une CONFIGURATION DE BUILD du mainteneur, JAMAIS saisie
 *   par l'utilisateur — aucun écran ne présente de champ credential ;
 * - l'identifiant n'est jamais consigné : seuls SA SOURCE et sa présence
 *   (booléen) peuvent apparaître dans les logs de diagnostic.
 *
 * Injection dans le build (par ordre de priorité) :
 *   1. `EXPO_PUBLIC_SPOTIFY_CLIENT_ID` — variable EXPO_PUBLIC inlinée par
 *      Metro dans le bundle JS au moment du build (chemin robuste en APK bare,
 *      ne dépend pas du natif). Non committée : fournie par l'env de CI.
 *   2. `SPOTIFY_CLIENT_ID` → app.config.js extra.spotifyClientId →
 *      Constants.expoConfig.extra (asset natif `app.config` généré par la
 *      tâche gradle expo-constants `createExpoConfig` au build).
 *   3. manifest classique (expo SDK < 51, par prudence sur les builds froids).
 *
 * Configuration côté Spotify Dashboard (mainteneur) :
 *   Redirect URIs : melodix://callback (APK), exp://<ip>:8081/--/callback (Expo Go).
 */
import Constants from 'expo-constants';

type ExtraCarrier =
  | { expoConfig?: { extra?: Record<string, unknown>; [k: string]: unknown } | null; manifest?: unknown; manifest2?: unknown }
  | null
  | undefined;

/** Lecture tolérante : expoConfig (SDK 51+), puis manifest manifest2. */
const readExtra = (): Record<string, unknown> => {
  const constants = Constants as unknown as NonNullable<ExtraCarrier> & {
    manifest?: { extra?: Record<string, unknown> } | null;
    manifest2?: { default?: { extra?: Record<string, unknown> } | null } | null;
  };

  return (
    (constants.expoConfig?.extra as Record<string, unknown> | undefined) ??
    constants.manifest?.extra ??
    constants.manifest2?.default?.extra ??
    {}
  );
};

export type ClientIdSource =
  | 'expo-public-env' // inlinée par Metro (voie la plus robuste en APK)
  | 'expo-config-extra' // asset natif app.config (CI prebuild)
  | 'none';

/** Détail du Client ID : présence + ORIGINE (jamais la valeur en log). */
export type ClientIdInfo = {
  clientId: string;
  source: ClientIdSource;
};

export const getClientIdInfo = (): ClientIdInfo => {
  const envValue =
    typeof process !== 'undefined'
      ? (process.env?.EXPO_PUBLIC_SPOTIFY_CLIENT_ID ?? '')
      : '';
  if (typeof envValue === 'string' && envValue.trim()) {
    return { clientId: envValue.trim(), source: 'expo-public-env' };
  }

  const extra = readExtra();
  const embedded =
    typeof extra.spotifyClientId === 'string' ? extra.spotifyClientId.trim() : '';
  if (embedded) {
    return { clientId: embedded, source: 'expo-config-extra' };
  }

  return { clientId: '', source: 'none' };
};

/** Client ID intégré au build ; vide = connexion non configurée. */
export const getSpotifyClientId = (): string => getClientIdInfo().clientId;

export const isSpotifyLoginConfigured = (): boolean =>
  getSpotifyClientId() !== '';

/** Valeur par défaut EXIGÉE : scheme natif du build Android. */
export const DEFAULT_SPOTIFY_REDIRECT_URI = 'melodix://callback';

export type RedirectUriSource =
  | 'expo-public-env' // SPOTIFY_REDIRECT_URI → EXPO_PUBLIC_* inliné (robuste APK)
  | 'expo-config-extra' // extra.spotifyRedirectUri (app.config au build)
  | 'default'; // absence totale de config → la valeur par défaut native

/**
 * Redirect URI OAuth Spotify — entièrement configurable de build en build
 * (pour éprouver d'autres apps/flows sans changer l'architecture), avec la
 * valeur par défaut native `melodix://callback`.
 *
 * ORDRE DE LECTURE :
 *   1. `EXPO_PUBLIC_SPOTIFY_REDIRECT_URI` (inliné par Metro au build) ;
 *   2. `SPOTIFY_REDIRECT_URI` → app.config.js extra.spotifyRedirectUri ;
 *   3. valeur par défaut `melodix://callback`.
 *
 * La MÊME valeur sert à la construction de l'AuthRequest (/authorize) ET au
 * token exchange : un écart entre les deux causes un `invalid_grant` Spotify,
 * c'est précisément ce que cette source unique élimine par construction.
 */
export const getSpotifyRedirectUri = (): string => {
  const envValue =
    typeof process !== 'undefined'
      ? (process.env?.EXPO_PUBLIC_SPOTIFY_REDIRECT_URI ?? '')
      : '';
  if (typeof envValue === 'string' && envValue.trim()) {
    return envValue.trim();
  }

  const extra = readExtra();
  const embedded =
    typeof extra.spotifyRedirectUri === 'string'
      ? extra.spotifyRedirectUri.trim()
      : '';
  if (embedded) {
    return embedded;
  }

  return DEFAULT_SPOTIFY_REDIRECT_URI;
};

/** Source du redirect (diagnostic LOG sans secret — l'URI est publique). */
export const getSpotifyRedirectUriSource = (): RedirectUriSource => {
  const envValue =
    typeof process !== 'undefined'
      ? (process.env?.EXPO_PUBLIC_SPOTIFY_REDIRECT_URI ?? '')
      : '';
  if (typeof envValue === 'string' && envValue.trim()) {
    return 'expo-public-env';
  }
  const extra = readExtra();
  const embedded =
    typeof extra.spotifyRedirectUri === 'string'
      ? extra.spotifyRedirectUri.trim()
      : '';
  return embedded ? 'expo-config-extra' : 'default';
};

/**
 * Scopes strictement nécessaires (permission minimale) :
 * - user-read-private        → profil (nom d'affichage, photo) ;
 * - playlist-read-private    → playlists personnelles ;
 * - playlist-read-collaborative → playlists collaboratives.
 * Pas d'email : inutile au fonctionnement de Melodix.
 */
export const SPOTIFY_SCOPES = [
  'user-read-private',
  'playlist-read-private',
  'playlist-read-collaborative',
] as const;

export const SPOTIFY_DISCOVERY = {
  authorizationEndpoint: 'https://accounts.spotify.com/authorize',
  tokenEndpoint: 'https://accounts.spotify.com/api/token',
};

export const SPOTIFY_API_BASE_URL = 'https://api.spotify.com/v1';

/** Lien de retour déclaré dans l'APK (voir app.config.js scheme). */
export const SPOTIFY_REDIRECT_SCHEME = 'melodix';
export const SPOTIFY_REDIRECT_PATH = 'callback';
