/**
 * DIAGNOSTIC DE RÉSOLUTION — pourquoi un morceau n'a pas été résolu.
 *
 * Objectif : rendre la panne EXPLICITE pour les tests et le debug, sans
 * jamais la montrer à l'utilisateur final et sans jamais exposer de donnée
 * d'écoute.
 *
 * ┌─ Ce qui est enregistré ────────────────────────────────────────────┐
 * │ un CODE de panne, le fournisseur concerné, le NOMBRE de candidats  │
 * │ examinés, le meilleur score observé, et la répartition des motifs   │
 * │ de rejet. Rien d'autre.                                            │
 * └────────────────────────────────────────────────────────────────────┘
 *
 * INTERDIT par construction (le brief est explicite) : aucun jeton, aucun
 * cookie, aucun secret, aucune donnée Spotify privée (titre, artiste,
 * album, ISRC), aucune URL signée, aucune information d'authentification.
 * Seule la FORME de l'échec est conservée — assez pour diagnostiquer, pas
 * assez pour reconstituer ce qu'écoute l'utilisateur.
 *
 * Le tampon est en mémoire, borné, et n'écrit RIEN sur le réseau ni sur le
 * disque : le mécanisme est donc inerte en production (aucun coût, aucun
 * effet de bord) et entièrement pilotable par les tests.
 */

/**
 * Codes de panne, du plus « structurel » au plus « infrastructure ».
 *
 * Ils correspondent aux causes réellement distinguables par la cascade :
 * - `NO_CANDIDATE` : des candidats existaient, aucun n'a passé le seuil ;
 * - `NO_ISRC_MATCH` : un ISRC était disponible mais aucun candidat ne le
 *   portait (signal pourtant le plus fiable) ;
 * - `TITLE_MISMATCH` / `ARTIST_MISMATCH` / `DURATION_MISMATCH` /
 *   `CONTENT_RATING_MISMATCH` / `VERSION_MISMATCH` : la porte stricte qui a
 *   refusé le meilleur candidat (jamais assouplie pour « gagner » un morceau) ;
 * - `PROVIDER_ERROR` : un fournisseur a levé (réseau, protocole) ;
 * - `PROVIDER_TIMEOUT` : un fournisseur a dépassé son délai ;
 * - `NO_PROVIDER_RESULT` : les fournisseurs ont répondu, sans rien renvoyer ;
 * - `PLAYER_LOAD_ERROR` : source RÉSOLUE mais chargement/lecture en échec —
 *   distinct d'un échec de résolution (résolu ≠ chargé ≠ lu) ;
 * - `MATCHED` : succès, conservé pour la traçabilité d'une session.
 */
export type ResolutionFailureCode =
  | 'MATCHED'
  | 'NO_CANDIDATE'
  | 'NO_ISRC_MATCH'
  | 'TITLE_MISMATCH'
  | 'ARTIST_MISMATCH'
  | 'DURATION_MISMATCH'
  | 'CONTENT_RATING_MISMATCH'
  | 'VERSION_MISMATCH'
  | 'PROVIDER_ERROR'
  | 'PROVIDER_TIMEOUT'
  | 'NO_PROVIDER_RESULT'
  | 'PLAYER_LOAD_ERROR';

/** Tous les codes sauf le succès. */
export type ResolutionRejectionCode = Exclude<ResolutionFailureCode, 'MATCHED'>;

/**
 * Décision du moteur de matching pour UN candidat, déjà calculée par le
 * matcher. On n'en conserve que le motif de rejet — jamais le candidat.
 */
export type CandidateRejection = {
  accepted: boolean;
  reason: string;
};

/** Compteurs de rejet par code de panne. */
export type RejectionTally = Partial<Record<ResolutionRejectionCode, number>>;

/**
 * Enregistrement de diagnostic. Aucun champ ne peut contenir de métadonnée
 * d'écoute : le type l'interdit structurellement.
 */
export type ResolutionDiagnosticRecord = {
  code: ResolutionFailureCode;
  /** 'audius' | 'youtube' | null quand la panne est globale. */
  providerId: string | null;
  /**
   * Nombre de PASSES de scoring refusées. Ce n'est PAS un nombre de
   * candidats distincts : le moteur teste plusieurs formulations de
   * recherche et rescores le même lot à chaque fois.
   */
  rejectionCount: number;
  /** Meilleur score observé (0..100), null si aucun candidat. */
  bestScore: number | null;
  /** Motifs de rejet rencontrés, avec leur nombre d'occurrences. */
  rejectedBy: RejectionTally;
  /** Horodatage monotone du runtime (pas d'information utilisateur). */
  at: number;
};

/** Tampon borné : le diagnostic ne doit JAMAIS devenir une fuche mémoire. */
const MAX_RECORDS = 50;

let records: ResolutionDiagnosticRecord[] = [];
let lastTimestamp = 0;

const nextTimestamp = (): number => {
  lastTimestamp = Math.max(Date.now(), lastTimestamp + 1);
  return lastTimestamp;
};

/**
 * Fait correspondre un motif de rejet du matcher au code de panne exposé.
 * Un motif inconnu retombe sur `NO_CANDIDATE` (panne générique) plutôt que
 * d'inventer un code.
 */
const REASON_TO_CODE: Record<string, ResolutionRejectionCode> = {
  'title-mismatch': 'TITLE_MISMATCH',
  'artist-mismatch': 'ARTIST_MISMATCH',
  'duration-mismatch': 'DURATION_MISMATCH',
  'content-rating-mismatch': 'CONTENT_RATING_MISMATCH',
  'variant-mismatch': 'VERSION_MISMATCH',
  'below-threshold': 'NO_CANDIDATE',
  'invalid-candidate': 'NO_CANDIDATE',
  'track-number-conflict': 'NO_CANDIDATE',
};

/** Compte les motifs de rejet, sans conserver les candidats. */
export const tallyRejections = (
  rejections: readonly CandidateRejection[]
): RejectionTally => {
  const tally: RejectionTally = {};

  for (const rejection of rejections) {
    const code = REASON_TO_CODE[rejection.reason] ?? 'NO_CANDIDATE';
    tally[code] = (tally[code] ?? 0) + 1;
  }

  return tally;
};

/**
 * Code de panne DOMINANT d'un fournisseur qui n'a rien retenu.
 *
 * Le motif le plus fréquent gagne ; à égalité, l'ordre de la chaîne de
 * confiance décide (une porte stricte est plus informative qu'un simple
 * score insuffisant). `NO_ISRC_MATCH` est traité à part : un ISRC connu
 * mais absent de tous les candidats est un signal à part entière.
 */
const DOMINANCE_ORDER: ResolutionRejectionCode[] = [
  'CONTENT_RATING_MISMATCH',
  'VERSION_MISMATCH',
  'ARTIST_MISMATCH',
  'TITLE_MISMATCH',
  'DURATION_MISMATCH',
  'NO_ISRC_MATCH',
  'NO_CANDIDATE',
];

export const dominantRejectionCode = (
  tally: RejectionTally,
  hadIsrc: boolean
): ResolutionRejectionCode => {
  for (const code of DOMINANCE_ORDER) {
    if ((tally[code] ?? 0) > 0) {
      return code;
    }
  }

  // Aucun candidat écarté par une porte : soit aucun résultat, soit un ISRC
  // disponible que personne ne porte.
  if (hadIsrc) {
    return 'NO_ISRC_MATCH';
  }

  return 'NO_CANDIDATE';
};

/**
 * Construit le diagnostic d'un fournisseur n'ayant retenu aucun candidat.
 * `rejections` ne contient QUE des motifs de rejet (jamais de métadonnées).
 */
export const buildNoMatchDiagnostic = (params: {
  providerId: string;
  rejections: readonly CandidateRejection[];
  hadIsrc: boolean;
  bestScore?: number | null;
}): ResolutionDiagnosticRecord => {
  const rejectedBy = tallyRejections(params.rejections);

  return {
    code: dominantRejectionCode(rejectedBy, params.hadIsrc),
    providerId: params.providerId,
    rejectionCount: params.rejections.length,
    bestScore: typeof params.bestScore === 'number' ? params.bestScore : null,
    rejectedBy,
    at: nextTimestamp(),
  };
};

/** Enregistre un diagnostic. Borne le tampon, ne journalise rien. */
export const recordResolutionDiagnostic = (
  record: ResolutionDiagnosticRecord
): void => {
  records.push(record);

  if (records.length > MAX_RECORDS) {
    records = records.slice(records.length - MAX_RECORDS);
  }
};

/** Copie défensive des diagnostics enregistrés (usage tests / debug). */
export const getResolutionDiagnostics = (): ResolutionDiagnosticRecord[] => [
  ...records,
];

/** Dernier diagnostic enregistré, ou null. */
export const getLastResolutionDiagnostic =
  (): ResolutionDiagnosticRecord | null =>
    records.length ? records[records.length - 1] : null;

/** Remet le tampon à zéro — à appeler entre deux tests. */
export const clearResolutionDiagnostics = (): void => {
  records = [];
  lastTimestamp = 0;
};

/**
 * CHAMPS autorisés d'un enregistrement de diagnostic. Tout autre champ est
 * un défaut de conception : il pourrait transporter une métadonnée d'écoute.
 */
const DIAGNOSTIC_FIELDS = [
  'code',
  'providerId',
  'rejectionCount',
  'bestScore',
  'rejectedBy',
  'at',
] as const;

/** Un motif de rejet est un code court, jamais une chaîne libre. */
const MAX_REASON_KEY_LENGTH = 32;

/**
 * Vérifie qu'un enregistrement de diagnostic est STRICTEMENT dénaturé.
 *
 * La vérification est structurelle, pas heuristique : on valide la forme
 * exacte autorisée. Un seuil de longueur serait insuffisant (« Blinding
 * Lights » fait 16 caractères et passerait), alors qu'une liste blanche de
 * champs ne peut PAS être contournée par erreur — ajouter `title` au
 * diagnostic ferait échouer ce garde-fou immédiatement.
 *
 * Utilisé par les tests : la confidentialité doit être une propriété
 * vérifiable, pas une convention de relecture.
 */
export const isSanitizedDiagnostic = (value: unknown): boolean => {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    return false;
  }

  const record = value as Record<string, unknown>;

  // 1. Aucun champ hors liste blanche.
  if (
    Object.keys(record).some((key) => !DIAGNOSTIC_FIELDS.includes(key as never))
  ) {
    return false;
  }

  // 2. Types stricts des champs scalaires.
  if (typeof record.code !== 'string' || !record.code) {
    return false;
  }
  if (record.providerId !== null && typeof record.providerId !== 'string') {
    return false;
  }
  if (
    typeof record.rejectionCount !== 'number' ||
    !Number.isInteger(record.rejectionCount)
  ) {
    return false;
  }
  if (record.bestScore !== null && typeof record.bestScore !== 'number') {
    return false;
  }
  if (typeof record.at !== 'number') {
    return false;
  }

  // 3. Les compteurs de rejet : clés courtes (des codes), valeurs entières.
  const rejectedBy = record.rejectedBy;
  if (
    !rejectedBy ||
    typeof rejectedBy !== 'object' ||
    Array.isArray(rejectedBy)
  ) {
    return false;
  }

  return Object.entries(rejectedBy as Record<string, unknown>).every(
    ([key, count]) =>
      key.length > 0 &&
      key.length <= MAX_REASON_KEY_LENGTH &&
      typeof count === 'number' &&
      Number.isInteger(count)
  );
};
