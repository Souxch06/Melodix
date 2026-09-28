/**
 * Contenu d'une playlist Spotify via la session utilisateur OAuth
 * (API Web Spotify officielle — couvre aussi les playlists privées et
 * collaboratives accessibles au compte).
 *
 * Chaque morceau conserve : identifiant Spotify, titre, TOUS les artistes
 * (joints), album, durée (ms), artwork, explicite. L'audio sera résolu au
 * moment de la lecture par le matcher Audius (services/player.ts branché sur
 * queueIdForTrackId) — jamais depuis Spotify.
 */
import { spotifyApiGet } from '@services';
import { PlaylistModel, TrackModel } from '@models';

const TRACKS_PAGE_SIZE = 100; // maximum Spotify pour /playlists/{id}/tracks

type SpotifyImage = { url?: string }[] | null;

type SpotifyAlbumRaw = {
  id?: string;
  name?: string;
  images?: SpotifyImage;
};

type SpotifyTrackRaw = {
  id?: string;
  name?: string;
  duration_ms?: number;
  explicit?: boolean;
  artists?: { id?: string; name?: string }[] | null;
  album?: SpotifyAlbumRaw | null;
  is_local?: boolean;
} | null;

type SpotifyPlaylistTrackItem = {
  track?: SpotifyTrackRaw;
} | null;

type SpotifyPlaylistRaw = {
  id?: string;
  name?: string;
  description?: string | null;
  images?: SpotifyImage;
  owner?: { id?: string; display_name?: string | null } | null;
  tracks?: { total?: number } | null;
};

type PagedTracks = {
  items?: SpotifyPlaylistTrackItem[] | null;
  next?: string | null;
  total?: number;
};

/** Champs ciblés suffisants → des réponses plus légères. */
const TRACK_FIELDS =
  'items(track(id,name,duration_ms,explicit,artists(id,name),album(id,name,images))),next,total';

const toTrackModel = (
  raw: SpotifyTrackRaw,
  index: number
): TrackModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  const artistNames = (raw.artists ?? [])
    .map((artist) => artist?.name)
    .filter((name): name is string => !!name);

  return {
    // Identifiant nu : queueIdForTrackId le préfixe spotify: au moment de la
    // mise en file, puis le matcher Audius fait la correspondance.
    id: raw.id,
    title: raw.name,
    subtitle: artistNames.join(', ') || 'Artiste inconnu',
    imageURL: raw.album?.images?.[0]?.url,
    explicit: !!raw.explicit,
    // Durée et album conservés via le modèle d'extension (cf. queuePlayerTrack
    // de Preview : les tracks lues embarquent déjà leurs métadonnées).
    ...({
      durationMs: raw.duration_ms,
      albumId: raw.album?.id,
      albumName: raw.album?.name,
    } as Partial<TrackModel>),
  };
};

/** Métadonnées de la playlist (GET /v1/playlists/{id}). */
export const getSpotifyPlaylist = async (
  playlistId: string
): Promise<PlaylistModel> => {
  const raw = await spotifyApiGet<SpotifyPlaylistRaw>(
    `/playlists/${encodeURIComponent(playlistId)}`
  );

  if (!raw.id || !raw.name) {
    throw new Error('Spotify a renvoyé une playlist invalide.');
  }

  const owner = raw.owner?.display_name || raw.owner?.id || 'Spotify';

  return {
    type: 'playlist',
    id: raw.id,
    title: raw.name,
    subtitle: `Par ${owner}`,
    ownerId: raw.owner?.id ?? '',
    info: `${raw.tracks?.total ?? 0} titres`,
    description: raw.description ?? '',
    imageURL: raw.images?.[0]?.url ?? '',
    tracks: { total: raw.tracks?.total ?? 0 },
  };
};

/**
 * TOUS les morceaux de la playlist : pagination complète (pages de 100, liens
 * `next` suivis jusqu'à épuisement — jamais tronquée aux 100 premières).
 */
export const getSpotifyPlaylistTracks = async (
  playlistId: string
): Promise<TrackModel[]> => {
  const collected: TrackModel[] = [];
  let nextPath: string | null =
    `/playlists/${encodeURIComponent(playlistId)}/tracks?limit=${TRACKS_PAGE_SIZE}&offset=0&fields=${encodeURIComponent(TRACK_FIELDS)}`;

  let index = 0;
  while (nextPath) {
    const page: PagedTracks = await spotifyApiGet<PagedTracks>(nextPath);
    const items = Array.isArray(page?.items) ? page.items : [];

    for (const item of items) {
      const track = toTrackModel(item?.track ?? null, index);
      if (track) {
        collected.push(track);
        index += 1;
      }
    }

    nextPath = page?.next ?? null;
  }

  return collected;
};

/**
 * Une page de morceaux (page native Spotify limit/offset) — utilisée par les
 * écrans qui paginent eux-mêmes l'affichage (PlaylistScreen).
 */
export const getSpotifyPlaylistTracksPage = async (
  playlistId: string,
  { limit, offset }: { limit: number; offset: number }
): Promise<TrackModel[]> => {
  const safeLimit = Math.min(Math.max(limit, 1), TRACKS_PAGE_SIZE);
  const page = await spotifyApiGet<PagedTracks>(
    `/playlists/${encodeURIComponent(playlistId)}/tracks?limit=${safeLimit}&offset=${Math.max(offset, 0)}&fields=${encodeURIComponent(TRACK_FIELDS)}`
  );

  const items = Array.isArray(page?.items) ? page.items : [];
  const tracks: TrackModel[] = [];
  for (const [index, item] of items.entries()) {
    const track = toTrackModel(item?.track ?? null, index);
    if (track) {
      tracks.push(track);
    }
  }
  return tracks;
};
