import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  loadMatchCache,
  MATCH_CACHE_STORAGE_KEY,
  MATCH_CACHE_VERSION,
  persistMatchCache,
  writeMatchCacheEntry,
} from '../matchCache';
import type { MatchCache } from '../matchCache';
import { spotifyTrackSource } from '../../player';

// AsyncStorage est mocké globalement (jest.config moduleNameMapper).

jest.mock('expo-constants', () => ({}));

const entry = (overrides?: Partial<import('../matchCache').MatchCacheEntry>) => ({
  version: MATCH_CACHE_VERSION,
  matchedAt: Date.now(),
  matchId: 'aud-123',
  score: 80,
  ...overrides,
});

describe('match cache', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
  });

  it('loads valid entries and keeps the match decision', () => {
    const cache = loadMatchCache(
      JSON.stringify({ 'spotify:abc': entry({ matchId: 'aud-9' }) })
    );

    expect(cache['spotify:abc'].matchId).toBe('aud-9');
  });

  it('caches negative decisions too (id present, matchId null)', () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(cache, spotifyTrackSource('bad-one'), null, 0);

    expect(cache['spotify:bad-one']).toBeDefined();
    expect(cache['spotify:bad-one'].matchId).toBeNull();
  });

  it('drops stale entries when loading (TTL)', () => {
    const old = Date.now() - 40 * 24 * 60 * 60 * 1000; // 40 days ago

    const cache = loadMatchCache(
      JSON.stringify({
        'spotify:fresh': entry(),
        'spotify:stale': entry({ matchedAt: old }),
      })
    );

    expect(cache['spotify:fresh']).toBeDefined();
    expect(cache['spotify:stale']).toBeUndefined();
  });

  it('rejects unversioned/corrupted payloads instead of crashing', () => {
    expect(loadMatchCache('not-json')).toEqual({});
    expect(
      loadMatchCache(
        JSON.stringify({
          'spotify:abc': { matchId: 'x' }, // missing version/score/matchedAt
          'spotify:ok': entry(),
        })
      )['spotify:ok'].matchId
    ).toBe('aud-123');
  });

  it('persists and reloads through AsyncStorage round-trip', async () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(cache, spotifyTrackSource('one'), 'aud-one', 88);
    writeMatchCacheEntry(cache, spotifyTrackSource('two'), null, 0);

    await persistMatchCache(cache);

    const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
    const reloaded = loadMatchCache(raw ?? null);

    expect(reloaded['spotify:one'].matchId).toBe('aud-one');
    expect(reloaded['spotify:two'].matchId).toBeNull();
  });

  it('can be invalidated by overwriting with a null entry', () => {
    const cache: MatchCache = {};
    writeMatchCacheEntry(cache, spotifyTrackSource('gone'), 'aud-gone', 75);
    delete cache['spotify:gone'];
    writeMatchCacheEntry(cache, spotifyTrackSource('gone'), null, 0);

    expect(cache['spotify:gone'].matchId).toBeNull();
  });
});
