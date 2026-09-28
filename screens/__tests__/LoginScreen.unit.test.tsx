/**
 * Écran de connexion — scénarios exigés :
 *  4. Client ID absent          → écran « pas configuré », AUCUNE tentative OAuth
 *  5. Annulation                → texte exact + Réessayer fonctionnel
 *  6. Échec OAuth               → texte exact, error propre, réessai possible
 * + AUCUN moyen d'accéder à l'app sans compte (lien supprimé), aucun champ
 *   credential, anti-double-clic, bouton désactivé tant que la requête OAuth
 *   n'est pas prête, libellé de chargement exact.
 */
import * as React from 'react';
import { Animated, TextInput } from 'react-native';
import { fireEvent, render } from '@testing-library/react-native';
import { useRouter } from 'expo-router';

import { LoginScreen } from '../LoginScreen';

// Environnement jsdom : InteractionManager n'exécute pas les animations
// natives — les animations d'entrée sont neutralisées (décoration visuelle).
jest
  .spyOn(Animated, 'parallel')
  .mockReturnValue({ start: jest.fn(), stop: jest.fn(), reset: jest.fn() } as unknown as Animated.CompositeAnimation);

const mockStartLogin = jest.fn(async () => {});
const mockResetError = jest.fn();

let mockConfigured = true;
let mockRequestPending = false;
let mockSessionStatus = 'loading';
let mockAuthState: { status: string; outcome?: { kind: string } } = {
  status: 'idle',
};
let mockBusy = false;

jest.mock('expo-router', () => ({
  useRouter: jest.fn(),
}));

// Le bouton déclenche l'OAuth réel (couvert ailleurs) ; ici le hook est piloté.
jest.mock('@services', () => ({
  isSpotifyLoginConfigured: () => mockConfigured,
  useSpotifyAuth: () => ({
    state: mockAuthState,
    isBusy: mockBusy,
    isAuthRequestPending: mockRequestPending,
    startLogin: mockStartLogin,
    resetError: mockResetError,
  }),
}));

jest.mock('@context', () => ({
  useUserData: () => ({ sessionStatus: mockSessionStatus }),
}));

const TEST_IDS = {
  SPOTIFY_BUTTON: 'login-spotify-button',
  ERROR_CARD: 'login-error-card',
  RETRY_BUTTON: 'login-retry-button',
  STATUS: 'login-status-text',
};

describe('LoginScreen (connexion Spotify OBLIGATOIRE)', () => {
  beforeEach(() => {
    (useRouter as jest.Mock).mockReturnValue({ replace: jest.fn() });
    mockAuthState = { status: 'idle' };
    mockConfigured = true;
    mockBusy = false;
    mockRequestPending = false;
    mockSessionStatus = 'loading';
    jest.clearAllMocks();
  });

  it('écran initial : logos, tagline exacte, UN SEUL bouton Spotify, zéro lien sans compte', () => {
    const { getByText, getByTestId, queryByText } = render(<LoginScreen />);

    expect(getByText('Ta musique. Ton univers.')).toBeTruthy();
    expect(getByTestId(TEST_IDS.SPOTIFY_BUTTON)).toBeTruthy();
    expect(getByText('Continuer avec Spotify')).toBeTruthy();
    expect(getByText('Connexion sécurisée avec Spotify')).toBeTruthy();

    // Le lien « Explorer sans compte » a été SUPPRIMÉ : aucun accès sans session.
    expect(queryByText(/Explorer sans compte/i)).toBeNull();
    expect(queryByText(/sans compte/i)).toBeNull();
  });

  it('AUCUN champ credential : ni Client ID, ni secret, ni token, ni TextInput', () => {
    const { queryByText, UNSAFE_queryAllByType } = render(<LoginScreen />);

    expect(queryByText(/Client ID/i)).toBeNull();
    expect(queryByText(/Secret/i)).toBeNull();
    expect(queryByText(/token/i)).toBeNull();
    expect(UNSAFE_queryAllByType(TextInput)).toHaveLength(0);
  });

  it('scénario 4 : Client ID ABSENT → carte dédiée + bouton inopérant (jamais OAuth)', () => {
    mockConfigured = false;
    const { getByText, queryByTestId } = render(<LoginScreen />);

    expect(getByText('Connexion Spotify indisponible')).toBeTruthy();
    expect(
      getByText(/n'est pas encore configurée sur cette version de Melodix/)
    ).toBeTruthy();
    expect(getByText(/version correctement configurée/)).toBeTruthy();

    // Pas de bouton principal : startLogin ne peut JAMAIS être déclenché.
    expect(queryByTestId(TEST_IDS.SPOTIFY_BUTTON)).toBeNull();
    fireEvent.press(getByText('Connexion Spotify indisponible')); // pas de plantage
    expect(mockStartLogin).not.toHaveBeenCalled();
  });

  it('scénario 5 : annulation → textes EXACTS + bouton « Réessayer » relance le flux', () => {
    mockAuthState = { status: 'error', outcome: { kind: 'cancelled' } };
    const { getByText, getByTestId, queryByTestId } = render(<LoginScreen />);

    // Textes EXACTS demandés (jamais de détail technique).
    expect(getByText('Connexion annulée')).toBeTruthy();
    expect(getByText('Tu peux réessayer quand tu veux.')).toBeTruthy();

    // Le bouton Réessayer remplace le bouton principal (état propre).
    expect(queryByTestId(TEST_IDS.SPOTIFY_BUTTON)).toBeNull();

    fireEvent.press(getByTestId(TEST_IDS.RETRY_BUTTON));
    expect(mockResetError).toHaveBeenCalledTimes(1);
    expect(mockStartLogin).toHaveBeenCalledTimes(1);
  });

  it('scénario 6 : échec OAuth → textes EXACTS + Réessayer disponible', () => {
    mockAuthState = { status: 'error', outcome: { kind: 'unavailable' } };
    const { getByText, getByTestId } = render(<LoginScreen />);

    expect(getByText('Impossible de se connecter à Spotify.')).toBeTruthy();
    expect(
      getByText('Vérifie ta connexion internet puis réessaie.')
    ).toBeTruthy();

    fireEvent.press(getByTestId(TEST_IDS.RETRY_BUTTON));
    expect(mockStartLogin).toHaveBeenCalledTimes(1);
  });

  it('bouton principal → démarre le flux OAuth (page officielle uniquement)', () => {
    const { getByTestId } = render(<LoginScreen />);
    fireEvent.press(getByTestId(TEST_IDS.SPOTIFY_BUTTON));
    expect(mockStartLogin).toHaveBeenCalledTimes(1);
  });

  it('ANTI-DOUBLE-CLIC : occupé ou requête non prête → bouton désactivé, idempotent', () => {
    mockBusy = true;
    mockAuthState = { status: 'requesting' };
    const busy = render(<LoginScreen />);
    expect(
      busy.getByTestId(TEST_IDS.SPOTIFY_BUTTON).props.accessibilityState.disabled
    ).toBe(true);
    fireEvent.press(busy.getByTestId(TEST_IDS.SPOTIFY_BUTTON));
    expect(mockStartLogin).not.toHaveBeenCalled();
    busy.unmount();
    jest.clearAllMocks();

    mockBusy = false;
    mockAuthState = { status: 'idle' };
    mockRequestPending = true;
    const pending = render(<LoginScreen />);
    expect(
      pending.getByTestId(TEST_IDS.SPOTIFY_BUTTON).props.accessibilityState
        .disabled
    ).toBe(true);
    fireEvent.press(pending.getByTestId(TEST_IDS.SPOTIFY_BUTTON));
    expect(mockStartLogin).not.toHaveBeenCalled();
  });

  it('pendant le flux OAuth : libellé de chargement exact « Connexion à Spotify... »', () => {
    mockBusy = true;
    mockAuthState = { status: 'requesting' };
    const { getAllByText } = render(<LoginScreen />);

    // Libellé visible dans le bouton ET comme statut sous le bouton.
    expect(getAllByText('Connexion à Spotify...').length).toBeGreaterThan(0);
  });

  it('jamais de stack trace/détail technique affiché, quel que soit l état', () => {
    for (const outcome of [
      { status: 'error', outcome: { kind: 'cancelled' } },
      { status: 'error', outcome: { kind: 'unavailable' } },
      { status: 'error', outcome: { kind: 'not-configured' } },
    ]) {
      mockAuthState = outcome;
      const { queryByText, unmount } = render(<LoginScreen />);
      expect(queryByText(/Error:|TypeError|undefined is not|at Object|stack/i)).toBeNull();
      unmount();
    }
  });
});
