// P4 — lecteur et mini-lecteur : structure visuelle sans session.
// Règles absolues vérifiées ici : aucune lecture simulée, aucun morceau fictif,
// aucune progression fictive, les commandes délèguent au vrai pont JS/nav natif.

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(root, f), 'utf8');

const LAYOUTS = ['res/layout/activity_main.xml', 'res/layout-sw600dp/activity_main.xml'];
const DIMENS = ['res/values/mel_dimens.xml', 'res/values-sw600dp/mel_dimens.xml'];

const colors = () => {
  const out = {};
  for (const m of read('res/values/colors.xml').matchAll(/<color name="([^"]+)">(#[0-9a-fA-F]{6,8})<\/color>/g)) {
    out[m[1]] = '#' + m[2].slice(-6);
  }
  return out;
};

const luminance = (hex) => {
  const c = [1, 3, 5].map((i) => parseInt(hex.slice(i, i + 2), 16) / 255)
    .map((v) => (v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4));
  return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2];
};
const contrast = (a, b) => {
  const [hi, lo] = [luminance(a), luminance(b)].sort((x, y) => y - x);
  return (hi + 0.05) / (lo + 0.05);
};

const dimen = (file, name) => {
  const m = read(file).match(new RegExp(`<dimen name="${name}">([0-9.]+)dip</dimen>`));
  assert.ok(m, `${file}: missing dimen ${name}`);
  return parseFloat(m[1]);
};

const blockOf = (xml, idRef) => {
  const at = xml.indexOf(idRef);
  assert.ok(at !== -1, `missing ${idRef}`);
  const start = xml.lastIndexOf('<', at);
  const end = xml.indexOf('/>', at);
  return xml.slice(start, end);
};

test('player and mini-player are hidden by default in both layouts (no fake playback)', () => {
  for (const layout of LAYOUTS) {
    const xml = read(layout);
    assert.match(blockOf(xml, '@id/nativePlayerPanel'), /android:visibility="gone"/,
      `${layout}: the full player must not show without a real track`);
    assert.match(blockOf(xml, '@id/nativeMiniPlayerContainer'), /android:visibility="gone"/,
      `${layout}: the mini-player must not show without a real track`);
  }
});

test('progress bars start visually inactive: determinate, max 1000, progress 0', () => {
  for (const layout of LAYOUTS) {
    const xml = read(layout);
    for (const id of ['@id/nativePlayerProgress', '@id/nativeMiniProgress']) {
      const b = blockOf(xml, id);
      assert.match(b, /android:indeterminate="false"/, `${layout} ${id}: no indeterminate spinning`);
      assert.match(b, /android:max="1000"/);
      assert.match(b, /android:progress="0"/, `${layout} ${id}: no fake progress`);
    }
  }
});

test('the placeholders are real texts, not invented tracks', () => {
  for (const layout of LAYOUTS) {
    const xml = read(layout);
    assert.ok(xml.includes('Aucune lecture en cours'), `${layout}: mini title placeholder`);
    assert.ok(xml.includes('Ouvrez Spotify pour commencer l’écoute'), `${layout}: mini artist placeholder`);
    assert.ok(xml.includes('● Lu via Spotify'), `${layout}: real-source caption`);
    // No invented title/artist anywhere in the player blocks.
    const panel = xml.slice(xml.indexOf('@id/nativePlayerPanel'), xml.indexOf('@id/nativeMiniPlayerContainer'));
    assert.doesNotMatch(panel, /android:text="(?!Aucune lecture|Ouvrez Spotify|● Lu via|0:00)[^"]{4,}"/,
      'no fabricated track name in the player panel');
  }
});

test('player touch targets meet the 48 dp minimum on both profiles', () => {
  for (const d of DIMENS) {
    for (const name of ['mel_player_side_control', 'mel_player_control', 'mel_player_play', 'mel_mini_play', 'mel_mini_height']) {
      assert.ok(dimen(d, name) >= 48, `${d}: ${name} = ${dimen(d, name)} dp < 48 dp`);
    }
  }
  // The XML must actually use these tokens for the buttons.
  for (const layout of LAYOUTS) {
    const xml = read(layout);
    assert.match(blockOf(xml, '@id/nativePlayPauseButton'), /android:layout_width="@dimen\/mel_mini_play"/);
  }
});

test('player text keeps AA contrast on the darkest player background', () => {
  const c = colors();
  const bg = c['mel_background']; // darkest stop of the player gradient
  assert.ok(contrast(c['mel_text_primary'], bg) >= 4.5,
    `title contrast ${contrast(c['mel_text_primary'], bg).toFixed(2)} < 4.5`);
  assert.ok(contrast(c['mel_text_secondary'], bg) >= 4.5,
    `artist contrast ${contrast(c['mel_text_secondary'], bg).toFixed(2)} < 4.5`);
});

test('updateNativePlayer defaults to the empty state and never fabricates a track', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const at = activity.indexOf('.method public final updateNativePlayer(Ljava/lang/String;)V');
  const body = activity.slice(at, activity.indexOf('.end method', at));
  const code = body.split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
  // Empty/absent track -> nativeHasTrack=false and the real placeholder text.
  assert.match(code, /const-string v2, "Aucune lecture en cours"/);
  assert.match(code, /iput-boolean v1, p0, Lcom\/melodix\/music\/MainActivity;->nativeHasTrack:Z/);
  // Polarity guard: the "no track" branch must be taken when isEmpty() is TRUE,
  // i.e. if-nez (MEL-BUG-019 taught us if-eqz inverts the intent here too).
  const isEmpty = code.indexOf('Ljava/lang/String;->isEmpty()Z');
  const after = code.slice(isEmpty, code.indexOf('\n    :native_player_track_flag', isEmpty));
  assert.match(after, /if-nez v1, :native_player_no_track/,
    'a NON-empty track must set the flag; the branch on empty must be if-nez');
  // Cohérence des 3 sites: le flag vaut "piste présente" partout. Avant, la
  // double inversion (écriture if-eqz + lecteurs if-eqz) donnait le bon résultat
  // par accident; un seul site "corrigé" aurait inversé le comportement réel.
  const screen = activity.slice(activity.indexOf('.method public final setNativeScreen'),
    activity.indexOf('.end method', activity.indexOf('.method public final setNativeScreen')));
  assert.match(screen, /iget-boolean v\d+, p0, Lcom\/melodix\/music\/MainActivity;->nativeHasTrack:Z\s*\n\s*if-nez v\d+, :show_native_mini_player/,
    'setNativeScreen: flag=1 -> mini visible');
  assert.match(code, /iget-boolean v\d+, p0, Lcom\/melodix\/music\/MainActivity;->nativeHasTrack:Z\s*\n\s*if-nez v\d+, :native_player_mini_visible/,
    'updateNativePlayer: flag=1 -> mini visible');
});

test('player controls delegate to the real bridge/navigation, never simulate', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  // Play/pause goes through the JS bridge (the real transport), nothing local.
  const at = activity.indexOf('.method public final onNativePlayPauseClick(Landroid/view/View;)V');
  const body = activity.slice(at, activity.indexOf('.end method', at));
  assert.match(body, /runNativeJavascript\(Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(body, /nativeHasTrack:Z\s*\n?\s*const\/4 v\d+, 0x1/,
    'the click handler must not flip the track flag locally');
  // Expand opens the native player screen, it does not invent playback.
  const ex = activity.indexOf('.method public final onNativePlayerExpandClick(Landroid/view/View;)V');
  const exBody = activity.slice(ex, activity.indexOf('.end method', ex));
  assert.match(exBody, /setNativeScreen\(Ljava\/lang\/String;\)V/);
});

test('player ids are stable across both layouts (public.xml contract)', () => {
  const pub = read('res/values/public.xml');
  for (const name of ['nativePlayerPanel', 'nativeMiniPlayerContainer', 'nativeMiniPlayer',
    'nativePlayerProgress', 'nativeMiniProgress', 'nativePlayPauseButton', 'nativePlayerArtwork']) {
    assert.match(pub, new RegExp(`name="${name}" id="0x[0-9a-f]+"`), `public.xml must keep ${name}`);
  }
  for (const layout of LAYOUTS) {
    const xml = read(layout);
    for (const name of ['nativePlayerPanel', 'nativeMiniPlayer', 'nativePlayerProgress', 'nativeMiniProgress', 'nativePlayPauseButton', 'nativePlayerArtwork']) {
      assert.ok(xml.includes(`@id/${name}`) || xml.includes(`@+id/${name}`), `${layout} must contain ${name}`);
    }
  }
});
