const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const root = path.join(__dirname, '..');
const AUTHORED = ['NativeShortcutGrid', 'NativeShortcutClickListener', 'NativeEmptyState',
  'NativeRowGeometryProbe', 'NativeRowGeometryRunnable', 'NativeRowInsets',
  'NativeHomeShelfRenderer', 'NativeUiRowFactory', 'NativeSettingsRowFactory'];
// Scoped to the human-readable Native* sources. The obfuscated library classes
// use forms this parser does not model, and flagging them would be noise.
const files = fs.readdirSync(path.join(root, 'smali/com/melodix/music'))
  .filter((f) => f.startsWith('Native') && f.endsWith('.smali'))
  .map((f) => `smali/com/melodix/music/${f}`);
const runCheck = (args) => execFileSync('python3', ['scripts/smali_register_check.py', ...args],
  { cwd: root, encoding: 'utf8', stdio: 'pipe' });

test('every native smali source passes the register checker', () => {
  runCheck(files);
});

test('the checker rejects all three real VerifyErrors this chantier produced', () => {
  // Each of these shipped once and took the activity down. The checker must fail
  // on every one, otherwise it is decoration.
  const cases = [
    ['smali/com/melodix/music/NativeRowGeometryProbe.smali', (t) => t.replace(
      '    move-result-object v1\n    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()',
      '    move-result-object v1\n    const-string v1, " pkg="\n    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()')],
    ['smali/com/melodix/music/NativeRowGeometryProbe.smali', (t) => t.replace(
      'invoke-virtual {v0, p1}', 'invoke-virtual {v0, p2}')],
    ['smali/com/melodix/music/NativeEmptyState.smali', (t) => t.replace(
      '    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V\n    iput v1, v2,',
      '    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V\n    const-string v2, "x"\n    iput v1, v2,')],
  ];
  const tmp = 'smali/com/melodix/music/__mut_check.smali';
  const tmpPath = path.join(root, tmp);
  try {
    cases.forEach(([rel, mutate], i) => {
      const original = fs.readFileSync(path.join(root, rel), 'utf8');
      const broken = mutate(original);
      assert.notEqual(broken, original, `mutation ${i} must apply`);
      fs.writeFileSync(tmpPath, broken);
      assert.throws(() => runCheck([tmp]), `case ${i} must be rejected`);
    });
  } finally { if (fs.existsSync(tmpPath)) fs.unlinkSync(tmpPath); }
});

test('a String used as a String is not a false positive', () => {
  const tmp = 'smali/com/melodix/music/__mut_ok.smali';
  const tmpPath = path.join(root, tmp);
  const ok = `.class public final Lcom/melodix/music/__mut_ok;
.super Ljava/lang/Object;
.method public static f()I
    .locals 2
    const-string v0, "abc"
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    return v1
.end method
`;
  try {
    fs.writeFileSync(tmpPath, ok);
    runCheck([tmp]);
  } finally { fs.unlinkSync(tmpPath); }
});

const NATIVE = fs.readdirSync(path.join(root, 'smali/com/melodix/music'))
  .filter((f) => f.startsWith('Native') && f.endsWith('.smali'))
  .map((f) => `smali/com/melodix/music/${f}`);

test('every native smali invoke matches a real Android signature', () => {
  // apktool does not resolve method references, so a wrong arity assembles cleanly
  // and only fails on the device. Drawable.setBounds(II)V shipped twice that way
  // and rejected both classes at load time.
  execFileSync('python3', ['scripts/android_signature_check.py', ...NATIVE],
    { cwd: root, encoding: 'utf8', stdio: 'pipe' });
});

test('the signature checker rejects the setBounds arity that broke two screens', () => {
  const tmp = 'smali/com/melodix/music/__mut_sig.smali';
  const tmpPath = path.join(root, tmp);
  const src = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeEmptyState.smali'), 'utf8');
  const broken = src.replace('setBounds(IIII)V', 'setBounds(II)V');
  assert.notEqual(broken, src);
  try {
    fs.writeFileSync(tmpPath, broken);
    assert.throws(() => execFileSync('python3', ['scripts/android_signature_check.py', tmp],
      { cwd: root, encoding: 'utf8', stdio: 'pipe' }));
  } finally { fs.unlinkSync(tmpPath); }
});

test('the walk collects crash evidence on every run, not only when startup fails', () => {
  const walk = fs.readFileSync(path.join(root, 'scripts/ui_qa_walk.sh'), 'utf8');
  const tail = walk.slice(walk.indexOf('# ---- 1. Home'));
  assert.match(tail, /logcat -d -b crash[^\n]*> "\$out\/crash\.txt"/,
    'crash.txt must be collected after the walk too: run 42057787244 died mid-walk and produced none');
  assert.match(tail, /VerifyError/, 'the app log must capture verification failures');
});

test('the checker rejects a catch handler returning a register the try assigns', () => {
  // The actual VerifyError from run 42060738823: "[0xE1] returning undefined
  // register". ART verifies a handler against registers live at try entry.
  const tmp = 'smali/com/melodix/music/__mut_handler.smali';
  const tmpPath = path.join(root, tmp);
  const src = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeEmptyState.smali'), 'utf8');
  const broken = src.replace(
    `    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    :try_start_empty`,
    `    :try_start_empty
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V`);
  assert.notEqual(broken, src);
  try {
    fs.writeFileSync(tmpPath, broken);
    assert.throws(() => runCheck([tmp]));
  } finally { fs.unlinkSync(tmpPath); }
});

test('a handler that assigns its own fallback return value is not flagged', () => {
  const tmp = 'smali/com/melodix/music/__mut_handler_ok.smali';
  const tmpPath = path.join(root, tmp);
  const ok = `.class public final Lcom/melodix/music/__mut_handler_ok;
.super Ljava/lang/Object;
.method public static f(Landroid/content/Context;)I
    .locals 3
    :try_start_x
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1
    :try_end_x
    .catch Ljava/lang/Throwable; {:try_start_x .. :try_end_x} :catch_x
    return v1
    :catch_x
    move-exception v0
    const/4 v1, 0x0
    return v1
.end method
`;
  try {
    fs.writeFileSync(tmpPath, ok);
    runCheck([tmp]);
  } finally { fs.unlinkSync(tmpPath); }
});
