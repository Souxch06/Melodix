import type { TrackModel } from '../Track/TrackModel';

export type RecentlyPlayedModel = {
  id: string;
  title: string;
  imageURL: string;
  /**
   * I-8 : album d'origine quand connu → naviguer vers `/album/{albumId}`.
   * Sinon (entrée ancienne ou album inconnu) → JAMAIS `/album/<trackId>` :
   * `track` permet la lecture directe du morceau.
   */
  albumId?: string | null;
  /** I-8 : snapshot du morceau — sert au fallback « lecture directe ». */
  track?: TrackModel;
};
