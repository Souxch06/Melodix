const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');

// MEL-BUG-080. test.114 and test.115 crashed at launch:
//   java.lang.VerifyError: AppSingleton.onCreate(): register v1 has type
//   Reference: java.lang.String but expected Boolean
// The tracing reused v0/v1/v2 inside methods that already use them and sit in
// merge frames; a .catch frame also leaves Type=Throwable behind. The verifier
// rejects the WHOLE method, the process dies on start, and both UI-metric jobs
// failed with "the native shell was not measured within 180s".
//
// Rule enforced here: an instrumentation site is ONE instruction, an
// argument-less invoke that cannot disturb the frame. This is the gap that let
// two shipped APKs crash: the suite proved the gate logic and the labels, but
// never that the instrumentation was legal smali.

const SITES = [
  'smali/com/melodix/music/AndBridge.smali',
  'smali/com/melodix/music/AppSingleton.smali',
  'smali/com/melodix/music/MainActivity.smali',
  'smali/c91.smali',
  'smali/y51.smali'
];

const isComment = (l) => l.trim().startsWith('#');
const isBlank = (l) => l.trim() === '';
const READERS = ['sget-boolean', 'sget-object', 'iget-boolean', 'iget-object'];
const INVOKE = 'Lcom/melodix/music/AppSingleton;->proof';

test('MEL-BUG-080a: each instrumentation site is exactly ONE instruction', () => {
  let total = 0;
  for (const file of SITES) {
    const lines = read(file).split('\n');
    let found = 0;
    for (let i = 0; i < lines.length; i += 1) {
      if (lines[i].includes('AppSingleton;->proofClearAccounts(Z)V')) {
        assert.match(lines[i - 1], /sput-boolean v2, .*AppSingleton;->B:Z/,
          'accounts trace reads the value AFTER the store with no extra register write');
        found += 1;
        continue;
      }
      if (!(isComment(lines[i]) && lines[i].includes('MEL-BUG-080'))) continue;
      if (!lines.slice(i + 1, i + 20).join('\n').includes(INVOKE)) continue;
      found += 1;
      let k = i + 1;
      while (k < lines.length && (isBlank(lines[k]) || isComment(lines[k]))) k += 1;
      // MEL-BUG-081: the site may read ONE register first (the value being
      // stored) and then invoke the helper. A READ cannot invalidate a frame:
      // MEL-BUG-080 was caused by WRITING registers, so reads are allowed and
      // writes are not. Any other instruction before the invoke is a failure.
      if (READERS.some((r) => lines[k].trim().startsWith(r))) {
        k += 1;
        while (k < lines.length && (isBlank(lines[k]) || isComment(lines[k]))) k += 1;
      }
      const site = lines[k].trim();
      assert.ok(site.startsWith('invoke-static {') && site.includes(INVOKE) && site.endsWith('(Z)V'),
        file + ' : le site est un seul appel, vu: ' + site);
      let m = k + 1;
      while (m < lines.length && (isBlank(lines[m]) || isComment(lines[m]))) m += 1;
      const next = lines[m];
      assert.ok(!next.includes('proofTrace') && !next.includes('noteDiagProof') && !next.includes('const-string'),
        file + ' : aucune seconde instruction instrumentee, vu: ' + next.trim());
    }
    assert.ok(found >= 1, file + ' : au moins un site de trace');
    total += found;
  }
  assert.equal(total, 7, 'sept bascules instrumentees (un label par site), trouvees: ' + total);
});

test('MEL-BUG-080b: the helpers own every register they use', () => {
  const src = read('smali/com/melodix/music/AppSingleton.smali');
  const parts = src.split('.method public static ');
  const helpers = parts
    .filter((p) => p.startsWith('proof') || p.startsWith('noteDiagProof'))
    .map((p) => '.method public static ' + p.slice(0, p.indexOf('.end method')));
  assert.ok(helpers.length >= 9, 'trace + un par label + le helper de refus, trouves: ' + helpers.length);
  for (const block of helpers) {
    const name = block.split('(')[0].replace('.method public static ', '').trim();
    const lm = block.split('\n').find((l) => l.trim().startsWith('.locals'));
    assert.ok(lm, name + ' : .locals declare');
    const locals = Number(lm.trim().split(' ')[1]);
    const used = (block.match(/\bv\d+\b/g) || []).map((r) => Number(r.slice(1)));
    const max = used.length ? Math.max(...used) : 0;
    assert.ok(max < locals, name + ' : tout registre utilise est declare (.locals ' + locals + ', max v' + max + ')');
    assert.ok(!block.includes(':try_start') || block.includes('.catch'), name + ' : tout try a son catch');
  }
});

test('MEL-BUG-080c: a refusal never clobbers the register it reports', () => {
  const src = read('smali/com/melodix/music/MainActivity.smali');
  const calls = src.split('\n').filter((l) => l.includes('AppSingleton;->noteDiagProof('));
  assert.equal(calls.length, 4, 'quatre refus passes au helper, trouves: ' + calls.length);
  for (const call of calls) {
    assert.ok(call.trim().startsWith('invoke-static {v'), 'le detail vient d un registre existant: ' + call.trim());
  }
});

test('MEL-BUG-080d: no parameter is written as a String then used as a boolean', () => {
  // The original bug in one line, in AndBridge.loginDetected:
  //   const/4 p0, 0x0 / invoke-static {v0, v1, p0} ... noteDiag(String...)
  // which turned the parameter into a String and then used it as a flag.
  for (const file of SITES) {
    const lines = read(file).split('\n');
    for (let i = 0; i < lines.length - 1; i += 1) {
      if (!lines[i].trim().startsWith('const/4 p0,')) continue;
      const after = lines.slice(i + 1, i + 4).join('\n');
      assert.ok(!(after.includes('noteDiag') && after.includes('p0')),
        file + ' ligne ' + (i + 1) + ' : p0 ecrit en String puis utilise comme booleen');
    }
  }
});
