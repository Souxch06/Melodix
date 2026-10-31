// [contrat][structurel][A TESTER SUR TELEPHONE]
// P0 V30 : vérifie les polarités de nullité du renderer natif, sa garde de
// contenu réel, la grille rapide et les solutions de repli vers le WebView.
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

test('[P0v30] render(): conteneur nul -> repli WebView, conteneur valide -> rendu', () => {
  const s = shelfSmali();
  assert.ok(s.includes('if-eqz v13, :shelf_container_missing'),
    'le conteneur nul utilise le repli; le conteneur valide passe au rendu');
  assert.ok(!s.includes('if-nez v13, :shelf_container_missing'), 'l’inversion v30 ne doit pas revenir');
  assert.match(s, /:shelf_container_missing[\s\S]*?revealWebUi\(\)V/);
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

test('[P0v30] Home vide ou invalide reste sur Spotify et ne marque pas home-rendered', () => {
  const render = method(shelfSmali(), '.method public static render(');
  assert.match(render, /:shelf_no_cards[\s\S]*?reason=no-real-spotify-cards[\s\S]*?revealWebUi\(\)V[\s\S]*?return-void/);
  assert.match(render, /:catch_0[\s\S]*?reason=invalid-json[\s\S]*?revealWebUi\(\)V/);
  assert.match(render, /:shelf_done[\s\S]*?home-cards-attached[\s\S]*?showNativeUi\(\)V/,
    'le renderer rapporte seulement l’attachement; la visibilité est vérifiée ailleurs');
  assert.doesNotMatch(render, /"home-rendered"|nativeHomeContentReady:Z/);
  assert.doesNotMatch(render, /Chargement de votre accueil/,
    'aucune vue de chargement native ne couvre Spotify sans cartes');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.method public final completeNativeUiVisibility\(Z\)Z[\s\S]*?hasMeasuredVisibleNativeHomeCard\(\)Z[\s\S]*?"home-rendered"/);
});

test('[P0v30] MainActivity protège le takeover et initialise la route avant le renderer', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.field private nativeHomeContentReady:Z/);
  const show = method(activity, '.method public final showNativeUi()V');
  assert.match(show, /nativeCurrentScreen[\s\S]*?nativeHomeCardsAttached:Z[\s\S]*?home-cards-not-attached[\s\S]*?revealWebUi\(\)V/);
  assert.match(show, /setVisibility\(I\)V[\s\S]*?bringToFront\(\)V[\s\S]*?requestLayout\(\)V[\s\S]*?NativeUiVisibilityTraceRunnable/);
  const apply = method(activity, '.method public final applyNativeUiData(');
  const initialHome = apply.indexOf(':apply_home_initial_route');
  const route = apply.indexOf('setNativeScreen(Ljava/lang/String;)V', initialHome);
  const renderHome = apply.indexOf('renderNativeRows', route);
  assert.ok(initialHome >= 0 && route > initialHome && renderHome > route,
    'route Home posée avant renderNativeRows, même au premier payload');
  const reveal = method(activity, '.method public final revealWebUi()V');
  assert.match(reveal, /->H:Landroidx\/constraintlayout\/widget\/ConstraintLayout;[\s\S]*?0x7f09022f[\s\S]*?setVisibility\(I\)V/,
    'le repli cache le splash et le root natif pour révéler le WebView');
});

test('[P0v30] trace différée vérifie global bounds, parent, empilement et cartes visibles', () => {
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
  assert.match(trace, /completeNativeUiVisibility\(Z\)Z[\s\S]*?attempts:I[\s\S]*?revealWebUi\(\)V/,
    'failed measurements retry finitely then keep Spotify visible');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(activity, /\.method private hasMeasuredVisibleNativeHomeCard\(\)Z[\s\S]*?View;->isShown\(\)Z[\s\S]*?getGlobalVisibleRect\(Landroid\/graphics\/Rect;\)Z[\s\S]*?Rect;->width\(\)I[\s\S]*?Rect;->height\(\)I/);
});
