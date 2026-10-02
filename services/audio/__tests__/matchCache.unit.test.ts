import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  clearMatchCacheStorage,
  deleteMatchCacheEntryFromStorage,
  loadMatchCache,
  MATCH_CACHE_STORAGE_KEY,
  MATCH_CACHE_VERSION,
  persistMatchCache,
  removeMatchCacheEntry,
  writeMatchCacheEntry,
} from '../matchCache';
import type { MatchCache } from '../matchCache';
import { spotifyTrackSource } from '../../player';

// AsyncStorage est mocké globalement (jest.config moduleNameMapper).

jest.mock('expo-constants', () => ({}));

const entry = (
  overrides?: Partial<import('../matchCache').MatchCacheEntry>
) => ({
  version: MATCH_CACHE_VERSION,
  matchedAt: Date.now(),
  providerId: 'audius',
  matchId: 'aud-123',
  score: 80,
  ...overrides,
});

describe('match cache (v2 — provider mémorisé)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
  });

  it('loads valid entries and keeps the provider + match decision', () => {
    const cache = loadMatchCache(
      JSON.stringify({
        'spotify:a': entry({ providerId: 'audius', matchId: 'aud-9' }),
        'spotify:y': entry({ providerId: 'youtube', matchId: 'yt-7' }),
      })
    );

    expect(cache['spotify:a'].providerId).toBe('audius');
    expect(cache['spotify:y'].providerId).toBe('youtube');
  });

  it('caches negative decisions too (providerId/matchId null, jamais refaits)', () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(cache, spotifyTrackSource('bad-one'), null, null, 0);

    expect(cache['spotify:bad-one']).toBeDefined();
    expect(cache['spotify:bad-one'].matchId).toBeNull();
    expect(cache['spotify:bad-one'].providerId).toBeNull();
  });

  it('migrates legacy v1 entries to Audius (pas de recherche refaite)', () => {
    const raw = JSON.stringify({
      'spotify:legacy': {
        version: 1,
        matchedAt: Date.now(),
        matchId: 'aud-old',
        score: 70,
      },
      'spotify:legacy-neg': {
        version: 1,
        matchedAt: Date.now(),
        matchId: null,
        score: 0,
      },
    });

    const cache = loadMatchCache(raw);

    expect(cache['spotify:legacy'].providerId).toBe('audius');
    expect(cache['spotify:legacy'].matchId).toBe('aud-old');
    expect(cache['spotify:legacy'].version).toBe(MATCH_CACHE_VERSION);
    expect(cache['spotify:legacy-neg'].providerId).toBeNull();
  });

  it('expire rapidement les négatifs mais conserve les matchs positifs fiables', () => {
    const fortyDaysAgo = Date.now() - 40 * 24 * 60 * 60 * 1000;
    const twoDaysAgo = Date.now() - 2 * 24 * 60 * 60 * 1000;

    const cache = loadMatchCache(
      JSON.stringify({
        'spotify:fresh': entry(),
        'spotify:positive-two-days': entry({ matchedAt: twoDaysAgo }),
        'spotify:negative-two-days': entry({
          matchedAt: twoDaysAgo,
          providerId: null,
          matchId: null,
          score: 0,
        }),
        'spotify:stale': entry({ matchedAt: fortyDaysAgo }),
      })
    );

    expect(cache['spotify:fresh']).toBeDefined();
    expect(cache['spotify:positive-two-days']).toBeDefined();
    expect(cache['spotify:negative-two-days']).toBeUndefined();
    expect(cache['spotify:stale']).toBeUndefined();
  });

  it('rejects unversioned/corrupted payloads instead of crashing', () => {
    expect(loadMatchCache('not-json')).toEqual({});
    expect(
      loadMatchCache(
        JSON.stringify({
          'spotify:abc': { matchId: 'x' }, // champs manquants
          'spotify:ok': entry(),
        })
      )['spotify:ok'].matchId
    ).toBe('aud-123');
  });

  it('persists and reloads through AsyncStorage round-trip (provider compris)', async () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(
      cache,
      spotifyTrackSource('one'),
      'audius',
      'aud-one',
      88
    );
    writeMatchCacheEntry(
      cache,
      spotifyTrackSource('two'),
      'youtube',
      'yt-two',
      66
    );
    writeMatchCacheEntry(cache, spotifyTrackSource('three'), null, null, 0);

    await persistMatchCache(cache);

    const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
    const reloaded = loadMatchCache(raw ?? null);

    expect(reloaded['spotify:one'].matchId).toBe('aud-one');
    expect(reloaded['spotify:one'].providerId).toBe('audius');
    expect(reloaded['spotify:two'].providerId).toBe('youtube');
    expect(reloaded['spotify:three'].matchId).toBeNull();
  });

  it('removeMatchCacheEntry : « refaire le matching » pour UNE piste', () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(
      cache,
      spotifyTrackSource('gone'),
      'youtube',
      'yt-gone',
      75
    );
    removeMatchCacheEntry(cache, 'spotify:gone');

    expect(cache['spotify:gone']).toBeUndefined();
  });

  it('clearMatchCacheStorage : purge persistante complète', async () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(cache, spotifyTrackSource('x'), 'audius', 'aud-x', 90);
    await persistMatchCache(cache);
    expect(await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY)).not.toBeNull();

    await clearMatchCacheStorage();
    expect(await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY)).toBeNull();
  });

  it('can be invalidated by overwriting with a null entry', () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(
      cache,
      spotifyTrackSource('gone'),
      'audius',
      'aud-gone',
      75
    );
    delete cache['spotify:gone'];
    writeMatchCacheEntry(cache, spotifyTrackSource('gone'), null, null, 0);

    expect(cache['spotify:gone'].matchId).toBeNull();
    expect(cache['spotify:gone'].providerId).toBeNull();
  });
});

describe('persistMatchCache par fusion + deleteMatchCacheEntryFromStorage', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
  });

  it('persistMatchCache FUSIONNE : les clés d un autre écrivain ne sont jamais perdues', async () => {
    // Écrivain 1 : décide « k1 » (le player, par exemple).
    await persistMatchCache({ 'spotify:k1': entry() });

    // Écrivain 2 : tient une carte chargée AVANT et ne connaît que « k2 ».
    await persistMatchCache({ 'spotify:k2': entry({ matchId: 'aud-999' }) });

    const cache = loadMatchCache(
      await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY)
    );
    // Avant (écrasement complet) : k1 était perdue silencieusement.
    expect(cache['spotify:k1']).toMatchObject({ matchId: 'aud-123' });
    expect(cache['spotify:k2']).toMatchObject({ matchId: 'aud-999' });
  });

  it('persistMatchCache : l entrée reçue GAGNE sur la valeur stockée', async () => {
    await persistMatchCache({ 'spotify:k1': entry({ matchId: 'old' }) });
    await persistMatchCache({
      'spotify:k1': entry({ matchId: 'new', matchedAt: Date.now() + 1 }),
    });

    const cache = loadMatchCache(
      await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY)
    );
    expect(cache['spotify:k1']).toMatchObject({ matchId: 'new' });
  });

  it('deleteMatchCacheEntryFromStorage ne supprime QUE la clé visée (transaction sans fusion)', async () => {
    await persistMatchCache({
      'spotify:a1': entry({ matchId: 'm-a1' }),
      'spotify:b1': entry({ matchId: 'm-b1' }),
      'spotify:z9': entry({ matchId: 'm-z9' }),
    });

    await deleteMatchCacheEntryFromStorage('spotify:a1');

    const cache = loadMatchCache(
      await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY)
    );
    expect(cache['spotify:a1']).toBeUndefined();
    // Les autres entrées sont INTACTES — jamais ajoutées, jamais perdues.
    expect(cache['spotify:b1']).toMatchObject({ matchId: 'm-b1' });
    expect(cache['spotify:z9']).toMatchObject({ matchId: 'm-z9' });
  });

  it('deleteMatchCacheEntryFromStorage : no-op silencieux si clé absente ou document corrompu', async () => {
    // Clé absente : pas de réécriture, pas d erreur.
    await deleteMatchCacheEntryFromStorage('spotify:missing');
    expect(await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY)).toBeNull();

    // Document corrompu : aucun crash (loadMatchCache traite l illisible
    // comme vide ailleurs).
    await AsyncStorage.setItem(MATCH_CACHE_STORAGE_KEY, '{not json');
    await expect(
      deleteMatchCacheEntryFromStorage('spotify:a1')
    ).resolves.toBeUndefined();
  });
});
