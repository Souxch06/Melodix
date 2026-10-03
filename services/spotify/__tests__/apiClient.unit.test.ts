import Constants from 'expo-constants';
import * as SecureStore from 'expo-secure-store';

import { spotifyApiGet, SpotifyApiError } from '../apiClient';
import { saveSession } from '../session';

beforeAll(() => {
  (Constants.default ?? Constants).__setExpoConfigExtra({
    spotifyClientId: 'client-test',
  });
});

const setFetch = (impl: (url: string) => Promise<unknown>) => {
  globalThis.fetch = jest.fn(impl as never) as unknown as typeof fetch;
  return globalThis.fetch as jest.Mock;
};

const validSession = () => ({
  accessToken: 'valid-token',
  refreshToken: 'rt',
  expiresAtMs: Date.now() + 3600_000,
  scope: 'user-read-private',
});

describe('services/spotify/apiClient (API Web Spotify officielle)', () => {
  const originalFetch = globalThis.fetch;

  beforeEach(async () => {
    (
      SecureStore as unknown as { __clearSecureStoreMock: () => void }
    ).__clearSecureStoreMock();
    jest.clearAllMocks();
    jest.useRealTimers();
  });

  afterAll(() => {
    globalThis.fetch = originalFetch;
  });

  it('GET authentifié → JSON avec en-tête Bearer (sans jamais le loguer)', async () => {
    await saveSession(validSession());
    const fetchMock = setFetch(async () => ({
      status: 200,
      ok: true,
      headers: { get: () => null },
      json: async () => ({ id: 'user-1' }),
    }));

    const user = await spotifyApiGet<{ id: string }>('/me');

    expect(user.id).toBe('user-1');
    const [url, options] = fetchMock.mock.calls[0] as unknown as [
      string,
      { headers: Record<string, string> },
    ];
    expect(url).toBe('https://api.spotify.com/v1/me');
    expect(options.headers.Authorization).toBe('Bearer valid-token');
  });

  it('aucune session → kind unauthenticated (sans appel réseau)', async () => {
    const fetchMock = setFetch(async () => ({ status: 200 }));
    await expect(spotifyApiGet('/me')).rejects.toMatchObject({
      kind: 'unauthenticated',
    });
    expect(fetchMock).not.toHaveBeenCalled();
  });

  it('401 → refresh puis retry (session survie), puis donnée servie', async () => {
    await saveSession(validSession());

    let apiCalls = 0;
    globalThis.fetch = jest.fn(async (url, options) => {
      const asString = String(url);
      if (asString.includes('accounts.spotify.com')) {
        // Le refresh fournit un nouveau token.
        return {
          ok: true,
          json: async () => ({
            access_token: 'refreshed-token',
            expires_in: 3600,
          }),
        } as Response;
      }

      apiCalls += 1;
      const auth = (options as { headers?: { Authorization?: string } })
        ?.headers?.Authorization;
      if (apiCalls === 1) {
        expect(auth).toBe('Bearer valid-token');
        return {
          status: 401,
          ok: false,
          headers: { get: () => null },
        } as unknown as Response;
      }
      expect(auth).toBe('Bearer refreshed-token');
      return {
        status: 200,
        ok: true,
        headers: { get: () => null },
        json: async () => ({ id: 'user-2' }),
      } as unknown as Response;
    }) as unknown as typeof fetch;

    const user = await spotifyApiGet<{ id: string }>('/me');
    expect(user.id).toBe('user-2');
    expect(apiCalls).toBe(2);
  });

  it('un second 401 après refresh → unauthenticated, pas erreur HTTP', async () => {
    await saveSession(validSession());
    let apiCalls = 0;
    globalThis.fetch = jest.fn(async (url) => {
      if (String(url).includes('accounts.spotify.com')) {
        return {
          ok: true,
          json: async () => ({
            access_token: 'refreshed-but-rejected',
            expires_in: 3600,
          }),
        } as Response;
      }
      apiCalls += 1;
      return {
        status: 401,
        ok: false,
        headers: { get: () => null },
      } as unknown as Response;
    }) as unknown as typeof fetch;

    await expect(spotifyApiGet('/me')).rejects.toMatchObject({
      kind: 'unauthenticated',
      status: 401,
    });
    expect(apiCalls).toBe(2);
  });

  it('401 STUBBORN (refresh refusé) → unauthenticated', async () => {
    await saveSession(validSession());
    globalThis.fetch = jest.fn(async (url) => {
      if (String(url).includes('accounts.spotify.com')) {
        return { ok: false, status: 400 } as Response;
      }
      return {
        status: 401,
        ok: false,
        headers: { get: () => null },
      } as unknown as Response;
    }) as unknown as typeof fetch;

    await expect(spotifyApiGet('/me')).rejects.toMatchObject({
      kind: 'unauthenticated',
    });
  });

  it('429 → attend Retry-After puis rejoue', async () => {
    await saveSession(validSession());
    jest.useFakeTimers({ advanceTimers: true });

    let calls = 0;
    setFetch(async () => {
      calls += 1;
      if (calls === 1) {
        return {
          status: 429,
          ok: false,
          headers: {
            get: (name: string) => (name === 'Retry-After' ? '1' : null),
          },
        };
      }
      return {
        status: 200,
        ok: true,
        headers: { get: () => null },
        json: async () => ({ ok: true }),
      };
    });

    const promise = spotifyApiGet<{ ok: boolean }>('/x');
    await expect(promise).resolves.toEqual({ ok: true });
    expect(calls).toBe(2);
  });

  it('429 persistante → rate-limited', async () => {
    await saveSession(validSession());
    jest.useFakeTimers();

    setFetch(async () => ({
      status: 429,
      ok: false,
      headers: { get: () => '0' },
    }));

    const promise = spotifyApiGet('/x').catch((error) => error);
    // Chaque tentative attend ~2000 ms avant de rejouer (Retry-After: 0).
    await jest.advanceTimersByTimeAsync(10_000);

    await expect(promise).resolves.toMatchObject({
      kind: 'rate-limited',
      status: 429,
    });
    jest.useRealTimers();
  });

  it('panne réseau → kind network', async () => {
    await saveSession(validSession());
    setFetch(async () => {
      throw new TypeError('network down');
    });
    await expect(spotifyApiGet('/x')).rejects.toMatchObject({
      kind: 'network',
    });
  });

  it('5xx → kind http avec status', async () => {
    await saveSession(validSession());
    setFetch(async () => ({
      status: 502,
      ok: false,
      headers: { get: () => null },
      text: async () => 'bad gateway',
      json: async () => {
        throw new Error('html');
      },
    }));
    await expect(spotifyApiGet('/x')).rejects.toMatchObject({
      kind: 'http',
      status: 502,
    });
    await expect(spotifyApiGet('/x')).rejects.toBeInstanceOf(SpotifyApiError);
  });

  it("403 + corps d'erreur Spotify → statut ET message consignés (jamais le token)", async () => {
    await saveSession(validSession());
    setFetch(async () => ({
      status: 403,
      ok: false,
      headers: { get: () => null },
      json: async () => ({
        error: {
          status: 403,
          message:
            'Check settings on developer.spotify.com/dashboard, the user may not be registered.',
        },
      }),
    }));

    const error = await spotifyApiGet('/me').catch((caught: unknown) => caught);
    expect(error).toBeInstanceOf(SpotifyApiError);
    const apiError = error as SpotifyApiError;
    expect(apiError.kind).toBe('http');
    expect(apiError.status).toBe(403);
    expect(apiError.spotifyMessage).toContain(
      'developer.spotify.com/dashboard'
    );
    // Le message capturé ne doit JAMAIS contenir le token porteur.
    expect(apiError.spotifyMessage).not.toContain('valid-token');
  });
});
