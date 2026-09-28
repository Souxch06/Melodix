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
 *   sans compte non plus) : la recherche ne casse jamais l'application.
 */
export const searchCatalog = async (
  query: string
): Promise<SearchResultsModel> => {
  const q = query.trim();
  if (!q) {
    return emptyResults();
  }

  if (isBackendConfigured()) {
    try {
      return await backendSearchCatalog(q, SEARCH_LIMIT);
    } catch (error) {
      console.warn(
        'Backend Melodix injoignable, la recherche bascule sur Audius',
        error
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
    };
  } catch (error) {
    console.error(`Erreur de recherche Audius pour : ${q}`, error);
    return emptyResults();
  }
};
