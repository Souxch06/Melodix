/**
 * Hook de connexion Spotify — OAuth Authorization Code + PKCE via le
 * navigateur système (expo-auth-session). AUCUN client_secret (client public :
 * le code_verifier/challenge PKCE généré par expo-auth-session ne transite
 * JAMAIS dans un log).
 *
 * DIAGNOSTIC (chaque cause exacte de l'échec, cf. mission) :
 *   CLIENT_ID manquant        → 'not-configured'   + log auth.config CLIENT_ID_ABSENT
 *   Spotify refuse (authorize)→ 'oauth-refused'    + log auth.prompt.error <cause>
 *   utilisateur annule        → 'cancelled'        + log auth.prompt.result cancel
 *   callback Android non reçu → garde-fou Linking  + log callback.unexpected
 *   callback sans code        → 'callback-failed'  + log callback.no-code
 *   state invalide            → 'callback-failed'  + log callback.state-invalid
 *   PKCE invalide (verifier)  → 'callback-failed'  + log pkce.verifier-missing
 *   échange code→token refusé → 'oauth-refused'    + log exchange.refused <http>/<code>
 *   réseau (authorize/échange/me) → 'network'
 *   token reçu, /me échoue    → 'network' | 'unknown' + log me.failed
 *   session non sauvegardée   → 'unknown'          + log exchange.save-failed
 *
 * GARDE-FOU CALLBACK : en plus du canal natif d'expo-auth-session, un
 * listener de deep-link reprend le relais si le retour Spotify se perd
 * (custom tab tuée, résultat non délivré), avec vérification du state OAuth
 * et anti-double-échange. Un callback froid sans verifier PKCE est détecté
 * puis signalé (« Retour Spotify impossible ») au lieu de planter
 * silencieusement.
 */
import * as React from 'react';
import * as AuthSession from 'expo-auth-session';
import * as Linking from 'expo-linking';
import * as WebBrowser from 'expo-web-browser';

import { getCurrentUser } from '@api';
import { useUserData } from '@context';

import {
  getClientIdInfo,
  isSpotifyLoginConfigured,
  SPOTIFY_DISCOVERY,
  SPOTIFY_REDIRECT_PATH,
  SPOTIFY_REDIRECT_SCHEME,
  SPOTIFY_SCOPES,
} from './authConfig';
import { logRedirectUri, spotifyLog } from './devLog';
import {
  LoginOutcome,
  redeemAuthorizationCode,
  sanitizeOAuthErrorCode,
  SpotifySession,
} from './session';

// Prépare expo-web-browser à consommer le retour deep-link (obligatoire,
// règle expo-auth-session ; sans effet sur la session déjà ouverte).
WebBrowser.maybeCompleteAuthSession();

export type SpotifyAuthErrorKind = Exclude<LoginOutcome, { kind: 'ok' }>['kind'];

export type SpotifyAuthState =
  | { status: 'idle' }
  | { status: 'requesting' }
  | { status: 'exchanging' }
  | { status: 'error'; outcome: Exclude<LoginOutcome, { kind: 'ok' }> };

const isIdle = (state: SpotifyAuthState): boolean => state.status === 'idle';

/** Parsing minimal d'une querystring (code, state, error — jamais logués). */
const readQueryParams = (url: string): Record<string, string> => {
  const question = url.indexOf('?');
  if (question < 0) {
    return {};
  }
  const out: Record<string, string> = {};
  for (const pair of url.slice(question + 1).split('&')) {
    const [key, value = ''] = pair.split('=');
    if (key) {
      out[decodeURIComponent(key)] = decodeURIComponent(value);
    }
  }
  return out;
};

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

  const clientInfo = getClientIdInfo();
  const configured = isSpotifyLoginConfigured();
  const redirectUri = AuthSession.makeRedirectUri({
    scheme: SPOTIFY_REDIRECT_SCHEME,
    path: SPOTIFY_REDIRECT_PATH,
  });

  // Anti-états-croisés : des listeners asynchrones peuvent se résoudre en
  // différé ; une seule source (canal auth-session OU garde-fou) pilote le flux.
  const fallbackUsedRef = React.useRef(false);

  // Diagnostic seulement : l'URI calculée doit EXACTEMENT correspondre à une
  // URI déclarée dans le dashboard Spotify (melodix://callback ou exp://…/--/…).
  React.useEffect(() => {
    logRedirectUri(redirectUri);
    spotifyLog('auth.config', {
      clientIdPresent: clientInfo.clientId !== '',
      source: clientInfo.source,
      cause: configured ? 'client-id-present' : 'CLIENT_ID_ABSENT',
    });
  }, [redirectUri, clientInfo, configured]);

  const [request, , promptAsync] = AuthSession.useAuthRequest(
    {
      clientId: clientInfo.clientId,
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
  const requestRef = React.useRef(request);
  requestRef.current = request;

  const resetError = React.useCallback(() => {
    setState((current) => (isIdle(current) ? current : { status: 'idle' }));
  }, []);

  /** Échange PKCE + profil /me, classifié. Commun canal natif + garde-fou. */
  const completeLogin = React.useCallback(
    async (code: string): Promise<void> => {
      const activeRequest = requestRef.current;
      if (!activeRequest?.codeVerifier) {
        // PKCE invalide : aucun verifier en mémoire (processus régénéré).
        spotifyLog('pkce.verifier-missing', { verifierPresent: false });
        setState({ status: 'error', outcome: { kind: 'callback-failed' } });
        return;
      }

      spotifyLog('auth.exchange.start', { status: 'in-flight' });
      setState({ status: 'exchanging' });

      const outcome = await redeemAuthorizationCode({
        code,
        codeVerifier: activeRequest.codeVerifier,
        redirectUri,
      });

      switch (outcome.kind) {
        case 'ok':
          break;
        case 'refused': {
          // invalid_client / invalid_grant = Spotify REFUSE la connexion.
          // 5xx / temporarily_unavailable = service injoignable → réseau.
          const serverSide =
            outcome.status >= 500 || outcome.errorCode === 'temporarily_unavailable';
          setState({
            status: 'error',
            outcome: { kind: serverSide ? 'network' : 'oauth-refused' },
          });
          return;
        }
        case 'network':
          setState({ status: 'error', outcome: { kind: 'network' } });
          return;
        case 'invalid-response':
        case 'save-failed':
        default:
          setState({ status: 'error', outcome: { kind: 'unknown' } });
          return;
      }

      // Token reçu : récupération du profil /me (classification propre).
      spotifyLog('auth.profile.fetch');
      try {
        const user = await getCurrentUser();
        applySpotifyUser(user);
        spotifyLog('auth.success', { scopesCount: SPOTIFY_SCOPES.length });
        setState({ status: 'idle' });
      } catch (error) {
        spotifyLog('me.failed', {
          cause:
            error && typeof error === 'object' && 'kind' in error
              ? String((error as { kind?: unknown }).kind)
              : 'exception',
        });
        const networkish =
          error &&
          typeof error === 'object' &&
          'kind' in error &&
          (error as { kind?: string }).kind !== 'unauthenticated';
        setState({
          status: 'error',
          outcome: { kind: networkish ? 'network' : 'unknown' },
        });
      }
    },
    [redirectUri, applySpotifyUser]
  );

  /**
   * Traite une URL de callback Spotify (query: code/state/error).
   * Utilisée par le garde-fou deep-link. true si la URL était notre callback.
   */
  const handleCallbackUrl = React.useCallback(
    (url: string): boolean => {
      if (!url || !url.startsWith(redirectUri)) {
        return false;
      }
      const activeRequest = requestRef.current;
      const params = readQueryParams(url);

      spotifyLog('callback.received', {
        codePresent: typeof params.code === 'string' && params.code.length > 0,
        statePresent: typeof params.state === 'string',
      });

      if (typeof params.error === 'string' && params.error.length > 0) {
        // Spotify refuse la connexion depuis la page authorize.
        spotifyLog('callback.error', {
          cause: sanitizeOAuthErrorCode(params.error),
        });
        fallbackUsedRef.current = true;
        void WebBrowser.dismissBrowser();
        setState({ status: 'error', outcome: { kind: 'oauth-refused' } });
        return true;
      }

      if (!params.code) {
        spotifyLog('callback.no-code', { codePresent: false });
        fallbackUsedRef.current = true;
        setState({ status: 'error', outcome: { kind: 'callback-failed' } });
        return true;
      }

      if (!activeRequest || params.state !== activeRequest.state) {
        // State invalide : callback écarté (attaque CSRF ou session croisée).
        spotifyLog('callback.state-invalid', {
          statePresent: typeof params.state === 'string',
        });
        fallbackUsedRef.current = true;
        setState({ status: 'error', outcome: { kind: 'callback-failed' } });
        return true;
      }

      fallbackUsedRef.current = true;
      void WebBrowser.dismissBrowser();
      spotifyLog('callback.fallback-exchange');
      void completeLogin(params.code);
      return true;
    },
    [redirectUri, completeLogin]
  );

  // Détection froid : l'app a été relancée PAR le deep-link (processus tué
  // pendant la custom tab). Aucun verifier → échange impossible : le coup est
  // journalisé et remonté en erreur propre (retry possible).
  React.useEffect(() => {
    let mounted = true;
    void Linking.getInitialURL().then((url) => {
      if (!mounted || !url || !url.startsWith(redirectUri)) {
        return;
      }
      const params = readQueryParams(url);
      spotifyLog('callback.unexpected', {
        codePresent: typeof params.code === 'string' && params.code.length > 0,
        cause: 'cold-start',
      });
      if (typeof params.code === 'string' && params.code.length > 0) {
        setState((current) =>
          current.status === 'idle'
            ? { status: 'error', outcome: { kind: 'callback-failed' } }
            : current
        );
      }
    });
    return () => {
      mounted = false;
    };
  }, [redirectUri]);

  // Garde-fou warm : si le canal promptAsync perd le retour (rare Android),
  // le listener reprend la main avec vérification du state.
  React.useEffect(() => {
    if (state.status !== 'requesting') {
      return;
    }
    const subscription = Linking.addEventListener('url', ({ url }) => {
      handleCallbackUrl(url);
    });
    return () => subscription.remove();
  }, [state.status, handleCallbackUrl]);

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
      setState({ status: 'error', outcome: { kind: 'unknown' } });
      return;
    }

    fallbackUsedRef.current = false;
    spotifyLog('auth.prompt.open', { status: 'opening' });
    setState({ status: 'requesting' });

    try {
      const result = await promptAsync();

      spotifyLog('auth.prompt.result', { resultType: result.type });

      // Le garde-fou a déjà piloté le flux : le canal natif est ignoré
      // (anti-double-échange — un code OAuth est à usage unique).
      if (fallbackUsedRef.current) {
        spotifyLog('auth.prompt.ignored', { cause: 'fallback-handled' });
        return;
      }

      if (result.type === 'cancel' || result.type === 'dismiss') {
        setState({ status: 'error', outcome: { kind: 'cancelled' } });
        return;
      }

      if (result.type === 'error') {
        // params.error n'est PAS un secret : code d'erreur OAuth RFC 6749.
        const cause = sanitizeOAuthErrorCode(result.params?.error);
        spotifyLog('auth.prompt.error', { cause });
        setState({ status: 'error', outcome: { kind: 'oauth-refused' } });
        return;
      }

      if (result.type !== 'success' || !result.params?.code) {
        spotifyLog('callback.no-code', {
          resultType: result.type,
          codePresent: false,
        });
        setState({ status: 'error', outcome: { kind: 'callback-failed' } });
        return;
      }

      if (!request.codeVerifier) {
        spotifyLog('pkce.verifier-missing', { verifierPresent: false });
        setState({ status: 'error', outcome: { kind: 'callback-failed' } });
        return;
      }

      await completeLogin(result.params.code);
    } catch (error) {
      // Détail technique uniquement en log développeur (cause, jamais de token).
      console.warn('Spotify login flow failed', error);
      spotifyLog('auth.exception');
      setState({ status: 'error', outcome: { kind: 'unknown' } });
    }
  }, [configured, promptAsync, request, completeLogin]);

  return {
    state,
    isBusy: state.status === 'requesting' || state.status === 'exchanging',
    isAuthRequestPending: !request,
    startLogin,
    resetError,
  };
};

export type { LoginOutcome, SpotifySession };
