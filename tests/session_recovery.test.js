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

test('explicit login opens Spotify without deleting cookies; the separate legacy retry policy remains bounded', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(method(main, '.method public final openSpotifyLogin()V'), /NativeSessionGate;->navigateLogin/);
  const gate = read('smali/com/melodix/music/NativeSessionGate.smali');
  assert.match(method(gate, '.method public static requestLogin('), /expiredEvidence:Z[\s\S]*?hasCookie[\s\S]*?->verify[\s\S]*?->navigateLogin/);
  assert.doesNotMatch(gate, /removeAllCookies|deleteAllData/);
});

// Execute the status helper's smali instructions against fake Android/JSON APIs.
// This tests the actual branches and mutations, not a second implementation.
function prepareStatus(payload, { cookie, now, started = 0, expired = false }, refusalOnly = false) {
  const code = method(read('smali/com/melodix/music/' + (refusalOnly ? 'NativeAccessRefusal' : 'NativeSessionStatus') + '.smali'), '.method public static prepare(').split('\n').map(l => l.trim());
  const regs = { p0: { started }, p1: structuredClone(payload) };
  const labels = Object.fromEntries(code.map((l, i) => [l, i]));
  let result;
  for (let pc = 0, steps = 0; pc < code.length && steps++ < 500; pc++) {
    const l = code[pc]; let m;
    if (!l || /^[.#:]/.test(l)) continue;
    if ((m = l.match(/^const-string (\w+), (.*)$/))) { regs[m[1]] = JSON.parse(m[2]); continue; }
    if ((m = l.match(/^const(?:\/4|\/16) (\w+), (.*)$/))) { regs[m[1]] = Number(m[2]); continue; }
    if ((m = l.match(/^const-wide\/16 (\w+), (.*)$/))) { regs[m[1]] = Number(m[2]); continue; }
    if ((m = l.match(/^invoke-\S+ \{([^}]*)\}, (.*)$/))) {
      const args = m[1] ? m[1].split(', ').map(r => regs[r]) : [];
      const call = m[2];
      if (call.includes('NativeSessionGate;->canReconnect')) result = expired;
      else if (call.includes('NativeAccessRefusal;->prepare')) {
        const r = prepareStatus(args[1], {cookie, now, started: args[0].started, expired}, true);
        Object.assign(args[1], r.p1); args[0].started = r.p0.started; result = r.returnValue;
      }
      else if (call.includes('->optInt')) result = Number(args[0][args[1]]) || 0;
      else if (call.includes('->optBoolean')) result = args[0][args[1]] === true;
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
    if ((m = l.match(/^iput-wide (\w+), (\w+), .*nativeVerificationStart/))) { regs[m[2]].started = regs[m[1]]; continue; }
    if ((m = l.match(/^if-ne (\w+), (\w+), (:\w+)/))) { if (regs[m[1]] !== regs[m[2]]) pc = labels[m[3]]; continue; }
    if ((m = l.match(/^if-(eqz|nez|gez) (\w+), (:\w+)/))) { if (m[1] === 'eqz' ? !regs[m[2]] : m[1] === 'nez' ? !!regs[m[2]] : regs[m[2]] >= 0) pc = labels[m[3]]; continue; }
    if ((m = l.match(/^goto (:\w+)/))) { pc = labels[m[1]]; continue; }
    if ((m = l.match(/^return (\w+)$/))) { regs.returnValue = regs[m[1]]; return regs; }
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
  assert.doesNotMatch(timeout, /NativeHomeShelfRenderer;->render/,'legacy timer cannot replace the state-machine surface');
  assert.match(read('smali/com/melodix/music/NativeSessionGateTask.smali'), /presentation-deadline-not-expiration/);
});

test('navigation, guard, token outcome and bounded image observations survive one diagnostic copy', () => {
  const src = read('smali/com/melodix/music/NativeStartupTiming.smali');
  const literal = src.match(/const-string v0, "(\^sid=[^"\n]+)"/)[1];
  const rule = new RegExp(JSON.parse('"' + literal + '"'));
  for (const event of ['navigation source=redirect route=accounts', 'navigation source=history-reload route=player',
    'navigation source=button route=accounts', 'proof clear-accounts=F',
    'proof-native decision=blocked reason=unproven site=rows',
    'proof-guard decision=blocked reason=auth-required', 'token-http endpoint=api phase=end http=403 duration=23',
    'token-result status=ko-http403 duration=40', 'token-response endpoint=api generation=31 attempt=2 http=400 mime=json', 'image result=loaded', 'stage shell-asset-loaded']) {
    assert.ok(rule.test('sid=1234abcd t=1000 ' + event), event);
  }
  for (const event of ['navigation source=redirect route=https://private',
    'token-result status=TOKEN_SECRET duration=2', 'token-response endpoint=api generation=31 attempt=2 http=400 mime=SECRET', 'image result=https://private']) {
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


test('legacy refusal presentation requires central completed-expiry evidence', () => {
  for (const cookie of [false, true]) {
    const input = {kind:'state', state:'error', sessionUnproven:true, tokenApiHttp:400, tokenFallbackHttp:403};
    const r = prepareStatus(input, {cookie, now:20000, started:19000, expired:true});
    assert.equal(r.p1.title, 'Spotify refuse la demande d’accès (400/403)');
    assert.equal(r.p1.uri, 'melodix:action:retry-library');
    assert.equal(r.p1.secondaryUri, 'melodix:action:reconnect');
    assert.equal(r.p0.started, 0, 'old loading deadline is invalidated');
    assert.match(r.p1.subtitle, / \[auth=/, 'technical details use the collapsed disclosure');
  }
  for (const input of [{state:'loading', tokenApiHttp:400, tokenFallbackHttp:403},
    {state:'error', tokenApiHttp:200, tokenFallbackHttp:403},
    {state:'error', token:'ko-http403'}, {state:'error', tokenApiHttp:400}]) {
    assert.equal(prepareStatus(input, {cookie:true, now:20000}, true).returnValue, 0,
      'never invent a 400 from only the final 403 or stale/loading data');
  }
});

test('a 400/403 pair without correlated expiry cannot offer destructive recovery',()=>{
 const r=prepareStatus({state:'error',tokenApiHttp:400,tokenFallbackHttp:403},{cookie:true,now:20000},true);
 assert.equal(r.returnValue,0);assert.notEqual(r.p1.secondaryUri,'melodix:action:reconnect');
});
