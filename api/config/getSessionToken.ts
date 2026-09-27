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

// Authorization Code + PKCE: Melodix is a public client, so a refresh only
// needs the client ID (no client secret is shipped in the app).
const refreshAccessToken = async (
  refreshToken: string
): Promise<TokenResponse | null> => {
  const tokenEndpoint = Constants.expoConfig?.extra?.tokenEndpoint;
  const clientId = await getClientId();

  if (!tokenEndpoint || !clientId) {
    return null;
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

    return response.data;
  } catch (error) {
    console.error('Error refreshing access token:', error);
    return null;
  }
};

export const clearSessionToken = async () => {
  const keys = getStorageKeys();

  if (!keys) {
    return;
  }

  await AsyncStorage.multiRemove([
    keys.tokenKey,
    keys.expirationKey,
    keys.refreshTokenKey,
  ]);
};

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
  const currentTime = Date.now();

  if (storedToken && expirationTime && currentTime < Number(expirationTime)) {
    return storedToken;
  }

  if (!refreshToken) {
    await clearSessionToken();
    return null;
  }

  const data = await refreshAccessToken(refreshToken);

  if (!data?.access_token) {
    return null;
  }

  const newExpirationTime = currentTime + (data.expires_in ?? 3600) * 1000;

  await AsyncStorage.setItem(tokenKey, data.access_token);
  await AsyncStorage.setItem(expirationKey, newExpirationTime.toString());

  // Spotify may rotate the refresh token.
  if (data.refresh_token) {
    await AsyncStorage.setItem(refreshTokenKey, data.refresh_token);
  }

  return data.access_token;
};
