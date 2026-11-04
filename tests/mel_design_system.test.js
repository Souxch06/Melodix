// Melodix design system: the invariants that keep the native shell coherent and
// keep the tablet a real adaptation instead of a stretched phone.
//
// These are structural assertions over the same files aapt2 and smali compile.
// They do not claim to render anything: the visual result is verified by the
// apktool assembly workflow and, on a device, by the emulator capture jobs.
//
// What is guarded here:
//   * no shell dimension goes back to being a hardcoded literal;
//   * every token the layout or smali asks for actually exists;
//   * the tablet overrides only real tokens, and never shrinks a touch target;
//   * each smali accessor's fallback equals the phone token, so a missing
//     resource cannot silently change phone rendering.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const { loadDimens, resolveSize, PHONE, TABLET, root } = require('./helpers/mel_dimens');

const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const phone = loadDimens(PHONE);
const tablet = loadDimens(TABLET);

function shellXml() {
  const xml = read('res/layout/activity_main.xml');
  const at = xml.indexOf('@id/nativeRoot');
  assert.ok(at > 0, 'the native shell exists');
  return xml.slice(xml.lastIndexOf('<', at));
}

function tabletOverrides() {
  const xml = read('res/values-sw600dp/mel_dimens.xml');
  return [...xml.matchAll(/<dimen name="([A-Za-z0-9_]+)">([^<]+)<\/dimen>/g)]
    .map((m) => ({ name: m[1], raw: m[2].trim() }));
}

test('the native shell declares no hardcoded dimension except weighted zeroes', () => {
  const shell = shellXml();
  const literals = [...shell.matchAll(/(?:android|app):([A-Za-z_]+)="([0-9.]+(?:dip|sp))"/g)]
    .filter((m) => Number.parseFloat(m[2]) !== 0);
  assert.deepEqual(literals.map((m) => `${m[1]}=${m[2]}`), [],
    'every non-zero shell dimension must resolve through a design token');
});

test('every design token the layout references is defined', () => {
  const shell = shellXml();
  const used = new Set([...shell.matchAll(/@dimen\/([A-Za-z0-9_]+)/g)].map((m) => m[1]));
  assert.ok(used.size > 60, `expected the shell to use the token scale, found ${used.size}`);
  const missing = [...used].filter((name) => phone[name] === undefined);
  assert.deepEqual(missing, [], 'a layout token with no definition would fail aapt2');
});

test('the tablet overrides only tokens that exist on the phone', () => {
  const overrides = tabletOverrides();
  assert.ok(overrides.length > 60, `expected a substantial tablet set, found ${overrides.length}`);
  const orphans = overrides.filter((o) => phone[o.name] === undefined).map((o) => o.name);
  assert.deepEqual(orphans, [], 'an override with no base token is dead weight');
});

test('the tablet is a different layout, not a magnified phone', () => {
  // Per-role differences, not a global density multiplier. Each of these is a
  // deliberate layout decision for a >=600dp screen.
  const widerOnTablet = [
    'mel_gutter',              // content does not run edge to edge
    'mel_shelf_card_width',    // fewer, larger covers per shelf
    'mel_shelf_art_height',
    'mel_row_art',             // larger list thumbnails
    'mel_row_height',
    'mel_player_art',          // the point of a big screen
    'mel_mini_height',
    'mel_tab_bar_height',      // reachable navigation with readable labels
    'mel_chip_height',
    'mel_search_height',
  ];
  for (const token of widerOnTablet) {
    const p = resolveSize(`@dimen/${token}`, phone);
    const t = resolveSize(`@dimen/${token}`, tablet);
    assert.ok(t > p, `${token} must grow on tablet (phone ${p}, tablet ${t})`);
  }
  // A global scale factor would be the "stretched phone" the brief forbids.
  const ratios = widerOnTablet.map((token) =>
    resolveSize(`@dimen/${token}`, tablet) / resolveSize(`@dimen/${token}`, phone));
  assert.ok(new Set(ratios.map((r) => r.toFixed(3))).size > 3,
    'tablet metrics must be per-role decisions, not one uniform multiplier');
});

test('tablet typography grows and stays on a readable scale', () => {
  for (const token of ['mel_header_title', 'mel_section_title', 'mel_row_title',
    'mel_row_subtitle', 'mel_mini_title', 'mel_mini_artist', 'mel_tab_label',
    'mel_player_title', 'mel_search_text']) {
    const p = resolveSize(`@dimen/${token}`, phone);
    const t = resolveSize(`@dimen/${token}`, tablet);
    assert.ok(t > p, `${token} must be larger on tablet`);
    assert.ok(p >= 11, `${token} is too small to read on a phone (${p}sp)`);
  }
});

test('no tablet override ever shrinks a control below its phone size', () => {
  const offenders = [];
  for (const { name } of tabletOverrides()) {
    const p = resolveSize(`@dimen/${name}`, phone);
    const t = resolveSize(`@dimen/${name}`, tablet);
    if (p !== null && t !== null && t < p) offenders.push(`${name}: ${p} -> ${t}`);
  }
  assert.deepEqual(offenders, [], 'a tablet must not get smaller targets than a phone');
});

test('dimension tokens carry the right unit for their role', () => {
  const offenders = [];
  for (const [name, raw] of Object.entries(phone)) {
    const isText = /(_title|_text|_label|_artist|_subtitle|_caption|_time)$/.test(name)
      || name === 'mel_section_title';
    const unit = raw.endsWith('sp') ? 'sp' : (raw.endsWith('dip') ? 'dip' : '?');
    if (isText && unit !== 'sp') offenders.push(`${name}=${raw} should be sp`);
    if (!isText && unit !== 'dip') offenders.push(`${name}=${raw} should be dip`);
  }
  assert.deepEqual(offenders, [], 'text scales with the font setting, geometry does not');
});

// ---------------------------------------------------------------------------
// smali side: the renderers must ask for the same tokens as the XML.
// ---------------------------------------------------------------------------

const metricsFile = 'smali/com/melodix/music/NativeUiMetrics.smali';

function accessors() {
  const smali = read(metricsFile);
  const out = [];
  const re = /\.method public static ([A-Za-z0-9]+)\(([^)]*)\)([IV])\n([\s\S]*?)\n\.end method/g;
  let m;
  while ((m = re.exec(smali)) !== null) out.push({ name: m[1], args: m[2], ret: m[3], body: m[4] });
  return out;
}

test('every smali accessor names a token that exists', () => {
  const list = accessors();
  assert.ok(list.length >= 16, `expected the metric accessors, found ${list.length}`);
  for (const acc of list) {
    const token = acc.body.match(/const-string v0, "([A-Za-z0-9_]+)"/);
    assert.ok(token, `${acc.name} must name a token`);
    assert.ok(phone[token[1]] !== undefined, `${acc.name} names unknown token ${token[1]}`);
  }
});

test('each smali fallback equals the phone token, so a missing resource is inert', () => {
  for (const acc of accessors()) {
    const token = acc.body.match(/const-string v0, "([A-Za-z0-9_]+)"/)[1];
    const expected = resolveSize(`@dimen/${token}`, phone);
    if (acc.ret === 'I') {
      const lit = acc.body.match(/const(?:\/16|\/4)? v1, (0x[0-9a-f]+|\d+)/);
      assert.ok(lit, `${acc.name} must carry a dp fallback`);
      const value = Number.parseInt(lit[1], lit[1].startsWith('0x') ? 16 : 10);
      assert.equal(value, expected,
        `${acc.name} fallback ${value}dp must equal ${token} (${expected}dp)`);
    } else {
      // Text accessors keep the historical sp value as an IEEE-754 float.
      const lit = acc.body.match(/const\/high16 v1, (0x[0-9a-f]+)/);
      assert.ok(lit, `${acc.name} must carry an sp fallback`);
      const buf = Buffer.alloc(4);
      buf.writeUInt32BE(Number.parseInt(lit[1], 16));
      assert.equal(buf.readFloatBE(0), expected,
        `${acc.name} fallback must equal ${token} (${expected}sp)`);
    }
  }
});

test('the renderers resolve their metrics instead of hardcoding them again', () => {
  const shelf = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const rows = read('smali/com/melodix/music/NativeUiRowFactory.smali');
  for (const acc of ['gutter', 'shelfCardWidth', 'shelfGap', 'shelfRadius', 'shelfArtHeight']) {
    assert.ok(shelf.includes(`NativeUiMetrics;->${acc}(Landroid/content/Context;)I`),
      `the shelf renderer must resolve ${acc}`);
  }
  for (const acc of ['rowPadH', 'rowPadV', 'rowHeight', 'rowRadius', 'rowArt', 'rowArtGap']) {
    assert.ok(rows.includes(`NativeUiMetrics;->${acc}(Landroid/content/Context;)I`),
      `the row renderer must resolve ${acc}`);
  }
  for (const acc of ['applyRowTitle', 'applyRowSubtitle']) {
    assert.ok(rows.includes(`NativeUiMetrics;->${acc}(Landroid/widget/TextView;Landroid/content/Context;)V`),
      `the row renderer must resolve ${acc}`);
  }
  assert.ok(rows.includes('NativeUiMetrics;->applySectionTitle('),
    'section headers must resolve their title size');

  // Playlist / album / artist banner.
  for (const acc of ['bannerPadTop', 'bannerPadBottom', 'bannerArt', 'bannerArtGap',
    'bannerTitleGap', 'bannerSubtitlePad', 'bannerActionPadH', 'bannerActionPadV',
    'bannerActionGap']) {
    assert.ok(rows.includes(`NativeUiMetrics;->${acc}(Landroid/content/Context;)I`),
      `the collection banner must resolve ${acc}`);
  }
  for (const acc of ['applyBannerTitle', 'applyBannerSubtitle', 'applyBannerAction']) {
    assert.ok(rows.includes(`NativeUiMetrics;->${acc}(Landroid/widget/TextView;Landroid/content/Context;)V`),
      `the collection banner must resolve ${acc}`);
  }

  // Settings and profile.
  const settings = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
  for (const acc of ['settingsPadH', 'settingsPadV', 'settingsStroke', 'settingsRowHeight',
    'settingsIcon', 'settingsIconGap', 'settingsSubtitlePad', 'settingsValuePadH',
    'settingsValuePadV', 'settingsValueGap', 'settingsRowGap', 'settingsSectionPadV']) {
    assert.ok(settings.includes(`NativeUiMetrics;->${acc}(Landroid/content/Context;)I`),
      `the settings renderer must resolve ${acc}`);
  }
  for (const acc of ['applySettingsTitle', 'applySettingsSubtitle', 'applySettingsValue',
    'applySettingsSectionTitle']) {
    assert.ok(settings.includes(`NativeUiMetrics;->${acc}(Landroid/widget/TextView;Landroid/content/Context;)V`),
      `the settings renderer must resolve ${acc}`);
  }
});

test('no tokenised renderer keeps a raw dp conversion for a tokenised role', () => {
  // A leftover dp() call is not automatically wrong - plenty of incidental
  // metrics remain - but the tokenised roles above must not silently regress to
  // a literal. Guard the count so a revert has to be deliberate.
  const counts = {
    'smali/com/melodix/music/NativeHomeShelfRenderer.smali': 28,
    'smali/com/melodix/music/NativeUiRowFactory.smali': 3,
    'smali/com/melodix/music/NativeSettingsRowFactory.smali': 0,
  };
  for (const [file, max] of Object.entries(counts)) {
    const body = read(file);
    const calls = (body.match(/;->dp\(Landroid\/content\/Context;I\)I/g) || []).length;
    assert.ok(calls <= max,
      `${file} has ${calls} raw dp() conversions, expected at most ${max}: a tokenised role was reverted`);
  }
});

test('token resolution keeps a working fallback path', () => {
  const rows = read('smali/com/melodix/music/NativeUiRowFactory.smali');
  const metric = rows.slice(rows.indexOf('.method public static metric('),
    rows.indexOf('.end method', rows.indexOf('.method public static metric(')));
  assert.match(metric, /getIdentifier\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)I/,
    'the token is looked up by name so Android picks the qualified resource');
  assert.match(metric, /if-eqz v3, :native_metric_fallback/, 'an unknown token falls back');
  assert.match(metric, /getDimensionPixelSize\(I\)I/);
  assert.match(metric, /:native_metric_fallback[\s\S]*?->dp\(Landroid\/content\/Context;I\)I/,
    'the fallback reuses the historical dp conversion');

  const text = rows.slice(rows.indexOf('.method public static applyTextSize('),
    rows.indexOf('.end method', rows.indexOf('.method public static applyTextSize(')));
  assert.match(text, /getDimension\(I\)F/);
  assert.match(text, /const\/4 v1, 0x0\n\n    invoke-virtual \{p0, v1, v0\}, Landroid\/widget\/TextView;->setTextSize\(IF\)V/,
    'COMPLEX_UNIT_PX avoids applying the sp font scale twice');
});
