// P0 root-cause suite (mission "3 regressions", 2026-10-24): every test here
// is written against the REAL executed code paths (smali admission/paint and
// the shippable JS bundles) and must FAIL on the pre-fix tree, then pass once
// the demonstrated root causes are corrected:
//   BUG 1 - media:* payloads from the bridge ({id,name,image}) are dropped by
//           NativeHomeFeed.paint's admission check which only reads title/uri
//           (NativeUiRowFactory already accepts name/id/href/label);
//   BUG 2 - (a) a matched media:<id> payload is never cached (nativeLibraryJson
//           is written only on logout) so a late response is lost and the
//           "Chargement des playlists…" row can wait forever;
//           (b) home loading freezes forever once MAX_HOME_RETRIES is spent;
//           (c) a late mediaLib success never repaints home;
//           (d) updateLibraryRows sends nothing when a loaded collection page
//           keeps scraping zero rows (no empty state ever reaches the native
//           screen);
//   BUG 3 - onNativeSearchClick requestFocus()s the field and posts a 250 ms
//           showSoftInput runnable, so merely entering Rechercher raises the
//           Android keyboard.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const homeFeed = read('smali/com/melodix/music/NativeHomeFeed.smali');
const rowFactory = read('smali/com/melodix/music/NativeUiRowFactory.smali');
const bridgeSmali = read('smali/com/melodix/music/AndBridge.smali');
const main = read('smali/com/melodix/music/MainActivity.smali');
const shellSrc = read('assets/native_ui_shell.js');
const bridgeSrc = read('assets/spotify_bridge.js');

function methodBody(source, signature) {
    const at = source.indexOf(signature);
    assert.ok(at > -1, 'méthode absente: ' + signature);
    return source.slice(at, source.indexOf('.end method', at));
}

function paintBody() {
    return methodBody(homeFeed, '.method public static paint(');
}

// ---------------------------------------------------------------------------
// Shell VM harness (real assets/native_ui_shell.js, real timers)
// ---------------------------------------------------------------------------

function runShellVm(opts = {}) {
    const sent = [];
    const timers = [];
    let nextTimerId = 1;
    const mainView = { querySelectorAll: () => [], innerText: '', textContent: '' };

    const documentStub = {
        readyState: opts.readyState || 'complete',
        hidden: false,
        documentElement: { contains: () => true, querySelectorAll: () => [] },
        body: { innerText: '', textContent: '', querySelectorAll: () => [] },
        querySelector: (sel) => (sel === '#main' || sel === '#main-view' || sel === 'main' || sel === '#main .main-view-container__scroll-node-child' ? mainView : null),
        querySelectorAll: () => [],
        createElement: () => ({ style: {}, setAttribute() {}, appendChild() {}, remove() {} }),
        addEventListener() {},
        removeEventListener() {}
    };

    const windowObj = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        location: {
            hostname: 'open.spotify.com',
            pathname: opts.pathname || '/',
            href: 'https://open.spotify.com' + (opts.pathname || '/'),
            origin: 'https://open.spotify.com',
            search: '',
            assign() {}
        },
        document: documentStub,
        navigator: { userAgent: 'Mozilla/5.0' },
        history: { pushState() {}, replaceState() {}, back() {} },
        localStorage: { getItem: () => null, setItem() {}, removeItem() {}, clear() {} },
        sessionStorage: { getItem: () => null, setItem() {}, removeItem() {}, clear() {} },
        MutationObserver: function MutationObserver(cb) {
            this.observe = () => {};
            this.disconnect = () => {};
            this._cb = cb;
        },
        Node: { ELEMENT_NODE: 1 },
        addEventListener() {},
        removeEventListener() {},
        AndBridge: {
            onNativeUiReady() {},
            onNativeUiData(type, data) { sent.push({ type, data }); },
            onNativeHomeRows(data) { sent.push({ type: 'home', data }); },
            onNativeListText() {},
            logBridgeError() {}
        },
        setTimeout(fn, delay) {
            const handle = { id: nextTimerId++, fn, delay: Number(delay) || 0, cleared: false };
            timers.push(handle);
            return handle.id;
        },
        clearTimeout(id) {
            timers.forEach((handle) => { if (handle.id === id) handle.cleared = true; });
        },
        setInterval(fn, delay) {
            const handle = { id: nextTimerId++, fn, delay: Number(delay) || 0, cleared: false, interval: true };
            timers.push(handle);
            return handle.id;
        },
        clearInterval(id) { windowObj.clearTimeout(id); },
        requestAnimationFrame: (fn) => { timers.push({ id: nextTimerId++, fn, delay: 16, cleared: false }); return nextTimerId; },
        cancelAnimationFrame() {}
    };
    if (Object.prototype.hasOwnProperty.call(opts, 'mediaLib')) windowObj.mediaLib = opts.mediaLib;
    if (Object.prototype.hasOwnProperty.call(opts, 'libState')) windowObj.__sfMediaLibState = opts.libState;
    if (opts.windowExtras) Object.assign(windowObj, opts.windowExtras);
    windowObj.window = windowObj;
    windowObj.self = windowObj;
    windowObj.globalThis = windowObj;

    const context = {
        window: windowObj,
        document: documentStub,
        URL,
        URLSearchParams,
        console: windowObj.console,
        setTimeout: windowObj.setTimeout,
        clearTimeout: windowObj.clearTimeout,
        setInterval: windowObj.setInterval,
        clearInterval: windowObj.clearInterval
    };

    vm.runInNewContext(shellSrc, context, { filename: 'assets/native_ui_shell.js' });

    return {
        window: windowObj,
        sent,
        timers,
        fireTimers(rounds = 1) {
            for (let i = 0; i < rounds; i += 1) {
                const pending = timers.splice(0);
                for (const handle of pending) {
                    if (!handle.cleared) handle.fn();
                }
            }
        },
        homePayloads() {
            return sent.filter((c) => c.type === 'home').map((c) => {
                try { return JSON.parse(c.data); } catch (_) { return []; }
            });
        }
    };
}

// ---------------------------------------------------------------------------
// BUG 1 - admission of bridge-shaped rows in NativeHomeFeed.paint
// ---------------------------------------------------------------------------

test('BUG1. NativeHomeFeed admet les lignes du pont ({id,name,image}) : fallbacks title<-name<-label et uri<-id<-href AVANT le test de vide', () => {
    const paint = paintBody();
    const jsonInit = paint.indexOf('JSONArray;-><init>');
    const hasRow = paint.indexOf('\n    :has_row');
    assert.ok(jsonInit > -1 && hasRow > jsonInit, 'repères :has_row/JSONArray introuvables');
    const admission = paint.slice(jsonInit, hasRow);

    // title fallbacks (same contract as NativeUiRowFactory.create)
    const titleRead = admission.indexOf('const-string v7, "title"');
    assert.ok(titleRead > -1, 'lecture de "title" absente');
    const nameRead = admission.indexOf('const-string v10, "name"');
    assert.ok(nameRead > titleRead && nameRead < hasRow,
        'le fallback "name" doit être appliqué avant le test de vide (lignes du pont: {id,name,image})');
    const labelRead = admission.indexOf('const-string v10, "label"');
    assert.ok(labelRead > nameRead && labelRead < hasRow,
        'le fallback "label" doit être appliqué avant le test de vide');
    // uri fallbacks
    const uriRead = admission.indexOf('const-string v9, "uri"');
    assert.ok(uriRead > -1, 'lecture de "uri" absente');
    const idRead = admission.indexOf('const-string v10, "id"');
    assert.ok(idRead > uriRead && idRead < hasRow,
        'le fallback "id" doit être appliqué avant le test de vide (lignes du pont: {id,name,image})');
    const hrefRead = admission.indexOf('const-string v10, "href"');
    assert.ok(hrefRead > idRead && hrefRead < hasRow,
        'le fallback "href" doit être appliqué avant le test de vide');
    // the emptiness test must come AFTER the fallbacks (the slice ends at the
    // :has_row label, so everything after the last fallback is the decision)
    const afterLabel = admission.slice(labelRead);
    assert.match(afterLabel, /invoke-virtual \{v7\}, Ljava\/lang\/String;->isEmpty\(\)Z/,
        'le test de vide du titre doit suivre les fallbacks');
    const afterHref = admission.slice(hrefRead);
    assert.match(afterHref, /invoke-virtual \{v9\}, Ljava\/lang\/String;->isEmpty\(\)Z/,
        'le test de vide de l\'uri doit suivre les fallbacks');
});

test('BUG1. non-régression : NativeUiRowFactory garde ses fallbacks et le constructeur MediaItem lit name/id/image/artists', () => {
    // The card factory already accepted both shapes: keep that contract.
    assert.match(rowFactory, /const-string v0, "name"/);
    assert.match(rowFactory, /const-string v0, "label"/);
    assert.match(rowFactory, /const-string v0, "id"/);
    assert.match(rowFactory, /const-string v0, "href"/);
    assert.match(rowFactory, /const-string v0, "cover"/);
    // AndBridge.onMediaItemsLoaded builds MediaItems from name/id/image/artists
    // : the bridge payload shape is required downstream and must not change.
    const onItems = methodBody(bridgeSmali, '.method public final onMediaItemsLoaded(');
    assert.match(onItems, /const-string v7, "name"/);
    assert.match(onItems, /const-string v8, "id"/);
    assert.match(onItems, /const-string v9, "image"/);
    assert.match(onItems, /const-string v10, "artists"/);
    // parseLibrary keeps emitting {id, name, image} objects
    assert.match(bridgeSrc, /id: uri,\s*name: name/);
});

// ---------------------------------------------------------------------------
// BUG 2a - a matched media:<id> payload is always cached, never lost
// ---------------------------------------------------------------------------

test('BUG2a. applyNativeUiData :check_media met en cache toute charge utile de catégorie (nativeLibraryJson + id) même hors écran', () => {
    assert.match(main, /\.field private nativeLibraryJson:Ljava\/lang\/String;/);
    assert.match(main, /\.field private nativeLibraryJsonId:Ljava\/lang\/String;/,
        'le cache doit mémoriser la catégorie associée (nativeLibraryJsonId)');
    const apply = methodBody(main, '.method public final applyNativeUiData(');
    const mediaBlock = apply.slice(apply.indexOf('    :check_media'), apply.indexOf('    :check_settings'));
    assert.ok(mediaBlock.length > 100, 'bloc :check_media introuvable');
    assert.match(mediaBlock, /iput-object p2, p0, Lcom\/melodix\/music\/MainActivity;->nativeLibraryJson:Ljava\/lang\/String;/,
        'la charge utile media:<cat> doit être cachée (réponse en retard jamais perdue)');
    assert.match(mediaBlock, /iput-object v2, p0, Lcom\/melodix\/music\/MainActivity;->nativeLibraryJsonId:Ljava\/lang\/String;/,
        "l'identifiant de la catégorie doit être mémorisé avec le cache");
    // stale-session safety: ids must still be compared before caching
    assert.match(mediaBlock, /nativeExpectedId/);
    assert.match(mediaBlock, /Ljava\/lang\/String;->equals/);
});

test('BUG2a. onNativeLibraryClick et onNativeLibraryCategoryClick peignent depuis le cache seulement si l\'identifiant correspond', () => {
    const tab = methodBody(main, '.method public final onNativeLibraryClick(');
    assert.match(tab, /nativeLibraryJsonId/,
        'l\'onglet doit vérifier l\'identifiant du cache avant de le peindre');
    const chip = methodBody(main, '.method public final onNativeLibraryCategoryClick(');
    assert.match(chip, /nativeLibraryJsonId/,
        "les chips doivent vérifier l'identifiant du cache avant de le peindre");
    // logout invalidation keeps both fields cleared
    const logout = methodBody(main, '.method public final resetNativeStateForLogout()V');
    assert.match(logout, /nativeLibraryJson:Ljava\/lang\/String;/);
    assert.match(logout, /nativeLibraryJsonId:Ljava\/lang\/String;/);
});

// ---------------------------------------------------------------------------
// BUG 2b/2c - home loading always terminates; late mediaLib success repaints
// ---------------------------------------------------------------------------

test('BUG2b. Accueil : budget de retries épuisé => ligne d\'erreur terminale, jamais un chargement figé', () => {
    const harness = runShellVm({ pathname: '/' }); // no mediaLib, no bridge state: 'pending' forever
    // The initial update paints the loading row and schedules a retry.
    assert.ok(harness.homePayloads().some((rows) => rows.some((r) => /Chargement des playlists/.test(r.title))),
        'ligne de chargement initiale attendue');
    // Exhaust the retry budget (MAX_HOME_RETRIES = 40).
    harness.fireTimers(60);
    const flat = harness.homePayloads();
    assert.ok(flat.length > 1, 'plus d\'un envoi Accueil attendu après les retries');
    const last = flat[flat.length - 1];
    assert.ok(last.some((r) => /Impossible de charger les playlists/.test(r.title)),
        'après épuisement du budget, l\'état terminal doit être une erreur honnête (dernier envoi=' +
        JSON.stringify(last) + ')');
    // and it is terminal: nothing re-sends a loading row afterwards
    harness.fireTimers(20);
    const flat2 = harness.homePayloads();
    const last2 = flat2[flat2.length - 1];
    assert.ok(last2.some((r) => /Impossible de charger les playlists/.test(r.title)),
        'aucun retour au chargement après l\'état terminal');
});

test('BUG2c. un succès mediaLib tardif repeint l\'Accueil via __sfNotifyMediaLibReady (callback réel)', () => {
    const harness = runShellVm({ pathname: '/' });
    harness.fireTimers(60); // budget exhausted -> terminal error (see BUG2b)
    assert.equal(typeof harness.window.__sfNotifyMediaLibReady, 'function',
        'le shell doit exposer le callback de fin de récupération mediaLib');
    // Late success: the library finally arrives.
    harness.window.mediaLib = {
        playlists: [{ name: 'Playlist Tardive', uri: 'spotify:playlist:late01', image: '' }]
    };
    harness.window.__sfMediaLibState = 'ready';
    harness.window.__sfNotifyMediaLibReady();
    const flat = harness.homePayloads();
    const last = flat[flat.length - 1];
    assert.ok(last.some((r) => /Playlist Tardive/.test(r.title)),
        'un succès tardif doit être rendu (dernier envoi=' + JSON.stringify(last) + ')');
});

test('BUG2c. publishMediaLibState (pont) notifie __sfNotifyMediaLibReady à chaque transition d\'état', () => {
    const publishAt = bridgeSrc.indexOf('function publishMediaLibState(');
    assert.ok(publishAt > -1, 'publishMediaLibState absente du pont');
    const publish = bridgeSrc.slice(publishAt, bridgeSrc.indexOf('\n    function ', publishAt + 10));
    assert.match(publish, /__sfNotifyMediaLibReady/,
        'chaque transition d\'état mediaLib doit notifier le shell (repaint Accueil)');
});

// ---------------------------------------------------------------------------
// BUG 2d - the library channel is never left silent
// ---------------------------------------------------------------------------

test('BUG2d. updateLibraryRows : 0 ligne sur une collection chargée => état vide terminal, jamais de silence', () => {
    const harness = runShellVm({ pathname: '/collection/playlists', readyState: 'complete' });
    // Initial scrape + follow-up scrapes all return zero rows.
    harness.fireTimers(30);
    const media = harness.sent.filter((c) => c.type === 'media:playlists' || c.type === 'media:');
    const playlistChannel = harness.sent.filter((c) => c.type === 'media:playlists');
    assert.ok(playlistChannel.length > 0,
        'le canal media:playlists doit recevoir un état terminal (vide) quand la page chargée ne montre rien');
    const payloads = playlistChannel.map((c) => { try { return JSON.parse(c.data); } catch (_) { return []; } });
    const last = payloads[payloads.length - 1];
    assert.ok(last.some((r) => /Aucun élément/.test(r.title)),
        'la dernière charge utile doit être l\'état vide (dernier=' + JSON.stringify(last) + ')');
});

test('BUG2d. l\'action de réessai reste cliquable (actionUri -> openNativeRow)', () => {
    // The status rows (loading/empty/error) carry their retry target in
    // actionUri (spotify:retry:media:<id>): the row factory must turn it into
    // a real tap target and MainActivity.openNativeRow handles the retry URI.
    assert.match(rowFactory, /const-string v0, "actionUri"/,
        'la fabrique de lignes doit lire actionUri en dernier recours');
    assert.match(shellSrc, /row\.actionUri = String\(item\.actionUri\)/,
        'sendNativeUiData doit conserver actionUri jusqu\'au natif');
    const openRow = methodBody(main, '.method public final openNativeRow(');
    assert.match(openRow, /const-string v2, "spotify:retry:media:"/,
        'openNativeRow gère les URI de réessai media');
    assert.match(openRow, /window\.fetchMediaItems/);
});

// ---------------------------------------------------------------------------
// BUG 3 - entering Rechercher never raises the keyboard
// ---------------------------------------------------------------------------

test('BUG3. onNativeSearchClick n\'ouvre jamais le clavier à l\'entrée (pas de requestFocus ni de runnable showSoftInput)', () => {
    const click = methodBody(main, '.method public final onNativeSearchClick(');
    assert.doesNotMatch(click, /requestFocus\(\)Z/,
        'l\'entrée dans Rechercher ne doit pas prendre le focus (clavier fermé)');
    assert.doesNotMatch(click, /NativeSearchFocusRunnable/,
        'l\'entrée dans Rechercher ne doit poster aucun showSoftInput différé');
    // Explicit close on entry from another screen, without disturbing typing:
    // re-tapping the tab while already typing must not yank the keyboard away.
    assert.match(click, /MainActivity;->hideImeNow\(\)V/,
        'entrer depuis un autre écran ferme d\'abord l\'IME');
    assert.match(click, /nativeCurrentScreen:Ljava\/lang\/String;/,
        'la garde « déjà sur recherche » doit préserver la saisie en cours');
    // The field stays wired (visible, watcher attached, typing intact).
    assert.match(click, /0x7f090233/, 'le champ nativeSearchInput reste ciblé');
    assert.match(click, /NativeSearchWatcher;/, 'le watcher de saisie reste attaché');
});

test('BUG3. la saisie reste possible : focusable par tap (pas de setShowSoftInputOnFocus(false)) et Back ferme l\'IME d\'abord', () => {
    assert.doesNotMatch(main, /setShowSoftInputOnFocus/,
        'le tap sur le champ doit pouvoir ouvrir l\'IME (comportement EditText standard)');
    const layout = read('res/layout/activity_main.xml');
    assert.match(layout, /android:id="@id\/nativeSearchInput"/);
    assert.match(layout, /android:inputType="text"/);
    // Back = IME first (kept from the K fixes)
    const back = methodBody(main, '.method public final handleNativeBack()Z');
    assert.match(back, /NativeSearchWatcher;->dismissKeyboard/);
    // leaving search still closes + dismisses late re-shows
    const setScreen = methodBody(main, '.method public final setNativeScreen(');
    assert.match(setScreen, /MainActivity;->hideImeNow\(\)V/);
    assert.match(setScreen, /NativeSearchWatcher;->postDismiss/);
    // deliberate focus helper kept for explicit focus requests
    assert.ok(fs.existsSync(path.join(root, 'smali/com/melodix/music/NativeSearchFocusRunnable.smali')),
        'le runnable de focus explicite est conservé (jamais supprimé)');
});
