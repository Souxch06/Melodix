import * as React from 'react';
import { TextInput } from 'react-native';
import { render, fireEvent, RenderResult } from '@testing-library/react-native';
import { useRouter } from 'expo-router';

import { LoginScreen } from '../LoginScreen';

const mockStartLogin = jest.fn(async () => {});
const mockResetError = jest.fn();
let mockConfigured = true;
let mockAuthState: { status: string; outcome?: { kind: string } } = {
  status: 'idle',
};
let mockBusy = false;

jest.mock('expo-router', () => ({
  useRouter: jest.fn(),
}));

// Le bouton déclenche bien le hook OAuth réel (à part ; ici piloté).
jest.mock('@services', () => ({
  isSpotifyLoginConfigured: () => mockConfigured,
  useSpotifyAuth: () => ({
    state: mockAuthState,
    isBusy: mockBusy,
    startLogin: mockStartLogin,
    resetError: mockResetError,
  }),
}));

enum TEST_IDS {
  SPOTIFY_BUTTON = 'login-spotify-button',
  LOCAL_LINK = 'login-local-link',
  ERROR = 'login-error-text',
  NOTE_NOT_CONFIGURED = 'login-not-configured-note',
}

describe('LoginScreen (connexion Spotify OAuth)', () => {
  let container: RenderResult;
  const mockReplace = jest.fn();

  beforeEach(() => {
    (useRouter as jest.Mock).mockReturnValue({ replace: mockReplace });
    mockAuthState = { status: 'idle' };
    mockConfigured = true;
    mockBusy = false;
    container = render(<LoginScreen />);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('affiche le titre attendu, le bouton Spotify et le lien sans compte', () => {
    expect(container.getByText('Bienvenue sur Melodix')).toBeTruthy();
    expect(
      container.getByText('Connecte-toi avec Spotify')
    ).toBeTruthy();
    expect(container.getByTestId(TEST_IDS.SPOTIFY_BUTTON)).toBeTruthy();
    expect(container.getByTestId(TEST_IDS.LOCAL_LINK)).toBeTruthy();
  });

  it('AUCUN champ de credential : pas de Client ID/token/secret saisi', () => {
    expect(container.queryByText(/Client ID/i)).toBeNull();
    expect(container.queryByText(/Client Secret/i)).toBeNull();
    expect(container.queryByText(/token/i)).toBeNull();
    // Aucun champ texte (TextInput) n'est rendu sur cet écran.
    expect(container.UNSAFE_queryAllByType(TextInput)).toHaveLength(0);
  });

  it('bouton Spotify → démarre le flux OAuth (PKCE via la page officielle)', () => {
    fireEvent.press(container.getByTestId(TEST_IDS.SPOTIFY_BUTTON));
    expect(mockStartLogin).toHaveBeenCalledTimes(1);
  });

  it('le lien sans compte conserve l accès libre (accueil local)', () => {
    fireEvent.press(container.getByTestId(TEST_IDS.LOCAL_LINK));
    expect(mockReplace).toHaveBeenCalledWith(
      expect.objectContaining({ pathname: '/(tabs)/home' })
    );
  });

  it('erreur annulée → message propre « Connexion annulée. »', () => {
    mockAuthState = { status: 'error', outcome: { kind: 'cancelled' } };
    const { getByTestId, getByText } = render(<LoginScreen />);
    expect(getByText('Connexion annulée.')).toBeTruthy();
    expect(getByTestId(TEST_IDS.ERROR)).toBeTruthy();
  });

  it('erreur réseau/Spotify indisponible → message propre', () => {
    mockAuthState = { status: 'error', outcome: { kind: 'unavailable' } };
    const { getByText } = render(<LoginScreen />);
    expect(
      getByText(/Spotify est temporairement indisponible/i)
    ).toBeTruthy();
  });

  it('Client ID non configuré au build → bouton désactivé + note claire', () => {
    mockConfigured = false;
    const { getByTestId } = render(<LoginScreen />);

    const button = getByTestId(TEST_IDS.SPOTIFY_BUTTON);
    expect(button.props.accessibilityState?.disabled ?? button.props.disabled).toBe(
      true
    );
    expect(getByTestId(TEST_IDS.NOTE_NOT_CONFIGURED)).toBeTruthy();
  });

  it('en cours de connexion → statut affiché', () => {
    mockAuthState = { status: 'requesting' };
    const { getByText } = render(<LoginScreen />);
    expect(getByText('Connexion à Spotify…')).toBeTruthy();
  });
});
