const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');
const grid = read('smali/com/melodix/music/NativeShortcutGrid.smali');
const listener = read('smali/com/melodix/music/NativeShortcutClickListener.smali');

test('the shortcut grid passes the register checker that catches both past VerifyErrors', () => {
  const files = ['NativeShortcutGrid', 'NativeShortcutClickListener', 'NativeHomeShelfRenderer']
    .map((n) => `smali/com/melodix/music/${n}.smali`);
  execFileSync('python3', ['scripts/smali_register_check.py', ...files], { cwd: root, encoding: 'utf8' });
});

test('the register checker itself detects an object register overwritten before first use', () => {
  // Mutation-proof: the checker must fail on the exact MEL-BUG-012 shape.
  const probe = path.join(root, 'smali/com/melodix/music/NativeRowGeometryProbe.smali');
  const original = fs.readFileSync(probe, 'utf8');
  const broken = original.replace(
    '    move-result-object v1\n    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()',
    '    move-result-object v1\n    const-string v1, " pkg="\n    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()');
  assert.notEqual(broken, original, 'mutation must apply');
  const tmp = path.join(root, 'smali/com/melodix/music/__mut_check.smali');
  try {
    fs.writeFileSync(tmp, broken);
    assert.throws(() => execFileSync('python3',
      ['scripts/smali_register_check.py', 'smali/com/melodix/music/__mut_check.smali'],
      { cwd: root, encoding: 'utf8', stdio: 'pipe' }), 'the checker must reject it');
  } finally { fs.unlinkSync(tmp); }
});

test('every tile calls a handler that exists and is already verified on device', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  for (const h of ['onNativeSearchClick', 'onNativeLibraryClick', 'onNativeSettingsClick']) {
    assert.ok(listener.includes(`->${h}(Landroid/view/View;)V`), `listener must call ${h}`);
    assert.ok(new RegExp(`^\\.method public final ${h}\\(Landroid/view/View;\\)V`, 'm').test(activity),
      `${h} must exist on the activity`);
  }
  assert.ok(listener.includes('.catch Ljava/lang/Throwable;'), 'a click must never crash the shell');
});

test('no music data is invented and no protected mechanism is touched', () => {
  // Comments legitimately explain what is NOT touched; only code is checked.
  const code = (src) => src.replace(/#.*$/gm, '');
  const gridCode = code(grid);
  const listenerCode = code(listener);
  for (const forbidden of ['__sf', 'MediaSession', 'WebView', 'evaluateJavascript', 'SharedPreferences',
    'getToken', 'playlist', 'album', 'setPlayback', 'runNativeJavascript']) {
    assert.ok(!gridCode.includes(forbidden), `the grid must not touch ${forbidden}`);
    assert.ok(!listenerCode.includes(forbidden), `the listener must not touch ${forbidden}`);
  }
});

test('tablet gets a different composition, not an enlarged phone tile', () => {
  // Phone stacks the icon above the label (gravity centre, drawableTop); tablet
  // places it beside the label (gravity start|centre_vertical, drawableLeft).
  assert.match(grid, /Configuration;->smallestScreenWidthDp:I/);
  assert.match(grid, /const\/16 v\d+, 0x258/, 'the 600dp breakpoint must match the resource qualifier');
  assert.match(grid, /:tile_gravity_phone/);
  assert.match(grid, /:tile_icon_top/);
  const phoneGravity = grid.slice(grid.indexOf(':tile_gravity_phone'));
  assert.match(phoneGravity, /const\/(4|16) v\d+, 0x11/, 'phone centres the stacked tile');
  assert.match(grid, /const\/(4|16) v\d+, 0x13/, 'tablet aligns the icon beside the label');
});

test('dimensions come from tokens, and icons and colours resolve by name', () => {
  for (const token of ['mel_gutter', 'mel_quick_gap', 'mel_quick_radius', 'mel_gutter_half', 'mel_row_title']) {
    assert.ok(grid.includes(`"${token}"`), `${token} must be read, not hardcoded`);
  }
  // Drawables and colours are not pinned in public.xml, so a hardcoded id would
  // be fragile across rebuilds; getIdentifier is the proven path.
  assert.match(grid, /Resources;->getIdentifier\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)I/);
  assert.ok(!/const v\d+, 0x7f0[0-9a-f]{5}/.test(grid), 'no hardcoded resource ids');
});

test('the grid is added only on the signed-out branch, leaving an authenticated home alone', () => {
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const at = renderer.indexOf('NativeShortcutGrid;->render');
  assert.ok(at > 0, 'the grid must be wired in');
  const before = renderer.slice(0, at);
  assert.ok(before.includes('->renderHomeStatus('), 'it must follow the status render');
  assert.ok(before.includes('if-eqz v3, :shelf_no_cards'), 'and only when a status card was attached');
  assert.ok(at < renderer.indexOf('\n    :shelf_render_spotify_rows\n'),
    'it must not be on the authenticated rows branch');
  assert.equal([...renderer.matchAll(/NativeShortcutGrid;->render/g)].length, 1, 'one call site');
});
