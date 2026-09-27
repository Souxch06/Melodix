import axios from 'axios';

import { BASE_URL } from './constants';
import {
  endSession,
  getSessionToken,
  getStoredSession,
  markAccessTokenExpired,
} from './getSessionToken';

type FailedRequest = {
  response?: { status?: number };
  config?: { url?: string; headers?: unknown };
};

const readBearerToken = (headers: unknown): string => {
  const source = headers as
    | {
        get?: (name: string) => unknown;
        Authorization?: unknown;
        authorization?: unknown;
      }
    | undefined;

  const value =
    typeof source?.get === 'function'
      ? source.get('Authorization')
      : (source?.Authorization ?? source?.authorization);
  const token = String(value ?? '')
    .replace(/^Bearer\s+/i, '')
    .trim();

  return token && token !== 'null' && token !== 'undefined' ? token : '';
};

// Spotify also answers 401 "Permissions missing" when a token lacks a scope:
// only a token refused by GET /me really means that the session is over.
const isTokenRefused = async (token: string) => {
  try {
    const response = await fetch(`${BASE_URL}/me`, {
      headers: { Authorization: `Bearer ${token}` },
    });

    return response.status === 401;
  } catch {
    // Offline: nothing proves that the token expired.
    return false;
  }
};

let pendingCheck: Promise<void> | null = null;

const checkSession = async (token: string, onSessionExpired: () => void) => {
  const session = await getStoredSession();

  // Request sent with an older token, or the user already signed out.
  if (!session || session.token !== token) {
    return;
  }

  if (!(await isTokenRefused(token))) {
    return;
  }

  if (session.canRefresh) {
    await markAccessTokenExpired();

    if (await getSessionToken()) {
      return;
    }
  }

  await endSession(session.mode);
  onSessionExpired();
};

/**
 * Handles a failed Spotify request: when the stored token is refused (a
 * pasted token lasts one hour), the session is closed and `onSessionExpired`
 * is called once so the app can go back to the login screen.
 */
export const handleUnauthorizedResponse = async (
  error: FailedRequest,
  onSessionExpired: () => void
) => {
  const url = String(error?.config?.url ?? '');

  if (error?.response?.status !== 401 || !url.startsWith(BASE_URL)) {
    return;
  }

  const token = readBearerToken(error.config?.headers);

  if (!token) {
    return;
  }

  if (!pendingCheck) {
    pendingCheck = checkSession(token, onSessionExpired)
      .catch((checkError) => {
        console.error('Error checking the Spotify session:', checkError);
      })
      .finally(() => {
        pendingCheck = null;
      });
  }

  await pendingCheck;
};

export const installSessionGuard = (onSessionExpired: () => void) => {
  const interceptorId = axios.interceptors.response.use(
    undefined,
    async (error) => {
      await handleUnauthorizedResponse(error, onSessionExpired);

      return Promise.reject(error);
    }
  );

  return () => axios.interceptors.response.eject(interceptorId);
};
