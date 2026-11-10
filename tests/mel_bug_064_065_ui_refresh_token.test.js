// MEL-BUG-064 (2026-11-08) — refonte UI "coup de jeune" : boutons pill en
// ripple, en-têtes de section modernes (majuscules accent suivies), lignes de
// réglages avec feedback au toucher, onglet actif en pill 24dp, carte d'accueil
// 24dp, chips à liseré accent.
// MEL-BUG-065 — diagnostic du problème token (capture 01:16 : token=ko-http403,
// bearer=0) : Accept: application/json sur les appels token + booléen de
// présence du cookie sp_dc (nom seul, jamais la valeur) remonté dans le diag.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.join(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(repo, f), 'utf8');
const method = (src, sig) => {
  const at = src.indexOf(sig);
  assert.ok(at >= 0, sig + ' exists');
  return src.slice(at, src.indexOf('.end method', at));
};

test('MEL-BUG-064a: primary/secondary/play buttons are ripple-wrapped pills on palette colors', () => {
  for (const [f, mask] of [['native_button_green.xml', '999.0dip'],
    ['native_button_dark.xml', '999.0dip'], ['native_button_white.xml', 'oval']]) {
    const xml = read('res/drawable/' + f);
    assert.ok(xml.startsWith('<?xml'), f);
    assert.match(xml, /<ripple /, f + ' is a ripple drawable (press feedback)');
    assert.ok(xml.includes('@android:id/mask'), f + ' has a bounded mask');
    assert.ok(xml.includes(mask), f + ' mask keeps the pill/oval shape');
    assert.ok(!/#[0-9a-fA-F]{3,8}/.test(xml), f + ' uses only @color/mel_*');
  }
  assert.match(read('res/drawable/native_button_green.xml'), /@drawable\/native_tab_active/, 'primary uses the shared accent gradient');
  const gradient = read('res/drawable/native_tab_active.xml');
  assert.match(gradient, /android:startColor="@color\/mel_gradient_start"/);
  assert.match(gradient, /android:endColor="@color\/mel_gradient_end"/);
  const play = read('res/drawable/native_button_white.xml');
  assert.match(play, /android:startColor="@color\/mel_gradient_start"/);
  assert.match(play, /android:endColor="@color\/mel_gradient_end"/);
  assert.match(read('res/drawable/native_button_dark.xml'), /@drawable\/native_glass_pill/);
  const glass = read('res/drawable/native_glass_pill.xml');
  assert.match(glass, /android:width="1dp" android:color="@color\/mel_glass_edge"/);
  assert.match(glass, /@color\/mel_glass_surface/); assert.match(glass, /@color\/mel_glass_reflection/);
});

test('MEL-BUG-064b: section headers are uppercase 12sp accent with letter spacing (both factories)', () => {
  for (const f of ['smali/com/melodix/music/NativeUiRowFactory.smali',
    'smali/com/melodix/music/NativeSettingsRowFactory.smali']) {
    const h = method(read(f), '.method public static createSectionHeader(');
    assert.match(h, /invoke-virtual \{p1\}, Ljava\/lang\/String;->toUpperCase\(\)Ljava\/lang\/String;/, f + ' uppercases the label');
    assert.match(h, /const\/high16 v1, 0x41400000\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/widget\/TextView;->setTextSize\(F\)V/, f + ' 12sp');
    assert.match(h, /sget v1, Lcom\/melodix\/music\/MelColors;->accent:I\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/widget\/TextView;->setTextColor\(I\)V/, f + ' accent color');
    assert.match(h, /const v1, 0x3d23d70a\s*\n\s*invoke-virtual \{v0, v1\}, Landroid\/widget\/TextView;->setLetterSpacing\(F\)V/, f + ' letterSpacing 0.08');
  }
});

test('MEL-BUG-064c: settings rows get a glow ripple over the card (press feedback)', () => {
  const f = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  const create = method(f, '.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;');
  assert.match(create, /\.locals 14/, 'register budget raised for the ripple wrap');
  assert.match(create, /sget v12, Lcom\/melodix\/music\/MelColors;->glow:I[\s\S]*?ColorStateList;->valueOf\(I\)[\s\S]*?new-instance v13, Landroid\/graphics\/drawable\/GradientDrawable;[\s\S]*?new-instance v0, Landroid\/graphics\/drawable\/RippleDrawable;[\s\S]*?RippleDrawable;-><init>\(Landroid\/content\/res\/ColorStateList;Landroid\/graphics\/drawable\/Drawable;Landroid\/graphics\/drawable\/Drawable;\)V/,
    'row background = RippleDrawable(glow, card, mask)');
  assert.match(create, /invoke-static \{p0\}, Lcom\/melodix\/music\/NativeUiMetrics;->settingsCardRadius\(Landroid\/content\/Context;\)I\s*\n\s*move-result v0\s*\n\s*int-to-float v0, v0\s*\n\s*invoke-virtual \{v13, v0\}, Landroid\/graphics\/drawable\/GradientDrawable;->setCornerRadius\(F\)V/,
    'mask radius resolves the same density-aware token as the card');
});

test('MEL-BUG-064d: rounded gradient tab, status card 24dp, glass chips', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const tab = method(main, '.method public final styleNativeTab(');
  assert.match(tab, /"native_tab_active"[\s\S]*?applyDrawableBackground/, 'active tab uses the rounded shared pill');
  assert.match(read('res/drawable/native_tab_active.xml'), /android:radius="999dp"/, 'pill radius is fully rounded at any density');
  assert.match(read('res/values/mel_dimens.xml'), /name="mel_liquid_inset">4\.0dip/, '4dp bar inset');
  assert.ok(read('res/values/mel_dimens.xml').includes('<dimen name="mel_status_radius">24.0dip</dimen>'),
    'status card radius 24dip');
  const metrics = read('smali/com/melodix/music/NativeUiMetrics.smali');
  assert.match(method(metrics, '.method public static statusRadius('), /const\/16 v1, 0x18/, 'statusRadius fallback 24');
  const chip = read('res/drawable/native_category_chip.xml');
  assert.match(chip, /android:width="1dp" android:color="@color\/mel_glass_edge"/, 'chip has neutral 1dp glass border');
  assert.match(chip, /@color\/mel_glass_surface/); assert.match(chip, /@color\/mel_glass_reflection/);
});

test('MEL-BUG-065a: token calls send Accept: application/json and never log the cookie value', () => {
  const bridge = read('scripts/spotify_bridge.source.js');
  const n = bridge.split("'Accept': 'application/json', 'app-platform': 'WebPlayer'").length - 1;
  assert.equal(n, 2, 'both token endpoints get Accept: application/json');
  assert.match(bridge, /function hasSpotifySessionCookie\(\)[\s\S]*?\/\(\?:\^\|;\\s\*\)sp_dc=\/\.test\(String\(document\.cookie \|\| ''\)\)/,
    'cookie check tests the sp_dc NAME only');
  assert.match(bridge, /cookieSession: hasSpotifySessionCookie\(\)/, 'cookieSession exported');
  assert.ok(!/cookieSession[^,]*sp_dc[^=]*=/.test(bridge.replace(/sp_dc=\//, '')), 'no cookie value path');
});

test('MEL-BUG-065b: diag carries cookie=oui/non on the home card, assets under ceilings', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  assert.match(shell, /' cookie=' \+ \(diag && diag\.cookieSession === true \? 'oui' : 'non'\)/,
    'home diag line shows cookie=oui/non');
  const shellAsset = fs.statSync(path.join(repo, 'assets/native_ui_shell.js')).size;
  const bridgeAsset = fs.statSync(path.join(repo, 'assets/spotify_bridge.js')).size;
  assert.ok(shellAsset <= 108867, `shell ${shellAsset} <= 108867`);
  assert.ok(bridgeAsset <= 3 * 48 * 1024, `bridge ${bridgeAsset} <= 147456`);
});
