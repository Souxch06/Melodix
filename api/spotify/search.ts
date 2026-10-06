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

/**
 * Borne Spotify OFFICIELLE : 50 résultats par type et par page (le maximum
 * que `/v1/search` accepte). On utilise la pleine capacité : c'est la limite
 * native de l'API, pas un choix arbitraire, et c'est ce qui permet au
 * catalogue de servir 500 pistes sans multiplier les requêtes.
 */
const MAX_PER_TYPE = 50;

/**
 * Nombre de résultats demandés par défaut. 50 (= pleine page Spotify) :
 * le premier écran de résultats doit couvrir les déclinaisons d'un même
 * morceau (remaster, version live, édition radio) sans faire défiler, et la
 * pagination tracks s'appuie sur cette même taille de page.
 */
const DEFAULT_LIMIT = 50;

/**
 * BORNE DURE de la pagination tracks : au plus `MAX_TRACK_PAGES` pages
 * (× la taille de page = le catalogue maximal servi, 500 pistes à la
 * limite par défaut).
 *
 * Ce n'est PAS une pagination infinie : l'API Spotify impose elle-même
 * `offset + limit ≤ 5000` par requête ; ici on se borne à 500, soit 10 % de
 * la capacité brute de l'API — la plus grande trame de pertinence qu'une
 * recherche de catalogue puisse raisonnablement servir. La boucle
 * (voir `fetchTrackPages`) s'arrête DE TOUTE FAÇON DES QUE la page
 * précédente est INcomplète, c'est-à-dire dès que Spotify a épuisé les
 * résultats pertinents du classement : la borne dure n'est atteinte QUE
 * pour les requêtes très populaires qui remplissent réellement dix pages
 * entières, et elle garantit qu'aucune recherche ne génère une file de
 * pages interminable.
 */
const MAX_TRACK_PAGES = 10;

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

/**
 * Pagination TRACKS adaptative bornée (complétude du catalogue).
 *
 * Règles (verrouillées par les tests) :
 *  1. la page 1 est TOUJOURS servie — sa faute est la faute de la recherche
 *     (propagée par l'appelant) ;
 *  2. une page suivante n'est demandée QUE si la précédente est PLEINE
 *     (signe qu'il existe d'autres résultats, classés par pertinence) ;
 *  3. une page INcomplète (Spotify a fini) interrompt IMMÉDIATEMENT la
 *     pagination — c'est le signal « résultats déjà épuisés » ;
 *  4. la borne dure `MAX_TRACK_PAGES` stoppe toute pagination massive ;
 *  5. une page secondaire qui ÉCHoue (réseau) ne bloque PAS la recherche :
 *     on conserve les pages déjà servies et on arrête la pagination ;
 *  6. dédoublonnage par identifiant Spotify, ordre de pertinence conservé
 *     (les pages s'enchaînent dans l'ordre demandé).
 *
 * `first` est la page 1 déjà fetchée par l'appelant (réutilisée pour les
 * autres types : navigateurs, pas catalogue — donc jamais paginés).
 */
const fetchTrackPages = async (
  q: string,
  perType: number,
  first: SpotifySearchRaw
): Promise<SpotifyTrackHit[]> => {
  const trackHits: SpotifyTrackHit[] = [...items(first.tracks)];
  let page = first;
  let pagesFetched = 1;

  while (
    items(page.tracks).length >= perType &&
    pagesFetched < MAX_TRACK_PAGES
  ) {
    pagesFetched += 1;
    let next: SpotifySearchRaw;

    try {
      next = await fetchSearchPage(q, perType, perType * (pagesFetched - 1));
    } catch {
      // Page secondaire en échec : la recherche reste servie (les pages déjà
      // récupérées), la pagination s'arrête proprement.
      break;
    }

    // Une page secondaire malformée (pas un objet) est traitée comme un
    // échec : on conserve ce qui est servi, on n'arrête pas la recherche.
    if (!next || typeof next !== 'object') {
      break;
    }

    page = next;
    trackHits.push(...items(next.tracks));
  }

  return dedupeById(trackHits).slice(0, perType * MAX_TRACK_PAGES);
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
 * PAGINATION TRACKS (complétude du catalogue) : voir `fetchTrackPages` —
 * adaptative et bornée (continue tant que la page précédente est pleine,
 * stop dès qu'elle est incomplète ou à la borne dure, tolérante aux échecs
 * de pages secondaires). Les autres types (artistes/albums/playlists)
 * restent en page unique : ce sont des entrées de navigation, pas le
 * catalogue de morceaux.
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
  // La page 1 sert ÉGALEMENT les types de navigation (artistes/albums/
  // playlists) — seule la pagination tracks s'appuie sur elle.
  const first = await fetchSearchPage(q, perType, 0);
  const trackHits = await fetchTrackPages(q, perType, first);

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
