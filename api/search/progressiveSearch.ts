import type { LibraryItemModel, SearchResultsModel } from '@models';
import {
  isBackendConfigured,
  isSpotifySessionActive,
  queueIdForTrackId,
} from '@services';

import { audiusTrackToLibraryItem, searchAudiusTracks } from '../audius';
import { backendSearchCatalog } from '../backend';
import { searchSpotifyCatalogQuick } from '../spotify/search';
import { searchYouTubeTracks } from '../youtube';

import {
  classifySpotifySearchError,
  isSpotifySearchCircuitOpen,
} from './spotifySearchCircuit';
import {
  configureSearchCache,
  getSearchCacheEntry,
  getSearchCacheTtlMs,
  putSearchCacheEntry,
  searchCacheEntryAgeMs,
} from './searchResultsCache';
import {
  mergeAndRankResults,
  normalizeForSearch,
  type SearchSourceId,
} from './searchRanking';

export { configureSearchCache, getSearchCacheTtlMs };

/**
 * Recherche V30 — moteur PROGRESSIF.
 *
 * Rupture avec l'ancienne cascade séquentielle (Spotify PUIS backend PUIS
 * Audius, tout attendu avant le premier affichage) :
 *
 *   - les sources INDÉPENDANTES partent EN PARALLÈLE ;
 *   - chaque source a son propre budget de timeout : une source lente ne
 *     bloque plus JAMAIS les résultats des autres ;
 *   - chaque source qui répond émet IMMÉDIATEMENT un snapshot fusionné
 *     (dédoublonné + classé) : les premiers résultats exploitables
 *     s'affichent sans attendre la fin de toutes les sources ;
 *   - un snapshot est CUMULATIF : une arrivée ultérieure COMPLÈTE la liste,
 *     elle ne remplace ni n'efface les résultats déjà émis ;
 *   - l'erreur d'UNE source n'efface jamais les résultats des autres ;
 *     l'échec GLOBAL n'est signalé que si AUCUNE source n'a fourni de
 *     résultat ET au moins une source a réellement échoué ;
 *   - la recherche Spotify (403 dev-mode constaté en V27-V29) passe par un
 *     disjoncteur : après un refus, elle est écartée 10 min sans bloquer ni
 *     fausser le reste — Spotify reste facultatif par construction ;
 *   - cache TTL borné + partage de requête en vol : deux recherches
 *     identiques successives ne refont PAS le réseau ;
 *   - la requête utilisateur n'est jamais journalisée.
 *
 * Le lecteur n'est pas modifié : chaque track émis porte un id lisible par
 * `queueIdForTrackId` (`audius:*` / `youtube:*` = flux natif direct, autre =
 * métadonnées à matcher par la cascade existante du player).
 */

/** Limites de résultats par source (page naturelle de chacune). */
export const AUDIUS_SEARCH_LIMIT = 50;
export const BACKEND_SEARCH_LIMIT = 50;

/** Budget par source (ms) : au-delà, la source est déclarée en échec POUR
 * CETTE recherche et ses résultats tardifs sont ignorés — les résultats des
 * autres sources, eux, sont déjà affichés. Bornes choisies au-dessus d'une
 * latence réseau normale, bien en dessous des 12 s internes des clients. */
export const SOURCE_TIMEOUTS_MS: Record<SearchSourceId, number> = {
  spotify: 6_000,
  backend: 6_000,
  audius: 7_500,
  youtube: 8_000,
};

/** Borne absolue d'une recherche : après cela, tout ce qui pend encore est
 * soldé (ceinture de sécurité — chaque source a déjà son propre budget). */
export const SEARCH_HARD_LIMIT_MS = 9_000;

/** Au-delà de cet âge, une entrée en cache est rafraîchie en arrière-plan
 * (stale-while-revalidate) tout en restant affichée immédiatement. */
export const SEARCH_CACHE_REFRESH_RATIO = 0.5;

export type ProgressiveSearchSourceState =
  | 'pending'
  | 'done'
  | 'error'
  | 'skipped';

export type ProgressiveSearchUpdate = {
  /** Snapshot CUMULATIF fusionné/dédoublonné/classé (jamais un effacement). */
  results: SearchResultsModel;
  /** Vrai tant qu'au moins une source travaille encore. */
  pending: boolean;
  /** Vrai uniquement si AUCUN résultat ET au moins une source en panne. */
  failed: boolean;
  /** Sources réellement échouées (diagnostic UI discret, pas de journal). */
  failedSources: SearchSourceId[];
};

type SourceContributions = {
  tracks: LibraryItemModel[];
  artists: LibraryItemModel[];
  albums: LibraryItemModel[];
  playlists: LibraryItemModel[];
};

const emptyContributions = (): SourceContributions => ({
  tracks: [],
  artists: [],
  albums: [],
  playlists: [],
});

class SearchSourceTimeoutError extends Error {
  constructor(source: SearchSourceId) {
    super(`source-timeout:${source}`);
    this.name = 'SearchSourceTimeoutError';
  }
}

const withSourceTimeout = async <T>(
  source: SearchSourceId,
  promise: Promise<T>,
  timeoutMs: number
): Promise<T> => {
  let timer: ReturnType<typeof setTimeout> | undefined;

  const timeout = new Promise<never>((_, reject) => {
    timer = setTimeout(
      () => reject(new SearchSourceTimeoutError(source)),
      timeoutMs
    );
  });

  try {
    return await Promise.race([promise, timeout]);
  } finally {
    if (timer !== undefined) {
      clearTimeout(timer);
    }
  }
};

type Run = {
  cacheKey: string;
  query: string;
  subscribers: Set<(update: ProgressiveSearchUpdate) => void>;
  contributions: Record<SearchSourceId, SourceContributions>;
  states: Record<SearchSourceId, ProgressiveSearchSourceState>;
  spotifySessionActive: boolean;
  lastUpdate: ProgressiveSearchUpdate | null;
  settled: boolean;
  cancelled: boolean;
};

const activeRuns = new Map<string, Run>();

const countResults = (results: SearchResultsModel): number =>
  results.tracks.length +
  results.artists.length +
  results.albums.length +
  results.playlists.length;

const buildUpdate = (run: Run): ProgressiveSearchUpdate => {
  const merged = mergeAndRankResults(
    {
      tracks: {
        spotify: run.contributions.spotify.tracks,
        backend: run.contributions.backend.tracks,
        audius: run.contributions.audius.tracks,
        youtube: run.contributions.youtube.tracks,
      },
      artists: {
        spotify: run.contributions.spotify.artists,
        backend: run.contributions.backend.artists,
        audius: run.contributions.audius.artists,
        youtube: run.contributions.youtube.artists,
      },
      albums: {
        spotify: run.contributions.spotify.albums,
        backend: run.contributions.backend.albums,
        audius: run.contributions.audius.albums,
        youtube: run.contributions.youtube.albums,
      },
      playlists: {
        spotify: run.contributions.spotify.playlists,
        backend: run.contributions.backend.playlists,
        audius: run.contributions.audius.playlists,
        youtube: run.contributions.youtube.playlists,
      },
    },
    run.query
  );

  const pending = (Object.keys(run.states) as SearchSourceId[]).some(
    (source) => run.states[source] === 'pending'
  );

  const failedSources = (Object.keys(run.states) as SearchSourceId[]).filter(
    (source) => run.states[source] === 'error'
  );

  // Dégradé = la session Spotify EXISTAIT mais n'a rien pu fournir (403,
  // panne, disjoncteur) alors que d'autres sources servent la recherche.
  // Le mode invité (pas de session) n'est PAS dégradé : Audius + YouTube
  // SONT le catalogue nominal sans compte (mission V29).
  const degraded =
    run.spotifySessionActive &&
    run.states.spotify !== 'done' &&
    countResults(merged) > 0;

  const results: SearchResultsModel = {
    ...merged,
    ...(degraded ? { degraded: true } : {}),
  };

  const total = countResults(merged);
  const settled = !pending;
  const failed = settled && total === 0 && failedSources.length > 0;

  return { results, pending, failed, failedSources };
};

const emit = (run: Run): void => {
  if (run.cancelled || run.subscribers.size === 0) {
    return;
  }

  const update = buildUpdate(run);
  run.lastUpdate = update;

  for (const subscriber of [...run.subscribers]) {
    try {
      subscriber(update);
    } catch {
      // Un consommateur défaillant ne casse jamais la recherche.
    }
  }
};

const settleSource = (
  run: Run,
  source: SearchSourceId,
  state: ProgressiveSearchSourceState
): void => {
  run.states[source] = state;
  emit(run);

  const pending = (Object.keys(run.states) as SearchSourceId[]).some(
    (key) => run.states[key] === 'pending'
  );

  if (!pending && !run.settled) {
    run.settled = true;

    const update = run.lastUpdate;
    const total = update ? countResults(update.results) : 0;

    // Cache : uniquement des réponses avec résultats — jamais une panne ni un
    // « aucun résultat » (resservir un échec comme un résultat = interdit).
    if (update && total > 0) {
      putSearchCacheEntry(run.cacheKey, update.results, Date.now());
    }

    // Fin de course : la requête en vol partagée est libérée. Un léger délai
    // laisse une seconde recherche identique (double appui, retour écran)
    // rejoindre la même exécution plutôt que de relancer le réseau.
    setTimeout(() => {
      if (activeRuns.get(run.cacheKey) === run) {
        activeRuns.delete(run.cacheKey);
      }
    }, 0);
  }
};

type SourceFetcher = () => Promise<void>;

const spotifySource =
  (run: Run, nowMs: number): SourceFetcher =>
  async () => {
    if (!run.spotifySessionActive) {
      settleSource(run, 'spotify', 'skipped');
      return;
    }

    if (isSpotifySearchCircuitOpen(nowMs)) {
      // Refus 403 récent déjà constaté : la source est écartée sans refaire
      // d'appel (ni latence, ni fausse promesse, ni boucle de tentatives).
      settleSource(run, 'spotify', 'skipped');
      return;
    }

    try {
      const found = await withSourceTimeout(
        'spotify',
        searchSpotifyCatalogQuick(run.query),
        SOURCE_TIMEOUTS_MS.spotify
      );

      run.contributions.spotify = {
        tracks: found.tracks,
        artists: found.artists,
        albums: found.albums,
        playlists: found.playlists,
      };
      settleSource(run, 'spotify', 'done');
    } catch (error) {
      classifySpotifySearchError(error, Date.now());
      settleSource(run, 'spotify', 'error');
    }
  };

const audiusSource =
  (run: Run): SourceFetcher =>
  async () => {
    try {
      const tracks = await withSourceTimeout(
        'audius',
        searchAudiusTracks(run.query, AUDIUS_SEARCH_LIMIT),
        SOURCE_TIMEOUTS_MS.audius
      );

      run.contributions.audius.tracks = tracks.map(audiusTrackToLibraryItem);
      settleSource(run, 'audius', 'done');
    } catch {
      settleSource(run, 'audius', 'error');
    }
  };

const backendSource =
  (run: Run): SourceFetcher =>
  async () => {
    if (!isBackendConfigured()) {
      settleSource(run, 'backend', 'skipped');
      return;
    }

    try {
      const found = await withSourceTimeout(
        'backend',
        backendSearchCatalog(run.query, BACKEND_SEARCH_LIMIT),
        SOURCE_TIMEOUTS_MS.backend
      );

      run.contributions.backend = {
        tracks: found.tracks ?? [],
        artists: found.artists ?? [],
        albums: found.albums ?? [],
        playlists: found.playlists ?? [],
      };
      settleSource(run, 'backend', 'done');
    } catch {
      settleSource(run, 'backend', 'error');
    }
  };

const youtubeSource =
  (run: Run): SourceFetcher =>
  async () => {
    try {
      const tracks = await withSourceTimeout(
        'youtube',
        searchYouTubeTracks(run.query),
        SOURCE_TIMEOUTS_MS.youtube
      );

      run.contributions.youtube.tracks = tracks;
      settleSource(run, 'youtube', 'done');
    } catch {
      settleSource(run, 'youtube', 'error');
    }
  };

const startRun = (run: Run, nowMs: number): void => {
  void spotifySource(run, nowMs)();
  void audiusSource(run)();
  void backendSource(run)();
  void youtubeSource(run)();

  // Ceinture : même si une source ignorait son budget, la recherche solde.
  setTimeout(() => {
    if (!run.settled && !run.cancelled) {
      (Object.keys(run.states) as SearchSourceId[]).forEach((source) => {
        if (run.states[source] === 'pending') {
          run.states[source] = 'error';
        }
      });
      emit(run);
      run.settled = true;
      if (activeRuns.get(run.cacheKey) === run) {
        activeRuns.delete(run.cacheKey);
      }
    }
  }, SEARCH_HARD_LIMIT_MS);
};

export type ProgressiveSearchOptions = {
  /** Ignore le cache (bouton « Réessayer », revalidation forcée). */
  bypassCache?: boolean;
};

export type ProgressiveSearchHandle = {
  /** Annule les émissions vers CE consommateur (la course en vol partagée
   * continue pour les autres ; sans abonné, ses résultats sont jetés). */
  cancel: () => void;
};

/**
 * Lance (ou rejoint) une recherche progressive.
 *
 * - retour immédiat du cache valide (0 ms perçu) + rafraîchissement en
 *   arrière-plan quand l'entrée vieillit (la course revalidée émet ses
 *   mises à jour par le même `onUpdate` — les résultats affichés ne sont
 *   JAMAIS effacés, seulement complétés/rafraîchis) ;
 * - une même requête déjà EN VOL est partagée : le second consommateur
 *   reçoit le snapshot courant puis les arrivées suivantes ;
 * - `cancel()` coupe CE consommateur (changement de saisie, démontage) : les
 *   réponses tardives de l'ancienne recherche ne l'atteignent plus JAMAIS.
 */
export const searchCatalogProgressive = (
  query: string,
  onUpdate: (update: ProgressiveSearchUpdate) => void,
  options: ProgressiveSearchOptions = {}
): ProgressiveSearchHandle => {
  const q = query.trim();
  const cacheKey = normalizeForSearch(q);
  const nowMs = Date.now();

  let run: Run | null = null;

  const subscribe = (target: Run): void => {
    target.subscribers.add(onUpdate);

    // Snapshot courant immédiat pour un consommateur qui rejoint en vol.
    if (target.lastUpdate) {
      try {
        onUpdate(target.lastUpdate);
      } catch {
        // Un consommateur défaillant ne casse jamais la recherche.
      }
    }
  };

  if (q) {
    if (!options.bypassCache) {
      const cached = getSearchCacheEntry(cacheKey, nowMs);

      if (cached) {
        onUpdate({
          results: cached.results,
          pending: false,
          failed: false,
          failedSources: [],
        });

        const ttl = getSearchCacheTtlMs();
        const age = searchCacheEntryAgeMs(cached, nowMs);

        // Entrée encore jeune : rien de plus à faire.
        if (ttl <= 0 || age <= ttl * SEARCH_CACHE_REFRESH_RATIO) {
          return {
            cancel: () => {
              // Réponse servie entièrement depuis le cache : rien à annuler.
            },
          };
        }

        // Entrée vieillissante : on la montre QUAND MÊME ci-dessus, et la
        // course ci-dessous revalide en arrière-plan.
      }
    }

    const existing = activeRuns.get(cacheKey);

    if (existing && !existing.settled) {
      run = existing;
      subscribe(existing);
    } else {
      const created: Run = {
        cacheKey,
        query: q,
        subscribers: new Set(),
        contributions: {
          spotify: emptyContributions(),
          backend: emptyContributions(),
          audius: emptyContributions(),
          youtube: emptyContributions(),
        },
        states: {
          spotify: 'pending',
          backend: 'pending',
          audius: 'pending',
          youtube: 'pending',
        },
        spotifySessionActive: false,
        lastUpdate: null,
        settled: false,
        cancelled: false,
      };

      run = created;
      subscribe(created);
      activeRuns.set(cacheKey, created);

      const launch = async (): Promise<void> => {
        let sessionActive = false;
        try {
          sessionActive = await isSpotifySessionActive();
        } catch {
          sessionActive = false;
        }

        if (created.cancelled && created.subscribers.size === 0) {
          if (activeRuns.get(cacheKey) === created) {
            activeRuns.delete(cacheKey);
          }
          return;
        }

        created.spotifySessionActive = sessionActive;
        startRun(created, Date.now());
      };

      void launch();
    }
  }

  return {
    cancel: () => {
      const target = run;
      if (!target) {
        return;
      }

      target.subscribers.delete(onUpdate);

      // Plus personne n'écoute cette course : ses résultats sont jetés à
      // l'arrivée (les requêtes réseau en cours ne sont pas abortables via
      // les clients existants — limite documentée ; l'écran n'est JAMAIS
      // atteint par une réponse annulée).
      if (target.subscribers.size === 0) {
        target.cancelled = true;
        if (activeRuns.get(target.cacheKey) === target) {
          activeRuns.delete(target.cacheKey);
        }
      }
    },
  };
};

/** Tests : oublie les courses en vol (le cache a son propre vidage). */
export const resetProgressiveSearchEngine = (): void => {
  for (const run of activeRuns.values()) {
    run.cancelled = true;
    run.subscribers.clear();
  }
  activeRuns.clear();
};

/**
 * Vérifie qu'un résultat de recherche est réellement envoyable au lecteur
 * existant : l'id produit un id de file valide (jamais un id vide/dupliqué).
 * Utilisé par l'UI avant `playQueue` — un titre n'est « lisible » que par le
 * mécanisme de lecture déjà en place, jamais par promesse.
 */
export const playableQueueIdOf = (item: LibraryItemModel): string | null => {
  if (!item?.id) {
    return null;
  }

  const queueId = queueIdForTrackId(item.id);

  return queueId || null;
};
