// Behaviour tests for the Spotify library bridge path.
//
// The bridge is the real IIFE in a vm sandbox. Fetch responses are deterministic
// fixtures only: they test parsing, proof state, and diagnostics, not a real
// Spotify login or account.

'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const BRIDGE = path.join(repo, 'scripts/spotify_bridge.source.js');
const REQUEST_TIMEOUT_MS = 15000;

function fakeElement() {
    return {
        addEventListener() {}, removeEventListener() {}, appendChild() {}, insertBefore() {},
        querySelector() { return null; }, querySelectorAll() { return []; },
        classList: { add() {}, remove() {}, toggle() {}, contains() { return false; } },
        style: {}, setAttribute() {}, getAttribute() { return null; }, remove() {},
        closest() { return null; }, getBoundingClientRect() { return { width: 0, height: 0, top: 0, left: 0 }; },
        innerText: '', textContent: '', href: '', tagName: 'DIV', dataset: {}
    };
}

// Loads the real bridge into its own sandbox. `fetchImpl` replaces page fetch
// captured as oriFetch. Long production deadlines are shortened only in tests.
function loadBridge({ fetchImpl, profileSignal = false } = {}) {
    const listeners = {};
    const dispatchedEvents = [];
    const eventSnapshots = [];
    const diagnostics = [];
    const profile = fakeElement();
    const win = {
        addEventListener(type, fn) { (listeners[type] = listeners[type] || []).push(fn); },
        removeEventListener() {},
        dispatchEvent(event) {
            const type = String(event && event.type || '');
            dispatchedEvents.push(type);
            eventSnapshots.push({
                type,
                status: String(this.__sfMediaLibStatus || ''),
                rawItemCount: Number(this.__sfMediaLibRawItemCount || 0)
            });
            return true;
        },
        Event: class { constructor(type) { this.type = String(type); } },
        setTimeout: (fn, delay = 0) => setTimeout(fn, Number(delay) >= REQUEST_TIMEOUT_MS ? 20 : Number(delay) || 0),
        clearTimeout,
        setInterval: () => 0,
        clearInterval() {},
        requestAnimationFrame: (fn) => setTimeout(fn, 0),
        cancelAnimationFrame() {},
        AbortController,
        location: {
            hostname: 'open.spotify.com', href: 'https://open.spotify.com/',
            pathname: '/', origin: 'https://open.spotify.com', search: '',
            reload() {}, assign() {}, replace() {}
        },
        navigator: { userAgent: 'Mozilla/5.0', languages: ['fr'], language: 'fr' },
        localStorage: { getItem: () => null, setItem() {}, removeItem() {} },
        sessionStorage: { getItem: () => null, setItem() {}, removeItem() {} },
        document: {
            addEventListener(type, fn) { (listeners[type] = listeners[type] || []).push(fn); },
            readyState: 'complete', createElement: fakeElement, documentElement: fakeElement(),
            body: fakeElement(), head: fakeElement(),
            querySelector(selector) {
                return profileSignal && /user-widget-link|main-userWidget-box/.test(String(selector))
                    ? profile : null;
            },
            querySelectorAll: () => [], getElementById: () => null,
            title: 'Spotify'
        },
        console: { log() {}, warn() {}, error() {}, info() {}, debug() {} },
        fetch: fetchImpl || (async () => libraryPage([])),
        MutationObserver: class { observe() {} disconnect() {} },
        matchMedia: () => ({ matches: false, addEventListener() {}, addListener() {} }),
        getComputedStyle: () => ({ getPropertyValue: () => '' }),
        performance: { now: () => 0 },
        alert() {}, open() { return null; },
        AndBridge: { logDiagEvent: (line) => diagnostics.push(String(line)) }
    };
    win.window = win;
    win.document.defaultView = win;
    const context = vm.createContext(win);
    vm.runInContext(fs.readFileSync(BRIDGE, 'utf8'), context, { timeout: 20000 });
    win.__testDispatchedEvents = dispatchedEvents;
    win.__testEventSnapshots = eventSnapshots;
    win.__testDiagnostics = diagnostics;
    return win;
}

// One libraryV3 item in the web player's shape. Names/URIs below are synthetic
// fixture values and are never included in the diagnostic event assertions.
function libraryItem({ uri, name, image, typename = 'Playlist' }) {
    return { item: { data: {
        __typename: typename,
        uri,
        name,
        images: image ? { items: [{ sources: [{ url: image, width: 300 }] }] } : null
    } } };
}

function jsonResponse(status, body, mime = 'application/json; charset=utf-8') {
    return {
        ok: status >= 200 && status < 300,
        status,
        headers: { get: (name) => String(name).toLowerCase() === 'content-type' ? mime : null },
        json: async () => body
    };
}

function libraryPage(items) {
    return jsonResponse(200, { data: { me: { libraryV3: { items } } } });
}

function libraryDiagnostics(win) {
    return win.__testDiagnostics.filter((line) => line.startsWith('library-fetch '));
}

function finalLibraryDiagnostic(win) {
    return libraryDiagnostics(win).at(-1) || '';
}

// A successful fixture verifies cookie inclusion, API shape, transformation,
// and count-only telemetry. It does not demonstrate a real Spotify session.
test('checkMediaLib transforms a valid library response and sends cookies without inventing a token', async () => {
    const calls = [];
    const win = loadBridge({
        fetchImpl: async (url, init) => {
            calls.push({ url, init });
            return libraryPage([
                libraryItem({ uri: 'spotify:playlist:fixture-a', name: 'Fixture Road trip' }),
                libraryItem({ uri: 'spotify:playlist:fixture-b', name: 'Fixture Focus' })
            ]);
        }
    });

    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibError, '');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.equal(win.__sfMediaLibRawItemCount, 2);
    assert.equal(win.__testDispatchedEvents.filter((type) => type === 'sf-media-library-state-changed').length, 2);
    assert.deepEqual(
        win.__testEventSnapshots.filter((event) => event.type === 'sf-media-library-state-changed')
            .map(({ status, rawItemCount }) => [status, rawItemCount]),
        [['loading', 0], ['ready', 2]]
    );
    assert.deepEqual(Array.from(win.mediaLib.playlists, (item) => item.name),
        ['Fixture Road trip', 'Fixture Focus']);
    assert.equal(calls.length, 1);
    assert.equal(calls[0].init.credentials, 'include');
    assert.ok(!/authorization/i.test(Object.keys(calls[0].init.headers || {}).join(',')));
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=settle http=200 mime=json duration=[0-9]+ error=none received=2 transformed=2 proof=valid page=none$/);
    assert.doesNotMatch(libraryDiagnostics(win).join('\n'),
        /Fixture|spotify:|Cookie|Authorization|Road trip|Focus/i,
        'diagnostics contain only bounded state/count fields, never fixture account data or credentials');
});

test('loading clears an earlier raw count before the response settles', async () => {
    let resolveResponse;
    let fetchStarted = false;
    const win = loadBridge({
        fetchImpl: async () => {
            fetchStarted = true;
            return new Promise((resolve) => { resolveResponse = resolve; });
        }
    });
    win.__sfMediaLibRawItemCount = 17;

    const pending = win.checkMediaLib(true);
    for (let attempt = 0; attempt < 10 && !fetchStarted; attempt += 1) await Promise.resolve();

    assert.equal(fetchStarted, true);
    assert.equal(win.__sfMediaLibStatus, 'loading');
    assert.equal(win.__sfMediaLibRawItemCount, 0);
    assert.deepEqual(
        win.__testEventSnapshots.filter((event) => event.type === 'sf-media-library-state-changed')
            .map(({ status, rawItemCount }) => [status, rawItemCount]),
        [['loading', 0]]
    );

    resolveResponse(libraryPage([libraryItem({ uri: 'spotify:playlist:test-fixture', name: 'Fixture item' })]));
    await pending;
    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibRawItemCount, 1);
    assert.deepEqual(
        win.__testEventSnapshots.filter((event) => event.type === 'sf-media-library-state-changed')
            .map(({ status, rawItemCount }) => [status, rawItemCount]),
        [['loading', 0], ['ready', 1]]
    );
});

test('the library paginates multiple playlist pages and deduplicates entries', async () => {
    const offsets = [];
    const firstPage = Array.from({ length: 50 }, (_v, i) =>
        libraryItem({ uri: `spotify:playlist:fixture-${i}`, name: `Fixture playlist ${i}` }));
    const secondPage = [
        libraryItem({ uri: 'spotify:playlist:fixture-49', name: 'Fixture playlist 49' }),
        libraryItem({ uri: 'spotify:playlist:fixture-50', name: 'Fixture playlist 50' })
    ];
    const win = loadBridge({
        fetchImpl: async (_url, init) => {
            offsets.push(JSON.parse(init.body).variables.offset);
            return libraryPage(offsets.length === 1 ? firstPage : secondPage);
        }
    });

    await win.checkMediaLib(true);

    assert.deepEqual(offsets, [0, 50]);
    assert.equal(win.mediaLib.playlists.length, 51);
    const ids = Array.from(win.mediaLib.playlists, (item) => item.id);
    assert.equal(new Set(ids).size, ids.length);
    assert.match(finalLibraryDiagnostic(win), /http=200 mime=json .*received=52 transformed=51 proof=valid page=none$/);
});

test('an absent session represented by HTTP 401 remains an unknown-cause refusal, not a fabricated login diagnosis', async () => {
    // Deterministic no-session fixture only; this is not a real Spotify login test.
    const win = loadBridge({ fetchImpl: async () => jsonResponse(401, {}) });
    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'http-401');
    assert.equal(win.mediaLib, undefined);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=response http=401 mime=json duration=[0-9]+ error=http-401 received=0 transformed=0 proof=invalid page=none$/);
});

test('HTTP refusals and server responses retain their status-specific errors', async () => {
    const cases = [
        [403, 'http-403', 'http-403', 'unknown'],
        [429, 'http-429', 'http-other', 'unknown'],
        [500, 'http-500', 'http-other', 'unknown']
    ];
    for (const [status, expectedError, diagnosticError, proof] of cases) {
        const win = loadBridge({ fetchImpl: async () => jsonResponse(status, {}) });
        await win.checkMediaLib(true);
        assert.equal(win.__sfMediaLibStatus, 'error');
        assert.equal(win.__sfMediaLibError, expectedError);
        assert.equal(win.mediaLib, undefined);
        assert.equal(win.__sfMediaLibSessionProofKnown, false,
            'non-401 HTTP errors do not assert that the Spotify session ended');
        assert.match(finalLibraryDiagnostic(win), new RegExp(
            `^library-fetch phase=response http=${status} mime=json duration=[0-9]+ error=${diagnosticError} received=0 transformed=0 proof=${proof} page=none$`));
    }
});

test('a 401 invalidates an earlier private-response proof without deleting cached rows', async () => {
    const win = loadBridge({ fetchImpl: async () => jsonResponse(401, {}) });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    win.mediaLib = { playlists: [{ id: 'spotify:playlist:fixture-stale', name: 'Fixture stale data' }] };
    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibError, 'http-401');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.mediaLib.playlists.length, 1,
        'cached values are preserved but the shell must not use them as proof or fresh rows');
});

test('network failure, invalid JSON and HTML response are distinguished', async () => {
    const network = loadBridge({ fetchImpl: async () => { throw new TypeError('offline'); } });
    await network.checkMediaLib(true);
    assert.equal(network.__sfMediaLibError, 'network-error');
    assert.match(finalLibraryDiagnostic(network), /phase=request http=0 mime=missing .*error=network .*proof=unknown/);

    const malformed = loadBridge({
        fetchImpl: async () => ({
            ok: true, status: 200,
            headers: { get: () => 'application/json; charset=utf-8' },
            json: async () => { throw new SyntaxError('fixture invalid JSON'); }
        })
    });
    await malformed.checkMediaLib(true);
    assert.equal(malformed.__sfMediaLibError, 'invalid-json');
    assert.equal(malformed.__sfMediaLibStatus, 'error');
    assert.match(finalLibraryDiagnostic(malformed),
        /phase=parse http=200 mime=json .*error=invalid-json .*proof=unknown/);

    const bodyNetwork = loadBridge({
        fetchImpl: async () => ({
            ok: true, status: 200,
            headers: { get: () => 'application/json; charset=utf-8' },
            json: async () => { throw new TypeError('fixture body stream failed'); }
        })
    });
    await bodyNetwork.checkMediaLib(true);
    assert.equal(bodyNetwork.__sfMediaLibError, 'network-error');
    assert.match(finalLibraryDiagnostic(bodyNetwork),
        /phase=parse http=200 mime=json .*error=network .*proof=unknown/);

    let jsonCalls = 0;
    const html = loadBridge({
        fetchImpl: async () => ({
            ok: true, status: 200,
            headers: { get: () => 'text/html; charset=utf-8' },
            json: async () => { jsonCalls += 1; throw new Error('HTML must not be parsed'); }
        })
    });
    await html.checkMediaLib(true);
    assert.equal(html.__sfMediaLibError, 'non-json');
    assert.equal(html.__sfMediaLibStatus, 'error');
    assert.equal(jsonCalls, 0, 'HTML is rejected before attempting JSON parsing');
    assert.match(finalLibraryDiagnostic(html),
        /phase=response http=200 mime=html .*error=non-json .*proof=unknown/);
});

test('a profile widget is diagnostic-only and never substitutes for library proof', async () => {
    const win = loadBridge({
        profileSignal: true,
        fetchImpl: async () => jsonResponse(401, {})
    });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.match(finalLibraryDiagnostic(win), /proof=invalid page=profile$/);
    assert.doesNotMatch(finalLibraryDiagnostic(win), /Fixture|cookie|token|Authorization/i);
});

test('a valid empty library is distinct from a failed request and proves only the API response', async () => {
    const win = loadBridge({ fetchImpl: async () => libraryPage([]) });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibError, '');
    assert.deepEqual(Array.from(win.mediaLib.playlists), []);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=settle http=200 mime=json duration=[0-9]+ error=empty received=0 transformed=0 proof=valid page=none$/);
});

test('unexpected JSON shape and GraphQL errors are not reported as an empty library', async () => {
    const responses = [
        [jsonResponse(200, {}), 'unexpected-shape', 'unexpected-shape'],
        [jsonResponse(200, { data: { me: { libraryV3: {} } } }), 'unexpected-shape', 'unexpected-shape'],
        [jsonResponse(200, { errors: [{ message: 'fixture-only error' }] }), 'graphql-error', 'graphql']
    ];
    for (const [response, error, diagnosticError] of responses) {
        const win = loadBridge({ fetchImpl: async () => response });
        await win.checkMediaLib(true);
        assert.equal(win.__sfMediaLibStatus, 'error');
        assert.equal(win.__sfMediaLibError, error);
        assert.equal(win.mediaLib, undefined);
        assert.match(finalLibraryDiagnostic(win), new RegExp(`error=${diagnosticError} .*proof=unknown`));
    }
});

test('a successful API response with unsupported items is a transform error, not a false empty library', async () => {
    const win = loadBridge({ fetchImpl: async () => libraryPage([
        libraryItem({ uri: 'spotify:fixture:unsupported', name: 'Fixture unsupported', typename: 'FutureType' })
    ]) });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'transform-error');
    assert.equal(win.__sfMediaLibRawItemCount, 1);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true,
        'the correctly shaped private response proves the session, but unsupported items do not become cards');
    assert.match(finalLibraryDiagnostic(win),
        /phase=transform http=200 mime=json .*error=transform received=1 transformed=0 proof=valid page=none/);
});

test('a transient network error preserves an earlier verified proof without asserting new auth', async () => {
    const win = loadBridge({ fetchImpl: async () => { throw new TypeError('offline'); } });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.match(finalLibraryDiagnostic(win), /error=network .*proof=valid/);
});

test('partial real data remains available when a later page fails', async () => {
    let calls = 0;
    const firstPage = Array.from({ length: 50 }, (_v, i) =>
        libraryItem({ uri: `spotify:playlist:partial-fixture-${i}`, name: `Fixture ${i}` }));
    const win = loadBridge({
        fetchImpl: async () => {
            calls += 1;
            return calls === 1 ? libraryPage(firstPage) : jsonResponse(503, {});
        }
    });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'http-503');
    assert.equal(win.mediaLib.playlists.length, 50);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.match(finalLibraryDiagnostic(win),
        /phase=response http=503 mime=json .*error=http-other received=50 transformed=50 proof=valid/);
});

test('parseLibrary handles missing fields, duplicate resources and Liked Songs', () => {
    const win = loadBridge();
    const library = win.parseLibrary([
        libraryItem({ uri: 'spotify:playlist:liked-fixture', name: 'Liked Songs' }),
        { item: { data: { __typename: 'Playlist', uri: 'spotify:playlist:liked-fixture', name: 'Liked Songs' } } },
        libraryItem({ uri: 'spotify:playlist:noimg-fixture', name: 'Fixture without artwork' }),
        libraryItem({ uri: 'spotify:album:album-fixture', name: 'Fixture album', typename: 'Album' }),
        { item: { data: { __typename: 'Playlist' } } },
        null,
        undefined,
        { item: null },
        libraryItem({ uri: 'spotify:playlist:noimg-fixture', name: 'Fixture duplicate' })
    ]);

    assert.equal(library.playlists.length, 2);
    assert.equal(library.playlists[0].name, 'Liked Songs');
    assert.ok(library.playlists[0].image);
    assert.equal(library.playlists[1].name, 'Fixture without artwork');
    assert.equal(library.playlists[1].image, null);
    assert.equal(library.albums.length, 1);
    assert.equal(library.albums[0].name, 'Fixture album');
});

test('a stalled request times out, aborts where supported, and does not create false proof', async () => {
    let requestSignal;
    const win = loadBridge({ fetchImpl: async (_url, init) => {
        requestSignal = init.signal;
        return new Promise(() => {});
    } });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'timeout');
    assert.equal(win.__sfMediaLibSessionProofKnown, false);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(requestSignal.aborted, true);
    assert.match(finalLibraryDiagnostic(win),
        /phase=request http=0 mime=missing .*error=timeout .*proof=unknown/);
});

test('a stalled response body also uses the bounded request deadline', async () => {
    let requestSignal;
    const win = loadBridge({ fetchImpl: async (_url, init) => {
        requestSignal = init.signal;
        return {
            ok: true, status: 200,
            headers: { get: () => 'application/json' },
            json: () => new Promise(() => {})
        };
    } });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibError, 'timeout');
    assert.equal(requestSignal.aborted, true);
    assert.match(finalLibraryDiagnostic(win),
        /phase=parse http=200 mime=json .*error=timeout .*proof=unknown/);
});

test('concurrent checkMediaLib calls do not double-fetch', async () => {
    let calls = 0;
    const win = loadBridge({
        fetchImpl: async () => {
            calls += 1;
            await new Promise((resolve) => setTimeout(resolve, 5));
            return libraryPage([libraryItem({ uri: 'spotify:playlist:concurrency-fixture', name: 'Fixture X' })]);
        }
    });
    await Promise.all([win.checkMediaLib(), win.checkMediaLib(), win.checkMediaLib()]);
    assert.equal(calls, 1);
});
