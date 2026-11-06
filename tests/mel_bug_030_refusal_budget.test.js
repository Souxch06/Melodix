const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const shell = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
const shellAsset = fs.readFileSync(path.join(repo, 'assets/native_ui_shell.js'), 'utf8');

function gateBlock() {
  const at = shell.indexOf('function requestMediaLibraryProof(source, force)');
  assert.ok(at >= 0, 'requestMediaLibraryProof exists');
  return shell.slice(at, shell.indexOf('\n    function ', at + 10));
}

// MEL-BUG-030: after a fresh login, a single 401 (cookie-settling race) used to
// permanently block automatic retries for that epoch, leaving Home stuck on the
// error card after the playlists had flashed once. The fix: a bounded budget of 3
// attempts per sign-in epoch, still never an infinite loop.
test('MEL-BUG-030: 401/403 budget is bounded to 3 attempts per sign-in epoch', () => {
  const gate = gateBlock();
  const branch = gate.slice(gate.indexOf("previousError === 'http-401'"));
  assert.match(branch, /authEpoch !== Number\(window\.__sfMediaLibRefusalEpoch \|\| 0\)\) \{\s*window\.__sfMediaLibRefusalEpoch = authEpoch;\s*window\.__sfMediaLibRefusalAttempts = 0;/,
    'a new sign-in epoch resets the refusal budget');
  assert.match(branch, /Number\(window\.__sfMediaLibRefusalAttempts \|\| 0\) >= 3[\s\S]*?return false/,
    'after 3 refused attempts in the same epoch, no more automatic retries');
  assert.match(branch, /window\.__sfMediaLibRefusalAttempts = Number\(window\.__sfMediaLibRefusalAttempts \|\| 0\) \+ 1/,
    'each attempt consumes the budget');
  // explicit user retry (Réessayer) bypasses the budget as before
  assert.match(gate, /!explicitRetry\) \{[\s\S]*?__sfMediaLibRefusalEpoch/,
    'the budget applies only to automatic retries; manual retry still works');
});

test('MEL-BUG-030: a successful proof resets the refusal budget', () => {
  const gate = gateBlock();
  const ready = gate.slice(gate.indexOf('libraryProvesSession()'), gate.indexOf("previousError === 'http-401'"));
  assert.match(ready, /__sfMediaLibRefusalEpoch = 0;[\s\S]*?__sfMediaLibRefusalAttempts = 0;/,
    'once the session is proven, the refusal budget is cleared');
});

test('MEL-BUG-030: no infinite retry loop is possible', () => {
  const gate = gateBlock();
  // every automatic path either returns false (blocked) or sets a future retryAt
  assert.match(gate, /window\.__sfMediaLibRetryAt = now \+ delay/);
  assert.ok(!/while\s*\(/.test(gate), 'no unbounded loop in the gate');
});

test('MEL-BUG-030: minified asset carries the budget logic', () => {
  assert.ok(shellAsset.includes('__sfMediaLibRefusalAttempts'), 'assets/native_ui_shell.js must be regenerated');
});
