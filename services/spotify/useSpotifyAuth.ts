/**
 * Hook de connexion Spotify — OAuth Authorization Code + PKCE via le
 * navigateur système (expo-auth-session). AUCUN client_secret (client public).
 *
 * Utilisé par l'écran de connexion : `promptAsync()` ouvre la page
 * d'autorisation officielle Spotify ; au retour, le code est échangé contre
 * une session (services/spotify/session, Keystore chiffré).
 */
import * as React from 'react';
import * as AuthSession from 'expo-auth-session';
import * as WebBrowser from 'expo-web-browser';

import { getCurrentUser } from '@api';
import { useUserData } from '@context';

import {
  getSpotifyClientId,
  SPOTIFY_DISCOVERY,
  SPOTIFY_REDIRECT_PATH,
  SPOTIFY_REDIRECT_SCHEME,
  SPOTIFY_SCOPES,
} from './authConfig';
import { LoginOutcome, redeemAuthorizationCode } from './session';

// Prépare expo-web-browser à consommer le retour deep-link (obligatoire,
// règle expo-auth-session ; sans effet sur la session déjà ouverte).
WebBrowser.maybeCompleteAuthSession();

export type SpotifyAuthState =
  | { status: 'idle' }
  | { status: 'requesting' }
  | { status: 'exchanging' }
  | { status: 'error'; outcome: Exclude<LoginOutcome, { kind: 'ok' }> };

const isIdle = (state: SpotifyAuthState): boolean => state.status === 'idle';

export const useSpotifyAuth = (): {
  state: SpotifyAuthState;
  isBusy: boolean;
  startLogin: () => Promise<void>;
  resetError: () => void;
} => {
  const { applySpotifyUser } = useUserData();
  const [state, setState] = React.useState<SpotifyAuthState>({ status: 'idle' });

  const clientId = getSpotifyClientId();
  const redirectUri = AuthSession.makeRedirectUri({
    scheme: SPOTIFY_REDIRECT_SCHEME,
    path: SPOTIFY_REDIRECT_PATH,
  });

  const [request, , promptAsync] = AuthSession.useAuthRequest(
    {
      clientId,
      responseType: AuthSession.ResponseType.Code,
      scopes: [...SPOTIFY_SCOPES],
      // PKCE : le code_challenge est généré et vérifié par expo-auth-session.
      usePKCE: true,
      redirectUri,
      extraParams: { show_dialog: 'true' },
    },
    SPOTIFY_DISCOVERY
  );

  const resetError = React.useCallback(() => {
    setState((current) => (isIdle(current) ? current : { status: 'idle' }));
  }, []);

  const startLogin = React.useCallback(async () => {
    setState({ status: 'requesting' });

    try {
      const result = await promptAsync();

      if (result.type === 'cancel' || result.type === 'dismiss') {
        setState({ status: 'error', outcome: { kind: 'cancelled' } });
        return;
      }

      if (result.type !== 'success' || !request?.codeVerifier) {
        setState({ status: 'error', outcome: { kind: 'unavailable' } });
        return;
      }

      setState({ status: 'exchanging' });
      const session = await redeemAuthorizationCode({
        code: result.params.code,
        codeVerifier: request.codeVerifier,
        redirectUri,
      });

      if (!session) {
        setState({ status: 'error', outcome: { kind: 'unavailable' } });
        return;
      }

      const user = await getCurrentUser();
      applySpotifyUser(user);
      setState({ status: 'idle' });
    } catch (error) {
      // Détail technique uniquement en log développeur.
      console.warn('Spotify login flow failed', error);
      setState({ status: 'error', outcome: { kind: 'unavailable' } });
    }
  }, [promptAsync, request, redirectUri, applySpotifyUser]);

  return {
    state,
    isBusy: state.status === 'requesting' || state.status === 'exchanging',
    startLogin,
    resetError,
  };
};

/** Client ID manquant : login non configuré (message dédié côté écran). */
export const isAuthRequestReady = (request: unknown): boolean => !!request;
