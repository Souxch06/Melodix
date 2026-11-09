'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const read = file => fs.readFileSync(require('node:path').join(__dirname, '..', file), 'utf8');
const method = (text, signature) => { const start = text.indexOf(signature); assert.ok(start >= 0); return text.slice(start, text.indexOf('.end method', start)); };

test('unknown player DOM can request verification, never becomes private-library proof by itself', () => {
  const bridge = read('scripts/spotify_bridge.source.js');
  const fn = bridge.match(/function mediaLibraryAuthReady\(\) \{([\s\S]*?)\n    \}/)[0];
  for (const [state, expected] of [['unknown', true], ['in-progress', true], ['connected', true], ['required', false]]) {
    assert.equal(vm.runInNewContext('(' + fn + ')()', { spotifyAuthUiState: () => state }), expected, state);
  }
  assert.match(bridge, /if \(hasGraphQlErrors\)/);
  assert.match(bridge, /Array\.isArray\(items\)/);
  assert.match(bridge, /window\.__sfMediaLibSessionProven = false/);
});
