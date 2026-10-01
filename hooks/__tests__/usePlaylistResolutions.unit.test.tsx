/**
 * I-2 — la résolution UI d'une playlist (badge de disponibilité) utilise
 * les MÊMES métadonnées que le chemin player : album + durée du TrackModel
 * quand la source les fournit, sinon null (jamais inventés).
 * Et sa décision est écrite dans LE cache partagé, sous la clé exacte que
 * le player relit (sourceKeyOf d'une source métadonnée) — zéro re-recherche.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';
import { renderHook, waitFor } from '@testing-library/react-native';

import { usePlaylistResolutions } from '../usePlaylistResolutions';
import {
  __testSetAudioProviders,
  MATCH_CACHE_STORAGE_KEY,
  matchSongs,
} from '../../services/audio';
import type { AudioProvider } from '../../services/audio';
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
});
