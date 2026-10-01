import * as React from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

import type { TrackModel } from '@models';
import {
  clearMatchCacheStorage,
  getAudioProviders,
  loadMatchCache,
  MATCH_CACHE_STORAGE_KEY,
  persistMatchCache,
  ResolveQueue,
  resolveWithProviders,
  sourceKeyOf,
  writeMatchCacheEntry,
} from '@services';
import type { MatchCache } from '@services';

/**
 * Résolution progressive des morceaux d'une playlist (UI uniquement).
 *
 * - La liste affiche INSTANTANÉMENT les métadonnées Spotify ; les états se
 *   remplissent au fil de la file (≤ 5 recherches simultanées, jamais plus).
 * - Chaque décision est écrite dans LE cache partagé du player : ouvrir un
 *   morceau déjà résolu ne recherche RIEN, et « indisponible » est mémorisé
 *   avec le même statut (providerId/matchId nuls).
 * - refresh() = « refaire le matching » explicitement (purge + file relancée).
 */

export type TrackAvailability =
  | { status: 'pending' }
  | { status: 'resolving' }
  | { status: 'resolved'; providerId: 'audius' | 'youtube' }
  | { status: 'none' };

export type PlaylistResolutionStats = {
  total: number;
  /** Résolus (Audius + YouTube). */
  available: number;
  /** Toutes les décisions connues (available + indisponible). */
  decided: number;
};

export type PlaylistResolutions = {
  /** indexclé par track.id Spotify. */
  byTrackId: Record<string, TrackAvailability>;
  stats: PlaylistResolutionStats;
  refresh: () => void;
};

const NONE_ENTRY: TrackAvailability = { status: 'none' };

const seedFromCache = (
  tracks: TrackModel[],
  cache: MatchCache
): Record<string, TrackAvailability> => {
  const seeded: Record<string, TrackAvailability> = {};

  for (const track of tracks) {
    const key = sourceKeyOf({ provider: null, id: track.id });
    const entry = cache[key];

    if (!entry) {
      seeded[track.id] = { status: 'pending' };
      continue;
    }

    seeded[track.id] = entry.matchId
      ? {
          status: 'resolved',
          providerId: (entry.providerId ?? 'audius') as 'audius' | 'youtube',
        }
      : NONE_ENTRY;
  }

  return seeded;
};

export const usePlaylistResolutions = (
  tracks: TrackModel[]
): PlaylistResolutions => {
  const [byTrackId, setByTrackId] = React.useState<
    Record<string, TrackAvailability>
  >({});
  const [refreshCount, setRefreshCount] = React.useState(0);
  const queueRef = React.useRef<ResolveQueue | null>(null);

  if (!queueRef.current) {
    queueRef.current = new ResolveQueue();
  }

  const refresh = React.useCallback(() => {
    void clearMatchCacheStorage().then(() => setRefreshCount((c) => c + 1));
  }, []);

  const trackIds = React.useMemo(
    () => tracks.map((t) => t.id).join('\u0000'),
    [tracks]
  );

  React.useEffect(() => {
    const currentTracks = tracks;
    let disposed = false;

    const patch = (trackId: string, next: TrackAvailability) => {
      if (!disposed) {
        setByTrackId((prev) => ({ ...prev, [trackId]: next }));
      }
    };

    (async () => {
      let cache: MatchCache = {};
      try {
        const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
        cache = loadMatchCache(raw);
      } catch {
        cache = {};
      }

      if (disposed || !currentTracks.length) {
        return;
      }

      setByTrackId(seedFromCache(currentTracks, cache));

      const providers = getAudioProviders();
      const dirty = { value: false };

      for (const track of currentTracks) {
        const cacheKey = sourceKeyOf({ provider: null, id: track.id });
        if (cache[cacheKey]) {
          continue; // déjà décidé (positif OU négatif connu) — jamais refait
        }

        void queueRef.current!.run(async () => {
          if (disposed) {
            return;
          }

          patch(track.id, { status: 'resolving' });

          // I-2 : la résolution UI utilise les MÊMES métadonnées que le
          // chemin player — album + durée quand la source les fournit
          // (TrackModel.durationMs / albumName). Sans elles, la décision
          // écrite dans le cache PARTAGÉ était moins discriminante que
          // celle qu'aurait prise le player.
          const match = await resolveWithProviders(
            {
              title: track.title,
              artists: track.subtitle
                ? track.subtitle.split(', ').filter(Boolean)
                : [],
              album: track.albumName ?? null,
              durationMillis: track.durationMs ?? null,
            },
            providers
          ).catch(() => null);

          // Persiste la DÉCISION (provider + id) — partagée avec le player.
          writeMatchCacheEntry(
            cache,
            { provider: null, id: track.id },
            match ? match.provider.id : null,
            match ? match.sourceId : null,
            match ? Math.round(match.score * 100) : 0
          );
          dirty.value = true;

          patch(
            track.id,
            match
              ? {
                  status: 'resolved',
                  providerId: match.provider.id as 'audius' | 'youtube',
                }
              : NONE_ENTRY
          );
        });
      }

      // Persist groupé quand tout est terminé (facile : petites tailles).
      const flush = setInterval(() => {
        if (dirty.value && !disposed) {
          dirty.value = false;
          void persistMatchCache(cache);
        }
      }, 1500);

      const watch = setInterval(() => {
        if (
          !queueRef.current ||
          (queueRef.current.inFlightCount === 0 &&
            queueRef.current.waitingCount === 0)
        ) {
          clearInterval(watch);
          clearInterval(flush);
          if (dirty.value && !disposed) {
            dirty.value = false;
            void persistMatchCache(cache);
          }
        }
      }, 800);
    })();

    return () => {
      disposed = true;
      // Les intervals sont légers ; résolutions en vol écrasées par `disposed`.
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [trackIds, refreshCount]);

  const stats = React.useMemo<PlaylistResolutionStats>(() => {
    const total = tracks.length;
    let available = 0;
    let decided = 0;

    for (const track of tracks) {
      const entry = byTrackId[track.id] ?? { status: 'pending' as const };
      if (entry.status === 'resolved') {
        available += 1;
        decided += 1;
      } else if (entry.status === 'none') {
        decided += 1;
      }
    }

    return { total, available, decided };
  }, [tracks, byTrackId]);

  return { byTrackId, stats, refresh };
};
