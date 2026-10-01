import type { AudioProvider, AudioSourceQuery } from './types';

/**
 * TrackResolver — point ENTREE unique de la chaîne de résolution.
 *
 *     SpotifyTrack (métadonnées)
 *       ↓
 *   [AudiusProvider]   — prioritaire, jamais contourné tant qu'il répond
 *       ↓ échec fiable
 *   [YouTubeProvider]  — fallback, MÊME score de confiance
 *       ↓ échec fiable
 *   [none]             — « indisponible » mémorisé, jamais masqué
 *
 * Premier provider qui renvoie un match ≥ seuil GAGNE ; rien n'est
 * enchaîné « au cas où » (pas de requêtes superflues), et le premier
 * résultat n'est jamais pris au hasard : le score partagé décide.
 */

export type ResolvedProviderId = 'audius' | 'youtube';

/** Format de décision mis en cache / exposé à l'UI. */
export type ResolvedTrack =
  | {
      provider: ResolvedProviderId;
      providerTrackId: string;
      title: string;
      artist: string;
      durationSec: number | null;
      /** 0..1, score du moteur de matching partagé. */
      confidence: number;
    }
  | { provider: 'none' };

/**
 * Issue typée de la cascade (I-5) — distingue le NÉGATIF PROUVÉ de la PANNE :
 *
 * - 'matched'  : premier provider avec un candidat fiable (ordre strict) ;
 * - 'no-match' : TOUS les providers ont RÉPONDU « aucun candidat fiable » —
 *                preuve complète → cache négatif durable AUTORISÉ ;
 * - 'error'    : AU MOINS un provider a échoué (réseau/timeout/plan) — la
 *                preuve est incomplète → JAMAIS de negative cache durable :
 *                le morceau sera simplement re-tenté plus tard.
 *
 * Le décideur (player / hook de résolution) grave uniquement 'matched' ou
 * 'no-match' ; 'error' n'écrit RIEN de persistant.
 */
export type ProviderChainOutcome =
  | {
      status: 'matched';
      provider: AudioProvider;
      sourceId: string;
      /** 0..1 */
      score: number;
    }
  | { status: 'no-match' }
  | { status: 'error' };

/**
 * Essaie les providers DANS L'ORDRE donné (Audius, puis YouTube) et rend
 * le premier résultat fiable. Les providers sont reçus en paramètre pour
 * la DIP (le registre de services/audio/index.ts décide de l'ordre).
 */
export const resolveWithProviders = async (
  query: AudioSourceQuery,
  providers: AudioProvider[]
): Promise<ProviderChainOutcome> => {
  let sawProviderError = false;

  for (const provider of providers) {
    let match: { sourceId: string; score: number } | null = null;

    // DIAG 4.4.5-diagnostic : point d'entrée/sortie de CHAQUE provider de la
    // cascade (produit AUDIUS_MATCH_* puis YOUTUBE_MATCH_*). Titre/artiste
    // uniquement — métadonnées publiques, jamais d'URL ni de clé.
    const diag = provider.id.toUpperCase();
    console.log(
      `[MXDIAG] ${diag}_MATCH_START title=${query.title} artist=${query.artists.join(', ')}`
    );

    try {
      match = await provider.resolveMatch(query);
    } catch (error) {
      console.error(`[MXDIAG] ${diag}_MATCH_FAILED`, error); // DIAG
      console.warn(
        `TrackResolver: provider ${provider.id} threw, trying next`,
        error
      );
      sawProviderError = true;
      continue;
    }

    // DIAG : issue du provider (succès avec score / aucun candidat fiable).
    console.log(
      match
        ? `[MXDIAG] ${diag}_MATCH_SUCCESS score=${match.score}`
        : `[MXDIAG] ${diag}_MATCH_NONE`
    );

    if (match) {
      return {
        status: 'matched',
        provider,
        sourceId: match.sourceId,
        score: match.score,
      };
    }
  }

  // Preuve incomplète (un provider en panne a empêché la vérification) :
  // jamais de négatif durable sur une panne — le morceau est réessayable.
  return sawProviderError ? { status: 'error' } : { status: 'no-match' };
};
