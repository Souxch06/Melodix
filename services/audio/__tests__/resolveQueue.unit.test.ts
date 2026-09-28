import { ResolveQueue, RESOLVE_QUEUE_CONCURRENCY } from '../resolveQueue';

/**
 * Performance (point 10) : jamais plus de `concurrency` tâches en vol, même
 * avec 100 tâches planifiées — la file garde le réseau et l'UI fluides.
 */

const delay = (ms: number) => new Promise<void>((r) => setTimeout(r, ms));

describe('ResolveQueue', () => {
  it('respecte la concurrence max (5 par défaut)', async () => {
    const queue = new ResolveQueue();
    let inFlight = 0;
    let maxInFlight = 0;

    const tasks = Array.from({ length: 40 }, () =>
      queue.run(async () => {
        inFlight += 1;
        maxInFlight = Math.max(maxInFlight, inFlight);
        await delay(5 + Math.random() * 10);
        inFlight -= 1;
      })
    );

    await Promise.all(tasks);

    expect(maxInFlight).toBeLessThanOrEqual(RESOLVE_QUEUE_CONCURRENCY);
    expect(queue.inFlightCount).toBe(0);
  });

  it('honore une concurrence personnalisée (2 sur 30 tâches)', async () => {
    const queue = new ResolveQueue(2);
    let inFlight = 0;
    let maxInFlight = 0;

    await Promise.all(
      Array.from({ length: 30 }, () =>
        queue.run(async () => {
          inFlight += 1;
          maxInFlight = Math.max(maxInFlight, inFlight);
          await delay(4);
          inFlight -= 1;
        })
      )
    );

    expect(maxInFlight).toBeLessThanOrEqual(2);
  });

  it('exécute TOUTES les tâches (rien ne se perd, ordre indifférent)', async () => {
    const queue = new ResolveQueue(5);
    const done = new Set<number>();

    await Promise.all(
      Array.from({ length: 25 }, (_, i) =>
        queue.run(async () => {
          await delay(2);
          done.add(i);
        })
      )
    );

    expect(done.size).toBe(25);
  });

  it('un rejet ne bloque pas la file des suivants', async () => {
    const queue = new ResolveQueue(2);
    const succeeded: number[] = [];

    const results = await Promise.allSettled([
      queue.run(async () => {
        throw new Error('network down');
      }),
      queue.run(async () => {
        await delay(3);
        succeeded.push(1);
      }),
      queue.run(async () => {
        // 3e tâche : démarre seulement quand un slot se libère (dont la
        // libération par le REJET — le point testé).
        await delay(3);
        succeeded.push(2);
      }),
    ]);

    expect(results[0].status).toBe('rejected');
    expect((results[0] as PromiseRejectedResult).reason?.message).toBe(
      'network down'
    );
    expect(succeeded.sort()).toEqual([1, 2]);
    expect(queue.inFlightCount).toBe(0);
    expect(queue.waitingCount).toBe(0);
  });
});
