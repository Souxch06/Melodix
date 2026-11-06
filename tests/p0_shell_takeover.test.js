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

function cardPage({
    withCards = true,
    rootMode = 'legacy',
    profileWidgetMode = 'testid',
    resourceHref = '/playlist/37i9dQZF1DXcBWIGoYBM5M',
    resourceTitle = 'Road trip'
} = {}) {
    const shelfTitle = node({ tag: 'h2', text: 'Vos playlists' });
    const cards = [];
    if (withCards) {
        const inner = node({ tag: 'a', attrs: { href: resourceHref }, children: [
            node({ tag: 'img', attrs: { src: 'https://i.scdn.co/image/abc' } })
        ] });
        inner.textContent = resourceTitle;
        inner.innerText = resourceTitle;
        const card = node({ tag: 'div', attrs: { 'data-testid': 'card' }, children: [inner] });
        card.textContent = resourceTitle;
        card.innerText = resourceTitle;
        cards.push(card);
    }
    const shelf = node({ tag: 'section', children: [shelfTitle, ...cards] });
    const root = rootMode === 'semantic'
        ? node({ tag: 'main', attrs: { 'data-testid': 'home-page' }, children: [shelf] })
        : rootMode === 'fallback'
            ? node({ tag: 'div', children: [shelf] })
            : node({ tag: 'div', attrs: { id: 'main-view' }, children: [shelf] });
    const widget = profileWidgetMode === 'class'
        ? node({ tag: 'div', attrs: { class: 'main-userWidget-box' }, text: 'Compte' })
        : node({ tag: 'button', attrs: { 'data-testid': 'user-widget-link' }, text: 'Compte' });
    return { main: root, widget, rootMode, profileWidgetMode };
}

// Boots the real shell against a fake page and records every bridge call.
function loadShell({ withCards = true, mediaLib = null, mediaLibSessionProofKnown = true, mediaLibSessionProven = true, rawItemCount = 0, libraryError = '', libraryDiagnostic = null, locationPath = '/', hostname = 'open.spotify.com', searchMediaItemsImpl = null, noUserWidget = false, authUiState = 'connected', authEpoch = 1, lastAuthAttemptEpoch = null, profileWidgetMode = 'testid', resourceHref = '/playlist/37i9dQZF1DXcBWIGoYBM5M', resourceTitle = 'Road trip', bridgeMode = 'complete', rootMode = 'legacy', throwOnWindowEvent = '' } = {}) {
    const timers = [];
    const navigations = [];
    const webLoads = [];
    const observerCallbacks = [];
    let fakeNow = 1000;
    const { main, widget } = cardPage({
        withCards,
        rootMode,
        profileWidgetMode,
        resourceHref,
        resourceTitle
    });
    const calls = { ready: 0, data: [], routes: [], mediaLibChecks: 0, mediaLibCheckArgs: [], order: [], traces: [] };
    const eventListeners = { window: new Map(), document: new Map() };
    let vmWindow = null;
    const addListener = (target, type, fn) => {
        const bucket = eventListeners[target];
        if (!bucket.has(type)) bucket.set(type, []);
        bucket.get(type).push(fn);
    };
    const dispatch = (target, type, fields = {}) => {
        const bucket = eventListeners[target].get(type) || [];
        const eventTarget = target === 'window' ? (vmWindow || win) : document;
        const event = Object.assign({ type, target: eventTarget }, fields || {});
        bucket.slice().forEach((fn) => fn(event));
    };
    const byId = new Map();
    if (rootMode === 'legacy') byId.set('#main-view', main);
    if (rootMode === 'semantic') byId.set('[data-testid="home-page"]', main);
    if (!noUserWidget) {
        // MEL-BUG-029: the shell's profile selector now also accepts /user/ links.
        byId.set(
            'button[data-testid="user-widget-link"], a[data-testid="user-widget-link"], .main-userWidget-box',
            widget
        );
        byId.set(
            'button[data-testid="user-widget-link"], a[data-testid="user-widget-link"], .main-userWidget-box, a[href^="/user/"]',
            widget
        );
    }

    const document = {
        readyState: 'complete',
        visibilityState: 'visible',
        documentElement: node({ tag: 'html' }),
        body: node({ tag: 'body' }),
        head: node({ tag: 'head' }),
        title: 'Spotify',
        addEventListener(type, fn) { addListener('document', type, fn); },
        querySelector(sel) { return byId.get(sel) || null; },
        querySelectorAll(sel) {
            if (sel === 'iframe') return [];
            return main.querySelectorAll(sel);
        },
        createElement(tag) { return node({ tag }); },
        getElementById() { return null; }
    };

    const win = {
        addEventListener(type, fn) {
            if (throwOnWindowEvent && type === throwOnWindowEvent) {
                throw Object.assign(new Error('private shell installation fixture'), { name: 'TypeError' });
            }
            addListener('window', type, fn);
        },
        removeEventListener() {}, dispatchEvent() { return true; },
        __sfTriggerMutations() {
            fakeNow += 250;
            observerCallbacks.forEach((callback) => callback([]));
        },
        setTimeout(fn) { timers.push(fn); return timers.length; },
        clearTimeout(id) { if (id) timers[id - 1] = null; },
        setInterval: () => 0, clearInterval() {},
        requestAnimationFrame: () => 0, cancelAnimationFrame() {},
        location: {
            hostname,
            href: 'https://' + hostname + locationPath,
            pathname: locationPath, origin: 'https://' + hostname, search: '',
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
        win.__sfMediaLibStatus = libraryError ? 'error' : 'ready';
        win.__sfMediaLibError = libraryError;
    } else {
        win.__sfMediaLibStatus = 'loading';
    }
    win.__sfMediaLibSessionProofKnown = mediaLibSessionProofKnown;
    win.__sfMediaLibSessionProven = mediaLibSessionProven;
    win.__sfMediaLibRawItemCount = rawItemCount;
    // Player UI authentication is a distinct test signal from libraryV3 proof.
    win.__sfSpotifyAuthUiState = authUiState;
    win.__sfSpotifyAuthEpoch = authEpoch;
    win.__sfMediaLibProofAuthEpoch = mediaLibSessionProven ? authEpoch : 0;
    win.__sfMediaLibLastAuthAttemptEpoch = lastAuthAttemptEpoch === null
        ? (libraryError === 'http-401' || libraryError === 'http-403' ? authEpoch : 0)
        : lastAuthAttemptEpoch;
    if (libraryDiagnostic) win.__sfMediaLibLastDiagnostic = libraryDiagnostic;
    win.checkMediaLib = (...args) => {
        calls.mediaLibChecks += 1;
        calls.mediaLibCheckArgs.push(args);
    };
    if (searchMediaItemsImpl) win.searchMediaItems = searchMediaItemsImpl;
    const diagnosticSessionId = '1a2b3c4d';
    const bridge = {
        getDiagnosticSessionId: () => diagnosticSessionId
    };
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
        bridge.logDiagEvent = (line) => calls.traces.push(`sid=${diagnosticSessionId} ${String(line)}`);
        bridge.getBuildLabel = () => 'test-build';
        bridge.loadWebPlayerUrl = (url) => webLoads.push(url);
        win.AndBridge = bridge;
    } else if (bridgeMode === 'absent') {
        delete win.AndBridge;
    }

    const context = vm.createContext(win);
    vmWindow = vm.runInContext('window', context);
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
    return {
        win, calls, drainTimers, navigations, webLoads, main, appendCard,
        dispatchWindow: (type, fields) => dispatch('window', type, fields),
        dispatchDocument: (type, fields) => dispatch('document', type, fields)
    };
}

test('global JavaScript and resource errors retain only bounded attribution and numeric positions', () => {
    const { win, calls, dispatchWindow } = loadShell();
    const privateUrl = 'https://private.invalid/script.js?token=fixture';
    const privateMessage = 'private error text';

    dispatchWindow('error', {
        error: { name: 'TypeError', message: privateMessage },
        filename: privateUrl,
        lineno: 17,
        colno: 8
    });
    dispatchWindow('error', {
        target: node({ tag: 'script', attrs: { src: privateUrl } }),
        error: null,
        filename: privateUrl
    });

    assert.equal(win.__sfNativeUiShellErrors, 2);
    assert.deepEqual({
        window: win.__sfNativeUiShellErrorSources['window-js'],
        script: win.__sfNativeUiShellErrorSources['resource-script']
    }, { window: 1, script: 1 });
    assert.deepEqual(JSON.parse(JSON.stringify(win.__sfNativeUiShellErrorDetails)), [
        {
            script: 'external', source: 'window-js', phase: 'uncaught', type: 'TypeError', name: 'TypeError',
            callback: 'unknown', line: 17, column: 8, route: 'home', renderCycle: 1, lastRenderCycle: 1, repeatCount: 1
        },
        {
            script: 'external', source: 'resource-script', phase: 'resource-load', type: 'unknown', name: 'unknown',
            callback: 'unknown', line: null, column: null, route: 'home', renderCycle: 1, lastRenderCycle: 1, repeatCount: 1
        }
    ]);
    assert.match(calls.traces.join('\n'), /js-error script=external source=window-js phase=uncaught type=TypeError callback=unknown line=17 column=8 route=home cycle=1 repeats=1/);
    assert.doesNotMatch(calls.traces.join('\n'), /private\.invalid|token=fixture|private error text/i,
        'diagnostic traces never retain a resource URL or exception message');
});

test('unavailable render-cycle metadata stays null instead of becoming cycle zero', () => {
    const { win, dispatchWindow } = loadShell();
    win.__sfNativeUiHomeRenderCycle = null;
    dispatchWindow('error', { error: { name: 'TypeError' }, lineno: Symbol('private location'), colno: null });

    const details = JSON.parse(JSON.stringify(win.__sfNativeUiShellErrorDetails));
    assert.equal(details.length, 1);
    assert.equal(details[0].script, 'inline');
    assert.equal(details[0].line, null);
    assert.equal(details[0].column, null);
    assert.equal(details[0].renderCycle, null);
    assert.equal(details[0].lastRenderCycle, null);
});

test('known bundled script attribution strips local paths and query secrets', () => {
    const { win, calls, dispatchWindow } = loadShell();
    dispatchWindow('error', {
        error: { name: 'TypeError', message: 'private message' },
        filename: 'C:\\private\\native_ui_shell.js?token=fixture',
        lineno: 9,
        colno: 4
    });

    const details = JSON.parse(JSON.stringify(win.__sfNativeUiShellErrorDetails));
    assert.equal(details.length, 1);
    assert.equal(details[0].script, 'native-ui-shell');
    assert.equal(details[0].source, 'window-js');
    assert.match(calls.traces.join(' '), /js-error script=native-ui-shell source=window-js/);
    assert.doesNotMatch(JSON.stringify(details) + calls.traces.join(' '), /private|token=fixture/i);
});

test('unhandled rejections are phase-attributed, bounded, and de-duplicated across render cycles', () => {
    const { win, calls, dispatchWindow } = loadShell();
    win.__sfNativeUiHomeRenderCycle = 17;
    const rejected = {
        name: 'SecurityError',
        message: 'private response body and token=private-fixture',
        stack: 'private stack with https://private.invalid',
        fileName: 'https://private.invalid/assets/spotify_bridge.js?token=fixture',
        lineNumber: 33,
        columnNumber: 12
    };
    dispatchWindow('unhandledrejection', { reason: rejected });
    win.__sfNativeUiHomeRenderCycle = 18;
    dispatchWindow('unhandledrejection', { reason: rejected });

    assert.equal(win.__sfNativeUiShellErrors, 2, 'both errors are counted, even when one diagnostic is coalesced');
    assert.equal(win.__sfNativeUiShellErrorSources.promise, 2);
    assert.deepEqual(JSON.parse(JSON.stringify(win.__sfNativeUiShellErrorDetails)), [{
        script: 'spotify-bridge', source: 'promise', phase: 'unhandled-rejection',
        type: 'SecurityError', name: 'SecurityError', callback: 'promise',
        line: 33, column: 12, route: 'home', renderCycle: 17, lastRenderCycle: 18, repeatCount: 2
    }]);
    assert.equal(calls.traces.filter((line) => line.includes('js-error script=spotify-bridge source=promise')).length, 1);
    assert.doesNotMatch(JSON.stringify(win.__sfNativeUiShellErrorDetails) + calls.traces.join('\\n'),
        /private response body|private-fixture|private stack|private\.invalid/i);
});

test('runUpdate and shell-install failures are separated in the shell error attribution', () => {
    const update = loadShell();
    Object.defineProperty(update.win.location, 'pathname', {
        configurable: true,
        get() { throw Object.assign(new Error('private update text'), { name: 'ReferenceError' }); }
    });
    update.win.__sfNativeUiRefresh();
    assert.equal(update.win.__sfNativeUiShellErrorSources['run-update'], 1);
    assert.deepEqual(JSON.parse(JSON.stringify(update.win.__sfNativeUiShellErrorDetails.at(-1))), {
        script: 'native-ui-shell', source: 'run-update', phase: 'run-update',
        type: 'ReferenceError', name: 'ReferenceError', callback: 'runUpdate',
        line: null, column: null, route: 'home', renderCycle: 1, lastRenderCycle: 1, repeatCount: 1
    });
    assert.doesNotMatch(update.calls.traces.join('\\n'), /private update text/);

    const install = loadShell({ throwOnWindowEvent: 'popstate' });
    assert.equal(install.win.__sfNativeUiShellCompleted, false);
    assert.equal(install.win.__sfNativeUiShellErrorSources.install, 1);
    assert.deepEqual(JSON.parse(JSON.stringify(install.win.__sfNativeUiShellErrorDetails)), [
        {
            script: 'native-ui-shell', source: 'install', phase: 'install',
            type: 'TypeError', name: 'TypeError', callback: 'install',
            line: null, column: null, route: 'home', renderCycle: 0, lastRenderCycle: 0, repeatCount: 1
        }
    ]);
});

test('diagnostic traces carry a process id and omit private route identifiers', () => {
    const privateResourceId = '37i9dQZF1DXprivate123';
    const { calls } = loadShell({ locationPath: `/playlist/${privateResourceId}` });
    assert.ok(calls.traces.length > 0, 'the shell emits bounded startup traces');
    assert.ok(calls.traces.every((line) => line.startsWith('sid=1a2b3c4d ')),
        'all page-side trace events share the ephemeral native session id');
    assert.doesNotMatch(calls.traces.join('\n'), new RegExp(privateResourceId),
        'Spotify playlist/resource identifiers are never copied into diagnostics');
    assert.doesNotMatch(calls.traces.join('\n'), /https?:\/\/|\/playlist\//,
        'raw URLs and route paths are not logged');
    assert.match(calls.traces.join('\n'), /home-trace cid=[0-9]+ stage=session result=(unknown|in-progress|connected|required) duration=/,
        'Home correlation exposes only the bounded session state enum');
    assert.doesNotMatch(calls.traces.join('\n'), /proof=|profile|rows=|cards=|playlist.?count/i,
        'diagnostics do not publish proof flags, profile data, or private-content counters');
});

// P0 regression: restore the older authenticated empty-Home state without
// pretending that it is a Spotify playlist or letting it cover login.
test('an authenticated empty Home sends an explicit status before readiness', () => {
    const { calls, win } = loadShell({ withCards: false });
    const payload = calls.data.filter((call) => call.screen === 'home').at(-1);
    assert.ok(payload);
    assert.equal(payload.rows.length, 1);
    assert.equal(payload.rows[0].kind, 'state');
    assert.equal(payload.rows[0].state, 'loading');
    assert.equal(payload.rows[0].title, 'Chargement de votre accueil…');
    assert.equal(payload.rows[0].uri, '', 'the state does not manufacture a Spotify URI');
    assert.equal(win.__sfNativeUiHomeRowsCount, 0, 'status is not counted as Spotify content');
    assert.equal(win.__sfNativeUiHomeContentProven, false);
    assert.equal(win.__sfNativeUiHomeStateSent, true);
    assert.equal(win.__sfNativeUiHomeStateProven, true);
    assert.equal(win.__sfNativeUiSessionProven, true);
    assert.equal(calls.ready, 1);
    const route = calls.order.indexOf('route:home');
    const data = calls.order.indexOf('data:home');
    const ready = calls.order.indexOf('ready');
    assert.ok(route >= 0 && data > route && ready > data,
        `expected route -> explicit status -> ready, saw ${calls.order.join(' / ')}`);
});

test('a successful empty private library response proves the account and renders an honest empty Home', () => {
    const { calls, win } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true
    });
    const payload = calls.data.filter((call) => call.screen === 'home').at(-1);
    assert.equal(win.__sfNativeUiSessionProven, true);
    assert.equal(win.__sfNativeUiHomeStateProven, true);
    assert.equal(calls.ready, 1);
    assert.equal(payload.rows.length, 1);
    assert.equal(payload.rows[0].kind, 'state');
    assert.equal(payload.rows[0].state, 'empty');
    assert.equal(payload.rows[0].uri, '', 'no synthetic playlist URI is created');
});

test('a known unauthorized result shows only the unproven native Home state, never stale library rows', () => {
    const { calls, win } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [{ id: 'spotify:playlist:stale', name: 'Stale data' }] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryError: 'token-missing'
    });
    const home = calls.data.filter((call) => call.screen === 'home').at(-1);
    assert.equal(win.__sfNativeUiSessionProven, false);
    assert.equal(win.__sfNativeUiTakeoverProven, false);
    assert.equal(calls.ready, 1, 'the safe Home shell is independent from private-session proof');
    assert.equal(home.rows.length, 1);
    assert.equal(home.rows[0].kind, 'state');
    assert.equal(home.rows[0].sessionUnproven, true);
    assert.equal(home.rows[0].uri, 'melodix:action:open-login');
    assert.doesNotMatch(JSON.stringify(home.rows), /Stale data|spotify:playlist/,
        'stale private arrays never reach the renderer');
});

test('an empty Home without session evidence stays informational while proof is loading', () => {
    const { calls, win } = loadShell({
        withCards: false, noUserWidget: true,
        mediaLibSessionProofKnown: false, mediaLibSessionProven: false
    });
    const home = calls.data.filter((call) => call.screen === 'home').at(-1);
    assert.equal(calls.ready, 1);
    assert.equal(win.__sfNativeUiReadyNotified, true);
    assert.equal(win.__sfNativeUiHomeRowsCount, 0);
    assert.equal(win.__sfNativeUiSessionProven, false);
    assert.equal(win.__sfNativeUiTakeoverProven, false,
        'display readiness does not certify the account session');
    assert.equal(win.__sfNativeUiHomeStateSent, true);
    assert.equal(home.rows.length, 1);
    assert.equal(home.rows[0].kind, 'state');
    assert.equal(home.rows[0].sessionUnproven, true);
    assert.equal(home.rows[0].state, 'loading');
    assert.equal(home.rows[0].uri, '', 'login is not offered before the session check settles');
    assert.equal(home.rows[0].secondaryUri, '');
    assert.doesNotMatch(JSON.stringify(home.rows), /spotify:playlist|Road trip/,
        'no fake playlist or account content is sent');
});

test('Spotify login paths stay with the WebView and never activate native Home', () => {
    for (const locationPath of ['/login', '/signin', '/oauth/authorize', '/v2/auth/callback', '/intl-fr/login']) {
        const { calls } = loadShell({
            locationPath,
            authUiState: 'required',
            mediaLibSessionProofKnown: false,
            mediaLibSessionProven: false,
            withCards: false
        });
        assert.deepEqual(calls.routes, [], `${locationPath}: no native screen route is emitted`);
        assert.deepEqual(calls.data, [], `${locationPath}: no Home status or private rows overlay the login page`);
        assert.equal(calls.ready, 0, `${locationPath}: the login page does not transfer ownership to native Home`);
        assert.ok(calls.traces.some((line) => line.includes('spotify-route route=login')),
            `${locationPath}: the safe route category is traced without logging the path`);
    }
});

test('accounts.spotify.com stays visible in the WebView without a native Spotify overlay', () => {
    const { calls } = loadShell({
        hostname: 'accounts.spotify.com',
        locationPath: '/en/login',
        authUiState: 'required',
        mediaLibSessionProofKnown: false,
        mediaLibSessionProven: false,
        withCards: false
    });
    assert.deepEqual(calls.routes, []);
    assert.deepEqual(calls.data, []);
    assert.equal(calls.ready, 0);
    assert.ok(calls.traces.some((line) => line.includes('host=accounts') && line.includes('route=login')),
        'diagnostics record only the bounded login category, not the account URL');
});

test('foreground returns refresh the native projection without looping a 401 and a post-login page retries proof', () => {
    const refused = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryError: 'http-401'
    });
    assert.equal(refused.calls.mediaLibChecks, 0);
    refused.dispatchDocument('visibilitychange');
    refused.dispatchWindow('pageshow');
    assert.equal(refused.calls.mediaLibChecks, 0,
        'foreground events never retry or loop an observed authorization refusal');
    assert.equal(refused.win.__sfLastUpdate, 1000,
        'the native projection is recomputed when the WebView becomes visible');

    // A successful official login navigates back to a newly loaded Spotify page;
    // its JS proof starts unknown and the normal startup request runs again.
    const returned = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [] },
        mediaLibSessionProofKnown: false,
        mediaLibSessionProven: false,
        libraryError: 'http-401'
    });
    assert.equal(returned.calls.mediaLibChecks, 0);
    returned.win.__sfMediaLibStatus = 'pending';
    returned.win.__sfMediaLibError = '';
    returned.win.__sfMediaLibRetryAt = 0;
    returned.dispatchWindow('pageshow');
    assert.equal(returned.calls.mediaLibChecks, 1,
        'the returned Spotify page starts a fresh libraryV3 proof attempt');
    assert.equal(returned.calls.mediaLibCheckArgs.length, 1);
    assert.deepEqual(returned.calls.mediaLibCheckArgs[0].slice(0, 2), [false, 'shell-update'],
        'the first post-login request has an allow-listed startup source');
    assert.ok(Number.isInteger(returned.calls.mediaLibCheckArgs[0][2]) &&
        returned.calls.mediaLibCheckArgs[0][2] >= 1 && returned.calls.mediaLibCheckArgs[0][2] <= 999999,
    'the library request shares a bounded non-sensitive Home correlation id');
});

test('HTTP 401 keeps its cause unknown and offers separate official-login and manual-retry actions', () => {
    const { calls, win, drainTimers } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryError: 'http-401'
    });
    const initial = calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.doesNotMatch(initial.subtitle, /HTTP 401/i,
        'a UI error string alone is not a network trace');
    assert.match(initial.subtitle, /cause n’est pas établie/,
        'an unconfirmed diagnostic does not infer why the request failed');
    assert.equal(initial.uri, 'melodix:action:open-login',
        'the primary action always goes through the official login flow');
    assert.equal(initial.secondaryUri, 'melodix:action:retry-library',
        'retry is a distinct action that invokes the real library request');
    assert.equal(calls.mediaLibChecks, 0, 'an auth refusal does not immediately trigger a background retry');
    drainTimers();
    assert.equal(calls.mediaLibChecks, 0, 'draining queued Home retries still does not repeat a 401');

    win.__sfMediaLibLastDiagnostic = {
        phase: 'response', http: 401, mime: 'json', durationMs: 14, error: 'http-401',
        authMode: 'webview-session', refreshMode: 'unsupported'
    };
    win.__sfTriggerMutations();
    const confirmed = calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.match(confirmed.subtitle, /cause du refus n’est pas établie/,
        'a confirmed 401 still does not prove a missing, expired, or rejected cookie');
    assert.doesNotMatch(confirmed.subtitle, /HTTP 401/i,
        'the 401 is kept in sanitized diagnostics, not asserted as its cause in the message');
    assert.equal(confirmed.uri, 'melodix:action:open-login');
    assert.equal(confirmed.secondaryUri, 'melodix:action:retry-library');
});

test('a 403 Home state explains library access denial without presenting it as a player logout', () => {
    const diagnostic = {
        phase: 'response', http: 403, mime: 'json', durationMs: 14, error: 'http-403',
        authMode: 'webview-session', refreshMode: 'unsupported'
    };
    const { calls, win, drainTimers } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [{ id: 'spotify:playlist:fixture-stale', name: 'Fixture stale data' }] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryError: 'http-403',
        libraryDiagnostic: diagnostic
    });
    const initial = calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.equal(initial.title, 'Accès à la bibliothèque refusé');
    assert.equal(initial.section, 'Bibliothèque Spotify');
    assert.match(initial.subtitle, /autorisations de l’application et l’accès du compte/i);
    assert.match(initial.subtitle, /ne prouve pas une déconnexion/i);
    assert.equal(initial.uri, 'melodix:action:retry-library');
    assert.equal(initial.secondaryUri, '');
    assert.doesNotMatch(JSON.stringify(initial), /Fixture stale data|spotify:playlist/,
        '403-invalidated rows stay hidden from native Home');
    assert.equal(calls.mediaLibChecks, 0, 'an access refusal does not start an automatic request loop');
    drainTimers();
    assert.equal(calls.mediaLibChecks, 0);

    const unconfirmed = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryError: 'http-403'
    }).calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.equal(unconfirmed.title, 'Accès à la bibliothèque non confirmé');
    assert.equal(unconfirmed.uri, 'melodix:action:retry-library');
    assert.doesNotMatch(unconfirmed.subtitle, /HTTP 403|déconnexion confirmée/i,
        'a UI error string without its matching response diagnostic is not presented as a confirmed server result');
});

test('native payload filtering permits login only after a settled unproven error', () => {
    const shell = fs.readFileSync(SHELL, 'utf8');
    assert.match(shell, /var allowedActions = \['melodix:action:open-settings', 'melodix:action:retry-library', 'melodix:action:open-login'\]/);
    assert.doesNotMatch(shell, /status === 'loading' && stateUri === 'melodix:action:open-login'/,
        'loading state rows cannot carry a login action');
    assert.match(shell, /status === 'error' && allowedActions\.indexOf\(stateUri\) >= 0/,
        'primary actions are restricted to settled error states');
    assert.match(shell, /var allowedSecondaryAction = !secondaryUri[\s\S]{0,220}status === 'error'[\s\S]{0,180}item\.sessionUnproven === true[\s\S]{0,180}secondaryUri !== stateUri/);
    assert.match(shell, /primaryUri = '';/,
        'the initial proof check is informational and exposes no login button');
    assert.match(shell, /primaryUri = 'melodix:action:open-login';[\s\S]{0,80}secondaryUri = 'melodix:action:retry-library'/,
        'the two buttons cannot dispatch the same action after a settled refusal');
});

test('HTTP 429 messaging is also tied to the matching sanitized response record', () => {
    const { calls, win } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true,
        libraryError: 'http-429'
    });
    const initial = calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.doesNotMatch(initial.subtitle, /429|limite les requêtes/i,
        'a stored UI error string alone does not claim a rate-limit response');

    win.__sfMediaLibLastDiagnostic = {
        phase: 'response', http: 429, mime: 'json', durationMs: 14, error: 'http-other',
        authMode: 'webview-session', refreshMode: 'unsupported'
    };
    win.__sfTriggerMutations();
    const confirmed = calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.match(confirmed.subtitle, /limite les requêtes/i,
        'generic HTTP error diagnostics retain an observed status without exposing response contents');
});

test('a manual retry respects the bounded 429 deadline and preserves exponential backoff', () => {
    const diagnostic = {
        phase: 'response', http: 429, mime: 'json', durationMs: 14, error: 'http-other',
        authMode: 'webview-session', refreshMode: 'unsupported'
    };
    const { win, calls } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: false,
        libraryError: 'http-429',
        libraryDiagnostic: diagnostic
    });
    const now = win.Date.now();
    win.__sfMediaLibRetryAt = now + 5000;
    win.__sfMediaLibRetryDelayMs = 20000;
    win.__sfTriggerMutations();
    const waiting = calls.data.filter((call) => call.screen === 'home').at(-1).rows[0];
    assert.match(waiting.subtitle, /réessayez dans environ 5 s/i);
    assert.equal(waiting.uri, 'melodix:action:retry-library');

    let attemptArgs = null;
    win.checkMediaLib = (force, source) => {
        attemptArgs = [force, source];
        win.__sfMediaLibStatus = 'loading';
        win.__sfMediaLibError = '';
    };
    win.__sfNativeRetryLibrary();
    assert.equal(attemptArgs, null, 'a tap during Retry-After does not send an early request');
    assert.equal(win.__sfMediaLibRetryDelayMs, 20000,
        'blocked manual retries do not reset the exponential backoff');

    win.Date.now = () => now + 5000;
    win.__sfNativeRetryLibrary();
    assert.deepEqual(attemptArgs, [true, 'native-retry'],
        'once the server delay expires, one explicit forced request is allowed');
    assert.equal(win.__sfMediaLibRetryDelayMs, 20000,
        'manual retry preserves the rate-limit backoff until a successful response resets it');
});

test('a transient library error preserves earlier session proof and renders an actionable Home status', () => {
    const { win, calls } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true,
        libraryError: 'http-429',
        libraryDiagnostic: { phase: 'response', http: 429, mime: 'json', durationMs: 120, error: 'http-other',
            authMode: 'webview-session', refreshMode: 'unsupported' }
    });
    win.__sfMediaLibStatus = 'error';
    win.__sfMediaLibError = 'http-429';
    win.__sfTriggerMutations();

    const payload = calls.data.filter((call) => call.screen === 'home').at(-1);
    const state = payload.rows[0];
    assert.equal(state.kind, 'state');
    assert.equal(state.state, 'error');
    assert.equal(state.title, 'Vos playlists ne sont pas disponibles');
    assert.match(state.subtitle, /limite les requêtes/);
    assert.equal(state.uri, 'melodix:action:retry-library');
    assert.equal(win.__sfNativeUiHomeRowsCount, 0);
    assert.equal(calls.ready, 1, 'only the session-proven status participates in readiness');
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
    assert.ok(fallback.calls.traces.some((line) => line.includes('root=1') && line.includes('resources=1')),
        'the selected root and its real Spotify links remain diagnosable without logging selector IDs');

    const empty = loadShell({ withCards: false, rootMode: 'fallback' });
    assert.equal(empty.win.__sfNativeUiContentRootSelector, 'none');
    assert.equal(empty.calls.ready, 1, 'the explicit Home status can authorize display without a DOM root');
    assert.equal(empty.win.__sfNativeUiTakeoverProven, true,
        'the synthetic test proof is valid, but readiness still comes from an attached status row');
    assert.ok(!empty.win.__sfNativeUiHomeRowsCount || empty.win.__sfNativeUiHomeRowsCount === 0,
        'no private card count is fabricated when no content root exists');
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

test('a delayed public Spotify card never reaches the native shelf without private API proof', () => {
    const { calls, win, appendCard } = loadShell({
        withCards: false, noUserWidget: true,
        mediaLibSessionProofKnown: false, mediaLibSessionProven: false
    });
    assert.equal(calls.ready, 1, 'the status-only shell can be ready while private rows stay blocked');

    appendCard({ id: 'late-playlist', title: 'Vraie playlist tardive' });
    win.__sfTriggerMutations();

    assert.equal(win.__sfNativeUiHomeDomRowsCount, 1,
        'the public card remains local to the WebView');
    assert.equal(win.__sfNativeUiHomeRowsCount, 0,
        'unverified public content is not sent to the native shelf');
    assert.equal(win.__sfNativeUiHomeDataSent, true,
        'the safe status payload remains available to Android');
    assert.equal(win.__sfNativeUiHomeContentProven, false);
    assert.equal(win.__sfNativeUiSessionProven, false);
    assert.equal(win.__sfNativeUiTakeoverProven, false);
    assert.equal(calls.ready, 1, 'public content never becomes the proof; only the separate status permits display');
    assert.ok(calls.data.filter((call) => call.screen === 'home').every((call) =>
        call.rows.length === 1 && call.rows[0].kind === 'state' && call.rows[0].sessionUnproven),
    'only the status row reaches NativeHomeShelfRenderer, never the public card');
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
        if (bridgeMode === 'throw-data') {
            const callbackError = JSON.parse(JSON.stringify(win.__sfNativeUiShellErrorDetails))
                .find((detail) => detail.source === 'callback');
            assert.ok(callbackError, 'the failed native callback is retained as a bounded diagnostic');
            assert.equal(callbackError.script, 'native-ui-shell');
            assert.equal(callbackError.phase, 'bridge-callback');
            assert.equal(callbackError.callback, 'onNativeUiData');
            assert.ok(calls.traces.some((line) => line.includes(
                'js-error script=native-ui-shell source=callback phase=bridge-callback type=Error callback=onNativeUiData')),
            'callback errors reach the same strict native diagnostic channel');
            assert.doesNotMatch(JSON.stringify(callbackError) + calls.traces.join(' '),
                /native callback failed|private|token/i);
        }
    }
});

test('unproven Search, Library, and detail routes fall back to status-only Home without private rows', () => {
    for (const locationPath of ['/search/jazz', '/collection/playlists', '/playlist/private-resource']) {
        const { calls, win } = loadShell({
            locationPath,
            withCards: true,
            noUserWidget: true,
            mediaLib: { playlists: [{ id: 'stale-private-row', name: 'Stale row' }] },
            mediaLibSessionProofKnown: false,
            mediaLibSessionProven: false
        });
        assert.deepEqual(calls.routes, ['home'], `${locationPath}: private routes do not cross the native boundary`);
        assert.equal(calls.ready, 1, `${locationPath}: only the safe Home state authorizes shell display`);
        assert.equal(calls.data.filter((call) => ['search', 'detail', 'media:playlists'].includes(call.screen)).length, 0,
            `${locationPath}: DOM/stale library rows are withheld from native callbacks`);
        const home = calls.data.filter((call) => call.screen === 'home').at(-1);
        assert.equal(home.rows.length, 1);
        assert.equal(home.rows[0].kind, 'state');
        assert.equal(home.rows[0].sessionUnproven, true);
        assert.equal(win.__sfNativeUiTakeoverProven, false);
        assert.equal(calls.mediaLibChecks, 1,
            `${locationPath}: library proof can be requested without fabricating data`);
    }
});

test('localized Home remains the safe route while private screens wait for proof', () => {
    const unproven = loadShell({
        locationPath: '/intl-fr/',
        mediaLibSessionProofKnown: false,
        mediaLibSessionProven: false,
        noUserWidget: true
    });
    assert.deepEqual(unproven.calls.routes, ['home'], 'locale-prefixed Home normalizes to the non-private route');
    assert.equal(unproven.calls.ready, 1, 'the explicit unproven status permits display, not authenticated readiness');
    assert.equal(unproven.win.__sfNativeUiTakeoverProven, false);
    assert.equal(unproven.calls.data[0].rows[0].sessionUnproven, true);

    const proven = loadShell({
        locationPath: '/intl-fr/',
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true,
        noUserWidget: true
    });
    assert.deepEqual(proven.calls.routes, ['home']);
    assert.equal(proven.calls.ready, 1, 'a valid private response preserves the positive Home fallback');
});

test('delayed player recovery never redirects a playlist or search route', () => {
    for (const locationPath of ['/playlist/private-resource', '/search/jazz', '/collection/playlists']) {
        const { navigations, calls } = loadShell({
            locationPath,
            withCards: false,
            noUserWidget: true,
            mediaLibSessionProofKnown: false,
            mediaLibSessionProven: false,
            rootMode: 'fallback'
        });
        assert.deepEqual(navigations, [], `${locationPath}: player recovery is Home-only`);
        assert.equal(calls.ready, 1, `${locationPath}: fallback Home status activates the shell without session proof`);
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
    let source = '';
    win.checkMediaLib = (force, checkSource) => {
        calls += 1;
        source = checkSource;
        if (force !== true) throw new Error('must force');
    };
    win.__sfMediaLibStatus = 'error';
    win.__sfMediaLibError = 'network-error';
    assert.equal(typeof win.__sfNativeRetryLibrary, 'function', 'the hook exists for the native row');
    win.__sfNativeRetryLibrary();
    assert.equal(calls, 1, 'the library fetch is forced exactly once');
    assert.equal(source, 'native-retry', 'the manual retry has a fixed, non-sensitive source label');
    drainTimers(4);
});

test('non-empty raw Spotify data that yields no supported rows is a retryable error, not an empty library', () => {
    const { calls } = loadShell({
        withCards: false,
        rawItemCount: 1,
        mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] }
    });
    const home = calls.data.filter((call) => call.screen === 'home');
    const row = home[home.length - 1].rows[0];
    assert.equal(row.state, 'error');
    assert.match(row.subtitle, /éléments non reconnus/i);
    assert.equal(row.uri, 'melodix:action:retry-library');
});

test('partial library errors keep real rows and append a recoverable warning state', () => {
    const { calls } = loadShell({
        withCards: false,
        rawItemCount: 3,
        libraryError: 'http-429',
        libraryDiagnostic: { phase: 'response', http: 429, mime: 'json', durationMs: 120, error: 'http-other',
            authMode: 'webview-session', refreshMode: 'unsupported' },
        mediaLib: { playlists: [{ id: 'spotify:playlist:real-partial', name: 'Vraie playlist' }] }
    });
    const home = calls.data.filter((call) => call.screen === 'home');
    const rows = home[home.length - 1].rows;
    assert.ok(rows.some((row) => row.title === 'Vraie playlist'), 'real account content remains visible');
    const warning = rows.find((row) => row.kind === 'state');
    assert.ok(warning, 'the native Home keeps an explicit partial-error warning beside real rows');
    assert.equal(warning.state, 'error');
    assert.equal(warning.title, 'Certaines données Spotify sont indisponibles');
    assert.match(warning.subtitle, /limite les requêtes/i);
    assert.equal(warning.uri, 'melodix:action:retry-library');
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

// P0-A regression: only the successful private library response proves the
// session. The profile widget is retained as a UI diagnostic, never auth proof.
test('a real library proves the session and contributes a real Home card', () => {
    const { calls } = loadShell({
        withCards: false,
        noUserWidget: true,
        mediaLib: { playlists: [{ id: 'spotify:playlist:p1', name: 'Fixture playlist' }] },
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true
    });
    assert.equal(calls.ready, 1, 'la page compte et la vraie carte rendent le takeover sûr');
});

test('the profile-control class is a UI signal only and cannot prove a private API session', () => {
    const { calls, win } = loadShell({
        withCards: false,
        profileWidgetMode: 'class',
        noUserWidget: false,
        mediaLibSessionProofKnown: false,
        mediaLibSessionProven: false
    });
    assert.equal(win.__sfNativeUiPageSessionSignal, true,
        'the profile signal remains a page-only hint');
    assert.equal(win.__sfNativeUiSessionProven, false);
    assert.equal(win.__sfNativeUiTakeoverProven, false);
    assert.equal(calls.ready, 1,
        'a profile widget cannot prove the session, but the independent status permits the safe Home shell');
    assert.ok(calls.data.filter((call) => call.screen === 'home').every((call) =>
        call.rows.length === 1 && call.rows[0].kind === 'state' && call.rows[0].sessionUnproven));
});

test('real Home cards normalize playlist, album, artist, track, show, episode and audiobook links', () => {
    const resources = [
        ['/playlist/playlist_A1?si=private', 'spotify:playlist:playlist_A1'],
        ['/album/album-B2', 'spotify:album:album-B2'],
        ['/artist/artist-C3', 'spotify:artist:artist-C3'],
        ['/track/track_D4?si=private', 'spotify:track:track_D4'],
        ['/show/show-E5', 'spotify:show:show-E5'],
        ['/episode/episode-F6', 'spotify:episode:episode-F6'],
        ['/audiobook/book-G7', 'spotify:audiobook:book-G7'],
        ['https://open.spotify.com/intl-fr/episode/episode-H8?si=private', 'spotify:episode:episode-H8']
    ];
    for (const [resourceHref, expectedUri] of resources) {
        const { calls } = loadShell({ resourceHref, resourceTitle: 'Titre Spotify réel' });
        const payload = calls.data.find((call) => call.screen === 'home');
        assert.ok(payload, `${resourceHref}: Home payload is sent`);
        assert.equal(payload.rows.length, 1);
        assert.equal(payload.rows[0].uri, expectedUri,
            `${resourceHref}: URL/query/locale normalization preserves the actual Spotify resource type and id`);
        assert.equal(payload.rows[0].title, 'Titre Spotify réel');
    }
});

test('a real public Home card is content evidence only and never reaches native showNativeUi()', () => {
    const { calls, win } = loadShell({
        withCards: true,
        noUserWidget: true,
        mediaLibSessionProofKnown: false,
        mediaLibSessionProven: false,
        rootMode: 'fallback'
    });
    assert.match(win.__sfNativeUiContentRootSelector, /^fallback:/,
        'the real card is found even though #main-view and the profile control are absent');
    assert.equal(win.__sfNativeUiHomeDomRowsCount, 1);
    assert.equal(win.__sfNativeUiHomeRowsCount, 0);
    assert.equal(win.__sfNativeUiHomeDataSent, true, 'a status row is sent, not the card');
    assert.equal(win.__sfNativeUiSessionProven, false);
    assert.equal(win.__sfNativeUiPageSessionSignal, false);
    assert.equal(win.__sfNativeUiHomeContentProven, false,
        'unverified public cards remain WebView content and are not treated as native proof');
    assert.equal(win.__sfNativeUiTakeoverProven, false);
    assert.equal(calls.ready, 1, 'the native status covers the page without claiming private session proof');
    assert.ok(calls.data.filter((call) => call.screen === 'home').every((call) =>
        call.rows.length === 1 && call.rows[0].kind === 'state' && call.rows[0].sessionUnproven),
    'no public row reaches the Java renderer, whose status path alone calls showNativeUi()');
});

test('without account data or cards, the measurable login state still activates Home', () => {
    const { calls, win } = loadShell({
        withCards: false, noUserWidget: true,
        mediaLibSessionProofKnown: false, mediaLibSessionProven: false
    });
    assert.equal(calls.ready, 1, 'the safe status has its own display readiness path');
    assert.equal(win.__sfNativeUiReadyNotified, true);
    assert.equal(win.__sfNativeUiTakeoverProven, false);
    assert.equal(calls.data[0].rows.length, 1);
    assert.equal(calls.data[0].rows[0].sessionUnproven, true);
});

test('a Home card is not a session proof for other routes', () => {
    const { calls, win } = loadShell({
        withCards: true,
        noUserWidget: true,
        mediaLibSessionProofKnown: false,
        mediaLibSessionProven: false,
        locationPath: '/search',
        rootMode: 'fallback'
    });
    assert.equal(win.__sfNativeUiHomeContentProven, false);
    assert.equal(win.__sfNativeUiTakeoverProven, false);
    assert.deepEqual(calls.routes, ['home']);
    assert.equal(calls.ready, 1, 'unproven non-Home routes use the safe Home state instead');
    assert.equal(calls.data[0].rows[0].sessionUnproven, true);
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
