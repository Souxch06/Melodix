import axios from 'axios';

import { PlaylistModel, TrackModel } from '@models';
import { PlaylistItemResponseType, PlaylistResponseType } from '@config';
import { parseFromPlaylistItemsToTracks, parseToPlaylist } from '@utils';

import { BASE_URL, getSessionlessToken } from '../config';

export const getPlaylist = async (
  playlistId: string
): Promise<PlaylistModel> => {
  try {
    const { token } = await getSessionlessToken();

    const response = (await axios.get(`${BASE_URL}/playlists/${playlistId}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })) as { data: PlaylistResponseType };

    return parseToPlaylist(response.data);
  } catch (error) {
    console.error(`Error fetching playlist with an ID: ${playlistId}`, error);
    throw error;
  }
};

// February 2026 Web API: /playlists/{id}/tracks was replaced by
// /playlists/{id}/items, which only works for playlists the user owns or
// collaborates on (other playlists answer 403).
export const getPlaylistItems = async ({
  playlistId,
  limit,
  offset,
}: {
  playlistId: string;
  limit: number;
  offset: number;
}): Promise<TrackModel[]> => {
  try {
    const { token } = await getSessionlessToken();

    const response = await axios.get<{
      items?: PlaylistItemResponseType[];
      total: number;
    }>(`${BASE_URL}/playlists/${playlistId}/items`, {
      params: { limit, offset, additional_types: 'track' },
      headers: { Authorization: `Bearer ${token}` },
    });

    return parseFromPlaylistItemsToTracks(response.data.items ?? []);
  } catch (error) {
    console.error(`Error fetching items of playlist: ${playlistId}`, error);
    throw error;
  }
};
