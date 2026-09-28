import { checkSaved } from '@services';

export type LibraryItemType =
  | 'track'
  | 'album'
  | 'playlist'
  | 'artist'
  | 'show'
  | 'episode';

/**
 * « X est-il sauvegardé ? » — désormais 100 % LOCAL (aucun compte, aucun
 * réseau). La signature et l'alignement des réponses sur `ids` sont inchangés
 * par rapport à l'ancienne implémentation (/me/library/contains).
 *
 * 'episode' n'existe pas dans la bibliothèque locale (les épisodes ne sont
 * plus jouables sans catalogue associé) → toujours `false`, sans erreur.
 */
export const checkSavedItems = async (
  type: LibraryItemType,
  ids: string[]
): Promise<boolean[]> => {
  if (type === 'episode') {
    return ids.map(() => false);
  }
  return checkSaved(type, ids);
};
