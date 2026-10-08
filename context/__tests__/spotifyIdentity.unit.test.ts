/**
 * Règles d'identité Spotify — module PUR, testé sans React.
 *
 * Invariant central : `LOCAL_USER_ID` n'est JAMAIS un identifiant de compte
 * Spotify, et chaque état de session donne UNE seule interprétation possible
 * pour les écrans (charger / identité indisponible / invité / compte).
 */
import { LOCAL_USER_ID } from '@config';

import {
  describeSpotifyVerificationFailure,
  hasSpotifySession,
  isSpotifyAccountId,
  resolveSpotifyDataPlan,
  type SessionStatus,
  type SpotifyVerificationFailure,
} from '../spotifyIdentity';

import { translations } from '@data';

describe('spotifyIdentity — isSpotifyAccountId', () => {
  it('accepte un identifiant Spotify réel (espaces compris)', () => {
    expect(isSpotifyAccountId('abc123')).toBe(true);
    expect(isSpotifyAccountId('  abc123  ')).toBe(true);
  });

  it('refuse le profil local, le vide et les non-chaînes', () => {
    expect(isSpotifyAccountId(LOCAL_USER_ID)).toBe(false);
    expect(isSpotifyAccountId('')).toBe(false);
    expect(isSpotifyAccountId('   ')).toBe(false);
    expect(isSpotifyAccountId(null)).toBe(false);
    expect(isSpotifyAccountId(undefined)).toBe(false);
    expect(isSpotifyAccountId(42)).toBe(false);
  });
});

describe('spotifyIdentity — hasSpotifySession', () => {
  it('une session Spotify existe pour spotify, spotify-unverified ET spotify-verifying', () => {
    expect(hasSpotifySession('spotify')).toBe(true);
    expect(hasSpotifySession('spotify-unverified')).toBe(true);
    expect(hasSpotifySession('spotify-verifying')).toBe(true);
  });

  it("aucune session pour 'loading' (aucune session lue) ni 'local'", () => {
    expect(hasSpotifySession('loading')).toBe(false);
    expect(hasSpotifySession('local')).toBe(false);
  });
});

describe('spotifyIdentity — resolveSpotifyDataPlan', () => {
  const cases: {
    status: SessionStatus;
    accountId: string | null;
    expected: string;
    reason: string;
  }[] = [
    {
      status: 'loading',
      accountId: null,
      expected: 'restoring',
      reason: 'identité pas encore établie → chargement, aucun fetch',
    },
    {
      status: 'loading',
      accountId: 'account-a',
      expected: 'restoring',
      reason: 'un id ne vaut que lorsque la session est vérifiée',
    },
    {
      status: 'spotify-unverified',
      accountId: null,
      expected: 'identity-unavailable',
      reason: 'session présente, profil indisponible → état explicite',
    },
    {
      status: 'spotify-unverified',
      accountId: 'account-a',
      expected: 'identity-unavailable',
      reason: 'aucune donnée de compte sans profil vérifié',
    },
    {
      status: 'spotify-verifying',
      accountId: 'account-a',
      expected: 'restoring',
      reason:
        'réessai en cours → chargement, aucune donnée chargée en parallèle',
    },
    {
      status: 'local',
      accountId: null,
      expected: 'local',
      reason: 'mode invité réel',
    },
    {
      status: 'spotify',
      accountId: 'account-a',
      expected: 'spotify',
      reason: 'identité vérifiée → données du compte',
    },
  ];

  it.each(cases)(
    '$status + $accountId → $expected ($reason)',
    ({ status, accountId, expected }) => {
      expect(resolveSpotifyDataPlan(status, accountId).kind).toBe(expected);
    }
  );

  it('tronque les espaces de l’identifiant vérifié', () => {
    const plan = resolveSpotifyDataPlan('spotify', '  account-a  ');

    expect(plan).toEqual({ kind: 'spotify', accountId: 'account-a' });
  });

  it("un état 'spotify' sans identifiant exploitable ne devient JAMAIS local", () => {
    for (const accountId of [null, '', LOCAL_USER_ID]) {
      expect(resolveSpotifyDataPlan('spotify', accountId)).toEqual({
        kind: 'restoring',
      });
    }
  });
});

describe('spotifyIdentity — diagnostic de vérification (sûr, lisible)', () => {
  const cases: { failure: SpotifyVerificationFailure; contains: string }[] = [
    {
      failure: { kind: 'invalid-response' },
      contains: 'Réponse Spotify invalide',
    },
    { failure: { kind: 'network' }, contains: 'Réseau indisponible' },
    {
      failure: { kind: 'rate-limited' },
      contains: 'HTTP 429 — trop de requêtes',
    },
    {
      failure: { kind: 'http', status: 401 },
      contains: 'HTTP 401 — access token invalide ou expiré',
    },
    {
      failure: { kind: 'http', status: 403 },
      contains: 'HTTP 403 — accès refusé',
    },
    { failure: { kind: 'http', status: 503 }, contains: 'HTTP 503' },
    {
      failure: { kind: 'generic' },
      contains: 'Erreur inattendue',
    },
  ];

  it.each(cases)(
    '$failure → message lisible « $contains »',
    ({ failure, contains }) => {
      const text = describeSpotifyVerificationFailure(translations, failure);
      expect(text).toContain(contains);
      // Jamais de valeur illisible ni de secret.
      expect(text).not.toMatch(/undefined|NaN|\[object Object\]/);
      expect(text).not.toMatch(
        /access_token=|refresh_token=|code_verifier=|Bearer /
      );
    }
  );

  it('absence d échec → null (rien à afficher), jamais « undefined »', () => {
    expect(describeSpotifyVerificationFailure(translations, null)).toBeNull();
    expect(
      describeSpotifyVerificationFailure(translations, undefined)
    ).toBeNull();
  });
});
