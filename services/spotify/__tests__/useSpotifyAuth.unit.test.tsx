/**
 * Hook useSpotifyAuth — TAXONOMIE DU DIAGNOSTIC (section 1 de la mission) :
 *  CLIENT_ID manquant       → not-configured (navigateur JAMAIS ouvert)
 *  Spotify refuse (authorize error ou token 4xx) → oauth-refused
 *  utilisateur annule       → cancelled
 *  callback sans code       → callback-failed
 *  state invalide           → callback-failed (garde-fou)
 *  PKCE invalide            → callback-failed
 *  échange 5xx              → network
 *  réseau (fetch/me)        → network
 *  /me en échec technique   → unknown
 *  réponse illisible        → unknown
 * + garde-fou deep-link : reprend le callback perdu par la custom tab,
 *   vérifie le state, anti-double-échange ; callback froid sans verifier
 *   détecté et classé.
 */
import { renderHook, act } from '@testing-library/react-native';
import Constants from 'expo-constants';
import * as AuthSession from 'expo-auth-session';

import { useSpotifyAuth } from '../useSpotifyAuth';
import { redeemAuthorizationCode } from '../session';
import { SpotifyApiError } from '../apiClient';
import { getCurrentUser } from '@api';

const mockPromptAsync = jest.fn() as jest.Mock;
const mockApplySpotifyUser = jest.fn();
const initialUrlHolder: { current: string | null } = { current: null };
const linkListeners: ((event: { url: string }) => void)[] = [];

const makeRequest = () => ({ codeVerifier: 'verifier-test', state: 'STATE-1' });
let mockRequest: ReturnType<typeof makeRequest> | null = makeRequest();

jest.mock('expo-auth-session', () => ({
  ...jest.requireActual('expo-auth-session'),
  useAuthRequest: jest.fn(() => [mockRequest, null, mockPromptAsync]),
  makeRedirectUri: () => 'melodix://callback',
}));

jest.mock('expo-linking', () => ({
  getInitialURL: jest.fn(async () => initialUrlHolder.current),
  addEventListener: jest.fn(
    (_event: string, fn: (event: { url: string }) => void) => {
      linkListeners.push(fn);
      return { remove: jest.fn() };
    }
  ),
}));

jest.mock('expo-web-browser', () => ({
  maybeCompleteAuthSession: jest.fn(),
  dismissBrowser: jest.fn(async () => {}),
}));

jest.mock('../session', () => {
  const actual = jest.requireActual('../session');
  return {
    ...actual,
    redeemAuthorizationCode: jest.fn(),
  };
});

jest.mock('@api', () => ({
  getCurrentUser: jest.fn(),
}));

jest.mock('@context', () => ({
  useUserData: () => ({ applySpotifyUser: mockApplySpotifyUser }),
}));

const setExtra = (patch: Record<string, unknown>) => {
  const root = (Constants.default ?? Constants) as unknown as {
    __setExpoConfigExtra: (p: Record<string, unknown>) => void;
  };
  root.__setExpoConfigExtra(patch);
};

/** La promesse promptAsync retournée par la plupart des scénarios. */
let promptPromise: Promise<unknown> = Promise.resolve({
  type: 'success',
  params: { code: 'auth-code' },
});

describe('useSpotifyAuth — taxonomie du diagnostic OAuth', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    linkListeners.length = 0;
    initialUrlHolder.current = null;
    mockRequest = makeRequest();
    promptPromise = Promise.resolve({
      type: 'success',
      params: { code: 'auth-code' },
    });
    mockPromptAsync.mockImplementation(() => promptPromise);
    (AuthSession.useAuthRequest as jest.Mock).mockImplementation(() => [
      mockRequest,
      null,
      mockPromptAsync,
    ]);
    setExtra({
      spotifyClientId: 'client-test',
      // Redirect du SCÉNARIO (valeur arbitraire — chaque env a la sienne).
      spotifyRedirectUri: 'melodix://callback',
    });
    (redeemAuthorizationCode as jest.Mock).mockResolvedValue({
      kind: 'ok',
      session: {
        accessToken: 'acc',
        refreshToken: 'ref',
        expiresAtMs: Date.now() + 3_600_000,
        scope: 'user-read-private',
      },
    });
    (getCurrentUser as jest.Mock).mockResolvedValue({
      id: 'user-1',
      display_name: 'Julien',
      images: [],
    });
  });

  it('succès complet : exchange PKCE, /me, profil appliqué, état idle', async () => {
    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(redeemAuthorizationCode).toHaveBeenCalledWith(
      expect.objectContaining({
        code: 'auth-code',
        codeVerifier: 'verifier-test',
        redirectUri: 'melodix://callback',
      })
    );
    expect(mockApplySpotifyUser).toHaveBeenCalledWith(
      expect.objectContaining({ id: 'user-1' })
    );
    expect(result.current.state).toEqual({ status: 'idle' });
  });

  it('CLIENT_ID manquant → not-configured, promptAsync JAMAIS appelé', async () => {
    setExtra({ spotifyClientId: '' });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(mockPromptAsync).not.toHaveBeenCalled();
    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'not-configured', cause: 'client-id-missing-in-build' },
    });
  });

  it('annulation utilisateur → cancelled', async () => {
    promptPromise = Promise.resolve({ type: 'cancel' });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(redeemAuthorizationCode).not.toHaveBeenCalled();
    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'cancelled', cause: 'cancel' },
    });
  });

  it('Spotify renvoie une erreur d authorize → oauth-refused avec cause whitelistée', async () => {
    promptPromise = Promise.resolve({
      type: 'error',
      params: { error: 'unknown_value_not_in_whitelist' },
    });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: {
        kind: 'oauth-refused',
        cause: 'unlisted',
      },
    });
  });

  it('échange refusé 400 invalid_client → oauth-refused', async () => {
    (redeemAuthorizationCode as jest.Mock).mockResolvedValueOnce({
      kind: 'refused',
      status: 400,
      errorCode: 'invalid_client',
    });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: {
        kind: 'oauth-refused',
        cause: 'invalid_client · HTTP 400',
      },
    });
  });

  it('échange refusé 500 → network (Spotify injoignable)', async () => {
    (redeemAuthorizationCode as jest.Mock).mockResolvedValueOnce({
      kind: 'refused',
      status: 502,
      errorCode: 'temporarily_unavailable',
    });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'network', cause: 'temporarily_unavailable · HTTP 502' },
    });
  });

  it('échange hors-ligne → network', async () => {
    (redeemAuthorizationCode as jest.Mock).mockResolvedValueOnce({
      kind: 'network',
    });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'network', cause: 'exchange-unreachable' },
    });
  });

  it('réponse d échange illisible → unknown', async () => {
    (redeemAuthorizationCode as jest.Mock).mockResolvedValueOnce({
      kind: 'invalid-response',
    });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'unknown', cause: 'invalid-token-response' },
    });
  });

  it('token reçu mais /me joue l avion → network', async () => {
    (getCurrentUser as jest.Mock).mockRejectedValueOnce(
      Object.assign(new Error('offline'), { kind: 'network' })
    );

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'network', cause: 'me:network' },
    });
  });

  it('token reçu mais /me 403 → statut HTTP + message Spotify dans la cause', async () => {
    const logSpy = jest.spyOn(console, 'log').mockImplementation(() => {});
    (getCurrentUser as jest.Mock).mockRejectedValueOnce(
      new SpotifyApiError(
        'http',
        'Réponse Spotify non valide (403).',
        403,
        'Check settings on developer.spotify.com/dashboard, the user may not be registered.'
      )
    );

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state.status).toBe('error');
    if (result.current.state.status === 'error') {
      expect(result.current.state.outcome.kind).toBe('unknown');
      expect(result.current.state.outcome.cause).toContain('me:http');
      expect(result.current.state.outcome.cause).toContain('403');
      expect(result.current.state.outcome.cause).toContain(
        'developer.spotify.com/dashboard'
      );
    }
    const authLines = logSpy.mock.calls
      .map((call) => String(call[0]))
      .filter((text) => text.includes('[SPOTIFY AUTH]'));
    expect(
      authLines.some((t) => t.includes('[SPOTIFY AUTH] /v1/me request started'))
    ).toBe(true);
    expect(
      authLines.some((t) =>
        t.includes('[SPOTIFY AUTH] /v1/me HTTP status: 403')
      )
    ).toBe(true);
    expect(
      authLines.some(
        (t) =>
          t.includes('[SPOTIFY AUTH] /v1/me success/error: error') &&
          t.includes('developer.spotify.com/dashboard')
      )
    ).toBe(true);
    logSpy.mockRestore();
  });

  it('session non sauvegardée → unknown (save-failed)', async () => {
    (redeemAuthorizationCode as jest.Mock).mockResolvedValueOnce({
      kind: 'save-failed',
    });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'unknown', cause: 'session-save-failed' },
    });
  });

  it('requête non chargée → unknown propre (bouton grisé via isAuthRequestPending)', async () => {
    (AuthSession.useAuthRequest as jest.Mock).mockImplementation(() => [
      null,
      null,
      mockPromptAsync,
    ]);

    const { result } = renderHook(() => useSpotifyAuth());
    expect(result.current.isAuthRequestPending).toBe(true);

    await act(async () => {
      await result.current.startLogin();
    });
    expect(mockPromptAsync).not.toHaveBeenCalled();
    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'unknown', cause: 'auth-request-not-ready' },
    });
  });

  describe('garde-fou deep-link (callback Android)', () => {
    it('callback sans code (canal natif) → callback-failed', async () => {
      promptPromise = Promise.resolve({ type: 'success', params: {} });

      const { result } = renderHook(() => useSpotifyAuth());
      await act(async () => {
        await result.current.startLogin();
      });

      expect(result.current.state).toEqual({
        status: 'error',
        outcome: { kind: 'callback-failed', cause: 'code-absent' },
      });
    });

    it('callback valide capté par le LISTENER → échange ; la promesse promptAsync tardive est ignorée', async () => {
      // promptAsync ne résout qu'au signe « dismiss » après return de l'utilisateur.
      promptPromise = new Promise<never>(() => {}); // canal natif muet

      const { result } = renderHook(() => useSpotifyAuth());

      await act(async () => {
        void result.current.startLogin();
      });
      expect(result.current.state.status).toBe('requesting');
      expect(linkListeners).toHaveLength(1);

      await act(async () => {
        linkListeners[0]({
          url: 'melodix://callback?code=deep-code&state=STATE-1',
        });
      });

      expect(redeemAuthorizationCode).toHaveBeenCalledWith(
        expect.objectContaining({
          code: 'deep-code',
          codeVerifier: 'verifier-test',
        })
      );
      expect(mockApplySpotifyUser).toHaveBeenCalled();
      expect(result.current.state).toEqual({ status: 'idle' });
    });

    it('state invalide capté par le listener → callback-failed, JAMAIS d échange', async () => {
      promptPromise = new Promise<never>(() => {});

      const { result } = renderHook(() => useSpotifyAuth());
      await act(async () => {
        void result.current.startLogin();
      });

      await act(async () => {
        linkListeners[0]({
          url: 'melodix://callback?code=mauvais&state=AUTRE-STATE',
        });
      });

      expect(redeemAuthorizationCode).not.toHaveBeenCalled();
      expect(result.current.state).toEqual({
        status: 'error',
        outcome: { kind: 'callback-failed', cause: 'state-invalid' },
      });
    });

    it('callback froid (processus tué, pas de verifier) → callback-failed détecté proprement', async () => {
      initialUrlHolder.current = 'melodix://callback?code=froid&state=STATE-9';

      const { result } = renderHook(() => useSpotifyAuth());

      await act(async () => {
        await Promise.resolve(); // flush getInitialURL + effets
        await Promise.resolve();
      });

      expect(redeemAuthorizationCode).not.toHaveBeenCalled();
      expect(result.current.state).toEqual({
        status: 'error',
        outcome: { kind: 'callback-failed', cause: 'cold-start-no-verifier' },
      });
    });

    it('une URL étrangère n est JAMAIS traitée (mauvais scheme/host)', async () => {
      promptPromise = new Promise<never>(() => {});

      const { result } = renderHook(() => useSpotifyAuth());
      await act(async () => {
        void result.current.startLogin();
      });

      await act(async () => {
        linkListeners[0]({
          url: 'https://malicious.example/x?code=q&state=STATE-1',
        });
      });

      expect(redeemAuthorizationCode).not.toHaveBeenCalled();
      expect(result.current.state.status).toBe('requesting');
    });
  });

  it('resetError : retour à l état idle depuis une erreur', async () => {
    promptPromise = Promise.resolve({ type: 'dismiss' });
    const { result } = renderHook(() => useSpotifyAuth());

    await act(async () => {
      await result.current.startLogin();
    });
    expect(result.current.state.status).toBe('error');

    act(() => {
      result.current.resetError();
    });
    expect(result.current.state).toEqual({ status: 'idle' });
  });
});
