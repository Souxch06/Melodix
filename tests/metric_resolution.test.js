const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const src = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeUiRowFactory.smali'), 'utf8');
const method = (name) => {
  const m = new RegExp(`^\\.method[^\\n]*\\b${name}\\([^\\n]*\\n([\\s\\S]*?)^\\.end method`, 'm').exec(src);
  assert.ok(m, `${name} exists`);
  return m[1];
};

test('MEL-BUG-001: metric returns the resolved dimension, not the fallback, on success', () => {
  const body = method('metric');
  // The inverted guard discarded every successful lookup. if-gtz jumps when the
  // value is > 0, which is precisely the success case.
  assert.ok(!/if-gtz v\d+, :native_metric_fallback/.test(body),
    'a positive resolved pixel value must NOT branch to the fallback');
  const px = /getDimensionPixelSize\(I\)I\s+move-result (v\d+)/.exec(body);
  assert.ok(px, 'the resolved pixel size must be captured');
  assert.ok(new RegExp(`if-lez ${px[1]}, :native_metric_fallback`).test(body),
    'only a non-positive lookup may fall back');
  const success = body.slice(0, body.indexOf('\n    :native_metric_fallback\n'));
  assert.match(success, /return v\d+\s*$/, 'the success path returns the resolved value');
});

test('MEL-BUG-001: an unresolved name still falls back, and the fallback still converts dp', () => {
  const body = method('metric');
  assert.match(body, /getIdentifier\([^)]*\)I\s+move-result (v\d+)\s+if-eqz \1, :native_metric_fallback/,
    'a zero identifier must still fall back');
  const fallback = body.slice(body.indexOf('\n    :native_metric_fallback\n'));
  assert.match(fallback, /NativeUiRowFactory;->dp\(Landroid\/content\/Context;I\)I/,
    'the fallback must remain a dp conversion, not a raw number');
});

test('MEL-BUG-001: dp() keeps its own guard, which is correct in the other direction', () => {
  // Same opcode, opposite meaning: here the jump target is the READY label, so
  // jumping on a positive product is right. Confusing the two caused a wrong
  // first reading of this chain; the test pins both.
  const body = method('dp');
  assert.match(body, /float-to-int (v\d+), v\d+\s+if-gtz \1, :native_dp_ready/,
    'dp must keep the converted value when it is positive');
  const ready = body.slice(body.indexOf('\n    :native_dp_ready\n'));
  assert.match(ready, /return v\d+/, 'ready returns the value');
});

test('MEL-BUG-001: the tablet overrides are the values that must now reach the views', () => {
  const phone = fs.readFileSync(path.join(root, 'res/values/mel_dimens.xml'), 'utf8');
  const tablet = fs.readFileSync(path.join(root, 'res/values-sw600dp/mel_dimens.xml'), 'utf8');
  const val = (s, n) => {
    const m = new RegExp(`<dimen name="${n}">([\\d.]+)dip</dimen>`).exec(s);
    assert.ok(m, `${n} declared`);
    return Number(m[1]);
  };
  // These are the two measurements that exposed the bug.
  assert.equal(val(phone, 'mel_settings_row_height'), 64);
  assert.equal(val(tablet, 'mel_settings_row_height'), 76);
  assert.equal(val(phone, 'mel_status_max_width'), 560);
  assert.equal(val(tablet, 'mel_status_max_width'), 720);
  // The hardcoded fallbacks equal the PHONE tokens, which is why phone looked
  // correct and hid the defect on both profiles.
  assert.match(method('metric'), /native_metric_fallback/);
  const metrics = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeUiMetrics.smali'), 'utf8');
  const rowH = /\.method public static settingsRowHeight[\s\S]*?\.end method/.exec(metrics)[0];
  assert.match(rowH, /const\/16 v1, 0x40/, 'settingsRowHeight fallback is 64 = the phone token');
  const statusW = /\.method public static statusMaxWidth[\s\S]*?\.end method/.exec(metrics)[0];
  assert.match(statusW, /const\/16 v1, 0x230/, 'statusMaxWidth fallback is 560 = the phone token');
});
