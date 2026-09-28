import { LibraryItemModel } from '@models';
import { Categories } from '@config';
import { listSavedItems } from '@services';

export type LibraryType = {
  [Categories.FOLLOWED_ARTISTS]: LibraryItemModel[];
  [Categories.SAVED_ALBUMS]: LibraryItemModel[];
  [Categories.SAVED_PODCASTS]: LibraryItemModel[];
  [Categories.SAVED_PLAYLISTS]: LibraryItemModel[];
  [Categories.DOWNLOADED]: LibraryItemModel[];
  [Categories.ALL]: LibraryItemModel[];
};

/**
 * Bibliothèque = contenu de la bibliothèque LOCALE de l'utilisateur.
 * Aucune requête distante, aucun compte : tout vient d'AsyncStorage.
 */
export const getLibrary = async (): Promise<LibraryType> => {
  const [followedArtists, savedAlbums, savedShows, savedPlaylists] =
    await Promise.all([
      listSavedItems('artist'),
      listSavedItems('album'),
      listSavedItems('show'),
      listSavedItems('playlist'),
    ]);

  return {
    [Categories.FOLLOWED_ARTISTS]: followedArtists,
    [Categories.SAVED_ALBUMS]: savedAlbums,
    [Categories.SAVED_PODCASTS]: savedShows,
    [Categories.SAVED_PLAYLISTS]: savedPlaylists,
    [Categories.DOWNLOADED]: [],
    [Categories.ALL]: [
      ...savedPlaylists,
      ...followedArtists,
      ...savedAlbums,
      ...savedShows,
    ],
  };
};
