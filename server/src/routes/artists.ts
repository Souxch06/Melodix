/**
 * GET /api/v1/artists/:id — métadonnées d'un artiste (best-effort).
 */

import { spotifyMetadataProvider } from '../spotify/spotifyMetadataProvider';

export const artistHandler = async (
  id: string
): Promise<{ status: number; body: unknown }> => ({
  status: 200,
  body: { artist: await spotifyMetadataProvider.getArtist(id) },
});
