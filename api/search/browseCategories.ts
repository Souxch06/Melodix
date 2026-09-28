import { BROWSE_GENRES } from '@data';
import { BrowseCategoryModel } from '@models';

/**
 * « Parcourir » est désormais un catalogue STATIQUE local (voir data/genres).
 * L'ancien endpoint Spotify /browse/categories exigeait un token ; ce n'est
 * plus le mode de Melodix.
 */
export const getBrowseCategories = async (
  limit: number = 50,
  offset: number = 0
): Promise<BrowseCategoryModel[]> => {
  return BROWSE_GENRES.slice(offset, offset + limit);
};
