import * as React from 'react';
import {
  exchangeCodeAsync,
  makeRedirectUri,
  ResponseType,
  useAuthRequest,
} from 'expo-auth-session';
import Constants from 'expo-constants';
import { useRouter } from 'expo-router';

import {
  getBuildClientId,
  getClientId,
  isValidClientId,
  removeClientId,
  saveClientId,
  setSessionToken,
} from '@api';
import {
  APP_SCHEME,
  AUTH_REDIRECT_PATH,
  AuthResponse,
  ExpoConfigType,
  SPOTIFY_SCOPES,
} from '@config';
import { Login } from '@components';
import { translations } from '@data';

export const LoginScreen = () => {
  const router = useRouter();

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

  // null while loading, '' when the user still has to enter a Client ID.
  const [clientId, setClientId] = React.useState<string | null>(null);
  const [errorMessage, setErrorMessage] = React.useState<string | null>(null);
  const [isSigningIn, setIsSigningIn] = React.useState(false);
  const canChangeClientId = !getBuildClientId();

  React.useEffect(() => {
    getClientId().then(setClientId);
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

      await setSessionToken(
        tokens.accessToken,
        tokens.refreshToken,
        tokens.expiresIn ?? 3600
      );

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
      handlePress={handlePress}
      isPressableDisabled={!request || !clientId || isSigningIn}
      isLoading={isSigningIn}
      needsClientId={clientId === ''}
      redirectUri={redirectUri}
      onSubmitClientId={handleSubmitClientId}
      onChangeClientId={canChangeClientId ? handleChangeClientId : undefined}
      errorMessage={errorMessage}
    />
  );
};
