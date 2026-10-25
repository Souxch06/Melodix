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
    return { sandbox, timers, calls: scripted.calls, uiCalls, store };
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
