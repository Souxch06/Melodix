/**
 * Traduction des erreurs en réponses API : codes machine stables + messages
 * génériques. AUCUN détail interne (stack, URL provider, statut upstream)
 * ne sort du serveur dans le corps de réponse — il reste dans les logs.
 */

import {
  ApiError,
  type ApiErrorBody,
  type ApiErrorCode,
} from '../config/types';
import { createLogger } from '../logging/logger';

const logger = createLogger('Errors');

export const errorBody = (
  code: ApiErrorCode,
  message: string
): ApiErrorBody => ({
  error: { code, message },
});

/**
 * Normalise n'importe quelle erreur en couple { status, body }.
 */
export const toHttpError = (
  error: unknown,
  context: string
): { status: number; body: ApiErrorBody } => {
  if (error instanceof ApiError) {
    if (error.internalDetail) {
      logger.warn(
        `${context} — ${error.code} — détail interne: ${error.internalDetail}`
      );
    }
    return {
      status: error.httpStatus,
      body: errorBody(error.code, error.message),
    };
  }

  logger.error(
    `${context} — erreur inattendue : ${error instanceof Error ? error.message : String(error)}`
  );
  return {
    status: 500,
    body: errorBody('INTERNAL_ERROR', 'Une erreur interne est survenue.'),
  };
};
