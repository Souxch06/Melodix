import * as React from 'react';
import { Linking } from 'react-native';
import {
  exchangeCodeAsync,
  makeRedirectUri,
  ResponseType,
  useAuthRequest,
} from 'expo-auth-session';
import Constants from 'expo-constants';
import { useRouter } from 'expo-router';

import {
  consumeSessionEnd,
  extractSpotifyToken,
  getBuildClientId,
  getClientId,
  isValidClientId,
  PASTED_TOKEN_LIFETIME_SECONDS,
  removeClientId,
  saveClientId,
  setSessionToken,
  SPOTIFY_TOKEN_PAGE_URL,
  TokenCheckResult,
  TokenParseResult,
  verifySpotifyToken,
} from '@api';
import {
  APP_SCHEME,
  AUTH_REDIRECT_PATH,
  AuthResponse,
  ExpoConfigType,
  SPOTIFY_SCOPES,
} from '@config';
import { Login } from '@components';
import type { LoginMethod } from '@components';
import { useUserData } from '@context';
import { translations } from '@data';

const TOKEN_PARSE_ERRORS: Record<
  Extract<TokenParseResult, { ok: false }>['reason'],
  string
> = {
  empty: translations.tokenEmpty,
  placeholder: translations.tokenPlaceholderError,
  malformed: translations.tokenMalformed,
};

const TOKEN_CHECK_ERRORS: Record<Exclude<TokenCheckResult, 'valid'>, string> = {
  rejected: translations.tokenRejected,
  forbidden: translations.tokenForbidden,
  unavailable: translations.tokenUnavailable,
  network: translations.tokenNetwork,
};

const OAUTH_CHECK_ERRORS: Record<Exclude<TokenCheckResult, 'valid'>, string> = {
  ...TOKEN_CHECK_ERRORS,
  rejected: translations.loginError,
  forbidden: translations.oauthForbidden,
};

export const LoginScreen = () => {
  const router = useRouter();
  const { reloadUserData } = useUserData();

  const { authorizationEndpoint, tokenEndpoint } = (
    Constants.expoConfig as ExpoConfigType
  ).extra;

  const discovery = React.useMemo(
    () => ({ authorizationEndpoint, tokenEndpoint }),
    [authorizationEndpoint, tokenEndpoint]
  );

  // melodix://callback in the installed app, exp://…/--/callback in Expo Go.
  const redirectUri = React.useMemo(
    () => makeRedirectUri({ scheme: APP_SCHEME, path: AUTH_REDIRECT_PATH }),
    []
  );

  const buildClientId = getBuildClientId();

  // Quick sign-in with a pasted token by default: no Spotify app to create.
  // A Client ID baked into the build (or saved earlier) enables the permanent
  // "Sign in with Spotify" button instead.
  const [method, setMethod] = React.useState<LoginMethod>(
    buildClientId ? 'spotify' : 'token'
  );
  // null while loading, '' when the user still has to enter a Client ID.
  const [clientId, setClientId] = React.useState<string | null>(null);
  const [errorMessage, setErrorMessage] = React.useState<string | null>(null);
  const [infoMessage] = React.useState<string | null>(() => {
    const sessionEnd = consumeSessionEnd();

    if (!sessionEnd) {
      return null;
    }

    return sessionEnd.mode === 'token'
      ? translations.tokenExpired
      : translations.sessionExpired;
  });
  const [isSigningIn, setIsSigningIn] = React.useState(false);
  const [isCheckingToken, setIsCheckingToken] = React.useState(false);
  const canChangeClientId = !buildClientId;

  React.useEffect(() => {
    getClientId().then((storedClientId) => {
      setClientId(storedClientId);

      if (storedClientId) {
        setMethod('spotify');
      }
    });
  }, []);

  // Authorization Code + PKCE (the implicit grant was removed by Spotify on
  // 27 November 2025). No client secret is needed.
  const [request, , promptAsync] = useAuthRequest(
    {
      clientId: clientId ?? '',
      scopes: SPOTIFY_SCOPES,
      responseType: ResponseType.Code,
      usePKCE: true,
      redirectUri,
    },
    discovery
  );

  const handleChangeMethod = (nextMethod: LoginMethod) => {
    setErrorMessage(null);
    setMethod(nextMethod);
  };

  const handleOpenTokenPage = () => {
    Linking.openURL(SPOTIFY_TOKEN_PAGE_URL).catch((error) =>
      console.error('Failed to open developer.spotify.com', error)
    );
  };

  // Same system as the code tutorial of developer.spotify.com: the pasted
  // access token is sent as "Authorization: Bearer <token>".
  const handleSubmitToken = async (value: string) => {
    const parsedToken = extractSpotifyToken(value);

    if (!parsedToken.ok) {
      setErrorMessage(TOKEN_PARSE_ERRORS[parsedToken.reason]);
      return;
    }

    setErrorMessage(null);
    setIsCheckingToken(true);

    try {
      const check = await verifySpotifyToken(parsedToken.token);

      if (check !== 'valid') {
        setErrorMessage(TOKEN_CHECK_ERRORS[check]);
        return;
      }

      await setSessionToken(
        parsedToken.token,
        undefined,
        PASTED_TOKEN_LIFETIME_SECONDS,
        'token'
      );
      await reloadUserData();

      router.replace('/home');
    } catch (error) {
      console.error(error);
      setErrorMessage(translations.tokenUnavailable);
    } finally {
      setIsCheckingToken(false);
    }
  };

  const handleSubmitClientId = async (value: string) => {
    if (!isValidClientId(value)) {
      setErrorMessage(translations.clientIdInvalid);
      return;
    }

    await saveClientId(value);
    setErrorMessage(null);
    setClientId(value.trim());
  };

  const handleChangeClientId = async () => {
    await removeClientId();
    setErrorMessage(null);
    setClientId('');
  };

  const handlePress = async () => {
    if (!request || !clientId) {
      return;
    }

    setErrorMessage(null);
    setIsSigningIn(true);

    try {
      const result = await promptAsync();

      if (result.type === AuthResponse.ERROR) {
        setErrorMessage(translations.loginError);
        return;
      }

      if (result.type !== AuthResponse.SUCCESS) {
        return;
      }

      const tokens = await exchangeCodeAsync(
        {
          clientId,
          code: result.params.code,
          redirectUri,
          extraParams: { code_verifier: request.codeVerifier ?? '' },
        },
        discovery
      );

      // Spotify lets any account sign in, but answers 403 to accounts missing
      // from the app's "User Management" list, or when the owner of the
      // Spotify app has no Premium subscription.
      const check = await verifySpotifyToken(tokens.accessToken);

      if (check !== 'valid') {
        setErrorMessage(OAUTH_CHECK_ERRORS[check]);
        return;
      }

      await setSessionToken(
        tokens.accessToken,
        tokens.refreshToken,
        tokens.expiresIn ?? 3600,
        'oauth'
      );
      await reloadUserData();

      router.replace('/home');
    } catch (error) {
      console.error(error);
      setErrorMessage(translations.loginError);
    } finally {
      setIsSigningIn(false);
    }
  };

  return (
    <Login
      method={method}
      onChangeMethod={handleChangeMethod}
      onSubmitToken={handleSubmitToken}
      onOpenTokenPage={handleOpenTokenPage}
      isCheckingToken={isCheckingToken}
      handlePress={handlePress}
      isPressableDisabled={!request || !clientId || isSigningIn}
      isLoading={isSigningIn}
      needsClientId={clientId === ''}
      redirectUri={redirectUri}
      onSubmitClientId={handleSubmitClientId}
      onChangeClientId={canChangeClientId ? handleChangeClientId : undefined}
      errorMessage={errorMessage}
      infoMessage={infoMessage}
    />
  );
};
