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

    try {
      match = await provider.resolveMatch(query);
    } catch (error) {
      console.warn(
        `TrackResolver: provider ${provider.id} threw, trying next`,
        error
      );
      continue;
    }

    if (match) {
      return { provider, sourceId: match.sourceId, score: match.score };
    }
  }

  return null;
};
