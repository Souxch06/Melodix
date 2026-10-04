/**
 * Audius « trending » : catalogues publics (aucune clé, aucune session).
 *
 * Sert de contenu de découverte sans compte : « Playlists en vedette »,
 * recommandations hors historique, repli de recherche si le backend est
 * injoignable.
 */

import type { AudiusTrackResponseType } from '@config';
import { LibraryItemModel, TrackModel } from '@models';

import { audiusGet } from './client';
import type { AudiusTrackMatch } from './searchTracks';

type AudiusPlaylistRaw = {
  id?: string;
  playlist_name?: string;
  description?: string | null;
  artwork?: Record<string, string | undefined> | null;
  user?: { name?: string; handle?: string } | null;
};

type AudiusArtwork =
  | Record<string, string | null | undefined>
  | null
  | undefined;

/**
 * Clés d'artwork Audius, de la PLUS GRANDE à la plus petite.
 *
 * Audius sert les pochettes sous la forme `{ "150x150": …, "480x480": …,
 * "1000x1000": … }` — SANS underscore (voir `AudiusArtworkType` dans
 * config/types.ts). L'ancienne implémentation cherchait `_1000x1000` /
 * `_640x640` / `_480x480` : aucune de ces clés n'existe dans la réponse, donc
 * `artworkUrl()` renvoyait TOUJOURS '' et toutes les images des playlists
 * publiques et des morceaux Audius manquaient à l'écran.
 *
 * On ne se limite pas à cette liste : toute clé `<largeur>x<hauteur>` est
 * acceptée et la plus grande est retenue, ce qui couvre aussi les variantes
 * que certains nœuds renvoient (2000x2000, 640x640…).
 */
const ARTWORK_SIZE_RX = /^(\d{2,5})x(\d{2,5})$/u;

const artworkPixels = (key: string): number => {
  const match = ARTWORK_SIZE_RX.exec(key);

  if (!match) {
    return 0;
  }

  return Number(match[1]) * Number(match[2]);
};

/** Plus grande URL d'artwork disponible ; '' quand Audius n'en fournit aucune. */
export const artworkUrl = (artwork: AudiusArtwork): string => {
  if (!artwork) {
    return '';
  }

  let bestUrl = '';
  let bestPixels = 0;

  for (const [key, url] of Object.entries(artwork)) {
    if (typeof url !== 'string' || !url.trim()) {
      continue;
    }

    const pixels = artworkPixels(key);

    // Une clé non dimensionnée (ex. "master") vaut mieux que rien, mais
    // moins qu'une taille connue : elle ne gagne que si aucune taille n'existe.
    if (pixels === 0) {
      if (bestPixels === 0 && !bestUrl) {
        bestUrl = url.trim();
      }
      continue;
    }

    if (pixels > bestPixels) {
      bestPixels = pixels;
      bestUrl = url.trim();
    }
  }

  return bestUrl;
};

/** Playlists tendance Audius → cartes bibliothèque (type 'playlist'). */
export const getAudiusTrendingPlaylists = async (
  limit = 8
): Promise<LibraryItemModel[]> => {
  let playlists: AudiusPlaylistRaw[] = [];
  try {
    playlists = await audiusGet<AudiusPlaylistRaw[]>('/playlists/trending', {
      limit: String(Math.min(Math.max(limit, 1), 25)),
    });
  } catch (error) {
    console.warn('Audius trending playlists unavailable', error);
    return [];
  }

  return (playlists ?? [])
    .filter((playlist): playlist is AudiusPlaylistRaw & { id: string } =>
      Boolean(playlist && playlist.id)
    )
    .map((playlist) => ({
      // Préfixe de routage : l'écran playlist sait alors interroger Audius
      // (et non le backend métadonnées) pour cette playlist.
      id: `audius:${playlist.id}`,
      type: 'playlist',
      title: playlist.playlist_name ?? '',
      subtitle: playlist.user?.name ?? '',
      imageURL: artworkUrl(playlist.artwork),
    }));
};

/** Morceau Audius brut → carte bibliothèque jouable (type 'track'). */
export const audiusTrackToLibraryItem = (
  track: AudiusTrackMatch
): LibraryItemModel => ({
  // Préfixe de routage : le player sait que cette piste est native Audius
  // (lecture directe, sans matching).
  id: `audius:${track.id}`,
  type: 'track',
  title: track.title ?? '',
  subtitle: track.user?.name ?? '',
  imageURL: artworkUrl(track.artwork),
});

/** Morceau Audius brut → TrackModel du player. */
export const audiusTrackToTrackModel = (
  track: AudiusTrackMatch
): TrackModel => ({
  id: `audius:${track.id}`,
  title: track.title ?? '',
  subtitle: track.user?.name ?? '',
  imageURL: artworkUrl(track.artwork) || undefined,
});

/** Réponse brute /playlists/{id}/tracks d'Audius (filtrée avant usage). */
export type AudiusPlaylistTracksRaw = (AudiusTrackResponseType | null)[];

/** Morceaux tendance Audius (recommandations / repli). */
export const getAudiusTrendingTracks = async (
  limit = 12
): Promise<AudiusTrackMatch[]> => {
  try {
    const tracks = await audiusGet<(AudiusTrackResponseType | null)[]>(
      '/tracks/trending',
      { limit: String(Math.min(Math.max(limit, 1), 25)) }
    );
    return (tracks ?? []).filter((track): track is AudiusTrackMatch =>
      Boolean(track && track.id)
    );
  } catch (error) {
    console.warn('Audius trending tracks unavailable', error);
    return [];
  }
};
