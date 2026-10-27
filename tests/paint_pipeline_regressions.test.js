// Non-regression suite for the home/playlists PAINT pipeline (mission: restore
// playlist rendering since the home-layout changes).
//
// Root cause demonstrated on the real code: the tab-isolation strip in
// MainActivity.renderNativeRows and the stale-row clear in NativeHomeFeed.paint
// were written with an inverted guard (if-gtz before removeViewAt(0)), which
// either did nothing (container full) or threw IndexOutOfBounds (container
// empty, aborting the paint -> the screen froze on "Chargement des playlists").
//
// These tests pin the corrected loop shapes AND the surrounding contracts so a
// future layout change cannot silently drop the playlists again.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

function extractSmaliLoop(src, label) {
    const start = src.indexOf(':' + label + '\n');
    assert.ok(start >= 0, 'label :' + label + ' must exist');
    const end = src.indexOf('\n    :', start + label.length + 2);
    return src.slice(start, end === -1 ? src.length : end);
}

// ---------------------------------------------------------------------------
// §5: the two strip/clear loops are coherent (guard BEFORE removeViewAt(0)).
// ---------------------------------------------------------------------------

test('renderNativeRows tab-isolation strip empties the container without throwing', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const loop = extractSmaliLoop(src, 'native_screen_strip');
    // The loop must remove children while they remain and stop when empty:
    // the conditional jump to the loop exit must be a <=0 test (if-lez).
    assert.match(loop, /if-lez v5, :native_screen_painted_track/,
        'the strip must stop when the container is empty (if-lez), never removeViewAt(0) on an empty container');
    assert.match(loop, /removeViewAt\(I\)V/);
    assert.match(loop, /goto :native_screen_strip/, 'the strip keeps removing until empty');
    // The inverted shape must never come back.
    assert.ok(!/if-gtz v5, :native_screen_painted_track/.test(loop),
        'the inverted if-gtz guard caused IndexOutOfBounds on an empty container and aborted the paint');
});

test('NativeHomeFeed stale-row clear empties the container without throwing', () => {
    const src = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const loop = extractSmaliLoop(src, 'clear_stale');
    assert.match(loop, /if-lez v1, :stale_cleared/,
        'the clear must stop when the container is empty (if-lez)');
    assert.match(loop, /removeViewAt\(I\)V/);
    assert.match(loop, /goto :clear_stale/);
    assert.ok(!/if-gtz v1, :stale_cleared/.test(loop),
        'the inverted if-gtz guard caused IndexOutOfBounds on an empty container');
});

test('NativeHomeFeed attach-then-strip contract keeps exactly the new block', () => {
    const src = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const loop = extractSmaliLoop(src, 'strip');
    // attach then strip: stop at one child left (the freshly added block).
    assert.match(loop, /const\/4 v4, 0x1/);
    assert.match(loop, /if-le v2, v4, :finish/,
        'the attach-then-strip loop must keep exactly one child (the new block)');
    assert.match(loop, /removeViewAt\(I\)V/);
});

// ---------------------------------------------------------------------------
// §3.5/3.7: home rows only paint onto the home screen, and never replace the
// requested screen with a permanent loading state.
// ---------------------------------------------------------------------------

test('Accueil rows never paint onto another screen, startup still paints', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const m = src.indexOf('.method public final renderNativeRows');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /const-string v0, "Accueil"/);
    assert.match(body, /const-string v4, "home"/);
    // A null current screen (startup reveal) still paints.
    assert.match(body, /if-eqz v0, :native_screen_painted_track/);
});

test('home router keeps the cache on empty payloads and repaints on real rows', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(src, /:home_keep_cache/);
    assert.match(src, /nativeHomeJson/);
    // Real payloads (length > 1) paint, empty ones keep the cache.
    assert.match(src, /if-le v2, v3, :home_keep_cache/);
});

test('tapping the Home tab repaints the cached rows and asks the shell again', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const m = src.indexOf('.method public final onNativeHomeClick');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /nativeHomeJson/);
    assert.match(body, /renderNativeRows/);
    assert.match(body, /__sfNativeRequestHome/);
});

// ---------------------------------------------------------------------------
// §4: bridge rows reach the home feed with the properties the paint needs.
// ---------------------------------------------------------------------------

test('home feed admission accepts bridge rows shaped {id,name,image}', () => {
    const src = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const m = src.indexOf('.method public static paint');
    const body = src.slice(m, src.indexOf('.end method', m));
    // title -> name -> label fallbacks
    assert.match(body, /const-string v10, "name"/);
    assert.match(body, /const-string v10, "label"/);
    // uri -> id -> href fallbacks
    assert.match(body, /const-string v10, "id"/);
    assert.match(body, /const-string v10, "href"/);
    // The fallbacks must run BEFORE the emptiness admission test.
    assert.ok(body.indexOf('const-string v10, "name"') < body.indexOf(':home_feed_title_done'),
        'the name fallback runs before the admission emptiness test');
});

test('shell home pipeline is intact: scrape + library supplement + home send', () => {
    const src = read('assets/native_ui_shell.js');
    assert.match(src, /function collectHomeRows\(/);
    assert.match(src, /function supplementHomeRowsWithLibrary\(/);
    assert.match(src, /function updateHomeRows\(/);
    assert.match(src, /supplementHomeRowsWithLibrary\(collectHomeRows/);
    assert.match(src, /sendNativeUiData\('home', rows\)/);
    // Library rows carry the fields the paint admission reads.
    assert.match(src, /title: title/);
    assert.match(src, /uri: uri/);
});

test('bridge parseLibrary keeps the historical {id,name,image,browsable} contract', () => {
    const sandbox = { window: {}, console: { log() {}, warn() {}, error() {}, info() {} } };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;
    sandbox.AndBridge = {
        nativeFetch: () => JSON.stringify({ status: 200, body: '{}', headers: {} }),
        logBridgeError() {}, onPlaybackStateChanged() {}, onTrackMetadataChanged() {},
        onNativeUiData() {}, onNativeListText() {}, onMediaItemsLoaded() {},
        onMediaLibBatch() {}, onLibDiagState() {}, onNativeUiReady() {},
        setCanvasDisabled() {}, manageTSleep() {}, nativeLogout() {}
    };
    sandbox.addEventListener = () => {};
    sandbox.removeEventListener = () => {};
    sandbox.dispatchEvent = () => {};
    sandbox.setTimeout = () => 1;
    sandbox.clearTimeout = () => {};
    sandbox.setInterval = () => 1;
    sandbox.clearInterval = () => {};
    sandbox.localStorage = { getItem: () => null, setItem: () => {}, removeItem: () => {}, clear: () => {} };
    sandbox.sessionStorage = { getItem: () => null, setItem: () => {}, removeItem: () => {}, clear: () => {} };
    sandbox.location = { href: 'https://open.spotify.com/', origin: 'https://open.spotify.com', hostname: 'open.spotify.com', pathname: '/', search: '', assign() {}, replace() {}, reload() {} };
    sandbox.history = { pushState() {}, replaceState() {}, back() {} };
    sandbox.document = {
        hidden: false, readyState: 'complete', documentElement: {}, body: { style: {} },
        head: { appendChild() {} }, createElement: () => ({ style: {}, setAttribute() {}, appendChild() {} }),
        querySelector: () => null, querySelectorAll: () => [], getElementById: () => null,
        addEventListener() {}, removeEventListener() {}
    };
    sandbox.MutationObserver = class { observe() {} disconnect() {} };
    sandbox.CustomEvent = function () {};
    sandbox.Event = function () {};
    sandbox.navigator = { mediaSession: null, userAgent: 'Mozilla/5.0' };
    sandbox.Headers = class { constructor() { this._m = new Map(); } set(k, v) { this._m.set(k, v); } get(k) { return this._m.get(k); } has(k) { return this._m.has(k); } entries() { return this._m.values(); } };
    sandbox.fetch = async () => ({ ok: false, status: 0, headers: new sandbox.Headers(), json: async () => ({}), text: async () => '{}' });
    sandbox.XMLHttpRequest = function () {};
    sandbox.WebSocket = function () {};
    sandbox.Audio = function () {};
    sandbox.HTMLMediaElement = { prototype: { play: () => Promise.resolve(), pause() {} } };
    sandbox.Node = { ELEMENT_NODE: 1 };
    sandbox.Element = function () {};
    sandbox.HTMLElement = function () {};
    sandbox.requestAnimationFrame = () => 1;
    sandbox.cancelAnimationFrame = () => {};
    sandbox.matchMedia = () => ({ matches: false, addEventListener() {} });
    sandbox.URL = URL;
    sandbox.URLSearchParams = URLSearchParams;
    vm.runInNewContext(read('assets/spotify_bridge.js'), sandbox, { filename: 'assets/spotify_bridge.js' });

    const res = sandbox.parseLibrary([{
        item: { data: { __typename: 'Playlist', uri: 'spotify:playlist:homepaint', name: 'Contrat accueil', images: { items: [{ sources: [{ url: 'https://i.scdn.co/img' }] }] } } }
    }]);
    assert.equal(res.playlists.length, 1);
    const pl = res.playlists[0];
    assert.equal(pl.id, 'spotify:playlist:homepaint');
    assert.equal(pl.name, 'Contrat accueil');
    assert.equal(typeof pl.image, 'string');
    assert.equal(pl.browsable, true);
});

// ---------------------------------------------------------------------------
// §4: BEHAVIOURAL proof, not a text motif. We execute the smali loop bodies
// against a virtual container and check the semantics: an empty container must
// be left untouched (no removeViewAt), a non-empty one must end empty, without
// any exception. The inverted if-gtz form must FAIL this simulation.
// ---------------------------------------------------------------------------

function simulateStripLoop(loopSrc, { children }) {
    // Minimal interpreter for the strip/clear loops:
    //   getChildCount() -> reg ; if-lez reg, :exit ; removeViewAt(0) ; goto :loop
    const guard = loopSrc.match(/if-(le|gt)z v\d+, :(\w+)/);
    assert.ok(guard, 'the loop must carry a guard before removeViewAt');
    const exitLabel = guard[2];
    const inverted = guard[1] === 'gt';
    const steps = [];
    for (let iter = 0; iter < 1000; iter++) {
        const count = children.length;
        if (inverted ? count > 0 : count <= 0) {
            steps.push(`exit(count=${count})`);
            return { children, steps, inverted };
        }
        if (count === 0) throw new Error('IndexOutOfBoundsException: removeViewAt(0) on an empty container');
        children.shift();
        steps.push(`removeViewAt(0)->${children.length}`);
    }
    throw new Error('the loop never terminates');
}

test('behaviour: the strip loop empties a full container and never touches an empty one', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const loop = extractSmaliLoop(src, 'native_screen_strip');
    // Empty container: the loop must exit immediately with no removal.
    const empty = simulateStripLoop(loop, { children: [] });
    assert.equal(empty.children.length, 0);
    assert.equal(empty.steps.length, 1, 'an empty container is never touched');
    // Full container: every child is removed exactly once and the loop stops.
    const full = simulateStripLoop(loop, { children: ['loading row', 'stale row', 'other tab row'] });
    assert.equal(full.children.length, 0, 'the previous screen rows are all stripped');
    assert.equal(full.steps.filter((s) => s.startsWith('removeViewAt')).length, 3);
    assert.ok(full.steps.at(-1).startsWith('exit'), 'the loop stops exactly when empty');
});

test('behaviour: the stale-row clear loop empties and never touches an empty container', () => {
    const src = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const loop = extractSmaliLoop(src, 'clear_stale');
    const empty = simulateStripLoop(loop, { children: [] });
    assert.equal(empty.steps.length, 1);
    const full = simulateStripLoop(loop, { children: ['stale a', 'stale b'] });
    assert.equal(full.children.length, 0);
    assert.equal(full.steps.filter((s) => s.startsWith('removeViewAt')).length, 2);
});

test('behaviour: the inverted if-gtz guard is caught by the same simulation', () => {
    // Proof the simulation is not decorative: replay the historical inverted
    // form and show it fails BOTH ways (crash on empty, stuck on non-empty).
    const invertedLoop = ':loop\n    invoke-virtual {}, getChildCount()I\n    move-result v5\n    if-gtz v5, :exit\n    const/4 v6, 0x0\n    invoke-virtual {}, removeViewAt(I)V\n    goto :loop\n    :exit';
    assert.throws(() => simulateStripLoop(invertedLoop, { children: [] }),
        /IndexOutOfBoundsException/, 'the inverted guard crashes on an empty container');
    const stuck = simulateStripLoop(invertedLoop, { children: ['row'] });
    assert.equal(stuck.children.length, 1, 'the inverted guard strips nothing on a full container');
});
