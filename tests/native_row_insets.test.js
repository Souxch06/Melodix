const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');
const insets = read('smali/com/melodix/music/NativeRowInsets.smali');
const activity = read('smali/com/melodix/music/MainActivity.smali');

test('MEL-BUG-014: rows get the gutter token as horizontal margins, not a hardcoded value', () => {
  assert.match(insets, /const-string v\d+, "mel_gutter"/);
  assert.match(insets, /NativeUiRowFactory;->metric\(Landroid\/content\/Context;Ljava\/lang\/String;I\)I/);
  assert.match(insets, /iput v0, v1, Landroid\/view\/ViewGroup\$MarginLayoutParams;->leftMargin:I/);
  assert.match(insets, /iput v0, v1, Landroid\/view\/ViewGroup\$MarginLayoutParams;->rightMargin:I/);
});

test('MEL-BUG-014: the row keeps MATCH_PARENT width and WRAP_CONTENT height', () => {
  // Changing height here would fight the minimum-height fix; only margins move.
  assert.match(insets, /const\/4 v2, -0x1\s+const\/4 p0, -0x2\s+invoke-direct \{v1, v2, p0\}, Landroid\/widget\/LinearLayout\$LayoutParams;-><init>\(II\)V/);
  assert.ok(!insets.includes('setMinimumHeight'), 'must not touch the row minimum');
});

test('MEL-BUG-014: applied at the shared add site, so it is one cause and not per-component exceptions', () => {
  const at = activity.indexOf('\n    :native_row_created\n');
  assert.ok(at > 0);
  const block = activity.slice(at, activity.indexOf('addView(Landroid/view/View;)V', at));
  assert.ok(block.includes('NativeRowInsets;->apply(Landroid/content/Context;Landroid/view/View;)V'),
    'the inset must be applied before addView, on the shared path');
  assert.equal([...activity.matchAll(/NativeRowInsets;->apply/g)].length, 1,
    'exactly one call site: settings rows and content rows share it');
});

test('MEL-BUG-014: the shared container is NOT padded, which would double the home gutter', () => {
  // nativeContent is full width on both home and settings; the home renderer
  // already insets its own children. Padding the container would inset home twice.
  for (const f of ['res/layout/activity_main.xml', 'res/layout-sw600dp/activity_main.xml']) {
    const xml = read(f);
    const i = xml.indexOf('android:id="@id/nativeContent"');
    const el = xml.slice(xml.lastIndexOf('<', i), xml.indexOf('>', i));
    for (const pad of ['paddingLeft', 'paddingRight', 'paddingStart', 'paddingEnd', 'paddingHorizontal']) {
      assert.ok(!el.includes(pad), `${f}: nativeContent must not gain ${pad}`);
    }
  }
});

test('MEL-BUG-014: the helper cannot throw into the render loop and stays in register range', () => {
  assert.ok(insets.includes('.catch Ljava/lang/Throwable;'));
  const body = /\.method public static apply[\s\S]*?\.end method/.exec(insets)[0];
  const locals = Number(/\.locals (\d+)/.exec(body)[1]);
  for (const r of body.matchAll(/\bv(\d+)\b/g)) assert.ok(Number(r[1]) < locals);
  for (const r of body.matchAll(/\bp(\d+)\b/g)) assert.ok(Number(r[1]) < 2, 'apply has two parameters');
  assert.ok(locals + 2 <= 16);
});
