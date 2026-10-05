/**
 * ONGLETS — restauration d'identité Spotify.
 *
 * Contrat vérifié ici (régression d'origine : un échec temporaire de
 * `getCurrentUser` renvoyait l'utilisateur vers l'écran de connexion) :
 * - 'loading' (aucune session lue, ou profil pas encore vérifié) → écran
 *   neutre, aucune navigation ;
 * - 'spotify-unverified' (session présente, profil indisponible) → état
 *   explicite + réessai, JAMAIS de redirection vers /login (la session
 *   existe) et jamais les onglets avec une identité inconnue ;
 * - 'local' (vraiment aucun compte) → redirection vers la connexion.
 */
import * as React from 'react';

import { fireEvent, render, screen } from '@testing-library/react-native';

import Layout from '../_layout';

const mockState: {
  sessionStatus: 'loading' | 'local' | 'spotify' | 'spotify-unverified';
  reloadUserData: jest.Mock;
} = {
  sessionStatus: 'spotify',
  reloadUserData: jest.fn(async () => {}),
};

const redirects: unknown[] = [];

jest.mock('@context', () => ({
  useUserData: () => ({
    sessionStatus: mockState.sessionStatus,
    reloadUserData: mockState.reloadUserData,
  }),
}));

jest.mock('@hooks', () => ({
  useKeyboardVisible: () => false,
}));

jest.mock('@components', () => {
  const ReactActual = jest.requireActual('react');
  const { Pressable: PressableActual, Text: TextActual } =
    jest.requireActual('react-native');

  return {
    MiniPlayer: () => null,
    ErrorCard: (props: {
      testID?: string;
      retryTestID?: string;
      onRetry: () => void;
    }) =>
      ReactActual.createElement(
        PressableActual,
        { testID: props.retryTestID, onPress: props.onRetry },
        ReactActual.createElement(TextActual, { testID: props.testID })
      ),
  };
});

jest.mock('@navigators', () => ({ BottomTabBar: () => null }));

jest.mock('expo-router', () => {
  const ReactActual = jest.requireActual('react');
  const { Text: TextActual } = jest.requireActual('react-native');

  const TabsMock = Object.assign(
    (props: { children?: React.ReactNode }) =>
      ReactActual.createElement(ReactActual.Fragment, null, props.children),
    { Screen: () => null }
  );

  return {
    Tabs: TabsMock,
    Redirect: (props: unknown) => {
      redirects.push(props);
      return ReactActual.createElement(TextActual, { testID: 'redirect' });
    },
  };
});

beforeEach(() => {
  jest.clearAllMocks();
  redirects.length = 0;
  mockState.sessionStatus = 'spotify';
});

describe('Onglets — restauration d’identité', () => {
  it("'loading' (profil pas encore vérifié) : écran neutre, aucune redirection", () => {
    mockState.sessionStatus = 'loading';

    render(<Layout />);

    expect(redirects).toHaveLength(0);
    expect(screen.queryByTestId('session-identity-unavailable')).toBeNull();
  });

  it("'spotify-unverified' : état explicite + réessai, AUCUNE redirection", () => {
    mockState.sessionStatus = 'spotify-unverified';

    render(<Layout />);

    // La session existe : envoyer l'utilisateur vers /login le déconnecterait
    // de fait au moindre incident réseau.
    expect(redirects).toHaveLength(0);
    expect(screen.getByTestId('session-identity-unavailable')).toBeTruthy();

    fireEvent.press(screen.getByTestId('session-identity-retry'));
    expect(mockState.reloadUserData).toHaveBeenCalledTimes(1);
  });

  it("'local' (aucun compte) : redirection vers la connexion", () => {
    mockState.sessionStatus = 'local';

    render(<Layout />);

    expect(redirects).toHaveLength(1);
    expect(screen.getByTestId('redirect')).toBeTruthy();
  });

  it("'spotify' (profil vérifié) : onglets rendus, aucune redirection", () => {
    render(<Layout />);

    expect(redirects).toHaveLength(0);
  });
});
