import { LibraryItemModel } from '@models';
import { checkSaved, listSavedItems } from '@services';

/**
 * Albums sauvegardés : bibliothèque LOCALE de l'utilisateur (aucun compte).
 */
export const getSavedAlbums = async (): Promise<LibraryItemModel[]> => {
  return listSavedItems('album');
};

export const checkSavedAlbums = async (
  albumIds: string[]
): Promise<boolean[]> => {
  try {
    return await checkSaved('album', albumIds);
  } catch (error) {
    console.error(
      'Erreur lors de la vérification des albums sauvegardés',
      error
    );
    return albumIds.map(() => false);
  }
};
