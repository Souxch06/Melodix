import axios from 'axios';
import * as FileSystem from 'expo-file-system';

import { RecentlyPlayedModel } from '@models';
import { RecentlyPlayedResponseType } from '@config';
import { parseToRecentlyPlayed } from '@utils';

import { BASE_URL, getSessionToken } from '../config';

const fetchRecentlyPlayed = async (): Promise<RecentlyPlayedModel[]> => {
  try {
    const token = await getSessionToken();
    const response = (await axios.get(`${BASE_URL}/me/player/recently-played`, {
      params: {
        limit: 8,
      },
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })) as { data: RecentlyPlayedResponseType };

    return parseToRecentlyPlayed(response.data);
  } catch (error) {
    console.error(
      `Error fetching recently played for currently logged in user`,
      error
    );
    throw error;
  }
};

const RECENTLY_PLAYED_FILE = 'recently_played';
const MAX_RECENTLY_PLAYED = 8;

const getRecentlyPlayedFileUri = () =>
  `${FileSystem.documentDirectory}${RECENTLY_PLAYED_FILE}.json`;

/**
 * Recently played albums cached on the device (empty on the first launch).
 */
export const getRecentlyPlayed = async (): Promise<RecentlyPlayedModel[]> => {
  try {
    const fileContent = await FileSystem.readAsStringAsync(
      getRecentlyPlayedFileUri()
    );
    const parsed = JSON.parse(fileContent || '[]');

    return Array.isArray(parsed) ? parsed : [];
  } catch {
    // Nothing cached yet.
    return [];
  }
};

/**
 * Merges the latest plays from Spotify into the cache (most recent first, one
 * tile per album) and returns the updated list.
 */
export const updateRecentlyPlayed = async (): Promise<
  RecentlyPlayedModel[]
> => {
  const [cached, latest] = await Promise.all([
    getRecentlyPlayed(),
    fetchRecentlyPlayed(),
  ]);

  const merged: RecentlyPlayedModel[] = [];

  for (const item of [...latest, ...cached]) {
    if (merged.length >= MAX_RECENTLY_PLAYED) {
      break;
    }

    if (item?.id && !merged.some((mergedItem) => mergedItem.id === item.id)) {
      merged.push(item);
    }
  }

  if (JSON.stringify(merged) !== JSON.stringify(cached)) {
    try {
      await FileSystem.writeAsStringAsync(
        getRecentlyPlayedFileUri(),
        JSON.stringify(merged),
        { encoding: FileSystem.EncodingType.UTF8 }
      );
    } catch (error) {
      console.error('Error caching recently played albums', error);
    }
  }

  return merged;
};
