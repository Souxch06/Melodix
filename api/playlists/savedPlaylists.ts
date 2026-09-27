import axios from 'axios';

import { SavedPlaylistsResponseType } from '@config';
import { parseFromSavedPlaylistsToLibraryItem } from '@utils';
import { LibraryItemModel } from '@models';

import { BASE_URL, getSessionToken, fileSystemMiddleware } from '../config';
import { checkSavedItems } from '../library';

export const checkSavedPlaylists = async (
  playlistIds: string[]
): Promise<boolean[]> => {
  try {
    return await checkSavedItems('playlist', playlistIds);
  } catch (error) {
    console.error('Error fetching saved playlists data:', error);
    throw error;
  }
};

export const getSavedPlaylists = async (
  offset: number = 0,
  numberOfCalls: number = 0
): Promise<LibraryItemModel[]> => {
  try {
    const maxAllowedLimit = 50;
    const token = await getSessionToken();

    const response = (await axios.get(`${BASE_URL}/me/playlists`, {
      params: {
        limit: maxAllowedLimit,
        offset: offset,
      },
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })) as { data: SavedPlaylistsResponseType };

    const { total } = response.data;
    const numberOfMaxCalls = Math.ceil(total / maxAllowedLimit) - 1;
    const result = parseFromSavedPlaylistsToLibraryItem(response.data.items);
    if (total / maxAllowedLimit <= 1 || numberOfCalls >= numberOfMaxCalls) {
      return result;
    }

    numberOfCalls++;
    offset += maxAllowedLimit;
    const next = await getSavedPlaylists(offset, numberOfCalls);

    return [...result, ...next];
  } catch (error) {
    console.error(
      `Error fetching saved playlists of currently logged in user`,
      error
    );
    throw error;
  }
};

// eslint-disable-next-line
const getSavedPlaylistsFileSystem = async () =>
  await fileSystemMiddleware<LibraryItemModel[]>(
    'user_saved_playlists',
    getSavedPlaylists
  );
