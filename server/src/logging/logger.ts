/**
 * Logger minimal et horodaté.
 *
 * SÉCURITÉ : les appels réseau doivent rester loggés sans headers. Une
 * sanitisation centrale défensive masque aussi les credentials qui seraient
 * accidentellement inclus dans une erreur upstream ou une URL signée.
 */

import { env, type LogLevel } from '../config/env';

const LEVEL_ORDER: Record<LogLevel, number> = {
  debug: 10,
  info: 20,
  warn: 30,
  error: 40,
};

const shouldLog = (level: LogLevel): boolean =>
  LEVEL_ORDER[level] >= LEVEL_ORDER[env.logLevel];

/** Dernière barrière : même une erreur upstream ne doit journaliser un secret. */
export const sanitizeLogMessage = (message: string): string =>
  message
    .replace(/\bBearer\s+[A-Za-z0-9._~+/=-]+/gi, 'Bearer [REDACTED]')
    .replace(
      /([?&](?:access_token|refresh_token|client_secret|code|signature|sig|token|x-amz-signature)=)[^&#\s]*/gi,
      '$1[REDACTED]'
    )
    .replace(
      /\b(access_token|refresh_token|client_secret|authorization|api_key)\s*[:=]\s*[^\s,;}]+/gi,
      '$1=[REDACTED]'
    )
    .replace(
      /\beyJ[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\b/g,
      '[REDACTED_JWT]'
    );

const emit = (level: LogLevel, service: string, message: string): void => {
  if (!shouldLog(level)) {
    return;
  }
  const line = `${new Date().toISOString()} [${level.toUpperCase()}] [${service}] ${sanitizeLogMessage(message)}`;
  if (level === 'error') {
    console.error(line);
    return;
  }
  if (level === 'warn') {
    console.warn(line);
    return;
  }
  console.log(line);
};

export const createLogger = (service: string) => ({
  debug: (message: string) => emit('debug', service, message),
  info: (message: string) => emit('info', service, message),
  warn: (message: string) => emit('warn', service, message),
  error: (message: string) => emit('error', service, message),
});

export type Logger = ReturnType<typeof createLogger>;
