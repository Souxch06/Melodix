/**
 * Protection de démarrage (gate app/index) : le flux install → login
 * → accueil est vérifié AU NIVEAU DU POINT D'ENTRÉE, avec refresh
 * silencieux d'un token expiré et SUPPRESSION d'une session morte.
 *
 * Scénarios couverts (exigés) :
 *  1. session valide au démarrage               → accueil
 *  2. token expiré mais refresh RÉUSSI          → accueil
 *  3. refresh IMPOSSIBLE / session absente      → session supprimée → login
 */
import * as React from 'react';
import { render, waitFor } from '@testing-library/react-native';
import { Text } from 'react-native';

import App from '../index';
import {
  clearSession,
  getValidAccessToken,
  loadSession,
  runAccountlessMigration,
} from '@services';

// Redirect/loader mockés pour capter la cible de navigation.
jest.mock('expo-router', () => {
  const { Text: RNText } = jest.requireActual('react-native');
  return {
    Redirect: ({ href }: { href: { pathname: string } }) => (
      <RNText testID="redirect">{href.pathname}</RNText>
    ),
  };
});

jest.mock('@services', () => ({
  loadSession: jest.fn(),
  getValidAccessToken: jest.fn(),
  clearSession: jest.fn(async () => {}),
  runAccountlessMigration: jest.fn(async () => {}),
}));

const loadSessionMock = loadSession as jest.Mock;
const getTokenMock = getValidAccessToken as jest.Mock;
const clearSessionMock = clearSession as jest.Mock;

describe('Protection du démarrage (app/index)', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('1. session valide → redirection vers l accueil', async () => {
    loadSessionMock.mockResolvedValue({ accessToken: 'x', refreshToken: 'r' });
    getTokenMock.mockResolvedValue('token-vivant');

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/home');
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('2. token expiré + refresh réussi → accueil (aucune déconnexion)', async () => {
    loadSessionMock.mockResolvedValue({
      accessToken: 'x',
      refreshToken: 'présent',
    });
    // getValidAccessToken = le refresh silencieux a produit un nouveau token.
    getTokenMock.mockResolvedValue('token-rafraichi');

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/home');
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('3. session présente mais refresh IMPOSSIBLE → session supprimée → login', async () => {
    loadSessionMock.mockResolvedValue({ accessToken: 'x' });
    getTokenMock.mockResolvedValue(null);

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/login');
    expect(clearSessionMock).toHaveBeenCalledTimes(1);
  });

  it('3bis. aucune session → login direct, sans appel API', async () => {
    loadSessionMock.mockResolvedValue(null);

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/login');
    expect(getTokenMock).not.toHaveBeenCalled();
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('la migration financière est jouée AVANT la décision (sans bloquer)', async () => {
    loadSessionMock.mockResolvedValue(null);
    (runAccountlessMigration as jest.Mock).mockRejectedValueOnce(
      new Error('fichier absent')
    );

    const { queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(runAccountlessMigration).toHaveBeenCalled();
    expect(queryByTestId('redirect').props.children).toBe('/login');
  });

  it('pendant la vérification : écran de chargement, JAMAIS l accueil à demi', () => {
    // Session en train d'être restaurée (promesse non résolue) : le loader
    // s'affiche et AUCUNE navigation vers home/login ne s'est produite.
    loadSessionMock.mockImplementation(
      () => new Promise(() => {}) // restauration en cours
    );

    const { getByTestId, queryByTestId, unmount } = render(<App />);

    expect(getByTestId('startup-loader')).toBeTruthy();
    expect(queryByTestId('redirect')).toBeNull();
    unmount(); // évite tout setState post-mortem du test
  });
});

// Utilisation explicite (conservation de Text dans les snapshots de debug).
void Text;
