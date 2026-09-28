import { LibraryItemModel } from '@models';
import { checkSaved, listSavedItems } from '@services';

/**
 * Playlists sauvegardées : bibliothèque LOCALE (aucun compte).
 */
export const getSavedPlaylists = async (): Promise<LibraryItemModel[]> => {
  return listSavedItems('playlist');
};

export const checkSavedPlaylists = async (
  playlistIds: string[]
): Promise<boolean[]> => {
  try {
    return await checkSaved('playlist', playlistIds);
  } catch (error) {
    console.error('Erreur lors de la vérification des playlists sauvegardées', error);
    return playlistIds.map(() => false);
  }
};
