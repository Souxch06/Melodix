/**
 * devLog — politique de filtrage : les lignes de diagnostic [SPOTIFY AUTH]
 * imposées passent INTACTES (intitulés + booléens), toute paire secret=valeur
 * est masquée. Jamais access_token / refresh_token / client_secret /
 * code_verifier / Bearer <valeur> dans la sortie.
 */
import { spotifyConfigLine } from '../devLog';

describe('services/spotify/devLog — filtrage des lignes [SPOTIFY AUTH]', () => {
  const logSpy = jest.spyOn(console, 'log').mockImplementation(() => {});

  beforeEach(() => {
    logSpy.mockClear();
  });

  afterAll(() => {
    logSpy.mockRestore();
  });

  const MANDATED_LINES = [
    '[SPOTIFY AUTH] Starting authorization',
    '[SPOTIFY AUTH] Client ID configured: YES (source: expo-config-extra)',
    '[SPOTIFY AUTH] Redirect URI: comspotifytestsdk://callback',
    '[SPOTIFY AUTH] Authorization started',
    '[SPOTIFY AUTH] Authorization response received (type: success)',
    '[SPOTIFY AUTH] Authorization code received: YES',
    '[SPOTIFY AUTH] Authorization code received: NO (user-dismiss)',
    '[SPOTIFY AUTH] Token exchange started',
    '[SPOTIFY AUTH] Token exchange params: grant_type=authorization_code redirect_uri=comspotifytestsdk://callback client_id=YES pkce=YES',
    '[SPOTIFY AUTH] Token exchange HTTP status: 200',
    '[SPOTIFY AUTH] Token exchange HTTP status: 400 (invalid_client)',
    '[SPOTIFY AUTH] Access token received: YES (expires in ~3600 s · scopes: 3)',
    '[SPOTIFY AUTH] Refresh token received: NO',
    '[SPOTIFY AUTH] /v1/me request started',
    '[SPOTIFY AUTH] /v1/me HTTP status: 403',
    '[SPOTIFY AUTH] /v1/me success/error: success',
  ];

  it.each(MANDATED_LINES)('ligne de diagnostic intacte : %s', (line) => {
    spotifyConfigLine(line);
    expect(logSpy).toHaveBeenCalledWith(line);
    expect(logSpy).not.toHaveBeenCalledWith('<redacted>');
  });

  it.each([
    'Authorization: Bearer abc.DEF-123',
    'access_token=BQB-secret-value',
    'refresh_token: AQC-secret-value',
    'client_secret=f00ba4',
    'code_verifier=dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk',
  ])('secret masqué : %s', (line) => {
    spotifyConfigLine(line);
    expect(logSpy).toHaveBeenCalledWith('<redacted>');
  });
});
