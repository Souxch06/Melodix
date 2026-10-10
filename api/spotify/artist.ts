/**
 * Artiste Spotify via la session utilisateur OAuth PKCE.
 *
 *   GET /v1/artists/{id}          → fiche (image, genres, popularité)
 *   GET /v1/artists/{id}/albums   → discographie paginée
 *   GET /v1/artists/{id}/top-tracks → top titres (nécessite un market)
 *
 * Même principe que api/spotify/playlist.ts : la session fournit les données
 * complètes du compte ; le backend Melodix reste le repli (voir
 * api/artists/artist.ts).
 */
import { spotifyApiGet } from '@services';

import { ArtistModel, LibraryItemModel, TrackModel } from '@models';

/** Spotivité n'expose pas les top titres sans marché. */
const MARKET = 'FR';

type SpotifyImage = { url?: string }[] | null;

type SpotifyArtistRaw = {
  id?: string;
  name?: string;
  images?: SpotifyImage;
  genres?: string[] | null;
  followers?: { total?: number } | null;
} | null;

type SpotifyAlbumRaw = {
  id?: string;
  name?: string;
  album_type?: 'album' | 'single' | 'compilation';
  images?: SpotifyImage;
  release_date?: string;
  total_tracks?: number;
  artists?: { id?: string; name?: string }[] | null;
} | null;

type SpotifyTopTrackRaw = {
  id?: string;
  name?: string;
  duration_ms?: number;
  explicit?: boolean;
  preview_url?: string | null;
  album?: {
    id?: string;
    name?: string;
    images?: SpotifyImage;
  } | null;
  artists?: { id?: string; name?: string }[] | null;
  external_ids?: { isrc?: string | null } | null;
} | null;

type SpotifyPage<T> = { items?: (T | undefined)[] | null } | null;

const firstImage = (images: SpotifyImage): string => images?.[0]?.url ?? '';

const names = (list?: { name?: string }[] | null): string[] =>
  (list ?? [])
    .map((entry) => entry?.name)
    .filter((name): name is string => Boolean(name));

const items = <T>(page: SpotifyPage<T>): T[] =>
  (page?.items ?? []).filter((item): item is T => Boolean(item));

const albumToLibraryItem = (raw: SpotifyAlbumRaw): LibraryItemModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  return {
    id: raw.id,
    type: 'album',
    title: raw.name,
    subtitle: names(raw.artists).join(', '),
    imageURL: firstImage(raw.images ?? null),
  };
};

const topTrackToTrackModel = (raw: SpotifyTopTrackRaw): TrackModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  return {
    id: raw.id,
    title: raw.name,
    subtitle: names(raw.artists).join(', '),
    imageURL: firstImage(raw.album?.images ?? null) || undefined,
    explicit: Boolean(raw.explicit),
    durationMs: typeof raw.duration_ms === 'number' ? raw.duration_ms : null,
    albumName: raw.album?.name ?? null,
    isrc:
      typeof raw.external_ids?.isrc === 'string' && raw.external_ids.isrc.trim()
        ? raw.external_ids.isrc.trim().toUpperCase()
        : null,
  };
};

/** Discographie complète d'un artiste, pagination Spotify incluse. */
export const getSpotifyArtistAlbums = async (
  artistId: string,
  limit = 20
): Promise<LibraryItemModel[]> => {
  const params = new URLSearchParams({
    limit: String(Math.min(Math.max(limit, 1), 50)),
    include_groups: 'album,single,compilation',
  });

  const raw = await spotifyApiGet<SpotifyPage<SpotifyAlbumRaw>>(
    `/artists/${encodeURIComponent(artistId)}/albums?${params.toString()}`
  );

  return items(raw)
    .map(albumToLibraryItem)
    .filter((album): album is LibraryItemModel => Boolean(album));
};

/** Fiche artiste : image + genres + top titres (données du compte). */
export const getSpotifyArtist = async (
  artistId: string
): Promise<ArtistModel> => {
  const encoded = encodeURIComponent(artistId);
  const raw = await spotifyApiGet<SpotifyArtistRaw>(`/artists/${encoded}`);

  if (!raw?.id || !raw.name) {
    throw new Error('Spotify a renvoyé un artiste sans identifiant.');
  }

  // Top titres et discographie en parallèle : deux GET indépendants sur la
  // même session. Aucun des deux ne bloque l'autre.
  const [topTracksRaw, albums] = await Promise.all([
    spotifyApiGet<{ tracks?: (SpotifyTopTrackRaw | undefined)[] | null }>(
      `/artists/${encoded}/top-tracks?market=${MARKET}`
    ).catch(() => null),
    getSpotifyArtistAlbums(artistId).catch(() => []),
  ]);

  return {
    type: 'artist',
    id: raw.id,
    name: raw.name,
    imageURL: firstImage(raw.images ?? null),
    topTracks: (topTracksRaw?.tracks ?? [])
      .filter((track): track is SpotifyTopTrackRaw => Boolean(track))
      .map(topTrackToTrackModel)
      .filter((track): track is TrackModel => Boolean(track)),
    albums,
  };
};
