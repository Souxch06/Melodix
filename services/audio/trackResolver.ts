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

export type ProviderChainResult = {
  provider: AudioProvider;
  sourceId: string;
  /** 0..1 */
  score: number;
} | null;

/**
 * Essaie les providers DANS L'ORDRE donné (Audius, puis YouTube) et rend
 * le premier résultat fiable. Les providers sont reçus en paramètre pour
 * la DIP (le registre de services/audio/index.ts décide de l'ordre).
 */
export const resolveWithProviders = async (
  query: AudioSourceQuery,
  providers: AudioProvider[]
): Promise<ProviderChainResult> => {
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
      continue;
    }

    // DIAG : issue du provider (succès avec score / aucun candidat fiable).
    console.log(
      match
        ? `[MXDIAG] ${diag}_MATCH_SUCCESS score=${match.score}`
        : `[MXDIAG] ${diag}_MATCH_NONE`
    );

    if (match) {
      return { provider, sourceId: match.sourceId, score: match.score };
    }
  }

  return null;
};
