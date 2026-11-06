const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const bridge = fs.readFileSync(path.join(repo, 'scripts/spotify_bridge.source.js'), 'utf8');
const shell = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
const bridgeAsset = fs.readFileSync(path.join(repo, 'assets/spotify_bridge.js'), 'utf8');
const shellAsset = fs.readFileSync(path.join(repo, 'assets/native_ui_shell.js'), 'utf8');

// MEL-BUG-029: the home screen told a LOGGED-IN user "not connected" whenever
// one Spotify DOM selector family went stale, because sign-in required exactly
// one profile selector AND one player selector. Both sides now accept several
// selectors already used across this codebase, while sign-in still requires
// BOTH sides (fail closed: a public page with neither stays unknown/out).
function signalBlock(src) {
  const at = src.indexOf('profileControl:');
  assert.ok(at > 0, 'profileControl signal must exist');
  return src.slice(at - 200, at + 700);
}

test('MEL-BUG-029: profile-side signal accepts several known selectors', () => {
  const block = signalBlock(bridge);
  for (const sel of ['user-widget-link', 'main-userWidget-box', 'a[href^="/user/"]']) {
    assert.ok(block.includes(sel), `profileControl must accept ${sel}`);
  }
});

test('MEL-BUG-029: player-side signal accepts the known playback selectors', () => {
  const block = signalBlock(bridge);
  for (const sel of ['control-button-playpause', 'main-playButton-entrancePoint',
    'now-playing-bar', 'mini-player', 'control-button-skip-forward', 'control-button-skip-back']) {
    assert.ok(block.includes(sel), `playerControls must accept ${sel}`);
  }
});

test('MEL-BUG-029: sign-in still requires BOTH sides (fail closed)', () => {
  const runtime = require('../assets/runtime_state.js');
  // Only profile evidence -> still unknown, never signed-in.
  assert.equal(runtime.classifyAuthSignals({ profileControl: true }), runtime.AUTH_STATE.UNKNOWN);
  // Only player evidence -> still unknown.
  assert.equal(runtime.classifyAuthSignals({ playerControls: true }), runtime.AUTH_STATE.UNKNOWN);
  // Both -> signed in.
  assert.equal(runtime.classifyAuthSignals({ profileControl: true, playerControls: true }),
    runtime.AUTH_STATE.SIGNED_IN);
  // Login routes still override everything.
  assert.equal(runtime.classifyAuthSignals({ loginRoute: true, profileControl: true, playerControls: true }),
    runtime.AUTH_STATE.SIGNED_OUT);
});

test('MEL-BUG-029: shell profile signal broadened the same way', () => {
  const at = shell.indexOf('function pageHasProfileSignal');
  assert.ok(at > 0);
  const block = shell.slice(at, at + 400);
  assert.ok(block.includes('a[href^="/user/"]'), 'shell pageHasProfileSignal must accept /user/ links');
});

test('MEL-BUG-029: minified assets carry the broadened selectors', () => {
  assert.ok(bridgeAsset.includes('now-playing-bar') && bridgeAsset.includes('a[href^="/user/"]'),
    'assets/spotify_bridge.js must be regenerated from the source');
  assert.ok(shellAsset.includes('a[href^="/user/"]'), 'assets/native_ui_shell.js must be regenerated');
});
