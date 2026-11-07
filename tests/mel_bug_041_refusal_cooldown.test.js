const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const shell = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
const shellAsset = fs.readFileSync(path.join(repo, 'assets/native_ui_shell.js'), 'utf8');
const bridge = fs.readFileSync(path.join(repo, 'scripts/spotify_bridge.source.js'), 'utf8');
const bridgeAsset = fs.readFileSync(path.join(repo, 'assets/spotify_bridge.js'), 'utf8');

function gateBlock() {
  const at = shell.indexOf('function requestMediaLibraryProof(source, force)');
  assert.ok(at >= 0, 'requestMediaLibraryProof exists');
  return shell.slice(at, shell.indexOf('\n    function ', at + 10));
}

// MEL-BUG-041: after 3 refused attempts in one sign-in epoch, the gate used to
// block forever. But no further sf-spotify-auth-state-changed event fires when
// the UI state string is unchanged, so a late cookie/token settle left the Home
// stuck on the 401 error card for the whole session. Fix: one slow cool-down
// budget (3 more attempts) every 2 minutes, still rate-limited by the generic
// backoff. The refusal never becomes an infinite loop and never fakes success.
test('MEL-BUG-041: an exhausted refusal budget self-heals on a 2 minute cool-down', () => {
  const gate = gateBlock();
  const branch = gate.slice(gate.indexOf('>= 3'));
  assert.match(branch, /Number\(window\.__sfMediaLibRefusalCooldownAt \|\| 0\)/,
    'the exhausted budget consults a cool-down deadline');
  assert.match(branch, /Date\.now\(\) < cooldownAt[\s\S]*?return false/,
    'before the cool-down deadline the gate still blocks');
  assert.match(branch, /window\.__sfMediaLibRefusalAttempts = 0;\s*window\.__sfMediaLibRefusalCooldownAt = Date\.now\(\) \+ 120000;/,
    'after the deadline a fresh bounded budget is granted for 120 s');
  assert.match(gate, /window\.__sfMediaLibRetryAt = now \+ delay/,
    'every attempt is still rate-limited by the generic backoff');
  assert.ok(!/while\s*\(/.test(gate), 'no unbounded loop in the gate');
});

test('MEL-BUG-041: every refusal-budget reset also clears the cool-down', () => {
  const gate = gateBlock();
  const ready = gate.slice(gate.indexOf('libraryProvesSession()'), gate.indexOf("previousError === 'http-401'"));
  assert.match(ready, /__sfMediaLibRefusalCooldownAt = 0;/,
    'a proven session clears the cool-down');
  const epochReset = gate.slice(gate.indexOf('authEpoch !== Number'));
  assert.match(epochReset, /__sfMediaLibRefusalEpoch = authEpoch;\s*window\.__sfMediaLibRefusalAttempts = 0;\s*window\.__sfMediaLibRefusalCooldownAt = 0;/,
    'a new sign-in epoch clears the cool-down');
  const m = shell.match(/addEventListener\('sf-spotify-auth-state-changed', function\(\) \{([\s\S]*?)\}\);/);
  assert.ok(m, 'the auth-state-changed listener exists');
  assert.match(m[1], /__sfMediaLibRefusalAttempts = 0;[\s\S]*?__sfMediaLibRefusalCooldownAt = 0;/,
    'an auth-state transition clears the cool-down (MEL-BUG-040 kept)');
});

test('MEL-BUG-041: minified shell asset carries the cool-down logic', () => {
  assert.ok(shellAsset.includes('__sfMediaLibRefusalCooldownAt'), 'assets/native_ui_shell.js must be regenerated');
  assert.match(shellAsset, /__sfMediaLibRefusalCooldownAt=Date\.now\(\)\+(12e4|120000|1\.2e5)/);
});

// The diagnostic overlay must show whether a Bearer web-player token was
// attached when the refusal happened (boolean only — never the token value).
test('MEL-BUG-041: the library diagnostic exports a boolean bearer flag', () => {
  assert.match(bridge, /bearer: state\.bearer === true/,
    'only a boolean is exported, not the token');
  assert.match(bridge, /bearer: false,/,
    'the diagnostic factory initialises the flag');
  assert.doesNotMatch(bridge, /bearer:\s*(token|webPlayerTokenCache)/,
    'the token value is never referenced in the diagnostic');
  assert.ok(bridgeAsset.includes('bearer:'), 'assets/spotify_bridge.js must be regenerated');
  assert.doesNotMatch(bridgeAsset + shellAsset, /TEST_TOKEN_036|accessToken["']?\s*:/);
});
