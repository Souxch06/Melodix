/**
 * GET /api/v1/playlists/:id — métadonnées d'une playlist (+ pistes si la
 * source publique les expose).
 */

import { spotifyMetadataProvider } from '../spotify/spotifyMetadataProvider';

export const playlistHandler = async (
  id: string
): Promise<{ status: number; body: unknown }> => ({
  status: 200,
  body: { playlist: await spotifyMetadataProvider.getPlaylist(id) },
});
