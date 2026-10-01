export type LibraryItemModel = {
  id: string;
  // 'track' only exists in guest (Audius) mode: a playable card that starts
  // playback instead of navigating. It never appears in Spotify data.
  type: 'artist' | 'album' | 'show' | 'playlist' | 'track';
  title: string;
  imageURL: string;
  subtitle: string;
  ownerId?: string;
  /** Playlists Spotify : nombre total de titres (affiché sur la carte). */
  totalTracks?: number;
  /**
   * Métadonnées de matching (I-2) pour les items de type 'track' (recherche,
   * recommandations) : propagées au PlayerTrack → matcher. null/absentes si
   * la source ne les fournit pas.
   */
  durationMs?: number | null;
  albumName?: string | null;
};
