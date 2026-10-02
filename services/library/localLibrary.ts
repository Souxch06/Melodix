/**
 * Bibliothèque LOCALE (favoris), 100 % sur l'appareil — aucun compte.
 *
 * Remplace l'ancienne bibliothèque « /me » de Spotify : sauvegarder un
 * morceau/album/playlist/artiste/show revient à stocker sa carte (modèle +
 * métadonnées minimales) sous la clé unique du type. Les appels « savoir si
 * X est sauvegardé » deviennent locaux, instantanés, hors-ligne.
 */

import AsyncStorage from '@react-native-async-storage/async-storage';

import { LibraryItemModel, TrackModel } from '@models';

export const LOCAL_LIBRARY_STORAGE_KEY = '@melodix/local-library';

export type LocalLibraryEntityType =
  | 'track'
  | 'album'
  | 'playlist'
  | 'artist'
  | 'show';

export type LocalTrackEntry = {
  addedAt: number;
  track: TrackModel;
  /** Métadonnées nécessaires au matching si le jour où on rejoue : album. */
  albumTitle?: string;
  artists?: string[];
  durationMs?: number;
};

export type LocalItemEntry = {
  addedAt: number;
  item: LibraryItemModel;
};

// AsyncStorage n'a aucune transaction read-modify-write. Toutes les
// mutations partagent donc une file afin que deux favoris ajoutés au même
// instant ne s'écrasent pas mutuellement.
let mutationQueue: Promise<void> = Promise.resolve();

const enqueueMutation = <T>(operation: () => Promise<T>): Promise<T> => {
  const next = mutationQueue.then(operation, operation);
  mutationQueue = next.then(
    () => undefined,
    () => undefined
  );
  return next;
};

type LocalLibraryShape = Partial<{
  track: Record<string, LocalTrackEntry>;
  album: Record<string, LocalItemEntry>;
  playlist: Record<string, LocalItemEntry>;
  artist: Record<string, LocalItemEntry>;
  show: Record<string, LocalItemEntry>;
}>;

const isPlainObject = (value: unknown): value is Record<string, unknown> =>
  typeof value === 'object' && value !== null && !Array.isArray(value);

const readLibrary = async (): Promise<LocalLibraryShape> => {
  try {
    const raw = await AsyncStorage.getItem(LOCAL_LIBRARY_STORAGE_KEY);
    if (!raw) {
      return {};
    }
    const parsed = JSON.parse(raw) as unknown;
    return isPlainObject(parsed) ? (parsed as LocalLibraryShape) : {};
  } catch {
    return {};
  }
};

const writeLibrary = async (library: LocalLibraryShape): Promise<void> => {
  await AsyncStorage.setItem(
    LOCAL_LIBRARY_STORAGE_KEY,
    JSON.stringify(library)
  );
};

/** Les lectures publiques doivent observer toutes les mutations déjà lancées.
 * Sans cette barrière, un écran ouvert juste après un toggle fire-and-forget
 * pouvait afficher l'ancien favori jusqu'au prochain rafraîchissement. */
const awaitPendingMutations = async (): Promise<void> => {
  await mutationQueue;
};

const sanitizeItemsMap = (map: unknown): Record<string, LocalItemEntry> => {
  if (!isPlainObject(map)) {
    return {};
  }
  const result: Record<string, LocalItemEntry> = {};
  for (const [id, entry] of Object.entries(map)) {
    if (
      isPlainObject(entry) &&
      typeof entry.addedAt === 'number' &&
      isPlainObject(entry.item) &&
      typeof (entry.item as LibraryItemModel).id === 'string'
    ) {
      result[id] = entry as unknown as LocalItemEntry;
    }
  }
  return result;
};

const sanitizeTracksMap = (map: unknown): Record<string, LocalTrackEntry> => {
  if (!isPlainObject(map)) {
    return {};
  }
  const result: Record<string, LocalTrackEntry> = {};
  for (const [id, entry] of Object.entries(map)) {
    if (
      isPlainObject(entry) &&
      typeof entry.addedAt === 'number' &&
      isPlainObject(entry.track) &&
      typeof (entry.track as TrackModel).id === 'string'
    ) {
      result[id] = entry as unknown as LocalTrackEntry;
    }
  }
  return result;
};

/** Morceaux sauvegardés, les plus récents d'abord. */
export const listSavedTracks = async (): Promise<LocalTrackEntry[]> => {
  await awaitPendingMutations();
  const library = await readLibrary();
  return Object.values(sanitizeTracksMap(library.track)).sort(
    (a, b) => b.addedAt - a.addedAt
  );
};

/** Entités sauvegardées d'un type (sauf morceau), les plus récentes d'abord. */
export const listSavedItems = async (
  type: Exclude<LocalLibraryEntityType, 'track'>
): Promise<LibraryItemModel[]> => {
  await awaitPendingMutations();
  const library = await readLibrary();
  return Object.values(sanitizeItemsMap(library[type]))
    .sort((a, b) => b.addedAt - a.addedAt)
    .map((entry) => entry.item);
};

export const getSavedTrack = async (
  trackId: string
): Promise<LocalTrackEntry | undefined> => {
  await awaitPendingMutations();
  const library = await readLibrary();
  return sanitizeTracksMap(library.track)[trackId];
};

export const isSaved = async (
  type: LocalLibraryEntityType,
  id: string
): Promise<boolean> => {
  if (!id) {
    return false;
  }
  return (await checkSaved(type, [id]))[0] ?? false;
};

/**
 * Vérifie une série d'identifiants (ordre STRICTEMENT conservé : l'ancienne
 * API checkSavedItems renvoyait un tableau aligné sur les ids en entrée).
 */
export const checkSaved = async (
  type: LocalLibraryEntityType,
  ids: string[]
): Promise<boolean[]> => {
  await awaitPendingMutations();
  const library = await readLibrary();
  const map =
    type === 'track'
      ? sanitizeTracksMap(library.track)
      : sanitizeItemsMap(library[type]);
  return ids.map((id) => Boolean(id && map[id]));
};

export const saveTrack = async (
  track: TrackModel,
  meta: { albumTitle?: string; artists?: string[]; durationMs?: number } = {}
): Promise<void> => {
  if (!track?.id) {
    return;
  }
  return enqueueMutation(async () => {
    const library = await readLibrary();
    const tracks = sanitizeTracksMap(library.track);
    tracks[track.id] = {
      addedAt: Date.now(),
      track: { ...track, isSaved: true, isPlaying: false },
      albumTitle: meta.albumTitle,
      artists: meta.artists,
      durationMs: meta.durationMs,
    };
    library.track = tracks;
    await writeLibrary(library);
  });
};

export const removeSavedTrack = (trackId: string): Promise<void> =>
  enqueueMutation(async () => {
    const library = await readLibrary();
    const tracks = sanitizeTracksMap(library.track);
    delete tracks[trackId];
    library.track = tracks;
    await writeLibrary(library);
  });

export const saveItem = async (item: LibraryItemModel): Promise<void> => {
  if (!item?.id || item.type === 'track') {
    return;
  }
  return enqueueMutation(async () => {
    const library = await readLibrary();
    const type = item.type as Exclude<LocalLibraryEntityType, 'track'>;
    const map = sanitizeItemsMap(library[type]);
    map[item.id] = { addedAt: Date.now(), item };
    library[type] = map;
    await writeLibrary(library);
  });
};

export const removeSavedItem = (
  type: Exclude<LocalLibraryEntityType, 'track'>,
  id: string
): Promise<void> =>
  enqueueMutation(async () => {
    const library = await readLibrary();
    const map = sanitizeItemsMap(library[type]);
    delete map[id];
    library[type] = map;
    await writeLibrary(library);
  });

/** Bascule favori pour les morceaux et retourne le nouvel état. */
export const toggleSavedTrack = (
  track: TrackModel,
  meta: { albumTitle?: string; artists?: string[]; durationMs?: number } = {}
): Promise<boolean> =>
  enqueueMutation(async () => {
    if (!track?.id) {
      return false;
    }

    // La décision et son écriture appartiennent à UNE seule mutation : deux
    // taps concurrents produisent bien ajout puis retrait, et non deux ajouts.
    const library = await readLibrary();
    const tracks = sanitizeTracksMap(library.track);
    if (tracks[track.id]) {
      delete tracks[track.id];
      library.track = tracks;
      await writeLibrary(library);
      return false;
    }

    tracks[track.id] = {
      addedAt: Date.now(),
      track: { ...track, isSaved: true, isPlaying: false },
      albumTitle: meta.albumTitle,
      artists: meta.artists,
      durationMs: meta.durationMs,
    };
    library.track = tracks;
    await writeLibrary(library);
    return true;
  });

export const clearLocalLibrary = (): Promise<void> =>
  enqueueMutation(() => AsyncStorage.removeItem(LOCAL_LIBRARY_STORAGE_KEY));

/** Tests uniquement. */
export const __resetLocalLibraryForTests = clearLocalLibrary;
