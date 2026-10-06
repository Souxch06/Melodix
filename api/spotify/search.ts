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

/** Borne Spotify : 50 par type et par page (on reste à 20 : pertinent + rapide). */
const MAX_PER_TYPE = 20;

/**
 * Nombre de résultats affichés par recherche. 20 (au lieu de 10) :
 * le premier écran de résultats doit couvrir les déclinaisons d'un même
 * morceau (remaster, version live, édition radio) sans faire défiler.
 */
const DEFAULT_LIMIT = 20;

/** Nombre MAXIMAL de pages de tracks paginées (2 × 20 = 40 pistes). */
const MAX_TRACK_PAGES = 2;

/**
 * Dédoublonne par identifiant Spotify — l'ordre de pertinence Spotify est
 * conservé. Les lignes sans identifiant sont écartées ici : le mappage
 * (trackToLibraryItem) les rejetterait de toute façon.
 */
const dedupeById = <T extends { id?: string | null } | null>(
  value: T[]
): T[] => {
  const seen = new Set<string>();
  return value.filter((item) => {
    if (!item || !item.id || seen.has(item.id)) {
      return false;
    }
    seen.add(item.id);
    return true;
  });
};

const fetchSearchPage = async (
  q: string,
  perType: number,
  offset: number
): Promise<SpotifySearchRaw> => {
  const params = new URLSearchParams({
    q,
    type: SEARCH_TYPES,
    limit: String(perType),
    offset: String(offset),
  });
  return spotifyApiGet<SpotifySearchRaw>(`/search?${params.toString()}`);
};

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
 *
 * PAGINATION TRACKS (completude du catalogue) : la page 1 rend déjà des
 * résultats ; si elle est COMPLETE (signe qu'il y en a d'autres), une 2e
 * page est demandée (offset = limite) et les pistes sont fusionnées par
 * ordre de pertinence Spotify puis dédoublonnées par identifiant. Les
 * autres types (artistes/albums/playlists) restent en page unique : ce
 * sont des entrées de navigation, pas le catalogue de morceaux.
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
  const first = await fetchSearchPage(q, perType, 0);

  // Page 2 de tracks uniquement si la 1e est pleine — sinon inutile.
  // Si elle échoue (réseau), on garde la page 1 : la recherche reste
  // servie, jamais bloquée par la pagination.
  const firstTracks = items(first.tracks);
  let trackHits = firstTracks;
  if (firstTracks.length >= perType) {
    try {
      const second = await fetchSearchPage(q, perType, perType);
      trackHits = [...firstTracks, ...items(second.tracks)];
    } catch {
      trackHits = firstTracks;
    }
  }
  trackHits = dedupeById(trackHits).slice(0, perType * MAX_TRACK_PAGES);

  return {
    tracks: trackHits
      .map(trackToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
    artists: items(first.artists)
      .map(artistToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
    albums: items(first.albums)
      .map(albumToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
    playlists: items(first.playlists)
      .map(playlistToLibraryItem)
      .filter((item): item is LibraryItemModel => Boolean(item)),
  };
};
