const test = require('node:test');
const assert = require('node:assert');
const { execFileSync } = require('node:child_process');
const path = require('node:path');
const root = path.join(__dirname, '..');

// MEL-BUG-080 and MEL-BUG-082 were both register TYPE errors that aapt2/apktool
// compiled without complaint. Only the Dalvik verifier rejected them, at
// runtime, on a device: "run 42521531070: the native shell was not measured".
// Compiling proves nothing here, so the types are checked statically.

test('MEL-BUG-082: the instrumented helpers are type-consistent', () => {
  const out = execFileSync('python3',
    [path.join(root, 'scripts/smali_typecheck.py'),
     path.join(root, 'smali/com/melodix/music/AppSingleton.smali')],
    { encoding: 'utf8' });
  assert.match(out, /erreurs de type: 0/, out.trim());
  assert.match(out, /methodes verifiees: (9|1\d)/, 'les helpers sont couverts');
});

test('MEL-BUG-082b: a builder is never passed where a String is required', () => {
  const fs = require('node:fs');
  const src = fs.readFileSync(path.join(root, 'smali/com/melodix/music/AppSingleton.smali'), 'utf8');
  // The exact shape that crashed: toString() result in v2, then v0 (the still
  // live StringBuilder) handed to noteDiag as the 3rd String argument.
  const bad = /toString\(\)Ljava\/lang\/String;[\s\S]{0,200}?invoke-static \{[^}]*v0\}[^}]*noteDiag/;
  assert.ok(!bad.test(src), 'aucun StringBuilder passe a noteDiag');
});
