const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const root = path.join(__dirname, '..');
const AUTHORED = ['NativeShortcutGrid', 'NativeShortcutClickListener', 'NativeEmptyState',
  'NativeRowGeometryProbe', 'NativeRowGeometryRunnable', 'NativeRowInsets',
  'NativeHomeShelfRenderer', 'NativeUiRowFactory', 'NativeSettingsRowFactory'];
const files = AUTHORED.map((n) => `smali/com/melodix/music/${n}.smali`);
const runCheck = (args) => execFileSync('python3', ['scripts/smali_register_check.py', ...args],
  { cwd: root, encoding: 'utf8', stdio: 'pipe' });

test('every smali file authored in this chantier passes the register checker', () => {
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
