import Constants from 'expo-constants';
import * as SecureStore from 'expo-secure-store';

import {
  clearSession,
  describeSession,
  getValidAccessToken,
  loadSession,
  redeemAuthorizationCode,
  saveSession,
} from '../session';

// Client ID factice via la configuration d'app (jamais saisi par l'utilisateur).
beforeAll(() => {
  (Constants.default ?? Constants).__setExpoConfigExtra({
    spotifyClientId: 'client-test',
  });
});

const freshSession = () => ({
  accessToken: 'access-new',
  refreshToken: 'refresh-new',
  expiresAtMs: Date.now() + 3600_000,
  scope: 'user-read-private playlist-read-private',
});

const expiredSession = () => ({
  accessToken: 'access-old',
  refreshToken: 'refresh-old',
  expiresAtMs: Date.now() - 3600_000,
  scope: 'user-read-private',
});

describe('services/spotify/session (SecureStore)', () => {
  const originalFetch = globalThis.fetch;
  const warnSpy = jest.spyOn(console, 'warn').mockImplementation(() => {});

  beforeEach(async () => {
    (SecureStore as unknown as { __clearSecureStoreMock: () => void }).__clearSecureStoreMock();
    jest.clearAllMocks();
  });

  afterAll(() => {
    globalThis.fetch = originalFetch;
    warnSpy.mockRestore();
  });

  it('save → load round-trip, describeSession masque les tokens', async () => {
    await saveSession(freshSession());

    const loaded = await loadSession();
    expect(loaded?.accessToken).toBe('access-new');
    expect(loaded?.refreshToken).toBe('refresh-new');

    const description = await describeSession();
    expect(description?.connected).toBe(true);
    expect(description?.canRefresh).toBe(true);
    expect(description?.expiresInSeconds).toBeGreaterThan(3000);
  });

  it('aucune session → loadSession null, token null', async () => {
    await expect(loadSession()).resolves.toBeNull();
    await expect(getValidAccessToken()).resolves.toBeNull();
  });

  it('session valide → access token servi tel quel SANS appel réseau', async () => {
    await saveSession(freshSession());
    globalThis.fetch = jest.fn() as unknown as typeof fetch;

    await expect(getValidAccessToken()).resolves.toBe('access-new');
    expect(globalThis.fetch).not.toHaveBeenCalled();
  });

  it('session expirée → refresh automatique, nouveau token persisté', async () => {
    await saveSession(expiredSession());
    globalThis.fetch = jest.fn(async (url) => {
      expect(String(url)).toContain('accounts.spotify.com');
      return {
        ok: true,
        json: async () => ({
          access_token: 'access-refreshed',
          // refresh_token absent : l'ancien doit être conservé (comportement Spotify)
          expires_in: 3600,
        }),
      } as Response;
    }) as unknown as typeof fetch;

    await expect(getValidAccessToken()).resolves.toBe('access-refreshed');

    const loaded = await loadSession();
    expect(loaded?.refreshToken).toBe('refresh-old');
    expect(loaded?.expiresAtMs).toBeGreaterThan(Date.now());
  });

  it('deux appels concurrents → UNE seule requête de refresh', async () => {
    await saveSession(expiredSession());
    let calls = 0;
    globalThis.fetch = jest.fn(async () => {
      calls += 1;
      return {
        ok: true,
        json: async () => ({ access_token: 'access-x', expires_in: 3600 }),
      } as Response;
    }) as unknown as typeof fetch;

    const [a, b] = await Promise.all([
      getValidAccessToken(),
      getValidAccessToken(),
    ]);

    expect(a).toBe('access-x');
    expect(b).toBe('access-x');
    expect(calls).toBe(1);
  });

  it('refresh refusé → null (session invalide propagée proprement)', async () => {
    await saveSession(expiredSession());
    globalThis.fetch = jest.fn(async () => ({
      ok: false,
      status: 400,
    })) as unknown as typeof fetch;

    await expect(getValidAccessToken()).resolves.toBeNull();
  });

  it('session sans refresh token expirée → null', async () => {
    await saveSession({ ...expiredSession(), refreshToken: null });
    await expect(getValidAccessToken()).resolves.toBeNull();
  });

  it('redeemAuthorizationCode transmet PKCE SANS client_secret', async () => {
    let capturedBody = '';
    globalThis.fetch = jest.fn(async (_url, options) => {
      capturedBody = String(options?.body ?? '');
      return {
        ok: true,
        json: async () => ({
          access_token: 'at',
          refresh_token: 'rt',
          expires_in: 3600,
        }),
      } as Response;
    }) as unknown as typeof fetch;

    const session = await redeemAuthorizationCode({
      code: 'the-code',
      codeVerifier: 'the-verifier',
      redirectUri: 'melodix://callback',
    });

    expect(session?.accessToken).toBe('at');
    expect(capturedBody).toContain('grant_type=authorization_code');
    expect(capturedBody).toContain('code_verifier=the-verifier');
    expect(capturedBody).toContain('redirect_uri=melodix%3A%2F%2Fcallback');
    expect(capturedBody).not.toContain('client_secret');

    expect((await loadSession())?.refreshToken).toBe('rt');
  });

  it('clearSession efface tout (revenir à non connecté)', async () => {
    await saveSession(freshSession());
    await clearSession();
    await expect(loadSession()).resolves.toBeNull();
  });

  it('JAMAIS de token dans les logs développeur', async () => {
    await saveSession(expiredSession());
    globalThis.fetch = jest.fn(async () => ({ ok: false, status: 500 })) as unknown as typeof fetch;

    await getValidAccessToken();

    for (const call of warnSpy.mock.calls) {
      expect(JSON.stringify(call)).not.toContain('access-old');
      expect(JSON.stringify(call)).not.toContain('refresh-old');
      expect(JSON.stringify(call)).not.toContain('Authorization');
    }
  });
});
