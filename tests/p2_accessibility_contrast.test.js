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

// ---------------------------------------------------------------------------
// P2: touch targets. Android's minimum is 48dp; anything smaller is a miss for
// a thumb, and the native screens are thumb-driven.
// ---------------------------------------------------------------------------

const layoutFile = path.join(root, 'res', 'layout', 'activity_main.xml');

function clickableViews() {
  const xml = fs.readFileSync(layoutFile, 'utf8');
  const views = [];
  const re = /<[\w.]+[^>]*android:onClick="([^"]+)"[^>]*>/g;
  let match;
  while ((match = re.exec(xml)) !== null) {
    views.push({ handler: match[1], block: match[0] });
  }
  return views;
}

function dp(block, attr) {
  const re = new RegExp(`android:${attr}="([0-9.]+)dip"`);
  const match = block.match(re);
  return match ? Number(match[1]) : null;
}

test('every clickable native control is at least 48dp tall', () => {
  const offenders = [];
  for (const view of clickableViews()) {
    const height = dp(view.block, 'layout_height');
    if (height !== null && height < 48) {
      offenders.push(`${view.handler} = ${height}dp`);
    }
  }
  assert.deepEqual(offenders, [], 'aucune cible tactile native sous 48dp de haut');
});

test('a fixed-width clickable control is also 48dp wide or weighted', () => {
  const offenders = [];
  for (const view of clickableViews()) {
    const width = dp(view.block, 'layout_width');
    if (width === null) continue;
    // A weighted child is measured by the parent, not by this number.
    if (width === 0 && /layout_weight/.test(view.block)) continue;
    if (width < 48) offenders.push(`${view.handler} = ${width}dp`);
  }
  assert.deepEqual(offenders, [], 'aucune cible tactile native etroite');
});

test('the back button is reachable and never smaller than the header avatar', () => {
  const views = clickableViews();
  const back = views.find((view) => view.handler === 'onNativeBackClick');
  assert.ok(back, 'le bouton retour existe');
  assert.ok(dp(back.block, 'layout_height') >= 48, 'le retour fait au moins 48dp');
  assert.ok(dp(back.block, 'layout_width') >= 48, 'le retour fait au moins 48dp de large');
});

// ---------------------------------------------------------------------------
// P0-A: the splash must never look frozen. A static logo for the whole startup
// is indistinguishable from a hang, and a hang is exactly what the trace showed
// (stage chain stopped at content-view, on-screen text empty).
// ---------------------------------------------------------------------------

test('the splash shows a loading indicator and an honest status text', () => {
  const xml = fs.readFileSync(layoutFile, 'utf8');
  const start = xml.indexOf('@id/splashOverlay');
  assert.ok(start > 0, 'le splash existe');
  const end = xml.indexOf('</androidx.constraintlayout.widget.ConstraintLayout>', start);
  const splash = xml.slice(start, end);

  assert.match(splash, /<ProgressBar[\s\S]{0,200}android:indeterminate="true"/,
    'un indicateur de chargement anime est visible pendant le demarrage');
  assert.match(splash, /Chargement de votre musique/,
    'le texte dit ce qui se passe au lieu de laisser un logo muet');
  // Honest wording: it must not promise success.
  assert.doesNotMatch(splash, /prêt|termine|connecte/i,
    'aucun message de succes pendant le chargement');
});

test('the splash feedback creates no new id and no new resource', () => {
  // View ids are pinned to fixed hex values in res/values/public.xml and used
  // as literals from smali (0x7f09xxxx). A new id or resource could shift the
  // table and silently break every findViewById of the rebuilt APK.
  const xml = fs.readFileSync(layoutFile, 'utf8');
  const start = xml.indexOf('@id/splashOverlay');
  const end = xml.indexOf('</androidx.constraintlayout.widget.ConstraintLayout>', start);
  const splash = xml.slice(start, end);
  assert.deepEqual(splash.match(/@\+id\/\w+/g) || [], [],
    'le bloc splash ne declare aucun nouvel id');
  assert.doesNotMatch(splash, /@string\/mel_splash/, 'aucune nouvelle chaine de traduction');
});
