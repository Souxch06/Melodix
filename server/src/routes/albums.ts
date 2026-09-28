/**
 * GET /api/v1/albums/:id — métadonnées d'un album (+ pistes si la source
 * publique les expose).
 */

import { spotifyMetadataProvider } from '../spotify/spotifyMetadataProvider';

export const albumHandler = async (
  id: string
): Promise<{ status: number; body: unknown }> => ({
  status: 200,
  body: { album: await spotifyMetadataProvider.getAlbum(id) },
});
