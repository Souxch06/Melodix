import type { AudioProvider } from './types';
import { createAudiusAudioProvider } from './audiusAudioProvider';

/**
 * Audio provider registry. The default (and currently only) provider is
 * Audius; future providers implement the AudioProvider interface and register
 * here without touching the player code.
 */
const providers: Record<string, AudioProvider> = {
  audius: createAudiusAudioProvider(),
};

export const DEFAULT_AUDIO_PROVIDER_ID = 'audius';

export const getAudioProvider = (id?: string | null): AudioProvider =>
  providers[id ?? DEFAULT_AUDIO_PROVIDER_ID] ??
  providers[DEFAULT_AUDIO_PROVIDER_ID];

// Tests can replace providers wholesale (and restore them afterwards).
export const __testSetAudioProviders = (next: Record<string, AudioProvider>) => {
  for (const key of Object.keys(providers)) {
    delete providers[key];
  }
  Object.assign(providers, next);
};

export type {
  AudioProvider,
  AudioProviderMatch,
  AudioSourceQuery,
  ResolvedStream,
  TrackSource,
} from './types';
export { sourceKeyOf } from './sourceKey';
export {
  matchSongs,
  normalizeAlbumText,
  normalizeArtistText,
  normalizeTitleText,
  stripFeatureSuffix,
  UNKNOWN_MATCH,
} from './audiusTrackMatcher';
export type { SongFingerprint, SongMatchCandidate, SongMatchResult } from './audiusTrackMatcher';
export {
  loadMatchCache,
  MATCH_CACHE_STORAGE_KEY,
  MATCH_CACHE_TTL_MS,
  persistMatchCache,
  writeMatchCacheEntry,
} from './matchCache';
export type { MatchCache, MatchCacheEntry } from './matchCache';
