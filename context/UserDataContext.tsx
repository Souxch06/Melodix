/**
 * Données de l'utilisateur courant, avec ou sans compte.
 *
 * Trois états :
 * - 'local'   : aucun compte Spotify connecté (mode historique 3.0, profil
 *               local synthétique — favoris et historique restent 100 % local) ;
 * - 'spotify' : compte connecté via OAuth PKCE (profil Spotify : nom, photo) ;
 * - 'loading' : restauration de la session en cours au démarrage.
 *
 * La session (tokens) est gérée par services/spotify/session (Keystore
 * chiffré). La déconnexion supprime tokens + cache playlists ; conservés :
 * favoris locaux, historique d'écoute, préférences (volume…).
 */
import * as React from 'react';

import { UserModel } from '@models';
import { clearSession, loadSession } from '@services';

import { getCurrentUser, invalidateUserPlaylistsCache } from '@api';

export type UserDataProviderPropsType = {
  children: React.ReactNode;
};

export type SessionStatus = 'loading' | 'local' | 'spotify';

export type UserContextType = {
  userData: UserModel;
  sessionStatus: SessionStatus;
  /** Rétention conservée : re-hydrate le profil (local → no-op de fait). */
  reloadUserData: () => Promise<void>;
  /** Le login a abouti : mémorise le profil et reflète 'spotify'. */
  applySpotifyUser: (user: UserModel) => void;
  /** Déconnexion complète : purge session + caches liés au compte. */
  signOut: () => Promise<void>;
};

/** Identifiant canonique du profil LOCAL (jamais envoyé nulle part). */
export const LOCAL_USER_ID = 'melodix-local-user';

const localUserData: UserModel = {
  id: LOCAL_USER_ID,
  type: 'user',
  displayName: 'Mélomane',
  imageURL: '',
};

export const UserDataContext = React.createContext<UserContextType>({
  userData: localUserData,
  sessionStatus: 'loading',
  reloadUserData: async () => {},
  applySpotifyUser: () => {},
  signOut: async () => {},
});

export const UserDataProvider = ({ children }: UserDataProviderPropsType) => {
  const [status, setStatus] = React.useState<SessionStatus>('loading');
  const [user, setUser] = React.useState<UserModel>(localUserData);

  // Restauration au démarrage : une session persistante doit éviter de
  // repasser par l'écran de connexion à chaque lancement.
  React.useEffect(() => {
    let cancelled = false;

    (async () => {
      const session = await loadSession();

      if (cancelled) {
        return;
      }

      if (!session) {
        setStatus('local');
        return;
      }

      try {
        setStatus('spotify');
        const freshUser = await getCurrentUser();
        if (!cancelled) {
          setUser(freshUser);
        }
      } catch (error) {
        // Une session présente mais plus valide (offline, révoquée) :
        // l'utilisateur reste connecté côté stockage et verra les erreurs
        // propres au moment de la requête suivante ; on ne le déconnecte pas.
        console.warn('Initial Spotify profile refresh failed', error);
      }
    })();

    return () => {
      cancelled = true;
    };
  }, []);

  const applySpotifyUser = React.useCallback((spotifyUser: UserModel) => {
    setUser(spotifyUser);
    setStatus('spotify');
  }, []);

  const signOut = React.useCallback(async () => {
    await clearSession();
    await invalidateUserPlaylistsCache();
    setUser(localUserData);
    setStatus('local');
  }, []);

  const reloadUserData = React.useCallback(async () => {
    if (status !== 'spotify') {
      return;
    }
    try {
      setUser(await getCurrentUser());
    } catch (error) {
      console.warn('Profile refresh failed', error);
    }
  }, [status]);

  const value = React.useMemo<UserContextType>(
    () => ({
      userData: user,
      sessionStatus: status,
      reloadUserData,
      applySpotifyUser,
      signOut,
    }),
    [user, status, reloadUserData, applySpotifyUser, signOut]
  );

  return (
    <UserDataContext.Provider value={value}>
      {children}
    </UserDataContext.Provider>
  );
};

/** Accès aux informations/état du compte (voir usePlayer pour le pattern). */
export const useUserData = (): UserContextType =>
  React.useContext(UserDataContext);
