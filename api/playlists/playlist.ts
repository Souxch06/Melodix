import { PlaylistModel, TrackModel } from '@models';

import { audiusGet } from '../audius/client';
import {
  audiusTrackToTrackModel,
  type AudiusPlaylistTracksRaw,
} from '../audius/trending';
import type { AudiusTrackMatch } from '../audius/searchTracks';
import { backendGetPlaylist } from '../backend';

const AUDIUS_PREFIX = 'audius:';

const isAudiusPlaylistId = (id: string): boolean => id.startsWith(AUDIUS_PREFIX);

const audiusIdOf = (id: string): string => id.slice(AUDIUS_PREFIX.length);

type AudiusPlaylistDetailRaw = {
  playlist_name?: string;
  description?: string | null;
  artwork?: Record<string, string | undefined> | null;
  user?: { name?: string; handle?: string } | null;
};

/**
 * Métadonnées de playlist.
 * - Préfixe `audius:` → playlist Audius (tendances, catalogue libre).
 * - sinon → backend Melodix (métadonnées du catalogue Spotify).
 */
export const getPlaylist = async (
  playlistId: string
): Promise<PlaylistModel> => {
  if (isAudiusPlaylistId(playlistId)) {
    // GET /playlists/{id} renvoie un tableau d'un élément.
    const rawList = await audiusGet<AudiusPlaylistDetailRaw[]>(
      `/playlists/${encodeURIComponent(audiusIdOf(playlistId))}`
    );
    const raw = Array.isArray(rawList) ? rawList[0] : undefined;
    return {
      type: 'playlist',
      id: playlistId,
      title: raw?.playlist_name ?? '',
      subtitle: raw?.user?.name ?? '',
      ownerId: raw?.user?.handle ?? '',
      info: '',
      description: raw?.description ?? '',
      imageURL: '',
      tracks: { total: 0 },
    };
  }

  const dto = await backendGetPlaylist(playlistId);
  return {
    type: 'playlist',
    id: dto.id,
    title: dto.title,
    subtitle: dto.owner ?? '',
    ownerId: dto.owner ?? '',
    info: '',
    description: dto.description ?? '',
    imageURL: dto.coverUrl ?? '',
    tracks: { total: dto.tracks?.length ?? 0 },
  };
};

/**
 * Pistes d'une playlist (source déterminée par le préfixe d'id).
 */
export const getPlaylistItems = async ({
  playlistId,
  limit,
  offset,
}: {
  playlistId: string;
  limit: number;
  offset: number;
}): Promise<TrackModel[]> => {
  if (isAudiusPlaylistId(playlistId)) {
    const tracks = await audiusGet<AudiusPlaylistTracksRaw>(
      `/playlists/${encodeURIComponent(audiusIdOf(playlistId))}/tracks`,
      { limit: String(Math.min(Math.max(limit, 1), 100)), offset: String(offset) }
    );
    return (tracks ?? [])
      .filter((track): track is AudiusTrackMatch => Boolean(track && track.id))
      .map(audiusTrackToTrackModel);
  }

  const dto = await backendGetPlaylist(playlistId);
  return (dto.tracks ?? []).map((track) => ({
    id: track.id,
    title: track.title,
    subtitle: track.artists.join(', '),
    imageURL: track.coverUrl ?? undefined,
  }));
};
