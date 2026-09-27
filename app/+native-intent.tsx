import { isAuthCallbackUrl } from '../utils/common/isAuthCallbackUrl';

/**
 * Links opened by the system.
 *
 * After "Sign in with Spotify", Spotify sends the user back to
 * melodix://callback?code=…. expo-auth-session reads that link itself: the
 * router must ignore it, otherwise it would open an empty "not found" page on
 * top of the login screen. When the app was closed in the meantime, it simply
 * starts on its first screen.
 */
export function redirectSystemPath({
  path,
}: {
  path: string;
  initial: boolean;
}): string | null {
  return isAuthCallbackUrl(path) ? null : path;
}
