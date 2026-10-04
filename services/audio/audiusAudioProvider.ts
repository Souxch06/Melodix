import { getAudiusStreamUrl, searchAudiusTracks } from '@api';
import { sanitizeErrorForLog } from '../logSanitize';

import type {
  AudioProvider,
  AudioProviderMatch,
  AudioSourceQuery,
  ResolvedStream,
} from './types';
import {
  audiusCandidateFromTrack,
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

/**
 * Taille du lot demandé à Audius par formulation. Le catalogue Audius est
 * nettement plus petit que celui de Spotify : pour un titre peu diffusé, le
 * bon enregistrement arrive souvent au-delà de la 10e ligne de pertinence.
 * Élargir le lot ne coûte AUCUNE requête supplémentaire — il rend simplement
 * les requêtes existantes plus utiles.
 */
const AUDIUS_SEARCH_LIMIT = 24;

export const createAudiusAudioProvider = (): AudioProvider => {
  const search = (text: string) =>
    searchAudiusTracks(text, AUDIUS_SEARCH_LIMIT);

  return {
    id: 'audius',
    displayName: 'Audius',

    matches: async (query: AudioSourceQuery): Promise<AudioProviderMatch[]> => {
      const artists = query.artists.filter(Boolean).join(' ');
      const results = await searchAudiusTracks(
        `${artists} ${query.title}`.replace(/\s{2,}/g, ' ').trim(),
        AUDIUS_SEARCH_LIMIT
      ).catch(() => []);

      const source = fingerprintOf({
        title: query.title,
        artistNames: query.artists,
        album: query.album,
        durationSec:
          typeof query.durationMillis === 'number'
            ? query.durationMillis / 1000
            : null,
        isrc: query.isrc,
        explicit: query.explicit,
      });

      // MÊME construction de candidat que le matcher : le badge affiché et la
      // décision de lecture ne peuvent plus diverger.
      return results
        .map((track) => {
          const best = matchSongs(source, [audiusCandidateFromTrack(track)]);

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
        // M-7 : l'erreur peut citer l'URL du flux → assainie (jamais signée
        // en clair dans les journaux).
        console.warn(
          `Audius stream unavailable for ${sourceId}:`,
          sanitizeErrorForLog(error)
        );
        return null;
      }
    },
  };
};
