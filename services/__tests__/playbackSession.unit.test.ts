/**
 * Persistance de session (phase 2) — sanitize STRICT, zéro crash :
 *  1. round-trip propre (queue bornée, repeat/volume validés) ;
 *  2. version inconnue / index hors bornes / JSON cassé → null, JAMAIS throw ;
 *  3. morceau invalide filtré silencieusement ;
 *  4. file ramenée à 200 morceaux maximum ;
 *  5. clear = suppression pure.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  clearPlaybackSession,
  loadPlaybackSession,
  PLAYBACK_SESSION_MAX_QUEUE,
  PLAYBACK_SESSION_STORAGE_KEY,
  PLAYBACK_SESSION_VERSION,
  sanitizePlaybackSession,
  savePlaybackSession,
  windowQueueForSession,
} from '../playbackSession';
import type { PlaybackSession } from '../playbackSession';
import { spotifyTrackSource } from '../player';

const makeTrack = (id: string) => ({
  id,
  title: `Titre ${id}`,
  artists: ['Artiste'],
  album: null,
  albumId: null, // I-8 : champ restauré par sanitizeTrack (défaut null)
  durationMillis: null,
  imageURL: '',
  source: spotifyTrackSource(id),
});

it('ISRC présent est conservé et normalisé à la réhydratation', async () => {
  await savePlaybackSession(
    makeSession({
      queue: [{ ...makeTrack('isrc'), isrc: 'fr-abc-24-12345' }],
      index: 0,
    })
  );

  const loaded = await loadPlaybackSession();

  expect(loaded?.queue[0].isrc).toBe('FR-ABC-24-12345');
});

it('I-8 : albumId présent est restauré à la réhydratation (absent → null)', async () => {
  const withAlbum = { ...makeTrack('alb'), albumId: 'alb-1' };
  const withoutAlbum = makeTrack('nul');
  await savePlaybackSession(
    makeSession({ queue: [withAlbum, withoutAlbum], index: 0 })
  );

  const loaded = await loadPlaybackSession();

  expect(loaded?.queue[0].albumId).toBe('alb-1');
  expect(loaded?.queue[1].albumId).toBeNull();
});

const makeSession = (
  overrides?: Partial<PlaybackSession>
): PlaybackSession => ({
  version: PLAYBACK_SESSION_VERSION,
  savedAt: 1_700_000_000_000,
  queue: [makeTrack('a'), makeTrack('b')],
  index: 1,
  positionMillis: 65_000,
  shuffle: false,
  repeat: 'all',
  volume: 0.7,
  ...overrides,
});

describe('playbackSession — persistance stricte de la session', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    jest.restoreAllMocks();
  });

  it('round-trip : save puis load restitue exactement la session', async () => {
    await savePlaybackSession(makeSession());

    const loaded = await loadPlaybackSession();

    expect(loaded).toEqual(makeSession());
  });

  it('sanitize REJETTE les données corrompues : aucun crash, null', () => {
    expect(sanitizePlaybackSession(null)).toBeNull();
    expect(sanitizePlaybackSession('coucou')).toBeNull();
    expect(sanitizePlaybackSession({ version: 999 })).toBeNull(); // version inconnue
    expect(sanitizePlaybackSession({ ...makeSession(), index: 99 })).toBeNull(); // hors bornes
    expect(
      sanitizePlaybackSession({
        ...makeSession(),
        queue: [] as never[],
        index: 0,
      })
    ).toBeNull(); // queue vide = rien à reprendre
  });

  it('les champs NON VITaux corrompus tombent prudent sur leurs défauts', () => {
    const sanitized = sanitizePlaybackSession({
      ...makeSession(),
      repeat: 'mode-inconnu',
      volume: 'fort',
      positionMillis: -50,
    });

    // Repeat inconnu → off, volume → 1, position négative → 0 : jamais le
    // rejet de TOUTE la session pour un champ cosmétique.
    expect(sanitized?.repeat).toBe('off');
    expect(sanitized?.volume).toBe(1);
    expect(sanitized?.positionMillis).toBe(0);
  });

  it('un repeat inconnu ne perds jamais la session', () => {
    const sanitized = sanitizePlaybackSession({
      ...makeSession(),
      repeat: 'en-boucle',
    });

    expect(sanitized).not.toBeNull();
    expect(sanitized?.repeat).toBe('off');
  });

  it('load sur JSON cassé : null ET jamais d exception', async () => {
    await AsyncStorage.setItem(PLAYBACK_SESSION_STORAGE_KEY, '{cassé,json');

    await expect(loadPlaybackSession()).resolves.toBeNull();
  });

  it('les morceaux INVALIDES sont filtrés, les valides conservés', () => {
    const session = makeSession({
      queue: [
        makeTrack('ok'),
        { id: 'sans-titre' } as never,
        null as never,
        makeTrack('ok-aussi'),
      ],
      index: 1, // pointait « sans-titre » → rejeté (plus deux morceaux)
    });

    const sanitized = sanitizePlaybackSession(session);

    // index 1 = « ok-aussi » après filtrage — valide.
    expect(sanitized?.queue.map(({ id }) => id)).toEqual(['ok', 'ok-aussi']);
  });

  it('la file est raccourcie au maximum autorisé', () => {
    const hugeQueue = Array.from({ length: 500 }, (_, i) => makeTrack(`t${i}`));
    const sanitized = sanitizePlaybackSession(
      makeSession({ queue: hugeQueue, index: PLAYBACK_SESSION_MAX_QUEUE - 1 })
    );

    expect(sanitized?.queue).toHaveLength(PLAYBACK_SESSION_MAX_QUEUE);
    expect(sanitized?.index).toBe(PLAYBACK_SESSION_MAX_QUEUE - 1);
  });

  it('clear supprime la clé : load après clear → null', async () => {
    await savePlaybackSession(makeSession());
    await clearPlaybackSession();

    await expect(loadPlaybackSession()).resolves.toBeNull();
  });

  it('un save lent lancé avant clear ne ressuscite jamais la session', async () => {
    const originalSetItem = AsyncStorage.setItem.bind(AsyncStorage);
    let releaseSave!: () => void;
    const gate = new Promise<void>((resolve) => {
      releaseSave = resolve;
    });
    jest
      .spyOn(AsyncStorage, 'setItem')
      .mockImplementationOnce(async (key, value) => {
        await gate;
        await originalSetItem(key, value);
      });

    const pendingSave = savePlaybackSession(makeSession());
    await Promise.resolve();
    const pendingClear = clearPlaybackSession();
    releaseSave();
    await Promise.all([pendingSave, pendingClear]);

    await expect(loadPlaybackSession()).resolves.toBeNull();
  });

  it('load avec stockage EN PANNE : null présenté, aucune propagation', async () => {
    jest
      .spyOn(AsyncStorage, 'getItem')
      .mockRejectedValueOnce(new Error('busy'));

    await expect(loadPlaybackSession()).resolves.toBeNull();
  });

  it('save avec stockage EN PANNE : rejet toléré', async () => {
    jest
      .spyOn(AsyncStorage, 'setItem')
      .mockRejectedValueOnce(new Error('full'));

    await expect(savePlaybackSession(makeSession())).resolves.toBeUndefined();
  });
});

/**
 * I-1 — fenêtrage de persistance : une file > 200 n'invalide JAMAIS la
 * session. Le morceau courant reste dans la fenêtre et l'index persisté
 * pointe vers LUI (plus jamais « Reprendre » perdu silencieusement).
 */
describe('windowQueueForSession (I-1)', () => {
  const hugeQueue = (n: number) =>
    Array.from({ length: n }, (_, i) => makeTrack(`t${i}`));

  it('queue 500 / index 0 : fenêtre en tête (0→199), index conservé à 0', () => {
    const { queue, index } = windowQueueForSession(hugeQueue(500), 0);

    expect(queue).toHaveLength(PLAYBACK_SESSION_MAX_QUEUE);
    expect(queue[0].id).toBe('t0');
    expect(index).toBe(0);
    expect(queue[index].id).toBe('t0'); // morceau courant dans la fenêtre
  });

  it('queue 500 / index 100 : fenêtre en tête (0→199), index conservé à 100', () => {
    const { queue, index } = windowQueueForSession(hugeQueue(500), 100);

    expect(queue).toHaveLength(PLAYBACK_SESSION_MAX_QUEUE);
    expect(queue[0].id).toBe('t0');
    expect(index).toBe(100);
    expect(queue[index].id).toBe('t100');
  });

  it('queue 500 / index 250 : fenêtre centrée (150→349), index recalculé à 100', () => {
    const { queue, index } = windowQueueForSession(hugeQueue(500), 250);

    expect(queue).toHaveLength(PLAYBACK_SESSION_MAX_QUEUE);
    expect(queue[0].id).toBe('t150');
    expect(queue[queue.length - 1].id).toBe('t349');
    expect(index).toBe(100);
    expect(queue[index].id).toBe('t250');
  });

  it('queue 500 / index 499 : fenêtre glissée en queue (300→499), index 199', () => {
    const { queue, index } = windowQueueForSession(hugeQueue(500), 499);

    expect(queue).toHaveLength(PLAYBACK_SESSION_MAX_QUEUE);
    expect(queue[0].id).toBe('t300');
    expect(queue[queue.length - 1].id).toBe('t499');
    expect(index).toBe(PLAYBACK_SESSION_MAX_QUEUE - 1);
    expect(queue[index].id).toBe('t499');
  });

  it('queue < 200 : file RENVOYÉE TELLE QUELLE (même référence), index inchangé', () => {
    const small = hugeQueue(150);

    const { queue, index } = windowQueueForSession(small, 149);

    expect(queue).toBe(small); // aucune copie, aucun découpage
    expect(index).toBe(149);
  });

  it('queue exactement 200 : inchangée, index 199 valide', () => {
    const exact = hugeQueue(PLAYBACK_SESSION_MAX_QUEUE);

    const { queue, index } = windowQueueForSession(exact, 199);

    expect(queue).toBe(exact);
    expect(index).toBe(199);
  });

  it('TOUTE position : l index recalculé pointe TOUJOURS le même morceau', () => {
    const queue500 = hugeQueue(500);

    for (const i of [0, 1, 99, 100, 101, 250, 398, 399, 400, 499]) {
      const { queue, index } = windowQueueForSession(queue500, i);

      expect(queue[index].id).toBe(`t${i}`);
      expect(index).toBeGreaterThanOrEqual(0);
      expect(index).toBeLessThan(queue.length);
      // Et la session fenêtrée passe le sanitize strict (jamais rejetée).
      expect(
        sanitizePlaybackSession(makeSession({ queue, index }))
      ).not.toBeNull();
    }
  });
});
