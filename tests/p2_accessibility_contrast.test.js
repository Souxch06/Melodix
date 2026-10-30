// P2 accessibility: the readable text of the native UI must stay legible on
// every surface the renderers paint. The palette lives in res/values/colors.xml
// (mel_*) and is mirrored in MelColors.smali; a designer tweak that silently
// drops a text pairing under WCAG AA has to fail here instead of shipping.
//
// Reference: WCAG 2.1 - 1.4.3 Contrast (Minimum): 4.5:1 for normal text,
// 3:1 for large text (>= 18.66px bold or >= 24px).

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const colorsFile = path.join(root, 'res', 'values', 'colors.xml');

function readPalette() {
  const xml = fs.readFileSync(colorsFile, 'utf8');
  const palette = {};
  const re = /<color name="(mel_[a-z0-9_]+)">#([0-9a-fA-F]{6,8})<\/color>/g;
  let match;
  while ((match = re.exec(xml)) !== null) {
    const hex = match[2].length === 8 ? match[2].slice(2) : match[2];
    palette[match[1]] = parseInt(hex, 16);
  }
  return palette;
}

function channel(value) {
  const c = value / 255;
  return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
}

function luminance(rgb) {
  const r = channel((rgb >> 16) & 255);
  const g = channel((rgb >> 8) & 255);
  const b = channel(rgb & 255);
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function contrast(a, b) {
  const la = luminance(a);
  const lb = luminance(b);
  const hi = Math.max(la, lb);
  const lo = Math.min(la, lb);
  return (hi + 0.05) / (lo + 0.05);
}

const SURFACES = ['mel_background', 'mel_surface', 'mel_surface_high', 'mel_surface_btn', 'mel_surface_btn_top'];
const TEXTS = ['mel_text_primary', 'mel_text_secondary', 'mel_text_tertiary', 'mel_text_dim'];

test('the palette is complete enough to be audited', () => {
  const palette = readPalette();
  for (const name of [].concat(SURFACES, TEXTS, ['mel_accent', 'mel_accent_deep'])) {
    assert.ok(typeof palette[name] === 'number', `${name} est defini dans colors.xml`);
  }
});

test('every readable text colour clears WCAG AA on every painted surface', () => {
  const palette = readPalette();
  const failures = [];
  for (const text of TEXTS) {
    for (const surface of SURFACES) {
      const ratio = contrast(palette[text], palette[surface]);
      if (ratio < 4.5) {
        failures.push(`${text} sur ${surface} = ${ratio.toFixed(2)}:1 (< 4.5:1)`);
      }
    }
  }
  assert.deepEqual(failures, [], 'aucun couple texte/fond ne passe sous AA');
});

test('the muted icon colour stays above the large-text threshold', () => {
  const palette = readPalette();
  // Icons are not text, but they still have to be perceivable (WCAG 1.4.11
  // non-text contrast asks for 3:1).
  for (const surface of ['mel_background', 'mel_surface']) {
    const ratio = contrast(palette.mel_icon_muted, palette[surface]);
    assert.ok(ratio >= 3, `mel_icon_muted sur ${surface} = ${ratio.toFixed(2)}:1 (>= 3:1)`);
  }
});

test('the accent stays legible either as text or as a button fill', () => {
  const palette = readPalette();
  const onBackground = contrast(palette.mel_accent, palette.mel_background);
  assert.ok(onBackground >= 4.5, `mel_accent sur mel_background = ${onBackground.toFixed(2)}:1`);
  // Dark text on an accent-filled button: the pair that makes the button label
  // readable when the accent is the background.
  const darkOnAccent = contrast(palette.mel_background, palette.mel_accent);
  assert.ok(darkOnAccent >= 4.5, `texte sombre sur mel_accent = ${darkOnAccent.toFixed(2)}:1`);
});

test('the deep accent is decorative only: it is never used as text in smali', () => {
  // accentDeep on a surface lands around 3.4:1 - acceptable for a gradient or a
  // stroke, not for a label. The audit only holds while it stays non-textual.
  const palette = readPalette();
  const worst = Math.min(
    ...SURFACES.map((surface) => contrast(palette.mel_accent_deep, palette[surface]))
  );
  assert.ok(worst < 4.5, 'accentDeep reste sous AA: il ne doit pas servir de texte');

  const smaliDir = path.join(root, 'smali');
  const offenders = [];
  const walk = (dir) => {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        walk(full);
        continue;
      }
      if (!entry.name.endsWith('.smali')) continue;
      if (entry.name === 'MelColors.smali') continue;
      const src = fs.readFileSync(full, 'utf8');
      if (/MelColors;->accentDeep:I/.test(src)) offenders.push(full.replace(root + path.sep, ''));
    }
  };
  walk(smaliDir);
  assert.deepEqual(offenders, [], 'aucun renderer ne peint du texte avec accentDeep');
});
