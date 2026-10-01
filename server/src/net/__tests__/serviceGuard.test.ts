import assert from 'node:assert/strict';
import test from 'node:test';

import {
  ServiceGuard,
  getServiceGuard,
  __resetServiceGuards,
} from '../serviceGuard';

const fastGuard = (overrides = {}) =>
  new ServiceGuard({
    name: 'test',
    maxRequestsPerWindow: 3,
    windowMs: 60_000,
    failureThreshold: 2,
    failureWindowMs: 10_000,
    cooldownMs: 5,
    ...overrides,
  });

test('budget : bloque au-delà de la fenêtre', () => {
  const guard = fastGuard();
  assert.equal(guard.acquire(), true);
  assert.equal(guard.acquire(), true);
  assert.equal(guard.acquire(), true);
  assert.equal(guard.acquire(), false);
});

test('circuit : s ouvre après le seuil d échecs, bloque, puis half-open', async () => {
  const guard = fastGuard();
  guard.acquire();
  guard.recordFailure();
  guard.recordFailure();

  assert.equal(guard.acquire(), false); // circuit ouvert
  assert.equal(guard.getStatus().circuitOpen, true);

  await new Promise((r) => setTimeout(r, 10)); // > cooldownMs(5)

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

test('les échecs hors fenêtre ne s accumulent pas', async () => {
  const guard = fastGuard({ failureWindowMs: 5 });
  guard.acquire();
  guard.recordFailure();
  await new Promise((r) => setTimeout(r, 10));
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
