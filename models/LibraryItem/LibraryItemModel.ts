export type LibraryItemModel = {
  id: string;
  // 'track' only exists in guest (Audius) mode: a playable card that starts
  // playback instead of navigating. It never appears in Spotify data.
  type: 'artist' | 'album' | 'show' | 'playlist' | 'track';
  title: string;
  imageURL: string;
  subtitle: string;
  ownerId?: string;
};
