/**
 * Audio provider abstraction.
 *
 * Melodix keeps the account, library and metadata on Spotify; the actual
 * AUDIO comes from a provider. The player only talks to `AudioProvider`,
 * never to Audius directly — a new provider only has to implement this
 * interface and to register itself (see services/audio/index.ts).
 */

/** Metadata Melodix has about the track the user wants to hear (from Spotify). */
export type AudioSourceQuery = {
  title: string;
  artists: string[];
  album?: string | null;
  durationMillis?: number | null;
  /** Code ISRC Spotify, quand l'API l'expose. Jamais requis pour matcher. */
  isrc?: string | null;
};

/** A streamable candidate inside the catalog of a provider. */
export type AudioProviderMatch = {
  /** Id usable with provider.resolveSource(often the native track id). */
  sourceId: string;
  title: string;
  artist: string;
  /** Match confidence, 0..1 (score returned by the matching engine). */
  score: number;
};

export type ResolvedStream = {
  uri: string;
};

/**
 * Where a queued track comes from:
 * - `{ provider: null }`: metadata source (e.g. a Spotify track id) — the
 *   default provider must first MATCH it, then stream its copy.
 * - `{ provider: '<id>' }`: already a native id of that provider, played
 *   directly without matching (replays, deep links).
 */
export type TrackSource =
  | { provider: null; id: string }
  | { provider: string; id: string };

export interface AudioProvider {
  /** Registry id ('audius'). */
  readonly id: string;
  /** Human-readable name for the UI ('Audius'). */
  readonly displayName: string;
  /**
   * Scored candidates for a source query (used by the matcher and by UI
   * badges/tests). Empty array = the track does not exist in this catalog.
   */
  matches: (query: AudioSourceQuery) => Promise<AudioProviderMatch[]>;
  /**
   * Best reliable match for a source track, or null when no candidate is
   * reliable enough (the player then shows "not available" and skips — it
   * never plays a wrong track).
   */
  resolveMatch: (
    query: AudioSourceQuery
  ) => Promise<{ sourceId: string; score: number } | null>;
  /** Stream URL of a native track of this provider. */
  resolveSource: (sourceId: string) => Promise<ResolvedStream | null>;
}
