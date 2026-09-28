/**
 * Hook useSpotifyAuth — logique du flux OAuth :
 *  scénario 4 : Client ID absent    → outcome 'not-configured', navigateur JAMAIS ouvert
 *  scénario 5 : annulation          → outcome 'cancelled' (état réessayable à l'écran)
 *  scénario 6 : échec OAuth         → outcome 'unavailable' (message propre côté écran)
 *             + succès complet      → code PKCE échangé, profil /me chargé, appliqué
 */
import { renderHook, act } from '@testing-library/react-native';
import Constants from 'expo-constants';
import * as AuthSession from 'expo-auth-session';

import { useSpotifyAuth } from '../useSpotifyAuth';
import { redeemAuthorizationCode } from '../session';
import { getCurrentUser } from '@api';

const mockPromptAsync = jest.fn(async () => ({ type: 'success', params: { code: 'auth-code' } }) as never);
const mockApplySpotifyUser = jest.fn();

let mockRequest: { codeVerifier: string } | null = { codeVerifier: 'verifier-test' };

jest.mock('expo-auth-session', () => ({
  ...jest.requireActual('expo-auth-session'),
  useAuthRequest: jest.fn(() => [mockRequest, null, mockPromptAsync]),
  makeRedirectUri: () => 'melodix://callback',
}));

jest.mock('expo-web-browser', () => ({
  maybeCompleteAuthSession: jest.fn(),
}));

jest.mock('../session', () => ({
  redeemAuthorizationCode: jest.fn(),
}));

jest.mock('@api', () => ({
  getCurrentUser: jest.fn(),
}));

jest.mock('@context', () => ({
  useUserData: () => ({ applySpotifyUser: mockApplySpotifyUser }),
}));

const extra = () => {
  const root = (Constants.default ?? Constants) as unknown as {
    __setExpoConfigExtra: (patch: Record<string, unknown>) => void;
  };
  return root.__setExpoConfigExtra;
};

describe('useSpotifyAuth — logique OAuth (sans navigateur réel)', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    mockRequest = { codeVerifier: 'verifier-test' };
    extra()({ spotifyClientId: 'client-test' });
    // Le code est accepté, une session rendue, le profil lu.
    (redeemAuthorizationCode as jest.Mock).mockResolvedValue({
      accessToken: 'acc',
      refreshToken: 'ref',
      expiresAtMs: Date.now() + 3_600_000,
      scopes: ['user-read-private'],
      tokenType: 'Bearer',
    });
    (getCurrentUser as jest.Mock).mockResolvedValue({
      id: 'user-1',
      display_name: 'Julien',
      images: [],
    });
    (AuthSession.useAuthRequest as jest.Mock).mockImplementation(() => [
      mockRequest,
      null,
      mockPromptAsync,
    ]);
    mockPromptAsync.mockResolvedValue({
      type: 'success',
      params: { code: 'auth-code' },
    } as never);
  });

  it('succès complet : exchange PKCE, profil appliqué, état final idle', async () => {
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
    expect(getCurrentUser).toHaveBeenCalledTimes(1);
    expect(mockApplySpotifyUser).toHaveBeenCalledWith(
      expect.objectContaining({ id: 'user-1' })
    );
    expect(result.current.state).toEqual({ status: 'idle' });
    expect(result.current.isAuthRequestPending).toBe(false);
  });

  it('scénario 4 : Client ID ABSENT → not-configured, promptAsync JAMAIS appelé', async () => {
    extra()({ spotifyClientId: '' });

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(mockPromptAsync).not.toHaveBeenCalled();
    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'not-configured' },
    });
  });

  it('scénario 5 : annulation utilisateur → outcome cancelled (sans appel API)', async () => {
    mockPromptAsync.mockResolvedValue({ type: 'cancel' } as never);

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(redeemAuthorizationCode).not.toHaveBeenCalled();
    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'cancelled' },
    });
  });

  it('scénario 6 : Spotify renvoie une erreur → outcome unavailable', async () => {
    mockPromptAsync.mockResolvedValue({
      type: 'error',
      params: { error: 'access_denied' },
    } as never);

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'unavailable' },
    });
  });

  it('6bis : code refusé / réseau coupé → unavailable (jamais de stack exposée)', async () => {
    (redeemAuthorizationCode as jest.Mock).mockResolvedValueOnce(null);

    const { result } = renderHook(() => useSpotifyAuth());
    await act(async () => {
      await result.current.startLogin();
    });

    expect(result.current.state).toEqual({
      status: 'error',
      outcome: { kind: 'unavailable' },
    });
    expect(mockApplySpotifyUser).not.toHaveBeenCalled();
  });

  it('requête non chargée : isAuthRequestPending vrai, startLogin → unavailable propre', async () => {
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
      outcome: { kind: 'unavailable' },
    });
  });

  it('resetError : retour à l état idle depuis n importe quelle erreur', async () => {
    mockPromptAsync.mockResolvedValueOnce({ type: 'dismiss' } as never);
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
