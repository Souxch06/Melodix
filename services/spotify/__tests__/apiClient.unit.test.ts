import Constants from 'expo-constants';
import * as SecureStore from 'expo-secure-store';

import { spotifyApiGet, SpotifyApiError } from '../apiClient';
import { loadSession, saveSession } from '../session';

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

  it('un second 401 après refresh RÉUSSI → http 401 retryable, session CONSERVÉE', async () => {
    // Le refresh token vient d'être VALIDÉ par Spotify (il vient de délivrer
    // un token) : forcer une reconnexion ('unauthenticated') serait une
    // perte inutile. L'erreur est retryable (« Réessayer » rafraîchira de
    // nouveau) et la session reste stockée. Pas de boucle : 1 refresh +
    // 1 retry par appel.
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
      kind: 'http',
      status: 401,
    });
    expect(apiCalls).toBe(2);
    expect(await loadSession()).not.toBeNull();
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

  describe('classification du refresh sur 401 (retryable vs reconnexion)', () => {
    const expiredSession = () => ({
      accessToken: 'stale-token',
      refreshToken: 'rt-stale',
      expiresAtMs: Date.now() - 3600_000,
      scope: 'user-read-private',
    });

    it('401 + refresh REFUSÉ (invalid_grant) → unauthenticated + détail SÛR, jamais de token', async () => {
      await saveSession(expiredSession());
      globalThis.fetch = jest.fn(async (url) => {
        if (String(url).includes('accounts.spotify.com')) {
          return {
            ok: false,
            status: 400,
            json: async () => ({
              error: 'invalid_grant',
              error_description: 'Invalid refresh token',
            }),
          } as Response;
        }
        return {
          status: 401,
          ok: false,
          headers: { get: () => null },
        } as unknown as Response;
      }) as unknown as typeof fetch;

      let error: unknown;
      try {
        await spotifyApiGet('/me');
      } catch (e) {
        error = e;
      }
      expect(error).toMatchObject({
        kind: 'unauthenticated',
        status: 400,
      });
      // Le détail technique est sûr : code whitelisté + statut — et JAMAIS
      // les tokens (ni celui de la session, ni un hypothétique neuf), ni
      // l'en-tête Authorization.
      const serialized = JSON.stringify(error);
      expect(serialized).toContain('invalid_grant');
      expect(serialized).not.toContain('stale-token');
      expect(serialized).not.toContain('rt-stale');
      expect(serialized).not.toContain('Bearer');
    });

    it('401 + refresh TRANSITOIRE (réseau au token endpoint) → network, session CONSERVÉE', async () => {
      await saveSession(expiredSession());
      globalThis.fetch = jest.fn(async (url) => {
        if (String(url).includes('accounts.spotify.com')) {
          throw new Error('network down');
        }
        return {
          status: 401,
          ok: false,
          headers: { get: () => null },
        } as unknown as Response;
      }) as unknown as typeof fetch;

      await expect(spotifyApiGet('/me')).rejects.toMatchObject({
        kind: 'network',
      });
      // La session n'a PAS été jetée : le refresh token est probablement
      // encore bon — « Réessayer » devra retenter.
      expect(await loadSession()).not.toBeNull();
    });

    it('401 + refresh 429 → rate-limited, session CONSERVÉE', async () => {
      await saveSession(expiredSession());
      globalThis.fetch = jest.fn(async (url) => {
        if (String(url).includes('accounts.spotify.com')) {
          return {
            ok: false,
            status: 429,
            json: async () => ({ error: 'temporarily_unavailable' }),
          } as Response;
        }
        return {
          status: 401,
          ok: false,
          headers: { get: () => null },
        } as unknown as Response;
      }) as unknown as typeof fetch;

      await expect(spotifyApiGet('/me')).rejects.toMatchObject({
        kind: 'rate-limited',
        status: 429,
      });
      expect(await loadSession()).not.toBeNull();
    });

    it('401 + refresh 5xx (panne Spotify) → network (transitoire), session CONSERVÉE', async () => {
      await saveSession(expiredSession());
      globalThis.fetch = jest.fn(async (url) => {
        if (String(url).includes('accounts.spotify.com')) {
          return {
            ok: false,
            status: 503,
            json: async () => ({ error: 'temporarily_unavailable' }),
          } as Response;
        }
        return {
          status: 401,
          ok: false,
          headers: { get: () => null },
        } as unknown as Response;
      }) as unknown as typeof fetch;

      await expect(spotifyApiGet('/me')).rejects.toMatchObject({
        kind: 'network',
      });
      expect(await loadSession()).not.toBeNull();
    });
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

  it('403 → reste un 403 (kind http, status 403) : AUCUN refresh, session CONSERVÉE, message Spotify conservé', async () => {
    // Un 403 n’est JAMAIS converti en 401 et ne déclenche JAMAIS de refresh
    // (le token n’est pas en cause — ex. « User not approved for app »).
    await saveSession(validSession());
    let tokenEndpointCalls = 0;
    globalThis.fetch = jest.fn(async (url) => {
      if (String(url).includes('accounts.spotify.com')) {
        tokenEndpointCalls += 1;
        return {
          ok: true,
          json: async () => ({
            access_token: 'should-never-be-used',
            expires_in: 3600,
          }),
        } as Response;
      }
      const body = JSON.stringify({
        error: { status: 403, message: 'User not approved for app' },
      });
      return {
        status: 403,
        ok: false,
        headers: {
          get: (name: string) =>
            name === 'Content-Type' ? 'application/json' : null,
        },
        text: async () => body,
      } as unknown as Response;
    }) as unknown as typeof fetch;

    const error = await spotifyApiGet('/me').catch((caught: unknown) => caught);
    expect(error).toBeInstanceOf(SpotifyApiError);
    expect(error).toMatchObject({ kind: 'http', status: 403 });
    expect((error as SpotifyApiError).spotifyMessage).toBe(
      'User not approved for app'
    );
    // Aucun appel au token endpoint (pas de refresh déclenché).
    expect(tokenEndpointCalls).toBe(0);
    // La session n’est PAS purgée : « Réessayer » doit pouvoir retenter.
    expect(await loadSession()).not.toBeNull();
    // Aucune valeur sensible dans l’erreur exposée.
    const serialized = JSON.stringify(error);
    expect(serialized).not.toContain('valid-token');
    expect(serialized).not.toContain('"rt"');
    expect(serialized).not.toContain('should-never-be-used');
    expect(serialized).not.toContain('Bearer');
  });

  it("403 + corps d'erreur Spotify → statut ET message consignés (jamais le token)", async () => {
    await saveSession(validSession());
    const body = JSON.stringify({
      error: {
        status: 403,
        message:
          'Check settings on developer.spotify.com/dashboard, the user may not be registered.',
      },
    });
    setFetch(async () => ({
      status: 403,
      ok: false,
      headers: {
        get: (name: string) =>
          name === 'Content-Type' ? 'application/json' : null,
      },
      text: async () => body,
    }));

    const error = await spotifyApiGet('/me').catch((caught: unknown) => caught);
    expect(error).toBeInstanceOf(SpotifyApiError);
    const apiError = error as SpotifyApiError;
    expect(apiError.kind).toBe('http');
    expect(apiError.status).toBe(403);
    expect(apiError.spotifyMessage).toContain(
      'developer.spotify.com/dashboard'
    );
    expect(apiError.httpDiagnostics).toEqual({
      bodyShape: 'json',
      contentType: 'application/json',
    });
    // Le message capturé ne doit JAMAIS contenir le token porteur.
    expect(apiError.spotifyMessage).not.toContain('valid-token');
  });

  describe('403 SANS message Spotify — forme du corps conservée (jamais le token)', () => {
    const forbidden = (body: string, contentType: string | null): unknown =>
      ({
        status: 403,
        ok: false,
        headers: {
          get: (name: string) => (name === 'Content-Type' ? contentType : null),
        },
        text: async () => body,
      }) as unknown as Response;

    it('JSON sans error.message → spotifyMessage vide + forme « json » + Content-Type', async () => {
      await saveSession(validSession());
      setFetch(async () =>
        forbidden('{"error":{"status":403}}', 'application/json')
      );

      const error = await spotifyApiGet('/me').catch((e: unknown) => e);
      expect(error).toMatchObject({ kind: 'http', status: 403 });
      expect((error as SpotifyApiError).spotifyMessage).toBe('');
      expect((error as SpotifyApiError).httpDiagnostics).toEqual({
        bodyShape: 'json',
        contentType: 'application/json',
      });
      expect(await loadSession()).not.toBeNull();
    });

    it('corps VIDE → spotifyMessage vide + forme « empty »', async () => {
      await saveSession(validSession());
      setFetch(async () => forbidden('', 'application/json'));

      const error = await spotifyApiGet('/me').catch((e: unknown) => e);
      expect(error).toMatchObject({ kind: 'http', status: 403 });
      expect((error as SpotifyApiError).spotifyMessage).toBe('');
      expect((error as SpotifyApiError).httpDiagnostics).toEqual({
        bodyShape: 'empty',
        contentType: 'application/json',
      });
    });

    it('réponse NON JSON (HTML, ex. CDN/filtre) → forme « non-json » + Content-Type HTML', async () => {
      await saveSession(validSession());
      setFetch(async () =>
        forbidden(
          '<!DOCTYPE html><html><body>Access denied</body></html>',
          'text/html; charset=utf-8'
        )
      );

      const error = await spotifyApiGet('/me').catch((e: unknown) => e);
      expect(error).toMatchObject({ kind: 'http', status: 403 });
      expect((error as SpotifyApiError).spotifyMessage).toBe('');
      expect((error as SpotifyApiError).httpDiagnostics).toEqual({
        bodyShape: 'non-json',
        contentType: 'text/html; charset=utf-8',
      });
      // Jamais de contenu de page ni de token dans l’erreur exposée.
      const serialized = JSON.stringify(error);
      expect(serialized).not.toContain('Access denied');
      expect(serialized).not.toContain('valid-token');
      expect(await loadSession()).not.toBeNull();
    });

    it('format alternatif { "error": "code" } → message capturé + forme « json »', async () => {
      await saveSession(validSession());
      setFetch(async () =>
        forbidden('{"error":"Forbidden"}', 'application/json')
      );

      const error = await spotifyApiGet('/me').catch((e: unknown) => e);
      expect(error).toMatchObject({ kind: 'http', status: 403 });
      expect((error as SpotifyApiError).spotifyMessage).toBe('Forbidden');
      expect((error as SpotifyApiError).httpDiagnostics?.bodyShape).toBe(
        'json'
      );
    });
  });
});
