import type { LibraryItemModel } from '../LibraryItem';
import type { TrackModel } from '../Track';

export type ArtistModel = {
  type: 'artist';
  id: string;
  name: string;
  imageURL: string;
  /** Morceaux publics fournis par la fiche Spotify embed, sans audio privé. */
  topTracks?: TrackModel[];
  /** Discographie quand le backend peut la déduire de la source publique. */
  albums?: LibraryItemModel[];
};
