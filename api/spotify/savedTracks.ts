/**
 * Titres aimés du compte Spotify (GET /v1/me/tracks, paginé).
 *
 * C'est la VRAIE bibliothèque de l'utilisateur côté Spotify — distincte des
 * favoris LOCALS (services/library/localLibrary.ts), qui restent la source
 * des morceaux « cœur » hors compte. Les deux coexistent : aucun « like »
 * local n'est présenté comme une modification Spotify.
 */
import { spotifyApiGet } from '@services';

import { TrackModel } from '@models';

/** Borne Spotify : 50 par page. */
const PAGE_LIMIT = 50;

/** Garde-fou mémoire : on ne charge jamais plus que ça en une fois. */
const MAX_PAGES = 20;

type SpotifySavedTrack = {
  track?: {
    id?: string;
    name?: string;
    duration_ms?: number;
    explicit?: boolean;
    artists?: { id?: string; name?: string }[] | null;
    album?: {
      id?: string;
      name?: string;
      images?: { url?: string }[] | null;
    } | null;
    external_ids?: { isrc?: string | null } | null;
  } | null;
} | null;

type SpotifySavedPage = {
  items?: (SpotifySavedTrack | undefined)[] | null;
  next?: string | null;
  total?: number;
};

const names = (list?: { name?: string }[] | null): string[] =>
  (list ?? [])
    .map((entry) => entry?.name)
    .filter((name): name is string => Boolean(name));

const isrcOf = (
  track: NonNullable<SpotifySavedTrack>['track']
): string | null =>
  typeof track?.external_ids?.isrc === 'string' &&
  track.external_ids.isrc.trim()
    ? track.external_ids.isrc.trim().toUpperCase()
    : null;

const savedToTrackModel = (entry: SpotifySavedTrack): TrackModel | null => {
  const track = entry?.track;

  if (!track?.id || !track.name) {
    return null;
  }

  return {
    id: track.id,
    title: track.name,
    subtitle: names(track.artists).join(', '),
    imageURL: track.album?.images?.[0]?.url || undefined,
    isSaved: true,
    explicit: Boolean(track.explicit),
    // I-2 : durée + album + ISRC remontent au matcher.
    durationMs:
      typeof track.duration_ms === 'number' ? track.duration_ms : null,
    albumName: track.album?.name ?? null,
    isrc: isrcOf(track),
  };
};

/**
 * Récupère les titres aimés, en paginant jusqu'à `maxTracks`.
 *
 * La pagination suit le curseur `next` renvoyé par Spotify (jamais une
 * reconstruction d'URL) et s'arrête à la borne `MAX_PAGES` : une
 * bibliothèque de plusieurs milliers de titres ne peut pas saturer la
 * mémoire ni le réseau en une seule action.
 */
export const getSpotifySavedTracks = async (
  maxTracks: number = PAGE_LIMIT * 4
): Promise<TrackModel[]> => {
  const collected: TrackModel[] = [];
  let path = `/me/tracks?limit=${PAGE_LIMIT}`;
  let pages = 0;

  while (path && collected.length < maxTracks && pages < MAX_PAGES) {
    const page = await spotifyApiGet<SpotifySavedPage>(path);
    pages += 1;

    for (const entry of page.items ?? []) {
      if (!entry) {
        continue;
      }

      const track = savedToTrackModel(entry);

      if (track) {
        collected.push(track);

        if (collected.length >= maxTracks) {
          break;
        }
      }
    }

    // Curseur officiel : pas d'offset calculé, pas de dérive si la
    // bibliothèque change pendant le chargement.
    path = page.next ?? '';
  }

  return collected;
};

/** Nombre total de titres aimés (pour l'affichage, sans tout charger). */
export const getSpotifySavedTracksCount = async (): Promise<number> => {
  const page = await spotifyApiGet<SpotifySavedPage>(`/me/tracks?limit=1`);

  return typeof page.total === 'number' ? page.total : 0;
};
