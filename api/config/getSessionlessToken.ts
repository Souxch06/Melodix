import { getSessionToken } from './getSessionToken';

/**
 * Token used for catalogue requests (albums, artists, playlists, search).
 *
 * The app used to request an app-only token with the client-credentials flow,
 * which meant shipping the Spotify client secret inside the app. Since the
 * switch to Authorization Code + PKCE, the signed-in user's token is used.
 */
export const getSessionlessToken = async (): Promise<{
  token: string | null;
  tokenExpiration: string | null;
}> => {
  const token = await getSessionToken();

  return { token, tokenExpiration: null };
};
