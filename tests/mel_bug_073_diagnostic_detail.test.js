const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');

const main = read('smali/com/melodix/music/MainActivity.smali');
const app = read('smali/com/melodix/music/AppSingleton.smali');
const method = (src, sig) => {
  const at = src.indexOf(sig);
  assert.ok(at >= 0, sig + ' existe');
  return src.slice(at, src.indexOf('.end method', at));
};

test('MEL-BUG-073a: the diag journal is 1600 chars and keeps the startup head', () => {
  const note = method(app, '.method public static noteDiag(');
  // The old budget was 600 (0x258) of TAIL only: every report lost the launch
  // sequence and ended mid-entry.
  // Strip comments first: the comment explains the removed 0x258 budget.
  const noteCode = note.split('\n').map((l) => l.replace(/^\s*#.*$/, '')).join('\n');
  assert.doesNotMatch(noteCode, /0x258/, 'l’ancien plafond de 600 caractères est retiré');
  assert.match(note, /const\/16 v0, 0x640/, 'nouveau budget : 1600 caractères');
  assert.match(note, /const\/16 v0, 0x200[\s\S]*?substring\(I\)Ljava\/lang\/String;[\s\S]*?const-string v3, " \.\.\. "/,
    'tête de 512 caractères + marqueur d’élision + queue');
  assert.match(note, /:diag_store\n\s*sput-object v1, Lcom\/melodix\/music\/AppSingleton;->diagNative:Ljava\/lang\/String;/,
    'stockage inchangé (lecteurs existants préservés)');
  // diagNative is only ever read outside this method.
  const writers = (main + fs.readFileSync(path.join(root, 'smali/com/melodix/music/RuntimeDiagnostic.smali'), 'utf8'))
    .match(/sput-object [^,]+, Lcom\/melodix\/music\/AppSingleton;->diagNative/g) || [];
  assert.equal(writers.length, 0, 'diagNative n’a qu’un seul écrivain (noteDiag)');
});

test('MEL-BUG-073b: every refusal is counted, so one report says whether the gate fired', () => {
  for (const field of ['diagRouteDropped', 'diagShowDropped', 'diagPayloadDropped', 'diagLoginRequested']) {
    assert.ok(main.includes('.field private ' + field + ':I'), field + ' déclaré');
  }
  const route = method(main, '.method public final activateNativeUiRoute(');
  assert.match(route, /diagRouteDropped:I\s*\n\s*add-int\/lit8 v1, v1, 0x1/);
  const show = method(main, '.method public final showNativeUiFrom(');
  assert.match(show, /diagShowDropped:I\s*\n\s*add-int\/lit8 v1, v1, 0x1/);
  const rows = method(main, '.method public final renderNativeRows(');
  assert.match(rows, /diagPayloadDropped:I\s*\n\s*add-int\/lit8 v0, v0, 0x1/);
  const login = method(main, '.method private final applyLoginWebUi(');
  assert.match(login, /diagLoginRequested:I\s*\n\s*add-int\/lit8 v0, v0, 0x1/);
});

test('MEL-BUG-073c: refusals now reach the journal the user copies (noteDiag)', () => {
  const show = method(main, '.method public final showNativeUiFrom(');
  // Anchor on the LABEL line (a bare indexOf hits the `if-eqz` reference).
  const labelAt = show.search(/^\s*:native_show_gate_done\s*$/m);
  assert.ok(labelAt > 0, 'label :native_show_gate_done présent');
  const drop = show.slice(0, labelAt);
  assert.match(drop, /AppSingleton;->noteDiag\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'le refus de peinture écrit dans noteDiag');
  const route = method(main, '.method public final activateNativeUiRoute(');
  assert.match(route, /noteDiag\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'le refus de route écrit dans noteDiag');
  const rows = method(main, '.method public final renderNativeRows(');
  assert.match(rows, /:render_rows_unproven_drop[\s\S]*?noteDiag\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'le refus de payload écrit dans noteDiag');
});

test('MEL-BUG-073d: the copied text carries locks, counters and the visible surface', () => {
  const diag = method(main, '.method private final buildDiagnosticText()');
  assert.match(diag, /const-string v1, " gates="/, 'compteurs des trois verrous');
  assert.match(diag, /const-string v1, " loginN="/, 'nombre d’affirmations de la surface login');
  assert.match(diag, /const-string v1, " root="/, 'surface réellement visible');
  assert.match(diag, /diagRouteDropped:I[\s\S]*?diagShowDropped:I[\s\S]*?diagPayloadDropped:I/,
    'route/show/rows dans cet ordre');
  // Still no secrets: the cookie is tested for presence only.
  assert.doesNotMatch(diag, /getAllCookies|sp_dc=[^"]|getToken/);
  // The startup sequence is journaled explicitly.
  const ensure = method(main, '.method public final ensureWebPageLoaded(');
  assert.match(ensure, /const-string v1, "ensure"[\s\S]*?const-string v2, "cold"/, 'démarrage à froid journalisé');
  assert.match(ensure, /const-string v1, "ensure"[\s\S]*?const-string v2, "warm"/, 'démarrage à chaud journalisé');
});
