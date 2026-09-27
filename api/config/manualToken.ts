import { BASE_URL } from './constants';

/**
 * Page whose code tutorial shows a ready-to-use access token
 * (`const token = '…'`) once the user is logged in.
 */
export const SPOTIFY_TOKEN_PAGE_URL = 'https://developer.spotify.com/';

// Spotify access tokens last one hour.
export const PASTED_TOKEN_LIFETIME_SECONDS = 3600;

export type TokenParseResult =
  | { ok: true; token: string }
  | { ok: false; reason: 'empty' | 'placeholder' | 'malformed' };

const TOKEN_PATTERN = /^[A-Za-z0-9\-_.~+/]+=*$/;

const decodeHtmlEntities = (value: string) =>
  value
    .replace(/&#0*39;|&apos;/gi, "'")
    .replace(/&quot;/gi, '"')
    .replace(/&lt;/gi, '<')
    .replace(/&gt;/gi, '>')
    .replace(/&amp;/gi, '&');

/**
 * Finds the access token in what the user pasted: the token itself, the whole
 * code snippet of developer.spotify.com (`const token = '…';`), an
 * `Authorization: Bearer …` header or a URL containing `access_token=…`.
 */
export const extractSpotifyToken = (input: string): TokenParseResult => {
  const text = decodeHtmlEntities(input ?? '').trim();

  if (!text) {
    return { ok: false, reason: 'empty' };
  }

  const assignment = text.match(/\btoken\s*[:=]\s*(['"`])([^'"`]*)\1/i);
  const bearer = text.match(/\bBearer\s+([A-Za-z0-9\-_.~+/]+=*)/i);
  const urlParameter = text.match(/[#?&]access_token=([^&\s]+)/i);

  let candidate: string;

  if (assignment) {
    candidate = assignment[2];
  } else if (bearer) {
    candidate = bearer[1];
  } else if (urlParameter) {
    candidate = decodeURIComponent(urlParameter[1]);
  } else {
    // The token alone, possibly quoted or split over several lines.
    candidate = text.replace(/^['"`]+/, '').replace(/['"`;,]+$/, '');
  }

  candidate = candidate.replace(/[\r\n]+/g, '').trim();

  // Logged out, developer.spotify.com shows `const token = 'undefined';`.
  if (/^(undefined|null)?$/i.test(candidate)) {
    return { ok: false, reason: 'placeholder' };
  }

  if (candidate.length < 20 || !TOKEN_PATTERN.test(candidate)) {
    return { ok: false, reason: 'malformed' };
  }

  return { ok: true, token: candidate };
};

export type TokenCheckResult =
  | 'valid'
  | 'rejected'
  | 'forbidden'
  | 'unavailable'
  | 'network';

/**
 * Checks a token against GET /me. `fetch` is used on purpose: the request must
 * not go through the axios session guard.
 */
export const verifySpotifyToken = async (
  token: string,
  timeoutInMs = 15000
): Promise<TokenCheckResult> => {
  const controller =
    typeof AbortController === 'undefined' ? null : new AbortController();
  const timeout = setTimeout(() => controller?.abort(), timeoutInMs);

  try {
    const response = await fetch(`${BASE_URL}/me`, {
      headers: { Authorization: `Bearer ${token}` },
      signal: controller?.signal,
    });

    if (response.ok) {
      return 'valid';
    }

    if (response.status === 401) {
      return 'rejected';
    }

    if (response.status === 403) {
      return 'forbidden';
    }

    return 'unavailable';
  } catch (error) {
    console.error('Error checking the Spotify token:', error);
    return 'network';
  } finally {
    clearTimeout(timeout);
  }
};
