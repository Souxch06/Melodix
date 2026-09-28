/**
 * Hook de connexion Spotify — OAuth Authorization Code + PKCE via le
 * navigateur système (expo-auth-session). AUCUN client_secret (client public :
 * le code_verifier/challenge PKCE est généré par expo-auth-session et ne
 * transite JAMAIS dans un log).
 *
 * Chaque étape (config, redirect URI, ouverture navigateur, retour, échange
 * PKCE, profil) est journalisée via spotifyLog (whitelist sans secret) :
 * en cas d'échec sur un vrai appareil, les logs identifient l'étape fautive.
 */
import * as React from 'react';
import * as AuthSession from 'expo-auth-session';
import * as WebBrowser from 'expo-web-browser';

import { getCurrentUser } from '@api';
import { useUserData } from '@context';

import {
  getSpotifyClientId,
  isSpotifyLoginConfigured,
  SPOTIFY_DISCOVERY,
  SPOTIFY_REDIRECT_PATH,
  SPOTIFY_REDIRECT_SCHEME,
  SPOTIFY_SCOPES,
} from './authConfig';
import { spotifyLog } from './devLog';
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
  /** true tant que expo-auth-session n'a pas chargé la requête (bouton grisé). */
  isAuthRequestPending: boolean;
  startLogin: () => Promise<void>;
  resetError: () => void;
} => {
  const { applySpotifyUser } = useUserData();
  const [state, setState] = React.useState<SpotifyAuthState>({ status: 'idle' });

  const clientId = getSpotifyClientId();
  const configured = isSpotifyLoginConfigured();
  const redirectUri = AuthSession.makeRedirectUri({
    scheme: SPOTIFY_REDIRECT_SCHEME,
    path: SPOTIFY_REDIRECT_PATH,
  });

  // Diagnostic seulement : l'URI calculée doit EXACTEMENT correspondre à une
  // URI déclarée dans le dashboard Spotify (melodix://callback ou exp://…/--/…).
  React.useEffect(() => {
    spotifyLog('auth.config', {
      redirectUri,
      cause: configured ? 'client-id-present' : 'CLIENT_ID_ABSENT',
    });
  }, [redirectUri, configured]);

  const [request, , promptAsync] = AuthSession.useAuthRequest(
    {
      clientId,
      responseType: AuthSession.ResponseType.Code,
      scopes: [...SPOTIFY_SCOPES],
      // PKCE par défaut (S256) — jamais clos : expo-auth-session garantit
      // le challenge/verifier, aucun secret dans l'app.
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
    if (!configured) {
      // Config build absente : jamais de navigateur, message dédié côté écran.
      spotifyLog('auth.not-configured');
      setState({ status: 'error', outcome: { kind: 'not-configured' } });
      return;
    }

    if (!request) {
      // La requête n'est pas encore chargée : on réessaiera au prochain clic.
      spotifyLog('auth.prompt.not-ready');
      setState({ status: 'error', outcome: { kind: 'unavailable' } });
      return;
    }

    spotifyLog('auth.prompt.open', { resultType: 'opening' });
    setState({ status: 'requesting' });

    try {
      const result = await promptAsync();

      spotifyLog('auth.prompt.result', { resultType: result.type });

      if (result.type === 'cancel' || result.type === 'dismiss') {
        setState({ status: 'error', outcome: { kind: 'cancelled' } });
        return;
      }

      if (result.type === 'error') {
        // result.params.error n'est PAS un secret : code d'erreur OAuth.
        spotifyLog('auth.prompt.error', {
          cause: result.params?.error ? String(result.params.error) : 'unknown',
        });
        setState({ status: 'error', outcome: { kind: 'unavailable' } });
        return;
      }

      if (result.type !== 'success' || !request.codeVerifier) {
        spotifyLog('auth.prompt.unexpected', {
          resultType: result.type,
          cause: request.codeVerifier ? 'verifier-present' : 'VERIFIER_ABSENT',
        });
        setState({ status: 'error', outcome: { kind: 'unavailable' } });
        return;
      }

      spotifyLog('auth.exchange.start', { status: 'in-flight' });
      setState({ status: 'exchanging' });
      const session = await redeemAuthorizationCode({
        code: result.params.code,
        codeVerifier: request.codeVerifier,
        redirectUri,
      });

      if (!session) {
        spotifyLog('auth.exchange.refused');
        setState({ status: 'error', outcome: { kind: 'unavailable' } });
        return;
      }

      spotifyLog('auth.profile.fetch', { ttlSeconds: undefined });
      const user = await getCurrentUser();
      applySpotifyUser(user);
      spotifyLog('auth.success', { scopesCount: SPOTIFY_SCOPES.length });
      setState({ status: 'idle' });
    } catch (error) {
      // Détail technique uniquement en log développeur (cause, jamais de token).
      console.warn('Spotify login flow failed', error);
      spotifyLog('auth.exception');
      setState({ status: 'error', outcome: { kind: 'unavailable' } });
    }
  }, [configured, promptAsync, request, redirectUri, applySpotifyUser]);

  return {
    state,
    isBusy: state.status === 'requesting' || state.status === 'exchanging',
    isAuthRequestPending: !request,
    startLogin,
    resetError,
  };
};

/** Client ID manquant : login non configuré (message dédié côté écran). */
export const isAuthRequestReady = (request: unknown): boolean => !!request;
