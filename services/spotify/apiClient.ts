/**
 * Client de l'API Web Spotify OFFICIELLE (données personnelles autorisées).
 *
 * Appelé directement depuis le téléphone avec le token utilisateur délivré
 * par OAuth PKCE : le token ne quitte PAS l'appareil. (Le backend Melodix
 * continue de servir les métadonnées publiques anonymement ; faire transiter
 * un token utilisateur par le serveur serait une exposition inutile.)
 *
 * Comportements :
 * - 401 → UNE tentative de refresh puis UNE seule retry ; si la session est
 *   morte, erreur 'unauthenticated' (le contexte ramène au login) ;
 * - 429 → attente Retry-After puis une retry silencieuse ;
 * - jamais d'en-tête Authorization ni de token dans les logs.
 */
import { SPOTIFY_API_BASE_URL } from './authConfig';
import {
  clearSessionAccessOnly,
  getValidAccessToken,
} from './session';

export type SpotifyApiErrorKind =
  | 'unauthenticated' // session absente ou définitivement invalide
  | 'network' // téléphone hors ligne / Spotify injoignable
  | 'rate-limited' // 429 malgré l'attente
  | 'http'; // autre statut (403 scope manquant, 404, …)

export class SpotifyApiError extends Error {
  constructor(
    public readonly kind: SpotifyApiErrorKind,
    message: string,
    public readonly status?: number
  ) {
    super(message);
    this.name = 'SpotifyApiError';
  }
}

const REQUEST_TIMEOUT_MS = 10_000;
const MAX_RATE_LIMIT_RETRIES = 2;

const doFetch = async (
  path: string,
  accessToken: string
): Promise<Response> => {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);

  try {
    return await fetch(
      path.startsWith('http') ? path : `${SPOTIFY_API_BASE_URL}${path}`,
      {
        headers: {
          Accept: 'application/json',
          Authorization: `Bearer ${accessToken}`,
        },
        signal: controller.signal,
      }
    );
  } finally {
    clearTimeout(timer);
  }
};

const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

/**
 * GET authentifié, avec retry sain (401 → refresh ×1, 429 → attente ×2).
 * En-dehors des cas de session, `null` est renvoyé pour un corps non JSON
 — les couches au-dessus décident du message utilisateur.
 */
export const spotifyApiGet = async <T>(path: string): Promise<T> => {
  let token = await getValidAccessToken();

  if (!token) {
    throw new SpotifyApiError('unauthenticated', 'Session Spotify absente.');
  }

  let retries429 = 0;
  let retried401 = false;

  for (;;) {
    let response: Response;
    try {
      response = await doFetch(path, token);
    } catch {
      throw new SpotifyApiError('network', 'Spotify est injoignable.');
    }

    if (response.status === 401 && !retried401) {
      // Token refusé (révoqué, expiré) : on force un refresh puis on rejoue.
      retried401 = true;
      const refreshed = await forceRefreshAccessToken();
      if (!refreshed) {
        throw new SpotifyApiError(
          'unauthenticated',
          'La session Spotify a expiré.'
        );
      }
      token = refreshed;
      continue;
    }

    if (response.status === 429) {
      if (retries429 >= MAX_RATE_LIMIT_RETRIES) {
        throw new SpotifyApiError(
          'rate-limited',
          'Trop de requêtes vers Spotify.',
          429
        );
      }
      retries429 += 1;
      const retryAfterSeconds = Number(response.headers.get('Retry-After'));
      const waitMs =
        Number.isFinite(retryAfterSeconds) && retryAfterSeconds > 0
          ? Math.min(retryAfterSeconds * 1000, 30_000)
          : 2000 * retries429;
      await sleep(waitMs);
      continue;
    }

    if (!response.ok) {
      throw new SpotifyApiError(
        'http',
        `Réponse Spotify non valide (${response.status}).`,
        response.status
      );
    }

    return (await response.json()) as T;
  }
};

/** Forçage explicite (invalide l'accès courant puis refetch du token). */
const forceRefreshAccessToken = async (): Promise<string | null> => {
  await clearSessionAccessOnly();
  return getValidAccessToken();
};
