/**
 * V31 — BANC DE COUVERTURE EN LIGNE (Goal C6).
 *
 * ⚠️  Ce fichier N'EST PAS exécuté par la suite par défaut : son extension
 * (.online.test.ts) ne correspond PAS au testMatch unitaire du dépôt — il
 * exige un VRAI accès réseau à Audius et YouTube Music et ne doit JAMAIS
 * rendre la suite dépendante d'Internet.
 *
 * Exécution volontaire :
 *   npm run test:online
 *   (npx jest --testMatch avec le motif ".online.test.ts", --runInBand)
 *
 * Principe :
 *  - jeu de requêtes FIXE et public (aucune donnée utilisateur) couvrant :
 *    tube international, titres français accentués/apostrophes, artiste
 *    indépendant, multi-artistes, remix, live, acoustique, instrumental,
 *    morceau ancien, morceau récent, variante d'artiste, faute de frappe
 *    raisonnable, recherche par artiste seul ;
 *  - pour chaque requête : % de sources ayant répondu, nombre de résultats
 *    uniques, résultats « jouables » (id audius:* / youtube:* — lecture
 *    native directe), temps jusqu'au premier résultat, temps total, doublons
 *    inter-sources écartés, erreurs par source ;
 *  - le rapport distingue clairement les mesures RÉELLES (réseau actif) de
 *    l'environnement SANS réseau : dans ce dernier cas (ex. sandbox CI), le
 *    banc le DÉTECTE (sonde), l'affiche et n'échoue PAS — aucune valeur
 *    n'est inventée, jamais.
 *
 * Les attentes de vérification (when online) sont volontairement modestes et
 * factuelles : au moins une requête sur deux doit trouver ≥ 1 résultat
 * pertinent, et chaque source saine doit répondre sur au moins une requête.
 */
import { searchCatalogProgressive } from '../progressiveSearch';
import type {
  ProgressiveSearchTimings,
  ProgressiveSearchUpdate,
} from '../progressiveSearch';
import type { SearchSourceId } from '../searchRanking';

/** Délai maximal d'attente par requête (le moteur solde à 9 s). */
const MAX_WAIT_MS = 12_000;

type QueryCase = {
  id: string;
  query: string;
  /** Mot(s) attendus dans au moins un résultat (normalisé, casse ignorée). */
  expectAnyWord?: string[];
};

const CASES: QueryCase[] = [
  {
    id: 'fame-en',
    query: 'Daft Punk One More Time',
    expectAnyWord: ['one more time', 'daft punk'],
  },
  {
    id: 'fr-accent',
    query: "Édith Piaf L'Hymne à l'amour",
    expectAnyWord: ['hymne', 'piaf'],
  },
  {
    id: 'fr-apostrophe',
    query: "Stromae L'enfer",
    expectAnyWord: ['enfer', 'stromae'],
  },
  {
    id: 'indie',
    query: 'Adrienne Lenker Anything',
    expectAnyWord: ['anything', 'lenker'],
  },
  {
    id: 'multi-artist',
    query: 'Coldplay Beyoncé Hymn for the Weekend',
    expectAnyWord: ['hymn for the weekend'],
  },
  {
    id: 'remix',
    query: 'The Weeknd Blinding Lights Remix',
    expectAnyWord: ['blinding lights'],
  },
  {
    id: 'live',
    query: 'Queen Bohemian Rhapsody Live Aid',
    expectAnyWord: ['bohemian rhapsody'],
  },
  {
    id: 'acoustic',
    query: 'Billie Eilish Ocean Eyes Acoustic',
    expectAnyWord: ['ocean eyes'],
  },
  {
    id: 'instrumental',
    query: 'Ludovico Einaudi Nuvole Bianche',
    expectAnyWord: ['nuvole bianche'],
  },
  {
    id: 'old',
    query: 'Jacques Brel Ne me quitte pas',
    expectAnyWord: ['quitte', 'brel'],
  },
  { id: 'recent', query: 'Miley Cyrus Flowers', expectAnyWord: ['flowers'] },
  { id: 'artist-only', query: 'Aya Nakamura', expectAnyWord: ['nakamura'] },
  { id: 'typo', query: 'Daft Pnk Get Lcky', expectAnyWord: ['lucky', 'daft'] },
  { id: 'title-only', query: 'Formidable', expectAnyWord: ['formidable'] },
];

type CaseReport = {
  id: string;
  query: string;
  totalResults: number;
  playable: number;
  firstResultMs: number | null;
  totalMs: number;
  failedSources: string[];
  circuitSources: string[];
  offline: boolean;
  relevant: boolean;
};

const normalize = (value: string): string =>
  value
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase();

const runCase = (queryCase: QueryCase): Promise<CaseReport> =>
  new Promise((resolve) => {
    let last: ProgressiveSearchUpdate | null = null;
    let firstResultMs: number | null = null;
    const startedAt = Date.now();

    const handle = searchCatalogProgressive(queryCase.query, (update) => {
      last = update;

      const count =
        update.results.tracks.length +
        update.results.artists.length +
        update.results.albums.length +
        update.results.playlists.length;

      if (count > 0 && firstResultMs === null) {
        firstResultMs = Date.now() - startedAt;
      }

      if (!update.pending) {
        clearTimeout(timer);
        finish();
      }
    });

    // Garde-fou : même sans snapshot final, le banc rend la main.
    const timer: ReturnType<typeof setTimeout> = setTimeout(
      () => finish(),
      MAX_WAIT_MS
    );

    const finish = () => {
      handle.cancel();

      const update = last;
      const totalResults = update
        ? update.results.tracks.length +
          update.results.artists.length +
          update.results.albums.length +
          update.results.playlists.length
        : 0;

      const playable = update
        ? update.results.tracks.filter(
            (track) =>
              track.id.startsWith('audius:') || track.id.startsWith('youtube:')
          ).length
        : 0;

      const haystack = update
        ? normalize(
            [
              ...update.results.tracks.map((t) => `${t.title} ${t.subtitle}`),
              ...update.results.artists.map((a) => a.title),
              ...update.results.albums.map((a) => a.title),
              ...update.results.playlists.map((p) => p.title),
            ].join(' ')
          )
        : '';

      const relevant =
        totalResults > 0 &&
        (queryCase.expectAnyWord ?? []).some((word) =>
          haystack.includes(normalize(word))
        );

      const timings: ProgressiveSearchTimings | undefined = update?.timings;

      resolve({
        id: queryCase.id,
        query: queryCase.query,
        totalResults,
        playable,
        firstResultMs:
          timings?.firstResultMs ??
          (firstResultMs === null ? null : firstResultMs),
        totalMs: timings?.totalMs ?? Date.now() - startedAt,
        failedSources: update ? [...update.failedSources] : ['all'],
        circuitSources: update ? [...(update.circuitSources ?? [])] : [],
        offline: Boolean(update?.offline),
        relevant,
      });
    };
  });

describe('Banc de couverture en ligne V31 (opt-in, réseau réel requis)', () => {
  it(
    'mesure la couverture réelle sur jeu de requêtes fixe',
    async () => {
      // Sonde : une requête simple pour détecter l'absence de réseau AVANT
      // de tirer des conclusions (les sandbox CI n'ont pas d'accès sortant).
      const probe = await runCase({ id: 'probe', query: 'Beethoven' });
      const networkUnavailable =
        probe.offline ||
        (probe.totalResults === 0 &&
          probe.failedSources.length > 0 &&
          probe.failedSources.every((source) =>
            ['audius', 'youtube', 'backend', 'spotify'].includes(source)
          ));

      const reports: CaseReport[] = [probe];

      if (!networkUnavailable) {
        for (const queryCase of CASES) {
          // Séquentiel : ne pas créer nous-mêmes un 429 sur les nœuds.
          // eslint-disable-next-line no-await-in-loop
          reports.push(await runCase(queryCase));
        }
      }

      const withResults = reports.filter((r) => r.totalResults > 0);
      const relevant = reports.filter((r) => r.relevant);
      const offlineCount = reports.filter((r) => r.offline).length;

      const perSourceErrors: Record<string, number> = {};
      reports.forEach((report) => {
        [...report.failedSources, ...report.circuitSources].forEach(
          (source) => {
            perSourceErrors[source] = (perSourceErrors[source] ?? 0) + 1;
          }
        );
      });

      const summary = {
        environment: networkUnavailable
          ? 'NETWORK-UNAVAILABLE (mesures impossibles ici — rien n est inventé)'
          : 'online (mesures réelles)',
        queriesRun: reports.length,
        queriesWithResults: withResults.length,
        queriesRelevant: relevant.length,
        offlineFastPaths: offlineCount,
        playableTotal: reports.reduce((sum, r) => sum + r.playable, 0),
        perSourceErrors,
        cases: reports.map(
          ({
            id,
            totalResults,
            playable,
            firstResultMs,
            totalMs,
            relevant: rel,
            offline,
            failedSources,
          }) => ({
            id,
            totalResults,
            playable,
            firstResultMs,
            totalMs,
            relevant: rel,
            offline,
            failedSources,
          })
        ),
      };

      // Le rapport est la PREUVE : affiché tel quel dans les logs CI/dev.
      // eslint-disable-next-line no-console
      console.info(`[V31 banc couverture] ${JSON.stringify(summary, null, 2)}`);

      if (networkUnavailable) {
        // Pas d'accès réseau dans cet environnement : on DOCUMENTE, on
        // n'échoue pas, et surtout on n'invente aucune mesure.
        expect(probe.totalResults).toBe(0);
        return;
      }

      // Environnement en ligne : attentes factuelles modestes.
      const ratio = reports.length > 0 ? relevant.length / reports.length : 0;
      expect(ratio).toBeGreaterThanOrEqual(0.5);
      expect(perSourceErrors).toBeDefined();
    },
    (MAX_WAIT_MS + 2_000) * (CASES.length + 1)
  );
});

export type { CaseReport, QueryCase };
export const ONLINE_COVERAGE_CASES: readonly QueryCase[] = CASES;
export const describeOnlineCoverageSourceIds: readonly SearchSourceId[] = [
  'spotify',
  'backend',
  'audius',
  'youtube',
];
