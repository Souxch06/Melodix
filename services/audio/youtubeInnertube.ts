/**
 * Client YouTube Music « innertube » — FALLBACK AUDIO de Melodix.
 *
 * Pourquoi cette approche (analyse requise AVANT intégration) :
 *
 * - LICENCE : aucun code tiers n'est copié. Ce module parle le protocole
 *   JSON public utilisé par l'application YouTube Music elle-même
 *   (endpoints `youtubei/v1`, clients WEB_REMIX / ANDROID_MUSIC), protocole
 *   que la communauté open source (InnerTune, MusicSeeker, NewPipe…)
 *   documente depuis des années. Pas de dépendance npm supplémentaire →
 *   pas de licence à embarquer.
 * - MAINTENANCE : protocole non « garanti » par Google — il peut changer ;
 *   le provider dégrade alors PROPREMENT (jamais de crash : le morceau est
 *   simplement marqué indisponible jusqu'à réadaptation). Versions client
 *   épinglées ici = un SEUL point d'ajustement.
 * - COMPATIBILITÉ RN/Expo/Android : 100 % TypeScript + fetch — aucune
 *   dépendance native. Stream lu par expo-av EXACTEMENT comme Audius : le
 *   player existant (pause, seek, background, écran verrouillé) reçoit un
 *   simple URI.
 * - PAS DE TÉLÉCHARGEMENT / STOCKAGE SERVEUR : l'URL signée retournée est
 *   jouée en streaming depuis l'appareil de l'utilisateur, jamais copiée
 *   vers le serveur Melodix (elle expire d'ailleurs ~6 h).
 *
 * Deux appels :
 *   1. recherche (music.youtube.com/v1/search, client WEB_REMIX) — morceaux ;
 *   2. lecteur (youtube.com/v1/player, client ANDROID_MUSIC) — URL audio.
 */

/** Versions épinglées — point UNIQUE d'ajustement si le protocole évolue. */
const WEB_REMIX = {
  clientName: 'WEB_REMIX',
  clientVersion: '1.20241127.01.00',
  hl: 'en',
  gl: 'US',
} as const;

const ANDROID_MUSIC = {
  clientName: 'ANDROID_MUSIC',
  clientVersion: '7.27.52',
  androidSdkVersion: 31,
  hl: 'en',
  gl: 'US',
} as const;

const SEARCH_URL =
  'https://music.youtube.com/youtubei/v1/search?prettyPrint=false';
const PLAYER_URL =
  'https://www.youtube.com/youtubei/v1/player?prettyPrint=false';
const REQUEST_TIMEOUT_MS = 12_000;

export type YouTubeSongCandidate = {
  videoId: string;
  title: string;
  artists: string[];
  durationSec: number | null;
};

/**
 * Pertinence éditoriale d'un résultat YouTube (0..1), exposée au moteur de
 * matching partagé.
 *
 * - 1.0 : chaîne « … - Topic » (piste publiée automatiquement par le
 *   distributeur) ou titre « Official Audio / Official Video » → le morceau
 *   lui-même, pas une réinterprétation ;
 * - 0.3 : supports qui contiennent PLUSIEURS morceaux ou du hors-sujet
 *   (compilation, mix, full album, playlist, medley, interview, reaction…) ;
 * - 0.6 : marqueur audio générique (audio, lyrics, visualizer) ;
 * - 0.5 : défaut neutre.
 *
 * Le moteur n'utilise cette valeur que pour DÉPARTAGER deux candidats de score
 * égal : elle ne peut jamais faire accepter un candidat qui échoue aux portes
 * titre/artiste/durée/variante.
 */
export const youtubeContentQuality = (candidate: {
  title: string;
  artists: string[];
}): number => {
  const title = candidate.title ?? '';
  const artists = (candidate.artists ?? []).join(' ');
  const haystack = `${title} ${artists}`;

  if (/(?:^|\s)-\s*topic\s*$/iu.test(artists)) {
    return 1;
  }

  if (
    /\bofficial\s+(?:audio|video|music\s+video|lyric\s+video|visuali[sz]er)\b/iu.test(
      title
    )
  ) {
    return 1;
  }

  if (
    /\b(?:compilation|mix|full\s+(?:album|video|ep|set|mixtape)|playlist|nonstop|medley|megamix|hours?|interview|behind\s+the\s+scenes|reaction|review|essay|documentary|live\s+at|concert|tour|karaoke\s+version|tribute|cover\s+by|top\s+\d+|best\s+of)\b/iu.test(
      haystack
    )
  ) {
    return 0.3;
  }

  if (/\b(?:audio|lyrics?|visuali[sz]er)\b/iu.test(title)) {
    return 0.6;
  }

  return 0.5;
};

// --- helpers JSON défensifs ---------------------------------------------------

type JsonValue =
  | string
  | number
  | boolean
  | null
  | JsonValue[]
  | { [key: string]: JsonValue };

type JsonRecord = { [key: string]: JsonValue };

const asRecord = (value: unknown): JsonRecord | null =>
  value && typeof value === 'object' && !Array.isArray(value)
    ? (value as JsonRecord)
    : null;

const asArray = (value: unknown): JsonValue[] =>
  Array.isArray(value) ? (value as JsonValue[]) : [];

const runsOf = (node: unknown): string[] =>
  // node = champ « text » ({ runs: [...] }) — défensif si absent.
  asArray(asRecord(node)?.runs).map((run) => {
    const text = asRecord(run)?.text;
    return typeof text === 'string' ? text : '';
  });

const textOfTextField = (node: unknown): string => {
  const runs = runsOf(asRecord(node)?.text);

  if (runs.length) {
    return runs.join('').trim();
  }

  // Certaines réponses exposent `text` comme chaîne directe plutôt que comme
  // `{ runs: [...] }` : tolérant, sinon tout le sous-titre était perdu.
  const direct = asRecord(node)?.text;

  return typeof direct === 'string' ? direct.trim() : '';
};

const parseEncarts = (text: string): string =>
  text.replace(/\s{2,}/g, ' ').trim();

/** « mm:ss » ou « h:mm:ss ». */
const CLOCK_RX = /^\d{1,2}:\d{2}(?::\d{2})?$/;

/** Comparaison de deux libellés indépendante de la casse et de la ponctuation. */
const looseEquals = (a: string, b: string): boolean => {
  const strip = (value: string) =>
    value
      .toLowerCase()
      .replace(/[’ʻ’＇]/g, "'")
      .replace(/[^a-z0-9]+/g, ' ')
      .trim();

  const left = strip(a);
  const right = strip(b);

  return left.length > 0 && left === right;
};

/** Parcours « value: runs » utile pour les cartilageurs dynamiques. */
const firstRunText = (node: unknown): string => {
  const runs = runsOf(asRecord(node)?.text);
  return (runs[0] ?? '').trim();
};

/** « mm:ss » ou « h:mm:ss » → secondes, null si illisible. */
export const parseClockText = (raw: string): number | null => {
  const parts = raw
    .trim()
    .split(':')
    .map((piece) => Number(piece));

  if (
    parts.length < 2 ||
    parts.length > 3 ||
    parts.some((part) => !Number.isFinite(part))
  ) {
    return null;
  }

  const [hours, minutes, seconds] =
    parts.length === 3
      ? [parts[0], parts[1], parts[2]]
      : [0, parts[0], parts[1]];
  return hours * 3600 + minutes * 60 + seconds;
};

const fetchJson = async (
  url: string,
  payload: unknown,
  timeoutMs = REQUEST_TIMEOUT_MS
): Promise<unknown> => {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), timeoutMs);

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
      signal: controller.signal,
    });

    if (!response.ok) {
      throw new Error(`innertube ${response.status}`);
    }

    return await response.json();
  } finally {
    clearTimeout(timeout);
  }
};

// --- recherche ----------------------------------------------------------------

const itemToCandidate = (item: unknown): YouTubeSongCandidate | null => {
  const renderer = asRecord(asRecord(item)?.musicResponsiveListItemRenderer);
  if (!renderer) {
    return null;
  }

  // Un résultat « morceau » navigue vers un watchEndpoint (videoId). Les
  // autres tuiles (albums, playlists, artistes) n'en ont pas → filtrées.
  const button = asRecord(
    asRecord(renderer.playNavigationButtonRenderer)?.buttonRenderer
  );
  const watchEndpoint = asRecord(
    asRecord(button?.navigationEndpoint)?.watchEndpoint
  );
  const videoId =
    typeof watchEndpoint?.videoId === 'string' ? watchEndpoint.videoId : null;
  if (!videoId) {
    return null;
  }

  const flex = asArray(renderer.flexColumns);
  const title = parseEncarts(
    firstRunText(asRecord(flex[0])?.musicResponsiveListItemFlexColumnRenderer)
  );
  if (!title) {
    return null;
  }

  // 2e colonne flexible : « Artiste • Album • … » (séparateurs « • »).
  // Certaines mises en page répètent d'abord le TITRE du morceau
  // (« Song • Artiste • Album • … ») : une pièce qui duplique le titre de la
  // ligne n'est pas un artiste et est écartée, sans quoi la porte artiste
  // rejetait systématiquement le bon résultat.
  const subtitle = textOfTextField(
    asRecord(flex[1])?.musicResponsiveListItemFlexColumnRenderer
  );
  const pieces = subtitle
    .split('•')
    .map((piece) => piece.trim())
    .filter(Boolean);

  const informativePieces = pieces.filter((piece) => !CLOCK_RX.test(piece));
  const artistPieces =
    informativePieces.length > 1 && looseEquals(informativePieces[0], title)
      ? informativePieces.slice(1)
      : informativePieces;
  const artists = artistPieces.length
    ? artistPieces[0]
        .split(/,\s*/)
        .map((name) => name.trim())
        .filter(Boolean)
    : [];

  // Durée : colonne figée dédiée, sinon dernière pièce « mm:ss ».
  const fixed = asArray(renderer.fixedColumns);
  const fixedText = fixed.length
    ? textOfTextField(
        asRecord(fixed[0])?.musicResponsiveListItemFixedColumnRenderer
      )
    : '';
  let durationSec = fixedText ? parseClockText(fixedText) : null;

  if (durationSec == null && pieces.length > 1) {
    durationSec = parseClockText(pieces[pieces.length - 1]);
  }

  return { videoId, title, artists, durationSec };
};

/** Recherche YouTube Music : chaîne telle que fournie (artiste + titre). */
export const searchYouTubeSongs = async (
  query: string,
  limit = 12
): Promise<YouTubeSongCandidate[]> => {
  const json = await fetchJson(SEARCH_URL, {
    context: { client: WEB_REMIX },
    query,
  });

  const root = asRecord(json);
  const contents = (root?.contents ?? null) as JsonValue;
  const collected: YouTubeSongCandidate[] = [];
  const seen = new Set<string>();

  // Les sections/onglets varient selon les versions du client : on collecte
  // TOUS les musicResponsiveListItemRenderer où qu'ils soient, plutôt que de
  // figer un chemin d'accès fragile.
  const visit = (node: JsonValue): void => {
    if (collected.length >= limit) {
      return;
    }

    const record = asRecord(node);
    if (record) {
      if (record.musicResponsiveListItemRenderer) {
        const candidate = itemToCandidate(node);
        if (candidate && !seen.has(candidate.videoId)) {
          seen.add(candidate.videoId);
          collected.push(candidate);
        }
        return;
      }
      for (const value of Object.values(record)) {
        visit(value as JsonValue);
      }
      return;
    }

    for (const value of asArray(node)) {
      visit(value);
    }
  };

  visit(contents);

  return collected;
};

// --- lecteur ------------------------------------------------------------------

/** URL de flux audio direct (expirante ~6 h) pour un videoId, sinon null. */
export const getYouTubeAudioStreamUrl = async (
  videoId: string
): Promise<string | null> => {
  const json = await fetchJson(PLAYER_URL, {
    context: { client: ANDROID_MUSIC },
    videoId,
  });

  return pickAudioStreamUrl(json);
};

type InnertubeFormat = {
  url?: string;
  mimeType?: string;
  bitrate?: number;
};

/** Meilleur flux AUDIO (audio/mp4 préféré, highest bitrate en ex æquo). */
export const pickAudioStreamUrl = (json: unknown): string | null => {
  const root = asRecord(json);
  const streaming = asRecord(root?.streamingData);

  if (!streaming) {
    // UNPLAYABLE / LOGIN_REQUIRED / évolution protocole → fallback propre.
    return null;
  }

  const formats = [
    ...asArray(streaming.adaptiveFormats),
    ...asArray(streaming.formats),
  ] as InnertubeFormat[];

  let best: { url: string; bitrate: number; pref: number } | null = null;

  for (const format of formats) {
    if (
      typeof format?.url !== 'string' ||
      typeof format?.mimeType !== 'string' ||
      !format.mimeType.startsWith('audio/')
    ) {
      continue;
    }

    const pref = format.mimeType.startsWith('audio/mp4') ? 2 : 1;
    const bitrate = typeof format.bitrate === 'number' ? format.bitrate : 0;

    if (
      !best ||
      pref > best.pref ||
      (pref === best.pref && bitrate > best.bitrate)
    ) {
      best = { url: format.url, bitrate, pref };
    }
  }

  return best?.url ?? null;
};
