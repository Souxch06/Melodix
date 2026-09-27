import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  getStorageKeys,
  resetSessionEnd,
  SESSION_MODE_KEY,
  SessionMode,
} from './getSessionToken';

export const setSessionToken = async (
  token: string,
  refreshToken: string | undefined,
  expiresIn: string | number,
  mode: SessionMode = refreshToken ? 'oauth' : 'token'
) => {
  const keys = getStorageKeys();

  if (!keys) {
    return null;
  }

  const { tokenKey, refreshTokenKey, expirationKey } = keys;
  const lifetimeInSeconds = Number(expiresIn) || 3600;
  const expirationTime = Date.now() + lifetimeInSeconds * 1000;

  await AsyncStorage.setItem(tokenKey, token);
  await AsyncStorage.setItem(expirationKey, expirationTime.toString());
  await AsyncStorage.setItem(SESSION_MODE_KEY, mode);

  if (refreshToken) {
    await AsyncStorage.setItem(refreshTokenKey, refreshToken);
  } else {
    // A pasted token must never be "refreshed" with an older session.
    await AsyncStorage.removeItem(refreshTokenKey);
  }

  resetSessionEnd();
};
