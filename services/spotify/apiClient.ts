/**
 * Client de l'API Web Spotify OFFICIELLE (données personnelles autorisées).
 *
 * Appelé directement depuis le téléphone avec le token utilisateur délivré
 * par OAuth PKCE : le token ne quitte PAS l'appareil. (Le backend Melodix
 * continue de servir les métadonnées publiques anonymement ; faire transiter
 * un token utilisateur par le serveur serait une exposition inutile.)
 *
 * Comportements :
 * - 401 → UNE tentative de refresh (RAE) puis UNE seule retry. Si le refresh
 *   est DÉFINITIF (refusé / absent) → 'unauthenticated' (le contexte purger
 *   les credentials morts et demande une reconnexion) ; si le refresh est
 *   TRANSITOIRE (429/5xx/réseau) → erreur retryable, session CONSERVÉE ;
 * - un 2ᵉ 401 après un refresh RÉUSSI → 'http' 401 retryable (le refresh
 *   token vient d'être validé : on ne force PAS une reconnexion) ;
 * - 429 sur l'API → attente Retry-After puis une retry silencieuse ;
 * - jamais d'en-tête Authorization ni de token dans les logs ni les erreurs.
 */
import { SPOTIFY_API_BASE_URL } from './authConfig';
import { sanitizeErrorDescription, spotifyLog } from './devLog';
import {
  clearSessionAccessOnly,
  refreshAccessTokenClassified,
} from './session';
import type { RefreshResult } from './session';

export type SpotifyApiErrorKind =
  | 'unauthenticated' // session absente ou définitivement invalide
  | 'network' // téléphone hors ligne / Spotify injoignable
  | 'rate-limited' // 429 malgré l'attente
  | 'http'; // autre statut (403 scope manquant, 404, …)

export class SpotifyApiError extends Error {
  constructor(
    public readonly kind: SpotifyApiErrorKind,
    message: string,
    public readonly status?: number,
    /** Message d'erreur renvoyé par Spotify, sanitisé (jamais de token). */
    public readonly spotifyMessage: string = ''
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
 * Convertit un refresh ÉCHOUÉ en erreur API classée :
 * - transitoire (429/5xx/réseau/timeout) → erreur RETRYABLE ('network' ou
 *   'rate-limited'), la session est CONSERVÉE — « Réessayer » doit
 *   fonctionner ;
 * - définitif (pas de session / pas de refresh token / refus explicite) →
 *   'unauthenticated' : le contexte purge les credentials morts et demande
 *   une nouvelle connexion.
 * Seules des infos SÛRES sont portées (code whitelisté + statut HTTP) —
 * jamais de token, de refresh_token ni d'en-tête.
 */
const throwForRefreshFailure = (
  refreshed: Exclude<RefreshResult, { ok: true }>
): never => {
  if (refreshed.cause === 'transient') {
    const rateLimited = refreshed.detail.includes('429');
    throw new SpotifyApiError(
      rateLimited ? 'rate-limited' : 'network',
      'Renouvellement de session impossible pour le moment (erreur temporaire).',
      rateLimited ? 429 : undefined
    );
  }

  // Définitif : refresh token refusé (invalid_grant, invalid_client, …)
  // ou absent — la session est morte.
  throw new SpotifyApiError(
    'unauthenticated',
    'La session Spotify a expiré.',
    refreshed.cause === 'refused' ? refreshed.status : undefined,
    refreshed.cause === 'refused'
      ? `${refreshed.errorCode} · HTTP ${refreshed.status}`
      : ''
  );
};

/**
 * GET authentifié, avec retry sain (401 → refresh ×1, 429 → attente ×2).
 * En-dehors des cas de session, `null` est renvoyé pour un corps non JSON
 — les couches au-dessus décident du message utilisateur.
 */
export const spotifyApiGet = async <T>(path: string): Promise<T> => {
  const acquired = await refreshAccessTokenClassified();
  if (!acquired.ok) {
    throw throwForRefreshFailure(acquired);
  }

  let token = acquired.token;

  let retries429 = 0;
  let retried401 = false;

  for (;;) {
    let response: Response;
    try {
      response = await doFetch(path, token);
    } catch {
      throw new SpotifyApiError('network', 'Spotify est injoignable.');
    }

    if (response.status === 401) {
      if (!retried401) {
        // Token refusé (expiré, tourné, révoqué) : on l'INVALIDE d'abord —
        // un 401 arrive même si le token n'est pas expiré localement
        // (révocation serveur, rotation, dérive d'horloge) — puis UNE
        // tentative de refresh (partagée RAE) avant de rejouer la requête.
        retried401 = true;
        await clearSessionAccessOnly();
        const refreshed = await refreshAccessTokenClassified();
        if (refreshed.ok) {
          token = refreshed.token;
          continue;
        }
        // Refresh impossible ou refusé : classification définitif/transitoire
        // (transitoire → erreur retryable, session conservée ; définitif →
        // unauthenticated, reconnexion demandée par le contexte).
        throw throwForRefreshFailure(refreshed);
      }

      // Le token fraîchement renouvelé est lui-aussi refusé : le refresh
      // token vient d'être VALIDÉ par Spotify (il vient de délivrer un token)
      // → la session est CONSERVÉE. On invalide l'access token refusé (le
      // prochain essai rafraîchira à nouveau) et on expose une erreur
      // RETRYABLE — pas 'unauthenticated', qui forcerait une reconnexion
      // inutile. Pas de boucle : au plus UN refresh + UNE retry par appel.
      await clearSessionAccessOnly();
      throw new SpotifyApiError(
        'http',
        'Access token refusé après renouvellement.',
        401
      );
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
      // Corps d'erreur Spotify : { "error": { "status": N, "message": "…" } }.
      // Le MESSAGE est informatif (scope manquant, utilisateur non inscrit au
      // dashboard…) et ne contient JAMAIS de token — il est consigné sanitisé.
      let spotifyMessage = '';
      try {
        const errBody = (await response.json()) as {
          error?: { status?: unknown; message?: unknown };
        };
        if (errBody && typeof errBody.error?.message === 'string') {
          spotifyMessage = sanitizeErrorDescription(errBody.error.message);
        }
      } catch {
        // Corps illisible : statut seul consigné.
      }
      spotifyLog('api.http', {
        status: response.status,
        endpoint: path.split('?')[0].slice(0, 80),
        cause: spotifyMessage || undefined,
      });
      throw new SpotifyApiError(
        'http',
        `Réponse Spotify non valide (${response.status}).`,
        response.status,
        spotifyMessage
      );
    }

    return (await response.json()) as T;
  }
};
