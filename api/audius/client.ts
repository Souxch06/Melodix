import Constants from 'expo-constants';
import AsyncStorage from '@react-native-async-storage/async-storage';

import { AUDIUS_APP_NAME, AUDIUS_HOST_CACHE_KEY } from './constants';

/**
 * Low-level Audius client.
 *
 * The Open Audio Protocol is served by a decentralized network of discovery
 * nodes:
 * - https://api.audius.co returns the list of currently healthy nodes;
 * - each node then answers /v1/* requests with the simple `app_name`
 *   identifier. No account, no key, nothing for the user to configure.
 *
 * A free API key (AUDIUS_API_KEY at build time, registered on the Audius
 * developer dashboard by the app maintainer — never by the user) switches the
 * client to the managed gateway with higher rate limits.
 *
 * Resilience: every request has a timeout, and a node that times out or
 * answers 5xx is dropped for the next one, so a node outage never leaves the
 * app on a dead endpoint. If the Audius API changes or blocks requests, the
 * guest mode shows a normal error state — the app keeps running and the
 * Spotify mode is not affected.
 */

// V30 : 6 s par requête nœud (12 s auparavant). Le moteur de recherche
// progressive borne de toute façon la source Audius à 7,5 s : un nœud plus
// lent que cela ne peut PAS être attendu sans bloquer l'affichage des autres
// sources. Le flux audio n'est pas affecté (URL construite, pas fetchée ici).
const REQUEST_TIMEOUT_MS = 6000;

// V30 : budget « premier contact » du registre de nœuds. Avant, la PREMIÈRE
// requête sans nœud en cache attendait le registre jusqu'au timeout complet
// (12 s) avant même d'interroger un nœud — une des causes des recherches à
// ~20 s. Désormais : le registre a 1,5 s pour répondre ; sinon la requête
// part immédiatement sur les nœuds de repli, et la réponse tardive du
// registre (si elle arrive) alimente les requêtes SUIVANTES.
const REGISTRY_FAST_BUDGET_MS = 1500;

export const AUDIUS_GATEWAY_URL = 'https://api.audius.co';

// Well-known community discovery nodes, used when the node registry itself
// cannot be reached (the list is refreshed at runtime when possible).
const FALLBACK_HOSTS = [
  'https://discoveryprovider.audius.co',
  'https://discoveryprovider2.audius.co',
  'https://discoveryprovider3.audius.co',
];

export type AudiusRequestErrorKind =
  | 'network'
  | 'unauthorized'
  | 'not-found'
  | 'http';

export class AudiusRequestError extends Error {
  kind: AudiusRequestErrorKind;
  status?: number;

  constructor(kind: AudiusRequestErrorKind, message: string, status?: number) {
    super(message);
    this.name = 'AudiusRequestError';
    this.kind = kind;
    this.status = status;
  }
}

export const getAudiusApiKey = (): string => {
  const key = Constants.expoConfig?.extra?.audiusApiKey;

  return typeof key === 'string' ? key.trim() : '';
};

// The selected node is cached in memory (per app run) and in AsyncStorage
// (between runs) so the app opens instantly, even before the registry answers.
let inMemoryHost: string | null = null;
let hostPromise: Promise<string> | null = null;
let discoveredHosts: string[] | null = null;

export class JsonHttpError extends Error {
  status: number;

  constructor(status: number, message: string) {
    super(message);
    this.name = 'JsonHttpError';
    this.status = status;
  }
}

const trimHost = (host: unknown): string =>
  typeof host === 'string' ? host.replace(/\/+$/, '') : '';

export const fetchJson = async (
  url: string,
  headers?: Record<string, string>
): Promise<unknown> => {
  const controller =
    typeof AbortController === 'undefined' ? null : new AbortController();
  const timeout = setTimeout(() => controller?.abort(), REQUEST_TIMEOUT_MS);

  try {
    const response = await fetch(url, {
      headers: { Accept: 'application/json', ...headers },
      signal: controller?.signal,
    });

    if (!response.ok) {
      throw new JsonHttpError(
        response.status,
        `Audius answered ${response.status} for ${url}`
      );
    }

    return await response.json();
  } catch (error) {
    if (error instanceof JsonHttpError) {
      throw error;
    }

    // AbortError (timeout) and connection failures both mean: try another node.
    throw new AudiusRequestError(
      'network',
      `Audius is unreachable: ${String(error)}`
    );
  } finally {
    clearTimeout(timeout);
  }
};

const parseRegistryHosts = (payload: unknown): string[] => {
  const data = (payload as { data?: unknown } | null)?.data;

  if (!Array.isArray(data)) {
    return [];
  }

  return data.map(trimHost).filter((host) => host.startsWith('https://'));
};

const fetchDiscoveryHosts = async (): Promise<string[]> => {
  // The registry endpoint answers `{ data: ["https://…", …] }`.
  const registryLookup = (async (): Promise<string[]> => {
    const payload = await fetchJson(AUDIUS_GATEWAY_URL);
    return parseRegistryHosts(payload);
  })();

  let timer: ReturnType<typeof setTimeout> | undefined;

  try {
    // Voie RAPIDE : le registre a un budget borné. S'il répond à temps, sa
    // liste fait foi (comportement historique, verrouillé par les tests).
    const fast = await Promise.race([
      registryLookup.then((hosts) => hosts).catch(() => null),
      new Promise<null>((resolve) => {
        timer = setTimeout(() => resolve(null), REGISTRY_FAST_BUDGET_MS);
      }),
    ]);

    if (fast && fast.length) {
      discoveredHosts = fast;
      return fast;
    }
  } catch (error) {
    console.warn('Audius node registry unreachable, using fallbacks', error);
  } finally {
    if (timer !== undefined) {
      clearTimeout(timer);
    }
  }

  // Budget dépassé ou registre muet : la requête part sur les replis SANS
  // attendre. Si le registre répond plus tard, sa liste servira aux requêtes
  // suivantes (aucun résultat perdu, aucune seconde requête registre).
  void registryLookup
    .then((hosts) => {
      if (hosts.length) {
        discoveredHosts = hosts;
      }
    })
    .catch(() => {
      // Déjà signalé par la voie rapide : rien de plus à faire.
    });

  return FALLBACK_HOSTS;
};

const getCandidateHosts = async (): Promise<string[]> => {
  const hosts = discoveredHosts ?? (await fetchDiscoveryHosts());

  // The last working node first, then the registry, then the static fallbacks
  // (always kept as a safety net).
  const ordered = [
    ...(inMemoryHost ? [inMemoryHost] : []),
    ...hosts,
    ...FALLBACK_HOSTS,
  ];

  return [...new Set(ordered.filter(Boolean))];
};

const rememberHost = async (host: string) => {
  inMemoryHost = host;

  try {
    await AsyncStorage.setItem(AUDIUS_HOST_CACHE_KEY, host);
  } catch (error) {
    console.warn('Failed to cache the Audius node', error);
  }
};

const resolveHost = async (): Promise<string> => {
  if (inMemoryHost) {
    return inMemoryHost;
  }

  if (!hostPromise) {
    hostPromise = (async () => {
      // Restore the node that worked last time, if any.
      try {
        const cached = trimHost(
          await AsyncStorage.getItem(AUDIUS_HOST_CACHE_KEY)
        );

        if (cached) {
          inMemoryHost = cached;
          return cached;
        }
      } catch (error) {
        console.warn('Failed to read the cached Audius node', error);
      }

      const [first] = await getCandidateHosts();
      inMemoryHost = first ?? FALLBACK_HOSTS[0];

      return inMemoryHost;
    })().finally(() => {
      hostPromise = null;
    });
  }

  return hostPromise;
};

// React Native (Hermes) has no reliable URLSearchParams: build the query
// string manually, like toFormBody does for the Spotify token requests.
export const toQueryString = (params: Record<string, string>) =>
  Object.entries(params)
    .filter(([, value]) => value !== '')
    .map(
      ([key, value]) =>
        `${encodeURIComponent(key)}=${encodeURIComponent(value)}`
    )
    .join('&');

const buildUrl = (host: string, path: string, params: Record<string, string>) =>
  `${host}/v1${path}?${toQueryString({ ...params, app_name: AUDIUS_APP_NAME })}`;

// With an API key, all traffic goes through the managed gateway.
const requestViaGateway = async <T>(
  path: string,
  params: Record<string, string>,
  apiKey: string
): Promise<T> => {
  const url = buildUrl(AUDIUS_GATEWAY_URL, path, params);

  try {
    const payload = (await fetchJson(url, {
      Authorization: `Bearer ${apiKey}`,
    })) as { data?: T };

    return (payload?.data ?? null) as T;
  } catch (error) {
    if (error instanceof JsonHttpError && error.status === 401) {
      throw new AudiusRequestError(
        'unauthorized',
        'The Audius API key was refused (401). Check AUDIUS_API_KEY.',
        401
      );
    }

    if (error instanceof JsonHttpError) {
      throw new AudiusRequestError(
        error.status === 404 ? 'not-found' : 'http',
        error.message,
        error.status
      );
    }

    throw error;
  }
};

const toRequestError = (error: unknown): AudiusRequestError => {
  if (error instanceof JsonHttpError) {
    return new AudiusRequestError(
      error.status === 404 ? 'not-found' : 'http',
      error.message,
      error.status
    );
  }

  return error instanceof AudiusRequestError
    ? error
    : new AudiusRequestError('network', String(error));
};

const requestViaDiscoveryNodes = async <T>(
  path: string,
  params: Record<string, string>
): Promise<T> => {
  await resolveHost();

  let lastError: unknown = null;

  for (const host of await getCandidateHosts()) {
    try {
      const payload = (await fetchJson(buildUrl(host, path, params))) as {
        data?: T;
      };

      await rememberHost(host);

      return (payload?.data ?? null) as T;
    } catch (error) {
      const requestError = toRequestError(error);
      lastError = requestError;

      // A 4xx is a real answer (bad id, refused key): keep using the node and
      // forward the error instead of cycling pointlessly.
      if (
        requestError.kind !== 'network' &&
        requestError.status !== undefined &&
        requestError.status < 500
      ) {
        await rememberHost(host);
        throw requestError;
      }

      // Network error or 5xx: drop the node and try the next one.
      if (inMemoryHost === host) {
        inMemoryHost = null;
      }
    }
  }

  throw lastError instanceof Error
    ? lastError
    : new AudiusRequestError('network', 'Every Audius node failed.');
};

/**
 * GET on the Audius API, unwrapping the `{ data: … }` envelope.
 * `params` values are query-string encoded; `app_name` is added automatically.
 */
export const audiusGet = async <T>(
  path: string,
  params: Record<string, string> = {}
): Promise<T> => {
  const apiKey = getAudiusApiKey();

  if (apiKey) {
    return requestViaGateway<T>(path, params, apiKey);
  }

  return requestViaDiscoveryNodes<T>(path, params);
};

/**
 * Direct URL of a track's audio stream. The player follows Audius's own
 * redirect to the content node: streaming is a documented feature of the Open
 * Audio Protocol — no scraping, no key required without the gateway.
 */
export const getAudiusStreamUrl = async (trackId: string): Promise<string> => {
  const apiKey = getAudiusApiKey();

  if (apiKey) {
    return buildUrl(AUDIUS_GATEWAY_URL, `/tracks/${trackId}/stream`, {
      api_key: apiKey,
    });
  }

  // Prefer the last healthy node: some players handle redirects poorly.
  const host = inMemoryHost ?? (await resolveHost());

  return `${host}/v1/tracks/${trackId}/stream?app_name=${AUDIUS_APP_NAME}`;
};

/** Test hook: forget the selected node (also wipes the persisted cache). */
export const resetAudiusHosts = async () => {
  inMemoryHost = null;
  discoveredHosts = null;

  try {
    await AsyncStorage.removeItem(AUDIUS_HOST_CACHE_KEY);
  } catch {
    // Best effort.
  }
};
