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
//   ensure warm proof   (B true)   ...   route home   (written AFTER the
//   setNativeScreen gate, so B true again)   ...   auth=false   gates=0/0/0
// The proof is true and false in the same run and the journal could not say
// which writer did it or when. Every writer now names itself.

test('MEL-BUG-078a: every writer of the session proof is journaled', () => {
  const writers = [
    ['bridge', 'bridge:loginDetected'],
    ['singleton', 'AppSingleton.onCreate'],
    ['main', 'MainActivity.onResume'],
    ['web', 'c91.onPageFinished'],
    ['logout', 'settings logout']
  ];
  for (const [key, name] of writers) {
    assert.match(files[key], /AppSingleton;->B:Z/,
      name + ' : ecrit la preuve');
    // The bridge keeps its own wording ("set bridge-login"), the others use
    // "set-…" / "clear-…"; what matters is that the flip is journaled.
    assert.match(files[key], /const-string v\d+, "(set|clear)[ -]/,
      name + ' : son ecriture est journalisee avec un label fixe');
  }
  // Every journaled flip goes through noteDiag — the journal the user copies.
  for (const src of Object.values(files)) {
    const labels = src.match(/const-string v\d+, "(?:set|clear)-[a-z0-9-]+"/g) || [];
    for (const _ of labels) {
      assert.ok(/noteDiag\(/.test(src), 'les labels partent dans noteDiag');
    }
  }
});

test('MEL-BUG-078b: a refusal carries the proof value it decided with', () => {
  // Without it, the journal and the `auth=` header can contradict each other for
  // the same instant and neither can be trusted.
  for (const marker of ['show-native', '"route"', 'const-string v2, "screen"']) {
    assert.ok(files.main.includes(marker), marker + ' present');
  }
  // Four refusals: show-native, screen, route and rows. The rows one was
  // missing from the first pass and the test caught it.
  const refusals = files.main.match(/const-string v\d+, "dropped-unproven"[\s\S]{0,900}?noteDiag\(/g) || [];
  assert.equal(refusals.length, 4, 'quatre refus (show-native, screen, route, rows)');
  for (const block of refusals) {
    assert.match(block, /const-string v\d+, "auth[FT]"/,
      'le refus porte la valeur de preuve au moment de la decision');
    assert.match(block, /sget-boolean v\d+, Lcom\/melodix\/music\/AppSingleton;->B:Z/,
      'valeur lue en direct, pas recopiee');
  }
});

test('MEL-BUG-078c: the trace stays copyable — no value, URL or cookie', () => {
  for (const src of Object.values(files)) {
    const labels = src.split('\n').filter((l) => /const-string v\d+, "(?:set|clear)-/.test(l));
    for (const line of labels) {
      assert.doesNotMatch(line, /https?:|sp_dc|getCookie|getUrl/,
        'un label fixe seulement');
    }
  }
  // The journaled words are a fixed vocabulary.
  const allowed = /^(set|clear)[ -](bridge-login|oncreate|resume|resume-2|accounts|left-player|logout)$/;
  for (const src of Object.values(files)) {
    for (const m of src.matchAll(/const-string v\d+, "((?:set|clear)[ -][a-z0-9-]+)"/g)) {
      assert.match(m[1], allowed, 'label inconnu : ' + m[1]);
    }
  }
});
