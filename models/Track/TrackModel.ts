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
   * remplies par api/spotify/playlist.ts (duration_ms / album) et par les
   * mappings backend (dto.durationMs / dto.album). Absentes ailleurs : le
   * matching reste possible, simplement moins discriminant (durée/album
   * neutres côté matcher).
   */
  durationMs?: number | null;
  albumName?: string | null;
};
