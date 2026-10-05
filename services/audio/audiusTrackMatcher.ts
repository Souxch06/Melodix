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
  isrc?: string | null;
  /** Classification fournie par le provider, sinon inférée du titre. */
  explicit?: boolean | null;
  /**
   * Pertinence éditoriale du support (0..1), quand le provider sait la
   * reconnaître : une chaîne « Topic » ou un « Official Audio » désigne le
   * morceau lui-même, alors qu'une compilation ou un mix désigne autre chose.
   *
   * Sert UNIQUEMENT à départager deux candidats de score ÉGAL : elle ne
   * franchit jamais le seuil à elle seule et ne peut donc pas transformer un
   * candidat insuffisant en match.
   */
  contentQuality?: number | null;
};

export type SongFingerprint = {
  title: string;
  artistNames: string[];
  album?: string | null;
  durationSec?: number | null;
  isrc?: string | null;
  /** `null` signifie que la version ne publie aucune classification fiable. */
  explicit: boolean | null;
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

export type SongCandidateDecision = {
  id: string;
  accepted: boolean;
  reason:
    | 'invalid-candidate'
    | 'title-mismatch'
    | 'track-number-conflict'
    | 'artist-mismatch'
    | 'duration-mismatch'
    | 'variant-mismatch'
    | 'content-rating-mismatch'
    | 'below-threshold'
    | 'candidate-scored';
  score?: number;
};

type MatchOptions = {
  minimumAcceptedScore?: number;
  onCandidateDecision?: (decision: SongCandidateDecision) => void;
};

const ACCEPT_MATCH_SCORE = 55;

const devMatcherLog = (
  event: string,
  details: Record<string, unknown>
): void => {
  if (typeof __DEV__ !== 'undefined' && __DEV__) {
    console.info(`[AUDIO_DIAG] Audius ${event}`, details);
  }
};

const DASH_APPENDAGE_RX =
  /(?:\s[-–—−:]\s+(?:(?:[^\-–—−]*?\b(?:remix|mix|edit|remaster(?:ed)?|remake|version|vip|extend(?:ed)?|radio|live|acoustic|demo|mono|stereo|original|deluxe|single|instrumental|a cappella|censored|clean|explicit|reprise|session[s]?|official\s+(?:audio|video)|lyric(?:s|\s+video)?|visuali[sz]er|version\s+\d{4}|\d{4})\b[^\-–—−]*)|.*?\d{4}.*?))$/iu;
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

/** Forme lexicale : apostrophes, slashs et ponctuation deviennent des espaces. */
const comparableText = (raw: string): string =>
  normalizeTitleText(raw)
    .replace(/[^a-z0-9]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

const tokenSimilarity = (a: string, b: string): number => {
  const left = new Set(comparableText(a).split(' ').filter(Boolean));
  const right = new Set(comparableText(b).split(' ').filter(Boolean));
  if (!left.size || !right.size) return 0;
  let common = 0;
  left.forEach((token) => {
    if (right.has(token)) common += 1;
  });
  return (2 * common) / (left.size + right.size);
};

/** Dice sur bigrammes : tolère une petite faute sans accepter un autre titre. */
const bigramSimilarity = (a: string, b: string): number => {
  const left = comparableText(a).replace(/\s/g, '');
  const right = comparableText(b).replace(/\s/g, '');
  if (left === right) return left ? 1 : 0;
  if (left.length < 2 || right.length < 2) return 0;

  const counts = new Map<string, number>();
  for (let i = 0; i < left.length - 1; i += 1) {
    const pair = left.slice(i, i + 2);
    counts.set(pair, (counts.get(pair) ?? 0) + 1);
  }
  let common = 0;
  for (let i = 0; i < right.length - 1; i += 1) {
    const pair = right.slice(i, i + 2);
    const remaining = counts.get(pair) ?? 0;
    if (remaining > 0) {
      common += 1;
      counts.set(pair, remaining - 1);
    }
  }
  return (2 * common) / (left.length + right.length - 2);
};

const isAdjacentTransposition = (a: string, b: string): boolean => {
  const left = comparableText(a).replace(/\s/g, '');
  const right = comparableText(b).replace(/\s/g, '');
  if (left.length !== right.length) return false;
  const differences = Array.from(left)
    .map((char, index) => (char === right[index] ? -1 : index))
    .filter((index) => index >= 0);
  return (
    differences.length === 2 &&
    differences[1] === differences[0] + 1 &&
    left[differences[0]] === right[differences[1]] &&
    left[differences[1]] === right[differences[0]]
  );
};

const textSimilarity = (a: string, b: string): number =>
  isAdjacentTransposition(a, b)
    ? 0.92
    : Math.max(tokenSimilarity(a, b), bigramSimilarity(a, b));

const MIN_FUZZY_TITLE_SIMILARITY = 0.84;

const normalizeIsrc = (value?: string | null): string | null => {
  const normalized = String(value ?? '')
    .replace(/[^a-z0-9]/gi, '')
    .toUpperCase();
  return /^[A-Z]{2}[A-Z0-9]{3}\d{7}$/.test(normalized) ? normalized : null;
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

/**
 * Suffixes ÉDITORIAUX sans séparateur (« Song Official Audio », « Song HD »,
 * « Song Topic »). Ils ne désignent jamais une version musicale différente —
 * seulement la façon dont le support a été publié — mais sans ce retrait le
 * titre restait « partiel », donc 0 point de titre, et le bon candidat était
 * rejeté.
 *
 * Garde-fous : `\s+` initial (un titre mono-mot comme « Audio » n'est jamais
 * amputé) et `length >= 2` (le titre ne peut pas disparaître).
 */
const EDITORIAL_TAIL_RX =
  /\s+\b(?:official\s+(?:audio|video|music\s+video|lyric\s+video|visuali[sz]er)|color\s+coded\s+lyrics?|extended\s+audio|full\s+(?:album|video|ep|set)|prod\.?\s+by\s+.+|lyrics?|visuali[sz]er|audio|video|topic|hq|hd|edit)\s*$/iu;

const stripEditorialTail = (text: string): string => {
  let out = text;

  // Borné : quelques passes suffisent (« Song Official Audio HD »).
  for (let pass = 0; pass < 6; pass += 1) {
    const stripped = out.replace(EDITORIAL_TAIL_RX, '').trim();

    if (stripped === out || stripped.length < 2) {
      break;
    }

    out = stripped;
  }

  return out;
};

/** Longest title variant after removing parentheticals and remix/live tails. */
export const canonicalizeFromTitle = (normalizedTitle: string): string => {
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

  text = stripEditorialTail(text);

  return cleanupWhitespace(text);
};

/**
 * Normalized artist/name for fuzzy equality (articles and featuring dropped).
 *
 * Le suffixe de chaîne « … - Topic » (piste publiée automatiquement par le
 * distributeur) est retiré : ce n'est pas une partie du nom d'artiste, et sans
 * ce retrait la porte artiste rejetait la source audio la plus fiable du
 * catalogue. `Topic` seul (entrée de liste) est écarté pour la même raison.
 */
export const normalizeArtistText = (raw: string): string => {
  const text = normalizeTitleText(raw).replace(/^the\s+/i, '');

  return text
    .replace(/\s*[-–—−]\s*topic\s*$/u, '')
    .replace(/\.$/, '')
    .trim();
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

/**
 * Découpe une chaîne d'artistes. Les séparateurs couvrent les formes que les
 * catalogues utilisent réellement : virgule, « & », « x », « and/et/en »,
 * « vs » — et les marqueurs de featuring (« feat. », « ft. », « featuring »,
 * « with ») qui apparaissent DANS la liste d'artistes d'un support
 * (« Dua Lipa feat. DaBaby »). Le marqueur disparaît, seuls les noms restent.
 */
const splitArtistNames = (raw: string): string[] =>
  raw
    .split(
      /(?:\s*,\s*|\s*[&+|×⋅]\s*|\s+vs\.?\s+|\s+x\s+|\s+(?:and|et|en)\s+|\s+(?:feat\.?|ft\.?|featuring|with|w\/)\s+)/iu
    )
    .map((piece) => normalizeArtistText(piece))
    .filter((piece) => piece && piece !== 'topic');

/** Builds the normalized fingerprint of a source query or a candidate. */
/**
 * Variantes « dures » : un remix / live / instrumental / karaoke / acoustic
 * N'EST PAS une correspondance exacte automatique quand la source n'est pas
 * cette version (point 4 : « Song » vs « Song (Remix) » → pénalité forte).
 * Remastered/radio edit/extended/officiel/lyrics = versions acceptées (bruit
 * d'édition géré par canonicalizeFromTitle comme avant).
 */
const HARD_VARIANT_RX =
  /\b(remix|live|instrumental|karaoke|acoustic|radio\s+edit|extended(?:\s+(?:mix|version))?|sped\s+up|slowed(?:\s+down)?|nightcore)\b/giu;
const canonicalVariantTag = (raw: string): string => {
  const tag = raw.toLowerCase().replace(/\s+/g, ' ').trim();
  if (tag.startsWith('extended')) return 'extended';
  if (tag.startsWith('slowed')) return 'slowed';
  return tag;
};

export const hardVariantsOfTitle = (title: string): string[] => {
  const normalized = normalizeTitleText(title);
  const found: string[] = [];

  for (const match of normalized.matchAll(HARD_VARIANT_RX)) {
    const tag = canonicalVariantTag(match[1] ?? '');
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

const contentRatingOfTitle = (title: string): boolean | null => {
  const normalized = normalizeTitleText(title);
  if (/\b(?:clean|censored)\b/u.test(normalized)) return false;
  if (/\b(?:explicit|uncensored)\b/u.test(normalized)) return true;
  return null;
};

export const fingerprintOf = (input: {
  title: string;
  artistNames: string[];
  album?: string | null;
  durationSec?: number | null;
  isrc?: string | null;
  explicit?: boolean | null;
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
    isrc: normalizeIsrc(input.isrc),
    explicit:
      typeof input.explicit === 'boolean'
        ? input.explicit
        : contentRatingOfTitle(input.title),
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

/**
 * Accord artiste. Le dénominateur est la taille de l'ensemble ATTENDU (les
 * artistes de la source), pas la plus grande des deux listes : un support qui
 * cite PLUS d'artistes que Spotify (invités, remixeur, chaîne « … - Topic »)
 * ne doit pas être dilué — c'est exactement le cas « YouTube/Audius représente
 * différemment les artistes secondaires ». La porte dure sur l'artiste
 * PRINCIPAL (`primaryArtistAgreement`) reste, elle, inchangée : un featuring
 * seul ne suffit toujours pas à identifier un enregistrement.
 */
const artistOverlapScore = (
  sourceArtists: string[],
  candidateArtists: string[]
): number => {
  if (!sourceArtists.length || !candidateArtists.length) {
    return 0;
  }

  const scores = sourceArtists.map((source) =>
    Math.max(
      ...candidateArtists.map((candidate) => textSimilarity(source, candidate))
    )
  );
  const shared = scores.filter((score) => score >= 0.78);
  const includesMain = (scores[0] ?? 0) >= 0.82;

  return Math.min(
    1,
    shared.reduce((sum, score) => sum + score, 0) /
      Math.max(1, sourceArtists.length) +
      (includesMain ? 0.25 : 0) +
      (shared.length ? 0.1 : 0)
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

/**
 * Pertinence éditoriale d'un candidat (0..1).
 *
 * - 1.0 : chaîne « … - Topic » (publiée automatiquement par le distributeur) ou
 *   « Official Audio » / « Official Video » → le morceau lui-même ;
 * - 0.6 : marqueur audio générique (audio, lyrics, visualizer) ;
 * - 0.3 : supports qui CONTIENNENT plusieurs morceaux ou du hors-sujet
 *   (compilation, mix, full album, playlist, interview, reaction…) ;
 * - 0.5 : défaut neutre, aucune reconnaissance.
 *
 * Sert UNIQUEMENT de départage entre deux candidats de score égal : elle ne
 * peut à aucun moment faire franchir le seuil d'acceptation.
 */
const TOPIC_CHANNEL_RX = /(?:^|\s)-\s*topic\s*$/iu;
const OFFICIAL_SOURCE_RX =
  /\bofficial\s+(?:audio|video|music\s+video|lyric\s+video|visuali[sz]er)\b/iu;
const GENERIC_AUDIO_RX = /\b(?:audio|lyrics?|visuali[sz]er)\b/iu;
const NOISE_CONTENT_RX =
  /\b(?:compilation|mix|full\s+(?:album|video|ep|set|mixtape)|playlist|nonstop|medley|megamix|hours?|interview|behind\s+the\s+scenes|reaction|review|essay|documentary|live\s+at|concert|tour|karaoke\s+version|tribute|cover\s+by|top\s+\d+|best\s+of)\b/iu;

export const candidateContentQuality = (
  candidate: Pick<SongMatchCandidate, 'title' | 'artistNames'>
): number => {
  const title = normalizeTitleText(candidate.title ?? '');
  const artists = (candidate.artistNames ?? [])
    .map((name) => normalizeTitleText(name))
    .join(' ');

  if (TOPIC_CHANNEL_RX.test(artists) || OFFICIAL_SOURCE_RX.test(title)) {
    return 1;
  }

  if (NOISE_CONTENT_RX.test(title) || NOISE_CONTENT_RX.test(artists)) {
    return 0.3;
  }

  if (GENERIC_AUDIO_RX.test(title)) {
    return 0.6;
  }

  return 0.5;
};

/**
 * Groupes parenthésés/bracketés qui NE désignent PAS un artiste : marqueurs de
 * variante (« Remix », « Live »), de featuring (déjà traité à part),
 * d'édition (« Deluxe », « Remastered »), de classification (« Explicit ») ou
 * simple millésime. Tout le reste est une mention d'artiste exploitable
 * (« (Dua Lipa) Levitating », « Levitating [Dua Lipa] »).
 */
const NON_ARTIST_GROUP_RX =
  /\b(?:feat\.?|ft\.?|featuring|with|w\/|remix|mix|edit|remaster(?:ed)?|remake|version|live|acoustic|instrumental|karaoke|radio|extended|sped\s+up|slowed|nightcore|demo|mono|stereo|original|deluxe|single|bonus|session|official|lyrics?|visuali[sz]er|audio|video|explicit|clean|censored|uncensored|prod\.?|from|performed|cover|tribute|anniversary|expanded)\b|^\d{4}$/iu;

/**
 * Artistes mentionnés entre parenthèses ou crochets dans le titre du support.
 * `canonicalizeFromTitle` supprime déjà ces groupes du TITRE ; on les récupère
 * ici comme source d'artiste, sans quoi un support intitulé
 * « (Artiste) Titre » était rejeté par la porte artiste alors que le titre,
 * lui, correspondait exactement.
 */
const artistGroupsOfTitle = (normalizedTitle: string): string[] => {
  const found: string[] = [];

  for (const match of normalizedTitle.matchAll(
    /\(([^()]*)\)|\[([^[\]]*)\]/gu
  )) {
    const content = (match[1] ?? match[2] ?? '').trim();

    if (content.length < 2 || NON_ARTIST_GROUP_RX.test(content)) {
      continue;
    }

    found.push(...splitArtistNames(content));
  }

  return found.filter(Boolean);
};

const candidateTitleViews = (
  rawTitle: string,
  sourceTitle: string
): { titles: string[]; inferredArtists: string[] } => {
  const normalized = normalizeTitleText(rawTitle);
  const full = canonicalizeFromTitle(normalized);
  const pieces = normalized
    .split(/\s+[-–—:|]\s+/u)
    .map((piece) => canonicalizeFromTitle(piece))
    .filter((piece) => piece.length >= 2);
  const titles = Array.from(new Set([full, ...pieces].filter(Boolean)));
  const inferredArtists = Array.from(
    new Set([
      ...pieces
        .filter((piece) => textSimilarity(piece, sourceTitle) < 0.7)
        .flatMap(splitArtistNames),
      ...artistGroupsOfTitle(normalized),
    ])
  );
  return { titles, inferredArtists };
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

/**
 * Tolérance de durée CALIBRÉE sur les écarts réels entre catalogues : un
 * morceau Spotify de 3:42 face à une source de 3:45 (silences d'entrée, fondu
 * différent) ne doit pas être pénalisé, alors qu'un écart de plusieurs dizaines
 * de secondes désigne presque toujours un autre enregistrement.
 *
 * La porte DURE (`durationGateRejects`) reste le garde-fou définitif : au-delà
 * de 60 s ET 30 %, le candidat est rejeté quel que soit son score.
 */
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
    return 0.8;
  }

  if (diff <= 15) {
    return 0.45;
  }

  if (diff <= 30) {
    return 0.15;
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
  options?: MatchOptions
): SongMatchResult | null => {
  const acceptScore = options?.minimumAcceptedScore ?? ACCEPT_MATCH_SCORE;
  const decide = (decision: SongCandidateDecision): void =>
    options?.onCandidateDecision?.(decision);

  if (!source.title || source.title.length < 2 || !candidates.length) {
    return null;
  }

  let best: SongMatchResult | null = null;
  let bestQuality = -1;

  for (const candidate of candidates) {
    if (!candidate.id) {
      decide({ id: '', accepted: false, reason: 'invalid-candidate' });
      continue;
    }

    const candidateIsrc = normalizeIsrc(candidate.isrc);
    const isrcExact = Boolean(source.isrc && candidateIsrc === source.isrc);
    const views = candidateTitleViews(candidate.title, source.title);
    const bestTitle = views.titles.reduce(
      (best, title) =>
        textSimilarity(source.title, title) > textSimilarity(source.title, best)
          ? title
          : best,
      views.titles[0] ?? ''
    );
    const titleStatus = titleAgreement(source.title, bestTitle);
    const titleConfidence = textSimilarity(source.title, bestTitle);

    // Une légère variation typographique/orthographique est admise, mais un
    // titre seulement vaguement proche ne franchit jamais cette porte.
    if (
      !isrcExact &&
      titleStatus === 'none' &&
      titleConfidence < MIN_FUZZY_TITLE_SIMILARITY
    ) {
      decide({
        id: candidate.id,
        accepted: false,
        reason: 'title-mismatch',
      });
      continue;
    }
    const sourceDigits = source.title.match(/\d+/g) ?? [];
    const candidateDigits = bestTitle.match(/\d+/g) ?? [];
    if (
      !isrcExact &&
      sourceDigits.length > 0 &&
      candidateDigits.length > 0 &&
      sourceDigits.join(',') !== candidateDigits.join(',')
    ) {
      decide({
        id: candidate.id,
        accepted: false,
        reason: 'track-number-conflict',
      });
      continue;
    }

    const candidateArtistNames =
      candidate.artistNames?.map((name) => normalizeArtistText(name)) ?? [];
    const comparableArtists = Array.from(
      new Set([
        ...candidateArtistNames,
        ...views.inferredArtists,
        ...parseFeaturedArtists(normalizeTitleText(candidate.title)),
      ])
    );
    const artistAgreement = artistOverlapScore(
      source.artistNames,
      comparableArtists
    );
    const primaryArtistAgreement = source.artistNames[0]
      ? Math.max(
          0,
          ...comparableArtists.map((candidateArtist) =>
            textSimilarity(source.artistNames[0], candidateArtist)
          )
        )
      : 1;

    // Le featuring seul ne prouve jamais l'enregistrement : un upload par
    // l'artiste invité portant le même titre peut être une reprise/remix. Le
    // principal doit être présent, directement ou dans « Artist - Song ».
    if (
      !isrcExact &&
      source.artistNames.length > 0 &&
      (artistAgreement === 0 || primaryArtistAgreement < 0.82)
    ) {
      decide({
        id: candidate.id,
        accepted: false,
        reason: 'artist-mismatch',
      });
      continue;
    }

    const albumStatus = albumAgreement(source.album, candidate.album);
    const durationConfidence = durationScore(
      source.durationSec,
      candidate.durationSec
    );

    // Porte durée dure : un écart massif = autre enregistrement, jamais un
    // match — peu importe la force du titre/artiste/album.
    if (
      !isrcExact &&
      durationGateRejects(source.durationSec, candidate.durationSec)
    ) {
      decide({
        id: candidate.id,
        accepted: false,
        reason: 'duration-mismatch',
      });
      continue;
    }

    const candidateFingerprint = fingerprintOf({
      title: candidate.title,
      artistNames: candidateArtistNames,
      album: candidate.album,
      durationSec: candidate.durationSec,
      isrc: candidate.isrc,
      explicit: candidate.explicit,
    });
    const exactTitle = bestTitle === source.title;

    // Porte « variante dure » partagée : remix/live/instrumental/karaoke/
    // acoustic/radio/extended/sped/slowed restent des versions distinctes.
    if (
      !isrcExact &&
      hardVariantMismatch(
        source.hardVariants,
        candidateFingerprint.hardVariants
      )
    ) {
      decide({
        id: candidate.id,
        accepted: false,
        reason: 'variant-mismatch',
      });
      continue;
    }

    // Une classification connue des DEUX côtés est une identité de version,
    // pas un simple bonus : ne jamais substituer une version clean à une
    // demande explicite (ou inversement). Un candidat non étiqueté reste
    // neutre car Audius/YouTube ne publient pas toujours cette information.
    if (
      !isrcExact &&
      source.explicit !== null &&
      candidateFingerprint.explicit !== null &&
      source.explicit !== candidateFingerprint.explicit
    ) {
      decide({
        id: candidate.id,
        accepted: false,
        reason: 'content-rating-mismatch',
      });
      continue;
    }

    // Titre PARTIEL = 0 point de titre (durci) : un titre seulement
    // apparenté n'ouvre plus la porte à lui seul — il ne peut survivre que
    // porté par les autres signaux (album exact 15 pts, artiste, durée).
    const titlePoints =
      titleStatus === 'exact'
        ? 40
        : titleStatus === 'partial'
          ? 0
          : titleConfidence * 35;
    const score = isrcExact
      ? 100
      : Math.round(
          titlePoints +
            (exactTitle ? 5 : 0) +
            artistAgreement * 25 +
            (albumStatus === 'exact' ? 15 : albumStatus === 'partial' ? 7 : 0) +
            durationConfidence * 20
        );

    decide({
      id: candidate.id,
      accepted: score >= acceptScore,
      reason: score >= acceptScore ? 'candidate-scored' : 'below-threshold',
      score,
    });

    // Keep a running best; hard gates are the same as acceptScore + a title
    // agreement floor so two remixes can't outrank an exact original.
    // À score ÉGAL, la qualité éditoriale du support départage (une chaîne
    // « Topic » ou un « Official Audio » désigne le morceau lui-même) — elle
    // ne fait JAMAIS franchir le seuil à un candidat insuffisant.
    const quality = candidateContentQuality(candidate);

    if (!best || score > best.score) {
      best = { id: candidate.id, score, candidate };
      bestQuality = quality;
    } else if (score === best.score && quality > bestQuality) {
      best = { id: candidate.id, score, candidate };
      bestQuality = quality;
    }
  }

  if (!best) {
    return null;
  }

  const bestViews = candidateTitleViews(best.candidate.title, source.title);
  const bestTitleConfidence = Math.max(
    0,
    ...bestViews.titles.map((title) => textSimilarity(source.title, title))
  );
  const bestIsrcExact = Boolean(
    source.isrc && normalizeIsrc(best.candidate.isrc) === source.isrc
  );
  const bestHasPartialTitle = bestViews.titles.some(
    (title) => titleAgreement(source.title, title) === 'partial'
  );

  if (
    best.score < acceptScore ||
    (!bestIsrcExact &&
      !bestHasPartialTitle &&
      bestTitleConfidence < MIN_FUZZY_TITLE_SIMILARITY)
  ) {
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
 * Piste Audius brute → candidat scoré. UNE SEULE définition, partagée par le
 * matcher (`findBestAudiusMatch`) et par le provider (`matches()`, badges UI) :
 * les deux voient donc EXACTEMENT les mêmes champs — sinon l'écran pouvait
 * annoncer « disponible » là où la lecture ne trouvait rien (et inversement).
 *
 * L'album reste `null` : l'endpoint de recherche Audius v1 n'expose pas le
 * titre d'album de façon fiable. Ce n'est pas un signal perdu pour le
 * matching — c'est un champ NEUTRE (voir `albumAgreement`), le titre, les
 * artistes et la durée portent la décision.
 */
export const audiusCandidateFromTrack = (
  track: AudiusTrackMatch
): SongMatchCandidate => ({
  id: track.id,
  title: track.title ?? '',
  artistNames: [track.user?.name ?? track.user?.handle ?? ''].filter(Boolean),
  album: null,
  durationSec:
    typeof track.duration === 'number' && Number.isFinite(track.duration)
      ? track.duration
      : null,
  isrc: track.isrc ?? null,
  contentQuality: candidateContentQuality({
    title: track.title ?? '',
    artistNames: [track.user?.name ?? track.user?.handle ?? ''].filter(Boolean),
  }),
});

/**
 * Search → score → best-of for the Audius provider. Returns the best match
 * when it clears acceptScore and title-gates, null otherwise.
 */
export const findBestAudiusMatch = async (
  query: AudioSourceQuery,
  search: (text: string) => Promise<AudiusTrackMatch[]>,
  options?: MatchOptions
): Promise<SongMatchResult | null> => {
  const source = fingerprintOf({
    title: query.title,
    artistNames: query.artists,
    album: query.album,
    durationSec: sec(query.durationMillis),
    isrc: query.isrc,
    explicit: query.explicit,
  });

  const decisions = new Map<string, SongCandidateDecision>();
  // Les diagnostics décrivent la forme de l'entrée sans recopier les
  // métadonnées écoutées (titre, artiste, album ou ISRC) dans les logs.
  devMatcherLog('spotify-input', {
    titleLength: query.title.length,
    artistCount: query.artists.length,
    hasAlbum: Boolean(query.album),
    hasDuration: query.durationMillis != null,
    hasIsrc: Boolean(query.isrc),
  });

  const attempts: string[] = [];
  const primary = query.artists[0];
  const titleWithoutFeature = stripFeatureSuffix(query.title).trim();
  const canonicalTitle = source.title;
  const pushAttempt = (text: string | null) => {
    const clean = text?.replace(/\s{2,}/g, ' ').trim();
    if (
      clean &&
      !attempts.some((attempt) => attempt.toLowerCase() === clean.toLowerCase())
    ) {
      attempts.push(clean);
    }
  };

  // ISRC est le signal le plus précis lorsqu'il est indexé par Audius. Les
  // formulations textuelles restent indispensables car ce champ est rare.
  pushAttempt(source.isrc ?? null);
  pushAttempt(primary ? `${primary} ${titleWithoutFeature}` : null);
  pushAttempt(`${titleWithoutFeature} ${primary ?? ''}`);
  pushAttempt(
    canonicalTitle && primary ? `${primary} ${canonicalTitle}` : canonicalTitle
  );
  pushAttempt(titleWithoutFeature || canonicalTitle);

  let allCandidates: AudiusTrackMatch[] = [];
  let sawSearchError = false;

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
      candidates.push(audiusCandidateFromTrack(track));
    }

    return matchSongs(source, candidates, {
      ...options,
      onCandidateDecision: (decision) => {
        if (decision.id) decisions.set(decision.id, decision);
        options?.onCandidateDecision?.(decision);
      },
    });
  };

  // Boucle STRICTEMENT bornée (≤ 5 requêtes, ISRC compris) : un lot
  // NON VIDE mais sans candidat ADMISSIBLE n'arrête plus la cascade — la
  // formulation suivante peut trouver le bon. On ne s'arrête tôt que sur
  // match admissible (zéro requête superflue quand le 1er lot suffit).
  for (const attempt of attempts.slice(0, 5)) {
    try {
      const batch = await search(attempt);
      devMatcherLog('search', {
        queryLength: attempt.length,
        results: batch.length,
      });

      if (batch.length) {
        allCandidates = [...allCandidates, ...batch];

        const best = scoreAccumulated();
        if (best) {
          devMatcherLog('selected', {
            queryLength: attempt.length,
            sourceId: best.id,
            score: best.score,
            rejected: Array.from(decisions.values()).filter(
              (decision) => !decision.accepted
            ),
          });
          return best;
        }
      }
    } catch (error) {
      sawSearchError = true;
      console.warn(
        'Audius search failed',
        error instanceof Error ? error.name : typeof error
      );
    }
  }

  // Jamais de match forcé : null si aucune formulation n'a produit de
  // candidat admissible. Une recherche partiellement en panne n'est en
  // revanche PAS une preuve d'absence : propager l'erreur permet au resolver
  // d'éviter tout cache négatif durable.
  const final = scoreAccumulated();
  devMatcherLog(
    final ? 'selected-final' : sawSearchError ? 'error' : 'unavailable',
    {
      attemptCount: attempts.length,
      results: allCandidates.length,
      sourceId: final?.id ?? null,
      score: final?.score ?? null,
      rejected: Array.from(decisions.values()).filter(
        (decision) => !decision.accepted
      ),
    }
  );
  if (!final && sawSearchError) {
    throw new Error('Audius search incomplete');
  }
  return final;
};
