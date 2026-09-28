/**
 * Cache TTL en mémoire, purge opportuniste (aucun timer : pas de fuite, et
 * la logique reste testable). Une instance par domaine (recherche,
 * métadonnées, tokens, matches).
 */

type CacheEntry<T> = {
  value: T;
  expiresAt: number;
};

const CLEANUP_INTERVAL_MS = 5 * 60 * 1000;

export class TtlCache {
  private readonly store = new Map<string, CacheEntry<unknown>>();
  private lastCleanup = 0;

  private cleanup(now: number): void {
    for (const [key, entry] of this.store.entries()) {
      if (entry.expiresAt <= now) {
        this.store.delete(key);
      }
    }
  }

  set<T>(key: string, value: T, ttlSeconds: number): void {
    const now = Date.now();
    if (now - this.lastCleanup >= CLEANUP_INTERVAL_MS) {
      this.lastCleanup = now;
      this.cleanup(now);
    }
    this.store.set(key, { value, expiresAt: now + ttlSeconds * 1000 });
  }

  get<T>(key: string): T | undefined {
    const entry = this.store.get(key) as CacheEntry<T> | undefined;
    if (!entry) {
      return undefined;
    }
    if (entry.expiresAt <= Date.now()) {
      this.store.delete(key);
      return undefined;
    }
    return entry.value;
  }

  delete(key: string): void {
    this.store.delete(key);
  }

  size(): number {
    return this.store.size;
  }

  /** Tests. */
  clear(): void {
    this.store.clear();
  }
}
