import { LibraryItemModel } from '@models';
import { getTopArtistsFromHistory } from '@services';

/**
 * « Vos artistes en tête » = agrégat de l'historique de lecture local.
 *
 * Les identifiants « artiste » du catalogue n'existent plus sans compte :
 * la carte porte un id synthétique stable `local-artist:<nom normalisé>`,
 * utilisé pour l'affichage et les seeds de recommandations par NOM.
 */
export const getUserTopArtists = async (): Promise<LibraryItemModel[]> => {
  const top = await getTopArtistsFromHistory(5);
  return top.map((artist) => ({
    id: `local-artist:${artist.name.toLowerCase().replace(/\s+/g, '-')}`,
    type: 'artist',
    title: artist.name,
    subtitle: '',
    imageURL: artist.imageURL ?? '',
  }));
};
