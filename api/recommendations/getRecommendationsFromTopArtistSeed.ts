import { LibraryItemModel } from '@models';

import { getUserTopArtists } from '../artists';
import { getRecommendations } from './getRecommendations';

/**
 * Variante « après écoute » : recommandations autour de l'artiste le plus
 * écouté localement. Historique vide → section vide (l'écran d'accueil la
 * masque via son état de chargement).
 */
export const getRecommendationsFromTopArtistSeed = async (): Promise<{
  recommendations: LibraryItemModel[];
  artist: LibraryItemModel;
} | null> => {
  try {
    const topArtists = await getUserTopArtists();
    if (topArtists.length === 0) {
      return null;
    }
    const artist = topArtists[0];
    return {
      recommendations: await getRecommendations({ artistSeed: artist.id }),
      artist,
    };
  } catch (error) {
    console.error('Erreur de recommandations (top artiste local)', error);
    return null;
  }
};
