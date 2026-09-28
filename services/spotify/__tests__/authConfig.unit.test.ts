/**
 * Configurabilité Spotify (Client ID + Redirect URI) :
 * - ordre de lecture : EXPO_PUBLIC_* inlinée → extra de app.config → défaut ;
 * - valeur par défaut conforme : comspotifytestsdk://callback (celle
 *   validée par le Client ID public embarqué au build) ;
 * - la même source alimente authorize ET token exchange (invariant testé
 *   côté useSpotifyAuth). Aucune valeur sensible n'est lue ni loguée ici.
 */
import Constants from 'expo-constants';

import {
  DEFAULT_SPOTIFY_REDIRECT_URI,
  getSpotifyClientId,
  getSpotifyRedirectUri,
  getSpotifyRedirectUriSource,
  isSpotifyLoginConfigured,
} from '../authConfig';

const setExtra = (patch: Record<string, unknown>) => {
  const root = (Constants.default ?? Constants) as unknown as {
    __setExpoConfigExtra: (p: Record<string, unknown>) => void;
  };
  root.__setExpoConfigExtra(patch);
};

describe('authConfig — Client ID configurable', () => {
  const OLD_ENV = process.env;

  beforeEach(() => {
    process.env = { ...OLD_ENV };
    delete process.env.EXPO_PUBLIC_SPOTIFY_CLIENT_ID;
    setExtra({ spotifyClientId: 'extra-abc', spotifyRedirectUri: undefined });
  });

  afterEach(() => {
    process.env = OLD_ENV;
  });

  it('EXPO_PUBLIC_SPOTIFY_CLIENT_ID (inliné par Metro) prime sur extra', () => {
    process.env.EXPO_PUBLIC_SPOTIFY_CLIENT_ID = 'env-xyz';
    expect(getSpotifyClientId()).toBe('env-xyz');
    expect(isSpotifyLoginConfigured()).toBe(true);
  });

  it('extra.spotifyClientId utilisé sans variable env', () => {
    expect(getSpotifyClientId()).toBe('extra-abc');
  });

  it('aucun Client ID → non configuré (écran dédié, jamais saisi utilisateur)', () => {
    setExtra({ spotifyClientId: '' });
    expect(getSpotifyClientId()).toBe('');
    expect(isSpotifyLoginConfigured()).toBe(false);
  });

  describe('spotifyRedirectUri — ordre env → extra → défaut', () => {
    beforeEach(() => {
      delete process.env.EXPO_PUBLIC_SPOTIFY_REDIRECT_URI;
    });

    it('défaut EXACT : comspotifytestsdk://callback (embarqué)', () => {
      setExtra({ spotifyRedirectUri: '' });
      expect(getSpotifyRedirectUri()).toBe('comspotifytestsdk://callback');
      expect(getSpotifyRedirectUriSource()).toBe('default');
      expect(DEFAULT_SPOTIFY_REDIRECT_URI).toBe('comspotifytestsdk://callback');
    });

    it('extra.spotifyRedirectUri prime sur le défaut', () => {
      setExtra({ spotifyRedirectUri: 'myapp://retour-test' });
      expect(getSpotifyRedirectUri()).toBe('myapp://retour-test');
      expect(getSpotifyRedirectUriSource()).toBe('expo-config-extra');
    });

    it('EXPO_PUBLIC_SPOTIFY_REDIRECT_URI prime sur extra', () => {
      setExtra({ spotifyRedirectUri: 'myapp://retour-test' });
      process.env.EXPO_PUBLIC_SPOTIFY_REDIRECT_URI =
        'exp://192.168.1.4:8081/--/callback';
      expect(getSpotifyRedirectUri()).toBe('exp://192.168.1.4:8081/--/callback');
      expect(getSpotifyRedirectUriSource()).toBe('expo-public-env');
    });

    it('les espaces parasites sont éliminés (build CI robuste)', () => {
      setExtra({ spotifyRedirectUri: '  melodix://callback  ' });
      expect(getSpotifyRedirectUri()).toBe('melodix://callback');
    });
  });
});
