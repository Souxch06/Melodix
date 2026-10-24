// Targeted non-regression suite for the two reported device defects:
//   1. playlists still not displaying correctly (library tab stuck on its
//      loading row, playlist open turning failures into empty lists);
//   2. the playlist loading state bleeding onto other tabs (e.g. Paramètres)
//      instead of each tab showing its own content.
// Scenario mandated by the mission: start a playlist load, open Paramètres
// before it finishes, then simulate a late success, a late empty response and
// a late error — Paramètres must stay correctly displayed in every case.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function activityMethod(name) {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const start = src.indexOf(`.method public final ${name}`);
    assert.ok(start >= 0, `missing method ${name}`);
    const end = src.indexOf('.end method', start);
    return src.slice(start, end > 0 ? end : src.length);
}

function applyNativeUiDataBody() {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const start = src.indexOf('.method public final applyNativeUiData(');
    const end = src.indexOf('.method public final updateNativePlayer', start);
    return src.slice(start, end);
}

function renderNativeRowsBody() {
    return activityMethod('renderNativeRows');
}

function rowsFor(calls, screen) {
    return calls
        .filter((call) => call.screen === screen)
        .map((call) => JSON.parse(call.data));
}

function lastRowsFor(calls, screen) {
    const list = rowsFor(calls, screen);
    return list[list.length - 1];
}

function bootShell(extra = {}) {
    const calls = [];
    const timers = [];
    const store = new Map();
    const mainView = extra.mainView || { querySelectorAll: () => [] };
    const document = {
        readyState: 'complete',
        documentElement: {},
        hidden: false,
        querySelector: (selector) => (selector === '#main-view' ? mainView : null),
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
        disconnect() {}
    }
    const window = Object.assign({
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            onNativeListText: (text) => calls.push({ screen: 'list-text-direct', data: text }),
            setCanvasDisabled: (value) => calls.push({ screen: 'setCanvasDisabled', data: String(value) }),
            manageTSleep: () => calls.push({ screen: 'manageTSleep', data: '' }),
            nativeLogout: () => calls.push({ screen: 'nativeLogout', data: '' })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        },
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {},
        localStorage: {
            getItem: (key) => (store.has(key) ? store.get(key) : null),
            setItem: (key, value) => store.set(key, String(value)),
            clear: () => store.clear()
        }
    }, extra.window || {});
    vm.runInNewContext(read('assets/native_ui_shell.js'), {
        window,
        document,
        URL,
        MutationObserver: TestMutationObserver
    });
    return { window, document, calls, timers, store };
}

class MockHeaders {
    constructor(init = {}) {
        this._map = new Map();
        Object.entries(init || {}).forEach(([key, value]) => this.set(key, value));
    }
    set(k, v) { this._map.set(String(k).toLowerCase(), { origKey: String(k), value: String(v) }); }
    get(k) { const e = this._map.get(String(k).toLowerCase()); return e ? e.value : null; }
    has(k) { return this._map.has(String(k).toLowerCase()); }
    entries() { return this._map.values(); }
}

function scriptFetch(behaviors, defaultBehavior) {
    const queue = behaviors.slice();
    const calls = [];
    const impl = async (url, opts) => {
        calls.push({ url: String(url), opts });
        let behavior;
        if (queue.length) {
            behavior = queue.shift();
        } else if (defaultBehavior) {
            behavior = defaultBehavior;
        } else {
            throw new Error('scriptFetch: unexpected extra fetch');
        }
        if (behavior.networkError) {
            throw new TypeError('Failed to fetch');
        }
        return {
            ok: behavior.status >= 200 && behavior.status < 300,
            status: behavior.status,
            headers: new MockHeaders(),
            json: async () => behavior.body,
            text: async () => JSON.stringify(behavior.body || {})
        };
    };
    return { impl, calls };
}

function libraryPage(items) {
    return { status: 200, body: { data: { me: { libraryV3: { items } } } } };
}

function playlistItem(name, uri) {
    return {
        item: {
            data: {
                __typename: 'Playlist',
                uri,
                name,
                images: { items: [{ sources: [{ url: 'https://i.scdn.co/image/' + uri.slice(-4) }] }] }
            }
        }
    };
}

function gqlErrors() {
    return {
        status: 200,
        body: {
            errors: [{ message: 'PersistedQueryNotFound', extensions: { code: 'PERSISTED_QUERY_NOT_FOUND' } }],
            data: null
        }
    };
}

function playlistTracksBody(trackNames) {
    return {
        status: 200,
        body: {
            data: {
                playlistV2: {
                    content: {
                        items: trackNames.map((name, i) => ({
                            itemV2: {
                                data: {
                                    uri: 'spotify:track:t' + i + name.replace(/\W/g, '').slice(0, 6),
                                    name,
                                    artists: { items: [{ profile: { name: 'Artiste ' + i } }] },
                                    albumOfTrack: { coverArt: { sources: [{ url: 'https://i.scdn.co/image/t' + i }] } }
                                }
                            }
                        }))
                    }
                }
            }
        }
    };
}

function createBridgeVm(behaviors = [], defaultBehavior) {
    const timers = [];
    let nextTimer = 1;
    const scripted = scriptFetch(behaviors, defaultBehavior);
    const mediaItems = [];
    const uiCalls = [];

    const classListStub = { add() {}, remove() {}, toggle() {}, contains: () => false };
    const nodeStub = () => ({
        style: {}, classList: classListStub,
        setAttribute() {}, getAttribute: () => null,
        appendChild() {}, append() {}, remove() {}, removeChild() {}, insertBefore() {},
        addEventListener() {}, querySelectorAll: () => [], firstChild: null
    });
    const store = new Map();
    const localStorage = {
        getItem: (key) => (store.has(key) ? store.get(key) : null),
        setItem: (key, value) => store.set(key, String(value)),
        removeItem: (key) => store.delete(key),
        clear: () => store.clear()
    };
    const sandbox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        Headers: MockHeaders,
        URL,
        URLSearchParams,
        MutationObserver: class { observe() {} disconnect() {} },
        CustomEvent: function CustomEvent(type, detail) { this.type = type; this.detail = detail; },
        Event: function Event(type) { this.type = type; },
        navigator: { mediaSession: null, userAgent: 'Mozilla/5.0' },
        location: {
            href: 'https://open.spotify.com/', origin: 'https://open.spotify.com',
            hostname: 'open.spotify.com', pathname: '/', search: '',
            assign() {}, replace() {}, reload() {}
        },
        history: { pushState() {}, replaceState() {}, back() {} },
        localStorage,
        sessionStorage: { getItem: () => null, setItem() {}, removeItem() {}, clear() {} },
        document: {
            hidden: false, readyState: 'complete', documentElement: {},
            body: Object.assign(nodeStub(), {}), head: { appendChild() {} },
            createElement: nodeStub, querySelector: () => null, querySelectorAll: () => [],
            getElementById: () => null, addEventListener() {}, removeEventListener() {}
        },
        fetch: scripted.impl,
        XMLHttpRequest: function XMLHttpRequest() {},
        WebSocket: function WebSocket() {},
        Audio: function Audio() {},
        HTMLMediaElement: { prototype: { play: () => Promise.resolve(), pause() {} } },
        Node: { ELEMENT_NODE: 1 },
        Element: function Element() {},
        HTMLElement: function HTMLElement() {},
        requestAnimationFrame: () => 1,
        cancelAnimationFrame: () => {},
        matchMedia: () => ({ matches: false, addEventListener() {} }),
        addEventListener() {},
        removeEventListener() {},
        dispatchEvent() {},
        AndBridge: {
            nativeFetch: () => JSON.stringify({ status: 200, body: '{}', headers: {} }),
            logBridgeError() {},
            onPlaybackStateChanged() {},
            onTrackMetadataChanged() {},
            onNativeUiData: (screen, data) => uiCalls.push({ screen, data }),
            onNativeListText: (text) => uiCalls.push({ screen: 'list-text-direct', data: text }),
            onMediaItemsLoaded: (parentId, itemsJson) => mediaItems.push({ parentId, itemsJson }),
            onNativeUiReady() {},
            setCanvasDisabled() {},
            manageTSleep() {},
            nativeLogout() {}
        },
        setTimeout: (fn, delay) => { const id = nextTimer++; timers.push({ id, fn, delay, cleared: false }); return id; },
        clearTimeout: (id) => { timers.forEach((t) => { if (t.id === id) t.cleared = true; }); },
        setInterval: () => nextTimer++,
        clearInterval: () => {}
    };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;

    vm.runInNewContext(read('assets/spotify_bridge.js'), sandbox, { filename: 'assets/spotify_bridge.js' });
    return { sandbox, timers, fetchCalls: scripted.calls, mediaItems, uiCalls };
}

function statusRowsIn(uiCalls, screenPrefix) {
    return uiCalls
        .filter((call) => call.screen.startsWith(screenPrefix))
        .map((call) => JSON.parse(call.data))
        .map((rows) => rows[0]);
}

// ---------------------------------------------------------------------------
// 1. Mandated reproduction: load playlists → open Paramètres → late outcomes
// ---------------------------------------------------------------------------

test('REPRO: late playlist success after opening Paramètres never replaces it', () => {
    const { window, calls } = bootShell();
    // Playlist load starts (home route, library pending).
    window.__sfNativeRequestHome();
    const homeLoading = lastRowsFor(calls, 'home');
    assert.equal(homeLoading[0].title, 'Chargement des playlists…', 'the loading state is on the home channel');
    // The user opens Paramètres before the load finishes: the settings screen
    // streams its own real rows on its own channel.
    window.__sfRequestSpotifySettings();
    const settingsRows = lastRowsFor(calls, 'settings');
    assert.ok(settingsRows.length > 5, 'Paramètres shows its own structured content');
    assert.ok(settingsRows.every((row) => row.title !== 'Chargement des playlists…'),
        'the playlist loading state never travels on the settings channel');
    // Late success.
    window.mediaLib = {
        playlists: [{ name: 'Ma playlist', uri: 'spotify:playlist:p1', image: 'https://i.scdn.co/image/p1' }],
        albums: [], artists: [], podcasts: []
    };
    window.__sfMediaLibState = 'ready';
    window.__sfNativeRequestHome();
    const homeAfter = lastRowsFor(calls, 'home');
    assert.ok(homeAfter.some((row) => row.uri === 'spotify:playlist:p1'), 'late success lands on Accueil');
    // The native router drops home payloads while another screen is selected.
    const apply = applyNativeUiDataBody();
    const home = apply.slice(apply.indexOf('\n    :check_home\n'), apply.indexOf('\n    :check_media\n'));
    assert.match(home, /if-eqz v5, :apply_done/, 'home paints only while the home screen is selected');
    assert.match(home, /nativeCurrentScreen/);
    // The settings stream is untouched by the late home payload.
    assert.equal(rowsFor(calls, 'settings').length, 1, 'no settings payload is re-sent or replaced');
});

test('REPRO: a late empty response stays on Accueil and shows the honest empty state', () => {
    const { window, calls } = bootShell();
    window.__sfNativeRequestHome();
    window.__sfRequestSpotifySettings();
    // Late empty library.
    window.mediaLib = { playlists: [], albums: [], artists: [], podcasts: [] };
    window.__sfMediaLibState = 'empty';
    window.__sfNativeRequestHome();
    const homeAfter = lastRowsFor(calls, 'home');
    assert.equal(homeAfter[0].title, 'Aucune playlist dans ce compte', 'empty stays distinct from error');
    assert.ok(homeAfter.every((row) => row.title !== 'Chargement des playlists…'),
        'the loading state is replaced by the empty state');
    // Native: a valid empty payload ("[]" length 2) paints and clears stale rows
    // instead of repainting the cache (router threshold is 1, matching paint).
    const apply = applyNativeUiDataBody();
    const home = apply.slice(apply.indexOf('\n    :check_home\n'), apply.indexOf('\n    :check_media\n'));
    assert.match(home, /const\/4 v3, 0x1\n    if-le v2, v3, :home_keep_cache/);
    const paint = read('smali/com/melodix/music/NativeHomeFeed.smali');
    assert.match(paint, /:clear_stale/);
    assert.ok(rowsFor(calls, 'settings').length === 1, 'Paramètres keeps its own rows');
});

test('REPRO: a late error is explicit, stays on Accueil and keeps Paramètres intact', () => {
    const { window, calls } = bootShell();
    window.__sfNativeRequestHome();
    window.__sfRequestSpotifySettings();
    // Late error.
    window.__sfMediaLibState = 'error';
    window.__sfNativeRequestHome();
    const homeAfter = lastRowsFor(calls, 'home');
    assert.equal(homeAfter[0].title, 'Impossible de charger les playlists');
    assert.match(homeAfter[0].subtitle, /réessayer/i, 'the error carries a retry hint');
    assert.ok(rowsFor(calls, 'settings').length === 1, 'Paramètres keeps its own rows');
    assert.ok(rowsFor(calls, 'settings')[0].every((row) => row.title !== 'Impossible de charger les playlists'),
        'home errors are never painted onto Paramètres');
});

// ---------------------------------------------------------------------------
// 2. Tab isolation inside the shared native container
// ---------------------------------------------------------------------------

test('renderNativeRows strips the previous screen rows before painting a new screen', () => {
    const render = renderNativeRowsBody();
    assert.match(render, /nativePaintedScreen/);
    assert.match(render, /:native_screen_strip/);
    assert.match(render, /invoke-virtual \{v2\}, Landroid\/widget\/LinearLayout;->getChildCount\(\)I\n    move-result v5\n    if-gtz v5, :native_screen_painted_track\n    const\/4 v6, 0x0\n    invoke-virtual \{v2, v6\}, Landroid\/widget\/LinearLayout;->removeViewAt\(I\)V\n    goto :native_screen_strip/);
    // The strip must run BEFORE the new paint is attempted.
    const stripAt = render.indexOf('\n    :native_screen_strip\n');
    const paintAt = render.indexOf('\n    :do_paint\n');
    assert.ok(stripAt > 0 && paintAt > stripAt, 'stale rows are removed before any paint');
    // The painted screen is tracked so same-screen repaints keep their content.
    assert.match(render, /:native_screen_painted_track\n    iget-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeCurrentScreen:Ljava\/lang\/String;\n    iput-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativePaintedScreen:Ljava\/lang\/String;/);
});

test('the activity keeps a dedicated nativePaintedScreen field', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(src, /\.field private nativePaintedScreen:Ljava\/lang\/String;/);
    // Session epoch guards on async runnables are untouched.
    assert.match(src, /nativeSessionEpoch/);
});

test('Paramètres renders its own loading state and its own real settings rows', () => {
    const settings = activityMethod('openNativeSettings');
    assert.match(settings, /Chargement des paramètres/);
    assert.match(settings, /__sfRequestSpotifySettings/);
    const apply = applyNativeUiDataBody();
    const settingsBranch = apply.slice(apply.indexOf('\n    :check_settings\n'), apply.indexOf('\n    :check_search\n'));
    assert.match(settingsBranch, /nativeCurrentScreen/);
    assert.match(settingsBranch, /const-string v3, "settings"/);
    assert.match(settingsBranch, /if-eqz v4, :apply_done/, 'settings rows paint only on the settings screen');
    assert.match(settingsBranch, /renderNativeRows/);
    // Real settings content, on the settings channel only.
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /function buildSpotifySettingsRows/);
    assert.match(shell, /Géré par Spotify/);
});

test('the library tab paints its own loading state when no cache exists', () => {
    const click = activityMethod('onNativeLibraryClick');
    assert.match(click, /:lib_render_loading/);
    assert.match(click, /Chargement des playlists/);
    assert.match(click, /Votre bibliothèque/);
    // The loading row is rendered through renderNativeRows (screen isolation).
    const loadingBlock = click.slice(click.indexOf(':lib_render_loading'), click.indexOf(':lib_fetch'));
    assert.match(loadingBlock, /renderNativeRows/);
});

test('screen-title payloads cannot overwrite the title of another screen', () => {
    const apply = applyNativeUiDataBody();
    const titleBlock = apply.slice(apply.indexOf('const-string v0, "screen-title"'), apply.indexOf('\n    :check_detail_data\n'));
    assert.match(titleBlock, /nativeCurrentScreen/);
    assert.match(titleBlock, /const-string v3, "detail"/);
    assert.match(titleBlock, /if-nez v2, :apply_done/);
});

test('openNativeRow routes the retry sentinel back to fetchMediaItems without navigating', () => {
    const openRow = activityMethod('openNativeRow');
    assert.match(openRow, /spotify:retry:media:/);
    assert.match(openRow, /const-string v2, "window.fetchMediaItems"/);
    const retryBlock = openRow.slice(openRow.indexOf('spotify:retry:media:'), openRow.indexOf('\n    :native_row_not_retry\n'));
    assert.match(retryBlock, /renderNativeRows/);
    assert.match(retryBlock, /Chargement des titres/);
    assert.ok(!/setNativeScreen/.test(retryBlock), 'a retry never changes the current screen');
});

// ---------------------------------------------------------------------------
// 3. Library and playlist data path (real fetch behaviours)
// ---------------------------------------------------------------------------

test('a real library with playlists is delivered to the shell as browsable rows', async () => {
    const { sandbox, mediaItems, fetchCalls } = createBridgeVm([
        libraryPage([playlistItem('Ma playlist', 'spotify:playlist:abc12345')])
    ]);
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('playlists');
    assert.ok(fetchCalls.length >= 1, 'the internal libraryV3 query is really sent');
    assert.ok(mediaItems.length >= 1);
    const delivered = mediaItems[mediaItems.length - 1];
    assert.equal(delivered.parentId, 'playlists');
    const items = JSON.parse(delivered.itemsJson);
    assert.equal(items.length, 1);
    assert.equal(items[0].name, 'Ma playlist');
    assert.equal(items[0].id, 'spotify:playlist:abc12345');
    assert.equal(items[0].isGrid, true);
});

test('a truly empty library shows an honest empty state, never an error', async () => {
    const { sandbox, mediaItems, uiCalls } = createBridgeVm([libraryPage([])]);
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('playlists');
    const rows = statusRowsIn(uiCalls, 'media:');
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'Aucune playlist dans ce compte');
    assert.ok(!rows[0].title.includes('Impossible'), 'empty is not an error');
    // The media browser receives a real empty list.
    assert.equal(mediaItems[mediaItems.length - 1].itemsJson, '[]');
});

test('a network failure is an explicit error with retry, never an empty library', async () => {
    const { sandbox, mediaItems, uiCalls } = createBridgeVm([], { networkError: true });
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('playlists');
    const rows = statusRowsIn(uiCalls, 'media:');
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'Impossible de charger les playlists');
    assert.match(rows[0].subtitle, /réseau/i);
    assert.equal(rows[0].uri, 'spotify:retry:media:playlists', 'the row carries a real retry sentinel');
    // Never disguised as empty rows on the native screen.
    assert.ok(rows.every((row) => row.title !== 'Aucune playlist dans ce compte'));
    assert.ok(mediaItems.every((call) => call.itemsJson === '[]'), 'the car browser only gets the empty list');
});

test('an unsupported category has its own distinct state', async () => {
    const { sandbox, uiCalls } = createBridgeVm();
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('spotify:weird:category');
    const rows = statusRowsIn(uiCalls, 'media:');
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'Catégorie non prise en charge');
});

test('playlist open falls back to the bundled hash when the captured hash is rejected', async () => {
    const { sandbox, mediaItems, fetchCalls } = createBridgeVm([
        gqlErrors(),
        playlistTracksBody(['Titre un', 'Titre deux'])
    ]);
    sandbox.spotAuthToken = 'Bearer test-token';
    sandbox.window.localStorage.setItem('sp_hash_fetchPlaylist', 'a'.repeat(64));
    await sandbox.window.fetchMediaItems('spotify:playlist:abc12345');
    assert.equal(fetchCalls.length, 2, 'the bundled hash is tried after the captured one');
    const firstHash = JSON.parse(fetchCalls[0].opts.body).extensions.persistedQuery.sha256Hash;
    const secondHash = JSON.parse(fetchCalls[1].opts.body).extensions.persistedQuery.sha256Hash;
    assert.equal(firstHash, 'a'.repeat(64), 'the captured hash is tried first');
    assert.equal(secondHash, '346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763');
    assert.notEqual(firstHash, secondHash);
    for (const call of fetchCalls) {
        assert.match(String(call.opts.headers.Authorization || ''), /^Bearer /, 'the real token is sent');
    }
    const items = JSON.parse(mediaItems[mediaItems.length - 1].itemsJson);
    assert.equal(items.length, 2, 'the parsed tracks reach the shell');
    assert.equal(items[0].name, 'Titre un');
});

test('a failed playlist open shows an explicit error with a retry sentinel, never an empty list', async () => {
    const { sandbox, mediaItems, uiCalls } = createBridgeVm([
        gqlErrors(),
        gqlErrors(),
        gqlErrors(),
        gqlErrors()
    ], { status: 500, body: {} });
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('spotify:playlist:abc12345');
    const rows = statusRowsIn(uiCalls, 'media:');
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'Impossible de charger les titres');
    assert.equal(rows[0].uri, 'spotify:retry:media:spotify:playlist:abc12345');
    assert.equal(mediaItems[mediaItems.length - 1].itemsJson, '[]');
});

test('a genuinely empty playlist stays empty without a fake error', async () => {
    const { sandbox, mediaItems, uiCalls } = createBridgeVm([
        playlistTracksBody([])
    ]);
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('spotify:playlist:empty12345');
    assert.equal(mediaItems[mediaItems.length - 1].itemsJson, '[]');
    assert.equal(statusRowsIn(uiCalls, 'media:').length, 0, 'no error row for a valid empty answer');
});

test('an unexpected playlist response shape is classified as such, not as empty', async () => {
    const { sandbox, uiCalls } = createBridgeVm([
        { status: 200, body: { data: {} } },
        { status: 200, body: { data: {} } }
    ]);
    sandbox.spotAuthToken = 'Bearer test-token';
    await sandbox.window.fetchMediaItems('spotify:playlist:abc12345');
    const rows = statusRowsIn(uiCalls, 'media:');
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'Impossible de charger les titres');
    assert.equal(rows[0].uri, 'spotify:retry:media:spotify:playlist:abc12345');
});

// ---------------------------------------------------------------------------
// 4. Payload lifecycle and non-regression of connection/player
// ---------------------------------------------------------------------------

test('sendNativeUiData caps oversized payloads honestly instead of losing the screen', () => {
    // Run the real sendNativeUiData in isolation and feed it a payload that
    // would exceed the 256 KB bridge limit: it must cap with a visible footer
    // instead of letting dispatchNativeUi drop the whole screen silently.
    const shell = read('assets/native_ui_shell.js');
    const start = shell.indexOf('function sendNativeUiData(');
    const end = shell.indexOf('function spotifyResourceUri(');
    const source = shell.slice(start, end);
    assert.match(source, /cappedRows/);
    assert.match(source, /éléments supplémentaires non affichés/);

    const calls = [];
    const store = new Map();
    const sandbox = {
        window: {
            location: { hostname: 'open.spotify.com', pathname: '/', href: 'https://open.spotify.com/' },
            AndBridge: {
                onNativeUiData: (screen, data) => calls.push({ screen, data }),
                onNativeListText: () => {},
                onNativeHomeRows: (data) => calls.push({ screen: 'home-rows', data })
            },
            localStorage: { getItem: (k) => (store.has(k) ? store.get(k) : null), setItem: (k, v) => store.set(k, String(v)) },
            __sfLibDiagRecord() {},
            __sfLibDiagUpdate() {}
        },
        URL
    };
    sandbox.window.window = sandbox.window;
    vm.runInNewContext(
        'var SUPPORTED_TYPES = [\'playlist\',\'album\',\'artist\',\'track\',\'show\'];\n' +
        'function isSessionBlockedByLogout() { return false; }\n' +
        'function nativeSpotifyUri(v) { return String(v || \'\'); }\n' +
        'function sanitizeDiagnostic(t) { return t; }\n' +
        source +
        '\nwindow.__testSend = sendNativeUiData;',
        sandbox
    );

    const rows = [];
    for (let i = 0; i < 4000; i += 1) {
        rows.push({
            title: 'Playlist numéro ' + i + ' avec un nom assez long pour remplir le payload',
            subtitle: 'Sous-titre descriptif numéro ' + i,
            section: 'Vos playlists',
            uri: 'spotify:playlist:' + String(i).padStart(8, '0')
        });
    }
    assert.equal(sandbox.window.__testSend('home', rows), true);
    const homeCall = calls.filter((call) => call.screen === 'home').pop();
    assert.ok(homeCall, 'the payload is still delivered');
    assert.ok(homeCall.data.length < 240000, 'the payload stays under the 256 KB bridge limit');
    const parsed = JSON.parse(homeCall.data);
    const footer = parsed[parsed.length - 1];
    assert.match(footer.title, /éléments supplémentaires non affichés/, 'the cap is visible, not silent');
    assert.ok(!footer.uri, 'the overflow note is not a fake playlist');
    assert.ok(parsed.some((row) => row.uri === 'spotify:playlist:00000000'), 'real rows are preserved');
});

test('home and library grids render real cards with covers, gutters and clear hierarchy', () => {
    const factory = read('smali/com/melodix/music/NativeUiRowFactory.smali');
    // Card mode is selected for grids only (useGrid), lists keep the flat row.
    const create = factory.slice(factory.indexOf('.method public static create('), factory.indexOf('.method public static createTile('));
    assert.match(create, /NativeHomeFeed;->useGrid:Z/);
    assert.match(create, /invoke-static \{p0, p1\}, Lcom\/melodix\/music\/NativeUiRowFactory;->createTile/);
    assert.match(create, /:native_row_list_mode/);
    // The tile itself: rounded card, large cover, bold 2-line title, subtitle.
    const tile = factory.slice(factory.indexOf('.method public static createTile('), factory.indexOf('.method public static createSectionHeader('));
    assert.match(tile, /setCornerRadius/);
    assert.match(tile, /native_cover_placeholder/);
    assert.match(tile, /NativeImageLoader;->load/);
    assert.match(tile, /NativeRowClickListener/);
    assert.match(tile, /setClipToOutline/);
    // Grid cells get real gutters so cards never touch.
    const feed = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const putTile = feed.slice(feed.indexOf(':put_tile\n    new-instance'));
    assert.match(putTile, /leftMargin:I/);
    assert.match(putTile, /rightMargin:I/);
    assert.match(putTile, /bottomMargin:I/);
});

test('navigation keeps clear active states and generous touch targets', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const tab = activityMethod('styleNativeTab');
    assert.match(tab, /setTypeface/, 'the active tab is bold');
    assert.match(tab, /-0xe128a0/, 'the active accent stays the Spotify green');
    const layout = read('res/layout/activity_main.xml');
    assert.match(layout, /android:layout_width="44.0dip"/, 'the header settings entry is at least 44dp');
    assert.match(layout, /contentDescription="Paramètres"/, 'the settings button is labelled for tests and a11y');
});

test('login flow and player controls are untouched by the isolation fixes', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    for (const handler of ['onNativePlayPauseClick', 'onNativePlayerNextClick', 'onNativePlayerPreviousClick', 'onNativePlayerExpandClick']) {
        assert.ok(src.includes(`.method public final ${handler}`), handler);
    }
    assert.match(src, /postNativeUiReady/);
    assert.match(read('smali/com/melodix/music/AndBridge.smali'), /nativeLogout/);
    const bridge = read('assets/spotify_bridge.js');
    assert.match(bridge, /onMediaItemsLoaded\(parentId, JSON\.stringify\(tracks\)\)/, 'success still delivers tracks');
    // The pinned diagnostic slice stays outside the patched regions.
    assert.match(bridge, /window\.__sfLibDiag/);
    assert.match(bridge, /window\.fetchMediaItems = fetchMediaItems;/);
});
