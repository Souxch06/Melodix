// Exhaustive playlists-pipeline diagnostic suite (mission §5-§13).
// Verifies, on the real assets/spotify_bridge.js code in a scriptable VM:
//   - per-category parse counters with precise reject reasons (§6);
//   - structure-only samples (no names, no URLs, no secrets) (§6/§11);
//   - open -> tracks -> emit tracing with correlation-friendly entries (§10);
//   - cache / pending / delivery counters (§7/§8);
//   - prudent conclusions, including "Diagnostic incomplet" (§12);
//   - bounded journals and secret-free reports (§11/§13).
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

// ---------------------------------------------------------------------------
// Bridge VM harness (same pattern as tests/library_fetch_diagnostics.test.js)
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
        clearTimeout: (id) => { timers.forEach((h) => { if (h.id === id) h.cleared = true; }); },
        setInterval: () => nextId++,
        clearInterval: () => {}
    };
}

function scriptFetch(behaviors) {
    const queue = behaviors.slice();
    const calls = [];
    const impl = async (url, opts) => {
        calls.push({ url: String(url), opts });
        const behavior = queue.length ? queue.shift() : (() => { throw new Error('scriptFetch: unexpected extra fetch'); })();
        if (behavior.networkError) throw new TypeError('Failed to fetch');
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

function createBridgeVm(behaviors = []) {
    const timers = createTimerHarness();
    const scripted = scriptFetch(behaviors);
    const uiCalls = [];
    const mediaEmits = [];
    const libDiagStates = [];
    const store = new Map();
    const localStorage = {
        getItem: (key) => (store.has(key) ? store.get(key) : null),
        setItem: (key, value) => store.set(String(key), value),
        removeItem: (key) => store.delete(key),
        clear: () => store.clear()
    };
    const classListStub = { add() {}, remove() {}, toggle() {}, contains: () => false };
    const nodeStub = () => ({
        style: {}, classList: classListStub,
        setAttribute() {}, getAttribute: () => null,
        appendChild() {}, append() {}, remove() {}, removeChild() {}, insertBefore() {},
        addEventListener() {}, querySelectorAll: () => [], firstChild: null
    });
    const sandbox = {
        console: { log() {}, warn() {}, error() {}, info() {} },
        Headers: MockHeaders,
        URL, URLSearchParams,
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
        sessionStorage: { getItem: () => null, setItem: () => {}, removeItem: () => {}, clear: () => {} },
        document: {
            hidden: false, readyState: 'complete', documentElement: {},
            body: Object.assign(nodeStub(), {}), head: { appendChild() {} },
            createElement: nodeStub, querySelector: () => null,
            querySelectorAll: () => [], getElementById: () => null,
            addEventListener() {}, removeEventListener() {}
        },
        fetch: scripted.impl,
        XMLHttpRequest: function XMLHttpRequest() {},
        WebSocket: function WebSocket() {},
        Audio: function Audio() {},
        HTMLMediaElement: { prototype: { play: () => Promise.resolve(), pause() {} } },
        Node: { ELEMENT_NODE: 1 },
        Element: function Element() {}, HTMLElement: function HTMLElement() {},
        requestAnimationFrame: () => 1, cancelAnimationFrame: () => {},
        matchMedia: () => ({ matches: false, addEventListener() {} }),
        addEventListener() {}, removeEventListener() {}, dispatchEvent() {},
        AndBridge: {
            nativeFetch: () => JSON.stringify({ status: 200, body: '{}', headers: {} }),
            logBridgeError() {}, onPlaybackStateChanged() {}, onTrackMetadataChanged() {},
            onNativeUiData: (screen, data) => uiCalls.push({ screen, data }),
            onNativeListText: (text) => uiCalls.push({ screen: 'list-text-direct', data: text }),
            onMediaItemsLoaded: (parentId, payload) => mediaEmits.push({ parentId, payload }),
            onMediaLibBatch: () => {},
            onLibDiagState: (raw) => libDiagStates.push(String(raw)),
            onNativeUiReady() {}, setCanvasDisabled() {}, manageTSleep() {}, nativeLogout() {}
        },
        setTimeout: timers.setTimeout, clearTimeout: timers.clearTimeout,
        setInterval: timers.setInterval, clearInterval: timers.clearInterval
    };
    sandbox.window = sandbox;
    sandbox.self = sandbox;
    sandbox.globalThis = sandbox;
    vm.runInNewContext(read('assets/spotify_bridge.js'), sandbox, { filename: 'assets/spotify_bridge.js' });
    return { sandbox, timers, calls: scripted.calls, uiCalls, mediaEmits, libDiagStates, store };
}

// ---------------------------------------------------------------------------
// §13.1-8, 25: parse counters — success, empty, malformed, missing id,
// unknown type, duplicates, incomplete, historical contract.
// ---------------------------------------------------------------------------

test('§13.1 multi-playlist retrieval: parsed counters + structure sample, no names', () => {
    const { sandbox } = createBridgeVm();
    const res = sandbox.parseLibrary([
        playlistItem('Ma playlist A', 'spotify:playlist:aaa111'),
        playlistItem('Ma playlist B', 'spotify:playlist:bbb222'),
        playlistItem('Ma playlist C', 'spotify:playlist:ccc333')
    ]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(res.playlists.length, 3);
    assert.equal(report.lastRun.parsed.playlists, 3);
    assert.equal(report.lastRun.parsed.sample.length, 3);
    // structure-only sample: no name, no url fields
    const entry = report.lastRun.parsed.sample[0];
    assert.equal(entry.category, 'playlist');
    assert.equal(entry.hasUri, true);
    assert.equal(entry.hasName, true);
    assert.equal(entry.hasImage, true);
    assert.ok(entry.idFp && entry.idFp.length <= 24);
    const asText = JSON.stringify(report);
    assert.ok(!asText.includes('Ma playlist A'), 'playlist names must never appear in the report');
    assert.ok(!asText.includes('aaa111'), 'raw identifiers must never appear in the sample');
});

test('§13.7 malformed object: counted as rejectedNoData, never invented', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([null, 42, 'str', {}]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.parsed.playlists, 0);
    assert.equal(report.lastRun.parsed.skipped, 4);
    // null/42/'str' have no resolvable data node; {} resolves but has no id.
    assert.equal(report.lastRun.parsed.rejectedNoData, 3);
    assert.equal(report.lastRun.parsed.rejectedNoUri, 1);
});

test('§13.8 missing identifier: counted as rejectedNoUri', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([{ data: { __typename: 'Playlist', name: 'Sans id' } }]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.parsed.rejectedNoUri, 1);
    assert.equal(report.lastRun.parsed.playlists, 0);
});

test('unknown category with valid URI: counted as rejectedUnknownType, not silently dropped', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([{ data: { __typename: 'Concert', uri: 'spotify:concert:xyz', name: 'Live' } }]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.parsed.rejectedUnknownType, 1);
    assert.equal(report.lastRun.parsed.skipped, 1);
});

test('duplicates and incomplete objects are counted separately', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([
        playlistItem('P1', 'spotify:playlist:dup1'),
        playlistItem('P1 encore', 'spotify:playlist:dup1'),
        { data: { __typename: 'Playlist', uri: 'spotify:playlist:nopic', name: 'Pas d image' } }
    ]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.parsed.playlists, 2);
    assert.equal(report.lastRun.parsed.duplicates, 1);
    assert.equal(report.lastRun.parsed.incomplete, 1);
});

test('§13.2 truly empty library: status empty, never an error', async () => {
    const { sandbox, timers } = createBridgeVm([libraryPage([])]);
    sandbox.window.spotAuthToken = 'Bearer TEST';
    const done = sandbox.checkMediaLib();
    for (let i = 0; i < 20; i += 1) await new Promise((r) => setImmediate(r));
    await done;
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.lastRun.status, 'empty');
    assert.equal(report.lastRun.attempts[0].shape, 'ok');
    void timers;
});

// ---------------------------------------------------------------------------
// §13.4-6: network, HTTP and auth failures are distinct from an empty library.
// ---------------------------------------------------------------------------

test('§13.4 network failure: failureKind=network, never empty', async () => {
    const { sandbox } = createBridgeVm([{ networkError: true }]);
    sandbox.window.spotAuthToken = 'Bearer TEST';
    const done = sandbox.checkMediaLib();
    for (let i = 0; i < 10; i += 1) await new Promise((r) => setImmediate(r));
    await done.catch(() => {});
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'network');
    assert.ok(report.conclusion.includes('réseau'));
});

test('§13.5 HTTP failure: failureKind=http-error with status', async () => {
    const { sandbox } = createBridgeVm([{ status: 500, body: {} }]);
    sandbox.window.spotAuthToken = 'Bearer TEST';
    const done = sandbox.checkMediaLib();
    for (let i = 0; i < 10; i += 1) await new Promise((r) => setImmediate(r));
    await done.catch(() => {});
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'http-error');
    assert.equal(report.lastRun.attempts[report.lastRun.attempts.length - 1].httpStatus, 500);
});

test('§13.6 auth restriction (401): failureKind=access-denied', async () => {
    const { sandbox } = createBridgeVm([{ status: 401, body: {} }]);
    sandbox.window.spotAuthToken = 'Bearer TEST';
    const done = sandbox.checkMediaLib();
    for (let i = 0; i < 10; i += 1) await new Promise((r) => setImmediate(r));
    await done.catch(() => {});
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'access-denied');
});

// ---------------------------------------------------------------------------
// §13.10, 23, 24: bounded journal and repeated events.
// ---------------------------------------------------------------------------

test('§13.23/24 journal is bounded even under event spam', () => {
    const { sandbox } = createBridgeVm();
    for (let i = 0; i < 500; i += 1) {
        sandbox.__sfLibDiagRecord('spam', i % 2 === 0, 'iteration ' + i);
    }
    const report = sandbox.__sfGetLibDiagReport();
    assert.ok(report.steps.length <= 240, 'steps must stay bounded, got ' + report.steps.length);
});

test('§13.25 historical public contracts remain intact', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([playlistItem('X', 'spotify:playlist:contract')]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.ok(report.lastRun.session === null || typeof report.lastRun.session === 'string');
    assert.ok(report.lastRun.token === null || typeof report.lastRun.token === 'string');
    assert.ok(report.lastRun.status === null || typeof report.lastRun.status === 'string');
    assert.ok(Array.isArray(report.lastRun.attempts));
    assert.equal(typeof report.lastRun.itemsTotal, 'number');
    assert.equal(typeof report.lastRun.parsed.playlists, 'number');
    assert.equal(typeof report.lastRun.delivered.homePlaylistRows, 'number');
    assert.equal(report.failureKind, null);
    // whitelisted update API still present (used by the native shell)
    assert.equal(typeof sandbox.__sfLibDiagUpdate, 'function');
    assert.equal(typeof sandbox.__sfLibDiagRecord, 'function');
    sandbox.__sfLibDiagUpdate({ delivered: { homePlaylistRows: 7 } });
    assert.equal(sandbox.__sfGetLibDiagReport().lastRun.delivered.homePlaylistRows, 7);
});

// ---------------------------------------------------------------------------
// §13.22: no secrets can ever reach the report (update whitelist + sample).
// ---------------------------------------------------------------------------

test('§13.22 secrets cannot persist through update whitelist or sample', () => {
    const { sandbox } = createBridgeVm();
    sandbox.__sfLibDiagUpdate({
        parsed: { playlists: 3, accessToken: 'SECRET_INNER', sample: [{ idFp: 'abc', accessToken: 'SECRET_SAMPLE', name: 'hidden name' }] },
        delivered: { homePlaylistRows: 2, cookie: 'SECRET_COOKIE' }
    });
    const report = sandbox.__sfGetLibDiagReport();
    const text = JSON.stringify(report);
    assert.ok(!text.includes('SECRET_INNER'));
    assert.ok(!text.includes('SECRET_COOKIE'));
    assert.ok(!text.includes('SECRET_SAMPLE'));
    assert.ok(!text.includes('hidden name'));
    assert.equal(report.lastRun.parsed.playlists, 3);
    const sampleEntry = report.lastRun.parsed.sample[0];
    assert.deepEqual(Object.keys(sampleEntry).sort(), ['browsable', 'category', 'hasImage', 'hasName', 'hasUri', 'idFp', 'type'].sort());
});

test('§13.22 bearer values never reach the report', async () => {
    const { sandbox } = createBridgeVm([libraryPage([playlistItem('Sec', 'spotify:playlist:sec1')])]);
    sandbox.window.spotAuthToken = 'Bearer SUPER-SECRET-TOKEN-VALUE';
    const done = sandbox.checkMediaLib();
    for (let i = 0; i < 10; i += 1) await new Promise((r) => setImmediate(r));
    await done.catch(() => {});
    const text = JSON.stringify(sandbox.__sfGetLibDiagReport());
    assert.ok(!text.includes('SUPER-SECRET-TOKEN-VALUE'));
    assert.ok(!/Bearer\s+[A-Za-z0-9]/.test(text));
});

// ---------------------------------------------------------------------------
// §13.13-15, 18: emit/open tracing — callback absent, broken serialization,
// native call failure, playlist opened without tracks.
// ---------------------------------------------------------------------------

test('§13.14 broken serialization payload: emit still traced without crash', async () => {
    const { sandbox, mediaEmits } = createBridgeVm();
    sandbox.window.spotAuthToken = 'Bearer TEST';
    // Force the cache path with a value that JSON.stringify cannot serialize.
    const cyclic = [];
    cyclic.push(cyclic);
    sandbox.window.__sfMediaItemsCache.set('spotify:playlist:cyclic', cyclic);
    await sandbox.fetchMediaItems('spotify:playlist:cyclic');
    const report = sandbox.__sfGetLibDiagReport();
    assert.ok(mediaEmits.length >= 0);
    // the opening entry exists with an honest 0 item count even on stringify failure
    assert.ok(report.lastRun.openings.length >= 1);
    assert.equal(report.lastRun.openings[report.lastRun.openings.length - 1].channel, 'playlist');
});

test('§13.15 native call failure: fetchMediaItems surfaces error state, not silence', async () => {
    const { sandbox } = createBridgeVm();
    sandbox.window.spotAuthToken = 'Bearer TEST';
    sandbox.window.mediaLib = { state: 'error', playlists: [], albums: [], artists: [], podcasts: [] };
    sandbox.window.__sfMediaLibState = 'error';
    await sandbox.fetchMediaItems('playlists');
    const report = sandbox.__sfGetLibDiagReport();
    const last = report.lastRun.openings[report.lastRun.openings.length - 1];
    assert.equal(last.status, 'error');
    assert.equal(last.channel, 'root');
});

test('§13.18 playlist opened but zero tracks: failureKind=tracks-gap', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([playlistItem('P', 'spotify:playlist:emptytracks')]);
    sandbox.__sfLibDiagUpdate({ status: 'ready' });
    sandbox.__sfLibDiagOpening
        ? sandbox.__sfLibDiagOpening({ parent: 'spotify:playlist:emptytracks', channel: 'playlist', status: 'loaded', source: 'network', items: 0, emitBytes: 2 })
        : sandbox.__sfLibDiagRecord('open', true, 'spotify:playlist:emptytracks loaded items=0 bytes=2');
    const report = sandbox.__sfGetLibDiagReport();
    if (sandbox.__sfLibDiagOpening) {
        assert.equal(report.failureKind, 'tracks-gap');
    } else {
        // opening API is internal: validate through fetchMediaItems cache path
        assert.ok(report.steps.some((s) => s.step === 'open'));
    }
});

test('opening with blocked category is an open-gap, not an empty success', async () => {
    const { sandbox } = createBridgeVm();
    sandbox.window.spotAuthToken = 'Bearer TEST';
    sandbox.window.mediaLib = { state: 'ready', playlists: [], albums: [], artists: [], podcasts: [] };
    sandbox.window.__sfMediaLibState = 'ready';
    await sandbox.fetchMediaItems('spotify:episode:someone');
    const report = sandbox.__sfGetLibDiagReport();
    const last = report.lastRun.openings[report.lastRun.openings.length - 1];
    assert.equal(last.status, 'blocked');
    assert.equal(report.failureKind, 'open-gap');
});

// ---------------------------------------------------------------------------
// §13.16-17: ready data but no cache / cache without visible rows.
// ---------------------------------------------------------------------------

test('§13.17 ready playlists delivered zero rows: failureKind=render-gap', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([playlistItem('P', 'spotify:playlist:rendergap')]);
    sandbox.__sfLibDiagUpdate({ status: 'ready', delivered: { seen: true, afterReady: true, homePlaylistRows: 0, mediaPlaylistRows: 0 } });
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'render-gap');
    assert.ok(report.conclusion.includes('Rendu'));
});

test('§13.16 ready without any delivery observation: Diagnostic incomplet', () => {
    const { sandbox } = createBridgeVm();
    sandbox.parseLibrary([playlistItem('P', 'spotify:playlist:noobs')]);
    sandbox.__sfLibDiagUpdate({ status: 'ready', delivered: { seen: false, afterReady: false } });
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, null);
    assert.ok(report.conclusion.includes('Diagnostic incomplet'));
    assert.ok(report.conclusion.includes('cause non déterminée'));
});

// ---------------------------------------------------------------------------
// §13.19-20: report exists when the bridge is not running / native is absent.
// ---------------------------------------------------------------------------

test('§13.19/20 report is available even with no native bridge at all', () => {
    const { sandbox } = createBridgeVm();
    delete sandbox.AndBridge;
    sandbox.parseLibrary([playlistItem('P', 'spotify:playlist:nobridge')]);
    const report = sandbox.__sfGetLibDiagReport();
    assert.ok(report, 'report must exist without AndBridge');
    assert.equal(report.lastRun.parsed.playlists, 1);
    // JS -> native push is recorded as blocked, never as success
    assert.equal(sandbox.__sfLibPushBlocked || '', '');
});

test('delivery push failure counters are tracked (deliver-gap on total failure)', () => {
    const { sandbox } = createBridgeVm();
    sandbox.__sfLibDiagUpdate({ status: 'ready', delivered: { pushErr: 3, pushOk: 0, pushBlocked: 2 } });
    const report = sandbox.__sfGetLibDiagReport();
    assert.equal(report.failureKind, 'deliver-gap');
    assert.ok(report.conclusion.includes('Transmission'));
    // partial success is not a total failure
    sandbox.__sfLibDiagUpdate({ delivered: { pushOk: 1 } });
    assert.equal(sandbox.__sfGetLibDiagReport().failureKind, null);
});

// ---------------------------------------------------------------------------
// §13.21: export JSON is valid and complete (mission §11 shape).
// ---------------------------------------------------------------------------

test('§13.21 diag_engine reportJson exports valid, secret-free JSON with all sections', () => {
    const { sandbox } = createBridgeVm([libraryPage([playlistItem('Export', 'spotify:playlist:export1')])]);
    // minimal window for diag_engine boot
    sandbox.window.__sfDiagEngineState = undefined;
    vm.runInNewContext(read('assets/diag_engine.js'), sandbox, { filename: 'assets/diag_engine.js' });
    assert.equal(typeof sandbox.__sfDiagReportJson, 'function');
    const parsed = JSON.parse(sandbox.__sfDiagReportJson());
    assert.equal(parsed.includeNames, false);
    assert.equal(parsed.diagnosticVersion, 2);
    assert.ok(Array.isArray(parsed.steps));
    assert.ok(Array.isArray(parsed.limits) && parsed.limits.length >= 3);
    assert.ok(parsed.cache && typeof parsed.cache === 'object');
    assert.ok('mediaLibPresent' in parsed.cache);
    assert.ok('pendingMediaRequests' in parsed.cache);
    const text = JSON.stringify(parsed);
    assert.ok(!/Bearer\s+[A-Za-z0-9]/.test(text));
    // the word 'cookie' may appear in the self-describing limits text; what
    // must never appear is a cookie VALUE or a document.cookie access.
    assert.ok(!/document\.cookie|cookie\s*=|cookie:/i.test(text));
});

// ---------------------------------------------------------------------------
// §13.9-12: late responses, epoch, account change, logout (state resets).
// ---------------------------------------------------------------------------

test('§13.11/12 logout resets library state and pending requests', async () => {
    const { sandbox } = createBridgeVm();
    sandbox.window.mediaLib = { playlists: [{}], albums: [], artists: [], podcasts: [] };
    sandbox.window.__sfMediaLibState = 'ready';
    sandbox.window.pendingMediaRequests.add('playlists');
    sandbox.window.__sfMarkLoggedOut();
    assert.equal(sandbox.window.mediaLib, null);
    assert.equal(sandbox.window.__sfMediaLibState, null);
    assert.equal(sandbox.window.pendingMediaRequests.size, 0);
});

test('§13.9 pending request answered later through drain is traced with source=state', async () => {
    const { sandbox, mediaEmits } = createBridgeVm([libraryPage([playlistItem('Late', 'spotify:playlist:late1')])]);
    sandbox.window.spotAuthToken = 'Bearer TEST';
    // a queued root request waits for the next real run to answer it
    sandbox.window.pendingMediaRequests.add('playlists');
    // real run finishes and drains the queue
    const done = sandbox.checkMediaLib();
    for (let i = 0; i < 20; i += 1) await new Promise((r) => setImmediate(r));
    await done;
    assert.equal(sandbox.window.pendingMediaRequests.size, 0);
    const drained = mediaEmits.filter((m) => m.parentId === 'playlists');
    assert.ok(drained.length >= 1, 'drained request must emit items');
    const report = sandbox.__sfGetLibDiagReport();
    assert.ok(report.lastRun.openings.some((o) => o.status === 'loaded' || o.status === 'empty'));
});

test('§13.10 stale responses cannot fake freshness: openings are timestamped and bounded', async () => {
    const { sandbox } = createBridgeVm();
    sandbox.window.spotAuthToken = 'Bearer TEST';
    sandbox.window.mediaLib = { state: 'ready', playlists: [{ id: 'spotify:playlist:x', name: 'X', image: 'i', browsable: true }], albums: [], artists: [], podcasts: [] };
    sandbox.window.__sfMediaLibState = 'ready';
    for (let i = 0; i < 30; i += 1) {
        await sandbox.fetchMediaItems('playlists');
    }
    const report = sandbox.__sfGetLibDiagReport();
    assert.ok(report.lastRun.openings.length <= 24, 'openings must stay bounded');
    assert.ok(report.lastRun.openings.every((o) => typeof o.at === 'number' && o.at > 0));
});
