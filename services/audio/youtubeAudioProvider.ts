import type {
  AudioProvider,
  AudioProviderMatch,
  AudioSourceQuery,
  ResolvedStream,
} from './types';
import {
  canonicalizeFromTitle,
  fingerprintOf,
  matchSongs,
  normalizeTitleText,
  stripFeatureSuffix,
} from './audiusTrackMatcher';
import {
  getYouTubeAudioStreamUrl,
  searchYouTubeSongs,
  YouTubeSongCandidate,
} from './youtubeInnertube';
import { sanitizeErrorForLog } from '../logSanitize';

/**
 * Provider audio de FALLBACK : YouTube / YouTube Music.
 *
 * MÊME moteur de score qu'Audius (normalize/fingerprint/modèle importé du
 * matcher partagé — titre, artistes, album, durée ; pénalités remix / live /
 * instrumental / radio edit identiques), ce qui rend la cascade équitable :
 * le même seuil de confiance s'applique quelle que soit la source.
 *
 * - JAMAIS appelé directement par le player pour matcher une métadonnée sans
 *   contexte : la cascade (services/audio/trackResolver.ts) ne l'essaie
 *   qu'APRÈS un échec Audius.
 * - L'échec protocole (innertube indisponible / format changé) dégrade
 *   proprement en « null » — rien ne plante.
 */

/** Seuil d'acceptation identique à Audius (voir findBestAudiusMatch). */
const ACCEPT_SCORE = 55;

const durationSecOf = (query: AudioSourceQuery): number | null =>
  typeof query.durationMillis === 'number' && query.durationMillis > 0
    ? Math.round(query.durationMillis / 1000)
    : null;

const queryTexts = (query: AudioSourceQuery): string[] => {
  const artists = query.artists.filter(Boolean).join(' ');
  const original = stripFeatureSuffix(query.title).trim();
  const canonical = canonicalizeFromTitle(normalizeTitleText(query.title));
  return Array.from(
    new Set(
      [
        `${artists} ${original}`,
        `${original} ${artists}`,
        `${artists} ${canonical}`,
      ]
        .map((text) => text.replace(/\s{2,}/g, ' ').trim())
        .filter(Boolean)
    )
  ).slice(0, 3);
};

const scoreCandidate = (
  query: AudioSourceQuery,
  candidate: YouTubeSongCandidate
): number => {
  const source = fingerprintOf({
    title: query.title,
    artistNames: query.artists,
    album: query.album,
    durationSec: durationSecOf(query),
    isrc: query.isrc,
  });

  const best = matchSongs(source, [
    {
      id: candidate.videoId,
      title: candidate.title,
      artistNames: candidate.artists,
      durationSec: candidate.durationSec,
    },
  ]);

  return best?.score ?? 0;
};

/** Recherche élargie mais bornée ; arrêt dès qu'un match fiable existe. */
const searchCandidates = async (
  query: AudioSourceQuery
): Promise<YouTubeSongCandidate[]> => {
  const collected: YouTubeSongCandidate[] = [];
  const seen = new Set<string>();

  for (const text of queryTexts(query)) {
    const batch = await searchYouTubeSongs(text, 12);
    batch.forEach((candidate) => {
      if (candidate.videoId && !seen.has(candidate.videoId)) {
        seen.add(candidate.videoId);
        collected.push(candidate);
      }
    });
    if (
      collected.some(
        (candidate) => scoreCandidate(query, candidate) >= ACCEPT_SCORE
      )
    ) {
      break;
    }
  }
  return collected;
};

export const createYouTubeAudioProvider = (): AudioProvider => ({
  id: 'youtube',
  displayName: 'YouTube',

  matches: async (query: AudioSourceQuery): Promise<AudioProviderMatch[]> => {
    if (!queryTexts(query).length) {
      return [];
    }

    const candidates = await searchCandidates(query).catch(() => []);

    return candidates
      .map((candidate) => ({
        sourceId: candidate.videoId,
        title: candidate.title,
        artist: candidate.artists[0] ?? '',
        score: Math.min(1, scoreCandidate(query, candidate) / 100),
      }))
      .filter((match) => match.score >= ACCEPT_SCORE / 100);
  },

  resolveMatch: async (
    query: AudioSourceQuery
  ): Promise<{ sourceId: string; score: number } | null> => {
    if (!queryTexts(query).length) {
      return null;
    }

    let candidates: YouTubeSongCandidate[];
    try {
      candidates = await searchCandidates(query);
    } catch (error) {
      console.warn('YouTube search failed:', error);
      return null;
    }

    let best: { sourceId: string; raw: number } | null = null;

    for (const candidate of candidates) {
      const raw = scoreCandidate(query, candidate);
      if (raw >= ACCEPT_SCORE && (best === null || raw > best.raw)) {
        best = { sourceId: candidate.videoId, raw };
      }
    }

    return best
      ? { sourceId: best.sourceId, score: Math.min(1, best.raw / 100) }
      : null;
  },

  resolveSource: async (sourceId: string): Promise<ResolvedStream | null> => {
    try {
      const uri = await getYouTubeAudioStreamUrl(sourceId);
      return uri ? { uri } : null;
    } catch (error) {
      // M-7 : l'erreur réseau peut citer l'URL du flux → assainie.
      console.warn(
        `YouTube stream unavailable for ${sourceId}:`,
        sanitizeErrorForLog(error)
      );
      return null;
    }
  },
});
