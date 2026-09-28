import { LibraryItemModel } from '@models';
import { listSavedItems } from '@services';

/**
 * Artistes « suivis » : bibliothèque LOCALE (aucun compte).
 * L'ancienne implémentation paginait /me/following.
 */
export const getUserFollowedArtists = async (): Promise<LibraryItemModel[]> => {
  return listSavedItems('artist');
};
