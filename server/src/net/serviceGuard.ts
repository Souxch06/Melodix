/**
 * Garde par service : budget glissant + circuit breaker.
 *
 * Reprend l'IDÉE du « service guard » du projet de référence (sans en copier
 * le code) : l'accès aux techniques internes Spotify est non officiel, donc
 * le serveur se protège — budget horaire, coupure après échecs répétés,
 * sonde half-open après une période de refroidissement. Un blocage rend un
 * `false` : la route répondra 503 `PROVIDER_UNAVAILABLE`, jamais de crash.
 */

import { env } from '../config/env';
import { createLogger } from '../logging/logger';

export type ServiceGuardConfig = {
  name: string;
  maxRequestsPerWindow: number;
  windowMs: number;
  failureThreshold: number;
  failureWindowMs: number;
  cooldownMs: number;
};

const DEFAULTS = {
  maxRequestsPerWindow: 300,
  windowMs: 60 * 60 * 1000,
  failureThreshold: 5,
  failureWindowMs: 60 * 1000,
  cooldownMs: 30 * 1000,
} as const;

export class ServiceGuard {
  private callCount = 0;
  private windowStart: number;
  private failures = 0;
  private firstFailureAt = 0;
  private circuitOpen = false;
  private circuitOpenedAt = 0;
  private readonly logger;

  constructor(
    private readonly config: ServiceGuardConfig,
    private readonly now: () => number = Date.now
  ) {
    this.windowStart = this.now();
    this.logger = createLogger(`Guard:${config.name}`);
  }

  acquire(): boolean {
    if (this.circuitOpen) {
      if (this.now() - this.circuitOpenedAt >= this.config.cooldownMs) {
        this.circuitOpen = false;
        this.failures = 0;
        this.logger.info('circuit half-open, autorisation d une sonde');
      } else {
        this.logger.warn('circuit ouvert, requête bloquée');
        return false;
      }
    }

    const now = this.now();
    if (now - this.windowStart >= this.config.windowMs) {
      this.callCount = 0;
      this.windowStart = now;
    }

    if (this.callCount >= this.config.maxRequestsPerWindow) {
      this.logger.warn(
        `budget épuisé (${this.callCount}/${this.config.maxRequestsPerWindow})`
      );
      return false;
    }

    this.callCount += 1;
    return true;
  }

  recordSuccess(): void {
    this.failures = 0;
  }

  recordFailure(): void {
    const now = this.now();
    if (
      this.failures > 0 &&
      now - this.firstFailureAt > this.config.failureWindowMs
    ) {
      this.failures = 0;
    }
    if (this.failures === 0) {
      this.firstFailureAt = now;
    }
    this.failures += 1;

    if (this.failures >= this.config.failureThreshold) {
      this.circuitOpen = true;
      this.circuitOpenedAt = now;
      this.logger.warn(`circuit ouvert après ${this.failures} échecs`);
    }
  }

  getStatus() {
    const now = this.now();
    return {
      callsUsed:
        now - this.windowStart >= this.config.windowMs ? 0 : this.callCount,
      callsMax: this.config.maxRequestsPerWindow,
      circuitOpen: this.circuitOpen,
      failures: this.failures,
    };
  }
}

const guards = new Map<string, ServiceGuard>();

/**
 * Configurations natives par service : centralisées ICI pour que tous les
 * appelants (routes, /health, providers) partagent la même instance avec la
 * même configuration — sinon la première création (ex. /health) gèlerait un
 * budget par défaut.
 */
const BUILTIN_OVERRIDES: Record<
  string,
  Partial<Omit<ServiceGuardConfig, 'name'>>
> = {
  spotify: {
    // Technique non officielle : budget conservateur, configurable via env.
    maxRequestsPerWindow: env.spotify.maxRequestsPerHour,
  },
  audius: {
    maxRequestsPerWindow: 1000,
  },
};

export const getServiceGuard = (
  name: string,
  overrides: Partial<Omit<ServiceGuardConfig, 'name'>> = {}
): ServiceGuard => {
  let guard = guards.get(name);
  if (!guard) {
    guard = new ServiceGuard({
      name,
      ...DEFAULTS,
      ...(BUILTIN_OVERRIDES[name] ?? {}),
      ...overrides,
    });
    guards.set(name, guard);
  }
  return guard;
};

/** Tests : réinitialise tous les guards. */
export const __resetServiceGuards = (): void => {
  guards.clear();
};
