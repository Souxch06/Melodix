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
 * Tous les appels externes échouent proprement (retour null) : une session
 * corrompue ou un refresh refusé se traduit par « non connecté ».
 */
import * as SecureStore from 'expo-secure-store';

import {
  getSpotifyClientId,
  SPOTIFY_DISCOVERY,
  SPOTIFY_SCOPES,
} from './authConfig';

const SESSION_KEY = 'melodix.spotify.session.v1';

/** Marge de sécurité avant expiration réelle du token d'accès. */
const REFRESH_MARGIN_MS = 60_000;
/** Durée par défaut d'un token frais (60 min en pratique chez Spotify). */
const DEFAULT_TTL_SECONDS = 3600;

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

/** Parcours d'erreurs propres (pas d'exception nue vers l'UI). */
export type LoginOutcome =
  | { kind: 'ok'; session: SpotifySession }
  | { kind: 'cancelled' }
  | { kind: 'unavailable' }
  | { kind: 'not-configured' };

const isExpired = (session: SpotifySession): boolean =>
  Date.now() >= session.expiresAtMs - REFRESH_MARGIN_MS;

const requestToken = async (
  body: Record<string, string>
): Promise<TokenEndpointResponse | null> => {
  try {
    const response = await fetch(SPOTIFY_DISCOVERY.tokenEndpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams(body).toString(),
    });

    if (!response.ok) {
      // JAMAIS de copie du corps : il peut contenir des traces sensibles.
      console.warn('Spotify token endpoint refused the request', response.status);
      return null;
    }

    return (await response.json()) as TokenEndpointResponse;
  } catch (error) {
    console.warn('Spotify token endpoint unreachable', error);
    return null;
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
    return null;
  }

  const payload = await requestToken({
    grant_type: 'refresh_token',
    refresh_token: session.refreshToken,
    client_id: getSpotifyClientId(),
  });

  if (!payload) {
    return null;
  }

  const refreshed = sessionFromTokenResponse(payload, session.refreshToken);
  if (!refreshed) {
    return null;
  }

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
 * AUCUN client_secret n'est transmis). Utilisé par l'écran de connexion.
 */
export const redeemAuthorizationCode = async ({
  code,
  codeVerifier,
  redirectUri,
}: {
  code: string;
  codeVerifier: string;
  redirectUri: string;
}): Promise<SpotifySession | null> => {
  const payload = await requestToken({
    grant_type: 'authorization_code',
    code,
    redirect_uri: redirectUri,
    client_id: getSpotifyClientId(),
    code_verifier: codeVerifier,
  });

  if (!payload) {
    return null;
  }

  const session = sessionFromTokenResponse(payload, null);
  if (session) {
    await saveSession(session);
  }
  return session;
};
