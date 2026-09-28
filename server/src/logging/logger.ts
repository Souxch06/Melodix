/**
 * Logger minimal et horodaté.
 *
 * SÉCURITÉ : ce logger ne reçoit jamais de token. Les appels réseau sont
 * loggés sans headers (`Authorization` contient un token éphémère obtenu
 * serveur-side : il ne doit apparaître nulle part, même en debug).
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

const emit = (level: LogLevel, service: string, message: string): void => {
  if (!shouldLog(level)) {
    return;
  }
  const line = `${new Date().toISOString()} [${level.toUpperCase()}] [${service}] ${message}`;
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
