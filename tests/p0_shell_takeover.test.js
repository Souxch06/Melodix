// Real behaviour tests for the native-UI shell (assets/native_ui_shell.js).
//
// The shell is an IIFE that boots on load: it scrapes the Spotify page, sends
// rows to the native side and decides when the native UI may take over. These
// tests run the REAL file in a vm sandbox with a minimal fake page and observe
// what it actually sends to the native bridge.
// Mocks live only here: production never sees them.

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const SHELL = path.join(repo, 'assets/native_ui_shell.js');

// Minimal DOM node. `matches` understands only the selectors the shell uses.
function node({ tag = 'div', attrs = {}, text = '', children = [], within = null } = {}) {
    const el = {
        tagName: tag.toUpperCase(),
        children,
        parentNode: within,
        _attrs: { ...attrs },
        textContent: text,
        innerText: text,
        href: attrs.href || '',
        getAttribute(name) { return this._attrs[name] === undefined ? null : this._attrs[name]; },
        setAttribute(name, value) { this._attrs[name] = value; },
        matches(sel) { return matchesSelector(this, sel); },
        closest(sel) {
            let cur = this;
            while (cur) {
                if (cur.matches && cur.matches(sel)) return cur;
                cur = cur.parentNode;
            }
            return null;
        },
        querySelector(sel) {
            const found = [];
            walk(this, (n) => { if (n !== this && n.matches && n.matches(sel)) found.push(n); });
            return found[0] || null;
        },
        querySelectorAll(sel) {
            const found = [];
            walk(this, (n) => { if (n.matches && n.matches(sel)) found.push(n); });
            return found;
        },
        getBoundingClientRect() { return { width: 10, height: 10, top: 0, left: 0 }; },
        classList: { add() {}, remove() {}, toggle() {}, contains() { return false; } },
        style: {},
        addEventListener() {}, removeEventListener() {}, appendChild() {}, remove() {}
    };
    children.forEach((child) => { child.parentNode = el; });
    return el;
}

function walk(root, visit) {
    visit(root);
    (root.children || []).forEach((child) => walk(child, visit));
}

// Supports the subset of selectors the shell actually queries.
function matchesSelector(el, sel) {
    const s = String(sel).trim();
    if (s.includes(',')) return s.split(',').some((part) => matchesSelector(el, part.trim()));
    let m = /^([a-zA-Z0-9]*)?\[data-testid="([^"]+)"\]$/.exec(s);
    if (m) {
        const tagOk = !m[1] || el.tagName === m[1].toUpperCase();
        return tagOk && el.getAttribute('data-testid') === m[2];
    }
    m = /^([a-zA-Z0-9]*)\[href\]$/.exec(s);
    if (m) return (!m[1] || el.tagName === m[1].toUpperCase()) && Boolean(el.getAttribute('href'));
    m = /^(h1|h2|h3)$/i.exec(s);
    if (m) return el.tagName === m[1].toUpperCase();
    if (s.startsWith('#')) return el.getAttribute('id') === s.slice(1);
    return el.tagName === s.toUpperCase();
}

function cardPage({ withCards = true } = {}) {
    const shelfTitle = node({ tag: 'h2', text: 'Vos playlists' });
    const cards = [];
    if (withCards) {
        const inner = node({ tag: 'a', attrs: { href: '/playlist/37i9dQZF1DXcBWIGoYBM5M' }, children: [
            node({ tag: 'img', attrs: { src: 'https://i.scdn.co/image/abc' } })
        ] });
        inner.textContent = 'Road trip';
        inner.innerText = 'Road trip';
        const card = node({ tag: 'div', attrs: { 'data-testid': 'card' }, children: [inner] });
        // Spotify folds the visible text into the card container.
        card.textContent = 'Road trip';
        card.innerText = 'Road trip';
        cards.push(card);
    }
    const shelf = node({ tag: 'section', children: [shelfTitle, ...cards] });
    const main = node({ tag: 'div', attrs: { id: 'main-view' }, children: [shelf] });
    const widget = node({ tag: 'button', attrs: { 'data-testid': 'user-widget-link' }, text: 'Compte' });
    return { main, widget };
}

// Boots the real shell against a fake page and records every bridge call.
function loadShell({ withCards = true, mediaLib = null, locationPath = '/', searchMediaItemsImpl = null } = {}) {
    const timers = [];
    const navigations = [];
    const { main, widget } = cardPage({ withCards });
    const calls = { ready: 0, data: [], routes: [], mediaLibChecks: 0 };
    const byId = new Map();
    byId.set('#main-view', main);
    byId.set('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]', widget);

    const document = {
        readyState: 'complete',
        documentElement: node({ tag: 'html' }),
        body: node({ tag: 'body' }),
        head: node({ tag: 'head' }),
        title: 'Spotify',
        addEventListener() {},
        querySelector(sel) { return byId.get(sel) || null; },
        querySelectorAll(sel) {
            if (sel === 'iframe') return [];
            return main.querySelectorAll(sel);
        },
        createElement(tag) { return node({ tag }); },
        getElementById() { return null; }
    };

    const win = {
        addEventListener() {}, removeEventListener() {}, dispatchEvent() { return true; },
        setTimeout(fn) { timers.push(fn); return timers.length; },
        clearTimeout(id) { if (id) timers[id - 1] = null; },
        setInterval: () => 0, clearInterval() {},
        requestAnimationFrame: () => 0, cancelAnimationFrame() {},
        location: {
            hostname: 'open.spotify.com',
            href: 'https://open.spotify.com' + locationPath,
            pathname: locationPath, origin: 'https://open.spotify.com', search: '',
            assign(target) { navigations.push(target); },
            replace(target) { navigations.push(target); },
            reload() {}
        },
        navigator: { userAgent: 'Mozilla/5.0', languages: ['fr'], language: 'fr' },
        localStorage: { getItem: () => null, setItem() {}, removeItem() {} },
        sessionStorage: { getItem: () => null, setItem() {}, removeItem() {} },
        document,
        console: { log() {}, warn() {}, error() {}, info() {}, debug() {} },
        MutationObserver: class { observe() {} disconnect() {} },
        matchMedia: () => ({ matches: false, addEventListener() {}, addListener() {} }),
        getComputedStyle: () => ({ getPropertyValue: () => '' }),
        performance: { now: () => 0 },
        Date: { now: () => 1000 },
        URL,
        URLSearchParams,
        TextDecoder,
        TextEncoder,
        alert() {}
    };
    win.window = win;
    document.defaultView = win;

    if (mediaLib) {
        win.mediaLib = mediaLib;
        win.__sfMediaLibStatus = 'ready';
        win.__sfMediaLibError = '';
    } else {
        win.__sfMediaLibStatus = 'loading';
    }
    win.checkMediaLib = () => { calls.mediaLibChecks += 1; };
    if (searchMediaItemsImpl) win.searchMediaItems = searchMediaItemsImpl;
    win.AndBridge = {
        onNativeUiReady() { calls.ready += 1; },
        onNativeUiRoute(screen) { calls.routes.push(screen); },
        onNativeUiData(screen, json) { calls.data.push({ screen, rows: JSON.parse(json) }); },
        logDiagEvent() {},
        getBuildLabel() { return 'test-build'; }
    };

    const context = vm.createContext(win);
    vm.runInContext(fs.readFileSync(SHELL, 'utf8'), context, { timeout: 20000 });
    // Drains the shell's own retry timers, oldest first, bounded so a bug in
    // the retry loop can never hang the suite.
    const drainTimers = (max = 12) => {
        let ran = 0;
        while (timers.length && ran < max) {
            const fn = timers.shift();
            if (fn) { ran += 1; fn(); }
        }
        return ran;
    };
    return { win, calls, drainTimers, navigations };
}

// P0: the native UI must appear even when the page has no row to scrape.
// Before the fix the shell refused the takeover until __sfNativeUiHomeRowsCount
// was >= 1, which left the whole native UI invisible on a slow/empty account.
test('the shell takes over the home screen even with zero scraped rows', () => {
    const { calls, win } = loadShell({ withCards: false });
    assert.equal(calls.ready, 1, 'onNativeUiReady() is called once');
    assert.equal(win.__sfNativeUiReadyNotified, true);
    assert.ok(calls.routes.includes('home'), 'the route is announced');

    const home = calls.data.filter((call) => call.screen === 'home');
    assert.ok(home.length >= 1, 'a home payload is still sent: never a silent blank');
});

// A slow library must not be reported as an empty account, and a real failure
// must be explained in place instead of leaving an eternal loading line.
test('the empty home explains a library failure instead of loading forever', () => {
    const { win, calls, drainTimers } = loadShell({ withCards: false });
    assert.equal(calls.ready, 1, 'the shell took over');

    // Still loading: the native centred line is enough, no card is invented.
    const bootRows = calls.data.filter((c) => c.screen === 'home');
    assert.deepEqual(bootRows[bootRows.length - 1].rows, [], 'no fake row while loading');

    // Spotify answers with a rate-limit: the retry loop must say so.
    win.__sfMediaLibStatus = 'error';
    win.__sfMediaLibError = 'http-429';
    drainTimers(20);

    const after = calls.data.filter((c) => c.screen === 'home');
    const explained = after.find((c) => c.rows.some((r) => r.title === 'Vos playlists ne sont pas disponibles'));
    assert.ok(explained, 'the failure is explained on the screen');
    const row = explained.rows[0];
    assert.match(row.subtitle, /limite les requêtes/, 'the real HTTP cause is named');
    // The state row is never a fake playlist, but it is no longer a dead end:
    // it carries a real native action so the user can retry by hand.
    assert.equal(row.uri, 'melodix:action:retry-library', 'the state row offers a real retry');
    assert.doesNotMatch(row.uri, /:(playlist|album|artist|show|episode):/, 'never a fake playable item');
});

test('real playlists scraped from the page reach the native side with their URI', () => {
    const { calls } = loadShell({ withCards: true });
    const home = calls.data.filter((call) => call.screen === 'home');
    assert.ok(home.length >= 1, 'home data is sent');
    const rows = home[home.length - 1].rows;
    assert.ok(rows.length >= 1, 'at least the scraped card');
    const row = rows.find((r) => r.title === 'Road trip');
    assert.ok(row, 'the real card title arrives');
    assert.equal(row.uri, 'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M', 'the real playlist URI is passed through');
    assert.equal(row.image, 'https://i.scdn.co/image/abc', 'the real artwork is passed through');
});

test('the account library is merged into Home with its real URIs', () => {
    const { calls } = loadShell({
        withCards: true,
        mediaLib: {
            playlists: [
                { id: 'spotify:playlist:lib1', name: 'Ma playlist perso', image: 'https://i.scdn.co/image/lib1' },
                { id: 'spotify:playlist:lib2', name: 'Focus', image: null }
            ],
            albums: [], artists: [], podcasts: []
        }
    });
    const home = calls.data.filter((call) => call.screen === 'home');
    const rows = home[home.length - 1].rows;
    const mine = rows.find((r) => r.title === 'Ma playlist perso');
    assert.ok(mine, 'a library playlist reaches Home');
    assert.equal(mine.uri, 'spotify:playlist:lib1');
    assert.equal(mine.image, 'https://i.scdn.co/image/lib1');
    assert.equal(mine.section, 'Vos playlists');
    const noArt = rows.find((r) => r.title === 'Focus');
    assert.ok(noArt, 'a playlist without artwork is still listed');
    assert.equal(noArt.image, '', 'no artwork is invented');
});

// P0: tapping a playlist must open THAT playlist. The media-items transport
// currently answers "no items" at once, so waiting the six-second safety net
// left the user on a loader for every tap.
test('opening a playlist navigates to it at once instead of waiting six seconds', async () => {
    const { win, navigations, drainTimers } = loadShell({ withCards: true });
    win.__sfMelodixBridgeStarted = true;
    win.fetchMediaItems = async () => [];   // current posture: no items via bridge

    const opened = win.__sfOpenCollection('spotify:playlist:37i9dQZF1DXcBWIGoYBM5M');
    assert.equal(opened, true, 'the shell accepts the open request');
    // Let the transport's promise settle.
    await new Promise((resolve) => setTimeout(resolve, 5));

    assert.deepEqual(navigations, ['https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M'],
        'the real playlist page is opened immediately, with the exact id');
    assert.equal(drainTimers(2), 0, 'the six-second timer is cleared, not left running');
});

test('a silent media transport still falls back to the real page', () => {
    const { win, navigations, drainTimers } = loadShell({ withCards: true });
    win.__sfMelodixBridgeStarted = true;
    win.fetchMediaItems = () => undefined;   // never answers

    win.__sfOpenCollection('spotify:playlist:silent');
    assert.deepEqual(navigations, [], 'nothing happens while the transport is silent');
    drainTimers(2);
    assert.deepEqual(navigations, ['https://open.spotify.com/playlist/silent'],
        'the safety net still opens the page');
});

// P1 navigation: the Library tab and its chips must reach a real page. They
// used to call the no-op transport and return, so the tap did nothing at all.
test('the library tab opens the real playlists page with an empty transport', async () => {
    const { win, navigations } = loadShell({ withCards: true, locationPath: '/' });
    win.__sfMelodixBridgeStarted = true;
    win.fetchMediaItems = async () => [];

    win.__sfOpenLibrary();
    await new Promise((resolve) => setTimeout(resolve, 5));
    assert.deepEqual(navigations, ['https://open.spotify.com/collection/playlists'],
        'the playlists collection page is really opened');
});

test('each library chip opens its own collection page', async () => {
    for (const [tag, expected] of [
        ['albums', 'https://open.spotify.com/collection/albums'],
        ['artists', 'https://open.spotify.com/collection/artists'],
        ['podcasts', 'https://open.spotify.com/collection/podcasts']
    ]) {
        const { win, navigations } = loadShell({ withCards: true });
        win.__sfMelodixBridgeStarted = true;
        win.fetchMediaItems = async () => [];
        win.__sfOpenLibraryCategory(tag);
        await new Promise((resolve) => setTimeout(resolve, 5));
        assert.deepEqual(navigations, [expected], `chip ${tag} reaches its page`);
    }
});

test('the library tab does not reload the page already shown', () => {
    const { win, navigations } = loadShell({ withCards: true, locationPath: '/collection/playlists' });
    win.__sfOpenLibrary();
    assert.deepEqual(navigations, [], 'no useless reload of the page already open');
});

// P1 search: the bridge publishes searchMediaItems() that answers "no items"
// in the current posture. Live typing and submit must still reach Spotify's
// own search page, otherwise the whole search screen is dead.
test('live typing falls back to the real search page when the bridge answers empty', async () => {
    const { win, navigations, drainTimers } = loadShell({
        withCards: true,
        searchMediaItemsImpl: async () => []
    });
    win.searchMediaItems('jazz funk');
    await new Promise((resolve) => setTimeout(resolve, 5));
    assert.deepEqual(navigations, [], 'debounced: nothing leaves before the delay');
    drainTimers(2);
    assert.deepEqual(navigations, ['https://open.spotify.com/search/jazz%20funk'],
        'the real search page opens after the debounce');
});

test('submitting the native search field navigates immediately', () => {
    const { win, navigations } = loadShell({
        withCards: true,
        searchMediaItemsImpl: () => []
    });
    assert.equal(typeof win.__sfSubmitSearch, 'function', 'submit hook always exists');
    win.__sfSubmitSearch('Radiohead');
    assert.deepEqual(navigations, ['https://open.spotify.com/search/Radiohead'],
        'submit does not wait for the live-typing debounce');
});

test('real bridge results are kept and no navigation happens', async () => {
    const { win, navigations, drainTimers } = loadShell({
        withCards: true,
        searchMediaItemsImpl: async () => [{ title: 'Creep' }]
    });
    const items = await win.searchMediaItems('creep');
    assert.equal(items.length, 1, 'the bridge answer is returned unchanged');
    drainTimers(2);
    assert.deepEqual(navigations, [], 'a real result never reloads the page');
});

test('without any bridge search function typing still reaches the search page', () => {
    const { win, navigations, drainTimers } = loadShell({ withCards: true });
    assert.equal(typeof win.__sfSubmitSearch, 'function');
    win.searchMediaItems('daft punk');
    drainTimers(2);
    assert.deepEqual(navigations, ['https://open.spotify.com/search/daft%20punk']);
});

// P0-E: the retry behind the state row must really restart the fetch and the
// loop, otherwise the card is decorative.
test('the manual retry behind the state row restarts the library fetch', () => {
    const { win, drainTimers } = loadShell({ withCards: false });
    let calls = 0;
    win.checkMediaLib = (force) => { calls += 1; if (force !== true) throw new Error('must force'); };
    assert.equal(typeof win.__sfNativeRetryLibrary, 'function', 'the hook exists for the native row');
    win.__sfNativeRetryLibrary();
    assert.equal(calls, 1, 'the library fetch is forced exactly once');
    drainTimers(4);
});

// P0-D: the same real playlist can arrive twice - once scraped from the page
// and once from the account library, with two URI spellings. The merge must
// keep exactly one row, and it must be the library one (richer subtitle).
test('the same playlist from the page and the library is merged once', () => {
    const { calls } = loadShell({
        withCards: true,
        mediaLib: {
            playlists: [
                { id: 'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M', name: 'Road trip', image: 'https://i.scdn.co/image/abc' }
            ]
        }
    });
    const home = calls.data.filter((call) => call.screen === 'home');
    const rows = home[home.length - 1].rows;
    const roadTrip = rows.filter((row) => row.title === 'Road trip');
    assert.equal(roadTrip.length, 1, 'une seule ligne pour une meme playlist');
    assert.equal(roadTrip[0].uri, 'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M', 'URI canonique unique');
    const uris = rows.map((row) => row.uri);
    assert.equal(new Set(uris).size, uris.length, 'aucune URI dupliquee dans le payload');
});

// P1 navigation: when the account library is already in memory, the Library
// tab must render it immediately. It used to reload the whole Spotify page
// even though every playlist was already known - a slow, wasteful navigation
// that also lost the user's scroll position.
test('the library tab renders the known library without reloading the page', () => {
    const { win, calls, navigations } = loadShell({
        withCards: false,
        mediaLib: {
            playlists: [
                { id: 'spotify:playlist:lib1', name: 'Mes favoris', image: 'https://i.scdn.co/image/lib1' },
                { id: 'https://open.spotify.com/playlist/lib2', name: 'Week-end', image: 'https://i.scdn.co/image/lib2' }
            ]
        }
    });
    const ok = win.__sfOpenLibrary();
    assert.equal(ok, true, 'the tap is handled immediately');
    assert.deepEqual(navigations, [], 'aucun rechargement de page');
    const media = calls.data.filter((call) => call.screen === 'media:playlists');
    assert.ok(media.length >= 1, 'the library rows are sent to the native list');
    const rows = media[media.length - 1].rows;
    assert.deepEqual(Array.from(rows, (row) => row.title), ['Mes favoris', 'Week-end']);
    assert.deepEqual(Array.from(rows, (row) => row.uri),
        ['spotify:playlist:lib1', 'spotify:playlist:lib2'],
        'les URI reelles sont normalisees');
    assert.ok(rows.every((row) => row.section === 'Vos playlists'), 'la section est renseignee');
});

test('a library chip also renders its known rows before navigating', () => {
    const { win, calls, navigations } = loadShell({
        withCards: false,
        mediaLib: {
            albums: [{ id: 'spotify:album:alb1', name: 'Album enregistre' }]
        }
    });
    win.__sfOpenLibraryCategory('albums');
    assert.deepEqual(navigations, [], 'pas de navigation quand les donnees sont deja la');
    const media = calls.data.filter((call) => call.screen === 'media:albums');
    assert.ok(media.length >= 1, 'les albums connus sont peints');
    assert.equal(media[media.length - 1].rows[0].title, 'Album enregistre');
});

test('an empty category still navigates to its real page', async () => {
    const { win, navigations } = loadShell({ withCards: true, mediaLib: { playlists: [] } });
    win.fetchMediaItems = async () => [];
    win.__sfOpenLibraryCategory('albums');
    await new Promise((resolve) => setTimeout(resolve, 5));
    assert.deepEqual(navigations, ['https://open.spotify.com/collection/albums'],
        'le repli reel reste la navigation');
});
