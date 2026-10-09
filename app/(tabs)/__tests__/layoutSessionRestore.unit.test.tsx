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
  sessionStatus:
    | 'loading'
    | 'local'
    | 'spotify'
    | 'spotify-unverified'
    | 'spotify-verifying';
  reloadUserData: jest.Mock;
  verificationFailure:
    | { kind: 'network' }
    | { kind: 'rate-limited' }
    | {
        kind: 'http';
        status: number;
        message?: string;
        detail?: 'empty' | 'json' | 'non-json' | 'redacted';
        contentType?: string;
        meta?: {
          finalUrl?: string;
          headers?: Record<string, string>;
        };
      }
    | { kind: 'invalid-response' }
    | { kind: 'generic' }
    | null;
} = {
  sessionStatus: 'spotify',
  reloadUserData: jest.fn(async () => {}),
  verificationFailure: null,
};

const redirects: unknown[] = [];

jest.mock('@context', () => ({
  useUserData: () => ({
    sessionStatus: mockState.sessionStatus,
    reloadUserData: mockState.reloadUserData,
    verificationFailure: mockState.verificationFailure,
  }),
  // Traducteur de diagnostic RÉEL (module pur, sans dépendance native).
  describeSpotifyVerificationFailure: jest.requireActual(
    '../../../context/spotifyIdentity'
  ).describeSpotifyVerificationFailure,
  // V24 — corps CLASSÉ (403 → « refus d'accès ») : implémentation RÉELLE.
  spotifyUnavailableBody: jest.requireActual('../../../context/spotifyIdentity')
    .spotifyUnavailableBody,
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
    // V24 — rapport copiable : stub (ses propres tests couvrent le
    // comportement réel ; ici on ne teste que l'écran d'état de session).
    SpotifyDiagnosticActions: () => null,
    ErrorCard: (props: {
      testID?: string;
      retryTestID?: string;
      title?: string;
      body?: string;
      onRetry: () => void;
    }) =>
      ReactActual.createElement(
        ReactActual.Fragment,
        null,
        ReactActual.createElement(
          TextActual,
          { testID: 'card-title' },
          props.title
        ),
        ReactActual.createElement(
          TextActual,
          { testID: 'card-body' },
          props.body
        ),
        ReactActual.createElement(
          PressableActual,
          { testID: props.retryTestID, onPress: props.onRetry },
          ReactActual.createElement(TextActual, { testID: props.testID })
        )
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
  mockState.verificationFailure = null;
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

  it("'spotify-verifying' (réessai en cours) : écran neutre, PLUS de bouton Réessayer (anti double-clic), aucune redirection", () => {
    mockState.sessionStatus = 'spotify-verifying';

    render(<Layout />);

    // Changement visible : l'écran d'erreur a disparu (plus de carte, plus
    // de bouton) — pendant la tentative, un 2ᵉ clic est impossible.
    expect(screen.queryByTestId('session-identity-unavailable')).toBeNull();
    expect(screen.queryByTestId('session-identity-retry')).toBeNull();
    expect(redirects).toHaveLength(0);
  });

  it("'spotify-unverified' + échec réseau : la cause SÛRE est affichée dans la carte", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = { kind: 'network' };

    render(<Layout />);

    expect(screen.getByTestId('card-body').props.children).toContain(
      'Réseau indisponible'
    );
    // Jamais de valeur technique brute ni de secret dans la carte.
    expect(
      JSON.stringify(screen.getByTestId('card-body').props.children)
    ).not.toMatch(/access_token|refresh_token|code_verifier|Bearer |undefined/);
  });

  it("'spotify-unverified' + HTTP 401 : message explicite « access token invalide ou expiré »", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = { kind: 'http', status: 401 };

    render(<Layout />);

    expect(screen.getByTestId('card-body').props.children).toContain(
      'HTTP 401 — access token invalide ou expiré'
    );
  });

  it("'spotify-unverified' + HTTP 403 + message Spotify : cause exacte affichée « HTTP 403 — User not approved for app »", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = {
      kind: 'http',
      status: 403,
      message: 'User not approved for app',
    };

    render(<Layout />);

    expect(screen.getByTestId('card-body').props.children).toContain(
      'HTTP 403 — User not approved for app'
    );
    // Jamais de valeur sensible ni de « undefined » dans la carte.
    expect(
      JSON.stringify(screen.getByTestId('card-body').props.children)
    ).not.toMatch(/access_token|refresh_token|code_verifier|Bearer |undefined/);
  });

  it("'spotify-unverified' + HTTP 403 SANS message Spotify : libellé localisé 403", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = { kind: 'http', status: 403 };

    render(<Layout />);

    expect(screen.getByTestId('card-body').props.children).toContain(
      'HTTP 403 — accès refusé'
    );
  });

  it("'spotify-unverified' + HTTP 403 corps VIDE : rendu explicite « aucun message détaillé » (jamais « accès refusé » masquant)", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = {
      kind: 'http',
      status: 403,
      detail: 'empty',
      contentType: 'application/json',
    };

    render(<Layout />);

    const body = String(screen.getByTestId('card-body').props.children);
    expect(body).toContain("Spotify n'a fourni aucun message détaillé");
    expect(body).toContain('corps de réponse vide');
    expect(body).toContain('(Content-Type: application/json)');
    // V24 — le corps 403 est le corps DÉDIÉ « refus d'accès » : jamais le
    // corps générique « (réseau ou erreur temporaire) », et le détail
    // disponible (forme + Content-Type) reste affiché.
    expect(body).toContain("Ce n'est PAS une erreur réseau temporaire");
    expect(body).not.toContain('(réseau ou erreur temporaire)');
    // Jamais de valeur sensible ni de « undefined ».
    expect(
      JSON.stringify(screen.getByTestId('card-body').props.children)
    ).not.toMatch(/access_token|refresh_token|code_verifier|Bearer |undefined/);
  });

  it("'spotify-unverified' + HTTP 403 réponse NON JSON (HTML) : « réponse non JSON » + Content-Type HTML", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = {
      kind: 'http',
      status: 403,
      detail: 'non-json',
      contentType: 'text/html; charset=utf-8',
    };

    render(<Layout />);

    const body = String(screen.getByTestId('card-body').props.children);
    expect(body).toContain("Spotify n'a fourni aucun message détaillé");
    expect(body).toContain('réponse non JSON');
    expect(body).toContain('(Content-Type: text/html; charset=utf-8)');
    // V24 — corps 403 dédié, jamais le corps générique « réseau temporaire ».
    expect(body).toContain("Ce n'est PAS une erreur réseau temporaire");
    expect(body).not.toContain('(réseau ou erreur temporaire)');
  });

  it("'spotify-unverified' + HTTP 403 NON JSON + métadonnées : source identifiable (URL/Content-Type/Server/Via), jamais de body/token", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = {
      kind: 'http',
      status: 403,
      detail: 'non-json',
      contentType: 'text/html; charset=utf-8',
      meta: {
        finalUrl: 'https://api.spotify.com/v1/me',
        headers: {
          server: 'envoy',
          via: '1.1 varnish',
          'x-cache': 'MISS',
        },
      },
    };

    render(<Layout />);

    const body = String(screen.getByTestId('card-body').props.children);
    // Libellé + métadonnées de la source, ligne par ligne.
    expect(body).toContain(
      "HTTP 403 — Spotify n'a fourni aucun message détaillé (réponse non JSON)"
    );
    expect(body).toContain('URL : https://api.spotify.com/v1/me');
    expect(body).toContain('Content-Type : text/html; charset=utf-8');
    expect(body).toContain('Server : envoy');
    expect(body).toContain('Via : 1.1 varnish');
    expect(body).toContain('X-Cache : MISS');
    // Jamais de corps, de cookie, de token, ni de « undefined ».
    expect(body).not.toContain('Proxy Access Denied');
    expect(body).not.toMatch(
      /access_token|refresh_token|code_verifier|Bearer |set-cookie|undefined/i
    );
  });

  it("'spotify-unverified' + HTTP 403 NON JSON + métadonnées incomplètes : « inconnu »/« inconnue », jamais « undefined »", () => {
    mockState.sessionStatus = 'spotify-unverified';
    mockState.verificationFailure = {
      kind: 'http',
      status: 403,
      detail: 'non-json',
      meta: { headers: {} },
    };

    render(<Layout />);

    const body = String(screen.getByTestId('card-body').props.children);
    expect(body).toContain('URL : inconnue');
    expect(body).toContain('Content-Type : inconnu');
    expect(body).not.toContain('undefined');
  });

  it("'spotify-unverified' SANS cause connue : le corps d'origine reste seul (pas de ligne vide/undefined)", () => {
    mockState.sessionStatus = 'spotify-unverified';

    render(<Layout />);

    const body = String(screen.getByTestId('card-body').props.children);
    expect(body).toContain("n'a pas pu être vérifié");
    expect(body).not.toContain('undefined');
    expect(body).not.toContain('\n\n');
  });
});
