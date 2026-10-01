import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  AUDIUS_GATEWAY_URL,
  audiusGet,
  AudiusRequestError,
  getAudiusStreamUrl,
  resetAudiusHosts,
} from '../client';

// Mutable so each test can switch between "no key" and "API key" modes.
let mockApiKey = '';

jest.mock('expo-constants', () => ({
  expoConfig: {
    get extra() {
      return { audiusApiKey: mockApiKey };
    },
  },
}));

// AsyncStorage est mocké globalement (jest.config moduleNameMapper).

const mockedFetch = jest.fn();
(global as { fetch: typeof fetch }).fetch = mockedFetch;

const jsonResponse = (payload: unknown, status = 200) =>
  ({
    ok: status >= 200 && status < 300,
    status,
    json: async () => payload,
  }) as unknown as Response;

const urls = () => mockedFetch.mock.calls.map(([url]) => String(url));

beforeEach(async () => {
  mockApiKey = '';
  mockedFetch.mockReset();
  await AsyncStorage.clear();
  await resetAudiusHosts();
});

describe('audiusGet without an API key', () => {
  it('asks the registry for a node, then queries it with app_name', async () => {
    mockedFetch
      // Node registry
      .mockResolvedValueOnce(jsonResponse({ data: ['https://node-a'] }))
      // Actual request
      .mockResolvedValueOnce(jsonResponse({ data: { ok: true } }));

    await expect(
      audiusGet('/tracks/trending', { limit: '1' })
    ).resolves.toEqual({ ok: true });

    expect(urls()[0]).toBe(AUDIUS_GATEWAY_URL);
    expect(urls()[1]).toContain('https://node-a/v1/tracks/trending?');
    expect(urls()[1]).toContain('limit=1');
    expect(urls()[1]).toContain('app_name=Melodix');
  });

  it('drops a node that fails and sticks to the one that answered', async () => {
    mockedFetch
      .mockResolvedValueOnce(
        jsonResponse({ data: ['https://node-a', 'https://node-b'] })
      )
      .mockResolvedValueOnce(jsonResponse({}, 500)) // node-a dies
      .mockResolvedValueOnce(jsonResponse({ data: 1 })) // node-b works
      .mockResolvedValueOnce(jsonResponse({ data: 2 })); // next request

    await expect(audiusGet('/x')).resolves.toBe(1);
    expect(urls()[1]).toContain('node-a');
    expect(urls()[2]).toContain('node-b');

    // The healthy node is remembered: no new registry round-trip, no node-a.
    await expect(audiusGet('/y')).resolves.toBe(2);
    expect(urls()[3]).toContain('https://node-b/v1/y?');
    expect(urls()).toHaveLength(4);
  });

  it('does not cycle through nodes on a 4xx: it forwards the error', async () => {
    mockedFetch
      .mockResolvedValueOnce(jsonResponse({ data: ['https://node-a'] }))
      .mockResolvedValueOnce(jsonResponse({}, 404));

    const request = audiusGet('/playlists/nope');

    await expect(request).rejects.toBeInstanceOf(AudiusRequestError);
    await expect(request).rejects.toMatchObject({ kind: 'not-found' });

    // Registry + the single node: no point hammering the fallbacks.
    expect(urls()).toHaveLength(2);
  });

  it('rejects with a network error when every node is down', async () => {
    mockedFetch.mockRejectedValue(new TypeError('Network request failed'));

    await expect(audiusGet('/x')).rejects.toMatchObject({ kind: 'network' });
  });
});

describe('audiusGet with an API key', () => {
  it('goes through the gateway with a Bearer token', async () => {
    mockApiKey = 'key-123';
    mockedFetch.mockResolvedValueOnce(jsonResponse({ data: 'gateway' }));

    await expect(audiusGet('/tracks/trending')).resolves.toBe('gateway');

    expect(urls()[0]).toContain(`${AUDIUS_GATEWAY_URL}/v1/tracks/trending?`);
    expect(mockedFetch.mock.calls[0][1].headers.Authorization).toBe(
      'Bearer key-123'
    );
  });

  it('maps a 401 to a clear unauthorized error', async () => {
    mockApiKey = 'bad-key';
    mockedFetch.mockResolvedValueOnce(jsonResponse({}, 401));

    await expect(audiusGet('/x')).rejects.toMatchObject({
      kind: 'unauthorized',
    });
  });
});

describe('getAudiusStreamUrl', () => {
  it('points at the stream endpoint of the last healthy node', async () => {
    mockedFetch
      .mockResolvedValueOnce(jsonResponse({ data: ['https://node-a'] }))
      .mockResolvedValueOnce(jsonResponse({ data: true }));

    await audiusGet('/warm-up');

    await expect(getAudiusStreamUrl('xyz')).resolves.toBe(
      'https://node-a/v1/tracks/xyz/stream?app_name=Melodix'
    );
  });

  it('uses the gateway (and the key) when configured', async () => {
    mockApiKey = 'key-123';

    await expect(getAudiusStreamUrl('xyz')).resolves.toContain(
      `${AUDIUS_GATEWAY_URL}/v1/tracks/xyz/stream?`
    );
    await expect(getAudiusStreamUrl('xyz')).resolves.toContain(
      'api_key=key-123'
    );
  });
});
