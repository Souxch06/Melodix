import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';

import { consumeSessionEnd, getStoredSession } from '../getSessionToken';
import { setSessionToken } from '../setSessionToken';
import { handleUnauthorizedResponse } from '../sessionGuard';

jest.mock('axios');
jest.mock('@react-native-async-storage/async-storage', () =>
  require('@react-native-async-storage/async-storage/jest/async-storage-mock')
);
jest.mock('expo-constants', () => ({
  expoConfig: {
    extra: {
      clientID: '0123456789abcdef0123456789abcdef',
      tokenKey: 'token',
      refreshTokenKey: 'refresh-token',
      expirationKey: 'expiration',
      tokenEndpoint: 'https://accounts.spotify.com/api/token',
    },
  },
}));

const mockedPost = axios.post as jest.Mock;
const mockedFetch = jest.fn();
const originalFetch = global.fetch;

const unauthorized = (
  token: string,
  url = 'https://api.spotify.com/v1/me/top/artists'
) => ({
  response: { status: 401 },
  config: { url, headers: { Authorization: `Bearer ${token}` } },
});

describe('session guard', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    consumeSessionEnd();
    mockedPost.mockReset();
    mockedFetch.mockReset();
    global.fetch = mockedFetch as unknown as typeof fetch;
  });

  afterAll(() => {
    global.fetch = originalFetch;
  });

  it('signs out once when Spotify refuses the pasted token', async () => {
    await setSessionToken('pasted-token', undefined, 3600, 'token');
    mockedFetch.mockResolvedValue({ status: 401 });
    const onExpired = jest.fn();

    // Every section of the home screen fails at the same time.
    await Promise.all([
      handleUnauthorizedResponse(unauthorized('pasted-token'), onExpired),
      handleUnauthorizedResponse(unauthorized('pasted-token'), onExpired),
      handleUnauthorizedResponse(unauthorized('pasted-token'), onExpired),
    ]);

    expect(onExpired).toHaveBeenCalledTimes(1);
    expect(mockedFetch).toHaveBeenCalledTimes(1);
    await expect(getStoredSession()).resolves.toBeNull();
    expect(consumeSessionEnd()).toEqual({ mode: 'token' });
  });

  it('keeps the session on "Permissions missing" (token still valid)', async () => {
    await setSessionToken('pasted-token', undefined, 3600, 'token');
    mockedFetch.mockResolvedValue({ status: 200 });
    const onExpired = jest.fn();

    await handleUnauthorizedResponse(unauthorized('pasted-token'), onExpired);

    expect(onExpired).not.toHaveBeenCalled();
    await expect(getStoredSession()).resolves.toMatchObject({
      token: 'pasted-token',
    });
  });

  it('keeps the session when offline', async () => {
    await setSessionToken('pasted-token', undefined, 3600, 'token');
    mockedFetch.mockRejectedValue(new TypeError('Network request failed'));
    const onExpired = jest.fn();

    await handleUnauthorizedResponse(unauthorized('pasted-token'), onExpired);

    expect(onExpired).not.toHaveBeenCalled();
    await expect(getStoredSession()).resolves.not.toBeNull();
  });

  it('ignores requests sent with an older token or to other services', async () => {
    await setSessionToken('current-token', undefined, 3600, 'token');
    const onExpired = jest.fn();

    await handleUnauthorizedResponse(unauthorized('old-token'), onExpired);
    await handleUnauthorizedResponse(
      unauthorized('current-token', 'https://accounts.spotify.com/api/token'),
      onExpired
    );
    await handleUnauthorizedResponse(
      {
        response: { status: 403 },
        config: unauthorized('current-token').config,
      },
      onExpired
    );

    expect(mockedFetch).not.toHaveBeenCalled();
    expect(onExpired).not.toHaveBeenCalled();
  });

  it('refreshes a "Sign in with Spotify" session instead of signing out', async () => {
    await setSessionToken('oauth-token', 'refresh-1', 3600, 'oauth');
    mockedFetch.mockResolvedValue({ status: 401 });
    mockedPost.mockResolvedValueOnce({
      data: { access_token: 'refreshed-token', expires_in: 3600 },
    });
    const onExpired = jest.fn();

    await handleUnauthorizedResponse(unauthorized('oauth-token'), onExpired);

    expect(onExpired).not.toHaveBeenCalled();
    await expect(getStoredSession()).resolves.toMatchObject({
      token: 'refreshed-token',
      mode: 'oauth',
    });
  });
});
