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
} from '../playbackSession';
import type { PlaybackSession } from '../playbackSession';
import { spotifyTrackSource } from '../player';

const makeTrack = (id: string) => ({
  id,
  title: `Titre ${id}`,
  artists: ['Artiste'],
  album: null,
  durationMillis: null,
  imageURL: '',
  source: spotifyTrackSource(id),
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
