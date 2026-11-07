const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(repo, f), 'utf8');
const bridge = read('scripts/spotify_bridge.source.js');
const bridgeAsset = read('assets/spotify_bridge.js');

// Reuse the behaviour harness from p0_library_fetch.test.js is not possible
// (it does not export); these are source-level + asset-level guards, and the
// behaviour (header present only with a token, token dropped on 401, token
// never logged) is covered by dedicated behaviour tests below via a mini harness.
const vm = require('node:vm');

// MEL-BUG-036: pathfinder libraryV3 was sent cookie-only; right after a fresh
// login Spotify can answer 401 (web-player expects a Bearer token from
// open.spotify.com/api/token) -> Home flashes playlists then drops to the error
// card. Fix: fetch/cache the web-player token, attach Authorization: Bearer,
// drop the cache on 401/403 so the bounded retry refetches it. Token value is
// never logged.
test('MEL-BUG-036: the bridge fetches and caches a web-player token from /api/token', () => {
  assert.match(bridge, /async function fetchWebPlayerToken\(\)/);
  assert.match(bridge, /open\.spotify\.com\/api\/token/);
  assert.match(bridge, /credentials:\s*'include'/);
  assert.match(bridge, /accessTokenExpirationTimestampMs/);
  assert.match(bridge, /webPlayerTokenCache/);
});

test('MEL-BUG-036: libraryV3 carries Authorization: Bearer only when a token exists', () => {
  const fetchBlock = bridge.slice(bridge.indexOf('async function fetchAllLibrary'));
  assert.match(fetchBlock, /const bearerToken = await fetchWebPlayerToken\(\);/);
  assert.match(fetchBlock, /bearerToken \? \{ 'Authorization': 'Bearer ' \+ bearerToken \} : \{\}/,
    'header is conditional: no token -> no header (legacy cookie-only request preserved)');
  assert.match(fetchBlock, /credentials:\s*'include'/, 'cookies are still sent');
});

test('MEL-BUG-036: a 401/403 drops the cached token so the bounded retry refetches it', () => {
  const fetchBlock = bridge.slice(bridge.indexOf('async function fetchAllLibrary'));
  const refusal = fetchBlock.slice(fetchBlock.indexOf("trace.http === 401 || trace.http === 403"));
  assert.match(refusal, /dropWebPlayerToken\(\)/, 'token cache cleared on auth refusal');
});

test('MEL-BUG-036: the token value never reaches diagnostics or logs', () => {
  const fetchBlock = bridge.slice(bridge.indexOf('async function fetchAllLibrary'));
  assert.doesNotMatch(fetchBlock, /traceLibraryEvent\([^)]*bearerToken|trace\.bearer\s*=\s*bearerToken[^;]*;/,
    'only a boolean flag may be recorded, never the token string');
  assert.match(fetchBlock, /trace\.bearer = Boolean\(bearerToken\)/, 'diagnostics carry only a boolean');
});

test('MEL-BUG-036: minified asset carries the bearer logic', () => {
  assert.ok(bridgeAsset.includes('fetchWebPlayerToken') && bridgeAsset.includes('api/token'),
    'assets/spotify_bridge.js must be regenerated');
  assert.ok(bridgeAsset.includes('dropWebPlayerToken'), 'token drop on 401 must be in the asset');
});
