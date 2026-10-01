/**
 * M-7 — assainissement des erreurs avant journalisation.
 *
 * Les erreurs du chemin audio (expo-av `createAsync`, fetch de flux) peuvent
 * embarquer dans leur message l'URL COMPLÈTE du stream — signée et privée.
 * Jamais en clair dans les logs : toute URL est remplacée par `<url>`.
 * L'erreur d'origine n'est jamais mutée (elle remonte toujours à l'appelant).
 */
const URL_PATTERN = /https?:\/\/\S+/g;
// /g = regex stateful : présence testée via includes, jamais via .test().
const mentionsUrl = (text: string): boolean =>
  text.includes('https://') || text.includes('http://');

export const sanitizeErrorForLog = (error: unknown): unknown => {
  if (error instanceof Error) {
    if (!mentionsUrl(error.message)) {
      return error;
    }
    const clone = new Error(error.message.replace(URL_PATTERN, '<url>'));
    clone.name = error.name;
    return clone;
  }

  if (typeof error === 'string') {
    return error.replace(URL_PATTERN, '<url>');
  }

  return error;
};
