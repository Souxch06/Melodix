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

const BEST_ARTWORK_KEYS = ['_1000x1000', '_640x640', '_480x480'] as const;

const artworkUrl = (
  artwork: Record<string, string | null | undefined> | null | undefined
): string => {
  if (!artwork) {
    return '';
  }
  for (const key of BEST_ARTWORK_KEYS) {
    const url = artwork[key];
    if (url) {
      return url;
    }
  }
  return '';
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
