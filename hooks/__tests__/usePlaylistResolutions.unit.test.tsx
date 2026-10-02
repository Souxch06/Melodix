/**
 * I-2 — la résolution UI d'une playlist (badge de disponibilité) utilise
 * les MÊMES métadonnées que le chemin player : album + durée du TrackModel
 * quand la source les fournit, sinon null (jamais inventés).
 * Et sa décision est écrite dans LE cache partagé, sous la clé exacte que
 * le player relit (sourceKeyOf d'une source métadonnée) — zéro re-recherche.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';
import { act, renderHook, waitFor } from '@testing-library/react-native';

import { usePlaylistResolutions } from '../usePlaylistResolutions';
import {
  __testSetAudioProviders,
  MATCH_CACHE_STORAGE_KEY,
  matchSongs,
  persistMatchCache,
  writeMatchCacheEntry,
} from '../../services/audio';
import type { AudioProvider, MatchCache } from '../../services/audio';
import { fingerprintOf } from '../../services/audio/audiusTrackMatcher';
import type { SongMatchCandidate } from '../../services/audio/audiusTrackMatcher';
import type { TrackModel } from '../../models';

const track = (overrides: Partial<TrackModel> = {}): TrackModel => ({
  id: 't1',
  title: 'Song',
  subtitle: 'Artist',
  ...overrides,
});

/** Provider à comportement figé (contrôle total de la décision). */
const constProvider = (
  resolveMatch: AudioProvider['resolveMatch']
): AudioProvider => ({
  id: 'audius',
  displayName: 'Audius',
  matches: async () => [],
  resolveMatch,
  resolveSource: async (sourceId: string) => ({
    uri: `https://stream/${sourceId}`,
  }),
});

/** Provider ADOSSÉ au vrai matcher partagé : la décision dépend alors
 * réellement des métadonnées transmises (durée / album). */
const matcherBackedProvider = (
  candidates: SongMatchCandidate[]
): AudioProvider =>
  constProvider(async (query) => {
    const source = fingerprintOf({
      title: query.title,
      artistNames: query.artists,
      album: query.album,
      durationSec:
        typeof query.durationMillis === 'number' &&
        Number.isFinite(query.durationMillis)
          ? query.durationMillis / 1000
          : null,
    });
    const best = matchSongs(source, candidates);
    return best
      ? { sourceId: best.id, score: Math.min(1, best.score / 100) }
      : null;
  });

const readStoredCache = async () => {
  const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
  return raw ? (JSON.parse(raw) as Record<string, unknown>) : null;
};

describe('usePlaylistResolutions (I-2)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
  });

  it('transmet album + durée réels du TrackModel à la cascade', async () => {
    const resolveMatch: AudioProvider['resolveMatch'] = jest.fn(async () => ({
      sourceId: 'aud-1',
      score: 0.9,
    }));
    __testSetAudioProviders({ audius: constProvider(resolveMatch) });

    renderHook(() =>
      usePlaylistResolutions([
        track({ durationMs: 200_000, albumName: 'Album X' }),
      ])
    );

    await waitFor(() => expect(resolveMatch).toHaveBeenCalledTimes(1));
    expect(resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({
        title: 'Song',
        artists: ['Artist'],
        album: 'Album X',
        durationMillis: 200_000,
      })
    );
  });

  it('TrackModel sans album/durée : null transmis (matching toujours possible)', async () => {
    const resolveMatch: AudioProvider['resolveMatch'] = jest.fn(
      async () => null
    );
    __testSetAudioProviders({ audius: constProvider(resolveMatch) });

    renderHook(() => usePlaylistResolutions([track()]));

    await waitFor(() => expect(resolveMatch).toHaveBeenCalledTimes(1));
    expect(resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({ album: null, durationMillis: null })
    );
  });

  it('titre/artiste identiques, candidats de durées différentes : la DURÉE transmise départage le bon', async () => {
    // Le MAUVAIS candidat est placé en premier : sans la durée transmise,
    // les deux scoreraient à égalité et le premier gagnerait.
    __testSetAudioProviders({
      audius: matcherBackedProvider([
        {
          id: 'aud-short',
          title: 'Song',
          artistNames: ['Artist'],
          durationSec: 60,
        },
        {
          id: 'aud-right',
          title: 'Song',
          artistNames: ['Artist'],
          durationSec: 200,
        },
      ]),
    });

    const { result } = renderHook(() =>
      usePlaylistResolutions([track({ durationMs: 200_000 })])
    );

    await waitFor(() =>
      expect(result.current.byTrackId.t1).toEqual({
        status: 'resolved',
        providerId: 'audius',
      })
    );

    await waitFor(
      async () => {
        const cache = await readStoredCache();
        expect(cache?.['spotify:t1']).toMatchObject({ matchId: 'aud-right' });
      },
      { timeout: 6000 }
    );
  });

  it('candidats identiques en titre/durée : l ALBUM transmis départage le bon', async () => {
    __testSetAudioProviders({
      audius: matcherBackedProvider([
        {
          id: 'aud-album-b',
          title: 'Song',
          artistNames: ['Artist'],
          album: 'Album Two',
          durationSec: 200,
        },
        {
          id: 'aud-album-a',
          title: 'Song',
          artistNames: ['Artist'],
          album: 'Album One',
          durationSec: 200,
        },
      ]),
    });

    const { result } = renderHook(() =>
      usePlaylistResolutions([
        track({ durationMs: 200_000, albumName: 'Album One' }),
      ])
    );

    await waitFor(() =>
      expect(result.current.byTrackId.t1?.status).toBe('resolved')
    );

    await waitFor(
      async () => {
        const cache = await readStoredCache();
        expect(cache?.['spotify:t1']).toMatchObject({ matchId: 'aud-album-a' });
      },
      { timeout: 6000 }
    );
  });

  it('la décision UI est écrite sous la clé du PLAYER puis relue sans nouvelle recherche', async () => {
    __testSetAudioProviders({
      audius: constProvider(async () => ({
        sourceId: 'aud-shared',
        score: 0.8,
      })),
    });

    const first = renderHook(() => usePlaylistResolutions([track()]));
    await waitFor(() =>
      expect(first.result.current.byTrackId.t1?.status).toBe('resolved')
    );

    // Écriture groupée (flush ~1,5 s) : la clé est EXACTEMENT celle que le
    // player relit pour une source métadonnée (sourceKeyOf → spotify:<id>).
    await waitFor(
      async () => {
        const cache = await readStoredCache();
        expect(cache?.['spotify:t1']).toMatchObject({
          providerId: 'audius',
          matchId: 'aud-shared',
          score: 80,
        });
      },
      { timeout: 6000 }
    );
    first.unmount();

    // Remontage : la décision est relue du cache partagé — AUCUNE recherche.
    const resolveAgain: AudioProvider['resolveMatch'] = jest.fn(async () => ({
      sourceId: 'aud-autre',
      score: 1,
    }));
    __testSetAudioProviders({ audius: constProvider(resolveAgain) });

    const second = renderHook(() => usePlaylistResolutions([track()]));
    await waitFor(() =>
      expect(second.result.current.byTrackId.t1).toEqual({
        status: 'resolved',
        providerId: 'audius',
      })
    );
    expect(resolveAgain).not.toHaveBeenCalled();
    second.unmount();
  });

  it('I-5 : provider EN PANNE → reste retentable, jamais affiché « indisponible »', async () => {
    __testSetAudioProviders({
      audius: constProvider(async () => {
        throw new Error('timeout réseau');
      }),
    });

    const first = renderHook(() => usePlaylistResolutions([track()]));
    await waitFor(() =>
      expect(first.result.current.byTrackId.t1?.status).toBe('pending')
    );
    expect(first.result.current.stats.decided).toBe(0);

    // Même après le flush d'écriture groupée : AUCUNE entrée pour t1.
    await new Promise((resolve) => setTimeout(resolve, 2_000));
    const stored = await readStoredCache();
    expect(stored?.['spotify:t1']).toBeUndefined();
    first.unmount();

    // La panne réparée, la décision est recherchée pour de vrai (pas un
    // « indisponible » figé 30 jours).
    const resolveMatch: AudioProvider['resolveMatch'] = jest.fn(async () => ({
      sourceId: 'aud-found',
      score: 0.9,
    }));
    __testSetAudioProviders({ audius: constProvider(resolveMatch) });

    const second = renderHook(() => usePlaylistResolutions([track()]));
    await waitFor(() =>
      expect(second.result.current.byTrackId.t1).toEqual({
        status: 'resolved',
        providerId: 'audius',
      })
    );
    expect(resolveMatch).toHaveBeenCalledTimes(1);
    second.unmount();
  });

  it('I-5 : no-match PROUVÉ → négatif durable autorisé (jamais de recherche refaite)', async () => {
    __testSetAudioProviders({
      audius: constProvider(async () => null), // catalogue interrogé, rien.
    });

    const first = renderHook(() => usePlaylistResolutions([track()]));
    await waitFor(() =>
      expect(first.result.current.byTrackId.t1?.status).toBe('none')
    );

    await waitFor(
      async () => {
        const cache = await readStoredCache();
        expect(cache?.['spotify:t1']).toMatchObject({
          providerId: null,
          matchId: null,
        });
      },
      { timeout: 6000 }
    );
    first.unmount();
  });
});

/**
 * I-3 — « Refaire le matching » : invalidation CIBLÉE par clé. La purge
 * globale d'avant détruisait les décisions des autres playlists, des
 * favoris et de l'historique partageant LE MÊME cache.
 */
describe('usePlaylistResolutions — refresh ciblé (I-3)', () => {
  /** Écrit des décisions de matching pré-existantes dans LE cache partagé. */
  const seedCache = async (entries: Record<string, string>): Promise<void> => {
    const cache: MatchCache = {};
    for (const [trackId, matchId] of Object.entries(entries)) {
      writeMatchCacheEntry(
        cache,
        { provider: null, id: trackId },
        'audius',
        matchId,
        80
      );
    }
    await persistMatchCache(cache);
  };

  beforeEach(async () => {
    await AsyncStorage.clear();
  });

  it('refresh A : A invalidée — playlist B et entrée sans rapport INTACTES', async () => {
    // 1. cache playlist A (a1, a2) — 2. cache playlist B (b1) + sans rapport (z9)
    await seedCache({ a1: 'm-a1', a2: 'm-a2', b1: 'm-b1', z9: 'm-z9' });

    const resolveMatch: AudioProvider['resolveMatch'] = jest.fn(async () => ({
      sourceId: 'm-new',
      score: 0.7,
    }));
    __testSetAudioProviders({ audius: constProvider(resolveMatch) });

    const { result } = renderHook(() =>
      usePlaylistResolutions([track({ id: 'a1' }), track({ id: 'a2' })])
    );

    // Décisions relues du cache partagé : AUCUNE recherche initiale.
    await waitFor(() =>
      expect(result.current.byTrackId.a1?.status).toBe('resolved')
    );
    expect(resolveMatch).not.toHaveBeenCalled();

    // 3. refresh playlist A (promesse réelle : le retrait est déjà persisté).
    await act(async () => {
      await (result.current.refresh as unknown as () => Promise<void>)();
    });

    // 4. A est invalidée — 5. B reste intacte — 6. sans rapport intact.
    const cache = await readStoredCache();
    expect(cache?.['spotify:a1']).toBeUndefined();
    expect(cache?.['spotify:a2']).toBeUndefined();
    expect(cache?.['spotify:b1']).toMatchObject({ matchId: 'm-b1' });
    expect(cache?.['spotify:z9']).toMatchObject({ matchId: 'm-z9' });

    // Et la file de CETTE liste est relancée (re-résolution d'a1 et a2).
    await waitFor(() => expect(resolveMatch).toHaveBeenCalledTimes(2));
  });

  it('morceau PARTAGÉ A∩B : refresh A invalide sa clé (cache par morceau), le reste de B intact', async () => {
    await seedCache({ s1: 'm-s1', a1: 'm-a1', b2: 'm-b2' });

    __testSetAudioProviders({
      audius: constProvider(jest.fn(async () => null)),
    });

    // Playlist A = { s1 (partagé avec B), a1 } ; B possède aussi s1, et b2.
    const { result } = renderHook(() =>
      usePlaylistResolutions([track({ id: 's1' }), track({ id: 'a1' })])
    );
    await waitFor(() =>
      expect(result.current.byTrackId.s1?.status).toBe('resolved')
    );

    await act(async () => {
      await (result.current.refresh as unknown as () => Promise<void>)();
    });

    const cache = await readStoredCache();
    // Le cache étant PAR MORCEAU, « refaire le matching » de s1 (dans A)
    // retire sa clé — B le verra comme « à refaire » : comportement cohérent.
    expect(cache?.['spotify:s1']).toBeUndefined();
    expect(cache?.['spotify:a1']).toBeUndefined();
    // Mais les morceaux propres à B n'ont RIEN perdu.
    expect(cache?.['spotify:b2']).toMatchObject({ matchId: 'm-b2' });
  });
});

describe('usePlaylistResolutions — durée de vie des timers (perf)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
  });

  it('démontage avec file NON vide : TOUS les intervals de l effet meurent (zéro timer orphelin)', async () => {
    // t1 : décision rapide ; t2 : résolution JAMAIS finie → la file reste
    // non vide, le watcher auto-nettoyant ne passe JAMAIS : sans cleanup de
    // l effet, flush+watch cochaient indéfiniment dans un composant mort.
    const originalSetInterval = global.setInterval;
    const originalClearInterval = global.clearInterval;
    const setIntervalSpy = jest
      .spyOn(global, 'setInterval')
      .mockImplementation(((handler: unknown, timeout?: unknown) =>
        originalSetInterval(
          handler as (...args: unknown[]) => void,
          timeout as number
        )) as typeof setInterval);
    const clearIntervalSpy = jest
      .spyOn(global, 'clearInterval')
      .mockImplementation(((handle: unknown) =>
        originalClearInterval(
          handle as Parameters<typeof originalClearInterval>[0]
        )) as typeof clearInterval);

    try {
      __testSetAudioProviders({
        audius: constProvider(
          jest.fn(async (query) => {
            if (query.title.includes('Fast')) {
              return { sourceId: 'm-fast', score: 0.9 };
            }
            return new Promise(() => undefined); // jamais résolu
          })
        ),
      });

      const { unmount } = renderHook(() =>
        usePlaylistResolutions([
          track({ id: 'fast1', title: 'Fast Song' }),
          track({ id: 'slow1', title: 'Never Resolving Song' }),
        ])
      );

      // Laisser t1 se résoudre et les deux intervals s armer.
      await act(async () => {
        await new Promise((resolve) => setTimeout(resolve, 200));
      });

      // Les deux intervals du hook existent (la file n est pas vide pour t2).
      expect(setIntervalSpy.mock.results.length).toBeGreaterThanOrEqual(2);

      unmount();

      // APRÈS le démontage, chaque interval créé a été nettoyé EXACTEMENT.
      // (RNTL en crée d autres pour waitFor : on ne vérifie que ceux du
      // hook = les handles retournés par nôtre espion de setInterval.)
      const handles = setIntervalSpy.mock.results
        .map((result) => result.value)
        .filter((value) => value !== undefined);
      for (const handle of handles) {
        expect(clearIntervalSpy.mock.calls.flat()).toContain(handle);
      }
    } finally {
      setIntervalSpy.mockRestore();
      clearIntervalSpy.mockRestore();
    }
  }, 10_000);
});
