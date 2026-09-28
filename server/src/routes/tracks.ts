/**
 * GET /api/v1/tracks/:id — métadonnées d'un titre.
 */

import { spotifyMetadataProvider } from '../spotify/spotifyMetadataProvider';

export const trackHandler = async (
  id: string
): Promise<{ status: number; body: unknown }> => ({
  status: 200,
  body: { track: await spotifyMetadataProvider.getTrack(id) },
});
