const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(repo, f), 'utf8');
const bridge = read('scripts/spotify_bridge.source.js');
const bridgeAsset = read('assets/spotify_bridge.js');
const shell = read('scripts/native_ui_shell.source.js');
const shellAsset = read('assets/native_ui_shell.js');

// MEL-BUG-032: a rotated persisted-query hash makes pathfinder answer 400
// (PersistedQueryNotFound). That used to be a non-transient error -> the Home
// proof was blocked forever. Now the cached hash is dropped and the error is
// transient (bounded backoff), still fail-closed.
test('MEL-BUG-032: a 400 on libraryV3 drops the cached hash and stays transient', () => {
  const fetch = bridge.slice(bridge.indexOf('async function fetchAllLibrary'));
  assert.match(fetch, /if \(trace\.http === 400\) \{[\s\S]*?localStorage\.removeItem\('sp_hash_libraryV3'\)/,
    'the cached libraryV3 hash is dropped on a 400 so the next attempt re-resolves it');
  assert.match(fetch, /PersistedQueryNotFound/,
    'the body is inspected locally (never logged) to classify the 400');
  assert.match(fetch, /'http-400-persisted-query' : 'http-400'/,
    'bounded error enum, no body text in state');
  assert.doesNotMatch(fetch.slice(fetch.indexOf('if (trace.http === 400)'), fetch.indexOf('if (trace.http === 400)') + 900),
    /console\.log|traceLibraryEvent\([^)]*bodyText/, 'body text never reaches the trace sink');
});

test('MEL-BUG-032: http-400 errors are transient in the shell (bounded retry, not a permanent block)', () => {
  const m = shell.match(/function libraryErrorIsTransient\(err\) \{([\s\S]*?)\n    \}/);
  assert.ok(m, 'libraryErrorIsTransient exists');
  assert.match(m[1], /'http-400', 'http-400-persisted-query'/,
    'http-400 variants are classified transient');
  // 401/403 keep their separate bounded-budget path (MEL-BUG-030), unchanged:
  assert.match(shell, /previousError === 'http-401' \|\| previousError === 'http-403'[\s\S]*?__sfMediaLibRefusalAttempts/);
});

test('MEL-BUG-032: minified assets carry the fix', () => {
  assert.ok(bridgeAsset.includes('sp_hash_libraryV3') && bridgeAsset.includes('http-400-persisted-query'),
    'assets/spotify_bridge.js must be regenerated');
  assert.ok(shellAsset.includes('http-400-persisted-query'),
    'assets/native_ui_shell.js must be regenerated');
});
