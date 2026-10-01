import { ArtistModel } from '@models';

import { backendGetArtist } from '../backend';

/**
 * Métadonnées d'artiste via le backend Melodix.
 */
export const getArtist = async (artistId: string): Promise<ArtistModel> => {
  try {
    const dto = await backendGetArtist(artistId);
    return {
      type: 'artist',
      id: dto.id,
      name: dto.name,
      imageURL: dto.imageUrl ?? '',
    };
  } catch (error) {
    console.error(
      `Erreur lors de la récupération de l'artiste : ${artistId}`,
      error
    );
    throw error;
  }
};
