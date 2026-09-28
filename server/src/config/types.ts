/**
 * Contrat public du backend Melodix (JSON renvoyé à l'application Android).
 *
 * Règles :
 * - AUCUN token, secret, hash interne ou URL de fournisseur interne ne passe
 *   dans DTO. Le bundle Android est considéré public.
 * - Les champs de match Audius sont OPTIONNELS : aujourd'hui le matching de
 *   playback est fait dans l'app (services/audio/audiusTrackMatcher.ts). Le
 *   champ existe pour permettre un matching serveur ultérieur sans casser le
 *   contrat.
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
  /** null tant que le backend ne résout pas les matches serveur-side. */
  audiusMatch: AudiusMatchDTO | null;
};

export type AlbumMetadataDTO = {
  id: string;
  title: string;
  artists: string[];
  coverUrl: string | null;
  releaseDate: string | null;
  /** Pistes embarquées quand la source publique les fournit. */
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

/**
 * Codes machine, stables — l'app les traduit en messages utilisateur
 * non techniques (jamais de trace technique remontée dans l'UI).
 */
export type ApiErrorCode =
  | 'BAD_REQUEST'
  | 'NOT_FOUND'
  | 'PROVIDER_UNAVAILABLE'
  | 'RATE_LIMITED'
  | 'INTERNAL_ERROR';

export type ApiErrorBody = {
  error: {
    code: ApiErrorCode;
    /** Message générique et sûr ; les détails restent dans les logs serveur. */
    message: string;
  };
};

/** Erreur de domaine : porte le code et le statut HTTP associé. */
export class ApiError extends Error {
  constructor(
    public readonly code: ApiErrorCode,
    message: string,
    public readonly httpStatus: number,
    /** Détail technique, journal serveur UNIQUEMENT. */
    public readonly internalDetail?: string
  ) {
    super(message);
    this.name = 'ApiError';
  }
}
