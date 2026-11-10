// MEL-BUG-063 (2026-11-07, capture 22:43) — polish de l'UI native demandé après
// test.96 : (a) la ligne de diagnostic de la carte d'accueil doit être
// directement lisible (grosse, mono, couleur warning) au lieu d'être noyée dans
// le petit sous-titre ; (b) les réglages réordonnés comme une vraie appli mobile
// (compte → lecture → apparence → notifications → actions Spotify, diagnostic
// en dernier, doublon de déconnexion supprimé) ; (c) onglets et boutons
// assainis via la palette MelColors.
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

test('MEL-BUG-063a (revu par MEL-BUG-083): the [auth=…] suffix is still split out of the sentence, but it is no longer painted big in red', () => {
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const status = method(renderer, '.method private static renderHomeStatus(');
  // The split itself was the fix for "the error is buried in the sentence":
  // it stays, because the card must show a clean one-sentence message.
  assert.match(status, /const-string v4, " \[auth="/,
    'diag marker still located');
  assert.match(status, /invoke-virtual \{v1, v6, v4\}, Ljava\/lang\/String;->substring\(II\)Ljava\/lang\/String;/,
    'subtitle keeps only the text before the diag');
  assert.match(status, /invoke-virtual \{v1, v6\}, Ljava\/lang\/String;->substring\(I\)Ljava\/lang\/String;/,
    'diag part extracted');

  // MEL-BUG-083 supersedes the presentation: a 16sp bold red monospace banner
  // under a one-sentence message reads as a crash. The string now goes to a
  // collapsed "Détails techniques" disclosure, kept at 12sp secondary.
  const at = status.indexOf('\n    :home_status_diag\n');
  assert.ok(at >= 0, ':home_status_diag label defined');
  const diag = status.slice(at, status.indexOf('\n    :home_status_actions\n', at));
  assert.doesNotMatch(diag, /MelColors;->warning:I/, 'no full-size red line any more');
  assert.doesNotMatch(diag, /0x41800000/, 'no 16sp technical banner any more');
  assert.doesNotMatch(diag, /Typeface;->MONOSPACE/, 'the machine text is not the second thing you read');
  assert.match(diag, /NativeHomeShelfRenderer;->addHomeStatusDetails\(/,
    'the split string is handed to the disclosure instead');

  // The plain sentence path is unchanged (14sp, textSecondary).
  assert.match(status, /sget v7, Lcom\/melodix\/music\/MelColors;->textSecondary:I[\s\S]*?const\/high16 v9, 0x41600000/);
});

test('MEL-BUG-063a: warning color is in the palette and mirrored by MelColors', () => {
  const colors = read('res/values/colors.xml');
  const m = colors.match(/<color name="mel_warning">#([0-9a-fA-F]{6,8})<\/color>/);
  assert.ok(m, 'mel_warning defined in colors.xml');
  const mc = read('smali/com/melodix/music/MelColors.smali');
  assert.ok(mc.includes('.field public static warning:I'), 'MelColors.warning field');
  const clinit = mc.slice(mc.indexOf('<clinit>'));
  const cm = clinit.match(/const v0, (0x[0-9a-fA-F]+)\s+sput v0, Lcom\/melodix\/music\/MelColors;->warning:I/);
  assert.ok(cm, 'warning initialised');
  const xmlVal = (m[1].length === 6 ? parseInt(m[1], 16) | 0xff000000 : parseInt(m[1], 16)) >>> 0;
  assert.equal(parseInt(cm[1], 16) >>> 0, xmlVal, 'MelColors.warning == mel_warning');
});

test('MEL-BUG-063b: settings rows are reordered mobile-app style, no duplicate logout, diag last', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const i = shell.indexOf('function buildSpotifySettingsRows');
  const seg = shell.slice(i, shell.indexOf('return rows;', i));
  const sections = [...seg.matchAll(/section: '([^']+)'/g)].map((m) => m[1]);
  const first = (name) => sections.indexOf(name);
  assert.ok(first('Compte et connexion') >= 0, 'compte section present');
  assert.ok(first('Compte et connexion') < first('Préférences de lecture'), 'compte before lecture prefs');
  assert.ok(first('Préférences de lecture') < first('Apparence et thème'), 'lecture before apparence');
  assert.ok(first('Apparence et thème') < first('Notifications'), 'apparence before notifications');
  assert.ok(first('Notifications') < first('Spotify'), 'notifications before Spotify actions');
  assert.equal(seg.split("'Se déconnecter de Spotify'").length - 1, 1,
    'exactly one logout row (the duplicate in the Spotify section is gone)');
  const spotifySeg = seg.slice(seg.lastIndexOf("section: 'Spotify'"));
  assert.ok(spotifySeg.includes("title: 'Diagnostic interne'"), 'diagnostic row kept');
  // diag is the last row of the Spotify group (it is the last section overall)
  const blocks = seg.split(/\n            \},\n/).map((b) => b.replace(/^\s*\{/, '').replace(/\}\s*$/, ''));
  assert.ok(blocks[blocks.length - 1].includes("title: 'Diagnostic interne'"),
    'Diagnostic interne is the final settings row');
});

test('MEL-BUG-063b: native fallback settings JSON follows the same order', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const line = main.split('\n').find((l) => l.includes('Paramètres indisponibles') && l.includes('const-string'));
  assert.ok(line, 'fallback settings JSON exists');
  const raw = line.slice(line.indexOf('"') + 1, line.lastIndexOf('"')).replace(/\\"/g, '"');
  const rows = JSON.parse(raw);
  const sections = rows.map((r) => r.section);
  const first = (name) => sections.indexOf(name);
  assert.equal(sections[0], 'État', 'loading/error row stays first');
  assert.ok(first('Compte et connexion') < first('Préférences de lecture'));
  assert.ok(first('Préférences de lecture') < first('Apparence et thème'));
  assert.ok(first('Apparence et thème') < first('Notifications'));
  assert.ok(first('Notifications') < first('Spotify'));
  assert.equal(rows.filter((r) => r.title === 'Se déconnecter de Spotify').length, 1,
    'no duplicate logout in the fallback');
  const spot = rows.filter((r) => r.section === 'Spotify');
  assert.equal(spot[spot.length - 1].title, 'Diagnostic interne', 'diag last in Spotify group');
});

test('MEL-BUG-063b: built shell asset stays under the 108867-byte ceiling', () => {
  const size = fs.statSync(path.join(repo, 'assets/native_ui_shell.js')).size;
  assert.ok(size <= 108867, `native_ui_shell.js ${size} <= 108867`);
});

test('MEL-BUG-063c: tab bar paints from the palette (no raw gray), active tab keeps accent pill', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const tab = method(main, '.method public final styleNativeTab(');
  assert.ok(!tab.includes('-0x888889'), 'no raw gray constant in styleNativeTab');
  assert.match(tab, /:native_tab_inactive\s*\n\s*sget v2, Lcom\/melodix\/music\/MelColors;->textTertiary:I\s*\n\s*sget v4, Lcom\/melodix\/music\/MelColors;->textTertiary:I/,
    'inactive tab = textTertiary for label and icon');
  assert.match(tab, /sget v2, Lcom\/melodix\/music\/MelColors;->textPrimary:I\s*\n\s*sget v4, Lcom\/melodix\/music\/MelColors;->accent:I/,
    'active tab = textPrimary label + accent icon');
  assert.match(tab, /MelColors;->glow:I[\s\S]*?setCornerRadius[\s\S]*?setBackground/, 'active pill kept');
});

test('MEL-BUG-063c: home card action buttons are 15sp, secondary label softened', () => {
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const action = method(renderer, '.method private static createHomeStatusAction(');
  assert.match(action, /const\/high16 v2, 0x41700000\s*\n\s*invoke-virtual \{v0, v2\}, Landroid\/widget\/TextView;->setTextSize\(F\)V/,
    'action label 15sp');
  assert.match(action, /:home_status_action_secondary\s*\n\s*sget v3, Lcom\/melodix\/music\/MelColors;->textSecondary:I/,
    'secondary button label in textSecondary');
  assert.match(action, /sget v3, Lcom\/melodix\/music\/MelColors;->textPrimary:I\s*\n\s*const-string v2, "native_button_green"/,
    'primary gradient button has white text');
});

test('MEL-BUG-063c: header settings gear is accent-tinted in every layout variant', () => {
  for (const f of ['res/layout/activity_main.xml', 'res/layout-land/activity_main.xml',
    'res/layout-sw600dp/activity_main.xml', 'res/layout-sw600dp-land/activity_main.xml']) {
    const xml = read(f);
    const m = xml.match(/android:id="@id\/nativeSettingsButton"[\s\S]{0,200}?android:tint="([^"]+)"/);
    assert.ok(m, f + ' has the settings button');
    assert.equal(m[1], '@color/mel_accent', f + ' gear tinted accent');
  }
});
