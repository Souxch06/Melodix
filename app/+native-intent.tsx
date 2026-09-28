import { isAuthCallbackUrl } from '../utils/common/isAuthCallbackUrl';

/**
 * Links opened by the system.
 *
 * Legacy Spotify sign-in deep links (melodix://callback?code=…) are ignored
 * since Melodix 3.0 has no login flow: router must not open an empty
 * "not found" page for them. When the app was closed in the meantime, it
 * simply starts on its first screen.
 */
export function redirectSystemPath({
  path,
}: {
  path: string;
  initial: boolean;
}): string | null {
  return isAuthCallbackUrl(path) ? null : path;
}
