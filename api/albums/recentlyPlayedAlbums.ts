import { RecentlyPlayedModel } from '@models';
import { getRecentlyPlayedAlbumLike } from '@services';

/**
 * « Écoutés récemment » = historique de lecture LOCAL (sans compte).
 * L'ancienne implémentation interrogeait /me/player/recently-played ;
 * Melodix 3.0 s'appuie sur l'historique de l'appareil, qui survit à la
 * fermeture de l'app et ne quitte jamais le téléphone.
 */
export const getRecentlyPlayed = async (): Promise<RecentlyPlayedModel[]> => {
  const items = await getRecentlyPlayedAlbumLike(8);
  return items.map((item) => ({
    id: item.id,
    title: item.title,
    imageURL: item.imageURL ?? '',
  }));
};

/**
 * Conservée pour compatibilité : rafraîchir revient simplement à relire
 * l'historique local (rien à fusionner, aucune donnée distante).
 */
export const updateRecentlyPlayed = async (): Promise<RecentlyPlayedModel[]> => {
  return getRecentlyPlayed();
};
