import assert from 'node:assert/strict';
import test from 'node:test';

import { buildSearchLogSummary } from '../graphQLSearch';

test('le résumé de recherche ne journalise jamais le texte utilisateur', () => {
  const sensitiveQuery = 'nom privé code=secret';
  const summary = buildSearchLogSummary(sensitiveQuery.length, 4, 2);

  assert.equal(summary.includes(sensitiveQuery), false);
  assert.equal(summary.includes('secret'), false);
  assert.match(summary, /longueur=21/);
  assert.match(summary, /4 pistes, 2 albums/);
});
