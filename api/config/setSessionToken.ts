import AsyncStorage from '@react-native-async-storage/async-storage';

import { getStorageKeys } from './getSessionToken';

export const setSessionToken = async (
  token: string,
  refreshToken: string | undefined,
  expiresIn: string | number
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

  if (refreshToken) {
    await AsyncStorage.setItem(refreshTokenKey, refreshToken);
  }
};
