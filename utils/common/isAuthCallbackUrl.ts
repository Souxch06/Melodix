import { AUTH_REDIRECT_PATH } from '../../config/constants';

// melodix://callback?… in the installed app (also melodix:///callback),
// exp://192.168.1.20:8081/--/callback?… in Expo Go. Legacy deep links from the
// removed Spotify sign-in are simply ignored (no login screen anymore).
const AUTH_CALLBACK_URL = new RegExp(
  `^[a-z][a-z0-9+.-]*://(?:[^/?#]*/--/|/)?${AUTH_REDIRECT_PATH}(?:[/?#]|$)`,
  'i'
);

/** True for the legacy auth callback link, which the app now ignores. */
export const isAuthCallbackUrl = (url: string | null | undefined) =>
  typeof url === 'string' && AUTH_CALLBACK_URL.test(url);
