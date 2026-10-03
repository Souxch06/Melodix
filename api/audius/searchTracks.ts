import type { AudiusTrackResponseType } from '@config';

import { audiusGet } from './client';

/**
 * Audius track search, used by the audio layer to match a Spotify source
 * track to a playable Audius track (Open Audio Protocol). Returns the raw
 * tracks with user/artwork/duration so the matcher can score candidates.
 */

export type AudiusTrackMatch = AudiusTrackResponseType & { id: string };

const hasId = (
  track: AudiusTrackResponseType | null | undefined
): track is AudiusTrackMatch => Boolean(track && track.id);

export const searchAudiusTracks = async (
  query: string,
  limit = 8
): Promise<AudiusTrackMatch[]> => {
  const q = query.trim();

  if (!q) {
    return [];
  }

  const params = { query: q, limit: String(limit) };

  try {
    // Most nodes answer the aggregate endpoint with a `tracks` array…
    const results = await audiusGet<{
      tracks?: (AudiusTrackResponseType | null)[] | null;
    }>('/search', params);

    return (results?.tracks ?? []).filter((track): track is AudiusTrackMatch =>
      hasId(track)
    );
  } catch (error) {
    // …and some (older) nodes only serve the per-type endpoint.
    console.warn('Audius /search failed, trying /tracks/search', error);

    // Ne pas convertir une deuxième panne réseau en « zéro résultat » : le
    // resolver doit distinguer une indisponibilité temporaire d'un vrai
    // no-match, sinon il persisterait un cache négatif pendant 24 heures.
    const fallbackTracks: (AudiusTrackResponseType | null)[] = await audiusGet<
      (AudiusTrackResponseType | null)[]
    >('/tracks/search', {
      ...params,
      app_user_id: 'Melodix',
    });

    return fallbackTracks.filter(hasId);
  }
};
