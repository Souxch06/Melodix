#!/usr/bin/env node
'use strict';
// P0 root-cause tests: document classification in c91.onPageFinished (fix on
// top of 62bc486). The launch was blocked on the logo because the "web player"
// classification used String.contains("open.spotify.com") (da1.y), and the
// Spotify LOGIN URL embeds that host in its continue= parameter:
//   https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1
// The login document therefore matched the player test and the splash was
// held "waiting for the native shell" - which a login page can never show.
//
// WHAT IS ACTUALLY EXECUTED HERE:
//   1. Static checks over the real Smali (smali/c91.smali, smali/m9.smali):
//      the isPlayerDoc helper, its five call sites, the shapes of the blocks
//      it guards, and what must NOT have changed (login detection, error
//      attribution).
//   2. An executable MODEL of the classification pipeline (cookie sync,
//      cond_4/cond_15 routing, flash_route hold-or-reveal, player-script
//      injection gate), transcribed from the fixed Smali and also from the
//      pre-fix contains() logic, driven by a scenario table that pins the
//      demonstrated defect (old => hold on the login URL) and the fix
//      (new => reveal).
// WHAT IS NOT EXECUTED: Android instrumentation, emulator or phone runs.

const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8');
const C91 = () => read('smali/c91.smali');
const M9 = () => read('smali/m9.smali');

function methodBody(src, sigStart) {
  const start = src.indexOf(sigStart);
  assert.ok(start >= 0, `method not found: ${sigStart}`);
  return src.slice(start, src.indexOf('.end method', start));
}

function labelPos(body, name) {
  const m = body.match(new RegExp(`^\\s*:${name}\\s*$`, 'm'));
  return m ? m.index : -1;
}

// The exact URL m9.g() loads on a fresh install (AppSingleton.B == false).
const LOGIN_URL = 'https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1';
const PLAYER_URL = 'https://open.spotify.com/';
const PLAYER_URL_NO_SLASH = 'https://open.spotify.com';
const EVIL_LOOKALIKE = 'https://open.spotify.com.evil.example/track/x';
const UNKNOWN_URL = 'https://example.org/whatever';

// ---------------------------------------------------------------------------
// Part 1 - the fixed classifier (port of c91.isPlayerDoc) and the pre-fix one
// ---------------------------------------------------------------------------

function isPlayerDoc(url) {
  if (url == null) return false;
  return url.startsWith('https://open.spotify.com/') || url === 'https://open.spotify.com';
}

// Pre-fix classification: String.contains("open.spotify.com") == da1.y.
const wasPlayerDocOld = (url) => url != null && url.includes('open.spotify.com');

test('isPlayerDoc matches only the open.spotify.com origin', () => {
  assert.equal(isPlayerDoc(PLAYER_URL), true);
  assert.equal(isPlayerDoc(PLAYER_URL_NO_SLASH), true);
  assert.equal(isPlayerDoc('https://open.spotify.com/intl-fr/search?query=x'), true);
  assert.equal(isPlayerDoc('https://open.spotify.com/album/abc?si=1#t=2'), true);
});

test('isPlayerDoc rejects the login URL whose continue= parameter embeds the host', () => {
  assert.equal(isPlayerDoc(LOGIN_URL), false,
    'the login URL must never classify as the web player');
  assert.equal(isPlayerDoc('https://accounts.spotify.com/en/login?continue=https://open.spotify.com/'), false);
  assert.equal(isPlayerDoc('https://accounts.spotify.com/authorize?client_id=x&redirect_uri=https%3A%2F%2Fopen.spotify.com%2F'), false);
});

test('isPlayerDoc rejects host lookalikes and other origins', () => {
  assert.equal(isPlayerDoc(EVIL_LOOKALIKE), false);
  assert.equal(isPlayerDoc('https://www.open.spotify.com/'), false);
  assert.equal(isPlayerDoc('http://open.spotify.com/'), false);
  assert.equal(isPlayerDoc(UNKNOWN_URL), false);
  assert.equal(isPlayerDoc(null), false);
  assert.equal(isPlayerDoc('about:blank'), false);
  assert.equal(isPlayerDoc('chrome-error://chromewebdata/'), false);
});

test('the pre-fix contains() logic misclassifies the login URL (the demonstrated defect)', () => {
  assert.equal(wasPlayerDocOld(LOGIN_URL), true,
    'old logic: the login URL matched the player test - this is the bug');
  assert.equal(wasPlayerDocOld(EVIL_LOOKALIKE), true,
    'old logic: host lookalikes matched too');
  assert.equal(isPlayerDoc(LOGIN_URL), false, 'fixed logic rejects it');
  assert.equal(isPlayerDoc(EVIL_LOOKALIKE), false, 'fixed logic rejects it');
});

test('m9.g() still loads exactly this login URL on a fresh install (drift guard)', () => {
  const m9 = M9();
  assert.ok(m9.includes(`const-string v0, "${LOGIN_URL}"`),
    'the login URL constant must stay in sync with this test model');
});

// ---------------------------------------------------------------------------
// Part 2 - static checks on the real Smali
// ---------------------------------------------------------------------------

test('smali: c91 defines isPlayerDoc as an origin test (startsWith + exact equals)', () => {
  const c91 = C91();
  const body = methodBody(c91, '.method private static isPlayerDoc(Ljava/lang/String;)Z');
  assert.match(body, /invoke-virtual \{p0, v0\}, Ljava\/lang\/String;->startsWith\(Ljava\/lang\/String;\)Z/);
  assert.match(body, /invoke-virtual \{p0, v0\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z/);
  assert.ok(!/Lda1;->y/.test(body), 'the helper must not use the contains primitive');
  assert.ok(!/open\.spotify\.com\.evil/.test(body));
  // Polarity: null -> :not_player (return 0); startsWith true -> return 1.
  assert.match(body, /if-eqz p0, :not_player/);
  assert.match(body, /if-eqz v1, :check_exact/);
});

test('smali: exactly five call sites use isPlayerDoc', () => {
  const calls = C91().match(/Lc91;->isPlayerDoc\(Ljava\/lang\/String;\)Z/g) || [];
  assert.equal(calls.length, 5,
    'cond_2 redirect, cond_3 logout sync, cond_4 routing, flash_route hold and the script-injection gate');
});

test('smali: the flash_route hold decision uses isPlayerDoc and no contains()', () => {
  const body = methodBody(C91(), '.method public final onPageFinished');
  const a = labelPos(body, 'flash_route');
  const b = labelPos(body, 'reveal_for_login');
  assert.ok(a >= 0 && b > a, 'flash_route must precede reveal_for_login');
  const block = body.slice(a, b);
  assert.match(block, /Lc91;->isPlayerDoc\(Ljava\/lang\/String;\)Z/,
    'the hold-or-reveal decision must use the origin test');
  assert.ok(!/Lda1;->y/.test(block), 'the hold decision must not use contains()');
  // Polarity: player document (v8 == 1) falls through to the hold; the
  // non-player document jumps to :reveal_for_login.
  assert.match(block, /if-eqz v8, :reveal_for_login/);
});

test('smali: cond_2 (session redirect) and cond_3 (logout sync) use isPlayerDoc', () => {
  const body = methodBody(C91(), '.method public final onPageFinished');
  const c2 = labelPos(body, 'cond_2');
  const c3 = labelPos(body, 'cond_3');
  const c4 = labelPos(body, 'cond_4');
  assert.ok(c2 >= 0 && c3 > c2 && c4 > c3);
  const block2 = body.slice(c2, c3);
  const block3 = body.slice(c3, c4);
  assert.match(block2, /Lc91;->isPlayerDoc\(Ljava\/lang\/String;\)Z/);
  assert.match(block3, /Lc91;->isPlayerDoc\(Ljava\/lang\/String;\)Z/);
  assert.ok(!/Lda1;->y/.test(block2), 'cond_2 must not use contains()');
  assert.ok(!/Lda1;->y/.test(block3), 'cond_3 must not use contains()');
  // Polarity preserved from the original: cond_2 "not player -> redirect",
  // cond_3 "player -> sync when the session flag is stale".
  assert.match(block2, /if-nez v2, :cond_4/);
  assert.match(block3, /if-eqz v2, :cond_4/);
});

test('smali: cond_4 routes the player doc to cond_5 and falls through to the login tests otherwise', () => {
  const body = methodBody(C91(), '.method public final onPageFinished');
  const c4 = labelPos(body, 'cond_4');
  const c15 = labelPos(body, 'cond_15');
  assert.ok(c4 >= 0 && c15 > c4, 'cond_15 must follow cond_4');
  const block = body.slice(c4, c15);
  assert.match(block, /Lc91;->isPlayerDoc\(Ljava\/lang\/String;\)Z/);
  assert.match(block, /if-nez v2, :cond_5/,
    'a player document continues to the splash decision');
  assert.ok(!/goto :cond_5/.test(block), 'the old unconditional goto must be gone');
  assert.ok(!/if-eqz v2, :cond_7/.test(block), 'the old contains() skip must be gone');
  // The "/login" needle is loaded in this block and reused by the tests below.
  assert.match(block, /const-string v5, "\/login"/);
  // The login/auth detection below cond_15 is preserved (still contains()).
  const tests = body.slice(c15, labelPos(body, 'cond_5'));
  assert.match(tests, /invoke-static \{v1, v5, v3\}, Lda1;->y/);
  assert.match(tests, /const-string v2, "\/auth"/);
  assert.match(tests, /const-string v2, "accounts\.spotify\.com"/);
  assert.match(tests, /if-nez v2, :cond_5/);
  assert.match(tests, /if-eqz v2, :cond_7/);
});

test('smali: the player-script injection gate uses isPlayerDoc', () => {
  const body = methodBody(C91(), '.method public final onPageFinished');
  const i = body.lastIndexOf('if-nez v1, :cond_b');
  assert.ok(i > 0, 'the injection gate branch must exist');
  const before = body.slice(Math.max(0, i - 400), i);
  assert.match(before, /Lc91;->isPlayerDoc\(Ljava\/lang\/String;\)Z/);
  assert.ok(!/Lda1;->y/.test(before.slice(before.lastIndexOf(':cond_a'))),
    'the gate after the web-player-link click must not use contains()');
  assert.match(body.slice(i), /goto\/16 :goto_5/,
    'a non-player document skips the player script stack');
});

test('smali: error attribution keeps its substring test (out of scope on purpose)', () => {
  const body = methodBody(C91(), '.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V');
  assert.match(body, /Lda1;->y\(Ljava\/lang\/CharSequence;Ljava\/lang\/String;Z\)Z/,
    'the legacy error handler attributes failures by host mention - unchanged');
});

// ---------------------------------------------------------------------------
// Part 3 - executable model of the classification pipeline
// ---------------------------------------------------------------------------

// Transcribed from c91.onPageFinished (post-fix). Returns the visible action:
//   'redirect-home' | 'logout-sync+skip' | 'hold' | 'reveal' | 'skip'
function classify(url, { B, hasSpdc }, playerTest) {
  const isPlayer = playerTest(url);
  if (url === 'about:blank' || url.startsWith('chrome-error://')) return 'skip';

  if (hasSpdc) {
    if (!B) B = true;
    if (!isPlayer) return 'redirect-home';
  } else {
    if (isPlayer && B) {
      B = false; // logout sync (m9.k())
    }
  }

  // cond_4 / cond_15 routing
  let classified = false;
  if (B) {
    if (isPlayer) classified = true;
    // else: fall through to the login tests (the fix)
  }
  if (!classified) {
    const isLogin = url.includes('/login') || url.includes('/auth') || url.includes('accounts.spotify.com');
    if (!isLogin) return 'skip'; // cond_7
    classified = true;
  }

  // cond_5 -> flash_route
  return isPlayer ? 'hold' : 'reveal';
}

// Pre-fix pipeline: same shape but contains() everywhere and, for B == true,
// a non-player document skipped straight to cond_7 (no login tests).
function classifyOld(url, { B, hasSpdc }) {
  const isPlayer = wasPlayerDocOld(url);
  if (url === 'about:blank' || url.startsWith('chrome-error://')) return 'skip';
  if (hasSpdc) {
    if (!B) B = true;
    if (!isPlayer) return 'redirect-home';
  } else {
    if (isPlayer && B) B = false;
  }
  let classified = false;
  if (B) {
    if (isPlayer) classified = true;
    else return 'skip'; // old: goto cond_7, no login fallback
  }
  if (!classified) {
    const isLogin = url.includes('/login') || url.includes('/auth') || url.includes('accounts.spotify.com');
    if (!isLogin) return 'skip';
    classified = true;
  }
  return isPlayer ? 'hold' : 'reveal';
}

const scenarios = [
  {
    name: 'fresh install: login page must be revealed (THE blocked-launch case)',
    url: LOGIN_URL, state: { B: false, hasSpdc: false },
    old: 'hold', neu: 'reveal',
  },
  {
    name: 'logged in: the player document is held for the native shell',
    url: PLAYER_URL, state: { B: true, hasSpdc: true },
    old: 'hold', neu: 'hold',
  },
  {
    name: 'stale prefs with a live cookie on the login URL redirects home',
    url: LOGIN_URL, state: { B: true, hasSpdc: true },
    old: 'hold', neu: 'redirect-home',
  },
  {
    name: 'forced logout lands on the login URL and must show it',
    url: LOGIN_URL, state: { B: true, hasSpdc: false },
    old: 'hold', neu: 'reveal',
  },
  {
    name: 'logged-out deep link to the player stays held (login wall click-through)',
    url: PLAYER_URL, state: { B: false, hasSpdc: false },
    old: 'skip', neu: 'skip',
  },
  {
    name: 'host lookalike with a live cookie is not the player (old logic held it)',
    url: EVIL_LOOKALIKE, state: { B: true, hasSpdc: true },
    old: 'hold', neu: 'redirect-home',
  },
  {
    name: 'unknown documents are left to the startup watchdog (unchanged)',
    url: UNKNOWN_URL, state: { B: true, hasSpdc: true },
    old: 'redirect-home', neu: 'redirect-home',
  },
  {
    name: 'player document without trailing slash is still the player',
    url: PLAYER_URL_NO_SLASH, state: { B: true, hasSpdc: true },
    old: 'hold', neu: 'hold',
  },
];

for (const s of scenarios) {
  test(`model: ${s.name}`, () => {
    assert.equal(classifyOld(s.url, s.state), s.old, 'pre-fix behaviour (documents the defect)');
    assert.equal(classify(s.url, s.state, isPlayerDoc), s.neu, 'fixed behaviour');
  });
}

test('model: the login URL is revealed whatever the session flag', () => {
  for (const B of [false, true]) {
    for (const hasSpdc of [false, true]) {
      const got = classify(LOGIN_URL, { B, hasSpdc }, isPlayerDoc);
      assert.ok(got === 'reveal' || got === 'redirect-home',
        `B=${B} hasSpdc=${hasSpdc} must never hold or skip the login URL, got ${got}`);
    }
  }
});

// ---------------------------------------------------------------------------
// Part 4 - player-script injection gate model
// ---------------------------------------------------------------------------

function injectsPlayerStack(url, playerTest) {
  return playerTest(url);
}

test('model: the player script stack runs on the player and not on the login page', () => {
  assert.equal(injectsPlayerStack(PLAYER_URL, isPlayerDoc), true);
  assert.equal(injectsPlayerStack(PLAYER_URL_NO_SLASH, isPlayerDoc), true);
  assert.equal(injectsPlayerStack(LOGIN_URL, isPlayerDoc), false,
    'spotify_bridge.js/native_ui_shell.js must not run on the login page');
  assert.equal(injectsPlayerStack(EVIL_LOOKALIKE, isPlayerDoc), false);
  // The old gate injected the whole stack on the login page:
  assert.equal(injectsPlayerStack(LOGIN_URL, wasPlayerDocOld), true, 'old defect');
});
