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

// MEL-BUG-044: the library-fetch logcat line carries a boolean bearer=0/1 flag
// (never the token), so `adb logcat` alone shows whether a Bearer web-player
// token was attached to the refused request.
test('MEL-BUG-044: the library-fetch trace line exposes a boolean bearer flag', () => {
  assert.match(bridge, /' bearer=' \+ \(state\.bearer === true \? 1 : 0\)/,
    'the log line ends with bearer=0/1');
  assert.doesNotMatch(bridge, /bearer=' \+ (token|bearerToken|webPlayerTokenCache)/,
    'the token value is never concatenated into the log line');
  assert.ok(bridgeAsset.includes('bearer='), 'assets/spotify_bridge.js must be regenerated');
  assert.doesNotMatch(bridgeAsset, /TEST_TOKEN_036/);
});

// MEL-BUG-046: the in-app settings row "État de libraryV3" shows the boolean
// bearer flag on 401/403, so a phone screenshot replaces adb logcat.
test('MEL-BUG-046: the visible libraryV3 status text carries the bearer flag on refusals', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /function mediaLibraryBearerSuffix\(\)/);
  assert.match(shellSrc, /error === 'http-401'\) return 'libraryV3 a répondu 401; session non validée\.' \+ mediaLibraryBearerSuffix\(\)/);
  assert.match(shellSrc, /' \(bearer=' \+ \(d\.bearer === true \? 1 : 0\) \+ '\)'/,
    'booléen 0/1 uniquement, jamais la valeur du token');
  assert.ok(shellAsset.includes('mediaLibraryBearerSuffix'), 'assets/native_ui_shell.js must be regenerated');
});

// Do not expose legacy credential diagnostics in the Home card.
test('MEL-BUG-048/054: the home refusal card contains no bearer diagnostic', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  const card=shellSrc.slice(shellSrc.indexOf('function unprovenHomeStateRow()'),shellSrc.indexOf('function ',shellSrc.indexOf('function unprovenHomeStateRow()')+10));
  assert.doesNotMatch(card, /bearer=|diagBearer|mediaLibraryBearerSuffix/);
  assert.match(card, /diagLine/);
  assert.ok(shellAsset.includes('diagLine'), 'asset must be regenerated');
});

// MEL-BUG-049: the proof gate used to require authState === 'connected'; if the
// player-DOM signals never confirmed (page version mismatch), no libraryV3
// request was EVER sent and the Home stayed on "loading" forever.
test('MEL-BUG-049: only a definite sign-out blocks the library proof', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  const at = shellSrc.indexOf('function requestMediaLibraryProof(source, force)');
  const gate = shellSrc.slice(at, shellSrc.indexOf('\n    function ', at + 10));
  assert.match(gate, /if \(authState === 'required'\) \{[\s\S]*?skipped-auth[\s\S]*?return false/,
    "only 'required' (definite sign-out) blocks; unknown/in-progress attempt the proof");
  assert.ok(!/authState !== 'connected'/.test(gate), 'the old never-fire gate is gone');
  assert.match(gate, /__sfMediaLibRefusalCooldownAt/, 'attempts stay bounded by budget + cool-down');
});

// The unproven card retains bounded state information without credential metadata.
test('MEL-BUG-050: the home state card carries a compact non-credential diagnostic line', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  const card=shellSrc.slice(shellSrc.indexOf('function unprovenHomeStateRow()'),shellSrc.indexOf('function ',shellSrc.indexOf('function unprovenHomeStateRow()')+10));
  assert.match(card, /var diagLine = ' \[auth=' \+ authState \+ ' statut=' \+ status \+/);
  assert.match(card, /essais=.*safeHomeTraceCount/);
  assert.doesNotMatch(card, /bearer=| token=| cookie=/);
  assert.ok(shellAsset.includes('diagLine'));
});

// MEL-BUG-057: the diagnostic now says WHY there is no bearer token — the
// /api/token endpoint status (ok | ko-httpXXX | ko-network), a sanitized enum.
// The token value itself must never appear.
test('MEL-BUG-057: token-fetch status is tracked as a sanitized enum and exported', () => {
  assert.match(bridge, /let lastTokenFetchStatus = 'none';/);
  assert.match(bridge, /function safeTokenFetchStatus\(value\) \{\s*const v = String\(value \|\| ''\);\s*return \/\^\(ok\|none\|ko-network\|ko-non-json\|ko-invalid\|ko-expired\|ko-http\[1-5\]\[0-9\]\{2\}\)\$\/\.test\(v\) \? v : 'unknown';/,
    'status sanitizer only allows the fixed enum');
  assert.match(bridge, /trace\.token = safeTokenFetchStatus\(lastTokenFetchStatus\);/);
  assert.match(bridge, /token: safeTokenFetchStatus\(state\.token\)/,
    'the exported diagnostic carries the token status');
  assert.doesNotMatch(bridge, /lastTokenFetchStatus = token\b/, 'status var never stores the token value');
  assert.ok(bridgeAsset.includes('lastTokenFetchStatus'), 'assets/spotify_bridge.js must be regenerated');
});

// Credential status is no longer shown to the user.
test('MEL-BUG-057: home diagnostic does not show credential status', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  const card=shellSrc.slice(shellSrc.indexOf('function unprovenHomeStateRow()'),shellSrc.indexOf('function ',shellSrc.indexOf('function unprovenHomeStateRow()')+10));
  assert.match(card, /diagLine/);
  assert.doesNotMatch(card, /diagToken| token=|bearer=| cookie=/);
  assert.ok(shellAsset.includes('diagLine'));
});

// MEL-BUG-060: a fresh diagnostic must seed token= with the LAST KNOWN /api/token
// status, so a request-phase emit never masks the real cause with 'none'
// (screenshot 17:13 showed token=none next to bearer=0 + http-401).
test('MEL-BUG-060: new library diagnostics inherit the last known token-fetch status', () => {
  assert.match(bridge, /token: safeTokenFetchStatus\(lastTokenFetchStatus\),/,
    'createMediaLibraryDiagnostic seeds token from lastTokenFetchStatus');
  assert.ok(bridgeAsset.includes('lastTokenFetchStatus'), 'assets/spotify_bridge.js must be regenerated');
});

// MEL-BUG-061: /api/token answers 400 on some WebView sessions -> fall back to
// the endpoint the official web player itself uses (get_access_token), still
// cookie-authenticated; the token value never leaves this scope.
test('MEL-BUG-061: token fetch falls back to the web player get_access_token endpoint', () => {
  assert.match(bridge, /open\.spotify\.com\/get_access_token\?reason=transport&productType=web_player/,
    'fallback endpoint = the official web player token endpoint');
  assert.match(bridge, /altResp && altResp\.ok[\s\S]*?decodeWebPlayerToken\(altResp\)/,
    'fallback parses accessToken');
  assert.doesNotMatch(bridge, /console\.\w+\([^)]*[Tt]oken/, 'token value never passed to console');
  assert.ok(bridgeAsset.includes('get_access_token'), 'assets/spotify_bridge.js must be regenerated');
});
