import AsyncStorage from '@react-native-async-storage/async-storage';
import Constants from 'expo-constants';

const CLIENT_ID_STORAGE_KEY = 'melodix.spotify-client-id';

/**
 * Client ID provided at build time (SPOTIFY_CLIENT_ID), or an empty string.
 */
export const getBuildClientId = (): string => {
  const clientID = Constants.expoConfig?.extra?.clientID;

  return typeof clientID === 'string' ? clientID.trim() : '';
};

/**
 * Client ID to use: the build-time one first, otherwise the one entered in the app.
 */
export const getClientId = async (): Promise<string> => {
  const buildClientId = getBuildClientId();

  if (buildClientId) {
    return buildClientId;
  }

  try {
    return ((await AsyncStorage.getItem(CLIENT_ID_STORAGE_KEY)) || '').trim();
  } catch (error) {
    console.error('Failed to read the stored Spotify Client ID:', error);
    return '';
  }
};

export const saveClientId = async (clientId: string) => {
  await AsyncStorage.setItem(CLIENT_ID_STORAGE_KEY, clientId.trim());
};

export const removeClientId = async () => {
  await AsyncStorage.removeItem(CLIENT_ID_STORAGE_KEY);
};

/**
 * A Spotify Client ID is a 32-character hexadecimal string.
 */
export const isValidClientId = (value: string) =>
  /^[0-9a-f]{32}$/i.test(value.trim());
