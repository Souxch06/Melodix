/**
 * DTO du backend Melodix (miroir de server/src/config/types.ts).
 * Aucun token, aucun identifiant interne de fournisseur ne transite ici.
 */

export type AudiusMatchDTO = {
  audiusTrackId: string;
  score: number;
};

export type TrackMetadataDTO = {
  id: string;
  title: string;
  artists: string[];
  album: string | null;
  durationMs: number | null;
  coverUrl: string | null;
  audiusMatch: AudiusMatchDTO | null;
};

export type AlbumMetadataDTO = {
  id: string;
  title: string;
  artists: string[];
  coverUrl: string | null;
  releaseDate: string | null;
  tracks: TrackMetadataDTO[] | null;
};

export type PlaylistMetadataDTO = {
  id: string;
  title: string;
  owner: string | null;
  coverUrl: string | null;
  description: string | null;
  tracks: TrackMetadataDTO[] | null;
};

export type ArtistMetadataDTO = {
  id: string;
  name: string;
  imageUrl: string | null;
  topTracks: TrackMetadataDTO[] | null;
  albums: AlbumMetadataDTO[] | null;
};

export type SearchResultsDTO = {
  tracks: TrackMetadataDTO[];
  albums: AlbumMetadataDTO[];
};
