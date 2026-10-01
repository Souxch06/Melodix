import Constants from 'expo-constants';

import { backendGet, getBackendBaseUrl, isBackendConfigured } from '../client';

// expoConfig est lu à chaque appel par le client : muter le même objet suffit
// (expoConfig n'est ni configurable ni assignable en environnement de test).
jest.mock('expo-constants', () => ({
  __esModule: true,
  default: { expoConfig: { extra: {} } },
}));

const expoConfigMutable = Constants.expoConfig as {
  extra: Record<string, unknown>;
};

/** Réponse fetch factice : le constructeur Response n existe pas ici. */
const fakeResponse = (
  body: unknown,
  status = 200
): { ok: boolean; status: number; json: () => Promise<unknown> } => ({
  ok: status >= 200 && status < 300,
  status,
  json: async () => body,
});

const setBackendUrl = (url: unknown) => {
  expoConfigMutable.extra.melodixBackendUrl = url;
};

describe('getBackendBaseUrl', () => {
  afterEach(() => {
    expoConfigMutable.extra = {};
  });

  it('renvoie l URL configurée, normalisée sans slash final', () => {
    setBackendUrl('https://api.melodix.fr/');
    expect(getBackendBaseUrl()).toBe('https://api.melodix.fr');
    expect(isBackendConfigured()).toBe(true);
  });

  it('backend non configuré → chaîne vide', () => {
    setBackendUrl('');
    expect(getBackendBaseUrl()).toBe('');
    expect(isBackendConfigured()).toBe(false);

    setBackendUrl(undefined);
    expect(isBackendConfigured()).toBe(false);
  });
});

describe('backendGet', () => {
  const originalFetch = globalThis.fetch;

  afterEach(() => {
    expoConfigMutable.extra = {};
    globalThis.fetch = originalFetch;
    jest.restoreAllMocks();
  });

  it('échoue proprement quand le backend n est pas configuré', async () => {
    setBackendUrl('');
    await expect(backendGet('/api/v1/search')).rejects.toMatchObject({
      name: 'BackendError',
      kind: 'unavailable',
    });
  });

  it('effectue un GET JSON avec paramètres d URL', async () => {
    setBackendUrl('https://api.melodix.fr');
    const fetchMock = jest.fn(async () =>
      fakeResponse({ results: { tracks: [] } })
    );
    globalThis.fetch = fetchMock as unknown as typeof fetch;

    const data = await backendGet<{ results: { tracks: unknown[] } }>(
      '/api/v1/search',
      { q: 'daft punk', limit: '5' }
    );

    expect(data.results.tracks).toEqual([]);
    const calledUrl = (fetchMock.mock.calls[0] as unknown as [string])[0];
    expect(calledUrl).toContain('https://api.melodix.fr/api/v1/search?');
    expect(calledUrl).toContain('q=daft+punk');
    expect(calledUrl).toContain('limit=5');

    // AUCUN secret ne part vers le backend : pas d en-tête Authorization.
    const options = (
      fetchMock.mock.calls[0] as unknown as [string, RequestInit]
    )[1];
    expect(options?.headers && 'Authorization' in options.headers).toBe(false);
  });

  it('propage le code et le message d erreur du backend', async () => {
    setBackendUrl('https://api.melodix.fr');
    globalThis.fetch = jest.fn(async () =>
      fakeResponse(
        {
          error: {
            code: 'PROVIDER_UNAVAILABLE',
            message: 'Service de recherche temporairement indisponible.',
          },
        },
        503
      )
    ) as unknown as typeof fetch;

    await expect(backendGet('/api/v1/tracks/x')).rejects.toMatchObject({
      name: 'BackendError',
      kind: 'http',
      code: 'PROVIDER_UNAVAILABLE',
      status: 503,
    });
  });

  it('statut non JSON → erreur http générique', async () => {
    setBackendUrl('https://api.melodix.fr');
    globalThis.fetch = jest.fn(async () => ({
      ok: false,
      status: 502,
      json: async () => {
        throw new Error('not json');
      },
    })) as unknown as typeof fetch;

    await expect(backendGet('/x')).rejects.toMatchObject({
      kind: 'http',
      status: 502,
    });
  });

  it('panne réseau → kind network', async () => {
    setBackendUrl('https://api.melodix.fr');
    globalThis.fetch = jest.fn(async () => {
      throw new TypeError('network failure');
    }) as unknown as typeof fetch;

    await expect(backendGet('/x')).rejects.toMatchObject({
      name: 'BackendError',
      kind: 'network',
    });
  });
});
