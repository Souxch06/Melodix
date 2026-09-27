import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Constants from 'expo-constants';

import { getClientId } from './clientId';

type TokenResponse = {
  access_token?: string;
  refresh_token?: string;
  expires_in?: number;
};

type StorageKeys = {
  tokenKey: string;
  refreshTokenKey: string;
  expirationKey: string;
};

/**
 * How the current session was opened:
 * - `token`: access token pasted by the user (the one shown in the code
 *   tutorial of developer.spotify.com). It cannot be refreshed and Spotify
 *   makes it expire after one hour.
 * - `oauth`: "Sign in with Spotify" with a Client ID (Authorization Code +
 *   PKCE). The access token is refreshed automatically.
 */
export type SessionMode = 'token' | 'oauth';

export type StoredSession = {
  token: string;
  expiresAt: number;
  canRefresh: boolean;
  mode: SessionMode;
};

export const SESSION_MODE_KEY = 'melodix.session-mode';

export const getStorageKeys = (): StorageKeys | null => {
  const extra = Constants.expoConfig?.extra;

  if (!extra?.tokenKey || !extra?.refreshTokenKey || !extra?.expirationKey) {
    return null;
  }

  return {
    tokenKey: extra.tokenKey,
    refreshTokenKey: extra.refreshTokenKey,
    expirationKey: extra.expirationKey,
  };
};

export const toFormBody = (params: Record<string, string>) =>
  Object.entries(params)
    .map(
      ([key, value]) =>
        `${encodeURIComponent(key)}=${encodeURIComponent(value)}`
    )
    .join('&');

// Why the last session ended, shown once on the login screen.
let sessionEnd: { mode: SessionMode } | null = null;

export const consumeSessionEnd = () => {
  const value = sessionEnd;
  sessionEnd = null;
  return value;
};

export const resetSessionEnd = () => {
  sessionEnd = null;
};

const toSessionMode = (
  storedMode: string | null,
  refreshToken: string | null
): SessionMode => (storedMode === 'oauth' || refreshToken ? 'oauth' : 'token');

export const clearSessionToken = async () => {
  const keys = getStorageKeys();

  if (!keys) {
    return;
  }

  await AsyncStorage.multiRemove([
    keys.tokenKey,
    keys.expirationKey,
    keys.refreshTokenKey,
    SESSION_MODE_KEY,
  ]);
};

/**
 * Ends an expired session: the stored tokens are removed and the login screen
 * will explain why the user has to sign in again.
 */
export const endSession = async (mode?: SessionMode) => {
  const keys = getStorageKeys();

  if (!keys) {
    return;
  }

  const [token, refreshToken, storedMode] = await Promise.all([
    AsyncStorage.getItem(keys.tokenKey),
    AsyncStorage.getItem(keys.refreshTokenKey),
    AsyncStorage.getItem(SESSION_MODE_KEY),
  ]);

  // Already ended elsewhere (several requests can fail at the same time).
  if (!token && !refreshToken) {
    return;
  }

  await clearSessionToken();
  sessionEnd = { mode: mode ?? toSessionMode(storedMode, refreshToken) };
};

/**
 * Current session as stored on the device, without refreshing it.
 */
export const getStoredSession = async (): Promise<StoredSession | null> => {
  const keys = getStorageKeys();

  if (!keys) {
    return null;
  }

  const [token, expiration, refreshToken, storedMode] = await Promise.all([
    AsyncStorage.getItem(keys.tokenKey),
    AsyncStorage.getItem(keys.expirationKey),
    AsyncStorage.getItem(keys.refreshTokenKey),
    AsyncStorage.getItem(SESSION_MODE_KEY),
  ]);

  if (!token) {
    return null;
  }

  return {
    token,
    expiresAt: Number(expiration) || 0,
    canRefresh: !!refreshToken,
    mode: toSessionMode(storedMode, refreshToken),
  };
};

/**
 * Forces the next getSessionToken() call to refresh the access token.
 */
export const markAccessTokenExpired = async () => {
  const keys = getStorageKeys();

  if (keys) {
    await AsyncStorage.setItem(keys.expirationKey, '0');
  }
};

// Authorization Code + PKCE: Melodix is a public client, so a refresh only
// needs the client ID (no client secret is shipped in the app).
const refreshAccessToken = async (
  refreshToken: string
): Promise<{ data: TokenResponse | null; revoked: boolean }> => {
  const tokenEndpoint = Constants.expoConfig?.extra?.tokenEndpoint;
  const clientId = await getClientId();

  if (!tokenEndpoint || !clientId) {
    return { data: null, revoked: false };
  }

  try {
    const response = await axios.post<TokenResponse>(
      tokenEndpoint,
      toFormBody({
        grant_type: 'refresh_token',
        refresh_token: refreshToken,
        client_id: clientId,
      }),
      { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
    );

    return { data: response.data, revoked: false };
  } catch (error) {
    console.error('Error refreshing access token:', error);

    // 400 invalid_grant: the refresh token was revoked or reached the end of
    // its 6-month lifetime (Spotify, June 2026). The user must sign in again.
    const status = (error as { response?: { status?: number } })?.response
      ?.status;

    return { data: null, revoked: status === 400 };
  }
};

const refreshSession = async (
  keys: StorageKeys,
  refreshToken: string
): Promise<string | null> => {
  const { data, revoked } = await refreshAccessToken(refreshToken);

  if (!data?.access_token) {
    if (revoked) {
      await endSession('oauth');
    }

    return null;
  }

  const expirationTime = Date.now() + (data.expires_in ?? 3600) * 1000;

  await AsyncStorage.setItem(keys.tokenKey, data.access_token);
  await AsyncStorage.setItem(keys.expirationKey, expirationTime.toString());

  // Spotify may rotate the refresh token.
  if (data.refresh_token) {
    await AsyncStorage.setItem(keys.refreshTokenKey, data.refresh_token);
  }

  return data.access_token;
};

// Every screen asks for the token at the same time: share a single refresh
// request, a rotated refresh token can only be used once.
let pendingRefresh: Promise<string | null> | null = null;

export const getSessionToken = async (): Promise<string | null> => {
  const keys = getStorageKeys();

  if (!keys) {
    return null;
  }

  const { tokenKey, refreshTokenKey, expirationKey } = keys;
  const [storedToken, expirationTime, refreshToken] = await Promise.all([
    AsyncStorage.getItem(tokenKey),
    AsyncStorage.getItem(expirationKey),
    AsyncStorage.getItem(refreshTokenKey),
  ]);

  if (storedToken && expirationTime && Date.now() < Number(expirationTime)) {
    return storedToken;
  }

  if (!refreshToken) {
    // A pasted token cannot be refreshed: once expired, the session is over.
    if (storedToken) {
      await endSession('token');
    } else {
      await clearSessionToken();
    }

    return null;
  }

  if (!pendingRefresh) {
    pendingRefresh = refreshSession(keys, refreshToken).finally(() => {
      pendingRefresh = null;
    });
  }

  return pendingRefresh;
};
