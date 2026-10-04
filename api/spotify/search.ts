/**
 * Recherche du catalogue Spotify via la session utilisateur OAuth PKCE.
 *
 * Pourquoi ici et pas seulement côté backend : l'utilisateur est DÉJÀ
 * authentifié (l'application exige une session pour démarrer). L'API Web
 * Spotify officielle expose `/v1/search` avec les quatre types demandés —
 * titres, artistes, albums, playlists — alors que le backend Melodix ne sert
 * que `tracks` et `albums` (voir server/src/config/constants.ts). Utiliser la
 * session existante complète donc la recherche SANS créer de second système :
 * `api/search/searchCatalog.ts` reste le point d'entrée unique, cette couche
 * n'est qu'une source de plus dans sa cascade.
 *
 * Aucun token ne quitte l'appareil : `spotifyApiGet` porte déjà le
 * rafraîchissement, la gestion 401/429 et l'absence de token dans les logs.
 */
import { spotifyApiGet } from '@services';

import { LibraryItemModel } from '@models';

/** Types demandés à Spotify — l'ordre de la réponse n'est pas garanti. */
const SEARCH_TYPES = 'track,artist,album,playlist' as const;

/** Borne Spotify : 50 par type et par page. */
const MAX_PER_TYPE = 20;

const DEFAULT_LIMIT = 10;

export type SpotifySearchResults = {
  tracks: LibraryItemModel[];
  artists: LibraryItemModel[];
  albums: LibraryItemModel[];
  playlists: LibraryItemModel[];
};

type SpotifyImage = { url?: string }[] | null;

type SpotifyArtistRef = { id?: string; name?: string } | null;

type SpotifyAlbumRef = {
  id?: string;
  name?: string;
  images?: SpotifyImage;
  release_date?: string;
} | null;

type SpotifyTrackHit = {
  id?: string;
  name?: string;
  type?: string;
  duration_ms?: number;
  explicit?: boolean;
  artists?: SpotifyArtistRef[] | null;
  album?: SpotifyAlbumRef;
  external_ids?: { isrc?: string | null } | null;
  is_local?: boolean;
} | null;

type SpotifyArtistHit = {
  id?: string;
  name?: string;
  images?: SpotifyImage;
  followers?: { total?: number } | null;
} | null;

type SpotifyAlbumHit = {
  id?: string;
  name?: string;
  album_type?: string;
  images?: SpotifyImage;
  release_date?: string;
  total_tracks?: number;
  artists?: SpotifyArtistRef[] | null;
} | null;

type SpotifyPlaylistHit = {
  id?: string;
  name?: string;
  description?: string | null;
  images?: SpotifyImage;
  owner?: { display_name?: string | null; id?: string } | null;
  tracks?: { total?: number } | null;
  items?: { total?: number } | null;
} | null;

type SpotifySearchRaw = {
  tracks?: { items?: (SpotifyTrackHit | undefined)[] | null } | null;
  artists?: { items?: (SpotifyArtistHit | undefined)[] | null } | null;
  albums?: { items?: (SpotifyAlbumHit | undefined)[] | null } | null;
  playlists?: { items?: (SpotifyPlaylistHit | undefined)[] | null } | null;
};

const firstImage = (images: SpotifyImage): string => images?.[0]?.url ?? '';

const artistNames = (artists?: SpotifyArtistRef[] | null): string[] =>
  (artists ?? [])
    .map((artist) => artist?.name)
    .filter((name): name is string => Boolean(name));

const items = <T>(
  value: { items?: (T | undefined)[] | null } | null | undefined
): T[] => (value?.items ?? []).filter((item): item is T => Boolean(item));

const isrcOf = (raw: SpotifyTrackHit): string | null =>
  typeof raw?.external_ids?.isrc === 'string' && raw.external_ids.isrc.trim()
    ? raw.external_ids.isrc.trim().toUpperCase()
    : null;

const trackToLibraryItem = (raw: SpotifyTrackHit): LibraryItemModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  return {
    id: raw.id,
    type: 'track',
    title: raw.name,
    subtitle: artistNames(raw.artists).join(', ') || 'Artiste inconnu',
    imageURL: firstImage(raw.album?.images ?? null),
    // Métadonnées de matching (I-2) : elles voyagent jusqu'au matcher pour
    // que le badge de disponibilité et la lecture décident à l'identique.
    durationMs: typeof raw.duration_ms === 'number' ? raw.duration_ms : null,
    albumName: raw.album?.name ?? null,
    isrc: isrcOf(raw),
    // Classification EXPLICIT : signal de VERSION, pas un simple bonus. Sans
    // elle la porte content-rating du matcher restait muette et un upload
    // clean pouvait être servi à la place d'une demande explicite.
    explicit: typeof raw.explicit === 'boolean' ? raw.explicit : null,
  };
};

const artistToLibraryItem = (
  raw: SpotifyArtistHit
): LibraryItemModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  return {
    id: raw.id,
    type: 'artist',
    title: raw.name,
    subtitle: '',
    imageURL: firstImage(raw.images ?? null),
  };
};

const albumToLibraryItem = (raw: SpotifyAlbumHit): LibraryItemModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  return {
    id: raw.id,
    type: 'album',
    title: raw.name,
    subtitle: artistNames(raw.artists).join(', '),
    imageURL: firstImage(raw.images ?? null),
  };
};

const playlistToLibraryItem = (
  raw: SpotifyPlaylistHit
): LibraryItemModel | null => {
  if (!raw?.id || !raw.name) {
    return null;
  }

  const total = raw.items?.total ?? raw.tracks?.total;

  return {
    id: raw.id,
    type: 'playlist',
    title: raw.name,
    subtitle: `Par ${raw.owner?.display_name || raw.owner?.id || 'Spotify'}`,
    imageURL: firstImage(raw.images ?? null),
    totalTracks: typeof total === 'number' ? total : undefined,
  };
};

/**
 * Recherche catalogue authentifiée. Un type absent de la réponse Spotify
 * (playlists non disponibles pour un compte, par exemple) est simplement
 * rendu vide — jamais d'exception, la recherche reste utilisable.
 */
export const searchSpotifyCatalog = async (
  query: string,
  limit = DEFAULT_LIMIT
): Promise<SpotifySearchResults> => {
  const q = query.trim();

  if (!q) {
    return { tracks: [], artists: [], albums: [], playlists: [] };
  }

  const perType = Math.min(Math.max(limit, 1), MAX_PER_TYPE);
  const params = new URLSearchParams({
    q,
    type: SEARCH_TYPES,
    limit: String(perType),
  });

  const raw = await spotifyApiGet<SpotifySearchRaw>(
    `/search?${params.toString()}`
  );

  return {
    tracks: items(raw.tracks)
      .map(trackToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
    artists: items(raw.artists)
      .map(artistToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
    albums: items(raw.albums)
      .map(albumToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
    playlists: items(raw.playlists)
      .map(playlistToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
  };
};
