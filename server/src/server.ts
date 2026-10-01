/**
 * Serveur HTTP Melodix (node:http natif, zéro dépendance).
 *
 * - CORS strict (allowlist ; `*` uniquement en développement)
 * - toutes les réponses JSON, headers de sécurité minimaux
 * - erreurs normalisées (codes machine, messages génériques)
 * - redirections gérées côté client HTTP uniquement : ce serveur ne suit
 *   aucune redirection entrante et n'accepte que du GET.
 */

import {
  createServer,
  type IncomingMessage,
  type ServerResponse,
} from 'node:http';

import { env } from './config/env';
import { ApiError } from './config/types';
import { createLogger } from './logging/logger';
import { healthHandler } from './routes/health';
import { searchHandler } from './routes/search';
import { trackHandler } from './routes/tracks';
import { albumHandler } from './routes/albums';
import { playlistHandler } from './routes/playlists';
import { artistHandler } from './routes/artists';
import { errorBody, toHttpError } from './routes/errors';

const logger = createLogger('Server');

type RouteResult =
  | Promise<{ status: number; body: unknown }>
  | { status: number; body: unknown };

type Route = {
  method: 'GET';
  /** Segments ; `:name` = paramètre. */
  segments: string[];
  handler: (params: Record<string, string>, url: URL) => RouteResult;
};

const ROUTES: Route[] = [
  { method: 'GET', segments: ['health'], handler: () => healthHandler() },
  {
    method: 'GET',
    segments: ['api', 'v1', 'search'],
    handler: (_params, url) => searchHandler(url),
  },
  {
    method: 'GET',
    segments: ['api', 'v1', 'tracks', ':id'],
    handler: (params) => trackHandler(params.id),
  },
  {
    method: 'GET',
    segments: ['api', 'v1', 'albums', ':id'],
    handler: (params) => albumHandler(params.id),
  },
  {
    method: 'GET',
    segments: ['api', 'v1', 'playlists', ':id'],
    handler: (params) => playlistHandler(params.id),
  },
  {
    method: 'GET',
    segments: ['api', 'v1', 'artists', ':id'],
    handler: (params) => artistHandler(params.id),
  },
];

const matchRoute = (
  method: string,
  pathname: string
): { route: Route; params: Record<string, string> } | null => {
  const segments = pathname.split('/').filter(Boolean);
  for (const route of ROUTES) {
    if (route.method !== method || route.segments.length !== segments.length) {
      continue;
    }
    const params: Record<string, string> = {};
    let matches = true;
    for (let i = 0; i < route.segments.length; i += 1) {
      const expected = route.segments[i];
      const actual = decodeURIComponent(segments[i]);
      if (expected.startsWith(':')) {
        params[expected.slice(1)] = actual;
      } else if (expected !== actual) {
        matches = false;
        break;
      }
    }
    if (matches) {
      return { route, params };
    }
  }
  return null;
};

const resolveCorsOrigin = (
  requestOrigin: string | undefined
): string | null => {
  const allowed = env.allowedOrigins;
  if (allowed.includes('*')) {
    return '*';
  }
  if (requestOrigin && allowed.includes(requestOrigin)) {
    return requestOrigin;
  }
  return null;
};

const sendJson = (
  res: ServerResponse,
  status: number,
  body: unknown,
  corsOrigin: string | null
): void => {
  const payload = JSON.stringify(body ?? {});
  res.writeHead(status, {
    'content-type': 'application/json; charset=utf-8',
    'content-length': Buffer.byteLength(payload),
    'cache-control': 'no-store',
    'x-content-type-options': 'nosniff',
    'x-frame-options': 'DENY',
    ...(corsOrigin
      ? {
          'access-control-allow-origin': corsOrigin,
          vary: 'Origin',
        }
      : {}),
  });
  res.end(payload);
};

const handleRequest = async (
  req: IncomingMessage,
  res: ServerResponse
): Promise<void> => {
  const requestOrigin =
    typeof req.headers.origin === 'string' ? req.headers.origin : undefined;
  const corsOrigin = resolveCorsOrigin(requestOrigin);

  // Refus CORS : l'app native Android n'émet pas d'Origin ; les clients web
  // non listés reçoivent une réponse sans en-tête d'autorisation (le
  // navigateur bloque), pas une erreur.
  if (req.method === 'OPTIONS') {
    res.writeHead(204, {
      ...(corsOrigin
        ? {
            'access-control-allow-origin': corsOrigin,
            'access-control-allow-methods': 'GET, OPTIONS',
            'access-control-allow-headers': 'content-type',
            'access-control-max-age': '86400',
            vary: 'Origin',
          }
        : {}),
    });
    res.end();
    return;
  }

  if (req.method !== 'GET') {
    sendJson(
      res,
      405,
      errorBody('BAD_REQUEST', 'Méthode non prise en charge.'),
      corsOrigin
    );
    return;
  }

  const host = req.headers.host ?? 'localhost';
  let url: URL;
  try {
    url = new URL(req.url ?? '/', `http://${host}`);
  } catch {
    sendJson(
      res,
      400,
      errorBody('BAD_REQUEST', 'Requête invalide.'),
      corsOrigin
    );
    return;
  }

  const matched = matchRoute(req.method, url.pathname);
  if (!matched) {
    sendJson(
      res,
      404,
      errorBody('NOT_FOUND', 'Route introuvable.'),
      corsOrigin
    );
    return;
  }

  try {
    const result = await matched.route.handler(matched.params, url);
    sendJson(res, result.status, result.body, corsOrigin);
  } catch (error) {
    const httpError = toHttpError(error, `${url.pathname}`);
    const status =
      error instanceof ApiError ? error.httpStatus : httpError.status;
    sendJson(res, status, httpError.body, corsOrigin);
  }
};

export const createMelodixServer = () =>
  createServer((req, res) => {
    handleRequest(req, res).catch((error) => {
      // Dernier filet : handleRequest contient déjà une garde, mais une
      // panne dans sendJson lui-même ne doit pas faire tomber le process.
      logger.error(`erreur non rattrapée: ${error}`);
      try {
        res.writeHead(500, { 'content-type': 'application/json' });
        res.end(
          JSON.stringify(
            errorBody('INTERNAL_ERROR', 'Une erreur interne est survenue.')
          )
        );
      } catch {
        // connexion déjà fermée : rien à faire.
      }
    });
  });
