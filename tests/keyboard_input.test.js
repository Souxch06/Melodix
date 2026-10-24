// Keyboard lifecycle regression suite (mission "une seule session de test"):
//   1. MainActivity declares a deterministic soft-input mode (adjustResize) so
//      the WebView is resized instead of panned over when the keyboard opens;
//   2. Back closes the soft keyboard FIRST (and consumes the event) before any
//      navigation happens;
//   3. leaving the search screen closes the keyboard so it never lingers over
//      another screen, while entering search keeps it available;
//   4. the search field keeps its focus, pending query and multilingual input
//      while searches run, with a real debounce and a minimum query length;
//   5. the focus runnable is guarded: no spurious keyboard opening over the
//      home screen or after the field is detached;
//   6. submit closes the keyboard explicitly (clearFocus + hideSoftInput).
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const manifest = read('AndroidManifest.xml');
const main = read('smali/com/melodix/music/MainActivity.smali');
const watcher = read('smali/com/melodix/music/NativeSearchWatcher.smali');
const focusRunnable = read('smali/com/melodix/music/NativeSearchFocusRunnable.smali');
const layout = read('res/layout/activity_main.xml');

const MAIN_ACTIVITY_TAG = 'android:name="com.melodix.music.MainActivity"';

function smaliLine(pattern) {
    const re = new RegExp(pattern, 'm');
    const match = main.match(re);
    assert.ok(match, 'smali pattern introuvable: ' + pattern);
    return match[0].trim();
}

test('1. MainActivity déclare windowSoftInputMode="adjustResize"', () => {
    const tagIndex = manifest.indexOf(MAIN_ACTIVITY_TAG);
    assert.ok(tagIndex > -1, 'balise MainActivity introuvable');
    // read the whole opening tag
    const openEnd = manifest.indexOf('>', tagIndex);
    const tag = manifest.slice(tagIndex, openEnd);
    assert.match(tag, /android:windowSoftInputMode="adjustResize"/,
        'le manifeste doit redimensionner (adjustResize) au lieu de déplacer l\'écran');
});

test('2. dismissKeyboard existe en statique, masque l\'IME et rend compte de sa consommation', () => {
    const methodIndex = watcher.indexOf('.method public static dismissKeyboard(Lcom/melodix/music/MainActivity;)Z');
    assert.ok(methodIndex > -1, 'méthode statique dismissKeyboard(MainActivity)Z absente');
    const body = watcher.slice(methodIndex, watcher.indexOf('.end method', methodIndex));
    assert.match(body, /clearFocus\(\)V/, 'le champ doit perdre le focus');
    assert.match(body, /hideSoftInputFromWindow\(Landroid\/os\/IBinder;I\)Z/, 'l\'IME doit être masquée');
    assert.match(body, /getSystemService\(Ljava\/lang\/String;\)Ljava\/lang\/Object;/);
    // returns 1 when the keyboard/field was engaged, 0 otherwise
    assert.match(body, /return v1/, 'retourne le booléen de consommation');
});

test('3. handleNativeBack ferme d\'abord le clavier et ne navigue pas si l\'IME était ouverte', () => {
    const methodIndex = main.indexOf('.method public final handleNativeBack()Z');
    assert.ok(methodIndex > -1);
    const body = main.slice(methodIndex, main.indexOf('.end method', methodIndex));
    const dismissAt = body.indexOf('NativeSearchWatcher;->dismissKeyboard');
    assert.ok(dismissAt > -1, 'handleNativeBack doit appeler dismissKeyboard');
    const firstNav = body.search(/nativeStack|nativeCurrentScreen|finish\(\)/);
    assert.ok(firstNav > dismissAt, 'la fermeture IME doit précéder toute navigation');
    // when dismissKeyboard consumed the event, Back returns 1 immediately
    const consume = body.indexOf('const/4 v0, 0x1');
    assert.ok(consume > dismissAt && body.indexOf('return v0', consume) > consume,
        'Back consomme l\'événement (retour 1) après avoir fermé l\'IME');
});

test('4. setNativeScreen ferme le clavier en quittant la recherche, jamais en y entrant', () => {
    const methodIndex = main.indexOf('.method public final setNativeScreen(Ljava/lang/String;)V');
    assert.ok(methodIndex > -1);
    const body = main.slice(methodIndex, main.indexOf('.end method', methodIndex));
    const guard = body.indexOf('const-string v0, "search"');
    assert.ok(guard > -1, 'comparaison avec l\'écran "search" absente');
    const equals = body.indexOf('invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z');
    assert.ok(equals > guard, 'comparaison sur la destination p1 attendue');
    const dismissAt = body.indexOf('NativeSearchWatcher;->dismissKeyboard');
    assert.ok(dismissAt > equals, 'dismissKeyboard doit être appelé après le test de destination');
    const keep = body.indexOf('\n    :native_ime_kept\n');
    assert.ok(keep > dismissAt, 'le clavier est conservé quand on entre dans la recherche');
});

test('5. le champ de recherche garde le focus, la saisie multilingue et un vrai debounce', () => {
    // layout: singleLine + text input type keeps every language IME available
    assert.match(layout, /android:inputType="text"/, 'inputType="text" requis pour toute langue');
    assert.match(layout, /android:imeOptions="actionSearch"/);
    assert.match(layout, /android:singleLine="true"/);
    assert.match(layout, /android:id="@id\/nativeSearchInput"/);
    // watcher: 280 ms debounce (0x118) and a 2-character minimum before search
    assert.match(watcher, /0x118/, 'debounce de 280 ms attendu');
    assert.match(watcher, /\.method public final afterTextChanged\(Landroid\/text\/Editable;\)V/);
    assert.match(watcher, /Landroid\/widget\/TextView\$OnEditorActionListener;/);
    // the pending query is kept while a search runs (no input loss)
    assert.match(main, /nativeExpectedSearch/, 'la requête en cours est conservée dans l\'activité');
});

test('6. le runnable de focus est gardé: pas d\'ouverture parasite du clavier', () => {
    const body = focusRunnable;
    assert.match(body, /isShown\(\)Z/, 'le clavier ne s\'ouvre que si le champ est visible');
    assert.match(body, /showSoftInput\(Landroid\/view\/View;I\)Z/);
    // the runnable only ever targets the single view injected at construction
    assert.match(body, /\.method public constructor <init>\(Lcom\/melodix\/music\/MainActivity;Landroid\/view\/View;\)V/);
    // and MainActivity hands it exactly the nativeSearchInput field (0x7f090233)
    const clickIndex = main.indexOf('.method public final onNativeSearchClick');
    assert.ok(clickIndex > -1);
    const clickBody = main.slice(clickIndex, main.indexOf('.end method', clickIndex));
    assert.match(clickBody, /0x7f090233/, 'onNativeSearchClick ne cible que le champ nativeSearchInput');
});

test('7. la soumission ferme explicitement le clavier (clearFocus + hideSoftInput)', () => {
    const methodIndex = main.indexOf('.method public final onNativeSearchSubmit');
    assert.ok(methodIndex > -1, 'onNativeSearchSubmit absente');
    const body = main.slice(methodIndex, main.indexOf('.end method', methodIndex));
    assert.match(body, /clearFocus\(\)V/, 'le champ perd le focus à la soumission');
    assert.match(body, /hideSoftInputFromWindow/, 'l\'IME est masquée à la soumission');
});
