import type { AudiusTrackMatch } from '@api';

import type { AudioSourceQuery } from './types';

/**
 * Reliability-first matching of a source track (Spotify metadata) against
 * Audius candidates.
 *
 * Principles:
 * - never silently play a wrong track: below ACCEPT_MATCH_SCORE and below
 *   the minimum title agreement, the matcher reports "no match";
 * - comparisons happen on TYPOGRAPHICALLY NORMALIZED variants (case, accents,
 *   dashes, ellipses, silence-padding metadata) so that titles like
 *   "Tame (feat. X) — Remastered 2024" still line up;
 * - artist agreement and duration agreement each contribute bounded weight.
 */

export type SongMatchCandidate = {
  id: string;
  title: string;
  artistNames: string[];
  album?: string | null;
  durationSec?: number | null;
};

export type SongFingerprint = {
  title: string;
  artistNames: string[];
  album?: string | null;
  durationSec?: number | null;
  /**
   * Marqueurs de variante dure détectés dans le titre SOURCE
   * (« remix », « live », « instrumental », « karaoke », « acoustic »).
   */
  hardVariants: string[];
};

export type SongMatchResult = {
  id: string;
  score: number;
  candidate: SongMatchCandidate;
};

const ACCEPT_MATCH_SCORE = 55;

const DASH_APPENDAGE_RX =
  /(?:\s[-–—−:]\s+(?:(?:[^\-–—−]*?\b(?:remix|mix|edit|remaster(?:ed)?|remake|version|vip|extend(?:ed)?|radio|live|acoustic|demo|mono|stereo|original|deluxe|single|instrumental|a cappella|censored|clean|explicit|reprise|session[s]?|version\s+\d{4}|\d{4})\b[^\-–—−]*)|.*?\d{4}.*?))$/iu;
const EMPTY_PLACEHOLDER_RX =
  /^(?:\(?\s*(?:untitled|unknown|tba|track)\s*\)?)$/iu;
const FEATURE_MARKER_RX = /^(?:feat\.?|ft\.?|featuring|with|w\/|&)$/i;
const ALBUM_EDITION_TAIL_RX =
  /\s(?:[-–—−]\s+)?(?:\(\s*)?(?:deluxe(?:\s+(?:edition|version))?|expanded(?:\s+edition)?|special\s+edition|anniversary\s+edition|collector(?:'s)?\s+edition|remaster(?:ed)?(?:\s+\d{4})?|mono|stereo|original\s+(?:motion\s+picture\s+)?soundtrack|limited\s+edition|international\s+version|bonus\s+track\s+version|version|édition|éditions|single|ep)\)?\s*:?$/iu;

const stripDiacritics = (text: string): string =>
  text.normalize('NFD').replace(/[̀-ͯ]/g, '');

const normalizeSeparators = (text: string): string =>
  text.replace(/[‐‑‒–—―−]/g, '-').replace(/[’ʻ’＇]/g, "'");

const trimOuterPunctuation = (text: string): string =>
  text.replace(/^["'“”‘’`]+/, '').replace(/[,.!?;:…]+$/, '');

const cleanupWhitespace = (text: string): string =>
  trimOuterPunctuation(
    text
      .replace(/[‹›«»„“”]/g, '')
      .replace(/\s{2,}/g, ' ')
      .trim()
  );

/** Full normalized form: case/accent uniform, punctuation cleaned, no suffixes. */
export const normalizeTitleText = (raw: string): string => {
  const lowered = cleanupWhitespace(normalizeSeparators(stripDiacritics(raw)));
  const noEllipsis = lowered.replace(/\.{2,}|…/g, '');

  return noEllipsis.trim().toLowerCase();
};

/** Removes trailing featured-artist markers from a title ("Song feat. X"). */
export const stripFeatureSuffix = (title: string): string =>
  title
    .replace(
      /\s*[-–—−]?\s*\((?:feat\.?|ft\.?|featuring|with|w\/)\s[^()]*\)\s*$/i,
      ''
    )
    .replace(
      /\s*[-–—−]?\s*\[(?:feat\.?|ft\.?|featuring|with|w\/)\s[^\][]*\]\s*$/i,
      ''
    )
    .replace(/\s+[-–—−]\s+(?:feat\.?|ft\.?|featuring|with|w\/)\s.+$/i, '')
    .replace(/\s+(?:feat\.?|ft\.?|featuring|with|w\/)\s.+$/i, '')
    .trim();

/** Longest title variant after removing parentheticals and remix/live tails. */
const canonicalizeFromTitle = (normalizedTitle: string): string => {
  let text = stripFeatureSuffix(normalizedTitle);
  text = text.replace(/\([^()]*\)/g, ' ').replace(/\[[^\][]*\]/g, ' ');

  const previous = () => text;

  // Repeat: tails like "-remastered 2013", "- live", "- radio edit".
  for (;;) {
    const before = previous();
    text = before.replace(DASH_APPENDAGE_RX, '').trim();

    if (text === before) {
      break;
    }
  }

  return cleanupWhitespace(text);
};

/** Normalized artist/name for fuzzy equality (articles and featuring dropped). */
export const normalizeArtistText = (raw: string): string => {
  const text = normalizeTitleText(raw).replace(/^the\s+/i, '');

  return text.replace(/\.$/, '').trim();
};

const parseFeaturedArtists = (normalizedTitle: string): string[] => {
  const featured: string[] = [];
  const featRx =
    /(?:\(|\[|-|\s)\s*(feat\.?|ft\.?|featuring|with|w\/)\s+([^\])\-–—]+?)(?:\)|\]|\s+-\s+|\s*–\s*|\s*—\s*|$)/gi;

  for (const match of normalizedTitle.matchAll(featRx)) {
    const names = match[2] ?? '';
    featured.push(
      ...splitArtistNames(names).filter(
        (name) => name && !FEATURE_MARKER_RX.test(name)
      )
    );
  }

  return featured;
};

const splitArtistNames = (raw: string): string[] =>
  raw
    .split(
      /(?:\s*,\s*|\s*[&+|×⋅]\s*|\s+vs\.?\s+|\s+x\s+|\s+(?:and|et|en)\s+)/iu
    )
    .map((piece) => normalizeArtistText(piece))
    .filter(Boolean);

/** Builds the normalized fingerprint of a source query or a candidate. */
/**
 * Variantes « dures » : un remix / live / instrumental / karaoke / acoustic
 * N'EST PAS une correspondance exacte automatique quand la source n'est pas
 * cette version (point 4 : « Song » vs « Song (Remix) » → pénalité forte).
 * Remastered/radio edit/extended/officiel/lyrics = versions acceptées (bruit
 * d'édition géré par canonicalizeFromTitle comme avant).
 */
const HARD_VARIANT_RX = /\b(remix|live|instrumental|karaoke|acoustic)\b/giu;
const HARD_VARIANT_PENALTY = 45;

export const hardVariantsOfTitle = (title: string): string[] => {
  const normalized = normalizeTitleText(title);
  const found: string[] = [];

  for (const match of normalized.matchAll(HARD_VARIANT_RX)) {
    const tag = (match[1] ?? '').toLowerCase();
    if (tag && !found.includes(tag)) {
      found.push(tag);
    }
  }

  return found;
};

const hardVariantMismatch = (a: string[], b: string[]): boolean => {
  if (!a.length && !b.length) {
    return false;
  }

  const set = new Set(a);
  const other = new Set(b);

  // Symmetrical difference non-empty → les deux versions ne racontent pas
  // la même chose (ex. source studio vs candidate live).
  return a.some((tag) => !other.has(tag)) || b.some((tag) => !set.has(tag));
};

export const fingerprintOf = (input: {
  title: string;
  artistNames: string[];
  album?: string | null;
  durationSec?: number | null;
}): SongFingerprint => {
  const normalizedTitle = normalizeTitleText(input.title);

  return {
    title: canonicalizeFromTitle(normalizedTitle),
    artistNames: Array.from(
      new Set([
        ...splitArtistNames(input.artistNames.join(', ')),
        ...parseFeaturedArtists(normalizedTitle),
      ])
    ),
    album: input.album ? normalizeAlbumText(input.album) : null,
    durationSec:
      typeof input.durationSec === 'number' &&
      Number.isFinite(input.durationSec)
        ? Math.max(0, input.durationSec)
        : null,
    hardVariants: hardVariantsOfTitle(input.title),
  };
};

export const normalizeAlbumText = (raw: string): string => {
  let text = normalizeTitleText(raw);
  text = text.replace(/\s*[-–—−]?\s*\((?:.*?)\)\s*$/u, '');

  for (;;) {
    const before = text;
    text = text.replace(ALBUM_EDITION_TAIL_RX, '').trim();

    if (text === before) {
      break;
    }
  }

  return cleanupWhitespace(text);
};

const artistOverlapScore = (
  sourceArtists: string[],
  candidateArtists: string[]
): number => {
  if (!sourceArtists.length || !candidateArtists.length) {
    return 0;
  }

  const candidateSet = new Set(candidateArtists);
  const shared = sourceArtists.filter((name) => candidateSet.has(name));
  const includesMain = candidateSet.has(sourceArtists[0]);

  return Math.min(
    1,
    shared.length / Math.max(sourceArtists.length, candidateArtists.length) +
      (includesMain ? 0.35 : 0) +
      (shared.length ? 0.15 : 0)
  );
};

const titleAgreement = (
  sourceTitle: string,
  candidateTitle: string
): 'exact' | 'partial' | 'none' => {
  if (!sourceTitle || !candidateTitle) {
    return 'none';
  }

  if (sourceTitle === candidateTitle) {
    return 'exact';
  }

  if (candidateTitle.startsWith(sourceTitle)) {
    return 'partial';
  }

  if (sourceTitle.startsWith(candidateTitle)) {
    return 'partial';
  }

  if (EMPTY_PLACEHOLDER_RX.test(candidateTitle)) {
    return 'none';
  }

  const stripDigits = (value: string) => value.replace(/\d+/g, '').trim();
  const a = stripDigits(sourceTitle);
  const b = stripDigits(candidateTitle);

  if (a.length >= 3 && a === b) {
    return 'partial';
  }

  return 'none';
};

const albumAgreement = (
  sourceAlbum: string | null | undefined,
  candidateAlbum: string | null | undefined
): 'exact' | 'partial' | 'unknown' | 'none' => {
  if (!sourceAlbum || !candidateAlbum) {
    return 'unknown';
  }

  const a = normalizeAlbumText(sourceAlbum);
  const b = normalizeAlbumText(candidateAlbum);

  if (!a || !b) {
    return 'unknown';
  }

  if (a === b) {
    return 'exact';
  }

  return a.startsWith(b) || b.startsWith(a) ? 'partial' : 'none';
};

const durationScore = (
  expectedSec: number | null | undefined,
  actualSec: number | null | undefined
): number => {
  if (
    typeof expectedSec !== 'number' ||
    typeof actualSec !== 'number' ||
    !Number.isFinite(expectedSec) ||
    !Number.isFinite(actualSec) ||
    expectedSec <= 0 ||
    actualSec <= 0
  ) {
    return 0.5; // Unknown durations neither help nor penalize.
  }

  const diff = Math.abs(expectedSec - actualSec);

  if (diff <= 3) {
    return 1;
  }

  if (diff <= 8) {
    return 0.6;
  }

  if (diff <= 15) {
    return 0.25;
  }

  return 0;
};

/**
 * Porte durée DURE : un écart > 60 s ET > 30 % ne peut être qu'un autre
 * enregistrement (extended mix, version club, reprise ralongée) — jamais le
 * même morceau. Durée inconnue d'un côté ou de l'autre : la porte ne dit rien.
 */
const durationGateRejects = (
  expectedSec: number | null | undefined,
  actualSec: number | null | undefined
): boolean => {
  if (
    typeof expectedSec !== 'number' ||
    typeof actualSec !== 'number' ||
    !Number.isFinite(expectedSec) ||
    !Number.isFinite(actualSec) ||
    expectedSec <= 0 ||
    actualSec <= 0
  ) {
    return false;
  }

  const diff = Math.abs(expectedSec - actualSec);

  return diff > 60 && diff / Math.max(expectedSec, actualSec) > 0.3;
};

export const matchSongs = (
  source: SongFingerprint,
  candidates: SongMatchCandidate[],
  options?: { minimumAcceptedScore?: number }
): SongMatchResult | null => {
  const acceptScore = options?.minimumAcceptedScore ?? ACCEPT_MATCH_SCORE;

  if (!source.title || source.title.length < 2 || !candidates.length) {
    return null;
  }

  let best: SongMatchResult | null = null;

  for (const candidate of candidates) {
    if (!candidate.id) {
      continue;
    }

    const titleStatus = titleAgreement(
      source.title,
      canonicalizeFromTitle(normalizeTitleText(candidate.title))
    );

    if (titleStatus === 'none') {
      continue;
    }

    const candidateArtistNames =
      candidate.artistNames?.map((name) => normalizeArtistText(name)) ?? [];
    const artistAgreement = artistOverlapScore(
      source.artistNames,
      Array.from(
        new Set([
          ...candidateArtistNames,
          ...parseFeaturedArtists(normalizeTitleText(candidate.title)),
        ])
      )
    );

    // An artist who shares nothing means we refuse the candidate outright.
    if (artistAgreement === 0 && source.artistNames.length > 0) {
      continue;
    }

    const albumStatus = albumAgreement(source.album, candidate.album);
    const durationConfidence = durationScore(
      source.durationSec,
      candidate.durationSec
    );

    // Porte durée dure : un écart massif = autre enregistrement, jamais un
    // match — peu importe la force du titre/artiste/album.
    if (durationGateRejects(source.durationSec, candidate.durationSec)) {
      continue;
    }

    const candidateFingerprint = fingerprintOf({
      title: candidate.title,
      artistNames: candidateArtistNames,
      album: candidate.album,
      durationSec: candidate.durationSec,
    });
    const exactTitle = candidateFingerprint.title === source.title;

    // Pénalité « variante dure » partagée : remix/live/instrumental/karaoke/
    // acoustic ne PASSENT PAS automatiquement quand l'autre côté n'est pas
    // cette version (pénalité forte — elle peut faire repousser le candidat
    // sous le seuil d'acceptation).
    const variantPenalty = hardVariantMismatch(
      source.hardVariants,
      candidateFingerprint.hardVariants
    )
      ? HARD_VARIANT_PENALTY
      : 0;

    // Titre PARTIEL = 0 point de titre (durci) : un titre seulement
    // apparenté n'ouvre plus la porte à lui seul — il ne peut survivre que
    // porté par les autres signaux (album exact 15 pts, artiste, durée).
    const score =
      Math.round(
        (titleStatus === 'exact' ? 35 : 0) +
          (exactTitle ? 5 : 0) +
          artistAgreement * 25 +
          (albumStatus === 'exact' ? 15 : albumStatus === 'partial' ? 7 : 0) +
          durationConfidence * 20
      ) - variantPenalty;

    // Keep a running best; hard gates are the same as acceptScore + a title
    // agreement floor so two remixes can't outrank an exact original.
    if (!best || score > best.score) {
      best = { id: candidate.id, score, candidate };
    }
  }

  if (!best) {
    return null;
  }

  const titleOk = titleAgreement(
    source.title,
    canonicalizeFromTitle(normalizeTitleText(best.candidate.title))
  );

  if (best.score < acceptScore || titleOk === 'none') {
    return null;
  }

  return best;
};

// query-side helpers used by the audio provider.
const sec = (durationMillis?: number | null): number | null =>
  typeof durationMillis === 'number' && Number.isFinite(durationMillis)
    ? durationMillis / 1000
    : null;

/** No reliable match: the player reports "track not available" and skips. */
export const UNKNOWN_MATCH: SongMatchResult | null = null;

/**
 * Search → score → best-of for the Audius provider. Returns the best match
 * when it clears acceptScore and title-gates, null otherwise.
 */
export const findBestAudiusMatch = async (
  query: AudioSourceQuery,
  search: (text: string) => Promise<AudiusTrackMatch[]>,
  options?: { minimumAcceptedScore?: number }
): Promise<SongMatchResult | null> => {
  const source = fingerprintOf({
    title: query.title,
    artistNames: query.artists,
    album: query.album,
    durationSec: sec(query.durationMillis),
  });

  const attempts: string[] = [];
  const primary = query.artists[0];
  const pushAttempt = (text: string | null) => {
    if (text) {
      attempts.push(text);
    }
  };

  // Artiste + titre d'abord : le titre seul noie la recherche dans les
  // homonymes (point 3 du plan — « The Weeknd Blinding Lights »).
  pushAttempt(
    primary ? `${primary} ${stripFeatureSuffix(query.title).trim()}` : null
  );
  pushAttempt(
    `${stripFeatureSuffix(query.title).trim()} ${primary ?? ''}`.trim() || null
  );
  pushAttempt(query.title.trim() || null);

  let allCandidates: AudiusTrackMatch[] = [];

  /**
   * Déduplique + score le lot accumulé. AUCUNE protection n'est assouplie :
   * seuil de score, accord du titre, contrôle artiste et pénalités de
   * variantes restent intégralement ceux de matchSongs.
   */
  const scoreAccumulated = (): SongMatchResult | null => {
    const candidates: SongMatchCandidate[] = [];
    const seen = new Set<string>();

    for (const track of allCandidates) {
      if (!track.id || seen.has(track.id)) {
        continue;
      }

      seen.add(track.id);
      candidates.push({
        id: track.id,
        title: track.title ?? '',
        artistNames: [track.user?.name ?? track.user?.handle ?? ''].filter(
          Boolean
        ),
        album: null, // Audius v1 tracks do not expose the album title reliably.
        durationSec:
          typeof track.duration === 'number' && Number.isFinite(track.duration)
            ? track.duration
            : null,
      });
    }

    return matchSongs(source, candidates, options);
  };

  // I-4 — boucle STRICTEMENT bornée (≤ 3 requêtes, jamais au-delà) : un lot
  // NON VIDE mais sans candidat ADMISSIBLE n'arrête plus la cascade — la
  // formulation suivante peut trouver le bon. On ne s'arrête tôt que sur
  // match admissible (zéro requête superflue quand le 1er lot suffit).
  for (const attempt of attempts.slice(0, 3)) {
    try {
      const batch = await search(attempt);

      if (batch.length) {
        allCandidates = [...allCandidates, ...batch];

        const best = scoreAccumulated();
        if (best) {
          return best;
        }
      }
    } catch (error) {
      console.warn(`Audius search failed for "${attempt}":`, error);
    }
  }

  // Jamais de match forcé : null si aucune formulation n'a produit de
  // candidat admissible (le player affichera « indisponible » et skip).
  return scoreAccumulated();
};
