const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(repo, f), 'utf8');

// MEL-BUG-037: the Settings screen must never sit empty — the native timeout
// fallback fires in 2 s and always renders real local sections.
test('MEL-BUG-037: settings timeout is 2 s and the fallback carries real local sections', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const begin = activity.slice(activity.indexOf('method public final beginNativeSettingsLoad'));
  assert.match(begin, /const-wide\/16 v3, 0x7d0/, 'deadline = 2000 ms (0x7d0), not 4500 ms');
  const to = activity.slice(activity.indexOf('method public final onNativeSettingsTimeout'));
  for (const frag of ['Apparence et thème', 'Préférences de lecture', 'melodix:setting:autoplay',
      'melodix:setting:canvas', 'melodix:setting:bg_audio', 'melodix:action:retry-settings']) {
    assert.ok(to.includes(frag), `fallback must contain ${frag}`);
  }
});

// MEL-BUG-038: the "Explorer Melodix" shortcut grid is gone from Home.
test('MEL-BUG-038: no shortcut grid rendered on Home; tab bar keeps the navigation', () => {
  const shelf = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  assert.equal(shelf.indexOf('NativeShortcutGrid;->render'), -1, 'grid call removed');
  for (const f of ['res/layout/activity_main.xml', 'res/layout-land/activity_main.xml',
      'res/layout-sw600dp/activity_main.xml', 'res/layout-sw600dp-land/activity_main.xml']) {
    const xml = read(f);
    assert.ok(xml.includes('@id/nativeTabBar') && xml.includes('onNativeSearchClick'),
      `${f}: bottom tab bar navigation intact`);
  }
});

// MEL-BUG-039: glass/Apple restyle — translucent surfaces mirrored in MelColors,
// glass tab bar + glass icon discs applied in every layout variant.
test('MEL-BUG-039: glass palette exists in XML and is mirrored in MelColors', () => {
  const colors = read('res/values/colors.xml');
  // The 7% fill and 14% border are mirrored in the runtime palette.
  const pairs = [['mel_glass_fill','glassFill','12FFFFFF'],
    ['mel_glass_stroke','glassStroke','24FFFFFF'],
    ['mel_glass_tabbar','glassTabbar','12FFFFFF'],
    ['mel_glass_card','glassCard','12FFFFFF']];
  const mc = read('smali/com/melodix/music/MelColors.smali');
  for (const [xmlName, field, hex] of pairs) {
    assert.ok(colors.includes(`<color name="${xmlName}">#${hex}</color>`), `${xmlName} defined`);
    assert.match(mc, new RegExp(`const v0, 0x${hex.toLowerCase()}\\s+\\n\\s*sput v0, Lcom/melodix/music/MelColors;->${field}:I`), `${field} mirrors ${xmlName}`);
  }
  for (const [name, hex] of [['mel_glass_surface','12FFFFFF'], ['mel_glass_edge','24FFFFFF'], ['mel_glass_reflection','2EFFFFFF'], ['mel_glass_clear','00FFFFFF']])
    assert.ok(colors.includes(`<color name="${name}">#${hex}</color>`), `${name} token`);
  assert.match(colors, /<color name="mel_surface">#[Cc][Cc]141222<\/color>/);
});

test('MEL-BUG-039: glass drawables applied in all 4 layout variants', () => {
  for (const f of ['res/layout/activity_main.xml', 'res/layout-land/activity_main.xml',
      'res/layout-sw600dp/activity_main.xml', 'res/layout-sw600dp-land/activity_main.xml']) {
    const xml = read(f);
    assert.ok(xml.includes('@drawable/native_tabbar_glass'), `${f}: glass tab bar`);
    assert.ok(xml.includes('@drawable/native_icon_glass'), `${f}: glass header icons`);
    assert.ok(xml.includes('@color/mel_glass_card'), `${f}: glass avatar card`);
  }
  assert.ok(fs.existsSync(path.join(repo, 'res/drawable/native_tabbar_glass.xml')));
  assert.ok(fs.existsSync(path.join(repo, 'res/drawable/native_icon_glass.xml')));
});

test('MEL-BUG-039: status card and status icon use the glass colors at runtime', () => {
  const shelf = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const card = shelf.slice(shelf.indexOf('method private static createHomeStatusBackground'));
  assert.match(card, /MelColors;->strokeAccent:I/, 'status card hairline = accent stroke (MEL-BUG-058 vibe)');
  const icon = shelf.slice(shelf.indexOf('method private static createHomeStatusIcon'));
  assert.match(icon, /MelColors;->glassFill:I[\s\S]*?setColor/, 'status icon disc = glass fill');
  assert.match(icon, /MelColors;->glassStroke:I[\s\S]*?setStroke/, 'status icon disc = glass stroke');
});

// MEL-BUG-040: an auth-state transition resets the refusal budget.
test('MEL-BUG-040: auth-state-changed resets the 401/403 refusal budget', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const m = shell.match(/addEventListener\('sf-spotify-auth-state-changed', function\(\) \{([\s\S]*?)\}\);/);
  assert.ok(m && /__sfMediaLibRefusalEpoch = 0/.test(m[1]) && /__sfMediaLibRefusalAttempts = 0/.test(m[1]));
  assert.ok(/__sfMediaLibRefusalEpoch\s*=\s*0/.test(read('assets/native_ui_shell.js')),
    'assets/native_ui_shell.js must be regenerated');
});

// MEL-BUG-058: global vibe pass — accent hairline on the glass tab bar, accent
// stroke on the home status card, and a soft accent pill behind the ACTIVE tab.
test('MEL-BUG-058: glass tab bar hairline and gradient active-tab pill', () => {
  const tabbar = read('res/drawable/native_tabbar_glass.xml');
  assert.match(tabbar, /<stroke android:width="1dp" android:color="@color\/mel_glass_edge"\s*\/>/, '1dp white glass edge');
  assert.match(tabbar, /@color\/mel_glass_reflection/);
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const at = main.indexOf('.method public final styleNativeTab');
  const body = main.slice(at, main.indexOf('.end method', at));
  assert.match(body, /if-eqz v0, :native_tab_restore_ripple[\s\S]*?"native_tab_active"[\s\S]*?applyDrawableBackground/, 'active tab uses shared gradient');
  assert.match(body, /:native_tab_restore_ripple[\s\S]{0,300}?const v2, 0x7f08013f[\s\S]{0,80}?invoke-virtual \{v1, v2\}, Landroid\/view\/View;->setBackgroundResource\(I\)V/, 'inactive tab restores its ripple');
  const active = read('res/drawable/native_tab_active.xml');
  assert.match(active, /@color\/mel_gradient_start/); assert.match(active, /@color\/mel_gradient_end/);
  assert.match(active, /android:radius="999dp"/, 'pill rounds with tab height');
  assert.match(read('res/values/mel_dimens.xml'), /<dimen name="mel_liquid_inset">4\.0dip<\/dimen>/);
  for (const f of ['res/layout/activity_main.xml','res/layout-land/activity_main.xml','res/layout-sw600dp/activity_main.xml','res/layout-sw600dp-land/activity_main.xml']) {
    const layout = read(f);
    const bar = layout.slice(layout.indexOf('android:id="@id/nativeTabBar"'), layout.indexOf('</LinearLayout>', layout.indexOf('android:id="@id/nativeTabBar"')));
    assert.match(bar, /android:padding="@dimen\/mel_liquid_inset"/, `${f}: symmetric 4dp inset`);
    assert.equal((bar.match(/android:layout_height="match_parent"/g)||[]).length, 3, `${f}: tabs stay inside padded bar`);
  }
});

// MEL-BUG-059: header gets a 1dp accent hairline (glass vibe) via a palette-only
// drawable referenced from the main layout.
test('MEL-BUG-059: header hairline drawable exists, palette-only, and is wired in the layout', () => {
  const xml = fs.readFileSync(path.join(repo, 'res/drawable/native_header_glass.xml'), 'utf8');
  assert.ok(xml.includes('@color/mel_stroke_accent'), 'header hairline = accent');
  assert.ok(!/#[0-9a-fA-F]{3,8}/.test(xml), 'no raw hex in the drawable');
  const layout = fs.readFileSync(path.join(repo, 'res/layout/activity_main.xml'), 'utf8');
  assert.ok(layout.includes('android:background="@drawable/native_header_glass"'), 'header uses the glass hairline');
});

// MEL-BUG-061: login web UI is zoomed (140%) while the native shell resets to
// 100%, and an unproven session on Home opens the official login FIRST.
test('MEL-BUG-061: login UI zoom + login-first when session unproven', () => {
  const main = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
  const login = main.slice(main.indexOf('.method private final applyLoginWebUi'), main.indexOf('.end method', main.indexOf('.method private final applyLoginWebUi')));
  // MEL-BUG-069: the 180% text zoom was the workaround for a narrow desktop
  // column; the login surface now switches the WebView to a mobile viewport
  // (wide viewport + overview mode) and keeps a light 125% text zoom.
  assert.match(login, /const\/4 v1, 0x1\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setUseWideViewPort\(Z\)V\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setLoadWithOverviewMode\(Z\)V/,
    'login surface uses the mobile viewport (MEL-BUG-069)');
  assert.match(login, /const\/16 v1, 0x7d\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'login UI keeps a light 125% text zoom (MEL-BUG-069)');
  const show = main.slice(main.indexOf('.method public final showNativeUiFrom'), main.indexOf('.end method', main.indexOf('.method public final showNativeUiFrom')));
  assert.match(show, /const\/16 v1, 0x64\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'native shell resets zoom to 100%');
  // MEL-BUG-061: auto-opening login from the unproven callback was reverted
  // (it covered the native shell and broke the rendered-shell measurement);
  // login-first happens at cold start (MEL-BUG-042) and via the card button.
  const unproven = main.slice(main.indexOf('.method public final noteNativeHomeSessionUnprovenStatusAttached'), main.indexOf('.end method', main.indexOf('.method public final noteNativeHomeSessionUnprovenStatusAttached')));
  assert.doesNotMatch(unproven, /openSpotifyLogin\(\)V/, 'no auto login jump from the unproven callback');
});
