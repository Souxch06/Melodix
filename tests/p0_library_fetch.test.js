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
const RUNTIME_STATE = path.join(repo, 'assets/runtime_state.js');
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
function loadBridge({ fetchImpl, profileSignal = true, playerSignal = true, loginSignal = false,
    pathname = '/', hostname = 'open.spotify.com' } = {}) {
    const listeners = {};
    const dispatchedEvents = [];
    const eventSnapshots = [];
    const diagnostics = [];
    const profile = fakeElement();
    const playerControl = fakeElement();
    const loginAction = fakeElement();
    const authSignals = { profileSignal, playerSignal, loginSignal };
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
            hostname: hostname, href: 'https://' + hostname + pathname,
            pathname: pathname, origin: 'https://' + hostname, search: '',
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
                const value = String(selector);
                if (authSignals.loginSignal && /login-button|href[^,]*login/.test(value)) return loginAction;
                if (authSignals.profileSignal && /user-widget-link|main-userWidget-box/.test(value)) return profile;
                if (authSignals.playerSignal && /control-button-playpause|main-playButton-entrancePoint/.test(value)) return playerControl;
                return null;
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
    vm.runInContext(fs.readFileSync(RUNTIME_STATE, 'utf8'), context, { timeout: 20000 });
    vm.runInContext(fs.readFileSync(BRIDGE, 'utf8'), context, { timeout: 20000 });
    win.__testDispatchedEvents = dispatchedEvents;
    win.__testEventSnapshots = eventSnapshots;
    win.__testDiagnostics = diagnostics;
    win.__testSetAuthSignals = (updates = {}) => {
        if (Object.prototype.hasOwnProperty.call(updates, 'profileSignal')) authSignals.profileSignal = updates.profileSignal === true;
        if (Object.prototype.hasOwnProperty.call(updates, 'playerSignal')) authSignals.playerSignal = updates.playerSignal === true;
        if (Object.prototype.hasOwnProperty.call(updates, 'loginSignal')) authSignals.loginSignal = updates.loginSignal === true;
        if (Object.prototype.hasOwnProperty.call(updates, 'pathname')) {
            win.location.pathname = String(updates.pathname || '/');
            win.location.href = 'https://' + win.location.hostname + win.location.pathname;
        }
        if (Object.prototype.hasOwnProperty.call(updates, 'hostname')) {
            win.location.hostname = String(updates.hostname || 'open.spotify.com');
            win.location.origin = 'https://' + win.location.hostname;
            win.location.href = win.location.origin + win.location.pathname;
        }
    };
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

function jsonResponse(status, body, mime = 'application/json; charset=utf-8', retryAfter = null) {
    return {
        ok: status >= 200 && status < 300,
        status,
        headers: {
            get(name) {
                const key = String(name).toLowerCase();
                if (key === 'content-type') return mime;
                if (key === 'retry-after') return retryAfter;
                return null;
            }
        },
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
// and redacted HTTP/timing telemetry. It does not demonstrate a real Spotify session.
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
    assert.equal(calls[0].url, 'https://api-partner.spotify.com/pathfinder/v2/query');
    assert.equal(calls[0].init.method, 'POST');
    assert.equal(calls[0].init.mode, 'cors');
    assert.equal(calls[0].init.credentials, 'include');
    const requestBody = JSON.parse(calls[0].init.body);
    assert.equal(requestBody.operationName, 'libraryV3');
    assert.equal(requestBody.variables.limit, 50);
    assert.equal(requestBody.variables.offset, 0);
    assert.equal(requestBody.variables.textFilter, '');
    assert.deepEqual(Array.from(requestBody.variables.features),
        ['LIKED_SONGS', 'YOUR_EPISODES_V2', 'PRERELEASES', 'EVENTS']);
    assert.equal(requestBody.extensions.persistedQuery.version, 1);
    assert.match(requestBody.extensions.persistedQuery.sha256Hash, /^[a-f0-9]{64}$/);
    const headers = calls[0].init.headers || {};
    assert.deepEqual(Object.keys(headers).sort(), ['Content-Type', 'app-platform', 'spotify-app-version'].sort());
    assert.equal(headers['Content-Type'], 'application/json;charset=UTF-8');
    assert.equal(headers['app-platform'], 'WebPlayer');
    assert.equal(headers['spotify-app-version'], '1.2.40.0');
    assert.ok(!/authorization/i.test(Object.keys(headers).join(',')));
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=settle http=200 mime=json duration=[0-9]+ error=none auth=webview-session refresh=unsupported$/);
    const diagnostic = win.__sfMediaLibLastDiagnostic;
    assert.equal(diagnostic.attempt, 1);
    assert.equal(diagnostic.source, 'unspecified');
    assert.equal(diagnostic.requests, 1);
    assert.equal(diagnostic.phase, 'settle');
    assert.equal(diagnostic.http, 200);
    assert.equal(diagnostic.mime, 'json');
    assert.equal(diagnostic.error, 'none');
    assert.equal(diagnostic.authMode, 'webview-session');
    assert.equal(diagnostic.refreshMode, 'unsupported');
    assert.ok(Number.isInteger(diagnostic.durationMs) && diagnostic.durationMs >= 0 && diagnostic.durationMs <= 999999);
    assert.deepEqual(Object.keys(diagnostic).sort(),
        ['attempt', 'authMode', 'durationMs', 'error', 'http', 'mime', 'phase', 'refreshMode', 'requests', 'source'].sort(),
        'the passive snapshot contains only a bounded sequence/source, HTTP/timing/error data and fixed authentication modes');
    assert.doesNotMatch(libraryDiagnostics(win).join('\n'),
        /Fixture|spotify:|Cookie|Authorization|Road trip|Focus|received|transformed|proof=|page=/i,
        'diagnostics contain only HTTP/timing/error categories, never account data or extra proof/page fields');
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

test('concurrent and forced checks share one in-flight libraryV3 request', async () => {
    let fetchCount = 0;
    let resolveResponse;
    const win = loadBridge({ fetchImpl: async () => {
        fetchCount += 1;
        return new Promise((resolve) => { resolveResponse = resolve; });
    } });
    const first = win.checkMediaLib();
    const forced = win.checkMediaLib(true);
    assert.strictEqual(forced, first, 'even force joins the established in-flight proof request');
    for (let attempt = 0; attempt < 10 && fetchCount === 0; attempt += 1) await Promise.resolve();
    assert.equal(fetchCount, 1, 'the API is called exactly once for concurrent checks');
    resolveResponse(libraryPage([libraryItem({ uri: 'spotify:playlist:single-flight', name: 'Fixture' })]));
    await Promise.all([first, forced]);
    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibSessionProven, true);
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
    assert.equal(win.__sfMediaLibLastDiagnostic.requests, 2,
        'the diagnostic counts each libraryV3 fetch invocation across pagination');
    assert.equal(win.mediaLib.playlists.length, 51);
    const ids = Array.from(win.mediaLib.playlists, (item) => item.id);
    assert.equal(new Set(ids).size, ids.length);
    assert.match(finalLibraryDiagnostic(win), /^library-fetch phase=settle http=200 mime=json duration=[0-9]+ error=none auth=webview-session refresh=unsupported$/);
});

test('an absent session represented by HTTP 401 remains an unknown-cause refusal, not a fabricated login diagnosis', async () => {
    // Deterministic no-session fixture only; this is not a real Spotify login test.
    const win = loadBridge({ fetchImpl: async () => jsonResponse(401, {}) });
    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'http-401');
    assert.equal(win.mediaLib, null);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=response http=401 mime=json duration=[0-9]+ error=http-401 auth=webview-session refresh=unsupported$/);
    const diagnostic = win.__sfMediaLibLastDiagnostic;
    assert.equal(diagnostic.phase, 'response');
    assert.equal(diagnostic.http, 401);
    assert.equal(diagnostic.mime, 'json');
    assert.equal(diagnostic.error, 'http-401');
});

test('HTTP refusals and server responses retain their status-specific errors and proof semantics', async () => {
    const cases = [
        [403, 'http-403', 'http-403', true, false, null],
        [429, 'http-429', 'http-other', false, false, undefined],
        [500, 'http-500', 'http-other', false, false, undefined]
    ];
    for (const [status, expectedError, diagnosticError, proofKnown, proven, library] of cases) {
        const win = loadBridge({ fetchImpl: async () => jsonResponse(status, {}) });
        await win.checkMediaLib(true);
        assert.equal(win.__sfMediaLibStatus, 'error');
        assert.equal(win.__sfMediaLibError, expectedError);
        assert.equal(win.mediaLib, library);
        assert.equal(win.__sfMediaLibSessionProofKnown, proofKnown);
        assert.equal(win.__sfMediaLibSessionProven, proven,
            'a 403 invalidates library proof without claiming that the player login ended');
        assert.match(finalLibraryDiagnostic(win), new RegExp(
            `^library-fetch phase=response http=${status} mime=json duration=[0-9]+ error=${diagnosticError} auth=webview-session refresh=unsupported$`));
        assert.equal(win.__sfMediaLibLastDiagnostic.http, status);
        assert.equal(win.__sfMediaLibLastDiagnostic.error, diagnosticError);
    }
});

test('library request diagnostics distinguish actual attempts from repeated snapshots using safe source and counts', async () => {
    let fetchCount = 0;
    const win = loadBridge({ fetchImpl: async () => {
        fetchCount += 1;
        return jsonResponse(401, {});
    } });

    await win.checkMediaLib(true, 'native-retry');
    assert.deepEqual({
        attempt: win.__sfMediaLibLastDiagnostic.attempt,
        source: win.__sfMediaLibLastDiagnostic.source,
        requests: win.__sfMediaLibLastDiagnostic.requests,
        http: win.__sfMediaLibLastDiagnostic.http
    }, { attempt: 1, source: 'native-retry', requests: 1, http: 401 });

    const untrustedSource = 'https://private.invalid/path?token=fixture';
    await win.checkMediaLib(true, untrustedSource);
    assert.deepEqual({
        attempt: win.__sfMediaLibLastDiagnostic.attempt,
        source: win.__sfMediaLibLastDiagnostic.source,
        requests: win.__sfMediaLibLastDiagnostic.requests,
        http: win.__sfMediaLibLastDiagnostic.http
    }, { attempt: 2, source: 'unspecified', requests: 1, http: 401 });
    assert.equal(fetchCount, 2, 'each forced check starts one HTTP request in this first-page fixture');
    assert.doesNotMatch(JSON.stringify(win.__sfMediaLibLastDiagnostic), /private\.invalid|token=fixture/);
});

test('a 401 invalidates earlier proof and clears private rows from memory', async () => {
    const win = loadBridge({ fetchImpl: async () => jsonResponse(401, {}) });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    win.mediaLib = { playlists: [{ id: 'spotify:playlist:fixture-stale', name: 'Fixture stale data' }] };
    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibError, 'http-401');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.mediaLib, null,
        'a server refusal clears private rows instead of leaving stale data in memory');
    assert.equal(win.__sfMediaLibRawItemCount, 0);
});

test('a later-page 401 clears partial private rows and revokes the earlier page proof', async () => {
    let calls = 0;
    const firstPage = Array.from({ length: 50 }, (_v, i) =>
        libraryItem({ uri: `spotify:playlist:partial-401-${i}`, name: `Fixture ${i}` }));
    const win = loadBridge({ fetchImpl: async () => {
        calls += 1;
        return calls === 1 ? libraryPage(firstPage) : jsonResponse(401, {});
    } });
    await win.checkMediaLib(true);
    assert.equal(calls, 2);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'http-401');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(win.mediaLib, null, 'the first page is discarded after the later 401');
    assert.equal(win.__sfMediaLibRawItemCount, 0);
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=response http=401 mime=json duration=[0-9]+ error=http-401 auth=webview-session refresh=unsupported$/);
});

test('a 403 invalidates private library proof and clears stale rows without asserting player logout', async () => {
    const win = loadBridge({ fetchImpl: async () => jsonResponse(403, {}) });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    win.mediaLib = { playlists: [{ id: 'spotify:playlist:fixture-stale-403', name: 'Fixture stale data' }] };
    win.__sfMediaLibRawItemCount = 1;

    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibError, 'http-403');
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false,
        'the 403 revokes library API proof, but does not set or clear the independent player-login marker');
    assert.equal(win.mediaLib, null, 'previous private rows are erased after an access refusal');
    assert.equal(win.__sfMediaLibRawItemCount, 0);
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=response http=403 mime=json duration=[0-9]+ error=http-403 auth=webview-session refresh=unsupported$/);
    assert.doesNotMatch(finalLibraryDiagnostic(win), /Fixture stale data|spotify:playlist/);
});

test('a later-page 403 discards partial private rows and invalidates the earlier page proof', async () => {
    let calls = 0;
    const firstPage = Array.from({ length: 50 }, (_v, i) =>
        libraryItem({ uri: `spotify:playlist:partial-403-${i}`, name: `Fixture ${i}` }));
    const win = loadBridge({ fetchImpl: async () => {
        calls += 1;
        return calls === 1 ? libraryPage(firstPage) : jsonResponse(403, {});
    } });

    await win.checkMediaLib(true);

    assert.equal(calls, 2);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'http-403');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(win.mediaLib, null, 'partial rows from the valid first page are discarded');
    assert.equal(win.__sfMediaLibRawItemCount, 0);
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=response http=403 mime=json duration=[0-9]+ error=http-403 auth=webview-session refresh=unsupported$/);
});

test('a 429 honours a bounded Retry-After delay without logging the header or response body', async () => {
    const startedAt = Date.now();
    const win = loadBridge({ fetchImpl: async () =>
        jsonResponse(429, { error: { message: 'synthetic quota response', reason: 'QUOTA_EXCEEDED' } },
            'application/json; charset=utf-8', '120')
    });

    await win.checkMediaLib(true);

    const observedAt = Date.now();
    assert.equal(win.__sfMediaLibError, 'http-429');
    assert.ok(win.__sfMediaLibRetryAt >= startedAt + 119000,
        'the server Retry-After value is converted to a bounded deadline');
    assert.ok(win.__sfMediaLibRetryAt <= observedAt + 120000,
        'the stored deadline is relative to receipt, not an unbounded duration');
    assert.ok(win.__sfMediaLibRetryDelayMs >= 5000 && win.__sfMediaLibRetryDelayMs <= 60000,
        'the fallback exponential delay remains capped');
    assert.doesNotMatch(finalLibraryDiagnostic(win), /synthetic quota response|QUOTA_EXCEEDED|Retry-After|120/,
        'response body and raw retry header never enter diagnostics');
    assert.doesNotMatch(JSON.stringify(win.__sfMediaLibLastDiagnostic),
        /synthetic quota response|QUOTA_EXCEEDED|Retry-After|120/);

    const capped = loadBridge({ fetchImpl: async () => jsonResponse(429, {},
        'application/json; charset=utf-8', '100000') });
    const capStartedAt = Date.now();
    await capped.checkMediaLib(true);
    const capObservedAt = Date.now();
    assert.ok(capped.__sfMediaLibRetryAt <= capObservedAt + 24 * 60 * 60 * 1000,
        'a server-provided delay cannot defer retries beyond the one-day safety cap');
    assert.ok(capped.__sfMediaLibRetryAt >= capStartedAt + 24 * 60 * 60 * 1000 - 1000,
        'long Retry-After values are capped rather than ignored');
});

test('network failure, invalid JSON and HTML response are distinguished', async () => {
    const network = loadBridge({ fetchImpl: async () => { throw new TypeError('offline'); } });
    await network.checkMediaLib(true);
    assert.equal(network.__sfMediaLibError, 'network-error');
    assert.deepEqual({
        phase: network.__sfMediaLibLastDiagnostic.phase,
        http: network.__sfMediaLibLastDiagnostic.http,
        mime: network.__sfMediaLibLastDiagnostic.mime,
        error: network.__sfMediaLibLastDiagnostic.error
    }, { phase: 'request', http: 0, mime: 'missing', error: 'network' });
    assert.match(finalLibraryDiagnostic(network), /^library-fetch phase=request http=0 mime=missing duration=[0-9]+ error=network auth=webview-session refresh=unsupported$/);

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
    assert.equal(malformed.__sfMediaLibLastDiagnostic.phase, 'parse');
    assert.equal(malformed.__sfMediaLibLastDiagnostic.http, 200);
    assert.equal(malformed.__sfMediaLibLastDiagnostic.mime, 'json');
    assert.equal(malformed.__sfMediaLibLastDiagnostic.error, 'invalid-json');
    assert.match(finalLibraryDiagnostic(malformed),
        /phase=parse http=200 mime=json duration=[0-9]+ error=invalid-json/);

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
        /phase=parse http=200 mime=json duration=[0-9]+ error=network/);

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
    assert.equal(html.__sfMediaLibLastDiagnostic.phase, 'response');
    assert.equal(html.__sfMediaLibLastDiagnostic.http, 200);
    assert.equal(html.__sfMediaLibLastDiagnostic.mime, 'html');
    assert.equal(html.__sfMediaLibLastDiagnostic.error, 'non-json');
    assert.match(finalLibraryDiagnostic(html),
        /phase=response http=200 mime=html duration=[0-9]+ error=non-json/);
});

test('login navigation aborts an in-flight request and rejects its late private response', async () => {
    for (const pathname of ['/login', '/intl-fr/login']) {
        let resolveResponse;
        let requestSignal;
        let fetchCount = 0;
        const win = loadBridge({
            fetchImpl: async (_url, init) => {
                fetchCount += 1;
                requestSignal = init.signal;
                return new Promise((resolve) => { resolveResponse = resolve; });
            }
        });
        const pending = win.checkMediaLib();
        for (let attempt = 0; attempt < 10 && !resolveResponse; attempt += 1) await Promise.resolve();
        assert.equal(fetchCount, 1);
        assert.ok(requestSignal);

        win.__testSetAuthSignals({ pathname });
        assert.equal(win.__sfGetSpotifyAuthUiState(), 'required', `${pathname}: login state is recognized`);
        assert.equal(requestSignal.aborted, true, `${pathname}: active library request is cancelled`);
        assert.equal(await win.checkMediaLib(true), false, `${pathname}: retry is blocked on login`);
        resolveResponse(libraryPage([libraryItem({ uri: 'spotify:playlist:stale', name: 'Fixture stale response' })]));
        await pending;

        assert.equal(win.__sfMediaLibStatus, 'pending', `${pathname}: stale result leaves no success state`);
        assert.equal(win.__sfMediaLibSessionProven, false, `${pathname}: stale result cannot prove a session`);
        assert.equal(win.mediaLib, undefined, `${pathname}: stale private rows are not restored`);
        assert.equal(fetchCount, 1, `${pathname}: no second unauthenticated request is issued`);
        assert.doesNotMatch(win.__testDiagnostics.join('\\n'), /Fixture stale response|spotify:playlist:stale/);
    }
});

test('a profile widget alone never authorizes a library request', async () => {
    let fetchCount = 0;
    const win = loadBridge({
        profileSignal: true,
        playerSignal: false,
        fetchImpl: async () => { fetchCount += 1; return jsonResponse(401, {}); }
    });
    const result = await win.checkMediaLib(true);
    assert.equal(result, false);
    assert.equal(fetchCount, 0);
    assert.equal(win.__sfSpotifyAuthUiState, 'unknown');
    assert.equal(win.__sfMediaLibStatus, 'pending');
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(libraryDiagnostics(win).length, 0, 'no request diagnostic is emitted when the player UI is not confirmed');
});

test('a confirmed player UI permits one libraryV3 check and records a separate proof epoch', async () => {
    let fetchCount = 0;
    const win = loadBridge({
        profileSignal: true,
        playerSignal: false,
        fetchImpl: async () => { fetchCount += 1; return libraryPage([]); }
    });
    assert.equal(await win.checkMediaLib(), false);
    assert.equal(fetchCount, 0);
    win.__testSetAuthSignals({ playerSignal: true });
    assert.equal(win.__sfGetSpotifyAuthUiState(), 'connected');
    await win.checkMediaLib();
    assert.equal(fetchCount, 1);
    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.equal(win.__sfMediaLibProofAuthEpoch, win.__sfSpotifyAuthEpoch);
    assert.ok(win.__sfSpotifyAuthEpoch > 0);
});

test('a valid empty library is distinct from a failed request and proves only the API response', async () => {
    const win = loadBridge({ fetchImpl: async () => libraryPage([]) });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibError, '');
    assert.deepEqual(Array.from(win.mediaLib.playlists), []);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.deepEqual({
        phase: win.__sfMediaLibLastDiagnostic.phase,
        http: win.__sfMediaLibLastDiagnostic.http,
        mime: win.__sfMediaLibLastDiagnostic.mime,
        error: win.__sfMediaLibLastDiagnostic.error
    }, { phase: 'settle', http: 200, mime: 'json', error: 'empty' });
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=settle http=200 mime=json duration=[0-9]+ error=empty auth=webview-session refresh=unsupported$/);
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
        assert.equal(win.__sfMediaLibLastDiagnostic.error, diagnosticError);
        assert.deepEqual(Object.keys(win.__sfMediaLibLastDiagnostic).sort(),
            ['attempt', 'authMode', 'durationMs', 'error', 'http', 'mime', 'phase', 'refreshMode', 'requests', 'source'].sort());
        assert.match(finalLibraryDiagnostic(win), new RegExp(`error=${diagnosticError} auth=webview-session refresh=unsupported$`));
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
    assert.equal(win.__sfMediaLibLastDiagnostic.phase, 'transform');
    assert.equal(win.__sfMediaLibLastDiagnostic.error, 'transform');
    assert.deepEqual(Object.keys(win.__sfMediaLibLastDiagnostic).sort(),
        ['attempt', 'authMode', 'durationMs', 'error', 'http', 'mime', 'phase', 'refreshMode', 'requests', 'source'].sort());
    assert.match(finalLibraryDiagnostic(win),
        /^library-fetch phase=transform http=200 mime=json duration=[0-9]+ error=transform auth=webview-session refresh=unsupported$/);
});

test('a transient network error preserves an earlier verified proof without asserting new auth', async () => {
    const win = loadBridge({ fetchImpl: async () => { throw new TypeError('offline'); } });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.match(finalLibraryDiagnostic(win), /^library-fetch phase=request http=0 mime=missing duration=[0-9]+ error=network auth=webview-session refresh=unsupported$/);
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
        /^library-fetch phase=response http=503 mime=json duration=[0-9]+ error=http-other auth=webview-session refresh=unsupported$/);
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
        /^library-fetch phase=request http=0 mime=missing duration=[0-9]+ error=timeout auth=webview-session refresh=unsupported$/);
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
        /^library-fetch phase=parse http=200 mime=json duration=[0-9]+ error=timeout auth=webview-session refresh=unsupported$/);
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
