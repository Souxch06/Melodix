const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const shell = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
const shellAsset = fs.readFileSync(path.join(repo, 'assets/native_ui_shell.js'), 'utf8');

function gateBlock() {
  const at = shell.indexOf('function requestMediaLibraryProof(source, force)');
  return shell.slice(at, shell.indexOf('\n    function ', at + 10));
}

// MEL-BUG-035: after a 401/403, the refusal budget (MEL-BUG-030) must NOT burn
// instantly (retryAt = 0) — that raced the post-login cookie and left Home on
// the error card. Attempts must be spaced by a real backoff, and
// scheduleHomeRetry must keep a bounded timer while the budget is not spent.
test('MEL-BUG-035: the refusal branch never clears the backoff (retryAt stays armed >= 5s)', () => {
  const gate = gateBlock();
  const branch = gate.slice(gate.indexOf("previousError === 'http-401'"));
  assert.match(branch, /MEL-BUG-035/);
  const refusalBody = branch.slice(0, branch.indexOf('} else if'));
  assert.doesNotMatch(refusalBody, /__sfMediaLibRetryAt = 0;/,
    'the 401/403 branch must NOT reset retryAt to 0 (that burned the budget instantly)');
  // the generic backoff (armed when each attempt starts: now + >=5s, doubling) applies
  assert.match(gate, /window\.__sfMediaLibRetryAt = now \+ delay;/);
  assert.match(gate, /if \(!explicitRetry && window\.__sfMediaLibRetryAt && now < window\.__sfMediaLibRetryAt\)/,
    'the armed backoff blocks any immediate retry after a refusal');
});

test('MEL-BUG-035: scheduleHomeRetry keeps a bounded timer for 401/403 while the budget is not spent', () => {
  const m = shell.match(/function scheduleHomeRetry\(\) \{([\s\S]*?)\n    \}/);
  assert.ok(m, 'scheduleHomeRetry exists');
  assert.match(m[1], /refusalAttempts >= 3/,
    'once the 3-attempt budget is spent, background retries stop (card actions remain)');
  assert.match(m[1], /homeRetries \+= 1;[\s\S]*?setTimeout\([\s\S]*?waitMs\)/,
    'a timer is scheduled at the backoff deadline while the budget lasts');
  assert.match(m[1], /retryAt > Date\.now\(\) \? retryAt - Date\.now\(\) : 500/,
    'the wait honors __sfMediaLibRetryAt');
});

test('MEL-BUG-035: minified asset carries the backoff', () => {
  assert.ok(shellAsset.includes('__sfMediaLibRefusalAttempts'),
    'assets/native_ui_shell.js must be regenerated');
});
