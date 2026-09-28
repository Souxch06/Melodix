import * as React from 'react';

import { UserModel } from '@models';

export type UserDataProviderPropsType = {
  children: React.ReactNode;
};

export type UserContextType = {
  userData: UserModel;
  /**
   * Conservée pour compatibilité : sans compte, il n'y a plus rien à
   * recharger depuis un serveur — l'appel est un no-op async.
   */
  reloadUserData: () => Promise<void>;
};

/** Identifiant canonique du profil LOCAL (jamais envoyé nulle part). */
export const LOCAL_USER_ID = 'melodix-local-user';

/**
 * Melodix 3.0 : plus de compte. L'« utilisateur » est un profil local
 * synthétique dont l'id sert à comparer la propriété des playlists
 * (`ownerId === userData.id` côté écrans).
 */
const localUserData: UserModel = {
  id: LOCAL_USER_ID,
  type: 'user',
  displayName: 'Mélomane',
  imageURL: '',
};

export const UserDataContext = React.createContext<UserContextType>({
  userData: localUserData,
  reloadUserData: async () => {},
});

export const UserDataProvider = ({ children }: UserDataProviderPropsType) => {
  const value = React.useMemo<UserContextType>(
    () => ({
      userData: localUserData,
      reloadUserData: async () => {},
    }),
    []
  );

  return (
    <UserDataContext.Provider value={value}>
      {children}
    </UserDataContext.Provider>
  );
};

export const useUserData = (): UserContextType => {
  const context = React.useContext(UserDataContext);
  if (context === null) {
    throw new Error('Failed to access userData context: "context" is null');
  }

  return context;
};
