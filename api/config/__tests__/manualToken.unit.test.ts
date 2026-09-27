import { extractSpotifyToken, verifySpotifyToken } from '../manualToken';

const TOKEN =
  'BQDx3Qh1c2VyLXRvcC1yZWFk_ZXhhbXBsZS10b2tlbi1mb3ItdGVzdHM-Melodix0123456789';

// The code tutorial of developer.spotify.com, as the user copies it.
const snippet = (
  token: string
) => `// Authorization token that must have been created previously. See : https://developer.spotify.com/documentation/web-api/concepts/authorization
const token = '${token}';
async function fetchWebApi(endpoint, method, body) {
  const res = await fetch(\`https://api.spotify.com/\${endpoint}\`, {
    headers: {
      Authorization: \`Bearer \${token}\`,
    },
    method,
    body:JSON.stringify(body)
  });
  return await res.json();
}`;

describe('extractSpotifyToken', () => {
  it('accepts the token alone', () => {
    expect(extractSpotifyToken(TOKEN)).toEqual({ ok: true, token: TOKEN });
    expect(extractSpotifyToken(`  '${TOKEN}';\n`)).toEqual({
      ok: true,
      token: TOKEN,
    });
  });

  it('finds the token in the whole code snippet of developer.spotify.com', () => {
    expect(extractSpotifyToken(snippet(TOKEN))).toEqual({
      ok: true,
      token: TOKEN,
    });
  });

  it('understands a snippet copied with HTML entities', () => {
    const escaped = snippet(TOKEN)
      .replace(/'/g, '&#39;')
      .replace(/=>/g, '=&gt;')
      .replace(/&&/g, '&amp;&amp;');

    expect(extractSpotifyToken(escaped)).toEqual({ ok: true, token: TOKEN });
  });

  it('detects the snippet shown when logged out (token = undefined)', () => {
    expect(extractSpotifyToken(snippet('undefined'))).toEqual({
      ok: false,
      reason: 'placeholder',
    });
    expect(extractSpotifyToken("const token = '';")).toEqual({
      ok: false,
      reason: 'placeholder',
    });
  });

  it('accepts an Authorization header or a URL with access_token', () => {
    expect(extractSpotifyToken(`Authorization: Bearer ${TOKEN}`)).toEqual({
      ok: true,
      token: TOKEN,
    });
    expect(
      extractSpotifyToken(
        `melodix://callback#access_token=${TOKEN}&token_type=Bearer`
      )
    ).toEqual({ ok: true, token: TOKEN });
  });

  it('joins a token split over several lines', () => {
    const splitToken = `${TOKEN.slice(0, 30)}\n${TOKEN.slice(30)}`;

    expect(extractSpotifyToken(splitToken)).toEqual({ ok: true, token: TOKEN });
  });

  it('rejects empty or unrelated text', () => {
    expect(extractSpotifyToken('   ')).toEqual({ ok: false, reason: 'empty' });
    expect(extractSpotifyToken('mon token spotify')).toEqual({
      ok: false,
      reason: 'malformed',
    });
    expect(extractSpotifyToken('BQ123')).toEqual({
      ok: false,
      reason: 'malformed',
    });
  });
});

describe('verifySpotifyToken', () => {
  const originalFetch = global.fetch;
  const mockedFetch = jest.fn();

  beforeEach(() => {
    mockedFetch.mockReset();
    global.fetch = mockedFetch as unknown as typeof fetch;
    jest.spyOn(console, 'error').mockImplementation(() => {});
  });

  afterAll(() => {
    global.fetch = originalFetch;
  });

  it('checks the token with GET /me, like the snippet (Bearer header)', async () => {
    mockedFetch.mockResolvedValueOnce({ ok: true, status: 200 });

    await expect(verifySpotifyToken(TOKEN)).resolves.toBe('valid');

    const [url, init] = mockedFetch.mock.calls[0];
    expect(url).toBe('https://api.spotify.com/v1/me');
    expect(init.headers).toEqual({ Authorization: `Bearer ${TOKEN}` });
  });

  it('reports refused, forbidden and unreachable cases', async () => {
    mockedFetch.mockResolvedValueOnce({ ok: false, status: 401 });
    await expect(verifySpotifyToken(TOKEN)).resolves.toBe('rejected');

    mockedFetch.mockResolvedValueOnce({ ok: false, status: 403 });
    await expect(verifySpotifyToken(TOKEN)).resolves.toBe('forbidden');

    mockedFetch.mockResolvedValueOnce({ ok: false, status: 503 });
    await expect(verifySpotifyToken(TOKEN)).resolves.toBe('unavailable');

    mockedFetch.mockRejectedValueOnce(new TypeError('Network request failed'));
    await expect(verifySpotifyToken(TOKEN)).resolves.toBe('network');
  });
});
