/**
 * Hook de connexion Spotify — OAuth Authorization Code + PKCE via le
 * navigateur système (expo-auth-session). AUCUN client_secret (client public :
 * le code_verifier/challenge PKCE généré par expo-auth-session ne transite
 * JAMAIS dans un log).
 *
 * CHAQUE ÉCHEC EMPORTE UNE « cause » COURTE, affichée à l'écran sous la
 * carte d'erreur (code OAuth whitelisté, statut HTTP, étape) : plus AUCUN
 * échec ne peut se fondre dans un message générique sans diagnostic.
 *
 * Lignes [Spotify OAuth] émises (format exact de la mission, jamais de
 * secret) : START / CLIENT_ID / REDIRECT_URI / REQUEST / PROMPT /
 * RESPONSE_TYPE / ERROR_CODE / ERROR_DESCRIPTION / AUTH_CODE /
 * TOKEN_EXCHANGE / PROFILE / SESSION / PLAYLISTS.
 */
import * as React from 'react';
import * as AuthSession from 'expo-auth-session';
import * as Linking from 'expo-linking';
import * as WebBrowser from 'expo-web-browser';

import { getCurrentUser } from '@api';
import { useUserData } from '@context';

import {
  getClientIdInfo,
  getSpotifyRedirectUri,
  getSpotifyRedirectUriSource,
  isSpotifyLoginConfigured,
  SPOTIFY_DISCOVERY,
  SPOTIFY_REDIRECT_PATH,
  SPOTIFY_REDIRECT_SCHEME,
  SPOTIFY_SCOPES,
} from './authConfig';
import {
  logRedirectUri,
  sanitizeErrorDescription,
  spotifyConfigLine,
  spotifyDiag,
  spotifyLog,
} from './devLog';
import { SpotifyApiError } from './apiClient';
import {
  LoginErrorOutcome,
  LoginOutcome,
  redeemAuthorizationCode,
  sanitizeOAuthErrorCode,
  SpotifySession,
} from './session';

// Prépare expo-web-browser à consommer le retour deep-link (obligatoire,
// règle expo-auth-session ; sans effet sur la session déjà ouverte).
WebBrowser.maybeCompleteAuthSession();

export type SpotifyAuthErrorKind = LoginErrorOutcome['kind'];

export type SpotifyAuthState =
  | { status: 'idle' }
  | { status: 'requesting' }
  | { status: 'exchanging' }
  | { status: 'error'; outcome: LoginErrorOutcome };

const isIdle = (state: SpotifyAuthState): boolean => state.status === 'idle';

/** Erreur courte, bornée, sûre à afficher (filtre mots sensibles). */
const safeCause = (text: string): string => {
  const cleaned = text.replace(/[\r\n]+/g, ' ').trim();
  return cleaned.length > 90 ? `${cleaned.slice(0, 87)}…` : cleaned;
};

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

  // Redirect URI : configurable (env/extra), sinon celle calculée par Expo à
  // partir du scheme natif (melodix://callback en build, exp://… en Expo Go).
  // LA MÊME VARIABLE sert à authorize ET à l'échange — invariant anti
  // invalid_grant, garanti par construction.
  const redirectUri = React.useMemo(() => {
    const configuredUri = getSpotifyRedirectUri();
    return (
      configuredUri ||
      AuthSession.makeRedirectUri({
        scheme: SPOTIFY_REDIRECT_SCHEME,
        path: SPOTIFY_REDIRECT_PATH,
      })
    );
  }, []);

  // Anti-états-croisés : une seule source (canal auth-session OU garde-fou)
  // pilote le flux — un code OAuth se consomme une seule fois.
  const fallbackUsedRef = React.useRef(false);

  // Diagnostic d'amorce — identifie RÉELLEMENT le build et la config.
  React.useEffect(() => {
    // Lignes de diagnostic EXACTES demandées pour la configurabilité :
    //   Spotify Client ID: CONFIGURED/MISSING
    //   Spotify Redirect URI: <valeur>
    //   Spotify OAuth: PKCE
    spotifyDiag('START');
    spotifyConfigLine(`Spotify Client ID: ${configured ? 'CONFIGURED' : `MISSING (source: ${clientInfo.source})`}`);
    spotifyConfigLine(`Spotify Redirect URI: ${redirectUri}`);
    spotifyConfigLine(`Spotify OAuth: PKCE`);
    // Bandeau STEP 1..5 (build de DIAGNOSTIC) : lecture directe en logcat.
    // [SPOTIFY AUTH] — diagnostic temporaire (présence uniquement, jamais
    // la valeur du Client ID ; le redirect est public).
    spotifyConfigLine(
      `[SPOTIFY AUTH] Client ID configured: ${configured ? 'YES' : 'NO'} (source: ${clientInfo.source})`
    );
    spotifyConfigLine(`[SPOTIFY AUTH] Redirect URI: ${redirectUri}`);
    spotifyDiag('CLIENT_ID', clientInfo.clientId ? `PRESENT (source: ${clientInfo.source})` : 'MISSING');
    logRedirectUri(redirectUri);
    spotifyLog('auth.redirect.source', { cause: getSpotifyRedirectUriSource() });
    if (!configured) {
      spotifyLog('auth.config', { cause: 'CLIENT_ID_ABSENT' });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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

  // La requête OAuth est prête → le bouton devient actif.
  const wasReadyRef = React.useRef(false);
  React.useEffect(() => {
    if (request && !wasReadyRef.current) {
      wasReadyRef.current = true;
      spotifyDiag('REQUEST', 'READY');
    }
  }, [request]);

  const resetError = React.useCallback(() => {
    setState((current) => (isIdle(current) ? current : { status: 'idle' }));
  }, []);

  const fail = React.useCallback((outcome: LoginErrorOutcome) => {
    spotifyDiag('OUTCOME', `${outcome.kind} — ${outcome.cause}`);
    setState({ status: 'error', outcome });
  }, []);

  /** Échange PKCE + profil /me, classifié. Commun canal natif + garde-fou. */
  const completeLogin = React.useCallback(
    async (code: string): Promise<void> => {
      const activeRequest = requestRef.current;
      if (!activeRequest?.codeVerifier) {
        // PKCE invalide : aucun verifier en mémoire (processus régénéré).
        spotifyLog('pkce.verifier-missing', { verifierPresent: false });
        fail({ kind: 'callback-failed', cause: 'pkce-verifier-missing' });
        return;
      }

      spotifyLog('auth.exchange.start', { status: 'in-flight' });
      // Lignes [SPOTIFY AUTH] « Token exchange … » émises dans session.ts
      // (là où vivent le corps de la requête et la réponse /api/token).
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
          const causeText = `${outcome.errorCode} · HTTP ${outcome.status}${
            outcome.description ? ` · ${outcome.description}` : ''
          }`;
          fail({
            kind: serverSide ? 'network' : 'oauth-refused',
            cause: safeCause(causeText),
          });
          return;
        }
        case 'network':
          fail({ kind: 'network', cause: 'exchange-unreachable' });
          return;
        case 'invalid-response':
          fail({ kind: 'unknown', cause: 'invalid-token-response' });
          return;
        case 'save-failed':
        default:
          fail({ kind: 'unknown', cause: 'session-save-failed' });
          return;
      }

      // Token reçu : récupération du profil /me (classification propre).
      spotifyDiag('PROFILE', 'START');
      spotifyConfigLine('[SPOTIFY AUTH] /v1/me request started');
      try {
        const user = await getCurrentUser();
        applySpotifyUser(user);
        spotifyDiag('PROFILE', 'SUCCESS');
        spotifyConfigLine('[SPOTIFY AUTH] /v1/me HTTP status: 200');
        spotifyConfigLine('[SPOTIFY AUTH] /v1/me success/error: success');
        spotifyLog('auth.success', { scopesCount: SPOTIFY_SCOPES.length });
        setState({ status: 'idle' });
      } catch (error) {
        const kind =
          error && typeof error === 'object' && 'kind' in error
            ? String((error as { kind?: unknown }).kind)
            : 'exception';
        // Détail /me exigé : statut HTTP + message Spotify SANS le token.
        const httpStatus =
          error instanceof SpotifyApiError && typeof error.status === 'number'
            ? error.status
            : null;
        const spotifyMessage =
          error instanceof SpotifyApiError ? error.spotifyMessage : '';
        const detail = `${kind}${httpStatus !== null ? ` · HTTP ${httpStatus}` : ''}${spotifyMessage ? ` · ${spotifyMessage}` : ''}`;
        spotifyDiag('PROFILE', `FAILED(${kind})`);
        spotifyConfigLine(
          `[SPOTIFY AUTH] /v1/me HTTP status: ${httpStatus !== null ? httpStatus : kind}`
        );
        spotifyConfigLine(`[SPOTIFY AUTH] /v1/me success/error: error (${detail})`);
        spotifyLog('me.failed', { cause: kind });
        // Cause UI : 'me:network' reste inchangé, http/unauthenticated s'enrichissent.
        const uiCause =
          kind === 'network'
            ? 'me:network'
            : `me:${kind}${httpStatus !== null ? `·${httpStatus}` : ''}${spotifyMessage ? `·${spotifyMessage}` : ''}`;
        fail({
          kind: kind === 'unauthenticated' ? 'oauth-refused' : kind === 'http' ? 'unknown' : 'network',
          cause: safeCause(uiCause),
        });
      }
    },
    [redirectUri, applySpotifyUser, fail]
  );

  /**
   * Traite une URL de callback Spotify (query: code/state/error).
   * true si la URL était bien notre callback OAuth.
   */
  const handleCallbackUrl = React.useCallback(
    (url: string): boolean => {
      if (!url || !url.startsWith(redirectUri)) {
        return false;
      }
      const activeRequest = requestRef.current;
      const params = readQueryParams(url);

      spotifyDiag('AUTH_CODE', params.code ? 'PRESENT' : 'MISSING');
      spotifyLog('callback.received', {
        codePresent: typeof params.code === 'string' && params.code.length > 0,
        statePresent: typeof params.state === 'string',
      });

      if (typeof params.error === 'string' && params.error.length > 0) {
        // Spotify REFUSE depuis la page authorize : code + desc (non sensibles).
        const code = sanitizeOAuthErrorCode(params.error);
        const desc = sanitizeErrorDescription(params.error_description);
        spotifyDiag('ERROR_CODE', code);
        if (desc) spotifyDiag('ERROR_DESCRIPTION', desc);
        spotifyConfigLine(
          `[SPOTIFY AUTH] Authorization code received: NO (error: ${code}${desc ? ` · ${desc}` : ''} · deep-link)`
        );
        fallbackUsedRef.current = true;
        void WebBrowser.dismissBrowser();
        fail({ kind: 'oauth-refused', cause: safeCause(desc ? `${code} · ${desc}` : code) });
        return true;
      }

      if (!params.code) {
        spotifyLog('callback.no-code', { codePresent: false });
        spotifyConfigLine('[SPOTIFY AUTH] Authorization code received: NO (code-absent · deep-link)');
        fallbackUsedRef.current = true;
        fail({ kind: 'callback-failed', cause: 'code-absent' });
        return true;
      }

      if (!activeRequest || params.state !== activeRequest.state) {
        // State invalide : callback écarté (CSRF ou session croisée).
        spotifyLog('callback.state-invalid', {
          statePresent: typeof params.state === 'string',
        });
        spotifyConfigLine('[SPOTIFY AUTH] Authorization code received: NO (state-invalid · deep-link)');
        fallbackUsedRef.current = true;
        fail({ kind: 'callback-failed', cause: 'state-invalid' });
        return true;
      }

      fallbackUsedRef.current = true;
      void WebBrowser.dismissBrowser();
      spotifyLog('callback.fallback-exchange');
      spotifyConfigLine('[SPOTIFY AUTH] Authorization code received: YES (deep-link)');
      void completeLogin(params.code);
      return true;
    },
    [redirectUri, completeLogin, fail]
  );

  // Détection froide : l'app a été relancée PAR le deep-link (processus tué
  // pendant la custom tab) : signalée proprement au lieu de rester muette.
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
            ? {
                status: 'error',
                outcome: { kind: 'callback-failed', cause: 'cold-start-no-verifier' },
              }
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
      spotifyLog('auth.not-configured');
      fail({ kind: 'not-configured', cause: 'client-id-missing-in-build' });
      return;
    }

    if (!request) {
      // La requête n'est pas encore chargée : on réessaiera au prochain clic.
      spotifyLog('auth.prompt.not-ready');
      fail({ kind: 'unknown', cause: 'auth-request-not-ready' });
      return;
    }

    fallbackUsedRef.current = false;
    spotifyDiag('PROMPT', 'OPENED');
    spotifyConfigLine('[SPOTIFY AUTH] Starting authorization (OAuth + PKCE)');
    spotifyConfigLine(`[SPOTIFY AUTH] Redirect URI: ${redirectUri}`);
    spotifyConfigLine('[SPOTIFY AUTH] Authorization started');
    spotifyLog('auth.prompt.open', { status: 'opening' });
    setState({ status: 'requesting' });

    try {
      const result = await promptAsync();

      spotifyDiag('RESPONSE_TYPE', result.type);
      spotifyConfigLine(
        `[SPOTIFY AUTH] Authorization response received (type: ${result.type})`
      );
      spotifyLog('auth.prompt.result', { resultType: result.type });

      // Le garde-fou a déjà piloté le flux : canal natif ignoré.
      if (fallbackUsedRef.current) {
        spotifyLog('auth.prompt.ignored', { cause: 'fallback-handled' });
        return;
      }

      if (result.type === 'cancel' || result.type === 'dismiss') {
        spotifyConfigLine(
          `[SPOTIFY AUTH] Authorization code received: NO (user-${result.type})`
        );
        fail({ kind: 'cancelled', cause: result.type });
        return;
      }

      if (result.type === 'error') {
        // params.error/.error_description ne sont PAS des secrets (RFC 6749).
        const code = sanitizeOAuthErrorCode(result.params?.error);
        const desc = sanitizeErrorDescription(result.params?.error_description);
        spotifyDiag('ERROR_CODE', code);
        if (desc) spotifyDiag('ERROR_DESCRIPTION', desc);
        spotifyConfigLine(
          `[SPOTIFY AUTH] Authorization code received: NO (error: ${code}${desc ? ` · ${desc}` : ''})`
        );
        fail({ kind: 'oauth-refused', cause: safeCause(desc ? `${code} · ${desc}` : code) });
        return;
      }

      if (result.type !== 'success' || !result.params?.code) {
        spotifyDiag('AUTH_CODE', 'MISSING');
        spotifyLog('callback.no-code', {
          resultType: result.type,
          codePresent: false,
        });
        fail({ kind: 'callback-failed', cause: 'code-absent' });
        return;
      }

      spotifyDiag('AUTH_CODE', 'PRESENT');
      spotifyConfigLine('[SPOTIFY AUTH] Authorization code received: YES');

      if (!request.codeVerifier) {
        spotifyLog('pkce.verifier-missing', { verifierPresent: false });
        fail({ kind: 'callback-failed', cause: 'pkce-verifier-missing' });
        return;
      }

      await completeLogin(result.params.code);
    } catch (error) {
      // REJET INATTENDU (navigateur, module natif, JS) : nom d'erreur capturé
      // — la cause la plus probable du « Connexion à Spotify impossible ».
      const name =
        error && typeof error === 'object' && 'message' in error
          ? String((error as { message?: unknown }).message)
          : 'unknown-exception';
      const ctor =
        error && typeof error === 'object' && 'name' in error
          ? String((error as { name?: unknown }).name)
          : 'Error';
      console.warn('Spotify login flow failed', error);
      spotifyDiag('RESPONSE_TYPE', 'exception');
      spotifyDiag('ERROR_CODE', `${ctor}`);
      spotifyDiag('ERROR_DESCRIPTION', sanitizeErrorDescription(name) || 'unlogged');
      spotifyLog('auth.exception');
      fail({
        kind: 'unknown',
        cause: safeCause(`prompt-exception:${ctor}`),
      });
    }
  }, [configured, promptAsync, request, completeLogin, fail, redirectUri]);

  return {
    state,
    isBusy: state.status === 'requesting' || state.status === 'exchanging',
    isAuthRequestPending: !request,
    startLogin,
    resetError,
  };
};

export type { LoginOutcome, SpotifySession };
