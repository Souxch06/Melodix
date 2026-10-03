import { SearchResultsModel } from '@models';
import { isBackendConfigured } from '@services';

import { audiusTrackToLibraryItem, searchAudiusTracks } from '../audius';
import { backendSearchCatalog } from '../backend';

export const SEARCH_LIMIT = 10;

const emptyResults = (): SearchResultsModel => ({
  artists: [],
  tracks: [],
  albums: [],
  playlists: [],
});

/**
 * Recherche catalogue Melodix.
 *
 * - Backend configuré ET joignable → métadonnées Spotify (catalogue complet,
 *   sans aucun compte pour l'utilisateur).
 * - Backend absent/joignable mal → REPLI Audius (catalogue audio direct,
 *   sans compte non plus).
 * - Si les deux sources échouent, l'erreur est propagée afin que l'UI affiche
 *   un véritable état réseau, jamais un faux « aucun résultat ».
 */
export const searchCatalog = async (
  query: string
): Promise<SearchResultsModel> => {
  const q = query.trim();
  if (!q) {
    return emptyResults();
  }

  const backendConfigured = isBackendConfigured();
  let backendUnavailable = false;
  if (backendConfigured) {
    try {
      return await backendSearchCatalog(q, SEARCH_LIMIT);
    } catch (error) {
      backendUnavailable = true;
      // Ne jamais inclure la requête utilisateur dans ce diagnostic.
      console.warn(
        'Backend Melodix injoignable, la recherche bascule sur Audius',
        error instanceof Error ? error.name : typeof error
      );
    }
  }

  try {
    const tracks = await searchAudiusTracks(q, SEARCH_LIMIT);
    return {
      artists: [],
      tracks: tracks.map(audiusTrackToLibraryItem),
      albums: [],
      playlists: [],
      ...(backendUnavailable ? { degraded: true } : {}),
    };
  } catch (error) {
    // La requête et les détails réseau peuvent contenir des données privées.
    console.error(
      'Erreur de recherche Audius',
      error instanceof Error ? error.name : typeof error
    );
    throw error;
  }
};
