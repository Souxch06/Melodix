const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (rel) => fs.readFileSync(path.join(root, rel), 'utf8');
const runnable = read('smali/com/melodix/music/NativeRowGeometryRunnable.smali');
const probe = read('smali/com/melodix/music/NativeRowGeometryProbe.smali');
const activity = read('smali/com/melodix/music/MainActivity.smali');

test('the geometry probe reads every value the diagnosis needs', () => {
  for (const getter of ['getMinimumHeight', 'getMeasuredHeight', 'getHeight', 'getWidth',
    'getPaddingTop', 'getPaddingBottom', 'getLayoutParams', 'getParent']) {
    assert.ok(runnable.includes(`->${getter}(`), `must read ${getter}`);
  }
  assert.ok(runnable.includes('->tokenPx:I'), 'must report the resolved token in pixels');
  assert.ok(runnable.includes('DisplayMetrics;->density:F'), 'must report density for dp conversion');
  assert.ok(runnable.includes('MarginLayoutParams;->leftMargin:I'), 'must report applied margins');
});

test('tokenPx is read as a field, never invoked as a method', () => {
  // A field invoked as a method is a VerifyError, the MEL-BUG-007 failure mode.
  assert.ok(!/->tokenPx\(\)/.test(runnable), 'tokenPx is a field');
  assert.match(runnable, /iget v\d+, p0, Lcom\/melodix\/music\/NativeRowGeometryRunnable;->tokenPx:I/);
});

test('getChildCount is reached only after a guarded ViewGroup cast', () => {
  // The view field is typed View; calling a ViewGroup method on it without a
  // cast fails verification and takes the whole activity down.
  const at = runnable.indexOf('->getChildCount()I');
  assert.ok(at > 0, 'must count children');
  const before = runnable.slice(0, at);
  assert.match(before,
    /instance-of v\d+, v1, Landroid\/view\/ViewGroup;\s+if-eqz v\d+, :geom_children_none\s+check-cast v1, Landroid\/view\/ViewGroup;/,
    'the cast must be guarded by instance-of and precede the call');
});

test('the probe never writes geometry and cannot throw into the caller', () => {
  for (const forbidden of ['setMinimumHeight', 'setLayoutParams', 'setPadding', 'setVisibility', 'requestLayout']) {
    assert.ok(!runnable.includes(`->${forbidden}(`), `diagnostic must not call ${forbidden}`);
    assert.ok(!probe.includes(`->${forbidden}(`), `attach must not call ${forbidden}`);
  }
  assert.ok(runnable.includes('.catch Ljava/lang/Throwable;'), 'run must be guarded');
  assert.ok(probe.includes('.catch Ljava/lang/Throwable;'), 'attach must be guarded');
});

test('an unresolved token is visible, not silently replaced by a plausible default', () => {
  // metric(..., -1) makes a missing resource name read as -1 instead of looking
  // like a legitimate 64dp fallback.
  assert.match(probe, /const\/4 v\d+, -0x1\s+invoke-static \{p0, p2, v\d+\}, Lcom\/melodix\/music\/NativeUiRowFactory;->metric/);
});

test('both row factories are probed, so a shared cause can be told from a local one', () => {
  const calls = [...activity.matchAll(/NativeRowGeometryProbe;->attach/g)];
  assert.equal(calls.length, 2, 'settings rows and content rows must both be instrumented');
  assert.ok(activity.includes('const-string v1, "mel_settings_row_height"'));
  assert.ok(activity.includes('const-string v1, "mel_row_height"'));
});

test('the probe does not clobber the render loop counter', () => {
  // The loop increments v5; the probe uses v1, which is scratch at that point.
  const inc = activity.slice(activity.indexOf('\n    :native_row_increment\n'));
  assert.match(inc, /add-int\/lit8 v5, v5, 0x1/, 'loop counter must stay v5');
  const at = activity.indexOf('NativeRowGeometryProbe;->attach');
  const around = activity.slice(at - 400, at + 200);
  assert.ok(!/add-int\/lit8 v1/.test(around), 'v1 must not be the counter');
});

test('the walk collects the geometry log and CI publishes it', () => {
  const walk = read('scripts/ui_qa_walk.sh');
  assert.ok(walk.includes('MelRowGeom: ') && walk.includes('row-geometry.txt'),
    'the walk must capture the probe output');
  const wf = read('.github/workflows/ui-qa.yml');
  // Assert each required file is published, not an exact list: the list grows as
  // probes are added, and rewriting this assertion every time is churn.
  const loop = /for f in ([^;]+); do/.exec(wf);
  assert.ok(loop, 'the publish loop must exist');
  const published = loop[1].split(/\s+/);
  for (const f of ['crash.txt', 'app-log.txt', 'foreground.txt', 'foreground-after-stress.txt',
    'row-geometry.txt', 'row-identity.txt', 'shortcut-diag.txt', 'empty-state-diag.txt']) {
    assert.ok(published.includes(f), `${f} must be published: an uncollected file is not evidence`);
  }
});

test('the identity read reports the package and two witnesses, not just the failing name', () => {
  const probeSrc = read('smali/com/melodix/music/NativeRowGeometryProbe.smali');
  assert.ok(probeSrc.includes('->getPackageName()'), 'must report the package used for lookup');
  assert.ok(probeSrc.includes('"mel_settings_pad_h"'), 'needs a sibling token as witness');
  assert.ok(probeSrc.includes('"status_bar_height"'), 'needs a framework token to tell a broken lookup from a missing name');
  assert.ok(read('scripts/ui_qa_walk.sh').includes('MelRowId: '), 'the walk must capture it');
});

test('no probe method overwrites an object register with a string before its last use', () => {
  // This is the MEL-BUG-007 failure mode, and it bit this very probe once: a
  // helper emitted `const-string v1` while v1 held Resources, so the next
  // Resources call failed verification and the activity never loaded. The walk
  // showed visible_ids=5 then 0 and no native shell at all.
  const sources = {
    probe: read('smali/com/melodix/music/NativeRowGeometryProbe.smali'),
    runnable: read('smali/com/melodix/music/NativeRowGeometryRunnable.smali'),
  };
  for (const [name, src] of Object.entries(sources)) {
    for (const m of src.matchAll(/^\.method[^\n]*\n([\s\S]*?)^\.end method/gm)) {
      const body = m[1];
      // Every register that receives an object from a typed getter.
      for (const hold of body.matchAll(/invoke-virtual \{[^}]*\}, (L[\w/$]+;)->(\w+)\(\)(L[\w/$]+;)\s+move-result-object (v\d+)/g)) {
        const [, owner, getter, type, reg] = hold;
        if (type === 'Ljava/lang/String;' || type === 'Ljava/lang/Class;') continue;
        const after = body.slice(hold.index + hold[0].length);
        // Only calls ON the held type count as uses. A register legitimately
        // reused for something else afterwards (a log tag, say) is not a clobber.
        const esc = type.replace(/[$]/g, '\\$');
        const uses = [...after.matchAll(
          new RegExp(`invoke-\\w+ \\{${reg}[,}][^\\n]*${esc}->`, 'g'))];
        if (!uses.length) continue;
        const lastUse = uses[uses.length - 1].index;
        const window = after.slice(0, lastUse);
        const clobber = new RegExp(`(const-string ${reg},|move-result ${reg}\\s|const/4 ${reg},|const ${reg},)`);
        assert.ok(!clobber.test(window),
          `${name}: ${reg} holds ${type} from ${owner}->${getter} but is overwritten before its last use`);
      }
    }
  }
});

test('every parameter register referenced exists in the method signature', () => {
  // Second self-inflicted regression: logIdentity takes (Context, String) so it
  // has p0 and p1 only, but its body was copied from a three-argument method and
  // referenced p2. That is a VerifyError, and it took the app down exactly when
  // the settings screen was opened, while home/library/search still worked.
  const sources = {
    probe: read('smali/com/melodix/music/NativeRowGeometryProbe.smali'),
    runnable: read('smali/com/melodix/music/NativeRowGeometryRunnable.smali'),
  };
  for (const [name, src] of Object.entries(sources)) {
    for (const m of src.matchAll(/^\.method([^\n]*)\n([\s\S]*?)^\.end method/gm)) {
      const [, header, body] = m;
      const sig = /\.method[^(]*\(([^)]*)\)/.exec(`.method${header}`);
      const args = sig && sig[1] ? sig[1].split(';').filter((x) => x.trim()).length : 0;
      const isStatic = /\bstatic\b/.test(header);
      const count = args + (isStatic ? 0 : 1);
      const locals = Number(/\.locals (\d+)/.exec(body)[1]);
      for (const ref of body.matchAll(/\bp(\d+)\b/g)) {
        assert.ok(Number(ref[1]) < count,
          `${name}: p${ref[1]} referenced but the method declares only ${count} parameter register(s)`);
      }
      for (const ref of body.matchAll(/\bv(\d+)\b/g)) {
        assert.ok(Number(ref[1]) < locals,
          `${name}: v${ref[1]} referenced but .locals is ${locals}`);
      }
      assert.ok(locals + count <= 16, `${name}: too many registers for a non-range invoke`);
    }
  }
});
