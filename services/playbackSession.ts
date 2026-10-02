import AsyncStorage from '@react-native-async-storage/async-storage';

import type { PlayerTrack, RepeatMode } from './player';

/**
 * Session de lecture persistée — REPRENDRE LA LECTURE.
 *
 * Stockage local versionné (@melodix/playback-session.v1), réutilisant le
 * même socle que services/preferences.ts : sanitize strict, zéro crash sur
 * JSON cassé, aucune donnée inutile (pas de URLs de flux expirantes, pas de
 * `order` de shuffle — reconstruit à la restauration).
 *
 * Écrit « intelligemment » par le moteur (jamais toutes les 500 ms) :
 * position horodatée + drapeau dirty ; écrits déclenchés par pause,
 * changement de morceau, opérations de file, sortie vers l'arrière-plan ou
 * toutes les 8 s pendant la lecture. `stop()` PURGE la session (fermeture
 * explicite) : un « Reprendre » n'apparaît jamais pour une session terminée.
 */

export const PLAYBACK_SESSION_STORAGE_KEY = '@melodix/playback-session.v1';
export const PLAYBACK_SESSION_VERSION = 1;

export type PlaybackSession = {
  version: number;
  savedAt: number;
  queue: PlayerTrack[];
  index: number;
  positionMillis: number;
  shuffle: boolean;
  repeat: RepeatMode;
  volume: number;
};

/** Persiste au plus 200 morceaux autour de l'actuel (queue longue = OK). */
export const PLAYBACK_SESSION_MAX_QUEUE = 200;

/**
 * Fenêtrage de persistance (I-1) : quand la file dépasse
 * PLAYBACK_SESSION_MAX_QUEUE, on mémorise une fenêtre ≤ MAX centrée sur le
 * morceau courant (~100 avant / ~99 après), glissée aux extrémités de la
 * file quand le centrage déborderait. Invariants garantis :
 *  - le morceau courant est TOUJOURS dans la fenêtre ;
 *  - l'index renvoyé pointe vers CE MÊME morceau dans la fenêtre —
 *    sanitizePlaybackSession (index < queue.length) accepte la session ;
 *  - file ≤ MAX : retournée telle quelle, index inchangé.
 * La file EN MÉMOIRE n'est jamais modifiée : seule la copie persistée est
 * découpée. Fonction PURE (testable sans le moteur).
 */
export const windowQueueForSession = (
  queue: PlayerTrack[],
  index: number
): { queue: PlayerTrack[]; index: number } => {
  if (queue.length <= PLAYBACK_SESSION_MAX_QUEUE) {
    return { queue, index };
  }

  const half = Math.floor(PLAYBACK_SESSION_MAX_QUEUE / 2);
  const start = Math.min(
    Math.max(0, index - half),
    queue.length - PLAYBACK_SESSION_MAX_QUEUE
  );

  return {
    queue: queue.slice(start, start + PLAYBACK_SESSION_MAX_QUEUE),
    index: index - start,
  };
};

const sanitizeTrack = (value: unknown): PlayerTrack | null => {
  if (!value || typeof value !== 'object') {
    return null;
  }

  const record = value as Partial<PlayerTrack>;

  if (
    typeof record.id !== 'string' ||
    typeof record.title !== 'string' ||
    !Array.isArray(record.artists) ||
    !record.artists.every((artist) => typeof artist === 'string') ||
    !record.source ||
    typeof record.source !== 'object' ||
    typeof record.source.id !== 'string' ||
    !(
      record.source.provider === null ||
      typeof record.source.provider === 'string'
    )
  ) {
    return null;
  }

  return {
    id: record.id,
    title: record.title,
    artists: record.artists as string[],
    album: typeof record.album === 'string' ? record.album : null,
    // I-8 : albumId optionnel, restauré quand présent — sinon jamais gagné.
    albumId: typeof record.albumId === 'string' ? record.albumId : null,
    // L'ISRC est un signal de matching autoritatif : une reprise de session
    // ne doit pas retomber sur un matching textuel moins fiable. Les anciennes
    // sessions sans champ restent strictement compatibles.
    ...(typeof record.isrc === 'string' && record.isrc.trim()
      ? { isrc: record.isrc.trim().toUpperCase() }
      : {}),
    durationMillis:
      typeof record.durationMillis === 'number' &&
      Number.isFinite(record.durationMillis)
        ? Math.max(0, record.durationMillis)
        : null,
    imageURL: typeof record.imageURL === 'string' ? record.imageURL : '',
    source: record.source as PlayerTrack['source'],
  };
};

export const sanitizePlaybackSession = (
  raw: unknown
): PlaybackSession | null => {
  if (!raw || typeof raw !== 'object') {
    return null;
  }

  const record = raw as Partial<PlaybackSession>;

  if (
    typeof record.version !== 'number' ||
    record.version !== PLAYBACK_SESSION_VERSION ||
    typeof record.savedAt !== 'number' ||
    !Array.isArray(record.queue)
  ) {
    return null;
  }

  const queue = record.queue
    .map(sanitizeTrack)
    .filter((track): track is PlayerTrack => track !== null)
    .slice(0, PLAYBACK_SESSION_MAX_QUEUE);

  const index =
    typeof record.index === 'number' && Number.isFinite(record.index)
      ? Math.trunc(record.index)
      : -1;

  if (!queue.length || index < 0 || index >= queue.length) {
    return null; // session sans morceau courant valide : inutilisable
  }

  const repeat: RepeatMode =
    record.repeat === 'all' || record.repeat === 'one' ? record.repeat : 'off';

  return {
    version: PLAYBACK_SESSION_VERSION,
    savedAt: record.savedAt,
    queue,
    index,
    positionMillis:
      typeof record.positionMillis === 'number' &&
      Number.isFinite(record.positionMillis)
        ? Math.max(0, record.positionMillis)
        : 0,
    shuffle: record.shuffle === true,
    repeat,
    volume:
      typeof record.volume === 'number' && Number.isFinite(record.volume)
        ? Math.min(1, Math.max(0, record.volume))
        : 1,
  };
};

export const loadPlaybackSession =
  async (): Promise<PlaybackSession | null> => {
    try {
      const stored = await AsyncStorage.getItem(PLAYBACK_SESSION_STORAGE_KEY);

      if (!stored) {
        return null;
      }

      return sanitizePlaybackSession(JSON.parse(stored));
    } catch {
      return null; // session corrompue : jamais de crash, simplement ignorée
    }
  };

export const savePlaybackSession = async (
  session: PlaybackSession
): Promise<void> => {
  try {
    await AsyncStorage.setItem(
      PLAYBACK_SESSION_STORAGE_KEY,
      JSON.stringify(session)
    );
  } catch {
    // Persistance non bloquante — la lecture ne doit jamais en pâtir.
  }
};

export const clearPlaybackSession = async (): Promise<void> => {
  try {
    await AsyncStorage.removeItem(PLAYBACK_SESSION_STORAGE_KEY);
  } catch {
    // Best-effort.
  }
};
