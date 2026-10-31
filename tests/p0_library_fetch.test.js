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
const BRIDGE = path.join(repo, 'assets/spotify_bridge.js');

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
    const win = {
        addEventListener(type, fn) { (listeners[type] = listeners[type] || []).push(fn); },
        removeEventListener() {},
        dispatchEvent() { return true; },
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
    assert.ok(win.mediaLib, 'mediaLib is populated');
    assert.deepEqual(Array.from(win.mediaLib.playlists, (p) => p.name), ['Road trip', 'Focus']);
    assert.equal(calls.length, 1, 'exactly one request for one short page');
    assert.equal(calls[0].init.credentials, 'include', 'the page session is used, never a captured token');
    assert.ok(!/authorization/i.test(Object.keys(calls[0].init.headers || {}).join(',')),
        'no Authorization header is fabricated by the bridge');
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
    }
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

test('an account with no playlist settles as an honest empty library', async () => {
    const win = loadBridge({ fetchImpl: async () => libraryPage([]) });
    await win.checkMediaLib(true);
    assert.equal(win.__sfMediaLibStatus, 'ready', 'empty is a final state, not an error');
    assert.equal(win.__sfMediaLibError, '');
    assert.deepEqual(Array.from(win.mediaLib.playlists), []);
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
