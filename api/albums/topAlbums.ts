import { LibraryItemModel } from '@models';
import { getTopAlbumsFromHistory } from '@services';

/**
 * « Vos albums en tête » = agrégat de l'historique de lecture local
 * (compte de lectures par album). Sans historique, la section est vide —
 * l'écran d'accueil la masque.
 */
export const getUserTopAlbums = async (): Promise<LibraryItemModel[]> => {
  const top = await getTopAlbumsFromHistory(6);
  return top.map((album) => ({
    id: album.id,
    type: 'album',
    title: album.title,
    subtitle: album.subtitle,
    imageURL: album.imageURL ?? '',
  }));
};
