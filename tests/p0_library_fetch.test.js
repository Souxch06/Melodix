// Real behaviour tests for the Spotify bridge library path.
//
// The bridge is an IIFE that publishes its helpers on `window`. These tests run
// the REAL file inside a vm sandbox with a fake page (fetch, DOM, storage) so
// they exercise the actual code paths instead of matching source text.
// Mocks live only here: production never sees them.

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const BRIDGE = path.join(repo, 'scripts/spotify_bridge.source.js');

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

// Loads the real bridge into its own sandbox. `fetchImpl` replaces the page
// fetch the bridge captures at load time (`oriFetch`).
function loadBridge({ fetchImpl } = {}) {
    const listeners = {};
    const dispatchedEvents = [];
    const eventSnapshots = [];
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
        setTimeout: (fn) => setTimeout(fn, 0),
        clearTimeout,
        setInterval: () => 0,
        clearInterval() {},
        requestAnimationFrame: (fn) => setTimeout(fn, 0),
        cancelAnimationFrame() {},
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
            querySelector: () => null, querySelectorAll: () => [], getElementById: () => null,
            title: 'Spotify'
        },
        console: { log() {}, warn() {}, error() {}, info() {}, debug() {} },
        fetch: fetchImpl || (async () => ({ ok: true, status: 200, json: async () => ({}) })),
        MutationObserver: class { observe() {} disconnect() {} },
        matchMedia: () => ({ matches: false, addEventListener() {}, addListener() {} }),
        getComputedStyle: () => ({ getPropertyValue: () => '' }),
        performance: { now: () => 0 },
        alert() {}, open() { return null; }
    };
    win.window = win;
    win.document.defaultView = win;
    const context = vm.createContext(win);
    vm.runInContext(fs.readFileSync(BRIDGE, 'utf8'), context, { timeout: 20000 });
    win.__testDispatchedEvents = dispatchedEvents;
    win.__testEventSnapshots = eventSnapshots;
    return win;
}

// One real libraryV3 item as the web player returns it.
function libraryItem({ uri, name, image, typename = 'Playlist' }) {
    return { item: { data: { __typename: typename, uri, name, images: image ? { items: [{ sources: [{ url: image, width: 300 }] }] } : null } } };
}

function libraryPage(items) {
    return { ok: true, status: 200, json: async () => ({ data: { me: { libraryV3: { items } } } }) };
}

// P0 ROOT CAUSE: the cookie-based library fetch must actually run. Before the
// fix, checkMediaLib() bailed out on a `window.spotAuthToken` gate that is
// never set anywhere, so fetchAllLibrary() was unreachable dead code and the
// home screen could never receive the account's playlists.
test('checkMediaLib loads the real library with session cookies and no token', async () => {
    const calls = [];
    const win = loadBridge({
        fetchImpl: async (url, init) => {
            calls.push({ url, init });
            return libraryPage([
                libraryItem({ uri: 'spotify:playlist:aaa', name: 'Road trip' }),
                libraryItem({ uri: 'spotify:playlist:bbb', name: 'Focus' })
            ]);
        }
    });

    await win.checkMediaLib(true);

    assert.equal(win.__sfMediaLibStatus, 'ready', 'the library settles as ready');
    assert.equal(win.__sfMediaLibError, '', 'no error is recorded');
    assert.equal(win.__sfMediaLibSessionProofKnown, true, 'the private API response establishes an explicit session proof');
    assert.equal(win.__sfMediaLibSessionProven, true);
    assert.equal(win.__sfMediaLibRawItemCount, 2, 'the settled response records only a bounded raw item count');
    assert.equal(win.__testDispatchedEvents.filter((type) => type === 'sf-media-library-state-changed').length, 2,
        'loading and settlement both notify the Web Home renderer without carrying account data');
    assert.deepEqual(
        win.__testEventSnapshots.filter((event) => event.type === 'sf-media-library-state-changed')
            .map(({ status, rawItemCount }) => [status, rawItemCount]),
        [['loading', 0], ['ready', 2]],
        'the previous raw count is cleared before the loading event and only repopulated at settlement'
    );
    assert.ok(win.mediaLib, 'mediaLib is populated');
    assert.deepEqual(Array.from(win.mediaLib.playlists, (p) => p.name), ['Road trip', 'Focus']);
    assert.equal(calls.length, 1, 'exactly one request for one short page');
    assert.equal(calls[0].init.credentials, 'include', 'the page session is used, never a captured token');
    assert.ok(!/authorization/i.test(Object.keys(calls[0].init.headers || {}).join(',')),
        'no Authorization header is fabricated by the bridge');
});

test('loading clears an earlier raw item count before notifying the Home renderer', async () => {
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

    assert.equal(fetchStarted, true, 'the request has started and is held pending by the test');
    assert.equal(win.__sfMediaLibStatus, 'loading');
    assert.equal(win.__sfMediaLibRawItemCount, 0, 'stale raw items are not visible during loading');
    assert.deepEqual(
        win.__testEventSnapshots.filter((event) => event.type === 'sf-media-library-state-changed')
            .map(({ status, rawItemCount }) => [status, rawItemCount]),
        [['loading', 0]],
        'the state-change event observes the reset counter before any response settles'
    );

    resolveResponse(libraryPage([libraryItem({ uri: 'spotify:playlist:only-test-data', name: 'Fixture item' })]));
    await pending;
    assert.equal(win.__sfMediaLibStatus, 'ready');
    assert.equal(win.__sfMediaLibRawItemCount, 1);
    assert.deepEqual(
        win.__testEventSnapshots.filter((event) => event.type === 'sf-media-library-state-changed')
            .map(({ status, rawItemCount }) => [status, rawItemCount]),
        [['loading', 0], ['ready', 1]],
        'the count is published only once the response has settled'
    );
});

test('the library paginates until a short page and deduplicates entries', async () => {
    const offsets = [];
    const firstPage = Array.from({ length: 50 }, (_v, i) =>
        libraryItem({ uri: `spotify:playlist:p${i}`, name: `Playlist ${i}` }));
    // Second page repeats one entry on purpose, then ends short.
    const secondPage = [
        libraryItem({ uri: 'spotify:playlist:p49', name: 'Playlist 49' }),
        libraryItem({ uri: 'spotify:playlist:p50', name: 'Playlist 50' })
    ];
    const win = loadBridge({
        fetchImpl: async (_url, init) => {
            offsets.push(JSON.parse(init.body).variables.offset);
            return libraryPage(offsets.length === 1 ? firstPage : secondPage);
        }
    });

    await win.checkMediaLib(true);

    assert.deepEqual(offsets, [0, 50], 'the second page is requested at offset 50');
    assert.equal(win.mediaLib.playlists.length, 51, '51 unique playlists, the duplicate is dropped');
    const ids = Array.from(win.mediaLib.playlists, (p) => p.id);
    assert.equal(new Set(ids).size, ids.length, 'no duplicated id survives');
});

test('HTTP failures are distinguished and never reported as an empty library', async () => {
    const cases = [
        [401, 'token-missing'],
        [403, 'http-403'],
        [429, 'http-429'],
        [500, 'http-500']
    ];
    for (const [status, expected] of cases) {
        const win = loadBridge({ fetchImpl: async () => ({ ok: false, status, json: async () => ({}) }) });
        await win.checkMediaLib(true);
        assert.equal(win.__sfMediaLibStatus, 'error', `status ${status} must not look ready`);
        assert.equal(win.__sfMediaLibError, expected, `status ${status} keeps its own error code`);
        assert.equal(win.mediaLib, undefined, 'a failure never produces a fake empty library');
        if (status === 401) {
            assert.equal(win.__sfMediaLibSessionProofKnown, true);
            assert.equal(win.__sfMediaLibSessionProven, false,
                'an explicit unauthorized response invalidates stale positive proof');
        } else {
            assert.equal(win.__sfMediaLibSessionProofKnown, false,
                'other HTTP failures are not mistaken for proof that the session ended');
        }
    }
});

test('an explicit 401 invalidates an earlier private-response proof without fabricating an empty library', async () => {
    const win = loadBridge({
        fetchImpl: async () => ({ ok: false, status: 401, json: async () => ({}) })
    });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    win.mediaLib = { playlists: [{ id: 'spotify:playlist:stale', name: 'Stale cache' }] };
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibError, 'token-missing');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, false);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.mediaLib.playlists.length, 1,
        'the last known data is preserved but cannot authorize a takeover after 401');
});

test('network failure and malformed JSON keep their own error codes', async () => {
    const network = loadBridge({ fetchImpl: async () => { throw new Error('offline'); } });
    await network.checkMediaLib(true);
    assert.equal(network.__sfMediaLibError, 'fetch-parse-error');

    const malformed = loadBridge({
        fetchImpl: async () => ({ ok: true, status: 200, json: async () => { throw new SyntaxError('bad json'); } })
    });
    await malformed.checkMediaLib(true);
    assert.equal(malformed.__sfMediaLibError, 'fetch-parse-error');
    assert.equal(malformed.__sfMediaLibStatus, 'error');
});

test('an authenticated account with an empty library is proven by the successful private response', async () => {
    const win = loadBridge({ fetchImpl: async () => libraryPage([]) });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'ready', 'empty is a final state, not an error');
    assert.equal(win.__sfMediaLibError, '');
    assert.deepEqual(Array.from(win.mediaLib.playlists), []);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true,
        'a valid empty library is still a successful authenticated Spotify response');
});

test('an unexpected HTTP-200 library shape is an error, never a false empty or session proof', async () => {
    for (const response of [
        { ok: true, status: 200, json: async () => ({}) },
        { ok: true, status: 200, json: async () => ({ data: { me: { libraryV3: {} } } }) }
    ]) {
        const win = loadBridge({ fetchImpl: async () => response });
        await win.checkMediaLib(true);
        assert.equal(win.__sfMediaLibStatus, 'error');
        assert.equal(win.__sfMediaLibError, 'fetch-parse-error');
        assert.equal(win.mediaLib, undefined);
        assert.equal(win.__sfMediaLibSessionProofKnown, false);
        assert.equal(win.__sfMediaLibSessionProven, false);
    }
});

test('a transient library error preserves an earlier verified session proof', async () => {
    const win = loadBridge({ fetchImpl: async () => { throw new TypeError('offline'); } });
    win.__sfMediaLibSessionProofKnown = true;
    win.__sfMediaLibSessionProven = true;
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true,
        'a later network/parse error does not artificially sign out the account');
});

test('partial library data remains available and retains session proof after a later page fails', async () => {
    let calls = 0;
    const firstPage = Array.from({ length: 50 }, (_v, i) =>
        libraryItem({ uri: `spotify:playlist:partial${i}`, name: `Private name ${i}` }));
    const win = loadBridge({
        fetchImpl: async () => {
            calls += 1;
            return calls === 1
                ? libraryPage(firstPage)
                : { ok: false, status: 503, json: async () => ({}) };
        }
    });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'error');
    assert.equal(win.__sfMediaLibError, 'http-503');
    assert.equal(win.mediaLib.playlists.length, 50);
    assert.equal(win.__sfMediaLibSessionProofKnown, true);
    assert.equal(win.__sfMediaLibSessionProven, true);
});

test('parseLibrary survives missing fields, unknown types and Liked Songs', () => {
    const win = loadBridge();
    const library = win.parseLibrary([
        libraryItem({ uri: 'spotify:playlist:liked', name: 'Liked Songs' }),
        { item: { data: { __typename: 'Playlist', uri: 'spotify:playlist:liked', name: 'Liked Songs' } } },
        libraryItem({ uri: 'spotify:playlist:noimg', name: 'Sans pochette' }),
        libraryItem({ uri: 'spotify:album:al1', name: 'Album', typename: 'Album' }),
        { item: { data: { __typename: 'Playlist' } } },            // no uri at all
        null,
        undefined,
        { item: null },
        libraryItem({ uri: 'spotify:playlist:noimg', name: 'Doublon' })
    ]);

    assert.equal(library.playlists.length, 2, 'only the real, unique playlists are kept');
    assert.equal(library.playlists[0].name, 'Liked Songs');
    assert.ok(library.playlists[0].image, 'Liked Songs keeps its artwork fallback');
    assert.equal(library.playlists[1].name, 'Sans pochette');
    assert.equal(library.playlists[1].image, null, 'a missing artwork stays null, never invented');
    assert.equal(library.albums.length, 1);
    assert.equal(library.albums[0].name, 'Album');
});

test('a second concurrent checkMediaLib does not double-fetch', async () => {
    let calls = 0;
    const win = loadBridge({
        fetchImpl: async () => {
            calls += 1;
            await new Promise((resolve) => setTimeout(resolve, 5));
            return libraryPage([libraryItem({ uri: 'spotify:playlist:x', name: 'X' })]);
        }
    });
    await Promise.all([win.checkMediaLib(), win.checkMediaLib(), win.checkMediaLib()]);
    assert.equal(calls, 1, 'concurrent calls are coalesced while a fetch is in flight');
});
