import { getUserFollowedArtists } from './artists';
import { getSavedAlbums } from './albums';
import { getSavedShows } from './shows';
import { getSavedPlaylists } from './playlists';

import { fileSystemMiddleware } from './config';
import { LibraryItemModel } from '@models';
import { Categories } from '@config';

export type LibraryType = {
  [Categories.FOLLOWED_ARTISTS]: LibraryItemModel[];
  [Categories.SAVED_ALBUMS]: LibraryItemModel[];
  [Categories.SAVED_PODCASTS]: LibraryItemModel[];
  [Categories.SAVED_PLAYLISTS]: LibraryItemModel[];
  [Categories.DOWNLOADED]: LibraryItemModel[];
  [Categories.ALL]: LibraryItemModel[];
};

// One refused request (e.g. a permission the token doesn't have) must not
// empty the whole library: that category is simply left empty.
const orEmpty = async (
  label: string,
  request: () => Promise<LibraryItemModel[]>
): Promise<LibraryItemModel[]> => {
  try {
    return await request();
  } catch (error) {
    console.warn(`Library: ${label} unavailable`, error);
    return [];
  }
};

export const getLibrary = async (): Promise<LibraryType> => {
  const [followedArtists, savedAlbums, savedShows, savedPlaylists] =
    await Promise.all([
      orEmpty('followed artists', () => getUserFollowedArtists()),
      orEmpty('saved albums', () => getSavedAlbums()),
      orEmpty('saved shows', () => getSavedShows()),
      orEmpty('saved playlists', () => getSavedPlaylists()),
    ]);

  return {
    [Categories.FOLLOWED_ARTISTS]: followedArtists,
    [Categories.SAVED_ALBUMS]: savedAlbums,
    [Categories.SAVED_PODCASTS]: savedShows,
    [Categories.SAVED_PLAYLISTS]: savedPlaylists,
    [Categories.DOWNLOADED]: savedShows,
    [Categories.ALL]: [
      ...savedPlaylists,
      ...followedArtists,
      ...savedAlbums,
      ...savedShows,
    ],
  };
};

// eslint-disable-next-line
const getLibraryFromFileSystem = async () =>
  await fileSystemMiddleware<LibraryType>('user_library', getLibrary);
