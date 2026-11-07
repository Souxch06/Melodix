const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');

// MEL-BUG-027: browse_tiles.test.js used to inject a probe token by mutating
// the shared res/values/mel_dimens.xml in place. node --test runs test files
// in parallel, so mel_design_system.test.js could read the file mid-probe and
// fail with a bogus unit (observed as a flaky CI failure on an unchanged
// commit). Rule: a test must never write into the compiled resource tree.
test('no test mutates res/ or smali/ in place (parallel-safe suite)', () => {
  const offenders = [];
  for (const file of fs.readdirSync(__dirname).filter((f) => f.endsWith('.test.js'))) {
    const src = fs.readFileSync(path.join(__dirname, file), 'utf8');
    for (const m of src.matchAll(/writeFileSync\(([^)]*)\)/g)) {
      const arg = m[1];
      // Allowed: paths that resolve into os.tmpdir()/mkdtemp dirs or
      // explicit copies (resCopy under a tmp dir), never the repo resource tree.
      if (/['"`](?:res|smali)[/'"]|['"]res\/|path\.join\(root, 'res|path\.join\(root, 'smali/.test(arg)) {
        offenders.push(`${file}: writeFileSync(${arg.trim().slice(0, 80)})`);
      }
    }
  }
  assert.deepEqual(offenders, [], 'tests must write only to temp copies, never into res/ or smali/');
});

test('ui_metrics_measure.py supports a dimens-dir override so probes use copies', () => {
  const src = fs.readFileSync(path.join(root, 'scripts/ui_metrics_measure.py'), 'utf8');
  assert.match(src, /MELODIX_DIMENS_DIR/, 'the probe must be redirectable to a copied res/ dir');
});

// MEL-BUG-023 (expérience utilisateur): a signature change makes Android refuse
// the update ("Package en conflit"). The repo README and the publish script must
// always carry the uninstall-first instructions so testers are never stuck.
test('MEL-BUG-023: uninstall-first instructions are documented in releases/README.md and the publish script', () => {
  const readme = fs.readFileSync(path.join(root, 'releases/README.md'), 'utf8');
  assert.match(readme, /Package en conflit/);
  assert.match(readme, /adb uninstall com\.melodix\.music/);
  const script = fs.readFileSync(path.join(root, 'scripts/publish_preview_release.sh'), 'utf8');
  assert.match(script, /adb uninstall com\.melodix\.music/);
});
