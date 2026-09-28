import { LibraryItemModel } from '@models';

import { getUserTopArtists } from '../artists';
import { getRecommendations } from './getRecommendations';

/**
 * Recommandations calculées depuis les artistes locaux les plus écoutés
 * (agrégat d'historique local, aucun compte). Historique vide → tendances.
 */
export const getRecommendationsFromArtistSeeds = async (): Promise<
  LibraryItemModel[]
> => {
  try {
    const topArtists = await getUserTopArtists();
    if (topArtists.length === 0) {
      return getRecommendations({});
    }

    // Un appel par artiste en tête serait redondant : la seed principale
    // suffit à proposer une sélection cohérente.
    return await getRecommendations({ artistSeed: topArtists[0].id });
  } catch (error) {
    console.error('Erreur de recommandations (seeds artistes locaux)', error);
    return getRecommendations({});
  }
};
