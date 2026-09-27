import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  consumeSessionEnd,
  getSessionToken,
  getStoredSession,
} from '../getSessionToken';
import { setSessionToken } from '../setSessionToken';
import { isValidClientId } from '../clientId';

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

describe('isValidClientId', () => {
  it('accepts 32 hexadecimal characters', () => {
    expect(isValidClientId('0123456789abcdef0123456789ABCDEF')).toBe(true);
    expect(isValidClientId('  0123456789abcdef0123456789abcdef  ')).toBe(true);
  });

  it('rejects anything else', () => {
    expect(isValidClientId('')).toBe(false);
    expect(isValidClientId('0123456789abcdef')).toBe(false);
    expect(isValidClientId('0123456789abcdef0123456789abcdeg')).toBe(false);
  });
});

describe('session tokens', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    mockedPost.mockReset();
    consumeSessionEnd();
  });

  it('returns the stored token while it is still valid', async () => {
    await setSessionToken('access-token', 'refresh-1', 3600);

    await expect(getSessionToken()).resolves.toBe('access-token');
    expect(mockedPost).not.toHaveBeenCalled();
  });

  it('refreshes an expired token with the client ID only (PKCE, no secret)', async () => {
    await AsyncStorage.multiSet([
      ['token', 'expired-token'],
      ['expiration', String(Date.now() - 1000)],
      ['refresh-token', 'refresh-1'],
    ]);
    mockedPost.mockResolvedValueOnce({
      data: {
        access_token: 'new-token',
        expires_in: 3600,
        refresh_token: 'refresh-2',
      },
    });

    await expect(getSessionToken()).resolves.toBe('new-token');

    const [url, body] = mockedPost.mock.calls[0];
    expect(url).toBe('https://accounts.spotify.com/api/token');
    expect(body).toContain('grant_type=refresh_token');
    expect(body).toContain('refresh_token=refresh-1');
    expect(body).toContain('client_id=0123456789abcdef0123456789abcdef');
    expect(body).not.toContain('client_secret');
    // Spotify may rotate the refresh token: the new one must be kept.
    await expect(AsyncStorage.getItem('refresh-token')).resolves.toBe(
      'refresh-2'
    );
  });

  it('clears the session when there is no refresh token', async () => {
    await AsyncStorage.multiSet([
      ['token', 'expired-token'],
      ['expiration', String(Date.now() - 1000)],
    ]);

    await expect(getSessionToken()).resolves.toBeNull();
    await expect(AsyncStorage.getItem('token')).resolves.toBeNull();
  });

  it('shares a single refresh request between simultaneous callers', async () => {
    await AsyncStorage.multiSet([
      ['token', 'expired-token'],
      ['expiration', String(Date.now() - 1000)],
      ['refresh-token', 'refresh-1'],
    ]);
    mockedPost.mockResolvedValue({
      data: { access_token: 'new-token', expires_in: 3600 },
    });

    const tokens = await Promise.all([
      getSessionToken(),
      getSessionToken(),
      getSessionToken(),
    ]);

    expect(tokens).toEqual(['new-token', 'new-token', 'new-token']);
    expect(mockedPost).toHaveBeenCalledTimes(1);
  });

  it('ends the session when Spotify revokes the refresh token (invalid_grant)', async () => {
    await AsyncStorage.multiSet([
      ['token', 'expired-token'],
      ['expiration', String(Date.now() - 1000)],
      ['refresh-token', 'old-refresh-token'],
      ['melodix.session-mode', 'oauth'],
    ]);
    mockedPost.mockRejectedValueOnce({
      response: { status: 400, data: { error: 'invalid_grant' } },
    });

    await expect(getSessionToken()).resolves.toBeNull();
    await expect(AsyncStorage.getItem('refresh-token')).resolves.toBeNull();
    expect(consumeSessionEnd()).toEqual({ mode: 'oauth' });
  });

  it('keeps the session when the refresh fails because of the network', async () => {
    await AsyncStorage.multiSet([
      ['token', 'expired-token'],
      ['expiration', String(Date.now() - 1000)],
      ['refresh-token', 'refresh-1'],
    ]);
    mockedPost.mockRejectedValueOnce(new Error('Network Error'));

    await expect(getSessionToken()).resolves.toBeNull();
    await expect(AsyncStorage.getItem('refresh-token')).resolves.toBe(
      'refresh-1'
    );
    expect(consumeSessionEnd()).toBeNull();
  });
});

describe('pasted token sessions', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    mockedPost.mockReset();
    consumeSessionEnd();
  });

  it('stores a pasted token for one hour, without refresh token', async () => {
    // Leftover of an older "Sign in with Spotify" session.
    await AsyncStorage.setItem('refresh-token', 'stale-refresh-token');

    await setSessionToken('pasted-token', undefined, 3600, 'token');

    await expect(getSessionToken()).resolves.toBe('pasted-token');
    await expect(AsyncStorage.getItem('refresh-token')).resolves.toBeNull();

    const session = await getStoredSession();
    expect(session).toMatchObject({
      token: 'pasted-token',
      canRefresh: false,
      mode: 'token',
    });
    expect(session!.expiresAt).toBeGreaterThan(Date.now() + 3590 * 1000);
    expect(session!.expiresAt).toBeLessThanOrEqual(Date.now() + 3600 * 1000);
  });

  it('ends the session once the pasted token has expired', async () => {
    await setSessionToken('pasted-token', undefined, 3600, 'token');
    await AsyncStorage.setItem('expiration', String(Date.now() - 1));

    await expect(getSessionToken()).resolves.toBeNull();
    expect(mockedPost).not.toHaveBeenCalled();
    await expect(getStoredSession()).resolves.toBeNull();
    // The login screen explains that the token expired…
    expect(consumeSessionEnd()).toEqual({ mode: 'token' });
    // …only once.
    expect(consumeSessionEnd()).toBeNull();
  });

  it('does not report an expiry when nobody was signed in', async () => {
    await expect(getSessionToken()).resolves.toBeNull();
    expect(consumeSessionEnd()).toBeNull();
  });
});
