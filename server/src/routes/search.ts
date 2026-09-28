/**
 * GET /api/v1/search?q=<query>&limit=<1..20>&types=tracks,albums
 *
 * Règles : validation stricte des paramètres (400 BAD_REQUEST), limite
 * bornée, ordre de sortie déterministe (déjà assuré par le provider).
 */

import { ApiError } from '../config/types';
import { SEARCH_TYPES, type SearchType } from '../config/constants';
import { spotifyMetadataProvider } from '../spotify/spotifyMetadataProvider';

const MAX_LIMIT = 20;
const DEFAULT_LIMIT = 10;

type SearchParams = {
  q: string;
  limit: number;
  types: readonly SearchType[];
};

const parseSearchParams = (url: URL): SearchParams => {
  const q = (url.searchParams.get('q') ?? '').trim();
  if (!q) {
    throw new ApiError('BAD_REQUEST', 'Paramètre de recherche manquant.', 400);
  }
  if (q.length > 200) {
    throw new ApiError('BAD_REQUEST', 'Recherche trop longue.', 400);
  }

  const rawLimit = url.searchParams.get('limit');
  let limit = DEFAULT_LIMIT;
  if (rawLimit !== null) {
    const parsed = Number.parseInt(rawLimit, 10);
    if (!Number.isFinite(parsed) || parsed < 1 || parsed > MAX_LIMIT) {
      throw new ApiError(
        'BAD_REQUEST',
        `La limite doit être comprise entre 1 et ${MAX_LIMIT}.`,
        400
      );
    }
    limit = parsed;
  }

  const rawTypes = (url.searchParams.get('types') ?? 'tracks,albums')
    .split(',')
    .map((value) => value.trim())
    .filter(Boolean);
  const types = rawTypes.filter((value): value is SearchType =>
    (SEARCH_TYPES as readonly string[]).includes(value)
  );
  if (types.length === 0) {
    throw new ApiError('BAD_REQUEST', 'Types de recherche invalides.', 400);
  }

  return { q, limit, types };
};

export const searchHandler = async (
  url: URL
): Promise<{ status: number; body: unknown }> => {
  const params = parseSearchParams(url);
  const results = await spotifyMetadataProvider.search(
    params.q,
    params.limit,
    params.types
  );
  return { status: 200, body: { results } };
};
