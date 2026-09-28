import { LibraryItemModel } from '@models';
import { listSavedItems } from '@services';

/**
 * Shows/podcasts sauvegardés : bibliothèque LOCALE (aucun compte).
 */
export const getSavedShows = async (): Promise<LibraryItemModel[]> => {
  return listSavedItems('show');
};
