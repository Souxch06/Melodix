/**
 * Formes BRUTES des réponses Spotify (internes Web Player, non officielles).
 * Elles ne quittent jamais ce dossier : spotifyMetadataProvider les normalise
 * en DTO Melodix avant toute sortie vers l'app.
 */

export type SpotifyServerTimeResponse = {
  serverTime?: number;
};

export type SpotifyTokenResponse = {
  accessToken?: string;
  accessTokenExpirationTimestampMs?: number;
  isAnonymous?: boolean;
};

/** Réponse GraphQL de la persisted query searchDesktop. */
export type SpotifyGraphQLSearchResponse = {
  data?: {
    searchV2?: SpotifySearchResult;
    search?: SpotifySearchResult;
  };
};

export type SpotifySearchResult = {
  tracks?: {
    items?: unknown[];
  };
  albums?: {
    items?: unknown[];
  };
};

/** Forme d'entité extraite du blob __NEXT_DATA__ des pages /embed. */
export type SpotifyEmbedEntity = {
  name?: string;
  title?: string;
  subtitle?: string;
  duration?: number;
  type?: string;
  uri?: string;
  description?: string;
  visualIdentity?: { image?: { url?: string; maxWidth?: number }[] };
  coverArt?: { sources?: { url?: string }[] };
};

export type SpotifyEmbedTrackListItem = {
  uri?: string;
  title?: string;
  subtitle?: string;
  duration?: number;
};
