/**
 * File d'attente de résolution — PERFORMANCE (point 10).
 *
 * Jamais plus de `concurrency` recherches en vol (défaut 5) : une playlist
 * de 300 morceaux apparaît immédiatement avec ses données Spotify, puis ses
 * états de disponibilité se remplissent progressivement (15/100 → 75/100 →
 * 100/100 résolus), sans saturer le réseau ni la boucle d'événements.
 */

export const RESOLVE_QUEUE_CONCURRENCY = 5;

export class ResolveQueue {
  private readonly concurrency: number;
  private inFlight = 0;
  private readonly waiting: (() => void)[] = [];

  constructor(concurrency = RESOLVE_QUEUE_CONCURRENCY) {
    this.concurrency = Math.max(1, concurrency);
  }

  /** In-flight count (observabilité + tests). */
  get inFlightCount(): number {
    return this.inFlight;
  }

  get waitingCount(): number {
    return this.waiting.length;
  }

  /** Exécute `task` dès qu'un slot est libre ; réponse = retour de la tâche. */
  run = <TOut>(task: () => Promise<TOut>): Promise<TOut> => {
    const execute = async (): Promise<TOut> => {
      this.inFlight += 1;
      try {
        return await task();
      } finally {
        this.inFlight -= 1;
        const release = this.waiting.shift();
        release?.(); // débloque le prochain en attente
      }
    };

    if (this.inFlight < this.concurrency) {
      return execute();
    }

    return new Promise<TOut>((resolve, reject) => {
      this.waiting.push(() => {
        execute().then(resolve, reject);
      });
    });
  };
}
