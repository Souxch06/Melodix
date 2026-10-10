import type { LibraryItemModel } from '@models';

import { searchYouTubeSongs } from '../../services/audio/youtubeInnertube';

/**
 * Recherche YouTube Music comme SOURCE DE CATALOGUE de la recherche Melodix
 * (V30), en plus de son rôle historique de secours de lecture.
 *
 * Pourquoi c'est légitime et borné :
 * - le client `youtubeInnertube` parle le protocole JSON PUBLIC de YouTube
 *   Music (aucun contournement de protection, aucun téléchargement) ;
 * - seuls des morceaux identifiés (videoId + titre + artiste) sont retenus :
 *   une vidéo sans identité exploitable n'entre JAMAIS dans les résultats ;
 * - chaque résultat porte l'id `youtube:<videoId>` : le lecteur existant le
 *   lit DIRECTEMENT via le provider YouTube enregistré (pas de fausse
 *   promesse de disponibilité — c'est exactement le flux natif du player) ;
 * - aucune métadonnée inventée : la pochette n'est pas fournie par ce point
 *   d'entrée du protocole → `imageURL` reste vide et l'UI affiche son visuel
 *   par défaut.
 */

/** Nombre de morceaux demandés : couverture réelle sans pagination lourde. */
export const YOUTUBE_SEARCH_LIMIT = 15;

export const youtubeTrackToLibraryItem = (candidate: {
  videoId: string;
  title: string;
  artists: string[];
  durationSec: number | null;
}): LibraryItemModel | null => {
  if (!candidate?.videoId || !candidate.title) {
    return null;
  }

  const artists = (candidate.artists ?? []).filter(Boolean).join(', ');

  return {
    id: `youtube:${candidate.videoId}`,
    type: 'track',
    title: candidate.title,
    subtitle: artists || 'Artiste inconnu',
    imageURL: '',
    durationMs:
      typeof candidate.durationSec === 'number' && candidate.durationSec > 0
        ? Math.round(candidate.durationSec * 1000)
        : null,
    albumName: null,
  };
};

/**
 * Recherche YouTube Music bornée. Toute erreur (réseau, protocole changé,
 * timeout interne du client) est propagée : le moteur progressif l'isole
 * comme l'échec d'UNE source, jamais comme l'échec de la recherche.
 */
export const searchYouTubeTracks = async (
  query: string,
  limit = YOUTUBE_SEARCH_LIMIT
): Promise<LibraryItemModel[]> => {
  const q = query.trim();

  if (!q) {
    return [];
  }

  const candidates = await searchYouTubeSongs(q, limit);

  return candidates
    .map(youtubeTrackToLibraryItem)
    .filter((item): item is LibraryItemModel => item !== null);
};
