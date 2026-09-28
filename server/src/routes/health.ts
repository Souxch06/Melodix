/**
 * /health — état du service, SANS secret : statut des garde-fous uniquement.
 */

import { getServiceGuard } from '../net/serviceGuard';

const startedAt = Date.now();

export const healthHandler = (): { status: number; body: unknown } => ({
  status: 200,
  body: {
    status: 'ok',
    uptimeSeconds: Math.floor((Date.now() - startedAt) / 1000),
    services: {
      spotify: getServiceGuard('spotify').getStatus(),
      audius: getServiceGuard('audius').getStatus(),
    },
  },
});
