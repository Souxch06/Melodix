// Targeted non-regression suite for the real playlist-retrieval pipeline
// (temporary secure diagnostic + demonstrated robustness causes):
//   1. every pipeline step is recorded with non-sensitive data only;
//   2. an error is NEVER transformed into an empty library (token missing or
//      malformed, HTTP failure, network failure, GraphQL rejection, unexpected
//      response shape);
//   3. the internal libraryV3 persisted query (NOT an official Spotify API)
//      is robust against hash corruption and falls back to the bundled hash;
//   4. the number of playlists really delivered to the native shell is tracked.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const FALLBACK_HASH = '0082bf82412db50128add72dbdb73e2961d59100b9cbf41fb25c568bd8bc358b';

// ---------------------------------------------------------------------------
// Bridge VM harness (whole assets/spotify_bridge.js, scriptable oriFetch)
// ---------------------------------------------------------------------------

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

function createTimerHarness() {
    const timers = [];
    let nextId = 1;
    return {
        timers,
        setTimeout: (fn, delay) => {
            const handle = { id: nextId++, fn, delay: Number(delay) || 0, cleared: false };
            timers.push(handle);
            return handle.id;
        },
        clearTimeout: (id) => {
            timers.forEach((handle) => {
                if (handle.id === id) handle.cleared = true;
            });
        },
        setInterval: () => nextId++,
        clearInterval: () => {}
    };
}

async function flushTimers(timerHarness, rounds = 400) {
    for (let i = 0; i < rounds; i += 1) {
        await new Promise((resolve) => setImmediate(resolve));
        const pending = timerHarness.timers.splice(0);
        for (const handle of pending) {
            if (!handle.cleared) handle.fn();
        }
    }
}

function scriptFetch(behaviors) {
    const queue = behaviors.slice();
    const calls = [];
    const impl = async (url, opts) => {
        calls.push({ url: String(url), opts });
        const behavior = queue.length
            ? queue.shift()
            : (() => { throw new Error('scriptFetch: unexpected extra fetch'); })();
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

function gqlErrors(codes) {
    return {
        status: 200,
        body: {
            errors: codes.map((code) => ({ message: 'gql failure', extensions: { code } })),
            data: null
        }
    };
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

function createBridgeVm(behaviors = []) {
    const timers = createTimerHarness();
    const scripted = scriptFetch(behaviors);
    const observers = [];
    const uiCalls = [];

    class MockMutationObserver {
        constructor() { observers.push(this); }
        observe() {}
        disconnect() {}
    }

    const store = new Map();
    const localStorage = {
        getItem: (key) => (store.has(key) ? store.get(key) : null),
        setItem: (key, value) => store.set(key, String(value)),
        removeItem: (key) => store.delete(key),
        clear: () => store.clear()
    };

    const classListStub = { add() {}, remove() {}, toggle() {}, contains: () => false };
    const nodeStub = () => ({
        style: {},
        classList: classListStub,
        setAttribute() {},
        getAttribute: () => null,
        appendChild() {},
        append() {},
        remove() {},
        removeChild() {},
        insertBefore() {},
        addEventListener() {},
        querySelectorAll: () => [],
        firstChild: null
    });
    const documentStub = {
        hidden: false,
        readyState: 'complete',
        documentElement: {},
        body: Object.assign(nodeStub(), {}),
        head: { appendChild() {} },
        createElement: nodeStub,
        querySelector: () => null,
        querySelectorAll: () => [],
        getElementById: () => null,
        addEventListener() {},
        removeEventListener() {}
    };

    const batches = [];
    const sandbox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        Headers: MockHeaders,
        URL,
        URLSearchParams,
        MutationObserver: MockMutationObserver,
        CustomEvent: function CustomEvent(type, detail) { this.type = type; this.detail = detail; },
        Event: function Event(type) { this.type = type; },
        navigator: { mediaSession: null, userAgent: 'Mozilla/5.0' },
        location: {
            href: 'https://open.spotify.com/',
            origin: 'https://open.spotify.com',
            hostname: 'open.spotify.com',
            pathname: '/',
            search: '',
            assign() {},
            replace() {},
            reload() {}
        },
        history: { pushState() {}, replaceState() {}, back() {} },
        localStorage,
        sessionStorage: {
            getItem: () => null,
            setItem: () => {},
            removeItem: () => {},
            clear: () => {}
        },
        document: documentStub,
        fetch: scripted.impl,
        XMLHttpRequest: function XMLHttpRequest() {},
        WebSocket: function WebSocket() {},
        Audio: function Audio() {},
        HTMLMediaElement: { prototype: { play() { return Promise.resolve(); }, pause() {} } },
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
            onMediaItemsLoaded() {},
            onMediaLibBatch: (raw) => batches.push(raw),
            onLibDiagState() {},
            onNativeUiReady() {},
            setCanvasDisabled() {},
            manageTSleep() {},
            nativeLogout() {}
        },
        setTimeout: timers.setTimeout,
        clearTimeout: timers.clearTimeout,
        setInterval: timers.setInterval,
        clearInterval: timers.clearInterval
    };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;

    vm.runInNewContext(read('assets/spotify_bridge.js'), sandbox, { filename: 'assets/spotify_bridge.js' });
    return { sandbox, timers, calls: scripted.calls, uiCalls, store, batches };
}

// ---------------------------------------------------------------------------
// Shell harness (assets/native_ui_shell.js on a shared window)
// ---------------------------------------------------------------------------

function bootShellOn(windowObj, documentExtra = {}) {
    const document = Object.assign({
        readyState: 'complete',
        documentElement: {},
        hidden: false,
        querySelector: (selector) => (selector === '#main-view' ? { querySelectorAll: () => [] } : null),
        querySelectorAll: () => [],
        addEventListener: () => {}
    }, documentExtra);
    class TestMutationObserver {
        observe() {}
        disconnect() {}
    }
    windowObj.MutationObserver = TestMutationObserver;
    windowObj.document = windowObj.document || document;
    vm.runInNewContext(read('assets/native_ui_shell.js'), {
        window: windowObj,
        document: windowObj.document,
        URL,
        MutationObserver: TestMutationObserver
    });
    return windowObj;
}

function bootShell(extra = {}) {
    const calls = [];
    const timers = [];
    const store = new Map();
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
    bootShellOn(window, extra.document);
    return { window, calls, timers, store };
}

function lastScreenRows(calls, screen) {
    const list = calls.filter((call) => call.screen === screen);
    return JSON.parse(list[list.length - 1].data);
}

function reportJson(sandbox) {
    return JSON.stringify(sandbox.window.__sfGetLibDiagReport());
}

// ---------------------------------------------------------------------------
// 1. Diagnostic records the real pipeline without any secret
// ---------------------------------------------------------------------------

test('a successful fetch records session, token, hash, HTTP, shape, parsing and delivery counts', async () => {
    const harness = createBridgeVm([
        libraryPage([
            playlistItem('Électro été', 'spotify:playlist:elec1'),
            playlistItem('Rock « classique »', 'spotify:playlist:rock2')
        ])
    ]);
    const { sandbox } = harness;
    sandbox.__sfAuthBridgeState = 'signed-in';
    sandbox.spotAuthToken = 'Bearer secret.value.here';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'ready');
    assert.equal(sandbox.mediaLib.playlists.length, 2);

    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.session, 'detected');
    assert.equal(report.lastRun.token, 'bearer');
    assert.equal(report.lastRun.hashSource, 'fallback');
    assert.equal(report.lastRun.status, 'ready');
    assert.equal(report.lastRun.itemsTotal, 2);
    assert.equal(report.lastRun.parsed.playlists, 2);
    assert.equal(report.failureKind, null);

    const steps = report.steps.map((entry) => entry.step);
    for (const expected of ['session', 'token', 'hash', 'shape', 'parse']) {
        assert.ok(steps.includes(expected), `step ${expected} is recorded`);
    }
    const httpAttempt = report.lastRun.attempts[0];
    assert.equal(httpAttempt.httpStatus, 200);
    assert.equal(httpAttempt.shape, 'ok');
    assert.equal(httpAttempt.items, 2);
});

test('the diagnostic never stores tokens, cookies or account identifiers', async () => {
    const harness = createBridgeVm([
        libraryPage([playlistItem('Secret mix', 'spotify:playlist:abc1')])
    ]);
    const { sandbox, calls } = harness;
    sandbox.spotAuthToken = 'Bearer SECRET_TOKEN_abc123.def456';
    sandbox.localStorage.setItem('spot_auth_token', 'Bearer SECRET_TOKEN_abc123.def456');

    await sandbox.checkMediaLib();
    // The real request really carried the credential…
    assert.equal(calls.length, 1);
    assert.equal(calls[0].opts.headers.Authorization, 'Bearer SECRET_TOKEN_abc123.def456');

    // …but the recorded diagnostic contains none of it.
    const dump = reportJson(sandbox);
    assert.doesNotMatch(dump, /SECRET_TOKEN/);
    assert.doesNotMatch(dump, /Bearer /);
    assert.doesNotMatch(dump, /sp_dc=|sp_key=|sessionid=/i);
    assert.doesNotMatch(dump, /eyJ[A-Za-z0-9_-]{8,}/);
    assert.doesNotMatch(dump, /spotify:user:/);
    // Playlist names are never recorded either: only counts.
    assert.doesNotMatch(dump, /Secret mix/);
});

test('libDiagUpdate ignores unknown keys so a secret cannot be persisted by mistake', () => {
    const { sandbox } = createBridgeVm();
    sandbox.__sfLibDiagUpdate({
        token: 'bearer',
        apiKey: 'SECRET_KEY_123',
        parsed: { playlists: 3, accessToken: 'SECRET_INNER' },
        delivered: { homePlaylistRows: 2, cookie: 'SECRET_COOKIE' }
    });
    const dump = reportJson(sandbox);
    assert.doesNotMatch(dump, /SECRET/);
    assert.equal(sandbox.__sfGetLibDiagReport().lastRun.token, 'bearer');
    assert.equal(sandbox.__sfGetLibDiagReport().lastRun.parsed.playlists, 3);
    assert.equal(sandbox.__sfGetLibDiagReport().lastRun.delivered.homePlaylistRows, 2);
});

test('diagnostic labels outside a conservative charset are dropped entirely', () => {
    const { sandbox } = createBridgeVm();
    sandbox.__sfLibDiagRecord('token', true, 'format Bearer <img src=x onerror=alert(1)>');
    const entry = sandbox.__sfGetLibDiagReport().steps[0];
    assert.equal(entry.detail, '[non affiché]');
});

// ---------------------------------------------------------------------------
// 2. An error is never transformed into an empty library
// ---------------------------------------------------------------------------

test('a missing token keeps the library pending first, then a bounded terminal error: never empty, never ready', async () => {
    const harness = createBridgeVm();
    const { sandbox, timers } = harness;
    sandbox.__sfAuthBridgeState = 'signed-in';

    // Bounded-wait contract (mission): the first pass waits (pending), and the
    // bounded retry budget (MEDIA_LIB_MAX_RETRIES = 5) must end in a terminal
    // error instead of a loading indicator that never resolves.
    let firstState = null;
    const pending = sandbox.checkMediaLib().then(() => { firstState = sandbox.__sfMediaLibState; });
    await flushTimers(timers);
    await pending;

    assert.equal(firstState, 'pending', 'no token -> the first pass waits');
    assert.equal(sandbox.__sfMediaLibState, 'error', 'bounded retries end in a terminal error');
    assert.notEqual(sandbox.__sfMediaLibState, 'empty');
    assert.notEqual(sandbox.__sfMediaLibState, 'ready');
    assert.equal(sandbox.__sfMediaLibRetryExhausted, true);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'token-missing');
    // The retry loop is bounded (MEDIA_LIB_MAX_RETRIES = 5).
    const runs = report.steps.filter((entry) => entry.step === 'session').length;
    assert.ok(runs <= 6, `bounded retries (got ${runs} runs)`);
});

test('a malformed token throws TokenError instead of returning a fake empty list', async () => {
    const harness = createBridgeVm();
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'raw-token-without-bearer-prefix';

    await assert.rejects(() => sandbox.fetchAllLibrary(), (error) => {
        assert.equal(error.name, 'TokenError');
        return true;
    });
    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error', 'malformed token is an error, not an empty account');
    assert.equal(sandbox.__sfGetLibDiagReport().failureKind, 'token-missing');
});

test('HTTP 401/403 is classified as an access denial, never as an empty library', async () => {
    for (const status of [401, 403]) {
        const harness = createBridgeVm([{ status, body: {} }]);
        const { sandbox } = harness;
        sandbox.spotAuthToken = 'Bearer token-value';

        await sandbox.checkMediaLib();
        assert.equal(sandbox.__sfMediaLibState, 'error', `HTTP ${status} surfaces as error`);
        const report = sandbox.__sfGetLibDiagReport();
        assert.equal(report.failureKind, 'access-denied');
        assert.equal(report.lastRun.attempts[0].httpStatus, status);
    }
});

test('a network failure is classified as network, never as an empty library', async () => {
    const harness = createBridgeVm([{ networkError: true }]);
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error');
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'network');
    assert.equal(report.lastRun.attempts[0].networkError, true);
});

test('a server error keeps its HTTP status and is not read as an empty account', async () => {
    const harness = createBridgeVm([{ status: 500, body: {} }]);
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error');
    assert.equal(sandbox.__sfGetLibDiagReport().failureKind, 'http-error');
});

test('an unexpected response shape is a ShapeError, never a silently empty library', async () => {
    const shapeMismatch = { status: 200, body: { data: { me: { libraryV2Renamed: { items: [] } } } } };
    const harness = createBridgeVm([shapeMismatch, shapeMismatch]);
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';

    await assert.rejects(() => sandbox.fetchAllLibrary(), (error) => {
        assert.equal(error.name, 'ShapeError');
        return true;
    });
    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error', 'shape mismatch is an error');
    assert.equal(sandbox.__sfGetLibDiagReport().failureKind, 'shape-mismatch');
});

test('me:null is reported as an unrecognized session, not as an empty account', async () => {
    const harness = createBridgeVm([
        { status: 200, body: { data: { me: null } } }
    ]);
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error');
    assert.equal(sandbox.__sfGetLibDiagReport().failureKind, 'no-session');
});

test('a valid response with zero items is the only path that reports a real empty library', async () => {
    const harness = createBridgeVm([libraryPage([])]);
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'empty');
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, null);
    assert.equal(report.lastRun.status, 'empty');
    assert.equal(report.lastRun.attempts[0].shape, 'ok');
    assert.match(report.conclusion, /vide/i);
});

// ---------------------------------------------------------------------------
// 3. Robustness of the internal libraryV3 persisted query (not official API)
// ---------------------------------------------------------------------------

test('a corrupted stored hash is ignored and the bundled hash is used', () => {
    const { sandbox } = createBridgeVm();
    sandbox.spHashes = { libraryV3: 'not-a-sha256' };
    sandbox.localStorage.setItem('sp_hash_libraryV3', 'zzzz-corrupted');
    assert.equal(sandbox.getGqlHash('libraryV3', FALLBACK_HASH), FALLBACK_HASH);

    sandbox.spHashes = {};
    sandbox.localStorage.setItem('sp_hash_libraryV3', 'a'.repeat(64));
    assert.equal(sandbox.getGqlHash('libraryV3', FALLBACK_HASH), 'a'.repeat(64));
});

test('a stale captured hash falls back to the bundled hash and still loads the library', async () => {
    const captured = 'b'.repeat(64);
    const harness = createBridgeVm([
        gqlErrors(['PERSISTED_QUERY_NOT_FOUND']),
        libraryPage([playlistItem('Mix', 'spotify:playlist:m1')])
    ]);
    const { sandbox, calls } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';
    sandbox.spHashes = { libraryV3: captured };

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'ready', 'the fallback candidate recovered the fetch');
    assert.equal(calls.length, 2);
    const firstBody = JSON.parse(calls[0].opts.body);
    const secondBody = JSON.parse(calls[1].opts.body);
    assert.equal(firstBody.extensions.persistedQuery.sha256Hash, captured, 'captured hash tried first');
    assert.equal(secondBody.extensions.persistedQuery.sha256Hash, FALLBACK_HASH, 'bundled hash tried second');
    assert.equal(firstBody.operationName, 'libraryV3');

    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.hashSource, 'dynamic');
    assert.equal(report.lastRun.attempts[0].gqlErrorCodes.join(','), 'PERSISTED_QUERY_NOT_FOUND');
    assert.equal(report.lastRun.attempts[1].candidate, 'fallback');
});

test('a GraphQL rejection on every hash candidate throws GraphQLError with sanitized codes', async () => {
    const harness = createBridgeVm([
        gqlErrors(['PERSISTED_QUERY_NOT_FOUND']),
        gqlErrors(['PERSISTED_QUERY_NOT_FOUND']),
        gqlErrors(['PERSISTED_QUERY_NOT_FOUND']),
        gqlErrors(['PERSISTED_QUERY_NOT_FOUND'])
    ]);
    const { sandbox } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';
    sandbox.spHashes = { libraryV3: 'c'.repeat(64) };

    await assert.rejects(() => sandbox.fetchAllLibrary(), (error) => {
        assert.equal(error.name, 'GraphQLError');
        assert.match(error.message, /PERSISTED_QUERY_NOT_FOUND/);
        return true;
    });
    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error');
    assert.equal(sandbox.__sfGetLibDiagReport().failureKind, 'graphql-error');
});

test('pagination follows offset until a short page and never fabricates items', async () => {
    const firstPage = Array.from({ length: 50 }, (_, i) => playlistItem('P' + i, 'spotify:playlist:page' + i));
    const harness = createBridgeVm([
        libraryPage(firstPage),
        libraryPage([playlistItem('Dernière', 'spotify:playlist:last')])
    ]);
    const { sandbox, calls } = harness;
    sandbox.spotAuthToken = 'Bearer token-value';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'ready');
    assert.equal(sandbox.mediaLib.playlists.length, 51);
    assert.equal(calls.length, 2);
    assert.equal(JSON.parse(calls[0].opts.body).variables.offset, 0);
    assert.equal(JSON.parse(calls[1].opts.body).variables.offset, 50);
    assert.equal(sandbox.__sfGetLibDiagReport().lastRun.itemsTotal, 51);
});

test('parseLibrary keeps accents, real URIs and counts skipped items without inventing any', () => {
    const { sandbox } = createBridgeVm();
    const res = sandbox.parseLibrary([
        playlistItem('Été indien', 'spotify:playlist:acc1'),
        playlistItem('No uri entry', ''),
        { item: { data: null } },
        { item: { data: { __typename: 'Album', uri: 'spotify:album:al1', name: 'Album' } } }
    ]);
    assert.equal(res.playlists.length, 1);
    assert.equal(res.playlists[0].name, 'Été indien');
    assert.equal(res.albums.length, 1);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.parsed.playlists, 1);
    assert.equal(report.lastRun.parsed.albums, 1);
    assert.equal(report.lastRun.parsed.skipped, 2);
});

// ---------------------------------------------------------------------------
// 4. Playlists really delivered to the native shell are counted
// ---------------------------------------------------------------------------

test('end to end: real playlists reach the native shell and the diagnostic counts them', async () => {
    const harness = createBridgeVm([
        libraryPage([
            playlistItem('Électro été', 'spotify:playlist:elec1'),
            playlistItem('Rock classique', 'spotify:playlist:rock2'),
            playlistItem('Étude & focus', 'spotify:playlist:focus3')
        ])
    ]);
    const { sandbox, uiCalls } = harness;
    sandbox.__sfAuthBridgeState = 'signed-in';
    bootShellOn(sandbox);
    // The Bearer token is only intercepted after the shell boot warm-up,
    // exactly like a real launch.
    sandbox.spotAuthToken = 'Bearer token-value';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'ready');

    const homeRows = lastScreenRows(uiCalls, 'home');
    const playlistRows = homeRows.filter((row) => row.uri && row.uri.indexOf(':playlist:') >= 0);
    assert.equal(playlistRows.length, 3, 'the three real playlists are painted on home');
    assert.ok(homeRows.some((row) => row.title === 'Électro été'));
    assert.ok(!JSON.stringify(homeRows).includes('Chargement des playlists'));

    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.delivered.homePlaylistRows, 3, 'the delivery step counts the transmitted playlists');
    assert.equal(report.lastRun.delivered.afterReady, true);
    assert.equal(report.failureKind, null);
    assert.match(report.conclusion, /3 playlist/);
});

test('the shell records home and media deliveries as the diagnostic step 7 only', () => {
    const records = [];
    const { window, calls } = bootShell({
        window: {
            mediaLib: { playlists: [{ name: 'A', uri: 'spotify:playlist:a1' }] },
            __sfLibDiagRecord: (step, ok, detail) => records.push({ step, ok, detail }),
            __sfLibDiagUpdate: () => {}
        }
    });
    const homeDeliveries = records.filter((entry) => entry.step === 'deliver' && entry.detail.indexOf('home ') === 0);
    assert.equal(homeDeliveries.length, 1, 'home payloads are recorded once');
    assert.match(homeDeliveries[0].detail, /playlists=1/);
    // The settings payload itself is never recorded as a delivery.
    window.__sfRequestSpotifySettings();
    assert.equal(calls.filter((call) => call.screen === 'settings').length >= 1, true);
    assert.equal(records.filter((entry) => entry.step === 'deliver' && entry.detail.indexOf('settings') === 0).length, 0);
});

// ---------------------------------------------------------------------------
// 5. Settings and home surfaces are honest about the failure category
// ---------------------------------------------------------------------------

test('the settings screen shows a temporary recovery diagnostic row with the real conclusion', () => {
    const report = {
        temporary: true,
        failureKind: 'access-denied',
        conclusion: 'Échec à l\'étape « Statut HTTP » : accès refusé (HTTP 401/403).',
        steps: [],
        lastRun: {
            session: 'detected',
            token: 'bearer',
            hashSource: 'fallback',
            attempts: [{ candidate: 'fallback', httpStatus: 403, networkError: false, gqlErrorCodes: [], shape: null, items: null }],
            itemsTotal: 0,
            parsed: { playlists: 0, albums: 0, artists: 0, podcasts: 0, skipped: 0 },
            delivered: { homeRows: 0, homePlaylistRows: 0, mediaRows: 0, mediaPlaylistRows: 0, seen: false, afterReady: false },
            status: 'error'
        }
    };
    const { window, calls } = bootShell({
        window: { __sfGetLibDiagReport: () => report }
    });
    window.__sfRequestSpotifySettings();
    const rows = lastScreenRows(calls, 'settings');
    const diagRow = rows.find((row) => row.uri === 'spotify:settings:lib_diag');
    assert.ok(diagRow, 'the temporary diagnostic row exists');
    assert.match(diagRow.title, /Diagnostic de récupération \(temporaire\)/);
    assert.match(diagRow.subtitle, /accès refusé/);
    assert.equal(diagRow.settingValue, 'Échec étape');

    // Tapping it expands the honest step-by-step panel (real values only).
    window.__sfToggleSpotifySetting('spotify:settings:lib_diag');
    const expanded = lastScreenRows(calls, 'settings');
    const stepRows = expanded.filter((row) => row.uri.indexOf('spotify:settings:lib_diag_step') === 0);
    assert.equal(stepRows.length, 8, 'the 7 pipeline steps + the conclusion');
    const httpRow = stepRows.find((row) => row.title.indexOf('4. Statut HTTP') === 0);
    assert.equal(httpRow.settingValue, 'HTTP 403');
    const tokenRow = stepRows.find((row) => row.title.indexOf('2. Jeton') === 0);
    assert.equal(tokenRow.settingValue, 'Oui (format Bearer)');

    // Tapping again collapses the panel.
    window.__sfToggleSpotifySetting('spotify:settings:lib_diag');
    const collapsed = lastScreenRows(calls, 'settings');
    assert.equal(collapsed.filter((row) => row.uri.indexOf('spotify:settings:lib_diag_step') === 0).length, 0);
});

test('the home error row distinguishes access denial, network failure, shape mismatch and render gap', () => {
    const expectations = [
        ['access-denied', /Accès refusé par Spotify/],
        ['network', /Erreur réseau/],
        ['shape-mismatch', /Réponse Spotify inattendue/],
        ['render-gap', /non affichées/]
    ];
    expectations.forEach(([failureKind, pattern]) => {
        const { calls } = bootShell({
            window: {
                __sfMediaLibState: 'error',
                __sfGetLibDiagReport: () => ({ failureKind, conclusion: 'x', steps: [], lastRun: {} })
            }
        });
        const rows = lastScreenRows(calls, 'home');
        assert.equal(rows[0].title, 'Impossible de charger les playlists');
        assert.match(rows[0].subtitle, pattern);
    });
    // Without the diagnostic module the retry hint is kept.
    const { calls } = bootShell({ window: { __sfMediaLibState: 'error' } });
    assert.equal(lastScreenRows(calls, 'home')[0].subtitle, 'Appuyez sur Accueil pour réessayer');
});

test('an empty state still only appears for a confirmed empty account', () => {
    const { calls } = bootShell({ window: { mediaLib: { playlists: [] }, __sfMediaLibState: 'empty' } });
    const rows = lastScreenRows(calls, 'home');
    assert.equal(rows[0].title, 'Aucune playlist dans ce compte');
});

// ---------------------------------------------------------------------------
// 6. Source pins: the demonstrated causes stay fixed
// ---------------------------------------------------------------------------

test('fetchAllLibrary never returns a fake empty list and validates the response shape', () => {
    const bridge = read('assets/spotify_bridge.js');
    const start = bridge.indexOf('async function fetchAllLibrary');
    const body = bridge.slice(start, bridge.indexOf('window.fetchAllLibrary', start));
    assert.doesNotMatch(body, /return \[\];/, 'the token guard throws instead of returning []');
    assert.match(body, /tokenError\.name = 'TokenError'/);
    assert.match(body, /shapeError\.name = 'ShapeError'/);
    assert.match(body, /sessionError\.name = 'ShapeError'/);
    assert.match(body, /Array\.isArray\(libNode\.items\)/, 'only a validated items array is trusted');
    assert.match(body, /if \(!resp \|\| !resp\.ok \|\| !data\) \{[\s\S]*?throw httpError;/);
    assert.match(body, /httpError\.name = 'HttpError'/);
    assert.match(body, /hashCandidates/);
});

test('libraryV3 is documented as an undocumented internal operation, not an official Spotify API', () => {
    const bridge = read('assets/spotify_bridge.js');
    assert.match(bridge, /libraryV3 is an undocumented internal persisted-query operation/);
    assert.match(bridge, /\/\/ public\/official Spotify API/);
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /libraryV3, requête interne/);
});

test('the shell exposes the temporary diagnostic without leaking secrets into rows', () => {
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /spotify:settings:lib_diag/);
    assert.match(shell, /Diagnostic de récupération \(temporaire\)/);
    assert.match(shell, /function libDiagSettingsRows\(/);
    assert.match(shell, /window\.__sfLibDiagRecord\('deliver'/);
    // The diagnostic surface is described as temporary and honest.
    assert.match(shell, /To be removed once/);
    assert.doesNotMatch(shell, /spotify:settings:lib_diag[\s\S]{0,400}spot_auth_token/);
});

// ---------------------------------------------------------------------------
// 5. The page pushes bounded snapshots through AndBridge (JS->native): the
//    diagnostic screen must read the pipeline state even when the device's
//    native->JS evaluateJavascript delivery is dead.
// ---------------------------------------------------------------------------

test('the page pushes bounded library snapshots via AndBridge.onLibDiagState', async () => {
    const harness = createBridgeVm([
        libraryPage([playlistItem('Privée', 'spotify:playlist:p1')])
    ]);
    const { sandbox } = harness;
    const pushes = [];
    sandbox.window.AndBridge.onLibDiagState = (text) => pushes.push(String(text));

    sandbox.__sfAuthBridgeState = 'signed-in';
    sandbox.spotAuthToken = 'Bearer secret.value.here';
    await sandbox.checkMediaLib();

    assert.ok(pushes.length >= 3, 'pushed at start, on updates and at publish');
    assert.ok(pushes.some((p) => p.indexOf('start ') === 0), 'startup snapshot');
    assert.ok(pushes.some((p) => p.indexOf('publish ') === 0), 'publish snapshot');

    const last = pushes[pushes.length - 1];
    const snapshot = JSON.parse(last.slice(last.indexOf('{')));
    assert.equal(snapshot.status, 'ready');
    assert.equal(snapshot.token, 'oui', 'readiness only — never a credential');
    assert.equal(snapshot.itemsTotal, 1);
    assert.ok('hashSource' in snapshot, 'hash source reported');
    assert.ok(Array.isArray(snapshot.attempts), 'attempts reported');
    assert.ok(snapshot.attempts.every((a) => 'httpStatus' in a && Array.isArray(a.gqlErrorCodes)),
        'attempts carry httpStatus and gqlErrorCodes');
    assert.ok(!last.includes('secret.value.here'), 'no credential value in the push');
    assert.ok(!last.includes('Bearer'), 'no auth material in the push');
});

test('pushed snapshots report token readiness as oui/non without any value', () => {
    const harness = createBridgeVm();
    const { sandbox } = harness;
    const pushes = [];
    sandbox.window.AndBridge.onLibDiagState = (text) => pushes.push(String(text));

    sandbox.window.__sfLibDiag.lastRun.token = 'missing';
    sandbox.window.__sfLibDiag.lastRun.status = 'pending';
    sandbox.__sfLibDiagPush('unit');

    assert.equal(pushes.length, 1, 'the pending state is pushed too');
    const last = pushes[pushes.length - 1];
    const snapshot = JSON.parse(last.slice(last.indexOf('{')));
    assert.equal(snapshot.token, 'non', 'missing token reported as non');
    assert.equal(snapshot.status, 'pending', 'never claims empty while loading');

    sandbox.window.__sfLibDiag.lastRun.token = 'bearer';
    sandbox.window.__sfLibDiag.lastRun.status = 'ready';
    sandbox.__sfLibDiagPush('unit');
    const ready = JSON.parse(pushes[pushes.length - 1].slice(pushes[pushes.length - 1].indexOf('{')));
    assert.equal(ready.token, 'oui', 'ready token reported as oui');

    pushes.forEach((line) => {
        assert.ok(!/[A-Za-z0-9_+/-]{24,}/.test(line), 'no token-like opaque run');
    });
});

// ---------------------------------------------------------------------------
// 6. Change 1 — the page pushes the normalized library to native (JS->native)
//    in bounded batches and starts checkMediaLib BY ITSELF once the token is
//    ready: the result must not depend on a native->JS request.
// ---------------------------------------------------------------------------

test('the page pushes the normalized library to native in bounded batches', async () => {
    const harness = createBridgeVm([
        libraryPage([
            playlistItem('Électro été', 'spotify:playlist:elec1'),
            playlistItem('Rock classique', 'spotify:playlist:rock2')
        ])
    ]);
    const { sandbox } = harness;
    const pushes = [];
    sandbox.window.AndBridge.onMediaLibBatch = (text) => pushes.push(JSON.parse(String(text)));

    sandbox.__sfAuthBridgeState = 'signed-in';
    sandbox.spotAuthToken = 'Bearer secret.value.here';
    await sandbox.checkMediaLib();

    assert.ok(pushes.length >= 4, 'every category gets batches (terminal one included)');
    pushes.forEach((p) => {
        assert.ok(p.items.length <= 25, 'bounded batch size');
        assert.equal(typeof p.last, 'boolean', 'terminal flag present');
        assert.ok(!JSON.stringify(p).includes('secret.value.here'), 'never a credential');
    });

    const playlists = pushes.filter((p) => p.cat === 'playlists');
    assert.equal(playlists[0].items.length, 2);
    const item = playlists[0].items[0];
    assert.deepEqual(Object.keys(item).sort(), ['image', 'subtitle', 'title', 'uri']);
    assert.equal(item.title, 'Électro été');
    assert.equal(item.uri, 'spotify:playlist:elec1');

    ['playlists', 'albums', 'artists', 'podcasts'].forEach((cat) => {
        const list = pushes.filter((p) => p.cat === cat);
        assert.ok(list.length >= 1, cat + ' gets at least one terminal batch');
        assert.equal(list[list.length - 1].last, true, cat + ' ends terminal');
    });
    const albums = pushes.filter((p) => p.cat === 'albums');
    assert.equal(albums[0].items.length, 0, 'confirmed-empty category still pushes a terminal batch');
});

test('the page starts checkMediaLib by itself once the token is ready', async () => {
    const harness = createBridgeVm([
        libraryPage([playlistItem('Solo', 'spotify:playlist:solo1')])
    ]);
    const { sandbox } = harness;
    assert.equal(typeof sandbox.__sfLibSelfStartTick, 'function', 'self-start tick exists');

    const calls = [];
    const orig = sandbox.checkMediaLib;
    sandbox.checkMediaLib = (...args) => {
        calls.push(args.slice());
        return orig(...args);
    };

    // The tick runs EVEN WITHOUT a token: checkMediaLib handles the wait and
    // the pushes report the honest state — a device that never captures a
    // Bearer header must resolve, not hang on an eternal loading row.
    sandbox.__sfAuthBridgeState = 'signed-in';
    sandbox.__sfLibSelfStartTick();
    assert.equal(calls.length, 1, 'self-start runs even without a token');
    assert.equal(calls[0][0], true, 'forced self-start');

    sandbox.spotAuthToken = 'Bearer tok.value';
    sandbox.__sfLibSelfStartTick();
    assert.equal(calls.length, 1, 'bounded retry rate (throttled)');

    // Timed retry: the throttle lets another attempt through later.
    await new Promise((resolve) => setTimeout(resolve, 10));
    sandbox.__sfLibSelfStartTick = sandbox.__sfLibSelfStartTick;
    sandbox.__sfMediaLibState = 'error';
    sandbox.__sfLibSelfStartTick();
    assert.equal(calls.length, 1, 'still throttled within the window');
});

test('the page polls the native command queue and executes only whitelisted commands', () => {
    const harness = createBridgeVm();
    const { sandbox } = harness;
    assert.equal(typeof sandbox.__sfPollCommandsTick, 'function', 'poll tick exists');
    assert.equal(typeof sandbox.__sfExecCommand, 'function', 'executor exists');

    let evilCalled = 0;
    sandbox.evilFunction = () => { evilCalled += 1; };
    let opened = null;
    sandbox.__sfOpenCollection = (arg) => { opened = String(arg); };
    const libCalls = [];
    sandbox.checkMediaLib = (arg) => { libCalls.push(String(arg)); };

    sandbox.window.AndBridge.pollCommands = () => JSON.stringify({
        ui: 'library',
        cmds: [
            { fn: 'checkMediaLib', arg: '1' },
            { fn: 'evilFunction', arg: 'x' },
            { fn: '__sfOpenCollection', arg: 'spotify:playlist:abc' },
            { fn: 'eval', arg: 'alert(1)' }
        ]
    });

    sandbox.__sfPollCommandsTick();

    assert.equal(libCalls.length, 1, 'whitelisted command executed');
    assert.equal(opened, 'spotify:playlist:abc', 'collection opened through the queue');
    assert.equal(evilCalled, 0, 'non-whitelisted command NEVER executes');

    // Malformed payloads never throw nor execute anything.
    sandbox.window.AndBridge.pollCommands = () => '{"cmds":[{"fn":"__proto__","arg":"x"}]}';
    sandbox.__sfPollCommandsTick();
    assert.equal(evilCalled, 0, 'prototype tricks refused');
});

test('the token is also captured from XMLHttpRequest calls (fetch-only hook was not enough)', () => {
    const vm = require('node:vm');
    const src = read('assets/spotify_bridge.js');

    // Extract the capture snippet between its comment and the fetch override.
    const snipStart = src.indexOf('// Token capture parity');
    assert.ok(snipStart !== -1, 'capture snippet present');
    const snipEnd = src.indexOf('window.fetch = async function', snipStart);
    assert.ok(snipEnd > snipStart, 'snippet bounded by the fetch override');
    const snippet = src.slice(snipStart, snipEnd);

    class FakeXhr {
        constructor() { this.headers = {}; }
        open() {}
        setRequestHeader(name, value) { this.headers[String(name).toLowerCase()] = String(value); }
        send() {}
    }
    const calls = [];
    const win = {
        XMLHttpRequest: FakeXhr,
        localStorage: { getItem: () => null, setItem: () => {} },
        checkMediaLib: () => calls.push(true)
    };
    vm.runInNewContext(snippet, { window: win, XMLHttpRequest: FakeXhr, localStorage: win.localStorage });

    assert.equal(win.__sfXhrAuthHooked, true, 'capture installed');

    const xhr = new FakeXhr();
    xhr.setRequestHeader('Authorization', 'Bearer secret.token.value');
    assert.equal(win.spotAuthToken, 'Bearer secret.token.value', 'token captured from XHR');
    assert.equal(calls.length, 1, 'library fetch triggered');

    xhr.setRequestHeader('X-Other', 'nope');
    assert.equal(calls.length, 1, 'other headers ignored');
    assert.equal(win.spotAuthToken, 'Bearer secret.token.value', 'token unchanged by other headers');

    // The real bridge wires the same hook at boot.
    assert.ok(src.includes('__sfXhrAuthHooked'), 'installed once at boot');
});


// ---------------------------------------------------------------------------
// 6. Response-shape tolerance: the undocumented libraryV3 payload has moved
//    between "items" and "edges[].node" and between wrapper depths. A real
//    library must still be read; a response with rows but no recognizable
//    media is a retryable parse-gap error, NEVER "Aucune playlist".
// ---------------------------------------------------------------------------

test('a library payload using edges[].node is read like items[]', async () => {
    const edgePage = {
        status: 200,
        body: {
            data: {
                me: {
                    libraryV3: {
                        edges: [
                            { node: playlistItem('Électro été', 'spotify:playlist:edge1').item },
                            { node: playlistItem('Rock classique', 'spotify:playlist:edge2').item }
                        ]
                    }
                }
            }
        }
    };
    const { sandbox } = createBridgeVm([edgePage]);
    sandbox.spotAuthToken = 'Bearer secret.value.here';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'ready');
    assert.equal(sandbox.mediaLib.playlists.length, 2);
    assert.equal(sandbox.mediaLib.playlists[0].name, 'Électro été');
});

test('items wrapped at the itemV2 depth are unwrapped and counted', async () => {
    const { sandbox } = createBridgeVm([libraryPage([
        {
            itemV2: {
                data: {
                    __typename: 'Playlist',
                    uri: 'spotify:playlist:v2wrap',
                    name: 'Playlist profonde',
                    images: { items: [{ sources: [{ url: 'https://i.scdn.co/image/v2w' }] }] }
                }
            }
        }
    ])]);
    sandbox.spotAuthToken = 'Bearer secret.value.here';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'ready');
    assert.equal(sandbox.mediaLib.playlists.length, 1);
    assert.equal(sandbox.mediaLib.playlists[0].id, 'spotify:playlist:v2wrap');
});

test('rows that hold no recognizable media are a parse-gap error, never an empty library', async () => {
    const { sandbox } = createBridgeVm([libraryPage([
        { addedAt: '2024-01-01' },
        { somethingElse: true }
    ])]);
    sandbox.spotAuthToken = 'Bearer secret.value.here';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'error');
    assert.notEqual(sandbox.__sfMediaLibState, 'empty');
    assert.equal(sandbox.mediaLib, undefined, 'no fake empty library is published');
});

test('a truly empty edges list is a confirmed empty account, not an error', async () => {
    const emptyEdges = {
        status: 200,
        body: { data: { me: { libraryV3: { edges: [] } } } }
    };
    const { sandbox } = createBridgeVm([emptyEdges]);
    sandbox.spotAuthToken = 'Bearer secret.value.here';

    await sandbox.checkMediaLib();
    assert.equal(sandbox.__sfMediaLibState, 'empty');
    assert.equal(sandbox.mediaLib.playlists.length, 0);
});

// ---------------------------------------------------------------------------
// 7. The eternal-loading defects: every queued request is answered on EVERY
//    terminal path, exactly once, with an honest row (login/error/empty/data).
//    Reproduces the device defect "Chargement des playlists…" forever.
// ---------------------------------------------------------------------------

test('a library request without a session answers with a login row: never eternal loading, never fake empty', async () => {
    const harness = createBridgeVm();
    const { sandbox, timers, uiCalls } = harness;

    const pending = sandbox.fetchMediaItems('playlists');
    await flushTimers(timers);
    await pending;

    const rows = uiCalls
        .filter((call) => call.screen === 'media:playlists')
        .map((call) => JSON.parse(call.data));
    assert.ok(rows.length >= 1, 'a status row is delivered');
    const last = rows[rows.length - 1][0];
    assert.equal(last.title, 'Connecte-toi à Spotify');
    assert.equal(last.actionUri, 'spotify:lib:login');
    assert.equal(last.kind, 'login');
    // The defective behavior sent a "Chargement des playlists…" row here and
    // nothing else ever followed it on the device.
    for (const group of rows) {
        for (const row of group) {
            assert.notEqual(row.title, 'Chargement des playlists…', 'no eternal loading row');
            assert.notEqual(row.title, 'Aucune playlist dans ce compte', 'no fake empty row');
        }
    }
});

test('a failure answers requests queued by other callers (never orphaned in pendingMediaRequests)', async () => {
    const harness = createBridgeVm([{ networkError: true }]);
    const { sandbox, timers, uiCalls } = harness;
    sandbox.spotAuthToken = 'Bearer test-token';
    // A request queued by a caller that cannot answer itself (MediaBrowser).
    sandbox.pendingMediaRequests.add('albums');

    const pending = sandbox.checkMediaLib();
    await flushTimers(timers);
    await pending;

    assert.equal(sandbox.pendingMediaRequests.size, 0, 'the queue is drained');
    const rows = uiCalls
        .filter((call) => call.screen === 'media:albums')
        .map((call) => JSON.parse(call.data)[0]);
    assert.equal(rows.length, 1, 'exactly one honest status row');
    assert.equal(rows[0].title, 'Impossible de charger les playlists');
    assert.equal(rows[0].kind, 'error');
    assert.equal(rows[0].uri, 'spotify:retry:media:albums', 'a real retry sentinel');
});

test('the login state answers queued requests too (retry-exhausted is not the only terminal)', async () => {
    const harness = createBridgeVm();
    const { sandbox, timers, uiCalls } = harness;
    sandbox.pendingMediaRequests.add('playlists');

    const pending = sandbox.checkMediaLib();
    await flushTimers(timers);
    await pending;

    assert.equal(sandbox.pendingMediaRequests.size, 0, 'the queue is drained');
    const rows = uiCalls
        .filter((call) => call.screen === 'media:playlists')
        .map((call) => JSON.parse(call.data)[0]);
    assert.ok(rows.some((row) => row.title === 'Connecte-toi à Spotify'), 'login row delivered');
    assert.ok(rows.every((row) => row.title !== 'Chargement des playlists…'), 'never left loading');
});

test('the library push producer emits exactly what NativeLibCache.accept parses (integration contract)', async () => {
    const harness = createBridgeVm([
        libraryPage([
            playlistItem('Électro été', 'spotify:playlist:cont1'),
            playlistItem('Rock classique', 'spotify:playlist:cont2')
        ])
    ]);
    const { sandbox, batches } = harness;
    sandbox.spotAuthToken = 'Bearer test-token';

    await sandbox.checkMediaLib();
    const pushed = batches.map((raw) => JSON.parse(raw));
    assert.ok(pushed.length >= 4, 'one terminal batch per category');
    for (const batch of pushed) {
        assert.ok(['playlists', 'albums', 'artists', 'podcasts'].includes(batch.cat), 'cat is a known category');
        assert.ok(Array.isArray(batch.items), 'items is an array');
        assert.ok(Number.isInteger(batch.i) && Number.isInteger(batch.n) && batch.n >= 1, 'pagination envelope');
        assert.ok(Number.isInteger(batch.epoch), 'epoch present');
        assert.ok(batch.last === (batch.i + 1 >= batch.n), 'last flag matches the envelope');
        for (const item of batch.items) {
            assert.ok('title' in item && 'subtitle' in item && 'uri' in item && 'image' in item,
                'every item carries the fields NativeLibCache.appendItem reads');
        }
    }
    // The smali consumer really parses those keys (producer/consumer stay in
    // sync even though they live on opposite sides of the bridge).
    const cache = read('smali/com/melodix/music/NativeLibCache.smali');
    for (const key of ['"cat"', '"items"', '"i"', '"n"', '"epoch"', '"last"']) {
        assert.ok(cache.includes(key), `NativeLibCache.accept reads ${key}`);
    }
    for (const field of ['"title"', '"subtitle"', '"uri"', '"image"']) {
        assert.ok(cache.includes(field), `NativeLibCache.appendItem reads ${field}`);
    }
});
