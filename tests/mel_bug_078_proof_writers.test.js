const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');

const files = {
  bridge: read('smali/com/melodix/music/AndBridge.smali'),
  singleton: read('smali/com/melodix/music/AppSingleton.smali'),
  main: read('smali/com/melodix/music/MainActivity.smali'),
  web: read('smali/c91.smali'),
  logout: read('smali/y51.smali')
};

// Report vC=1103 was the first to identify itself, and it still read:
//   ensure warm proof (B true) ... route home (written AFTER the setNativeScreen
//   gate, so B true again) ... auth=false   gates=0/0/0
// The proof is true and false in the same run, and the journal could not say
// which writer did it or when. Every writer now names itself, and every refusal
// carries the value it was decided with.

test('MEL-BUG-078a: every writer of the session proof is journaled', () => {
  // MEL-BUG-080: the flip site only issues an argument-less invoke. All register
  // work happens in the helper — reusing the caller frame caused a VerifyError
  // and crashed two shipped builds.
  const writers = [
    ['bridge', 'proofSetBridgeLogin'],
    ['singleton', 'proofClearOncreate'],
    ['main', 'proofClearResume'],
    ['web', 'proofClearAccounts'],
    ['logout', 'proofClearLogout']
  ];
  for (const [key, helper] of writers) {
    assert.match(files[key], /AppSingleton;->B:Z/, key + ' : ecrit la preuve');
    assert.match(files[key], new RegExp('AppSingleton;->' + helper + '\\(Z\\)V'),
      key + ' : sa bascule passe par ' + helper);
    assert.match(files.singleton, new RegExp('\\.method public static ' + helper + '\\(Z\\)V'),
      key + ' : le helper existe');
  }
});

test('MEL-BUG-078b: a refusal carries the proof value it decided with', () => {
  // Without it, the header (`auth=`) and the journal (`route home`) contradict
  // each other for the same instant and neither can be trusted.
  const calls = files.main.split('\n').filter((l) => l.includes('AppSingleton;->noteDiagProof('));
  assert.equal(calls.length, 4, 'quatre refus (show-native, screen, route, rows)');
  for (const call of calls) {
    // The detail register is the one already computed (p1 or v3) — the helper
    // appends the proof word, so the caller needs no new register.
    assert.match(call, /invoke-static \{v\d+, v\d+, (p1|v3)\}/,
      'le detail du refus est passe tel quel');
  }
  const helper = files.singleton.slice(files.singleton.indexOf('.method public static noteDiagProof'));
  const body = helper.slice(0, helper.indexOf('.end method'));
  assert.match(body, /sget-boolean v\d+, Lcom\/melodix\/music\/AppSingleton;->B:Z/,
    'valeur lue en direct, pas recopiee');
  assert.match(body, /const-string v\d+, "\|auth"/, 'suffixe |auth');
  assert.match(body, /const-string v\d+, "T"/);
  assert.match(body, /const-string v\d+, "F"/);
});

test('MEL-BUG-078c: the trace stays copyable — no value, URL or cookie', () => {
  const labels = files.singleton.split('\n').filter((l) => l.includes('const-string v0, "set-') || l.includes('const-string v0, "clear-'));
  assert.ok(labels.length >= 7, 'un label par bascule, trouves: ' + labels.length);
  for (const line of labels) {
    assert.doesNotMatch(line, /https?:|sp_dc|getCookie|getUrl/, 'un label fixe seulement');
  }
  const allowed = /^(set|clear)-(bridge-login|oncreate|resume|resume-2|accounts|left-player|logout)$/;
  for (const line of labels) {
    const m = line.match(/"(set-[a-z-]+|clear-[a-z0-9-]+)"/);
    assert.ok(m && allowed.test(m[1]), 'label inconnu : ' + line.trim());
  }
});
