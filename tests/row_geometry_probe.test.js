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
  assert.ok(/for f in crash\.txt app-log\.txt foreground\.txt row-geometry\.txt; do/.test(wf),
    'an uncollected evidence file is not evidence');
});
