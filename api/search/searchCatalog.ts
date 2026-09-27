import axios from 'axios';

import { SearchResultsModel } from '@models';
import { SearchResponseType } from '@config';
import { parseSearchResults } from '@utils';

import { BASE_URL, getSessionlessToken } from '../config';

// Since the February 2026 Web API update, `limit` is capped at 10 per type.
export const SEARCH_LIMIT = 10;

export const searchCatalog = async (
  query: string
): Promise<SearchResultsModel> => {
  const q = query.trim();

  if (!q) {
    return { artists: [], tracks: [], albums: [], playlists: [] };
  }

  try {
    const { token } = await getSessionlessToken();

    const response = await axios.get<SearchResponseType>(`${BASE_URL}/search`, {
      params: { q, type: 'artist,track,album,playlist', limit: SEARCH_LIMIT },
      headers: { Authorization: `Bearer ${token}` },
    });

    return parseSearchResults(response.data);
  } catch (error) {
    console.error(`Error while searching with a query: ${q}`, error);
    throw error;
  }
};
