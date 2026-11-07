const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const main = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

const LOGIN_URL = 'https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1';

function ensureBlock() {
  const at = main.indexOf('.method public final ensureWebPageLoaded()V');
  assert.ok(at >= 0, 'ensureWebPageLoaded exists');
  return main.slice(at, main.indexOf('.end method', at));
}

// MEL-BUG-042: on a cold start the persisted login marker is never trusted
// (AppSingleton forces B=false at startup), so ensureWebPageLoaded takes the
// login branch. It must now also reveal the login Web UI so the user sees the
// official login screen directly, not the native home with a 401 card. A
// valid persisted session cookie auto-continues to open.spotify.com thanks to
// the continue parameter, so a saved login still lands on Home.
test('MEL-BUG-042: an unproven load reveals the login screen, not the native home', () => {
  const block = ensureBlock();
  const loginBranch = block.slice(block.indexOf(':login_url'));
  assert.ok(loginBranch.includes('const-string v1, "' + LOGIN_URL + '"'),
    'the official login URL is unchanged (auth contract untouched)');
  assert.match(loginBranch, /invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->revealLoginWebUi\(\)V/,
    'the login branch reveals the login Web UI (login screen shown directly)');
  // the home branch must still exist for a proven session on warm resume
  assert.ok(block.includes('const-string v1, "https://open.spotify.com/"'),
    'a proven session still loads the player');
});

test('MEL-BUG-042: cold start never wipes the persisted session cookies', () => {
  const a = main.slice(main.indexOf('.method public final A()V'), main.indexOf('.end method', main.indexOf('.method public final A()V')));
  // the whole cookie/storage wipe stays gated behind l0 (only set by an
  // explicit user logout action), which is false on a cold start
  assert.match(a, /sget-boolean v1, Lcom\/melodix\/music\/MainActivity;->l0:Z[\s\S]*?if-eqz v1, :cond_0/,
    'cookie wipe remains gated behind the logout flag l0');
  assert.ok(a.indexOf('removeAllCookies') > a.indexOf(':cond_0'),
    'removeAllCookies stays inside the l0-gated block');
  const singleton = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/AppSingleton.smali'), 'utf8');
  assert.match(singleton, /Startup never trusts a persisted login marker/,
    'startup still starts unconfirmed instead of trusting a stale login flag');
});

test('MEL-BUG-042: the Se connecter action keeps the official login route', () => {
  const m = main.match(/\.method public final openSpotifyLogin\(\)V([\s\S]*?)\.end method/);
  assert.ok(m, 'openSpotifyLogin exists');
  assert.ok(m[1].includes('const-string v2, "' + LOGIN_URL + '"'),
    'openSpotifyLogin loads the same official login URL (no auth change)');
  assert.match(m[1], /revealLoginWebUi\(\)V/, 'and reveals the login Web UI');
});
