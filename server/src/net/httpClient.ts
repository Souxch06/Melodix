/**
 * Client HTTP minimal du backend (fetch natif Node 20).
 *
 * Idées d'architecture inspirées du projet de référence (sans en copier le
 * code) : timeout par requête, retry BORNÉ uniquement sur erreurs
 * transitoires (429, 5xx, transport), honorer `Retry-After`, backoff
 * linéaire, et snippet d'erreur borné dans les logs pour rester
 * débogable sans risquer de charger un corps hostile complet en mémoire.
 */

import { env } from '../config/env';
import { createLogger } from '../logging/logger';

const logger = createLogger('HttpClient');

const SNIPPET_MAX_CHARS = 400;

export class HttpClientError extends Error {
  constructor(
    message: string,
    public readonly status: number,
    public readonly url: string,
    public readonly retryAfterSeconds: number | null,
    public readonly bodySnippet: string | null
  ) {
    super(message);
    this.name = 'HttpClientError';
  }
}

type RequestOptions = {
  method?: 'GET' | 'POST';
  headers?: Record<string, string>;
  timeoutMs?: number;
  retries?: number;
};

const isRetryableStatus = (status: number): boolean =>
  status === 429 || status >= 500;

const retryDelayMs = (
  attempt: number,
  retryAfterSeconds: number | null
): number => {
  if (retryAfterSeconds !== null && retryAfterSeconds >= 0) {
    // +1s de marge : Retry-After est un minimum contractuel.
    return (retryAfterSeconds + 1) * 1000;
  }
  return attempt * 1000;
};

const snippetOf = async (response: Response): Promise<string | null> => {
  try {
    const text = await response.text();
    if (!text) {
      return null;
    }
    return text.length > SNIPPET_MAX_CHARS
      ? `${text.slice(0, SNIPPET_MAX_CHARS)}…`
      : text;
  } catch {
    return null;
  }
};

/**
 * GET/POST JSON ou texte. Ne logge JAMAIS les headers : `Authorization`
 * y transporte le token éphémère Spotify.
 */
export const httpRequest = async <T>(
  url: string,
  options: RequestOptions = {}
): Promise<T> => {
  const method = options.method ?? 'GET';
  const timeoutMs = options.timeoutMs ?? env.upstream.timeoutMs;
  const retries = options.retries ?? env.upstream.retries;

  let lastError: unknown = null;

  for (let attempt = 0; attempt <= retries; attempt += 1) {
    if (attempt > 0) {
      const retryAfter =
        lastError instanceof HttpClientError
          ? lastError.retryAfterSeconds
          : null;
      const delay = retryDelayMs(attempt, retryAfter);
      logger.debug(`retry ${attempt}/${retries} after ${delay}ms — ${url}`);
      await new Promise((resolve) => setTimeout(resolve, delay));
    }

    try {
      const response = await fetch(url, {
        method,
        headers: options.headers,
        signal: AbortSignal.timeout(timeoutMs),
      });

      if (response.status < 200 || response.status >= 300) {
        const retryAfterHeader = response.headers.get('retry-after');
        const parsedRetryAfter = retryAfterHeader
          ? Number.parseInt(retryAfterHeader, 10)
          : NaN;
        const snippet = await snippetOf(response);
        throw new HttpClientError(
          `Unexpected status ${response.status}`,
          response.status,
          url,
          Number.isFinite(parsedRetryAfter) ? parsedRetryAfter : null,
          snippet
        );
      }

      const contentType = response.headers.get('content-type') ?? '';
      if (contentType.includes('application/json')) {
        return (await response.json()) as T;
      }
      return (await response.text()) as T;
    } catch (error) {
      lastError = error;

      const status = error instanceof HttpClientError ? error.status : null;
      const retryable =
        status !== null ? isRetryableStatus(status) : error instanceof Error;
      // Les erreurs de transport (fetch reject / AbortError) sont retryables ;
      // les statuts 4xx (sauf 429) ne le sont pas.

      if (attempt >= retries || !retryable) {
        throw error;
      }
    }
  }

  throw lastError;
};

export const httpGet = <T>(
  url: string,
  options: Omit<RequestOptions, 'method'> = {}
): Promise<T> => httpRequest<T>(url, { ...options, method: 'GET' });
