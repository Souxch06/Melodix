import type { TrackSource } from './types';

/** Stable string key of a track source (cache keys, failure bookkeeping). */
export const sourceKeyOf = (source: TrackSource): string =>
  `${source.provider ?? 'spotify'}:${source.id}`;
