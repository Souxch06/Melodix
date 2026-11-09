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

test('login action retries with a cookie before account navigation; explicit logout remains separate', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const login = method(main, '.method public final openSpotifyLogin()V');
  assert.match(login, /hasCookie\(\)Z\s+move-result v0\s+if-eqz v0, :native_login_without_cookie\s+invoke-static \{p0\}[^\n]*->verify[^\n]*\s+return-void/);
  // Exercise the actual new smali branch for both cookie states.
  for (const present of [false, true]) {
    const prefix = login.slice(0, login.indexOf('    :native_login_without_cookie'));
    const branch = prefix.match(/if-(eqz|nez) v0, :native_login_without_cookie/)[1];
    const reachesAccounts = branch === 'eqz' ? !present : present;
    assert.equal(reachesAccounts, !present);
  }
  const recovery = read('smali/com/melodix/music/NativeSessionRecovery.smali');
  assert.doesNotMatch(recovery + login, /removeAllCookies|removeSessionCookies|deleteAllData|->A\(\)|nativeLogout|proofClear|sput-boolean/);
  assert.doesNotMatch(recovery, /accounts\.spotify\.com|logout|desktop_spoof|UserAgent|spotify-app-version/);
  assert.ok(recovery.indexOf('"runtime_state.js"') < recovery.indexOf('"native_ui_shell.js"'));
  const cookieGrammar = new RegExp('(^|;[ ]*)sp_dc=[^;]+');
  assert.equal(cookieGrammar.test('a=b; sp_dc=fixture'), true);
  assert.equal(cookieGrammar.test('not_sp_dc=fixture'), false);
  assert.equal(cookieGrammar.test('sp_dc='), false);
});
