const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');
const PHONE = 'res/layout/activity_main.xml';
const TABLET = 'res/layout-sw600dp/activity_main.xml';

const tilesOf = (layout) => layout.match(/<FrameLayout\b[^>]*android:onClick="onNativeGenreClick"[\s\S]*?<\/FrameLayout>/g) || [];
const attr = (block, name) => {
  const m = new RegExp(`android:${name}="([^"]*)"`).exec(block);
  return m ? m[1] : null;
};

// --- contrast, measured rather than asserted by eye -------------------------
const luminance = (hex) => {
  const c = [1, 3, 5].map((i) => parseInt(hex.slice(i, i + 2), 16) / 255)
    .map((v) => (v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4));
  return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2];
};
const contrast = (a, b) => {
  const [hi, lo] = [luminance(a), luminance(b)].sort((x, y) => y - x);
  return (hi + 0.05) / (lo + 0.05);
};

test('every browse tile label passes WCAG AA against its own background', () => {
  // Six of the eight original hues failed: amber was 2.10:1 and teal 2.45:1 for
  // white text. The label sits at the TOP of the tile, which the multiply
  // gradient leaves at the base hue, so the base colour is the worst case.
  const colors = read('res/values/colors.xml');
  const tiles = tilesOf(read(PHONE));
  assert.equal(tiles.length, 8);
  for (const tile of tiles) {
    const ref = attr(tile, 'backgroundTint');
    const name = ref.replace('@color/', '');
    const hex = new RegExp(`<color name="${name}">(#[0-9a-fA-F]{6})</color>`).exec(colors);
    assert.ok(hex, `${name} must be a literal colour to be measurable`);
    const ratio = contrast('#ffffff', hex[1]);
    assert.ok(ratio >= 4.5, `${attr(tile, 'tag')}: white on ${hex[1]} is ${ratio.toFixed(2)}:1, below AA`);
  }
});

test('browse tiles carry a decorative glyph and a real label, on both profiles', () => {
  for (const layout of [PHONE, TABLET]) {
    const tiles = tilesOf(read(layout));
    assert.equal(tiles.length, 8, `${layout} keeps eight tiles`);
    for (const tile of tiles) {
      assert.match(tile, /<ImageView/, 'a decorative glyph gives the tile depth');
      // A dedicated copy of the note path: android:tint on the ImageView proved
      // ineffective on device, and the shared placeholder feeds the row and shelf
      // renderers, so its fill must not change.
      assert.match(tile, /android:src="@drawable\/native_genre_glyph"/, 'uses the dark decorative glyph');
      assert.doesNotMatch(tile, /android:tint=/, 'the fill lives in the vector, not an ineffective tint');
      assert.match(tile, /android:importantForAccessibility="no"/, 'the glyph must not be read aloud');
      assert.match(tile, /android:rotation="22\.0"/);
      assert.match(tile, /<TextView/, 'the genre name stays a real text label');
      assert.equal(attr(tile, 'contentDescription'), attr(tile, 'tag'), 'the tile announces its genre once');
      assert.equal(attr(tile, 'backgroundTintMode'), 'multiply', 'otherwise the tint flattens the gradient');
    }
  }
});

test('the tile foreground covers pressed, selected and unavailable states', () => {
  const fg = read('res/drawable/native_genre_foreground.xml');
  const items = fg.match(/<item\b[^>]*>/g) || [];
  assert.match(fg, /android:state_enabled="false"/, 'an unavailable tile must read as inert');
  assert.match(fg, /android:state_selected="true"/, 'the chosen genre must be marked');
  assert.match(fg, /@drawable\/native_genre_ripple/, 'idle falls through to the press ripple');
  // Unavailable has to win over selected, or a disabled tile still looks chosen.
  assert.ok(fg.indexOf('state_enabled="false"') < fg.indexOf('state_selected="true"'));
  assert.ok(fg.indexOf('state_selected="true"') < fg.indexOf('native_genre_ripple'));
  assert.ok(items.length >= 3);
  const ripple = read('res/drawable/native_genre_ripple.xml');
  assert.match(ripple, /@android:id\/mask/, 'the ripple must be clipped to the rounded tile');
  assert.match(ripple, /@dimen\/mel_tile_radius/);
});

test('tile geometry is tokenised and the tablet composition is genuinely different', () => {
  const dimen = (file, name) => {
    const m = new RegExp(`<dimen name="${name}">([^<]*)</dimen>`).exec(read(file));
    assert.ok(m, `${name} must exist in ${file}`);
    return parseFloat(m[1]);
  };
  for (const layout of [PHONE, TABLET]) {
    for (const tile of tilesOf(read(layout))) {
      for (const a of ['layout_height', 'textSize', 'paddingLeft', 'paddingTop', 'layout_marginRight']) {
        const v = attr(tile, a);
        if (v !== null) assert.match(v, /^@dimen\//, `${a} must be a token, not a raw dimension`);
      }
      // A weighted child is declared width="0.0dip"; that zero is the weight
      // idiom, not a hardcoded size, so it is exempt. Anything else must be a token.
      const sizes = tile.replace(/android:layout_width="0(\.0)?dip"(?=[\s\S]*android:layout_weight=)/, '');
      assert.doesNotMatch(sizes, /"\d+(\.\d+)?(dip|dp|sp)"/, 'no raw dimension inside a tile');
    }
  }
  const phoneRow = /<LinearLayout[^>]*horizontal[^>]*>\s*<FrameLayout[\s\S]*?<\/LinearLayout>/;
  const countRow = (layout) => {
    const m = phoneRow.exec(layout.slice(layout.indexOf('@id/nativeGenreScroll')));
    return (m[0].match(/onNativeGenreClick/g) || []).length;
  };
  assert.equal(countRow(read(PHONE)), 2, 'phone: two columns');
  assert.equal(countRow(read(TABLET)), 4, 'tablet: four columns, not a scaled-up phone');
  for (const token of ['mel_tile_height', 'mel_tile_text', 'mel_tile_radius', 'mel_tile_glyph', 'mel_tile_pad_h']) {
    assert.ok(dimen('res/values-sw600dp/mel_dimens.xml', token) > dimen('res/values/mel_dimens.xml', token),
      `${token} must scale up on tablet`);
  }
});

test('no genre was invented or renamed by the redesign', () => {
  // Captured from the accepted reference 9322581. Pinned as a literal rather than
  // read with `git show`: CI checks out a shallow clone where that commit does not
  // exist, and a guard that only runs on a developer machine guards nothing.
  const REFERENCE_TERMS = ['Pop', 'Hip-hop', 'Rock', 'Latino', 'Détente', 'Sport', 'Podcasts', 'Nouveautés'];
  const tagsOf = (s) => (s.match(/android:tag="[^"]*"/g) || [])
    .map((t) => t.slice('android:tag="'.length, -1));
  for (const layout of [PHONE, TABLET]) {
    const s = read(layout);
    const after = tagsOf(s.slice(s.indexOf('@id/nativeGenreScroll'), s.indexOf('@id/nativeLibraryCategories')));
    assert.deepEqual(after, REFERENCE_TERMS, `${layout} must keep exactly the real browse terms`);
  }
});

test('the selected state is wired to the real handler, and failures are logged', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const at = activity.indexOf('.method public final onNativeGenreClick');
  // Compare instruction positions, not comment prose: a comment naming the
  // search would otherwise sort before the call it describes.
  const handler = activity.slice(at, activity.indexOf('.end method', at))
    .split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
  assert.match(handler, /performNativeLiveSearch/, 'the real search still runs');
  assert.match(handler, /NativeGenreTileStyler;->apply/, 'the ring is applied');
  // The ring must be applied BEFORE the search: on device the tap landed on the
  // enabled tile but nothing after performNativeLiveSearch ran without a session.
  // Presentation must not be hostage to the search completing.
  assert.ok(handler.indexOf('NativeGenreTileStyler') < handler.indexOf('performNativeLiveSearch'),
    'the selected ring must not depend on the search succeeding');
  const styler = read('smali/com/melodix/music/NativeGenreTileStyler.smali');
  assert.match(styler, /setSelected\(Z\)V/);
  assert.match(styler, /0x7f09024f/, 'targets the real browse container');
  assert.match(styler, /"MelGenre"/, 'a swallowed failure must still leave a trace');
  assert.doesNotMatch(styler, /performNativeLiveSearch|applyNativeUiData/, 'presentation must not drive the search');
});
test('the token parser accepts negative margins but still rejects invalid units', () => {
  // The glyph overhangs its tile via a negative margin, which is legal Android.
  // Supporting it must not turn the parser permissive about units.
  const os = require('node:os');
  const script = path.join(root, 'scripts/ui_metrics_measure.py');
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-neg-token-'));
  const dims = path.join(root, 'res/values/mel_dimens.xml');
  const original = fs.readFileSync(dims, 'utf8');
  const probe = (value) => {
    fs.writeFileSync(dims, original.replace('</resources>', `    <dimen name="mel_probe_token">${value}</dimen>\n</resources>`));
    try {
      execFileSync('python3', [script, 'phone', '420', path.join(dir, 'missing.xml'), path.join(dir, 'out.json')],
        { cwd: root, encoding: 'utf8', stdio: 'pipe' });
      return null;
    } catch (e) { return `${e.stdout || ''}${e.stderr || ''}`; }
  };
  try {
    const negative = probe('-14.0dip');
    assert.ok(!negative || !negative.includes('unsupported value'), 'a negative margin is a valid token');
    for (const bad of ['12px', '?attr/mel_tile_height', '14', 'wrap_content']) {
      const out = probe(bad);
      assert.ok(out && out.includes('unsupported value'), `${bad} must still be rejected`);
    }
  } finally {
    fs.writeFileSync(dims, original);
    fs.rmSync(dir, { recursive: true, force: true });
  }
});

test('the decorative glyph carries its own dark fill and does not touch the shared placeholder', () => {
  const glyph = read('res/drawable/native_genre_glyph.xml');
  const shared = read('res/drawable/native_cover_placeholder.xml');
  assert.match(glyph, /android:fillColor="@color\/mel_genre_glyph"/);
  assert.match(shared, /android:fillColor="@color\/mel_icon_muted"/, 'the shared placeholder keeps its fill');
  const pathOf = (s) => /android:pathData="([^"]+)"/.exec(s)[1];
  assert.equal(pathOf(glyph), pathOf(shared), 'same note drawing, only the fill differs');
  const colors = read('res/values/colors.xml');
  const alpha = /<color name="mel_genre_glyph">#([0-9a-fA-F]{2})/.exec(colors)[1];
  assert.ok(parseInt(alpha, 16) <= 0x40, 'the glyph must stay a subtle emboss, not a sticker');
});
