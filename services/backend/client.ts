/**
 * Client du backend Melodix (métadonnées).
 *
 * Le backend est la SEULE passerelle vers les métadonnées Spotify : il
 * détient les tokens éphémères (jamais émis vers l'app) et répond en JSON
 * normalisé (TrackMetadataDTO…). Ce client :
 * - ne transporte AUCUN secret (pas d'en-tête d'autorisation) ;
 * - timeout de 8 s maximum et gestion d'erreurs typée — un backend absent
 *   ou lent ne bloque jamais l'interface ;
 * - URL configurable via app.config.js extra.melodixBackendUrl (build-time
 *   MELODIX_BACKEND_URL). URL vide = backend non configuré : les appels
 *   échouent « proprement » (kind: 'unavailable') pour que les couches
 *   au-dessus basculent sur le repli Audius/historique local.
 */

import Constants from 'expo-constants';

const REQUEST_TIMEOUT_MS = 8000;

export type BackendErrorKind = 'unavailable' | 'http' | 'network';

export class BackendError extends Error {
  constructor(
    public readonly kind: BackendErrorKind,
    message: string,
    /** Code machine renvoyé par le backend (BAD_REQUEST, NOT_FOUND, …). */
    public readonly code?: string,
    public readonly status?: number
  ) {
    super(message);
    this.name = 'BackendError';
  }
}

export const getBackendBaseUrl = (): string => {
  const extra = Constants.expoConfig?.extra as
    | { melodixBackendUrl?: unknown }
    | undefined;
  const url = typeof extra?.melodixBackendUrl === 'string' ? extra.melodixBackendUrl : '';
  return url.trim().replace(/\/+$/, '');
};

export const isBackendConfigured = (): boolean => getBackendBaseUrl() !== '';

export const backendGet = async <T>(
  path: string,
  params: Record<string, string> = {}
): Promise<T> => {
  const baseUrl = getBackendBaseUrl();
  if (!baseUrl) {
    throw new BackendError('unavailable', 'Backend Melodix non configuré.');
  }

  const url = new URL(`${baseUrl}${path}`);
  for (const [key, value] of Object.entries(params)) {
    if (value !== '') {
      url.searchParams.set(key, value);
    }
  }

  // Timeout manuel : AbortSignal.timeout n'est pas disponible sur toutes les
  // cibles (Hermes / environnements de test).
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);

  let response: Response;
  try {
    response = await fetch(url.toString(), {
      method: 'GET',
      headers: { Accept: 'application/json' },
      signal: controller.signal,
    });
  } catch (error) {
    const isTimeout =
      error instanceof Error &&
      (error.name === 'AbortError' || error.name === 'TimeoutError');
    throw new BackendError(
      isTimeout ? 'unavailable' : 'network',
      'Backend Melodix injoignable.'
    );
  } finally {
    clearTimeout(timer);
  }

  if (!response.ok) {
    let code: string | undefined;
    let message = `Erreur backend (${response.status})`;
    try {
      const body = (await response.json()) as {
        error?: { code?: string; message?: string };
      };
      code = typeof body?.error?.code === 'string' ? body.error.code : undefined;
      if (typeof body?.error?.message === 'string' && body.error.message) {
        message = body.error.message;
      }
    } catch {
      // Corps non JSON : on conserve le message générique.
    }
    throw new BackendError('http', message, code, response.status);
  }

  return (await response.json()) as T;
};
