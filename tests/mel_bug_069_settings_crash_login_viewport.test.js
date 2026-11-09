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
  const gate = fs.readFileSync(require('node:path').join(__dirname, '..', 'smali/com/melodix/music/NativeSessionGate.smali'), 'utf8');
  const finished = method(main, '.method public final onWebViewPageFinished()V');
  assert.match(finished, /NativeSessionGate;->pageFinished[\s\S]*?showNativeUiFrom/);
  const check = method(gate, '.method public static pageFinished(');
  assert.match(check, /open.spotify.com[\s\S]*?freshLogin:Z[\s\S]*?->verify/);
  assert.doesNotMatch(check, /showNativeUi|removeAllCookies|getCookie/);
  assert.match(method(main, '.method public final showNativeUiFrom('), /NativeSessionGate;->blocked/);
});

test('MEL-BUG-070: no payload branch can draw Home over an unproven login surface', () => {
  // The real leak seen on device: auth=false + sp_dc=true, Spotify auto-continues
  // to open.spotify.com/?flow_ctx=..., the shell emits Home rows and the payload
  // path rendered them although the login surface was active
  // ("route home | render native-rows" in the journal).
  const home = stripComments(method(main, '.method public final applyNativeUiData('));
  // Anchor on the LABEL definition (a bare indexOf would hit the `if-eqz`
  // reference and slice the wrong window).
  const def = /^\s*:apply_home_initial_route\s*$/m.exec(home);
  assert.ok(def, 'branche home-rows présente');
  const at = def.index;
  const endDef = /^\s*:apply_home\s*$/m.exec(home.slice(at + 1));
  assert.ok(endDef, 'label :apply_home présent');
  const gate = home.slice(at, at + 1 + endDef.index);
  assert.match(gate, /isLoginWebRoute\(\)Z[\s\S]*?if-eqz v4, :apply_home_unproven_drop[\s\S]*?AppSingleton;->B:Z[\s\S]*?if-nez v4, :apply_home_unproven_drop/,
    'les lignes Home sont ignorées tant que la surface login est active et la session non prouvée');
  // The drop label is defined after the render call, outside the gated window.
  const dropDef = /^\s*:apply_home_unproven_drop\s*$/m.exec(home);
  assert.ok(dropDef, 'sortie dédiée présente');
  const endDrop = /^\s*:check_media\s*$/m.exec(home.slice(dropDef.index + 1));
  assert.ok(endDrop, 'label :check_media présent');
  const drop = home.slice(dropDef.index, dropDef.index + 1 + endDrop.index);
  assert.match(drop, /home-rows-dropped-unproven-session[\s\S]*?return-void/,
    'sortie dédiée, aucune navigation déclenchée (pas de boucle)');
  assert.doesNotMatch(drop, /renderNativeRows|showNativeUiFrom|loadUrl/,
    'le refus ne rend rien et ne navigue pas');

  const rows = stripComments(method(main, '.method public final renderNativeRows('));
  assert.match(rows,
    /TextUtils;->isEmpty\(Ljava\/lang\/CharSequence;\)Z[\s\S]*?isLoginWebRoute\(\)Z[\s\S]*?AppSingleton;->B:Z[\s\S]*?:render_rows_unproven_drop/,
    'renderNativeRows refuse un payload non vide quand la session n’est pas prouvée sur la surface login');
  // MEL-BUG-073: the refusal is counted and written to the user-visible journal.
  assert.match(rows, /:render_rows_unproven_drop[\s\S]*?diagPayloadDropped:I[\s\S]*?const-string v2, "dropped-unproven"[\s\S]*?noteDiagProof\([\s\S]*?return-void/);
  // Empty payloads still proceed: they are the login flow's own placeholders.
  assert.match(rows, /if-eqz v0, :render_rows_proof_gate/, 'les payloads vides sautent la porte et restent rendus');
  // Diagnostic stays a fixed label: no cookie, no URL.
  assert.doesNotMatch(rows.slice(rows.indexOf(':render_rows_unproven_drop')), /getUrl|getCookie|sp_dc/,
    'aucune URL ni cookie dans le journal de refus');
});

test('session gate: warm player stays hidden until valid, without repeated login', () => {
  const gate = fs.readFileSync(require('node:path').join(__dirname, '..', 'smali/com/melodix/music/NativeSessionGate.smali'), 'utf8');
  const ensure = method(main, '.method public final ensureWebPageLoaded()V');
  assert.match(ensure, /if-nez v1, :done/);
  const show = method(main, '.method public final showNativeUiFrom(');
  assert.match(show, /NativeSessionGate;->blocked[\s\S]*?return-void/);
  const blocked = method(gate, '.method public static blocked(');
  assert.match(blocked, /const\/4 v1, 0x3[\s\S]*?if-eq v0, v1, :allowed/);
  assert.match(blocked, /loginActive:Z[\s\S]*?applySessionLoginSurface/);
});

test('MEL-BUG-072: the shell and the route are refused without a session proof', () => {
  // Every device journal starts with "route home" BEFORE any "data native-payload":
  // the native home was painted by activateNativeUiRoute -> showNativeUiFrom,
  // not by the payload path. Both are gated, and the label goes into the bounded
  // journal the user actually copies (AppSingleton.noteDiag) — the earlier
  // CrashGuard/Overlay labels never reached a report.
  const show = stripComments(method(main, '.method public final showNativeUiFrom('));
  const head = show.slice(show.indexOf('.method'));
  // The gate is the FIRST thing the method does: it must precede both the
  // login-route early return and any visibility change on nativeRoot.
  // MEL-BUG-076: this test used to pin `if-eqz v0, :native_show_gate_done`, which
  // is the INVERTED sense ("if NOT proven, paint"). It was green on the bug.
  // The gate must skip the paint when the session is unproven: if-nez.
  const gateAt = head.indexOf('if-nez v0, :native_show_gate_done');
  assert.ok(gateAt > 0, 'garde de preuve dans showNativeUiFrom');
  assert.ok(gateAt < head.indexOf('isLoginWebRoute()Z'), 'la garde précède le retour login');
  assert.ok(gateAt < head.indexOf('0x7f09022f'), 'la garde précède nativeRoot');
  assert.match(head.slice(0, gateAt),
    /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->B:Z/,
    'la preuve testée est AppSingleton.B (libraryV3)');
  assert.match(head,
    /diagShowDropped:I[\s\S]*?const-string v1, "show-native"\s*\n\s*const-string v2, "dropped-unproven"[\s\S]*?AppSingleton;->noteDiagProof\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V[\s\S]*?applyLoginWebUi[\s\S]*?return-void\n\s*\n\s*:native_show_gate_done/,
    'refus journalisé dans noteDiag + surface login réaffirmée + retour immédiat');

  const route = stripComments(method(main, '.method public final activateNativeUiRoute('));
  assert.match(route,
    /AppSingleton;->B:Z\s*\n\s*if-nez v0, :native_route_activation_gate_done[\s\S]*?diagRouteDropped:I[\s\S]*?"route"[\s\S]*?"dropped-unproven"[\s\S]*?noteDiagProof\([\s\S]*?return-void/,
    'une route non prouvée ne rend rien et n’écrit pas "route <screen>"');
  const routeGate = route.indexOf('native_route_activation_gate_done');
  assert.ok(routeGate < route.indexOf('setNativeScreen'), 'la garde précède setNativeScreen');
  assert.ok(routeGate < route.indexOf('renderNativeRows'), 'la garde précède tout rendu');

  // Neither refusal may navigate (that would loop) or log sensitive data.
  for (const body of [head.slice(gateAt, head.indexOf(':native_show_gate_done')), route.slice(0, routeGate)]) {
    // `getUrl` is allowed: the local shell asset (file://) is exempted from the
    // gate so the UI metric CI keeps working. Nothing is navigated and no
    // cookie value is read.
    assert.doesNotMatch(body, /loadUrl|getCookie|sp_dc|token/,
      'aucune navigation ni donnée sensible dans un refus');
  }
});
