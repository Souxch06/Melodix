import * as React from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

import type { TrackModel } from '@models';
import {
  createMatchResolutionTimestamp,
  deleteMatchCacheEntryFromStorage,
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
 * - refresh() = « refaire le matching » explicitement pour LES MORCEAUX DE
 *   CETTE LISTE uniquement (invalidation ciblée par clé + file relancée) —
 *   jamais de purge globale des autres playlists/favoris/historique.
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
  // Référence fraîche pour refresh() : jamais de fermeture obsolète sur une
  // ancienne liste (le compteur seul relance l'effet).
  const tracksRef = React.useRef(tracks);
  tracksRef.current = tracks;
  // Carte en mémoire PARTAGÉE avec l'effet actif : refresh() y supprime ses
  // clés sinon un flush différé de l'ancienne instance réécrirait les clés
  // fraîchement invalidées (persistMatchCache FUSIONNE — voir matchCache).
  const cacheRef = React.useRef<MatchCache | null>(null);

  if (!queueRef.current) {
    queueRef.current = new ResolveQueue();
  }

  /**
   * « Refaire le matching » — invalidation CIBLÉE (I-3) : seules les clés
   * des morceaux de CETTE liste sont supprimées (API existante du cache,
   * aucune logique parallèle). Le cache étant partagé PAR MORCEAU, la
   * décision d'un morceau présent aussi dans une autre playlist est
   * naturellement refaite avec lui ; toutes les autres entrées (autres
   * playlists, favoris, historique, décisions du player) restent intactes.
   */
  const refresh = React.useCallback(() => {
    return (async () => {
      // 1) Retrait IMMÉDIAT de la carte en mémoire de l'effet actif : un
      // flush différé (setInterval de persistance groupée) ne pourra plus
      // ressusciter ces clés — la fusion de persistMatchCache ne supprime
      // rien, elle ne ferait que les RÉÉCRIRE depuis la vieille carte.
      if (cacheRef.current) {
        for (const current of tracksRef.current) {
          delete cacheRef.current[
            sourceKeyOf({ provider: null, id: current.id })
          ];
        }
      }

      // 2) Retrait PERSISTANT, transaction sans fusion, clé par clé : les
      // autres entrées (autres playlists, favoris, historique, décisions du
      // player) ne sont ni ajoutées ni perdues.
      try {
        for (const current of tracksRef.current) {
          await deleteMatchCacheEntryFromStorage(
            sourceKeyOf({ provider: null, id: current.id })
          );
        }
      } catch {
        // Non bloquant : la file est relancée quoi qu'il arrive.
      }

      setRefreshCount((c) => c + 1);
    })();
  }, []);

  const trackIds = React.useMemo(
    () => tracks.map((t) => t.id).join('\u0000'),
    [tracks]
  );

  React.useEffect(() => {
    const currentTracks = tracks;
    let disposed = false;
    // Intervals de persistance groupée : portée EFFET pour que le cleanup
    // puisse TOUJOURS les arrêter au démontage (avant, une file non vide au
    // démontage laissait tick deux setInterval dans un composant mort).
    let flushInterval: ReturnType<typeof setInterval> | null = null;
    let watchInterval: ReturnType<typeof setInterval> | null = null;

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

      // L'effet actif publie sa carte : refresh() la mutera en priorité (cf.
      // commentaire cacheRef) — l'ancienne instance n'est plus jamais lue.
      cacheRef.current = cache;

      if (disposed || !currentTracks.length) {
        return;
      }

      setByTrackId(seedFromCache(currentTracks, cache));

      const providers = getAudioProviders();
      const dirty = { value: false };
      const scheduledKeys = new Set<string>();

      for (const track of currentTracks) {
        const cacheKey = sourceKeyOf({ provider: null, id: track.id });
        if (cache[cacheKey] || scheduledKeys.has(cacheKey)) {
          continue; // décidé OU déjà en vol dans ce lot — jamais de doublon
        }
        scheduledKeys.add(cacheKey);

        void queueRef.current!.run(async () => {
          if (disposed) {
            return;
          }

          patch(track.id, { status: 'resolving' });
          // Utilisé comme ordre causal par le cache : une résolution lente
          // ne devient pas artificiellement « plus récente » à sa fin.
          const resolutionStartedAt = createMatchResolutionTimestamp();

          // I-2 : la résolution UI utilise les MÊMES métadonnées que le
          // chemin player — album + durée quand la source les fournit
          // (TrackModel.durationMs / albumName). Sans elles, la décision
          // écrite dans le cache PARTAGÉ était moins discriminante que
          // celle qu'aurait prise le player.
          const outcome = await resolveWithProviders(
            {
              title: track.title,
              artists: track.subtitle
                ? track.subtitle.split(', ').filter(Boolean)
                : [],
              album: track.albumName ?? null,
              durationMillis: track.durationMs ?? null,
              isrc: track.isrc ?? null,
              explicit: track.explicit ?? null,
            },
            providers
          ).catch(() => null); // ceinture : le resolver ne rejette jamais

          // Persiste la DÉCISION (provider + id) — partagée avec le player.
          // I-5 : 'error' (panne) → RIEN d'écrit : jamais un badge figé
          // 30 jours pour une panne réseau ; le morceau sera re-tenté.
          if (outcome && outcome.status !== 'error') {
            writeMatchCacheEntry(
              cache,
              { provider: null, id: track.id },
              outcome.status === 'matched' ? outcome.provider.id : null,
              outcome.status === 'matched' ? outcome.sourceId : null,
              outcome.status === 'matched'
                ? Math.round(outcome.score * 100)
                : 0,
              resolutionStartedAt
            );
            dirty.value = true;
          }

          patch(
            track.id,
            outcome?.status === 'matched'
              ? {
                  status: 'resolved',
                  providerId: outcome.provider.id as 'audius' | 'youtube',
                }
              : outcome?.status === 'no-match'
                ? NONE_ENTRY
                : { status: 'pending' }
          );
        });
      }

      // Persist groupé quand tout est terminé (facile : petites tailles).
      flushInterval = setInterval(() => {
        if (dirty.value && !disposed) {
          dirty.value = false;
          void persistMatchCache(cache);
        }
      }, 1500);

      watchInterval = setInterval(() => {
        if (
          !queueRef.current ||
          (queueRef.current.inFlightCount === 0 &&
            queueRef.current.waitingCount === 0)
        ) {
          if (watchInterval) {
            clearInterval(watchInterval);
            watchInterval = null;
          }
          if (flushInterval) {
            clearInterval(flushInterval);
            flushInterval = null;
          }
          if (dirty.value && !disposed) {
            dirty.value = false;
            void persistMatchCache(cache);
          }
        }
      }, 800);
    })();

    return () => {
      disposed = true;
      // Démontage : les deux intervals meurent AVEC l'effet (aucun timer
      // orphelin, même si la file n'était pas encore vide).
      if (watchInterval) {
        clearInterval(watchInterval);
      }
      if (flushInterval) {
        clearInterval(flushInterval);
      }
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
