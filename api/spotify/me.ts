/**
 * Profil Spotify du compte connecté (GET /v1/me).
 * Données personnelles AUTORISÉES par l'utilisateur via OAuth PKCE.
 */
import { spotifyApiGet } from '@services';

import { UserModel } from '@models';

type SpotifyUserRaw = {
  id?: string;
  display_name?: string | null;
  email?: string | null; // non utilisé (scope non demandé)
  images?: { url?: string }[] | null;
};

/** Profil du compte connecté (nom d'affichage, photo ; email jamais demandé). */
export const getCurrentUser = async (): Promise<UserModel> => {
  const raw = await spotifyApiGet<SpotifyUserRaw>('/me');

  if (!raw.id) {
    throw new Error('Spotify a renvoyé un profil sans identifiant.');
  }

  return {
    id: raw.id,
    type: 'user',
    displayName: raw.display_name || raw.id,
    imageURL: raw.images?.[0]?.url ?? '',
  };
};
