/**
 * Écran de connexion — parcours HUMAIN, zéro détail technique :
 *
 *  1. Écran initial : logo, « Bienvenue sur Melodix », phrase d'accroche,
 *     UN SEUL gros bouton « Continuer avec Spotify », note de redirection,
 *     AUCUN lien sans compte, AUCUN champ (ni Client ID ni secret).
 *  2. Bouton → startLogin() (le vrai OAuth, couvert par la suite du hook),
 *     anti-double-clic, bouton désactivé tant que la requête n'est pas prête.
 *  3. Chargement : « Connexion à Spotify… » puis « Finalisation de la
 *     connexion… ».
 *  4. Erreurs : messages humains UNIQUEMENT (jamais de code, cause, step,
 *     « Diagnostic », redirect_uri, PKCE ou token à l'écran) + « Réessayer ».
 *  5. Config absente : « La connexion Spotify n'est pas disponible pour le
 *     moment / Réessaie plus tard. » — pas de Réessayer inutile, jamais de
 *     champ de saisie.
 *  6. Succès : confirmation « Connexion réussie ! » puis ouverture directe
 *     de l'accueil (replace /(tabs)/home), sans écran intermédiaire.
 */
import * as React from 'react';
import { Animated, TextInput } from 'react-native';
import { act, fireEvent, render } from '@testing-library/react-native';
import { useRouter } from 'expo-router';

import { LoginScreen } from '../LoginScreen';

// Environnement jsdom : les animations natives sont neutralisées.
jest
  .spyOn(Animated, 'parallel')
  .mockReturnValue({ start: jest.fn(), stop: jest.fn(), reset: jest.fn() } as unknown as Animated.CompositeAnimation);

const mockStartLogin = jest.fn(async () => {});
const mockResetError = jest.fn();
const mockReplace = jest.fn();

let mockConfigured = true;
let mockRequestPending = false;
let mockSessionStatus = 'loading';
let mockAuthState: { status: string; outcome?: { kind: string; cause?: string } } = {
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
  SUCCESS_TEXT: 'login-success-text',
};

/** Vrai si un nœud Text dont la chaîne contient `needle` existe. */
const hasTextContaining = (root: ReturnType<typeof render>, needle: string) =>
  root.UNSAFE_queryAllByProps({}).some((node) => {
    if (node.type !== 'Text') {
      return false;
    }
    const children = node.props?.children;
    const flat = Array.isArray(children) ? children.join(' ') : children;
    return typeof flat === 'string' ? flat.includes(needle) : false;
  });

describe('LoginScreen — parcours humain, connexion OBLIGATOIRE', () => {
  beforeEach(() => {
    (useRouter as jest.Mock).mockReturnValue({ replace: mockReplace });
    mockAuthState = { status: 'idle' };
    mockConfigured = true;
    mockBusy = false;
    mockRequestPending = false;
    mockSessionStatus = 'loading';
    jest.useRealTimers();
    jest.clearAllMocks();
  });

  it('écran initial : bienvenue, accroche, UN SEUL bouton Spotify, note, pied de confidentialité implicitement humain', () => {
    const root = render(<LoginScreen />);

    expect(root.getByTestId('login-screen')).toBeTruthy();
    expect(root.getByText('Bienvenue sur Melodix')).toBeTruthy();
    expect(
      root.getByText('Ta musique. Tes playlists. Ton univers.')
    ).toBeTruthy();
    expect(root.getByTestId(TEST_IDS.SPOTIFY_BUTTON)).toBeTruthy();
    expect(root.getByText('Continuer avec Spotify')).toBeTruthy();
    expect(
      root.getByText(
        'Connexion sécurisée avec Spotify'
      )
    ).toBeTruthy();
    // Zéro échappatoire sans compte, zéro champ de saisie.
    expect(root.queryByText(/sans compte/i)).toBeNull();
    expect(root.UNSAFE_queryAllByType(TextInput)).toHaveLength(0);
    expect(root.queryByText(/Client ID|secret/i)).toBeNull();
  });

  it('le bouton lance le VRAI OAuth (startLogin) exactement une fois', () => {
    const { getByTestId } = render(<LoginScreen />);
    fireEvent.press(getByTestId(TEST_IDS.SPOTIFY_BUTTON));
    expect(mockStartLogin).toHaveBeenCalledTimes(1);
  });

  it('bouton désactivé tant que la requête OAuth n’est pas prête (anti-double-clic)', () => {
    mockRequestPending = true;
    const { getByTestId } = render(<LoginScreen />);
    fireEvent.press(getByTestId(TEST_IDS.SPOTIFY_BUTTON));
    expect(mockStartLogin).not.toHaveBeenCalled();
  });

  it('pendant l’ouverture Spotify : « Connexion à Spotify… » affiché', () => {
    mockAuthState = { status: 'requesting' };
    mockBusy = true;
    const { getByText } = render(<LoginScreen />);
    expect(getByText('Connexion à Spotify…')).toBeTruthy();
  });

  it('pendant l’échange : « Finalisation de la connexion… » affiché', () => {
    mockAuthState = { status: 'exchanging' };
    mockBusy = true;
    const { getByText } = render(<LoginScreen />);
    expect(getByText('Finalisation de la connexion…')).toBeTruthy();
  });

  it('annulation : message humain + « Réessayer » qui relance l’OAuth', () => {
    mockAuthState = {
      status: 'error',
      outcome: { kind: 'cancelled', cause: 'dismiss' },
    };
    const { getByText, getByTestId, queryByText } = render(<LoginScreen />);

    expect(getByText('Connexion annulée')).toBeTruthy();
    expect(getByText('Tu peux réessayer quand tu veux.')).toBeTruthy();
    // Le gros bouton primaire est remplacé par la carte erreur → Réessayer.
    expect(queryByText('Continuer avec Spotify')).toBeNull();

    fireEvent.press(getByTestId(TEST_IDS.RETRY_BUTTON));
    expect(mockResetError).toHaveBeenCalledTimes(1);
    expect(mockStartLogin).toHaveBeenCalledTimes(1);
  });

  it('refus OAuth : message humain dédié', () => {
    mockAuthState = { status: 'error', outcome: { kind: 'oauth-refused' } };
    const { getByText } = render(<LoginScreen />);
    expect(getByText('Spotify a refusé la connexion')).toBeTruthy();
    expect(
      getByText('Autorise bien Melodix sur la page Spotify, puis réessaie.')
    ).toBeTruthy();
  });

  it.each(['network', 'callback-failed', 'unknown', 'not-configured-typo'])(
    'erreur %s → message HUMAIN générique demandé, pas de poussière technique',
    (kind) => {
      mockAuthState = {
        status: 'error',
        outcome: { kind: kind === 'not-configured-typo' ? 'unknown' : kind },
      };
      const root = render(<LoginScreen />);
      expect(root.getByText('Impossible de se connecter à Spotify.')).toBeTruthy();
      expect(
        root.getByText('Vérifie ta connexion Internet puis réessaie.')
      ).toBeTruthy();
      expect(root.getByTestId(TEST_IDS.RETRY_BUTTON)).toBeTruthy();
    }
  );

  it('AUCUN détail technique à l’écran (cause, Diagnostic, redirect_uri, PKCE, token, HTTP)', () => {
    mockAuthState = {
      status: 'error',
      outcome: { kind: 'callback-failed', cause: 'code-absent' },
    };
    const root = render(<LoginScreen />);

    expect(root.queryByTestId('login-diagnostic-text')).toBeNull();
    expect(hasTextContaining(root, 'code-absent')).toBe(false);
    expect(hasTextContaining(root, 'Diagnostic')).toBe(false);
    expect(hasTextContaining(root, 'redirect_uri')).toBe(false);
    expect(hasTextContaining(root, 'PKCE')).toBe(false);
    expect(hasTextContaining(root, 'token')).toBe(false);
    expect(hasTextContaining(root, 'HTTP')).toBe(false);
    expect(hasTextContaining(root, 'ERR')).toBe(false);
  });

  it('config absente : message « indisponible » SANS Réessayer ni champ Client ID, startLogin jamais appelé', () => {
    mockConfigured = false;
    const root = render(<LoginScreen />);

    expect(
      root.getByText(
        "La connexion Spotify n'est pas disponible pour le moment."
      )
    ).toBeTruthy();
    expect(root.getByText('Réessaie plus tard.')).toBeTruthy();
    expect(root.queryByTestId(TEST_IDS.RETRY_BUTTON)).toBeNull();
    expect(root.queryByText(/Client ID/i)).toBeNull();

    // Aucun bouton d'erreur → l'écran n'a rien à presser pour tenter l'OAuth.
    expect(root.queryByTestId(TEST_IDS.SPOTIFY_BUTTON)).toBeNull();
    expect(mockStartLogin).not.toHaveBeenCalled();
  });

  it('succès : « Connexion réussie ! » affiché puis ouverture directe de l’accueil', () => {
    jest.useFakeTimers();
    mockSessionStatus = 'spotify';
    const { getByTestId, getByText } = render(<LoginScreen />);

    expect(getByTestId('login-success-screen')).toBeTruthy();
    expect(getByText('Connexion réussie !')).toBeTruthy();
    expect(mockReplace).not.toHaveBeenCalled();

    act(() => {
      jest.advanceTimersByTime(1600);
    });
    expect(mockReplace).toHaveBeenCalledWith({
      pathname: '/(tabs)/home',
      params: {},
    });
    jest.useRealTimers();
  });

  it('navbar de version présente (identifie le binaire — non technique)', () => {
    const { getByTestId } = render(<LoginScreen />);
    expect(getByTestId('login-version-text')).toBeTruthy();
  });
});
