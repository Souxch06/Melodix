import axios from 'axios';

import { BASE_URL, getSessionToken } from '../config';

// GET /me/library/contains accepts at most 40 Spotify URIs per request.
export const MAX_URIS_PER_REQUEST = 40;

export type LibraryItemType =
  | 'track'
  | 'album'
  | 'playlist'
  | 'artist'
  | 'show'
  | 'episode';

/**
 * Checks whether items are in the current user's library (saved or followed).
 *
 * Uses the generic endpoint introduced by the February 2026 Web API update,
 * which replaced /me/tracks/contains, /me/albums/contains and
 * /playlists/{id}/followers/contains. The result keeps the order of `ids`;
 * empty IDs (local or unavailable items) are reported as not saved.
 */
export const checkSavedItems = async (
  type: LibraryItemType,
  ids: string[]
): Promise<boolean[]> => {
  const result = ids.map(() => false);
  const indexed = ids
    .map((id, index) => ({ id, index }))
    .filter(({ id }) => Boolean(id));

  if (!indexed.length) {
    return result;
  }

  const token = await getSessionToken();
  const chunks: (typeof indexed)[] = [];

  for (let i = 0; i < indexed.length; i += MAX_URIS_PER_REQUEST) {
    chunks.push(indexed.slice(i, i + MAX_URIS_PER_REQUEST));
  }

  const responses = await Promise.all(
    chunks.map((chunk) =>
      axios.get<boolean[]>(`${BASE_URL}/me/library/contains`, {
        params: {
          uris: chunk.map(({ id }) => `spotify:${type}:${id}`).join(','),
        },
        headers: { Authorization: `Bearer ${token}` },
      })
    )
  );

  responses.forEach((response, chunkIndex) => {
    chunks[chunkIndex].forEach(({ index }, i) => {
      result[index] = Boolean(response.data?.[i]);
    });
  });

  return result;
};
