/**
 * Protection de démarrage (gate app/index) : le flux install → login
 * → accueil est vérifié AU NIVEAU DU POINT D'ENTRÉE, avec refresh
 * silencieux d'un token expiré et distinction DÉFINITIF / TRANSITOIRE.
 *
 * Scénarios couverts (exigés) :
 *  1. token valide au démarrage                     → accueil
 *  2. token expiré mais refresh RÉUSSI              → accueil
 *  3. refresh REFUSÉ PAR SPOTIFY (invalid_grant)    → session supprimée → login
 *  3bis. AUCUNE session                              → login direct
 *  4. refresh IMPOSSIBLE PAR LE RÉSEAU (transitoire) → session CONSERVÉE → login
 *     (regression du défaut physique : plus jamais de session saine jetée
 *      à cause d'une coupure réseau au boot)
 */
import * as React from 'react';
import { render, waitFor } from '@testing-library/react-native';

import App from '../index';
import {
  clearSession,
  resolveStartupSession,
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
  resolveStartupSession: jest.fn(),
  clearSession: jest.fn(async () => {}),
  runAccountlessMigration: jest.fn(async () => {}),
}));

const resolveMock = resolveStartupSession as jest.Mock;
const clearSessionMock = clearSession as jest.Mock;

describe('Protection du démarrage (app/index)', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('1. token valide → redirection vers l accueil', async () => {
    resolveMock.mockResolvedValue({ kind: 'valid', token: 'token-vivant' });

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/home');
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('2. token expiré + refresh réussi → accueil (aucune déconnexion)', async () => {
    // Le refresh silencieux a produit un nouveau token : le boot considère
    // la session valide.
    resolveMock.mockResolvedValue({ kind: 'valid', token: 'token-rafraichi' });

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/home');
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('3. session morte (refresh REFUSÉ par Spotify, invalid_grant) → session supprimée → login', async () => {
    resolveMock.mockResolvedValue({
      kind: 'session-dead',
      cause: 'refused',
    });

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/login');
    expect(clearSessionMock).toHaveBeenCalledTimes(1);
  });

  it('3ter. session sans refresh token (mort définitif) → session supprimée → login', async () => {
    resolveMock.mockResolvedValue({
      kind: 'session-dead',
      cause: 'no-refresh-token',
    });

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/login');
    expect(clearSessionMock).toHaveBeenCalledTimes(1);
  });

  it('4. refresh impossible PAR LE RÉSEAU (transitoire) → session CONSERVÉE → login', async () => {
    // LA regression du défaut physique : une coupure réseau au boot ne doit
    // PAS supprimer la session (elle sera retentée au prochain démarrage).
    resolveMock.mockResolvedValue({
      kind: 'session-kept-unverified',
      detail: 'network · HTTP 0',
    });

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/login');
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('3bis. aucune session → login direct, sans appel de nettoyage', async () => {
    resolveMock.mockResolvedValue({ kind: 'no-session' });

    const { getByTestId, queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(getByTestId('redirect').props.children).toBe('/login');
    expect(clearSessionMock).not.toHaveBeenCalled();
  });

  it('la migration financière est jouée AVANT la décision (sans bloquer)', async () => {
    resolveMock.mockResolvedValue({ kind: 'no-session' });
    (runAccountlessMigration as jest.Mock).mockRejectedValueOnce(
      new Error('fichier absent')
    );

    const { queryByTestId } = render(<App />);

    await waitFor(() => expect(queryByTestId('redirect')).toBeTruthy());
    expect(runAccountlessMigration).toHaveBeenCalled();
    expect(queryByTestId('redirect').props.children).toBe('/login');
  });

  it('pendant la vérification : écran de chargement, JAMAIS l accueil à demi', () => {
    // Vérification en cours (promesse non résolue) : le loader s'affiche et
    // AUCUNE navigation vers home/login ne s est produite.
    resolveMock.mockImplementation(() => new Promise(() => {}));

    const { getByTestId, queryByTestId, unmount } = render(<App />);

    expect(getByTestId('startup-loader')).toBeTruthy();
    expect(queryByTestId('redirect')).toBeNull();
    unmount(); // évite tout setState post-mortem du test
  });
});
