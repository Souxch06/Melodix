import { checkSavedItems } from '../library';

export const checkSavedTracks = async (
  trackIds: string[]
): Promise<boolean[]> => {
  try {
    return await checkSavedItems('track', trackIds);
  } catch (error) {
    console.error('Error fetching saved tracks data:', error);
    throw error;
  }
};
