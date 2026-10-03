import assert from 'node:assert/strict';
import test from 'node:test';

import {
  ServiceGuard,
  getServiceGuard,
  __resetServiceGuards,
} from '../serviceGuard';

const fastGuard = (overrides = {}, now: () => number = Date.now) =>
  new ServiceGuard(
    {
      name: 'test',
      maxRequestsPerWindow: 3,
      windowMs: 60_000,
      failureThreshold: 2,
      failureWindowMs: 10_000,
      cooldownMs: 5,
      ...overrides,
    },
    now
  );

test('budget : bloque au-delà de la fenêtre', () => {
  const guard = fastGuard();
  assert.equal(guard.acquire(), true);
  assert.equal(guard.acquire(), true);
  assert.equal(guard.acquire(), true);
  assert.equal(guard.acquire(), false);
});

test('circuit : s ouvre après le seuil d échecs, bloque, puis half-open', () => {
  let now = 1_000;
  const guard = fastGuard({}, () => now);
  guard.acquire();
  guard.recordFailure();
  guard.recordFailure();

  assert.equal(guard.acquire(), false); // circuit ouvert
  assert.equal(guard.getStatus().circuitOpen, true);

  now += 6; // > cooldownMs(5), sans dépendre de la charge de la machine

  assert.equal(guard.acquire(), true); // sonde half-open
  guard.recordSuccess();
  assert.equal(guard.getStatus().failures, 0);
});

test('recordSuccess remet les échecs à zéro', () => {
  const guard = fastGuard();
  guard.acquire();
  guard.recordFailure();
  guard.recordSuccess();
  guard.recordFailure();
  // Un seul échec « actif » : le circuit reste fermé.
  assert.equal(guard.acquire(), true);
  assert.equal(guard.getStatus().circuitOpen, false);
});

test('les échecs hors fenêtre ne s accumulent pas', () => {
  let now = 1_000;
  const guard = fastGuard({ failureWindowMs: 5 }, () => now);
  guard.acquire();
  guard.recordFailure();
  now += 6;
  guard.recordFailure(); // hors fenêtre → compteur repart de 0
  assert.equal(guard.getStatus().circuitOpen, false);
});

test('registre : même nom = même instance, config conservée', () => {
  __resetServiceGuards();
  const a = getServiceGuard('unit-service', { maxRequestsPerWindow: 7 });
  const b = getServiceGuard('unit-service');
  assert.equal(a, b);
  assert.equal(b.getStatus().callsMax, 7);
  __resetServiceGuards();
});
