import { getAudiusStreamUrl, searchAudiusTracks } from '@api';

import type {
  AudioProvider,
  AudioProviderMatch,
  AudioSourceQuery,
  ResolvedStream,
} from './types';
import {
  findBestAudiusMatch,
  fingerprintOf,
  matchSongs,
} from './audiusTrackMatcher';

/**
 * Default audio provider: Audius (Open Audio Protocol). Stateless:
 * - resolveMatch(): Spotify metadata → reliable Audius track id (or null);
 * - resolveSource(): Audius track id → stream URL of a healthy node.
 *
 * Caching of decisions lives in the player (services/player.ts +
 * services/audio/matchCache.ts), so the provider stays trivial to replace.
 */
export const createAudiusAudioProvider = (): AudioProvider => {
  const search = (text: string) => searchAudiusTracks(text, 10);

  return {
    id: 'audius',
    displayName: 'Audius',

    matches: async (query: AudioSourceQuery): Promise<AudioProviderMatch[]> => {
      const artists = query.artists.filter(Boolean).join(' ');
      const results = await searchAudiusTracks(
        `${artists} ${query.title}`.replace(/\s{2,}/g, ' ').trim(),
        10
      ).catch(() => []);

      const source = fingerprintOf({
        title: query.title,
        artistNames: query.artists,
        album: query.album,
        durationSec:
          typeof query.durationMillis === 'number'
            ? query.durationMillis / 1000
            : null,
      });

      return results
        .map((track) => {
          const best = matchSongs(source, [
            {
              id: track.id,
              title: track.title ?? '',
              artistNames: [track.user?.name ?? track.user?.handle ?? ''].filter(
                Boolean
              ),
              durationSec:
                typeof track.duration === 'number' ? track.duration : null,
            },
          ]);

          return best
            ? {
                sourceId: track.id,
                title: track.title ?? '',
                artist: track.user?.name ?? track.user?.handle ?? '',
                score: Math.min(1, best.score / 100),
              }
            : null;
        })
        .filter((match): match is AudioProviderMatch => !!match);
    },

    resolveMatch: async (query: AudioSourceQuery) => {
      const result = await findBestAudiusMatch(query, search);

      return result
        ? { sourceId: result.id, score: Math.min(1, result.score / 100) }
        : null;
    },

    resolveSource: async (sourceId: string): Promise<ResolvedStream | null> => {
      try {
        const uri = await getAudiusStreamUrl(sourceId);

        return uri ? { uri } : null;
      } catch (error) {
        console.warn(`Audius stream unavailable for ${sourceId}:`, error);
        return null;
      }
    },
  };
};
