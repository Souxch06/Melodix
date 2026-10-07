/**
 * app.config.js — Client ID Spotify : source unique committée + override
 * de build + intégrité du redirect de production.
 *
 * Chaîne de la mission intégration Client ID :
 *   défaut committé (DEFAULT_SPOTIFY_CLIENT_ID) ou env SPOTIFY_CLIENT_ID
 *     → extra.spotifyClientId → authConfig (canal « extra ») →
 *     demande /authorize + token exchange (client_id).
 *
 * Garde-fous :
 *   - la variable d'env OVERRIDES la valeur committée (architecture de
 *     build inchangée, pas de deuxième configuration) ;
 *   - le redirect de production reste EXACTEMENT `melodix://callback` ;
 *   - aucun secret n'apparaît dans la configuration générée (ni
 *     client_secret, ni token, ni cookie) — le Client ID seul est public.
 */

const PRODUCTION_CLIENT_ID = '7c5af4cd57e646c49a6266222c2ed9d6';

type AppConfig = { expo: { extra: Record<string, unknown> } };

const loadAppConfig = (): AppConfig => {
  // app.config.js lit process.env AU REQUIRE : on réexige à chaque test
  // après avoir contrôlé l'environnement (pas d'inlining en test :
  // seule `EXPO_PUBLIC_*` serait inlinée par babel-preset-expo, et
  // SPOTIFY_CLIENT_ID n'a pas ce préfixe).
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  return require('../app.config.js') as AppConfig;
};

describe('app.config.js — Client ID Spotify (source unique committée)', () => {
  const OLD_ENV = process.env;

  beforeEach(() => {
    process.env = { ...OLD_ENV };
    delete process.env.SPOTIFY_CLIENT_ID;
    delete process.env.SPOTIFY_REDIRECT_URI;
    delete process.env.MELODIX_BACKEND_URL;
    delete process.env.AUDIUS_API_KEY;
    jest.resetModules();
  });

  afterEach(() => {
    process.env = OLD_ENV;
  });

  it('sans variable : le Client ID PAR DÉFAUT du projet est embarqué (32 hex)', () => {
    const config = loadAppConfig();
    expect(config.expo.extra.spotifyClientId).toBe(PRODUCTION_CLIENT_ID);
    expect(config.expo.extra.spotifyClientId).toMatch(/^[0-9a-f]{32}$/);
  });

  it('SPOTIFY_CLIENT_ID (env de build) prime sur la valeur par défaut', () => {
    process.env.SPOTIFY_CLIENT_ID = '1234567890abcdef1234567890abcdef  ';
    const config = loadAppConfig();
    // La valeur d'override est trimée (robustesse build CI).
    expect(config.expo.extra.spotifyClientId).toBe(
      '1234567890abcdef1234567890abcdef'
    );
  });

  it('env vide ou espace → la valeur par défaut repart (jamais une config cassée)', () => {
    process.env.SPOTIFY_CLIENT_ID = '   ';
    expect(loadAppConfig().expo.extra.spotifyClientId).toBe(
      PRODUCTION_CLIENT_ID
    );
  });

  it('redirect de production inchangé : extra.spotifyRedirectUri = melodix://callback', () => {
    const config = loadAppConfig();
    expect(config.expo.extra.spotifyRedirectUri).toBe('melodix://callback');
  });

  it('aucun secret dans la configuration générée (Client ID seul, public)', () => {
    const config = loadAppConfig();
    const serialized = JSON.stringify(config.expo);
    expect(serialized).not.toMatch(/client[_-]?secret/i);
    expect(serialized).not.toMatch(/access[_-]?token/i);
    expect(serialized).not.toMatch(/refresh[_-]?token/i);
    expect(serialized).not.toMatch(/spotify[_-]?cookie/i);
    // La valeur committée EST bien présente (c'est un identifiant public).
    expect(serialized).toContain(PRODUCTION_CLIENT_ID);
  });
});
