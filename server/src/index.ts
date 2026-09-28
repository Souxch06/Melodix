/**
 * Point d'entrée du backend Melodix.
 *
 * Aucun secret n'est exigé au démarrage : les tokens Spotify éphémères sont
 * obtenus par les techniques internes du Web Player (provider isolé, voir
 * src/spotify/). Un message de démarrage résume la configuration SANS
 * aucune valeur sensible.
 */

import { env } from './config/env';
import { createLogger } from './logging/logger';
import { createMelodixServer } from './server';

const logger = createLogger('Main');

const server = createMelodixServer();

server.listen(env.port, () => {
  logger.info(
    `Melodix backend ${'3.0.0'} — écoute sur 0.0.0.0:${env.port} — ` +
      `origines CORS: ${env.allowedOrigins.join(', ')} — ` +
      `budget Spotify: ${env.spotify.maxRequestsPerHour}/h`
  );
});

const shutdown = (signal: string): void => {
  logger.info(`signal ${signal} reçu, arrêt en cours`);
  server.close(() => {
    logger.info('arrêt propre terminé');
    process.exit(0);
  });
  // Si des connexions persistent, forcer la sortie après un délai raisonnable.
  setTimeout(() => process.exit(1), 5000).unref();
};

process.on('SIGINT', () => shutdown('SIGINT'));
process.on('SIGTERM', () => shutdown('SIGTERM'));
