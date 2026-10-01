/**
 * Normalisation des chaînes musicales (serveur).
 *
 * Règles STRICTEMENT alignées sur l'algorithme du matching client
 * (services/audio/audiusTrackMatcher.ts) : même base de texte, mêmes mots
 * d'édition. Le serveur s'en sert pour les clés de cache et le scoring ;
 * l'app reste l'autorité finale de matching pour la lecture.
 *
 * - ascii plié (accents supprimés), minuscules, ponctuation → espace
 * - « feat/ft/featuring X » supprimé (le featuring ne fait pas partie de
 *   l'identité du morceau)
 * - suffixes de version dans parenthèses/crochets retirés ; mots d'édition
 *   retirés aussi hors parenthèses pour le scoring de BASE (les indicateurs
 *   de version sont conservés séparément pour le bonus/pénalité de version)
 */

/**
 * Featuring. IMPORTANT : le motif exige une frontière AVANT « ft » — sinon
 * « Daft » serait mangé par la règle « ft » (bug évité : espace ou parenthèse
 * obligatoire, ou début de chaîne).
 */
const FEATURING_PATTERN =
  /(?:\(\s*(?:feat\.?|ft\.?|featuring)\b[^)]*\)?|\s+(?:feat\.?|ft\.?|featuring)\b.*$)/gi;

const EDITION_WORDS = [
  'remix',
  'remaster',
  'remastered',
  'live',
  'version',
  'edit',
  'extended',
  'radio',
  'acoustic',
  'mono',
  'stereo',
  'deluxe',
  'edition',
  'bonus',
  'mix',
  'rerecorded',
  're-recorded',
  'cover',
  'karaoke',
  'instrumental',
  'tribute',
];

const EDITION_PATTERN = new RegExp(`\\b(?:${EDITION_WORDS.join('|')})\\b`, 'g');

const foldToAscii = (value: string): string =>
  value.normalize('NFD').replace(/[\u0300-\u036f]/g, '');

/** Indicateurs de version détectés dans le titre ORIGINAL (scoring). */
const VERSION_FLAGS: readonly { flag: string; pattern: RegExp }[] = [
  { flag: 'remix', pattern: /\bremix\b/i },
  { flag: 'live', pattern: /\blive\b|\ben direct\b/i },
  { flag: 'remaster', pattern: /\bremaster(?:ed)?\b/i },
  { flag: 'acoustic', pattern: /\bacoustic(?:que)?\b|\bunplugged\b/i },
  { flag: 'cover', pattern: /\bcover\b|\btribute\b|\bkaraoke\b/i },
  { flag: 'extended', pattern: /\bextended\b|\b12"+/i },
  { flag: 'radio-edit', pattern: /\bradio edit\b/i },
];

export type NormalizedTitle = {
  /** Forme de comparaison de base (sans featuring ni édition). */
  base: string;
  /** Indicateurs de version conservés du titre original. */
  versionFlags: string[];
};

/**
 * Normalise un titre de morceau/album en forme de base comparable.
 */
export const normalizeTitle = (raw: string): NormalizedTitle => {
  let value = foldToAscii(String(raw ?? '')).toLowerCase();

  const versionFlags = VERSION_FLAGS.filter(({ pattern }) =>
    pattern.test(value)
  ).map(({ flag }) => flag);

  // Parenthèses/crochets AVANT le featuring résiduel (« (feat. X) » est déjà
  // couvert par cette passe ; « Titre ft. X » ignorant l espace devant ft).
  value = value.replace(/[[(][^\])]*[\])]/g, ' ');
  value = value.replace(FEATURING_PATTERN, ' ');
  value = value.replace(EDITION_PATTERN, ' ');
  value = value.replace(/[^a-z0-9]+/g, ' ');
  value = value.replace(/\s+/g, ' ').trim();

  return { base: value, versionFlags };
};

/**
 * Normalise un nom d'artiste (comparaison stricte mais tolérante aux
 * accents/ponctuation).
 */
export const normalizeArtist = (raw: string): string => {
  let value = foldToAscii(String(raw ?? '')).toLowerCase();
  value = value.replace(/[[(][^\])]*[\])]/g, ' ');
  value = value.replace(FEATURING_PATTERN, ' ');
  value = value.replace(/[^a-z0-9]+/g, ' ');
  return value.replace(/\s+/g, ' ').trim();
};

/**
 * Artiste « principal » : premier artiste déclaré (avant « feat », « & »,
 * « , », « x »…) — utilisé pour une requête secondaire plus large.
 */
export const mainArtistOf = (raw: string): string => {
  const folded = String(raw ?? '')
    .split(/\s+(?:feat\.?|ft\.?|featuring)\s+/i)[0]
    .split(/\s*[&,]\s+|\s+x\s+/i)[0];
  return foldToAscii(folded).toLowerCase().trim();
};

/** Similarité de similarité token-based (0..1), robuste à l'ordre des mots. */
export const tokenSimilarity = (a: string, b: string): number => {
  const tokensA = new Set(a.split(' ').filter(Boolean));
  const tokensB = new Set(b.split(' ').filter(Boolean));
  if (tokensA.size === 0 || tokensB.size === 0) {
    return 0;
  }
  let intersection = 0;
  for (const token of tokensA) {
    if (tokensB.has(token)) {
      intersection += 1;
    }
  }
  // Dice coefficient : stable pour les titres courts.
  return (2 * intersection) / (tokensA.size + tokensB.size);
};
