/**
 * Historique de lecture LOCAL (AsyncStorage), sans aucun compte.
 *
 * Melodix 3.0 : les sections personnelles (Écoutés récemment, Vos titres
 * préférés, artistes en tête, recommandations) s'appuient sur CETTE donnée
 * — rien n'est envoyé ailleurs que sur l'appareil.
 *
 * Garanties : borne MAX_HISTORY (téléphone ne gonfle jamais), déduplication
 * par identifiant source (le morceau remonte en tête), lecture tolérante aux
 * données corrompues (repart de zéro plutôt que crash).
 */

import AsyncStorage from '@react-native-async-storage/async-storage';

import { TrackModel } from '@models';

export const PLAY_HISTORY_STORAGE_KEY = '@melodix/play-history';

export const MAX_HISTORY = 100;

/** AsyncStorage n'offre pas de transaction read-modify-write. Les lectures
 * valides peuvent arriver presque simultanément lors d'un skip rapide : une
 * file unique empêche la seconde d'écraser la première. */
let mutationQueue: Promise<void> = Promise.resolve();

const enqueueMutation = <T>(operation: () => Promise<T>): Promise<T> => {
  const next = mutationQueue.then(operation, operation);
  mutationQueue = next.then(
    () => undefined,
    () => undefined
  );
  return next;
};

const waitForMutations = async (): Promise<void> => mutationQueue;

export type PlayHistoryEntry = {
  /** Snapshot du morceau tel qu'affiché à la lecture. */
  track: TrackModel;
  /** Album d'origine si connu (renseigné par les écrans album/playlist). */
  albumTitle?: string;
  /**
   * I-8 : identifiant de l'album d'écoute quand connu (écran album) —
   * permet de naviguer vers l'ALBUM depuis « Écoutés récemment » au lieu
   * d'une route /album construite sur un id de MORCEAU. Absent sur les
   * anciennes entrées : compat complète (fallback = lecture directe).
   */
  albumId?: string | null;
  playedAt: number;
};

type PersistedHistory = {
  entries: PlayHistoryEntry[];
};

const readEntries = async (): Promise<PlayHistoryEntry[]> => {
  try {
    const raw = await AsyncStorage.getItem(PLAY_HISTORY_STORAGE_KEY);
    if (!raw) {
      return [];
    }
    const parsed = JSON.parse(raw) as PersistedHistory;
    return Array.isArray(parsed?.entries)
      ? parsed.entries.filter((entry): entry is PlayHistoryEntry =>
          Boolean(entry && entry.track && typeof entry.track.id === 'string')
        )
      : [];
  } catch {
    return [];
  }
};

const writeEntries = async (entries: PlayHistoryEntry[]): Promise<void> => {
  await AsyncStorage.setItem(
    PLAY_HISTORY_STORAGE_KEY,
    JSON.stringify({ entries } satisfies PersistedHistory)
  );
};

/** Les consommateurs voient aussi les écritures fire-and-forget déjà lancées. */
const readStableEntries = async (): Promise<PlayHistoryEntry[]> => {
  await waitForMutations();
  return readEntries();
};

/**
 * Enregistre une lecture (idempotent : un même morceau rejoué remonte en
 * tête sans se dupliquer).
 */
export const recordPlay = (
  track: TrackModel,
  meta: { albumTitle?: string; albumId?: string | null } = {}
): Promise<void> => {
  if (!track?.id) {
    return Promise.resolve();
  }

  return enqueueMutation(async () => {
    const entries = await readEntries();
    const remaining = entries.filter((entry) => entry.track.id !== track.id);
    remaining.unshift({
      track: { ...track, isPlaying: false },
      albumTitle: meta.albumTitle,
      albumId: meta.albumId ?? null,
      playedAt: Date.now(),
    });
    await writeEntries(remaining.slice(0, MAX_HISTORY));
  });
};

/**
 * Dernières lectures, les plus récentes d'abord.
 */
export const getRecentlyPlayedTracks = async (
  limit = 20
): Promise<PlayHistoryEntry[]> => (await readStableEntries()).slice(0, limit);

/**
 * Dédupliqué par id source Audius quand elle est connue (deux sources
 * de métadonnées différentes du même morceau Audius = une entrée).
 */
export const getRecentlyPlayedAlbumLike = async (
  limit = 8
): Promise<
  {
    id: string;
    title: string;
    subtitle: string;
    imageURL?: string;
    /** I-8 : album d'origine si connu (sinon null). */
    albumId: string | null;
    /** I-8 : snapshot du morceau — lecture directe si l'album est inconnu. */
    track: TrackModel;
  }[]
> => {
  const seen = new Set<string>();
  const result: {
    id: string;
    title: string;
    subtitle: string;
    imageURL?: string;
    albumId: string | null;
    track: TrackModel;
  }[] = [];
  for (const entry of await readStableEntries()) {
    const key = entry.albumTitle ?? entry.track.id;
    if (seen.has(key)) {
      continue;
    }
    seen.add(key);
    result.push({
      id: entry.track.id,
      title: entry.albumTitle ?? entry.track.title,
      subtitle: entry.track.subtitle,
      imageURL: entry.track.imageURL,
      albumId: entry.albumId ?? null,
      track: entry.track,
    });
    if (result.length >= limit) {
      break;
    }
  }
  return result;
};

/**
 * Artiste/album en tête = compte de lectures (simple, explicable,
 * déterministe : à compte égal, le plus récent gagne).
 */
const topBy = (
  entries: PlayHistoryEntry[],
  pick: (entry: PlayHistoryEntry) => string | null,
  limit: number
): {
  key: string;
  count: number;
  lastPlayedAt: number;
  sampleEntry: PlayHistoryEntry;
  sampleTrack: TrackModel;
}[] => {
  const buckets = new Map<
    string,
    { count: number; lastPlayedAt: number; sampleEntry: PlayHistoryEntry }
  >();
  for (const entry of entries) {
    const key = pick(entry);
    if (!key) {
      continue;
    }
    const bucket = buckets.get(key) ?? {
      count: 0,
      lastPlayedAt: 0,
      sampleEntry: entry,
    };
    bucket.count += 1;
    bucket.lastPlayedAt = Math.max(bucket.lastPlayedAt, entry.playedAt);
    buckets.set(key, bucket);
  }
  return [...buckets.entries()]
    .map(([key, value]) => ({
      key,
      ...value,
      sampleTrack: value.sampleEntry.track,
    }))
    .sort((a, b) => b.count - a.count || b.lastPlayedAt - a.lastPlayedAt)
    .slice(0, limit);
};

export const getTopArtistsFromHistory = async (
  limit = 5
): Promise<{ name: string; count: number; imageURL?: string }[]> => {
  const entries = await readStableEntries();
  return topBy(entries, (entry) => entry.track.subtitle || null, limit).map(
    ({ key, count, sampleTrack }) => ({
      name: key,
      count,
      imageURL: sampleTrack.imageURL,
    })
  );
};

/**
 * TOP-ALBUMS (extension I-8) — jamais de faux album :
 * - regroupement par `albumId ?? albumTitle` (deux morceaux du MÊME
 *   albumId se regroupent même si leur titre diffère ; deux albumIds
 *   distincts restent séparés même à titre identique) ;
 * - `id` = albumId RÉEL de l'entrée quand connu, sinon null — jamais
 *   track.id déguisé en albumId (une tuile sans album réel reste
 *   fonctionnelle via `track`, snapshot en lecture directe) ;
 * - anciennes entrées sans albumId : regroupées par titre, id null.
 */
export const getTopAlbumsFromHistory = async (
  limit = 6
): Promise<
  {
    id: string | null;
    title: string;
    subtitle: string;
    imageURL?: string;
    count: number;
    /** Snapshot du morceau échantillon : lecture directe si albumId absent. */
    track: TrackModel;
  }[]
> => {
  const entries = await readStableEntries();
  return topBy(
    entries,
    (entry) => entry.albumId ?? entry.albumTitle ?? null,
    limit
  ).map(({ key, count, sampleEntry, sampleTrack }) => ({
    id: sampleEntry.albumId ?? null,
    title: sampleEntry.albumTitle ?? sampleTrack.albumName ?? key,
    subtitle: sampleTrack.subtitle,
    imageURL: sampleTrack.imageURL,
    count,
    track: sampleTrack,
  }));
};

/** Historique vide = sections masquées plutôt que vides. */
export const hasPlayHistory = async (): Promise<boolean> =>
  (await readStableEntries()).length > 0;

/** Supprime une seule entrée sans perturber l'ordre des autres lectures. */
export const removePlayHistoryEntry = (trackId: string): Promise<void> => {
  if (!trackId) {
    return Promise.resolve();
  }
  return enqueueMutation(async () => {
    const entries = await readEntries();
    await writeEntries(entries.filter((entry) => entry.track.id !== trackId));
  });
};

export const clearPlayHistory = (): Promise<void> =>
  enqueueMutation(() => AsyncStorage.removeItem(PLAY_HISTORY_STORAGE_KEY));

/** Tests uniquement. */
export const __resetPlayHistoryForTests = clearPlayHistory;
