/**
 * Token éphémère du Web Player (technique NON OFFICIELLE, isolée ici).
 *
 * Chaîne : `/api/server-time` → home publique → bundle `web-player.*.js`
 * → paire {secret, version} la plus récente → TOTP (HMAC-SHA1 sur serveur
 * horodaté) → `/api/token`. Le token est anonyme, court, et NE QUITTE
 * JAMAIS LE SERVEUR (jamais renvoyé à l'app, jamais loggé).
 *
 * Le module est remplaçable : spotifyMetadataProvider ne dépend que de
 * `getSpotifyAccessToken()`. Si Spotify fait tourner la mécanique, on
 * modifie CE FICHIER uniquement.
 *
 * Politique d'actualisation : cache TTL avec rafraîchissement en vol unique
 * (single flight) — idée reprise du projet de référence (refresh avant
 * expiration), réécrite pour Node.
 */

import { createHmac } from 'node:crypto';

import { SPOTIFY_WEB_BASE_URL } from '../config/constants';
import { TtlCache } from '../cache/ttlCache';
import { httpGet } from '../net/httpClient';
import { createLogger } from '../logging/logger';
import type { SpotifyServerTimeResponse, SpotifyTokenResponse } from './types';

const logger = createLogger('SpotifyToken');

const tokenCache = new TtlCache();
const TOKEN_CACHE_KEY = 'access-token';

/** Marge de sécurité : on considère le token expiré un peu avant sa fin. */
const EXPIRY_SAFETY_MARGIN_SECONDS = 5 * 60;

const PLAYER_JS_REGEX =
  /"(https:\/\/[^" ]+\/(?:mobile-)?web-player\.[0-9a-f]+\.js)"/;
const SECRETS_REGEX =
  /\{\s*secret\s*:\s*["']([^"']+)["']\s*,\s*version\s*:\s*(\d+)\s*\}/g;

const TOKEN_FETCH_TIMEOUT_MS = 10_000;

/** Une seule récupération en vol : pas de tempête de requêtes en cas d'expiration. */
let inFlight: Promise<string> | null = null;

const XorCharCodes = (secret: string): number[] =>
  Array.from(secret, (char, index) => char.charCodeAt(0) ^ ((index % 33) + 9));

/**
 * TOTP 6 chiffres, fenêtre 30 s, ancré sur l'horloge SERVEUR de Spotify.
 */
export const generateTotp = (
  serverTimeSeconds: number,
  secret: string
): string => {
  const transformed = XorCharCodes(secret).join('');
  const key = Buffer.from(transformed, 'utf8');

  const counter = Math.floor(serverTimeSeconds / 30);
  const counterBuffer = Buffer.alloc(8);
  counterBuffer.writeBigUInt64BE(BigInt(counter));

  const digest = createHmac('sha1', key).update(counterBuffer).digest();

  const offset = digest[digest.length - 1] & 0xf;
  const code =
    ((digest[offset] & 0x7f) << 24) |
    ((digest[offset + 1] & 0xff) << 16) |
    ((digest[offset + 2] & 0xff) << 8) |
    (digest[offset + 3] & 0xff);

  return (code % 1_000_000).toString().padStart(6, '0');
};

const fetchServerTimeSeconds = async (): Promise<number> => {
  try {
    const response = await httpGet<SpotifyServerTimeResponse>(
      `${SPOTIFY_WEB_BASE_URL}/api/server-time`,
      { timeoutMs: TOKEN_FETCH_TIMEOUT_MS, retries: 1 }
    );
    if (typeof response?.serverTime === 'number') {
      return response.serverTime;
    }
    throw new Error('sans champ serverTime');
  } catch (error) {
    // Horloge locale en secours : la fenêtre TOTP de 30 s tolère une légère
    // dérive. Loggé explicitement (pas de dégradation silencieuse).
    logger.warn(`server-time indisponible, horloge locale utilisée (${error})`);
    return Math.floor(Date.now() / 1000);
  }
};

type ScrapedSecret = { secret: string; version: number };

const scrapeLatestSecret = async (): Promise<ScrapedSecret> => {
  const homepage = await httpGet<string>(SPOTIFY_WEB_BASE_URL, {
    timeoutMs: TOKEN_FETCH_TIMEOUT_MS,
  });

  const jsMatch =
    typeof homepage === 'string' ? homepage.match(PLAYER_JS_REGEX) : null;
  if (!jsMatch) {
    throw new Error('bundle Web Player introuvable sur la page publique');
  }

  const bundleUrl = jsMatch[1];
  logger.info(`bundle Web Player repéré : ${bundleUrl}`);
  const bundleJs = await httpGet<string>(bundleUrl, {
    timeoutMs: TOKEN_FETCH_TIMEOUT_MS,
  });

  let latest: ScrapedSecret | null = null;
  if (typeof bundleJs === 'string') {
    for (const match of bundleJs.matchAll(SECRETS_REGEX)) {
      const version = Number.parseInt(match[2], 10);
      if (!latest || version > latest.version) {
        latest = { secret: match[1], version };
      }
    }
  }

  if (!latest) {
    throw new Error('paire {secret, version} introuvable dans le bundle');
  }

  logger.info(`secret TOTP version ${latest.version} repéré`);
  return latest;
};

const fetchNewToken = async (): Promise<{
  accessToken: string;
  expiresInSeconds: number;
}> => {
  const serverTime = await fetchServerTimeSeconds();
  const { secret, version } = await scrapeLatestSecret();
  const totp = generateTotp(serverTime, secret);

  const tokenUrl = new URL(`${SPOTIFY_WEB_BASE_URL}/api/token`);
  tokenUrl.searchParams.set('reason', 'init');
  tokenUrl.searchParams.set('productType', 'web-player');
  tokenUrl.searchParams.set('totp', totp);
  tokenUrl.searchParams.set('totpVer', String(version));
  tokenUrl.searchParams.set('ts', String(serverTime));

  const response = await httpGet<SpotifyTokenResponse>(tokenUrl.toString(), {
    headers: {
      Accept: 'application/json',
      Referer: `${SPOTIFY_WEB_BASE_URL}/`,
      Origin: SPOTIFY_WEB_BASE_URL,
    },
    timeoutMs: TOKEN_FETCH_TIMEOUT_MS,
  });

  if (!response?.accessToken) {
    throw new Error('pas de token dans la réponse Spotify');
  }

  const expiresAtMs =
    response.accessTokenExpirationTimestampMs ?? Date.now() + 3600_000;
  const expiresInSeconds = Math.max(
    60,
    Math.floor((expiresAtMs - Date.now()) / 1000)
  );

  logger.info(
    `token obtenu (anonyme: ${Boolean(response.isAnonymous)}, ttl: ${expiresInSeconds}s)`
  );
  return { accessToken: response.accessToken, expiresInSeconds };
};

/**
 * Token valide ou rafraîchi. Single flight : un seul refresh concurrent.
 */
export const getSpotifyAccessToken = async (): Promise<string> => {
  const cached = tokenCache.get<string>(TOKEN_CACHE_KEY);
  if (cached) {
    return cached;
  }

  if (!inFlight) {
    inFlight = fetchNewToken()
      .then(({ accessToken, expiresInSeconds }) => {
        tokenCache.set(
          TOKEN_CACHE_KEY,
          accessToken,
          Math.max(60, expiresInSeconds - EXPIRY_SAFETY_MARGIN_SECONDS)
        );
        return accessToken;
      })
      .finally(() => {
        inFlight = null;
      });
  }

  return inFlight;
};

/** Tests uniquement. */
export const __resetSpotifyAccessToken = (): void => {
  tokenCache.clear();
  inFlight = null;
};
