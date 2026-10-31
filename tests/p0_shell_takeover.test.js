// Real behaviour tests for the readable native-UI shell source.
//
// The shell is an IIFE that boots on load: it scrapes the Spotify page, sends
// rows to the native side and decides when the native UI may take over. These
// tests run the REAL file in a vm sandbox with a fake Spotify DOM and observe
// every callback. Mocks live only here; production never sees them.

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const SHELL = path.join(repo, 'scripts/native_ui_shell.source.js');

// Minimal DOM node. `matches` understands only the selectors the shell uses.
function node({ tag = 'div', attrs = {}, text = '', children = [], within = null } = {}) {
    const el = {
        tagName: tag.toUpperCase(),
        children,
        parentNode: within,
        parentElement: within,
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
    children.forEach((child) => { child.parentNode = el; child.parentElement = el; });
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

function cardPage({ withCards = true, rootMode = 'legacy' } = {}) {
    const shelfTitle = node({ tag: 'h2', text: 'Vos playlists' });
    const cards = [];
    if (withCards) {
        const inner = node({ tag: 'a', attrs: { href: '/playlist/37i9dQZF1DXcBWIGoYBM5M' }, children: [
            node({ tag: 'img', attrs: { src: 'https://i.scdn.co/image/abc' } })
        ] });
        inner.textContent = 'Road trip';
        inner.innerText = 'Road trip';
        const card = node({ tag: 'div', attrs: { 'data-testid': 'card' }, children: [inner] });
        card.textContent = 'Road trip';
        card.innerText = 'Road trip';
        cards.push(card);
    }
    const shelf = node({ tag: 'section', children: [shelfTitle, ...cards] });
    const root = rootMode === 'semantic'
        ? node({ tag: 'main', attrs: { 'data-testid': 'home-page' }, children: [shelf] })
        : rootMode === 'fallback'
            ? node({ tag: 'div', children: [shelf] })
            : node({ tag: 'div', attrs: { id: 'main-view' }, children: [shelf] });
    const widget = node({ tag: 'button', attrs: { 'data-testid': 'user-widget-link' }, text: 'Compte' });
    return { main: root, widget, rootMode };
}

// Boots the real shell against a fake page and records every bridge call.
function loadShell({ withCards = true, mediaLib = null, locationPath = '/', searchMediaItemsImpl = null, noUserWidget = false, bridgeMode = 'complete', rootMode = 'legacy' } = {}) {
    const timers = [];
    const navigations = [];
    const webLoads = [];
    const observerCallbacks = [];
    let fakeNow = 1000;
    const { main, widget } = cardPage({ withCards, rootMode });
    const calls = { ready: 0, data: [], routes: [], mediaLibChecks: 0, order: [], traces: [] };
    const byId = new Map();
    if (rootMode === 'legacy') byId.set('#main-view', main);
    if (rootMode === 'semantic') byId.set('[data-testid="home-page"]', main);
    if (!noUserWidget) {
        byId.set('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]', widget);
    }

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
        __sfTriggerMutations() {
            fakeNow += 250;
            observerCallbacks.forEach((callback) => callback([]));
        },
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
        MutationObserver: class {
            constructor(callback) { this.callback = callback; }
            observe() { observerCallbacks.push(this.callback); }
            disconnect() {}
        },
        matchMedia: () => ({ matches: false, addEventListener() {}, addListener() {} }),
        getComputedStyle: () => ({ getPropertyValue: () => '' }),
        performance: { now: () => 0 },
        Date: { now: () => fakeNow },
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
    const bridge = {};
    if (bridgeMode === 'complete' || bridgeMode === 'no-ready' || bridgeMode === 'no-data' || bridgeMode === 'no-route' || bridgeMode === 'throw-data') {
        if (bridgeMode !== 'no-ready') bridge.onNativeUiReady = () => { calls.ready += 1; calls.order.push('ready'); };
        if (bridgeMode !== 'no-route') bridge.onNativeUiRoute = (screen) => {
            calls.routes.push(screen);
            calls.order.push('route:' + screen);
        };
        if (bridgeMode !== 'no-data') bridge.onNativeUiData = (screen, json) => {
            calls.order.push('data:' + screen);
            if (bridgeMode === 'throw-data') throw new Error('native callback failed');
            calls.data.push({ screen, rows: JSON.parse(json) });
        };
        bridge.logDiagEvent = (line) => calls.traces.push(String(line));
        bridge.getBuildLabel = () => 'test-build';
        bridge.loadWebPlayerUrl = (url) => webLoads.push(url);
        win.AndBridge = bridge;
    } else if (bridgeMode === 'absent') {
        delete win.AndBridge;
    }

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
    const appendCard = ({ id, title, type = 'playlist' }) => {
        const anchor = node({ tag: 'a', attrs: { href: `/${type}/${id}` } });
        anchor.textContent = title;
        anchor.innerText = title;
        const card = node({ tag: 'div', attrs: { 'data-testid': 'card' }, children: [anchor] });
        card.textContent = title;
        card.innerText = title;
        const shelf = main.children[0];
        shelf.children.push(card);
        card.parentNode = shelf;
        card.parentElement = shelf;
        return card;
    };
    return { win, calls, drainTimers, navigations, webLoads, main, appendCard };
}

// P0: an empty/loading/error payload is not proof of a native replacement.
// Spotify remains the visible fallback until at least one real card is sent.
test('an empty Home never triggers native takeover or claims readiness', () => {
    const { calls, win } = loadShell({ withCards: false });
    assert.equal(calls.ready, 0, 'onNativeUiReady() is withheld without a real card');
    assert.notEqual(win.__sfNativeUiReadyNotified, true);
    assert.equal(win.__sfNativeUiHomeRowsCount, 0);
    assert.equal(win.__sfNativeUiSessionProven, true);
    assert.equal(win.__sfNativeUiBridgeCallbacksReady, true);
    assert.ok(calls.routes.includes('home'), 'the route is queued without covering Spotify');
    assert.ok(calls.data.some((call) => call.screen === 'home' && call.rows.length === 0));
    assert.ok(calls.traces.some((line) => line.includes('action=keep-spotify-visible')));
});

// A library failure remains diagnosable, but status/action rows cannot satisfy
// the real-card gate.
test('an error/status row never counts as a real Home replacement', () => {
    const { win, calls, drainTimers } = loadShell({ withCards: false });
    win.__sfMediaLibStatus = 'error';
    win.__sfMediaLibError = 'http-429';
    drainTimers(20);

    const statusPayload = calls.data.filter((call) => call.screen === 'home')
        .find((call) => call.rows.some((row) => row.title === 'Vos playlists ne sont pas disponibles'));
    assert.ok(statusPayload, 'the underlying library failure remains diagnosable');
    assert.match(statusPayload.rows[0].subtitle, /limite les requêtes/);
    assert.equal(calls.ready, 0, 'a diagnostic/action row cannot make the native shell ready');
    assert.notEqual(win.__sfNativeUiReadyNotified, true);
});

test('native Home finds semantic roots and bounded real-link fallbacks without #main-view', () => {
    const semantic = loadShell({ rootMode: 'semantic' });
    assert.equal(semantic.win.__sfNativeUiContentRootSelector, '[data-testid="home-page"]');
    assert.equal(semantic.win.__sfNativeUiHomeDomRowsCount, 1);
    assert.equal(semantic.calls.ready, 1);
    assert.equal(semantic.calls.data.find((call) => call.screen === 'home').rows[0].uri,
        'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M');

    const fallback = loadShell({ rootMode: 'fallback' });
    assert.match(fallback.win.__sfNativeUiContentRootSelector, /^fallback:/);
    assert.equal(fallback.win.__sfNativeUiHomeDomRowsCount, 1);
    assert.equal(fallback.calls.ready, 1);
    assert.equal(fallback.calls.data.find((call) => call.screen === 'home').rows[0].title, 'Road trip');
    assert.ok(fallback.calls.traces.some((line) => line.includes('root=fallback:') && line.includes('resources=1')),
        'the bounded selected root and its real Spotify links are diagnosable');

    const empty = loadShell({ withCards: false, rootMode: 'fallback' });
    assert.equal(empty.win.__sfNativeUiContentRootSelector, 'none');
    assert.equal(empty.calls.ready, 0, 'an empty fallback never proves that a replacement is ready');
    assert.ok(!empty.win.__sfNativeUiHomeRowsCount || empty.win.__sfNativeUiHomeRowsCount === 0,
        'no DOM row count is fabricated when no content root exists');
});

test('real Home data is queued after its route and before the readiness callback', () => {
    const { calls, win } = loadShell({ withCards: true });
    const routeIndex = calls.order.indexOf('route:home');
    const homeDataIndex = calls.order.indexOf('data:home');
    const readyIndex = calls.order.indexOf('ready');
    assert.ok(routeIndex >= 0 && homeDataIndex > routeIndex && readyIndex > homeDataIndex,
        `expected route -> Home data -> ready, saw ${calls.order.join(' / ')}`);
    assert.equal(win.__sfNativeUiHomeRowsCount, 1);
    assert.equal(win.__sfNativeUiHomeDataSent, true);
    assert.equal(calls.ready, 1);
});

test('delayed real Spotify cards unblock readiness without an empty takeover', () => {
    const { calls, win, appendCard } = loadShell({ withCards: false });
    assert.equal(calls.ready, 0);
    assert.equal(win.__sfNativeUiReadyNotified, undefined);

    appendCard({ id: 'late-playlist', title: 'Vraie playlist tardive' });
    win.__sfTriggerMutations();

    assert.equal(calls.ready, 1, 'readiness resumes after the late row is collected and sent');
    assert.equal(win.__sfNativeUiHomeRowsCount, 1);
    const order = calls.order;
    const lastRoute = order.lastIndexOf('route:home');
    const lastHomeData = order.lastIndexOf('data:home');
    const ready = order.lastIndexOf('ready');
    assert.ok(lastRoute >= 0 && lastHomeData > lastRoute && ready > lastHomeData,
        `late data must still follow route and precede ready: ${order.join(' / ')}`);
});

test('absent, incomplete, or throwing bridge callbacks never claim native readiness', () => {
    for (const bridgeMode of ['absent', 'no-ready', 'no-data', 'no-route', 'throw-data']) {
        const { calls, win } = loadShell({ withCards: true, bridgeMode });
        assert.equal(calls.ready, 0, `${bridgeMode}: no ready callback`);
        assert.notEqual(win.__sfNativeUiReadyNotified, true, `${bridgeMode}: readiness stays false`);
        assert.equal(win.__sfNativeUiSessionProven, true, `${bridgeMode}: the session proof is visible`);
        assert.equal(win.__sfNativeUiBridgeCallbacksReady, bridgeMode === 'throw-data',
            `${bridgeMode}: callback availability is reported independently of callback success`);
        if (bridgeMode !== 'absent') {
            assert.ok(calls.traces.concat([win.__sfDiagTraceLast || '']).some((line) => line.includes('ready-pending')),
                `${bridgeMode}: diagnostic names the pending handoff`);
        } else {
            assert.equal(win.AndBridge, undefined, 'the absent native bridge itself prevents any takeover');
        }
    }
});

test('route changes are dispatched before fresh Home data is resent', () => {
    const { calls, win } = loadShell({ withCards: true });
    const initialHomeCount = calls.data.filter((call) => call.screen === 'home').length;
    assert.equal(initialHomeCount, 1);

    win.location.pathname = '/search/jazz';
    win.location.href = 'https://open.spotify.com/search/jazz';
    win.__sfTriggerMutations();
    assert.equal(calls.routes[calls.routes.length - 1], 'search');

    win.location.pathname = '/home';
    win.location.href = 'https://open.spotify.com/home';
    win.__sfTriggerMutations();
    const homeOrder = calls.order.slice(calls.order.lastIndexOf('route:home'));
    const homeData = homeOrder.indexOf('data:home');
    assert.ok(homeData > 0, `Home route must be queued before its refreshed data: ${homeOrder.join(' / ')}`);
    assert.equal(calls.data.filter((call) => call.screen === 'home').length, 2,
        'the previous screen cannot leave stale Home content hidden behind the native shell');
});

// Existing functional regressions: real library/search/navigation behavior is
// exercised by the rest of this file and the full test suite.

test('the library tab opens the real playlists page with an empty transport', async () => {
    const { win, navigations, webLoads } = loadShell({ withCards: true, locationPath: '/' });
    win.__sfMelodixBridgeStarted = true;
    win.fetchMediaItems = async () => [];

    win.__sfOpenLibrary();
    await new Promise((resolve) => setTimeout(resolve, 5));
    assert.deepEqual(webLoads, ['https://open.spotify.com/collection/playlists'],
        'the playlists collection page is really opened');
    assert.deepEqual(navigations, [], 'the library route stays in the app WebView');
});

test('each library chip opens its own collection page', async () => {
    for (const [tag, expected] of [
        ['albums', 'https://open.spotify.com/collection/albums'],
        ['artists', 'https://open.spotify.com/collection/artists'],
        ['podcasts', 'https://open.spotify.com/collection/podcasts']
    ]) {
        const { win, navigations, webLoads } = loadShell({ withCards: true });
        win.__sfMelodixBridgeStarted = true;
        win.fetchMediaItems = async () => [];
        win.__sfOpenLibraryCategory(tag);
        await new Promise((resolve) => setTimeout(resolve, 5));
        assert.deepEqual(webLoads, [expected], `chip ${tag} reaches its page`);
        assert.deepEqual(navigations, [], `chip ${tag} does not open Spotify externally`);
    }
});

test('the library tab does not reload the page already shown', () => {
    const { win, navigations, webLoads } = loadShell({ withCards: true, locationPath: '/collection/playlists' });
    win.__sfOpenLibrary();
    assert.deepEqual(webLoads, [], 'no useless reload of the page already open');
    assert.deepEqual(navigations, [], 'no external navigation occurs');
});

// P1 search: the bridge publishes searchMediaItems() that answers "no items"
// in the current posture. Live typing and submit must still reach Spotify's
// own search page, otherwise the whole search screen is dead.
test('live typing falls back to the real search page when the bridge answers empty', async () => {
    const { win, navigations, webLoads, drainTimers } = loadShell({
        withCards: true,
        searchMediaItemsImpl: async () => []
    });
    win.searchMediaItems('jazz funk');
    await new Promise((resolve) => setTimeout(resolve, 5));
    assert.deepEqual(navigations, [], 'debounced: nothing leaves before the delay');
    drainTimers(2);
    assert.deepEqual(webLoads, ['https://open.spotify.com/search/jazz%20funk'],
        'the real search page opens after the debounce');
    assert.deepEqual(navigations, [], 'search remains in the app WebView');
});

test('submitting the native search field navigates immediately', () => {
    const { win, navigations, webLoads } = loadShell({
        withCards: true,
        searchMediaItemsImpl: () => []
    });
    assert.equal(typeof win.__sfSubmitSearch, 'function', 'submit hook always exists');
    win.__sfSubmitSearch('Radiohead');
    assert.deepEqual(webLoads, ['https://open.spotify.com/search/Radiohead'],
        'submit does not wait for the live-typing debounce');
    assert.deepEqual(navigations, [], 'search submission does not open an external app');
});

test('real bridge results are kept and no navigation happens', async () => {
    const { win, navigations, webLoads, drainTimers } = loadShell({
        withCards: true,
        searchMediaItemsImpl: async () => [{ title: 'Creep' }]
    });
    const items = await win.searchMediaItems('creep');
    assert.equal(items.length, 1, 'the bridge answer is returned unchanged');
    drainTimers(2);
    assert.deepEqual(webLoads, [], 'a real result never reloads the page');
    assert.deepEqual(navigations, [], 'a real result never opens an external app');
});

test('without any bridge search function typing still reaches the search page', () => {
    const { win, navigations, webLoads, drainTimers } = loadShell({ withCards: true });
    assert.equal(typeof win.__sfSubmitSearch, 'function');
    win.searchMediaItems('daft punk');
    drainTimers(2);
    assert.deepEqual(webLoads, ['https://open.spotify.com/search/daft%20punk']);
    assert.deepEqual(navigations, [], 'fallback search stays inside the app WebView');
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
    const { win, calls, navigations, webLoads } = loadShell({
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
    assert.deepEqual(webLoads, [], 'aucun rechargement de page');
    assert.deepEqual(navigations, [], 'aucune application externe n’est ouverte');
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
    const { win, calls, navigations, webLoads } = loadShell({
        withCards: false,
        mediaLib: {
            albums: [{ id: 'spotify:album:alb1', name: 'Album enregistre' }]
        }
    });
    win.__sfOpenLibraryCategory('albums');
    assert.deepEqual(webLoads, [], 'pas de navigation quand les donnees sont deja la');
    assert.deepEqual(navigations, [], 'aucune application externe n’est ouverte');
    const media = calls.data.filter((call) => call.screen === 'media:albums');
    assert.ok(media.length >= 1, 'les albums connus sont peints');
    assert.equal(media[media.length - 1].rows[0].title, 'Album enregistre');
});

test('an empty category still navigates to its real page', async () => {
    const { win, navigations, webLoads } = loadShell({ withCards: true, mediaLib: { playlists: [] } });
    win.fetchMediaItems = async () => [];
    win.__sfOpenLibraryCategory('albums');
    await new Promise((resolve) => setTimeout(resolve, 5));
    assert.deepEqual(webLoads, ['https://open.spotify.com/collection/albums'],
        'le repli reel reste la navigation');
    assert.deepEqual(navigations, [], 'la navigation reste dans le WebView de l’app');
});

// P0-A: either the account widget or a real library fetch proves the signed-in
// session. The latter can also provide real cards for the native replacement.
test('a real library proves the session and contributes a real Home card', () => {
    const { calls } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [{ id: 'spotify:playlist:p1', name: 'Vraie playlist' }] }
    });
    assert.equal(calls.ready, 1, 'la page compte et la vraie carte rendent le takeover sûr');
});

test('a real Home card without a profile control unlocks Home but does not claim login', () => {
    const { calls, win } = loadShell({
        withCards: true,
        noUserWidget: true,
        rootMode: 'fallback'
    });
    assert.match(win.__sfNativeUiContentRootSelector, /^fallback:/,
        'the real card is found even though #main-view and the profile control are absent');
    assert.equal(win.__sfNativeUiHomeRowsCount, 1);
    assert.equal(win.__sfNativeUiHomeDataSent, true);
    assert.equal(win.__sfNativeUiSessionProven, false,
        'public Home content is not misreported as an authenticated Spotify session');
    assert.equal(win.__sfNativeUiHomeContentProven, true);
    assert.equal(win.__sfNativeUiTakeoverProven, true);
    assert.equal(calls.ready, 1, 'native Home may render the actual Spotify card');
    assert.ok(calls.traces.some((line) => line.includes('ready by real Home card') &&
        line.includes('session unconfirmed')));
});

test('without the account control, library, or real Home card, nothing is covered', () => {
    const { calls, win } = loadShell({ withCards: false, noUserWidget: true });
    assert.equal(calls.ready, 0, 'aucune preuve de session ni carte: la page Spotify reste visible');
    assert.notEqual(win.__sfNativeUiReadyNotified, true);
});

test('a Home card is not a session proof for other routes', () => {
    const { calls, win } = loadShell({
        withCards: true,
        noUserWidget: true,
        locationPath: '/search',
        rootMode: 'fallback'
    });
    assert.equal(win.__sfNativeUiHomeContentProven, false);
    assert.equal(calls.ready, 0, 'a non-Home route still requires the existing session proof');
});


// Restored legacy regression tests: Home merge, direct playlist navigation, and player fallback.
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
    const { win, navigations, webLoads, drainTimers } = loadShell({ withCards: true });
    win.__sfMelodixBridgeStarted = true;
    win.fetchMediaItems = async () => [];   // current posture: no items via bridge

    const opened = win.__sfOpenCollection('spotify:playlist:37i9dQZF1DXcBWIGoYBM5M');
    assert.equal(opened, true, 'the shell accepts the open request');
    // Let the transport's promise settle.
    await new Promise((resolve) => setTimeout(resolve, 5));

    assert.deepEqual(webLoads, ['https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M'],
        'the real playlist page is opened immediately, with the exact id');
    assert.deepEqual(navigations, [], 'playlist recovery does not open Spotify externally');
    assert.equal(drainTimers(2), 0, 'the six-second timer is cleared, not left running');
});

test('a silent media transport still falls back to the real page', () => {
    const { win, navigations, webLoads, drainTimers } = loadShell({ withCards: true });
    win.__sfMelodixBridgeStarted = true;
    win.fetchMediaItems = () => undefined;   // never answers

    win.__sfOpenCollection('spotify:playlist:silent');
    assert.deepEqual(webLoads, [], 'nothing happens while the transport is silent');
    assert.deepEqual(navigations, [], 'nothing is launched externally while the transport is silent');
    drainTimers(2);
    assert.deepEqual(webLoads, ['https://open.spotify.com/playlist/silent'],
        'the safety net still opens the page');
    assert.deepEqual(navigations, [], 'the native safety net does not open Spotify externally');
});

// P1 navigation: the Library tab and its chips must reach a real page. They
// used to call the no-op transport and return, so the tap did nothing at all.
