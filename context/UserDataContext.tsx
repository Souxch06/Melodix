import * as React from 'react';
import { router } from 'expo-router';

import { UserModel } from '@models';
import {
  clearSessionToken,
  consumeSessionEnd,
  getStoredSession,
  getUser,
  installSessionGuard,
} from '@api';

export type UserDataProviderPropsType = {
  children: React.ReactNode;
};

export type UserContextType = {
  userData: UserModel;
  // Loads the profile of the signed-in user (call it right after signing in).
  reloadUserData: () => Promise<void>;
  signOut: () => Promise<void>;
};

const defaultUserData: UserModel = {
  id: '',
  type: 'user',
  displayName: '',
  imageURL: '',
};

export const UserDataContext = React.createContext<UserContextType>({
  userData: defaultUserData,
  reloadUserData: async () => {},
  signOut: async () => {},
});

export const UserDataProvider = ({ children }: UserDataProviderPropsType) => {
  const [userData, setUserData] = React.useState<UserModel>(defaultUserData);

  const reloadUserData = React.useCallback(async () => {
    try {
      // Nobody is signed in yet: don't call Spotify without a token.
      if (!(await getStoredSession())) {
        setUserData(defaultUserData);
        return;
      }

      setUserData(await getUser());
    } catch (error) {
      console.error('Error loading the Spotify profile', error);
    }
  }, []);

  const signOut = React.useCallback(async () => {
    await clearSessionToken();
    consumeSessionEnd();
    setUserData(defaultUserData);
    router.replace('/login');
  }, []);

  React.useEffect(() => {
    reloadUserData();
  }, [reloadUserData]);

  // A pasted token only lasts one hour: when Spotify refuses it, go back to
  // the login screen, which explains what happened.
  React.useEffect(
    () =>
      installSessionGuard(() => {
        setUserData(defaultUserData);
        router.replace('/login');
      }),
    []
  );

  const value = React.useMemo(
    () => ({ userData, reloadUserData, signOut }),
    [userData, reloadUserData, signOut]
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
