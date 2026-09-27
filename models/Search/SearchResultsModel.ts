import { LibraryItemModel } from '../LibraryItem';

export type SearchResultsModel = {
  artists: LibraryItemModel[];
  // Songs link to their album page (the app has no track page).
  tracks: LibraryItemModel[];
  albums: LibraryItemModel[];
  playlists: LibraryItemModel[];
};
