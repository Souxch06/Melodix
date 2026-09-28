import { LocalTrackEntry, checkSaved, listSavedTracks } from '@services';

/**
 * Morceaux sauvegardés : bibliothèque LOCALE (aucun compte).
 */
export const getSavedTracks = async (): Promise<LocalTrackEntry[]> => {
  return listSavedTracks();
};

export const checkSavedTracks = async (
  trackIds: string[]
): Promise<boolean[]> => {
  try {
    return await checkSaved('track', trackIds);
  } catch (error) {
    console.error('Erreur lors de la vérification des morceaux sauvegardés', error);
    return trackIds.map(() => false);
  }
};
