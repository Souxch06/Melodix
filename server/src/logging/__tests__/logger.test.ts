import assert from 'node:assert/strict';
import test from 'node:test';

import { createLogger, sanitizeLogMessage } from '../logger';

test('sanitizeLogMessage masque credentials, OAuth codes, signatures et JWT', () => {
  const raw =
    'Authorization: Bearer top.secret-token ' +
    'client_secret=hunter2 ' +
    'https://cdn.test/audio?x=1&signature=signed-stream-value&code=oauth-code ' +
    'eyJhbGciOiJIUzI1NiJ9.cGF5bG9hZA.c2lnbmF0dXJl';
  const safe = sanitizeLogMessage(raw);

  for (const secret of [
    'top.secret-token',
    'hunter2',
    'signed-stream-value',
    'oauth-code',
    'eyJhbGciOiJIUzI1NiJ9',
  ]) {
    assert.equal(safe.includes(secret), false);
  }
  assert.match(safe, /\[REDACTED/);
});

test('createLogger assainit aussi les erreurs upstream avant console', () => {
  const original = console.error;
  let emitted = '';
  console.error = (line?: unknown) => {
    emitted = String(line);
  };
  try {
    createLogger('test').error(
      'provider failed: access_token=private-token&x=1'
    );
  } finally {
    console.error = original;
  }

  assert.equal(emitted.includes('private-token'), false);
  assert.match(emitted, /access_token=\[REDACTED\]/);
});
