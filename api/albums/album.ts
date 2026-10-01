import { AlbumModel } from '@models';

import { backendGetAlbum } from '../backend';

/**
 * Métadonnées d'album via le backend Melodix.
 * Les champs que la source publique ne fournit pas (label, copyrights…) sont
 * renvoyés vides — l'écran album n'en dépend pas pour fonctionner.
 */
export const getAlbum = async (albumId: string): Promise<AlbumModel> => {
  try {
    const dto = await backendGetAlbum(albumId);
    const tracks = dto.tracks ?? [];

    return {
      id: dto.id,
      type: 'album',
      albumType: 'album',
      name: dto.title,
      imageURL: dto.coverUrl ?? '',
      artists: [],
      releaseDate: dto.releaseDate ?? '',
      tracks: {
        total: tracks.length,
        items: tracks.map((track) => ({
          id: track.id,
          title: track.title,
          subtitle: track.artists.join(', '),
          imageURL: track.coverUrl ?? dto.coverUrl ?? undefined,
          // Métadonnées de matching (I-2) : la durée vient de la source ;
          // l'album est celui-ci par construction.
          durationMs: track.durationMs ?? null,
          albumName: dto.title,
        })),
      },
      duration: tracks.reduce(
        (total, track) => total + (track.durationMs ?? 0),
        0
      ),
      copyrights: [],
      genres: [],
      label: '',
    };
  } catch (error) {
    console.error(
      `Erreur lors de la récupération de l'album : ${albumId}`,
      error
    );
    throw error;
  }
};
