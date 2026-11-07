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
  for (const [xmlName, hex] of [['mel_glass_fill', '1AFFFFFF'], ['mel_glass_stroke', '40FFFFFF'],
      ['mel_glass_tabbar', 'B3141A20'], ['mel_glass_card', '26FFFFFF']]) {
    assert.ok(colors.includes(`<color name="${xmlName}">#${hex}</color>`), `${xmlName} defined`);
  }
  const mc = read('smali/com/melodix/music/MelColors.smali');
  for (const [field, hex] of [['glassFill', '0x1affffff'], ['glassStroke', '0x40ffffff'],
      ['glassTabbar', '0xb3141a20'], ['glassCard', '0x26ffffff']]) {
    assert.ok(mc.includes(`.field public static ${field}:I`), `${field} field exists`);
    assert.ok(mc.includes(`const v0, ${hex}`), `${field} initialised to ${hex}`);
  }
  // surfaces are translucent (glass) now
  assert.match(colors, /<color name="mel_surface">#[Cc][Cc]10151A<\/color>/);
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
test('MEL-BUG-058: tab bar hairline and active-tab pill use the accent palette', () => {
  const tabbar = fs.readFileSync(path.join(repo, 'res/drawable/native_tabbar_glass.xml'), 'utf8');
  assert.ok(tabbar.includes('@color/mel_stroke_accent'), 'tab bar top hairline = accent');
  assert.ok(!tabbar.includes('@color/mel_glass_stroke'), 'no more neutral hairline on the tab bar');
  const main = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
  const at = main.indexOf('.method public final styleNativeTab');
  const body = main.slice(at, main.indexOf('.end method', at));
  assert.match(body, /if-eqz v0, :native_tab_style_done[\s\S]{0,300}?new-instance v2, Landroid\/graphics\/drawable\/GradientDrawable;[\s\S]{0,300}?MelColors;->glow:I[\s\S]{0,200}?setCornerRadius[\s\S]{0,120}?setBackground/,
    'active tab gets a glow pill; inactive tabs keep the ripple');
  assert.match(body, /const\/high16 v3, 0x41a00000/, 'pill radius = 20dp');
});
