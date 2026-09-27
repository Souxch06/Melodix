import { AUTH_REDIRECT_PATH } from '../../config/constants';

// melodix://callback?code=… in the installed app (also melodix:///callback),
// exp://192.168.1.20:8081/--/callback?code=… in Expo Go.
const AUTH_CALLBACK_URL = new RegExp(
  `^[a-z][a-z0-9+.-]*://(?:[^/?#]*/--/|/)?${AUTH_REDIRECT_PATH}(?:[/?#]|$)`,
  'i'
);

/**
 * True for the link Spotify opens after "Sign in with Spotify". That link is
 * read by expo-auth-session, not by the router.
 */
export const isAuthCallbackUrl = (url: string | null | undefined) =>
  typeof url === 'string' && AUTH_CALLBACK_URL.test(url);
