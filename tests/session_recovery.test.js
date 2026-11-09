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

// Execute the status helper's smali instructions against fake Android/JSON APIs.
// This tests the actual branches and mutations, not a second implementation.
function prepareStatus(payload, { cookie, now, started = 0 }) {
  const code = method(read('smali/com/melodix/music/NativeSessionStatus.smali'), '.method public static prepare(').split('\n').map(l => l.trim());
  const regs = { p0: { started }, p1: structuredClone(payload) };
  const labels = Object.fromEntries(code.map((l, i) => [l, i]));
  let result;
  for (let pc = 0, steps = 0; pc < code.length && steps++ < 500; pc++) {
    const l = code[pc]; let m;
    if (!l || /^[.#:]/.test(l)) continue;
    if ((m = l.match(/^const-string (\w+), (.*)$/))) { regs[m[1]] = JSON.parse(m[2]); continue; }
    if ((m = l.match(/^const-wide\/16 (\w+), (.*)$/))) { regs[m[1]] = Number(m[2]); continue; }
    if ((m = l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
      const args = m[1] ? m[1].split(', ').map(r => regs[r]) : [];
      const call = m[2];
      if (call.includes('->optBoolean')) result = args[0][args[1]] === true;
      else if (call.includes('->optString')) result = args[0][args[1]] || '';
      else if (call.includes('->put(')) { args[0][args[1]] = args[2]; result = args[0]; }
      else if (call.includes('->equals(')) result = args[0] === args[1];
      else if (call.includes('->hasCookie()')) result = cookie;
      else if (call.includes('->elapsedRealtime()')) result = now;
      else if (call.includes('->scheduleNativeSessionTimeout()')) { if (!args[0].started) args[0].started = now; }
      else assert.fail('unsupported call: ' + call);
      continue;
    }
    if ((m = l.match(/^move-result(?:-object|-wide)? (\w+)/))) { regs[m[1]] = result; continue; }
    if ((m = l.match(/^iget-wide (\w+), (\w+), .*nativeVerificationStart/))) { regs[m[1]] = regs[m[2]].started; continue; }
    if ((m = l.match(/^sub-long\/2addr (\w+), (\w+)/))) { regs[m[1]] -= regs[m[2]]; continue; }
    if ((m = l.match(/^cmp-long (\w+), (\w+), (\w+)/))) { regs[m[1]] = Math.sign(regs[m[2]] - regs[m[3]]); continue; }
    if ((m = l.match(/^if-(eqz|gez) (\w+), (:\w+)/))) { if (m[1] === 'eqz' ? !regs[m[2]] : regs[m[2]] >= 0) pc = labels[m[3]]; continue; }
    if ((m = l.match(/^goto (:\w+)/))) { pc = labels[m[1]]; continue; }
    if (l === 'return-void') return regs;
    assert.fail('unsupported instruction: ' + l);
  }
  assert.fail('helper failed to return');
}

test('unproven loading has a fixed 15s deadline, then an error with safe retry and conditional login', () => {
  const input = { kind: 'state', state: 'loading', sessionUnproven: true, uri: 'melodix:action:open-login' };
  let r = prepareStatus(input, { cookie: true, now: 20000 });
  assert.equal(r.p1.state, 'loading');
  assert.equal(r.p1.uri, '');
  assert.equal(r.p1.secondaryUri, '');
  assert.equal(r.p0.started, 20000);
  r = prepareStatus(input, { cookie: true, now: 34999, started: 20000 });
  assert.equal(r.p1.state, 'loading');
  assert.equal(r.p0.started, 20000, 'repeated payloads cannot extend the deadline');
  for (const cookie of [false, true]) {
    r = prepareStatus(input, { cookie, now: 35000, started: 20000 });
    assert.equal(r.p1.state, 'error');
    assert.equal(r.p1.uri, 'melodix:action:retry-library');
    assert.equal(r.p1.secondaryUri, cookie ? '' : 'melodix:action:open-login');
    assert.match(r.p1.subtitle, / \[auth=/, 'technical detail follows the existing collapsed-disclosure grammar');
  }
  const timeout = read('smali/com/melodix/music/NativeSessionTimeout.smali');
  assert.match(timeout, /cmp-long v1, v2, v4\s+if-nez v1, :timeout_done/, 'stale attempts cannot replace a newer attempt');
  assert.match(timeout, /hasNativeHomeCardsAttached\(\)Z\s+move-result v1\s+if-nez v1, :timeout_done/, 'never replace successful cards');
  assert.match(timeout, /WeakReference/);
});

test('navigation, guard, token outcome and bounded image observations survive one diagnostic copy', () => {
  const src = read('smali/com/melodix/music/NativeStartupTiming.smali');
  const literal = src.match(/const-string v0, "(\^sid=[^"\n]+)"/)[1];
  const rule = new RegExp(JSON.parse('"' + literal + '"'));
  for (const event of ['navigation source=redirect route=accounts', 'navigation source=history-reload route=player',
    'navigation source=button route=accounts', 'proof clear-accounts=F',
    'proof-native decision=blocked reason=unproven site=rows',
    'proof-guard decision=blocked reason=auth-required', 'token-http endpoint=api phase=end http=403 duration=23',
    'token-result status=ko-http403 duration=40', 'image result=loaded', 'stage shell-asset-loaded']) {
    assert.ok(rule.test('sid=1234abcd t=1000 ' + event), event);
  }
  for (const event of ['navigation source=redirect route=https://private',
    'token-result status=TOKEN_SECRET duration=2', 'image result=https://private']) {
    assert.ok(!rule.test('sid=1234abcd t=1000 ' + event));
  }
  const resume = method(src, '.method public static resume()');
  assert.doesNotMatch(resume, /->reset\(\)V/, 'SSO return must retain pre-login history');
  const client = read('smali/c91.smali');
  assert.match(client, /WebResourceRequest;->isRedirect\(\)Z|NativeSessionTrace;->request/);
  assert.match(client, /doUpdateVisitedHistory/);
  const singleton = read('smali/com/melodix/music/AppSingleton.smali');
  assert.match(method(singleton, '.method public static noteDiagProof'), /if-nez v1, :proof_word_true/);
  assert.match(client, /sput-boolean v2, [^\n]*->B:Z\s+invoke-static \{v2\}[^\n]*proofClearAccounts/);
});
