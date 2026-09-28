/**
 * Contenu d'une playlist Spotify via la session utilisateur OAuth
 * (API Web Spotify officielle — couvre aussi les playlists privées et
 * collaboratives accessibles au compte).
 *
 * Endpoint des morceaux : GET /v1/playlists/{id}/items — pages de 50
 * (limite recommandée), pagination intégrale jusqu'à `next === null`.
 * Nouveau format d'item : `{ item: Track | Episode | null, ... }` (le
 * legacy `{ track: ... }` reste accepté). Les contenus non audio pour
 * Melodix sont ignorés : épisodes/contenus vidéo (type ≠ 'track'),
 * fichiers locaux (is_local) et pistes défaillantes (item null) — avec,
 * en secours, un rebasculement complet vers l'ancien endpoint /tracks
 * si Spotify répond 404 (transitionalité de l'API), sans casser l'existant.
 *
 * Chaque morceau conserve : identifiant Spotify, titre, TOUS les artistes
 * (joints), album, durée (ms), artwork, explicite. L'audio sera résolu au
 * moment de la lecture par le matcher Audius (services/player.ts branché sur
 * queueIdForTrackId) — jamais depuis Spotify.
 */
import { SpotifyApiError, spotifyApiGet, spotifyLog } from '@services';
import { PlaylistModel, TrackModel } from '@models';

/** Limite de l'endpoint /items (≤ 50 selon le contrat actuel de l'API). */
const ITEMS_PAGE_SIZE = 50;

type SpotifyImage = { url?: string }[] | null;

type SpotifyAlbumRaw = {
  id?: string;
  name?: string;
  images?: SpotifyImage;
};

type SpotifyTrackRaw = {
  id?: string;
  name?: string;
  type?: string; // 'track' | 'episode' | ...
  duration_ms?: number;
  explicit?: boolean;
  artists?: { id?: string; name?: string }[] | null;
  album?: SpotifyAlbumRaw | null;
  is_local?: boolean; // fichiers hors catalogue : ignorés
} | null;

/** Nouveau format /items (item) + format legacy (track). */
type SpotifyPlaylistItem = {
  item?: SpotifyTrackRaw;
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

type PagedItems = {
  items?: SpotifyPlaylistItem[] | null;
  next?: string | null;
  total?: number;
};

/** Champs ciblés suffisants → des réponses plus légères. */
const ITEM_FIELDS =
  'items(item(id,name,type,duration_ms,explicit,artists(id,name),album(id,name,images),is_local)),items(track(id,name,type,duration_ms,explicit,artists(id,name),album(id,name,images),is_local)),next,total';

/**
 * Extraction tolérante : nouveau format `item`, legacy `track`.
 * Les épisodes, fichiers locaux et entrées nulles sont ignorés (false → skip).
 */
const extractPlayableRaw = (entry: SpotifyPlaylistItem): SpotifyTrackRaw => {
  const candidate = entry?.item ?? entry?.track ?? null;
  if (!candidate) {
    return null; // piste indisponible / droits retirés
  }
  if (candidate.type && candidate.type !== 'track') {
    return null; // épisode podcast / autre média
  }
  if (candidate.is_local) {
    return null; // hors catalogue : le matcher Audius ne pourrait pas suivre
  }
  return candidate;
};

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

const pageToTracks = (page: PagedItems, startIndex: number): TrackModel[] => {
  const items = Array.isArray(page?.items) ? page.items : [];
  const tracks: TrackModel[] = [];
  let index = startIndex;

  for (const entry of items) {
    const track = toTrackModel(extractPlayableRaw(entry), index);
    if (track) {
      tracks.push(track);
      index += 1;
    }
  }

  return tracks;
};

const itemsUrl = (
  playlistId: string,
  offset = 0,
  limit = ITEMS_PAGE_SIZE
): string =>
  `/playlists/${encodeURIComponent(playlistId)}/items?limit=${limit}&offset=${offset}&fields=${encodeURIComponent(ITEM_FIELDS)}`;

/** Ancien endpoint (migration d'API) — conservé uniquement en secours. */
const legacyTracksUrl = (
  playlistId: string,
  offset = 0,
  limit = ITEMS_PAGE_SIZE
): string =>
  `/playlists/${encodeURIComponent(playlistId)}/tracks?limit=${limit}&offset=${offset}&fields=${encodeURIComponent(ITEM_FIELDS)}`;

const isHttp404 = (error: unknown): boolean =>
  error instanceof SpotifyApiError && error.status === 404;

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
 * Pagination intégrale depuis une URL initiale : pages consécutives selon le
 * lien `next`, jusqu'à `next === null`. Jamais tronquée à la première page.
 */
const collectAllPages = async (startPath: string): Promise<TrackModel[]> => {
  const collected: TrackModel[] = [];
  let nextPath: string | null = startPath;
  let index = 0;
  let page = 0;

  while (nextPath) {
    page += 1;
    const paged: PagedItems = await spotifyApiGet<PagedItems>(nextPath);
    const tracks = pageToTracks(paged, index);
    collected.push(...tracks);
    index += tracks.length;

    spotifyLog('playlist.items.page', {
      page,
      songCount: tracks.length,
      status: paged?.next ? 'continue' : 'last',
    });

    nextPath = paged?.next ?? null;
  }

  return collected;
};

/**
 * TOUS les morceaux de la playlist (endpoint /items, limit=50).
 * Si Spotify rejette /items en 404 (API transitoire), repli intégral
 * vers l'ancien endpoint /tracks — jamais de liste incomplète silencieuse.
 */
export const getSpotifyPlaylistTracks = async (
  playlistId: string
): Promise<TrackModel[]> => {
  try {
    return await collectAllPages(itemsUrl(playlistId));
  } catch (error) {
    if (!isHttp404(error)) {
      throw error;
    }
    spotifyLog('playlist.items.fallback', { cause: '404', endpoint: '/tracks' });
    return collectAllPages(legacyTracksUrl(playlistId));
  }
};

/**
 * Une page de morceaux (pagination native limit/offset) — utilisée par les
 * écrans qui paginent eux-mêmes l'affichage (PlaylistScreen). limit ≤ 50.
 * Même repli 404 → /tracks que la pagination complète.
 */
export const getSpotifyPlaylistTracksPage = async (
  playlistId: string,
  { limit, offset }: { limit: number; offset: number }
): Promise<TrackModel[]> => {
  const safeLimit = Math.min(Math.max(limit, 1), ITEMS_PAGE_SIZE);
  const safeOffset = Math.max(offset, 0);

  const load = (url: string): Promise<PagedItems> =>
    spotifyApiGet<PagedItems>(url);

  let page: PagedItems;
  try {
    page = await load(itemsUrl(playlistId, safeOffset, safeLimit));
  } catch (error) {
    if (!isHttp404(error)) {
      throw error;
    }
    spotifyLog('playlist.items.page-fallback', {
      cause: '404',
      endpoint: '/tracks',
    });
    page = await load(legacyTracksUrl(playlistId, safeOffset, safeLimit));
  }

  return pageToTracks(page, 0);
};
