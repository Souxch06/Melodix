/**
 * Constantes réseau du backend.
 *
 * Les URLs Spotify ci-dessous concernent UNIQUEMENT la lecture de métadonnées :
 * recherche de catalogue et fiches publiques (track/album/playlist/artist).
 * Melodix ne télécharge, n'extrait, ne contourne, ne rediffuse et ne proxie
 * JAMAIS l'audio Spotify — l'audio vient exclusivement d'Audius.
 */

/** Home publique du Web Player : sert à repérer le bundle JS (secret TOTP). */
export const SPOTIFY_WEB_BASE_URL = 'https://open.spotify.com';

/** Endpoint GraphQL interne du Web Player (recherche persistée). */
export const SPOTIFY_PARTNER_API_URL =
  'https://api-partner.spotify.com/pathfinder/v1';

/** API découverte Audius (audio autorisé, catalogue ouvert). */
export const AUDIUS_DISCOVERY_API_URL =
  'https://discoveryprovider.audius.co/v1';

/** Nom d'appli déclaré à Audius (requis par la politique de l'API). */
export const AUDIUS_APP_NAME = 'melodix';

/**
 * Hash courant de la persisted query `searchDesktop` (Web Player).
 * Peut tourner lors d'une mise à jour de Spotify : surchargeable via
 * MELODIX_SPOTIFY_SEARCH_HASH.
 */
export const SPOTIFY_SEARCH_DESKTOP_HASH =
  '75bbf6bfcfdf85b8fc828417bfad92b7cd66bf7f556d85670f4da8292373ebec';

/** Types de recherche selon la taxonomie Melodix. */
export const SEARCH_TYPES = ['tracks', 'albums'] as const;
export type SearchType = (typeof SEARCH_TYPES)[number];
