'use strict';
// The historical MEL-BUG-036 contract fetched a private player bearer. The
// current explicit requirement forbids it, so retain all five checks with the
// new contract rather than exercising or silently skipping the old behavior.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const bridge = fs.readFileSync('scripts/spotify_bridge.source.js', 'utf8');
const bridgeAsset = fs.readFileSync('assets/spotify_bridge.js', 'utf8');
const fetchBlock = bridge.slice(bridge.indexOf('async function fetchAllLibrary'), bridge.indexOf('window.fetchAllLibrary'));

test('MEL-BUG-036: the bridge does not request or cache a private player token', () => {
  assert.doesNotMatch(bridge, /fetchWebPlayerToken|webPlayerTokenCache|open\.spotify\.com\/api\/token|open\.spotify\.com\/get_access_token/);
});

test('MEL-BUG-036: libraryV3 uses browser credentials without an injected bearer', () => {
  assert.match(fetchBlock, /credentials:\s*'include'/);
  assert.doesNotMatch(fetchBlock, /Authorization|bearerToken|accessToken/);
});

test('MEL-BUG-036: real 401/403 library refusals still invalidate private proof', () => {
  const refusal = fetchBlock.slice(fetchBlock.indexOf('trace.http === 401 || trace.http === 403'));
  assert.match(refusal, /__sfMediaLibSessionProven = false/);
  assert.match(refusal, /window\.mediaLib = null/);
  assert.match(refusal, /trace\.error = refusal/);
  assert.doesNotMatch(refusal, /dropWebPlayerToken|fetchWebPlayerToken/);
});

test('MEL-BUG-036: diagnostics never report an obtained private bearer', () => {
  assert.match(fetchBlock, /trace\.bearer = false/);
  assert.match(fetchBlock, /trace\.token = 'none'/);
  assert.doesNotMatch(fetchBlock, /trace\.bearer\s*=\s*(token|bearerToken)/);
});

test('MEL-BUG-036: generated asset has no private player token acquisition or bearer', () => {
  assert.doesNotMatch(bridgeAsset, /fetchWebPlayerToken|webPlayerTokenCache|open\.spotify\.com\/api\/token|open\.spotify\.com\/get_access_token/);
  assert.doesNotMatch(bridgeAsset, /['"]Authorization['"]\s*:/);
});
