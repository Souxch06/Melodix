// [contrat][structurel][A TESTER SUR TELEPHONE]
// P0 V30 : vérifie les polarités de nullité du renderer natif, sa garde de
// contenu réel, la grille rapide et l'absence de fallback WebView automatique.
// Ces assertions Smali ne prouvent ni l'assemblage Android ni un rendu appareil.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

function read(relative) {
  return fs.readFileSync(path.join(__dirname, '..', relative), 'utf8');
}

function shelfSmali() {
  return read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
}

function method(text, signature) {
  const start = text.indexOf(signature);
  assert.ok(start >= 0, `méthode absente: ${signature}`);
  return text.slice(start, text.indexOf('.end method', start));
}

test('[P0v30] render(): conteneur nul -> garde native sans fallback Web, conteneur valide -> rendu', () => {
  const s = shelfSmali();
  assert.ok(s.includes('if-eqz v13, :shelf_container_missing'),
    'le conteneur nul prend la branche de garde; le conteneur valide passe au rendu');
  assert.ok(!s.includes('if-nez v13, :shelf_container_missing'), 'l’inversion v30 ne doit pas revenir');
  const render = method(s, '.method public static render(');
  const missing = render.slice(render.indexOf(':shelf_container_missing'));
  assert.match(missing, /reason=content-container[\s\S]*?return-void/);
  assert.doesNotMatch(render, /revealWebUi\(\)V|setNativeScreen\(Ljava\/lang\/String;\)V/,
    'un conteneur manquant n’autorise ni takeover Spotify Web ni mutation de route');
});

test('[P0v30] render(): les rows JSON valides et les premières sections ne sont pas sautées', () => {
  const s = shelfSmali();
  assert.ok(s.includes('if-eqz v5, :shelf_next'), 'optJSONObject nul -> row suivante');
  assert.ok(!s.includes('if-nez v5, :shelf_next'), 'if-nez v5 sauterait les rows valides');
  assert.ok(s.includes('if-eqz v3, :shelf_new_section'), 'la première section est créée');
  assert.ok(s.includes('if-eqz v3, :shelf_next'), 'une section absente est sautée dans le bon sens');
  assert.ok(!s.includes('if-nez v3, :shelf_new_section'));
});

test('[P0v30] Home natif accepte seulement un vrai titre + URI Spotify', () => {
  const s = shelfSmali();
  const render = method(s, '.method public static render(');
  const quick = method(s, '.method private static createQuickTile(');
  assert.match(render, /optString\(Ljava\/lang\/String;Ljava\/lang\/String;\)Ljava\/lang\/String;[\s\S]*?invoke-virtual \{v6, v7\}, Ljava\/lang\/String;->startsWith\(Ljava\/lang\/String;\)Z/);
  assert.match(render, /:shelf_add[\s\S]*?addView\(Landroid\/view\/View;\)V[\s\S]*?noteNativeHomeCardAttached\(Landroid\/view\/View;\)V/);
  assert.doesNotMatch(render, /MainActivity;->nativeHomeContentReady:Z/,
    'the renderer uses public state methods instead of illegal private-field access');
  assert.match(quick, /String;->isEmpty\(\)Z[\s\S]*?String;->startsWith\(Ljava\/lang\/String;\)Z[\s\S]*?return-object v3/);
  assert.doesNotMatch(render, /const-string v\d+, "Spotify"/, 'aucun titre de carte fictif');
});

test('[P0v30] grille rapide: seuil deux, cap six, saute les tuiles nulles et les lignes vides', () => {
  const quickGrid = method(shelfSmali(), '.method private static renderQuickGrid(');
  assert.match(quickGrid, /invoke-virtual \{p2\}, Lorg\/json\/JSONArray;->length\(\)I[\s\S]*?const\/4 v1, 0x2[\s\S]*?if-lt v0, v1, :quick_grid_done/,
    'moins de deux cartes ne crée pas la grille');
  assert.match(quickGrid, /const\/4 v1, 0x6[\s\S]*?if-le v0, v1, :quick_grid_begin[\s\S]*?const\/4 v0, 0x6/,
    'la grille est bornée à six éléments');
  assert.match(quickGrid, /move-result-object v5[\s\S]*?if-eqz v5, :quick_grid_inc/,
    'une tuile null est simplement ignorée');
  assert.match(quickGrid, /getChildCount\(\)I[\s\S]*?if-lez v4, :quick_grid_row/,
    'une ligne sans aucune tuile réelle n’est pas ajoutée');
});

test('[P0v30] raw empty or invalid Home becomes a native retry state; explicit status is measured content', () => {
  const renderer = shelfSmali();
  const render = method(renderer, '.method public static render(');
  const status = method(renderer, '.method private static renderHomeStatus(');
  assert.match(render, /:shelf_no_cards[\s\S]*?reason=no-real-spotify-cards; native retry state requested[\s\S]*?NativeHomeShelfRenderer;->render\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;\)V[\s\S]*?return-void/);
  assert.match(render, /:catch_0[\s\S]*?reason=invalid-json[\s\S]*?NativeHomeShelfRenderer;->render\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(render, /revealWebUi\(\)V/,
    'empty, invalid, or malformed payloads do not hand foreground ownership to Spotify Web');
  assert.match(render, /kind[\s\S]*?renderHomeStatus[\s\S]*?native-home-status-attached[\s\S]*?showNativeUi\(\)V/,
    'seul un payload explicitement typé état peut prendre le chemin status');
  assert.match(render, /:shelf_done[\s\S]*?home-cards-attached[\s\S]*?showNativeUi\(\)V/,
    'les cartes réelles restent séparées de l’état natif');
  assert.doesNotMatch(render, /"home-rendered"|nativeHomeContentReady:Z/);
  assert.doesNotMatch(status, /spotify:(?:playlist|album|artist|track):|nativeHomeCardsAttached/,
    'le statut ne devient ni carte Spotify ni flag de playlist');
  assert.match(status, /createHomeStatusText\(Landroid\/content\/Context;Ljava\/lang\/String;IZF\)Landroid\/widget\/TextView;[\s\S]*?noteNativeHomeStatusAttached\(Landroid\/view\/View;\)V/);
  const statusText = method(renderer, '.method private static createHomeStatusText(');
  assert.match(statusText, /TextView;->setText\(Ljava\/lang\/CharSequence;\)V/);
  const statusActions = method(renderer, '.method private static addHomeStatusActions(');
  assert.match(statusActions, /createHomeStatusAction/);
  const statusButton = method(renderer, '.method private static createHomeStatusAction(');
  assert.match(statusButton, /NativeRowClickListener[\s\S]*?setOnClickListener/);
  assert.match(status, /secondaryUri[\s\S]*?addHomeStatusActions/);
  const cardWidth = method(renderer, '.method private static homeStatusCardWidth(');
  assert.match(status, /homeStatusCardWidth\(Landroid\/content\/Context;Landroid\/view\/View;\)I/);
  // The cap is a design token now, so assert the accessor is consulted and
  // that it still carries the historical 560dp cap, with a wider tablet value.
  assert.match(cardWidth, /View;->getWidth\(\)I[\s\S]*?if-lez v1, :home_status_width_fallback[\s\S]*?widthPixels:I[\s\S]*?NativeUiMetrics;->statusMaxWidth\(Landroid\/content\/Context;\)I/,
    'the status card prefers measured safe content width, falls back before layout, and caps tablet width');
  const metrics = read('smali/com/melodix/music/NativeUiMetrics.smali');
  assert.match(metrics, /statusMaxWidth[\s\S]*?const-string v0, "mel_status_max_width"[\s\S]*?const\/16 v1, 0x230/,
    'the width cap keeps 560dp as its fallback');
  const { loadDimens, resolveSize, PHONE, TABLET } = require('./helpers/mel_dimens');
  assert.equal(resolveSize('@dimen/mel_status_max_width', loadDimens(PHONE)), 560);
  assert.ok(resolveSize('@dimen/mel_status_max_width', loadDimens(TABLET)) > 560,
    'the tablet status card is allowed to be wider than the phone cap');
  assert.match(statusButton, /setMinimumHeight\(I\)V[\s\S]*?setClickable\(Z\)V[\s\S]*?setFocusable\(Z\)V/,
    'each child action has a touch-sized, focusable hit target');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.method public final completeNativeUiVisibility\(Z\)Z[\s\S]*?hasMeasuredVisibleNativeHomeContent\(\)Z[\s\S]*?"home-rendered"/);
  const visibility = method(activity, '.method public final completeNativeUiVisibility(Z)Z');
  assert.doesNotMatch(visibility, /revealWebUi\(\)V/,
    'failed measurements do not switch to Web ownership');
});

test('[P0v30] MainActivity gates Home on an attached card or status and initializes route before render', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.field private nativeHomeContentReady:Z/);
  assert.match(activity, /\.method public final hasNativeHomeContentAttached\(\)Z[\s\S]*?nativeHomeCardsAttached:Z[\s\S]*?nativeHomeStatusAttached:Z/);
  const show = method(activity, '.method public final showNativeUi()V');
  assert.match(show, /showNativeUiFrom\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
  const showFrom = method(activity, '.method public final showNativeUiFrom(');
  assert.match(showFrom, /nativeCurrentScreen[\s\S]*?hasNativeHomeContentAttached\(\)Z[\s\S]*?:native_home_content_check[\s\S]*?Connexion à Spotify[\s\S]*?NativeHomeShelfRenderer;->render/,
    'missing Home content is replaced by a native loading state before visibility measurement');
  assert.doesNotMatch(showFrom, /revealWebUi\(\)V/,
    'the content gate never automatically reveals Spotify Web');
  assert.match(showFrom, /setVisibility\(I\)V[\s\S]*?bringToFront\(\)V[\s\S]*?requestLayout\(\)V[\s\S]*?NativeUiVisibilityTraceRunnable/);
  const apply = method(activity, '.method public final applyNativeUiData(');
  const initialHome = apply.indexOf(':apply_home_initial_route');
  const route = apply.indexOf('setNativeScreen(Ljava/lang/String;)V', initialHome);
  const renderHome = apply.indexOf('renderNativeRows', route);
  assert.ok(initialHome >= 0 && route > initialHome && renderHome > route,
    'route Home posée avant renderNativeRows, même au premier payload');
  const reveal = method(activity, '.method public final revealWebUi()V');
  assert.match(reveal, /legacy-web-reveal-request[\s\S]*?revealWebUiFrom\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'the legacy method is only a guarded request, not a visibility command');
  const guardedReveal = method(activity, '.method public final revealWebUiFrom(');
  assert.match(guardedReveal, /isLoginWebRoute\(\)Z[\s\S]*?web_reveal_blocked[\s\S]*?showNativeUiFrom/,
    'only the explicitly requested login route may reveal the WebView');
  assert.doesNotMatch(guardedReveal, /revealWebUi\(\)V/);
});

test('[P0v30] trace différée vérifie global bounds, parent, empilement et contenu Home visible', () => {
  const trace = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');
  assert.match(trace, /View;->isShown\(\)Z/);
  assert.match(trace, /View;->getWidth\(\)I/);
  assert.match(trace, /View;->getHeight\(\)I/);
  assert.match(trace, /View;->getParent\(\)Landroid\/view\/ViewParent;/);
  assert.match(trace, /View;->getElevation\(\)F/);
  assert.match(trace, /ViewGroup;->indexOfChild\(Landroid\/view\/View;\)I/);
  assert.match(trace, /0x7f0900ea[\s\S]*?__sfNativeUiHScrollIndex/,
    'the native root is compared with the actual WebView horizontal-scroll host');
  assert.match(trace, /if-le v8, v9, :native_layout_root_checked/,
    'nativeRoot must be the later sibling');
  assert.match(trace, /cmpl-float[\s\S]*?getGlobalVisibleRect\(Landroid\/graphics\/Rect;\)Z/,
    'the root must also be in front and intersect the window');
  assert.match(trace, /completeNativeUiVisibility\(Z\)Z[\s\S]*?attempts:I[\s\S]*?postDelayed\(Ljava\/lang\/Runnable;J\)Z[\s\S]*?:native_layout_give_up/,
    'failed measurements retry finitely');
  const timeout = trace.slice(trace.indexOf(':native_layout_give_up'));
  assert.match(timeout, /native-ui-visibility-timeout[\s\S]*?visibility-timeout[\s\S]*?traceNativeDisplayOwner[\s\S]*?native-shell-visibility-pending/,
    'late watchdogs report a sanitized timeout and keep the pending native owner');
  assert.doesNotMatch(trace, /revealWebUi\(\)V/,
    'failed or late measurements never transfer foreground ownership to Spotify Web');
  const completion = method(read('smali/com/melodix/music/MainActivity.smali'), '.method public final completeNativeUiVisibility(Z)Z');
  assert.match(completion, /visibility-measure-pending[\s\S]*?return v0/);
  assert.doesNotMatch(completion, /revealWebUi\(\)V/);
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.method private hasMeasuredVisibleNativeHomeContent\(\)Z[\s\S]*?nativeHomeStatusView:Landroid\/view\/View;[\s\S]*?View;->isShown\(\)Z[\s\S]*?getGlobalVisibleRect\(Landroid\/graphics\/Rect;\)Z[\s\S]*?Rect;->width\(\)I[\s\S]*?Rect;->height\(\)I/);
});
