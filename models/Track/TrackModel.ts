export type TrackModel = {
  id: string;
  title: string;
  subtitle: string;
  imageURL?: string;
  isSaved?: boolean;
  isDownloaded?: boolean;
  isPlaying?: boolean;
  explicit?: boolean;
  /**
   * Métadonnées de matching (I-2), connues quand la source les expose —
   * aujourd'hui remplies par api/spotify/playlist.ts (duration_ms / album) ;
   * absentes ailleurs : le matching reste possible, simplement moins
   * discriminant (durée/album neutres côté matcher).
   */
  durationMs?: number;
  albumName?: string;
};
