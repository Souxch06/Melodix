const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const root = path.join(__dirname, '..');
const read = (r) => fs.readFileSync(path.join(root, r), 'utf8');

const main = read('smali/com/melodix/music/MainActivity.smali');
const rowFactory = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
const method = (src, sig) => {
  const at = src.indexOf(sig);
  assert.ok(at >= 0, sig + ' existe');
  return src.slice(at, src.indexOf('.end method', at));
};
// Comments mention the buggy instructions on purpose; assertions must read code.
const stripComments = (src) => src.split('\n')
  .map((line) => line.replace(/^\s*#.*$/, ''))
  .join('\n');

test('MEL-BUG-069a: the switch track state list is a [[I and never stores a reference in an int[]', () => {
  const at = rowFactory.indexOf('\n    :native_settings_switch_build\n');
  assert.ok(at > 0, 'bloc switch présent');
  const sw = stripComments(rowFactory.slice(at, rowFactory.indexOf('\n    :native_settings_pill_text\n', at)));
  // The states array must be created as [[I: `new-array v12, v12, [I` made an
  // int[] and then received `aput v0, v12, v1` with v0 = int[], which is a
  // VerifyError thrown when the Settings screen builds its first row.
  // The exact crash: aput (primitive store) receiving a reference value, or
  // aput-object on the int[] colors array.
  assert.equal((sw.match(/new-array [vp]\d+, [vp]\d+, \[\[I/g) || []).length, 1,
    'un seul tableau de tableaux (les états), le reste est int[]');
  assert.match(sw, /aput v0, v13, v3/, 'le tableau de couleurs reçoit un entier (sget accent)');
  assert.doesNotMatch(sw, /aput-object [vp]\d+, v13, /, 'aucune référence stockée dans le int[] des couleurs');
  assert.match(sw, /new-array v12, v12, \[\[I/, 'le tableau d\'états est un [[I');
  assert.match(sw, /aput-object v0, v12, v3/, 'les états sont écrits avec aput-object');
  assert.match(sw, /const\/4 v13, 0x2\n\s*new-array v13, v13, \[I/, 'les couleurs sont un int[] de taille 2');
  assert.match(sw, /ColorStateList;-><init>\(\[\[I\[I\)V/, 'constructeur (int[][], int[])');
  // The row register v2 must still never be clobbered (MEL-BUG-068d).
  assert.doesNotMatch(sw, /const v2, |new-instance v2, |move-result-object v2/,
    'v2 (la ligne) n\'est jamais écrasé');
});

test('MEL-BUG-069b: no smali file stores a reference in a primitive array', () => {
  let out = '';
  try {
    out = execFileSync('python3', [path.join(root, 'scripts/dex_array_check.py')], { cwd: root, encoding: 'utf8' });
  } catch (err) {
    out = String(err.stdout || '') + String(err.stderr || '');
    assert.fail('array element-type errors found:\n' + out);
  }
  assert.match(out, /no array element-type errors/);
});

test('MEL-BUG-069c: every app-class invoke/field reference resolves (no NoSuchMethodError)', () => {
  try {
    execFileSync('python3', [path.join(root, 'scripts/dex_ref_check.py')], { cwd: root, encoding: 'utf8' });
  } catch (err) {
    assert.fail('unresolved references:\n' + (err.stdout || '') + (err.stderr || ''));
  }
});

test('MEL-BUG-069d: the login surface uses the mobile viewport, the shell restores it', () => {
  const login = method(main, '.method private final applyLoginWebUi(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(login, /setUseWideViewPort\(Z\)V[\s\S]*setLoadWithOverviewMode\(Z\)V/,
    'wide viewport + overview mode activés pour la page de connexion');
  assert.match(login, /const\/4 v1, 0x1\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setUseWideViewPort\(Z\)V/,
    'les deux flags sont activés (true)');
  assert.match(login, /const\/16 v1, 0x7d\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'zoom texte ramené à 125 % au lieu de 180 %');
  const shell = method(main, '.method public final showNativeUiFrom(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(shell, /const\/4 v1, 0x0\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setUseWideViewPort\(Z\)V[\s\S]*setLoadWithOverviewMode\(Z\)V/,
    'le shell natif restaure wideViewPort=false + overview=false (mesure CI préservée)');
  assert.match(shell, /const\/16 v1, 0x64\n\s*invoke-virtual \{v0, v1\}, Landroid\/webkit\/WebSettings;->setTextZoom\(I\)V/,
    'zoom shell inchangé à 100 %');
});

test('MEL-BUG-069e: settings rows keep the hardened factory path', () => {
  const rows = method(main, '.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(rows, /NativeSettingsRowFactory;->create\(Lcom\/melodix\/music\/MainActivity;Lorg\/json\/JSONObject;\)Landroid\/widget\/LinearLayout;/,
    'les lignes de réglages passent toujours par la fabrique durcie');
  // The crash came from the row factory, not from the render loop: the loop
  // still guards the JSON parse with its single JSONException catch.
  assert.equal((rows.match(/\.catch /g) || []).length, 2,
    'seulement les deux catch préexistants (diag Throwable + JSONException) — aucun .catch ajouté');
});

test('MEL-BUG-069f: an unproven auto-continued page never revokes the login surface', () => {
  const finished = stripComments(method(main, '.method public final onWebViewPageFinished()V'));
  // Spotify auto-continues the login URL to open.spotify.com/?flow_ctx=... with
  // a browser-valid sp_dc cookie while AppSingleton.B stays false. That path
  // must keep (and re-assert) the login surface instead of handing the
  // foreground to the native Home.
  assert.match(finished,
    /:native_login_route_finished[\s\S]*sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z[\s\S]*if-eqz v0, :native_login_route_proven[\s\S]*const-string v2, "file:\/\/"[\s\S]*applyLoginWebUi\(Ljava\/lang\/String;Ljava\/lang\/String;\)V[\s\S]*return-void[\s\S]*:native_login_route_proven[\s\S]*iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginWebRequested:Z/,
    'page-finished : unproven + page distante -> login réaffiché, aucune libération');
  const ready = stripComments(method(main, '.method public final postNativeUiReady()V'));
  assert.match(ready,
    /:native_ready_clear_login[\s\S]*sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z[\s\S]*if-nez v0, :native_login_gate_done_keep[\s\S]*startsWith\(Ljava\/lang\/String;\)Z[\s\S]*if-nez v0, :native_login_gate_done_keep[\s\S]*iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeLoginWebRequested:Z/,
    'ui-ready : la surface login ne se referme que si la session est prouvée ou la page locale');
  // The cookie is still only tested for presence (MEL-BUG-067), never logged.
  assert.doesNotMatch(finished, /getCookie|sp_dc/,
    'aucune lecture de cookie dans le chemin page-finished');
});
