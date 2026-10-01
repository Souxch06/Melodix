import assert from 'node:assert/strict';
import test from 'node:test';

import { TtlCache } from '../ttlCache';

test('get/set basique', () => {
  const cache = new TtlCache();
  cache.set('a', { x: 1 }, 60);
  assert.deepEqual(cache.get('a'), { x: 1 });
  assert.equal(cache.get('missing'), undefined);
});

test('expiration : une entrée périmée est supprimée au get', (t) => {
  const cache = new TtlCache();
  const now = Date.now();
  const restoreNow = Date.now;
  let frozenNow = now;
  Date.now = (() => frozenNow) as typeof Date.now; // injection horloge pour le test

  t.after(() => {
    Date.now = restoreNow;
  });

  cache.set('k', 'v', 10);
  assert.equal(cache.get('k'), 'v');

  frozenNow = now + 10_001;
  assert.equal(cache.get('k'), undefined);
  assert.equal(cache.size(), 0);
});

test('delete et clear', () => {
  const cache = new TtlCache();
  cache.set('a', 1, 60);
  cache.set('b', 2, 60);
  cache.delete('a');
  assert.equal(cache.get('a'), undefined);
  assert.equal(cache.get('b'), 2);
  cache.clear();
  assert.equal(cache.size(), 0);
});

test('set écrase la valeur et prolonge le TTL', (t) => {
  const cache = new TtlCache();
  const restoreNow = Date.now;
  const now = restoreNow();
  let frozenNow = now;
  Date.now = (() => frozenNow) as typeof Date.now; // injection horloge
  t.after(() => {
    Date.now = restoreNow;
  });

  cache.set('k', 'old', 10);
  frozenNow = now + 9_000;
  cache.set('k', 'new', 10);
  frozenNow = now + 10_500;
  assert.equal(cache.get('k'), 'new');
});
