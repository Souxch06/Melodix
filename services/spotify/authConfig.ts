/**
 * Configuration de la connexion Spotify (OAuth Authorization Code + PKCE).
 *
 * INVARIANTS DE SÉCURITÉ :
 * - AUCUN Client Secret ici (PKCE l'exclut ; le mobile est un client public) ;
 * - le Client ID est une CONFIGURATION DE BUILD du mainteneur (variable
 *   SPOTIFY_CLIENT_ID → app.config.js extra.spotifyClientId), JAMAIS saisie
 *   par l'utilisateur — aucun écran ne présente de champ credential ;
 * - les tokens ne sont jamais consignés (logs) : seules les métadonnées de
 *   session (durée, scopes) peuvent l'être côté développeur.
 *
 * Configuration côté Spotify Dashboard (mainteneur) :
 *   Redirect URIs : melodix://callback (APK), exp://<ip>:8081/--/callback (Expo Go).
 */
import Constants from 'expo-constants';

/** Client ID intégré au build ; vide = connexion non configurée. */
export const getSpotifyClientId = (): string => {
  const extra = Constants.expoConfig?.extra as
    | { spotifyClientId?: unknown }
    | undefined;
  const id = typeof extra?.spotifyClientId === 'string' ? extra.spotifyClientId : '';
  return id.trim();
};

export const isSpotifyLoginConfigured = (): boolean => getSpotifyClientId() !== '';

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
