/**
 * Session Spotify utilisateur (accès aux données personnelles autorisées).
 *
 * Stockage : expo-secure-store (Android Keystore / iOS Keychain — chiffré).
 * Jamais dans AsyncStorage en clair, jamais dans les logs.
 *
 * Cycle de vie :
 *   saveSession()                  — après échange OAuth réussi
 *   loadSession()                  — restauration au démarrage
 *   getValidAccessToken()          — token frais : refresh automatique si
 *                                    expiration < 60 s (POST x-www-form-urlencoded
 *                                    /api/token, grant_type=refresh_token)
 *   clearSession()                 — déconnexion complète
 *
 * DIAGNOSTIC EXCHANGE : le token endpoint renvoie, en cas d'échec HTTP, un
 * corps RFC 6749 `{ "error": "…", "error_description": "…" }`. Ces CODES
 * (invalid_client, invalid_grant…) ne sont PAS des secrets : ils sont
 * extraits puis transmis au journal [Spotify OAuth] pour localiser la panne
 * (jamais de token, jamais de corps de succès en log).
 */
import * as SecureStore from 'expo-secure-store';

import {
  getSpotifyClientId,
  SPOTIFY_DISCOVERY,
  SPOTIFY_SCOPES,
} from './authConfig';
import { spotifyLog } from './devLog';

const SESSION_KEY = 'melodix.spotify.session.v1';

/** Marge de sécurité avant expiration réelle du token d'accès. */
const REFRESH_MARGIN_MS = 60_000;
/** Durée par défaut d'un token frais (60 min en pratique chez Spotify). */
const DEFAULT_TTL_SECONDS = 3600;

const isExpired = (session: SpotifySession): boolean =>
  Date.now() >= session.expiresAtMs - REFRESH_MARGIN_MS;

export type SpotifySession = {
  accessToken: string;
  refreshToken: string | null;
  /** Horodatage d'expiration (ms epoch). */
  expiresAtMs: number;
  scope: string;
};

type TokenEndpointResponse = Partial<{
  access_token: string;
  refresh_token: string;
  expires_in: number;
  scope: string;
  token_type: string;
}>;

/**
 * Parcours d'échec de l'échange code→tokens, classifiés pour l'UI.
 * - 'refused'   : réponse HTTP non-2xx du token endpoint (cause = code OAuth
 *                 court : invalid_client → dashboard/client, invalid_grant →
 *                 code expiré/déjà utilisé/redirect différent…) ;
 * - 'network'   : Spotify injoignable (avion, DNS, coupure) ou erreur 5xx ;
 * - 'invalid-response' : corps illisible ou sans access_token ;
 * - 'save-failed' : session obtenue mais Keystore indisponible.
 */
export type TokenExchangeOutcome =
  | { kind: 'ok'; session: SpotifySession }
  | { kind: 'refused'; status: number; errorCode: string }
  | { kind: 'network' }
  | { kind: 'invalid-response' }
  | { kind: 'save-failed' };

/**
 * Outcomes complets du login (hook → écran). Chaque KIND de la taxonomie
 * correspond à UNE cause visible pour l'utilisateur (cf. LoginScreen).
 */
export type LoginOutcome =
  | { kind: 'ok'; session: SpotifySession }
  | { kind: 'cancelled' } // l'utilisateur a fermé/annulé chez Spotify
  | { kind: 'not-configured' } // Client ID absent du build
  | { kind: 'oauth-refused' } // Spotify a refusé (authorize error OU token 4xx)
  | { kind: 'callback-failed' } // code absent / state / verifier manquant
  | { kind: 'network' } // Spotify injoignable
  | { kind: 'unknown' }; // échec autre (réponse illisible, /me, sauvegarde…)

/** Whitelist RFC 6749 des codes d'erreur NON sensibles loguables. */
const TOKEN_ERROR_WHITELIST = new Set([
  'invalid_client',
  'invalid_grant',
  'invalid_request',
  'unauthorized_client',
  'unsupported_grant_type',
  'invalid_scope',
  'temporarily_unavailable',
]);

/** Codes d'erreur d'authorize (partagé avec useSpotifyAuth). */
export const sanitizeOAuthErrorCode = (code: unknown): string => {
  if (typeof code !== 'string') {
    return 'unknown';
  }
  const trimmed = code.trim();
  return TOKEN_ERROR_WHITELIST.has(trimmed) || trimmed === 'access_denied'
    ? trimmed
    : 'unlisted'; // cause non whitelistée : présence signalée, valeur masquée
};

type TokenCallResult =
  | { ok: true; payload: TokenEndpointResponse }
  | { ok: false; reason: 'network' }
  | { ok: false; reason: 'refused'; status: number; errorCode: string };

/**
 * POST /api/token. Codes d'erreur parseés UNIQUEMENT sur la branche d'échec
 * (RFC 6749 : error/error_description) — le corps de SUCCÈS, qui contient les
 * tokens, n'est jamais lu ici à des fins de log.
 */
const requestToken = async (
  body: Record<string, string>,
  logStep: string
): Promise<TokenCallResult> => {
  let response: Response;
  try {
    response = await fetch(SPOTIFY_DISCOVERY.tokenEndpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams(body).toString(),
    });
  } catch (error) {
    console.warn('Spotify token endpoint unreachable', error);
    spotifyLog(logStep, { status: 'unreachable' });
    return { ok: false, reason: 'network' };
  }

  if (!response.ok) {
    let errorCode = 'unknown';
    try {
      // Branche d'échec UNIQUEMENT : RFC 6749 — error + error_description.
      const errBody = (await response.json()) as {
        error?: unknown;
        error_description?: unknown;
      };
      const code =
        typeof errBody.error === 'string'
          ? errBody.error
          : response.status >= 500
            ? 'temporarily_unavailable'
            : `http_${response.status}`;
      errorCode = TOKEN_ERROR_WHITELIST.has(code) ? code : 'unlisted';
    } catch {
      errorCode = `http_${response.status}`;
    }

    console.warn('Spotify token endpoint refused the request', response.status, errorCode);
    spotifyLog(logStep, {
      status: response.status,
      errorCode,
      endpoint: '/api/token',
    });
    return { ok: false, reason: 'refused', status: response.status, errorCode };
  }

  try {
    return { ok: true, payload: (await response.json()) as TokenEndpointResponse };
  } catch {
    spotifyLog(logStep, { status: 'invalid-json' });
    return { ok: false, reason: 'network' };
  }
};

/** Session décodée depuis le token endpoint, sans aucune valeur sensible loguée. */
const sessionFromTokenResponse = (
  payload: TokenEndpointResponse,
  previousRefreshToken: string | null
): SpotifySession | null => {
  if (!payload.access_token) {
    return null;
  }

  return {
    accessToken: payload.access_token,
    // Spotify ne renvoie pas systématiquement de nouveau refresh token :
    // l'ancien est conservé dans ce cas.
    refreshToken: payload.refresh_token ?? previousRefreshToken,
    expiresAtMs:
      Date.now() +
      1000 *
        (typeof payload.expires_in === 'number' && payload.expires_in > 0
          ? payload.expires_in
          : DEFAULT_TTL_SECONDS),
    scope: payload.scope ?? SPOTIFY_SCOPES.join(' '),
  };
};

export const saveSession = async (session: SpotifySession): Promise<void> => {
  await SecureStore.setItemAsync(SESSION_KEY, JSON.stringify(session));
  sessionActiveCache = null; // force la relecture du statut
};

export const loadSession = async (): Promise<SpotifySession | null> => {
  try {
    const raw = await SecureStore.getItemAsync(SESSION_KEY);
    if (!raw) {
      return null;
    }
    const parsed = JSON.parse(raw) as Partial<SpotifySession>;
    if (!parsed.accessToken || typeof parsed.expiresAtMs !== 'number') {
      return null;
    }
    return {
      accessToken: parsed.accessToken,
      refreshToken: parsed.refreshToken ?? null,
      expiresAtMs: parsed.expiresAtMs,
      scope: parsed.scope ?? '',
    };
  } catch {
    return null;
  }
};

export const clearSession = async (): Promise<void> => {
  try {
    await SecureStore.deleteItemAsync(SESSION_KEY);
  } catch {
    // Aucune donnée à retirer : rien à signaler.
  }
  sessionActiveCache = null;
};

/**
 * Invalide UNIQUEMENT le token d'accès (le refresh token est conservé) :
 * à la prochaine lecture, un refresh sera tenté. Utilisé après un 401.
 */
/**
 * Vrai si une session est stockée. Résultat mis en cache 5 s : les écrans
 * composent des appels rapprochés sans relire le Keystore en boucle.
 */
let sessionActiveCache: { value: boolean; checkedAt: number } | null = null;

export const isSpotifySessionActive = async (): Promise<boolean> => {
  const now = Date.now();
  if (sessionActiveCache && now - sessionActiveCache.checkedAt < 5000) {
    return sessionActiveCache.value;
  }
  const active = !!(await loadSession());
  sessionActiveCache = { value: active, checkedAt: now };
  return active;
};

export const clearSessionAccessOnly = async (): Promise<void> => {
  try {
    const session = await loadSession();
    if (session) {
      await saveSession({ ...session, expiresAtMs: 0 });
    }
  } catch {
    // Rien à signaler : absence de session gérée à la prochaine lecture.
  }
};

let pendingRefresh: Promise<string | null> | null = null;

const doRefresh = async (session: SpotifySession): Promise<string | null> => {
  if (!session.refreshToken) {
    spotifyLog('token.refresh.impossible', { hasRefreshToken: false });
    return null;
  }

  spotifyLog('token.refresh.start');
  const call = await requestToken(
    {
      grant_type: 'refresh_token',
      refresh_token: session.refreshToken,
      client_id: getSpotifyClientId(),
    },
    'token.refresh.refused'
  );

  if (!call.ok) {
    spotifyLog('token.refresh.failed', {
      cause: call.reason === 'refused' ? call.errorCode : call.reason,
    });
    return null;
  }

  const refreshed = sessionFromTokenResponse(call.payload, session.refreshToken);
  if (!refreshed) {
    return null;
  }

  spotifyLog('token.refresh.ok', {
    expiresInSeconds: Math.round((refreshed.expiresAtMs - Date.now()) / 1000),
  });
  await saveSession(refreshed);
  return refreshed.accessToken;
};

/**
 * Token d'accès prêt à l'emploi.
 * RAE : plusieurs appels concurrents partagent UNE seule requête de refresh
 * (anti-double-refresh, hérité du design historique de l'app).
 */
export const getValidAccessToken = async (): Promise<string | null> => {
  const session = await loadSession();
  if (!session) {
    return null;
  }

  if (!isExpired(session)) {
    return session.accessToken;
  }

  if (!pendingRefresh) {
    pendingRefresh = doRefresh(session).finally(() => {
      pendingRefresh = null;
    });
  }

  return pendingRefresh;
};

/** Renvoie la session lisible pour l'UI (scopes, expiration) sans token. */
export const describeSession = async (): Promise<{
  connected: boolean;
  expiresInSeconds: number;
  canRefresh: boolean;
} | null> => {
  const session = await loadSession();
  if (!session) {
    return null;
  }
  return {
    connected: true,
    expiresInSeconds: Math.max(0, Math.round((session.expiresAtMs - Date.now()) / 1000)),
    canRefresh: !!session.refreshToken,
  };
};

/**
 * Échange du code d'autorisation (Authorization Code + PKCE, client public :
 * AUCUN client_secret n'est transmis). Résultat CLASSIFIÉ pour l'écran :
 * chaque cause distincte a un message utilisateur dédié.
 */
export const redeemAuthorizationCode = async ({
  code,
  codeVerifier,
  redirectUri,
}: {
  code: string;
  codeVerifier: string;
  redirectUri: string;
}): Promise<TokenExchangeOutcome> => {
  spotifyLog('exchange.request', {
    redirectUri,
    clientIdPresent: getSpotifyClientId() !== '',
    verifierPresent: codeVerifier.length > 0,
    codePresent: code.length > 0,
  });

  const call = await requestToken(
    {
      grant_type: 'authorization_code',
      code,
      redirect_uri: redirectUri,
      client_id: getSpotifyClientId(),
      code_verifier: codeVerifier,
    },
    'exchange.refused'
  );

  if (!call.ok) {
    if (call.reason === 'refused') {
      return {
        kind: 'refused',
        status: call.status,
        errorCode: call.errorCode,
      };
    }
    return { kind: 'network' };
  }

  const session = sessionFromTokenResponse(call.payload, null);
  if (!session) {
    spotifyLog('exchange.invalid-response');
    return { kind: 'invalid-response' };
  }

  try {
    await saveSession(session);
  } catch (error) {
    console.warn('Spotify session persistence failed', error);
    spotifyLog('exchange.save-failed');
    return { kind: 'save-failed' };
  }

  spotifyLog('exchange.ok', {
    expiresInSeconds: Math.round((session.expiresAtMs - Date.now()) / 1000),
    hasRefreshToken: session.refreshToken !== null,
    scopesCount: session.scope.split(' ').filter(Boolean).length,
  });
  return { kind: 'ok', session };
};
