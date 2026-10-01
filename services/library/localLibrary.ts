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
  const library = await readLibrary();
  return Object.values(sanitizeTracksMap(library.track)).sort(
    (a, b) => b.addedAt - a.addedAt
  );
};

/** Entités sauvegardées d'un type (sauf morceau), les plus récentes d'abord. */
export const listSavedItems = async (
  type: Exclude<LocalLibraryEntityType, 'track'>
): Promise<LibraryItemModel[]> => {
  const library = await readLibrary();
  return Object.values(sanitizeItemsMap(library[type]))
    .sort((a, b) => b.addedAt - a.addedAt)
    .map((entry) => entry.item);
};

export const getSavedTrack = async (
  trackId: string
): Promise<LocalTrackEntry | undefined> => {
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
};

export const removeSavedTrack = async (trackId: string): Promise<void> => {
  const library = await readLibrary();
  const tracks = sanitizeTracksMap(library.track);
  delete tracks[trackId];
  library.track = tracks;
  await writeLibrary(library);
};

export const saveItem = async (item: LibraryItemModel): Promise<void> => {
  if (!item?.id || item.type === 'track') {
    return;
  }
  const library = await readLibrary();
  const type = item.type as Exclude<LocalLibraryEntityType, 'track'>;
  const map = sanitizeItemsMap(library[type]);
  map[item.id] = { addedAt: Date.now(), item };
  library[type] = map;
  await writeLibrary(library);
};

export const removeSavedItem = async (
  type: Exclude<LocalLibraryEntityType, 'track'>,
  id: string
): Promise<void> => {
  const library = await readLibrary();
  const map = sanitizeItemsMap(library[type]);
  delete map[id];
  library[type] = map;
  await writeLibrary(library);
};

/** Bascule favori pour les morceaux et retourne le nouvel état. */
export const toggleSavedTrack = async (
  track: TrackModel,
  meta: { albumTitle?: string; artists?: string[]; durationMs?: number } = {}
): Promise<boolean> => {
  if (await isSaved('track', track.id)) {
    await removeSavedTrack(track.id);
    return false;
  }
  await saveTrack(track, meta);
  return true;
};

export const clearLocalLibrary = async (): Promise<void> => {
  await AsyncStorage.removeItem(LOCAL_LIBRARY_STORAGE_KEY);
};

/** Tests uniquement. */
export const __resetLocalLibraryForTests = clearLocalLibrary;
