const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const script = fs.readFileSync(path.join(repo, 'assets/runtime_diagnostic.js'), 'utf8');
const helperSmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic.smali'),
    'utf8'
);
const callbackSmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic$Callback.smali'),
    'utf8'
);
const fetchRunnableSmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali'),
    'utf8'
);
const dialogSmali = helperSmali;
const copySmali = fs.readFileSync(
    path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic$CopyListener.smali'),
    'utf8'
);
const webViewClientSmali = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
const expectedDelays = [0, 3000, 8000, 20000];

function makeElement({ id = '', dataTestId = null, childNodes = [] } = {}) {
    return {
        nodeType: 1,
        id,
        childNodes,
        getAttribute: (name) => (name === 'data-testid' ? dataTestId : null)
    };
}

function executeDiagnostic({ libraryDiagnostic = {
    attempt: 1, source: 'shell-update', requests: 1,
    phase: 'response', http: 401, mime: 'json', durationMs: 120, error: 'http-401'
}, homeDecision = 'styles-not-ready' } = {}) {
    const nodes = new Map([
        ['#global-nav-bar', { display: 'flex' }],
        ['#Desktop_LeftSidebar_Id', { display: 'block' }],
        ['#sf-custom-style', { display: 'block' }],
        ['#sf-mobile-navigation', { display: 'grid' }],
        ['[data-testid="bottom-nav-bar"]', { display: 'flex' }],
        ['[data-testid="now-playing-bar"]', { display: 'flex' }]
    ]);
    const classes = new Set(['sf-mobile-shell', 'sf-library-open']);
    const body = makeElement();
    body.className = 'sf-mobile-shell sf-library-open';
    body.classList = { contains: (name) => classes.has(name) };

    let now = 1000;
    const timers = [];
    const observers = [];
    class TestMutationObserver {
        constructor(callback) {
            this.callback = callback;
            this.disconnected = false;
            this.observeCall = null;
            observers.push(this);
        }

        observe(target, options) {
            this.observeCall = { target, options };
        }

        disconnect() {
            this.disconnected = true;
        }

        emit(addedNodes) {
            if (!this.disconnected) this.callback([{ addedNodes }]);
        }
    }

    const window = {
        location: { protocol: 'https:', hostname: 'open.spotify.com', port: '' },
        AndBridge: {},
        innerWidth: 390,
        screen: { width: 432 },
        visualViewport: { width: 390 },
        SF_CONFIG: { guiMode: 'csshack', touchInput: true, dockLeftSidebar: false },
        __sfLibraryExpanded: true,
        __sfMelodixBridgeStarted: true,
        __sfMelodixBridgeBootstrapReady: true,
        __sfMelodixBridgeCompleted: true,
        __sfMelodixBridgeBootstrapErrors: 0,
        __sfMelodixHomeGuiMode: 'csshack',
        __sfMelodixHomeRoute: 'home',
        __sfMelodixHomeDecision: homeDecision,
        __sfMelodixHomeStylesReady: false,
        __sfMelodixHomeSourceCardCount: 2,
        __sfMelodixHomeRawAnchorCount: 3,
        __sfMelodixHomeSectionCount: 1,
        __sfBridgeExecMode: 'native-inject-started',
        __sfBridgeBytes: 103723,
        __sfBridgeReadLog: { expected: 103723, received: 103723, chunks: 3, complete: true, reader: 'range' },
        __sfBridgeExecSteps: [{ stage: 'native-inject', status: 'started' }],
        __sfBridgeLastError: '',
        __sfBridgeCspViolation: 'script-src-elem:inline',
        __sfNativeUiShowMethodCalled: true,
        __sfNativeUiRootFound: true,
        __sfNativeUiRootVisible: true,
        __sfNativeUiRootWidth: 390,
        __sfNativeUiRootHeight: 800,
        __sfNativeUiRootParentFound: true,
        __sfNativeUiRootParentConstraint: true,
        __sfNativeUiRootIndex: 1,
        __sfNativeUiHScrollIndex: 0,
        __sfNativeUiSiblingCount: 2,
        __sfNativeUiRootElevation: 45,
        __sfNativeUiRootAboveWebHost: true,
        __sfNativeUiRootLayoutReady: true,
        __sfNativeUiVisibilityConfirmed: true,
        __sfNativeUiHomeContentReady: true,
        __sfNativeUiSessionProven: true,
        __sfNativeUiBridgeCallbacksReady: true,
        __sfMediaLibStatus: 'error',
        __sfMediaLibLastDiagnostic: libraryDiagnostic,
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        __sfNativeUiHomeDomRowsCount: 3,
        __sfMelodixMobileShellInitAttempted: true,
        __sfMelodixHomeInitAttempted: true,
        __sfNativeUiShellStarted: true,
        __sfNativeUiShellReady: true,
        __sfNativeUiShellCompleted: true,
        __sfNativeUiShellErrors: 0,
        __sfNativeUiReadyNotified: true,
        __sfNativeUiHomeRowsCount: 4,
        __sfNativeUiHomeDataSent: true,
        getComputedStyle: (element) => ({ display: element.display }),
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        }
    };
    const document = {
        body,
        querySelector: (selector) => nodes.get(selector) || null
    };

    const started = vm.runInNewContext(script, {
        window,
        document,
        navigator: {
            userAgent: 'Mozilla/5.0 (Linux; Android 16; Pixel 9 Build/private) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/133.0.6943.121 Mobile Safari/537.36'
        },
        performance: { now: () => now },
        MutationObserver: TestMutationObserver
    });

    const runScheduledSamples = () => {
        for (const timer of [...timers].sort((left, right) => left.delay - right.delay)) {
            now = 1000 + timer.delay;
            timer.callback();
        }
    };

    return {
        started,
        body,
        nodes,
        classes,
        window,
        document,
        timers,
        observers,
        runScheduledSamples,
        get samples() {
            return JSON.parse(JSON.stringify(window.__melodixRuntimeDiagnosticV2.samples));
        }
    };
}

function installGeometryFixture(run, { libraryOpen = false } = {}) {
    const makeSurface = ({
        selector,
        rect,
        style = {},
        attributes = {},
        scroll = {},
        children = [],
        childQueries = {}
    }) => {
        const element = {
            nodeType: 1,
            id: '',
            childNodes: children,
            computed: {
                display: 'block',
                position: 'static',
                zIndex: 'auto',
                opacity: '1',
                visibility: 'visible',
                pointerEvents: 'auto',
                overflowX: 'visible',
                overflowY: 'visible',
                boxSizing: 'border-box',
                touchAction: 'auto',
                paddingTop: '0px',
                paddingBottom: '0px',
                ...style
            },
            getAttribute: (name) => Object.prototype.hasOwnProperty.call(attributes, name)
                ? attributes[name]
                : null,
            getBoundingClientRect: () => ({
                ...rect,
                right: rect.right === undefined ? rect.left + rect.width : rect.right,
                bottom: rect.bottom === undefined ? rect.top + rect.height : rect.bottom
            }),
            matches: (value) => value === selector,
            closest: (value) => value === selector ? element : null,
            querySelectorAll: (query) => childQueries[query] || [],
            querySelector: (query) => (childQueries[query] || [])[0] || null,
            clientWidth: scroll.clientWidth === undefined ? rect.width : scroll.clientWidth,
            clientHeight: scroll.clientHeight === undefined ? rect.height : scroll.clientHeight,
            scrollWidth: scroll.scrollWidth === undefined ? rect.width : scroll.scrollWidth,
            scrollHeight: scroll.scrollHeight === undefined ? rect.height : scroll.scrollHeight,
            scrollLeft: scroll.scrollLeft || 0,
            scrollTop: scroll.scrollTop || 0
        };
        return element;
    };

    const height = 844;
    const width = 390;
    const safeBottom = 20;
    const navRect = { left: 0, top: height - 72 - safeBottom, width, height: 72 + safeBottom };
    const playerBottomGap = libraryOpen ? 10 + safeBottom : 78 + safeBottom;
    const playerRect = {
        left: 10,
        top: height - playerBottomGap - 68,
        width: width - 20,
        height: 68
    };
    const homeRect = { left: 0, top: 24, width, height: height - 24 - 154 - safeBottom };
    const homeCardRect = { left: 18, top: 190, width: 164, height: 220 };
    const playerControlRect = {
        left: width - 64,
        top: playerRect.top + 12,
        width: 44,
        height: 44
    };
    const navButtons = ['home', 'search', 'library'].map((action, index) => makeSurface({
        selector: '.sf-mobile-nav__item',
        rect: { left: index * 130 + 9, top: navRect.top + 16, width: 112, height: 54 },
        attributes: { 'data-sf-mobile-action': action },
        style: { display: 'flex', position: 'relative', touchAction: 'manipulation' }
    }));
    const nav = makeSurface({
        selector: '#sf-mobile-nav',
        rect: navRect,
        style: {
            display: 'grid', position: 'fixed', zIndex: '10010', overflowX: 'hidden', overflowY: 'hidden',
            paddingTop: '5px', paddingBottom: `${5 + safeBottom}px`, touchAction: 'manipulation'
        },
        scroll: { scrollWidth: width + 4, clientWidth: width, scrollHeight: navRect.height, clientHeight: navRect.height },
        childQueries: { '[data-sf-mobile-action]': navButtons }
    });
    const playerControl = makeSurface({
        selector: 'aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]',
        rect: playerControlRect,
        attributes: { 'data-testid': 'control-button-playpause' },
        style: { display: 'flex', position: 'relative', width: '44px', height: '44px' }
    });
    const player = makeSurface({
        selector: 'aside[data-testid="now-playing-bar"]',
        rect: playerRect,
        style: {
            display: 'flex', position: 'fixed', zIndex: '10015', overflowX: 'hidden', overflowY: 'hidden',
            paddingTop: '8px', paddingBottom: '8px', touchAction: 'manipulation'
        },
        scroll: { scrollWidth: width - 20, clientWidth: width - 20, scrollHeight: 68, clientHeight: 68 },
        childQueries: { 'button[data-testid="control-button-playpause"]': [playerControl] }
    });
    const homeCard = makeSurface({
        selector: '#sf-melodix-home .sf-melodix-home__card',
        rect: homeCardRect,
        style: { display: 'flex', position: 'relative', zIndex: 'auto', touchAction: 'manipulation' }
    });
    const home = makeSurface({
        selector: '#sf-melodix-home',
        rect: homeRect,
        style: { display: 'flex', position: 'fixed', zIndex: '10001', overflowX: 'hidden', overflowY: 'auto' },
        scroll: { scrollWidth: width, clientWidth: width, scrollHeight: 900, clientHeight: homeRect.height },
        childQueries: { '.sf-melodix-home__card': [homeCard] }
    });
    const main = makeSurface({
        selector: '#main-view',
        rect: { left: 0, top: 0, width, height },
        style: { display: 'block', position: 'relative', overflowX: 'hidden', overflowY: 'auto' },
        scroll: { scrollWidth: width, clientWidth: width, scrollHeight: 1600, clientHeight: height }
    });
    const sidebar = makeSurface({
        selector: '#Desktop_LeftSidebar_Id',
        rect: { left: 0, top: 24, width: 320, height: height - 24 - 72 - safeBottom },
        style: { display: libraryOpen ? 'block' : 'none', position: 'fixed', zIndex: '10005' }
    });
    const globalNavigation = makeSurface({
        selector: '#global-nav-bar',
        rect: { left: 0, top: 24, width, height: 56 },
        style: { display: 'flex', position: 'relative', zIndex: '1' }
    });
    const fullscreen = makeSurface({
        selector: '#sf-fs-player',
        rect: { left: 0, top: 0, width, height },
        style: { display: 'none', position: 'fixed', zIndex: '10020' }
    });
    const stylesheet = makeSurface({
        selector: '#sf-custom-style',
        rect: { left: 0, top: 0, width: 0, height: 0 },
        style: { display: 'block' }
    });
    const viewportMeta = makeSurface({
        selector: 'meta[name="viewport"]',
        rect: { left: 0, top: 0, width: 0, height: 0 },
        attributes: { content: 'width=device-width, initial-scale=1.0, viewport-fit=cover' }
    });
    const root = makeSurface({
        selector: 'html',
        rect: { left: 0, top: 0, width, height },
        style: { display: 'block', position: 'static', getPropertyValue: () => '24px' },
        scroll: { scrollWidth: width, clientWidth: width, scrollHeight: 1200, clientHeight: height }
    });
    root.style = { getPropertyValue: () => '24px' };
    const styleFor = run.window.getComputedStyle;
    run.window.getComputedStyle = (element) => element.computed || styleFor(element);
    run.window.innerWidth = width;
    run.window.innerHeight = height;
    run.window.devicePixelRatio = 3;
    run.window.screen = {
        width: 432,
        height: 960,
        orientation: { type: 'portrait-primary' }
    };
    run.window.visualViewport = {
        width,
        height,
        offsetLeft: 0,
        offsetTop: 0,
        pageLeft: 0,
        pageTop: 0,
        scale: 1
    };
    run.window.matchMedia = (query) => ({ matches: query.includes('portrait') });
    run.document.documentElement = root;
    run.document.elementFromPoint = (x, y) => {
        const inRect = (rect) => x >= rect.left && x <= rect.left + rect.width
            && y >= rect.top && y <= rect.top + rect.height;
        if (inRect(playerRect)) return player;
        if (inRect(navRect)) return nav;
        if (inRect(homeRect)) return home;
        if (inRect({ left: 0, top: 0, width, height })) return main;
        return run.body;
    };
    run.body.computed = { display: 'block', position: 'static', opacity: '1', visibility: 'visible' };
    run.body.clientWidth = width;
    run.body.clientHeight = height;
    run.body.scrollWidth = width;
    run.body.scrollHeight = 1200;
    run.nodes.set('#global-nav-bar', globalNavigation);
    run.nodes.set('#Desktop_LeftSidebar_Id', sidebar);
    run.nodes.set('#sf-custom-style', stylesheet);
    run.nodes.set('#sf-mobile-nav', nav);
    run.nodes.set('#main-view', main);
    run.nodes.set('#sf-melodix-home', home);
    run.nodes.set('#sf-melodix-home .sf-melodix-home__card', homeCard);
    run.nodes.set('#sf-fs-player', fullscreen);
    run.nodes.set('aside[data-testid="now-playing-bar"]', player);
    run.nodes.set('aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]', playerControl);
    run.nodes.set('meta[name="viewport"]', viewportMeta);
    if (libraryOpen) {
        run.classes.add('sf-library-open');
        run.body.className = 'sf-mobile-shell sf-library-open';
    } else {
        run.classes.delete('sf-library-open');
        run.body.className = 'sf-mobile-shell';
    }
}

test('Preview diagnostic returns four timed samples with the existing report fields', () => {
    const run = executeDiagnostic();
    assert.equal(run.started, true);
    assert.deepEqual(run.timers.map(({ delay }) => delay), expectedDelays);
    assert.equal(run.observers.length, 1);
    assert.equal(run.observers[0].observeCall.target, run.body);
    assert.equal(run.observers[0].observeCall.options.childList, true);
    assert.equal(run.observers[0].observeCall.options.subtree, true);

    run.runScheduledSamples();
    const samples = run.samples;
    assert.deepEqual(samples.map(({ elapsedMs }) => elapsedMs), expectedDelays);
    assert.equal(samples.length, 4);
    assert.equal(samples[0].host, 'open.spotify.com');
    assert.deepEqual(samples[0].runtimeUserAgent, {
        family: 'android-webview',
        chromiumMajor: 133
    });
    assert.doesNotMatch(JSON.stringify(samples[0]), /Pixel 9|Build\/private|6943\.121/);
    assert.deepEqual(samples[0].width, {
        innerWidth: 390,
        screenWidth: 432,
        visualViewportWidth: 390
    });
    assert.equal(samples[0].selectors['#global-nav-bar'], true);
    assert.equal(samples[0].selectors['#Desktop_LeftSidebar_Id'], true);
    assert.equal(samples[0].selectors['#main-view'], false);
    assert.equal(samples[0].selectors['#sf-melodix-home'], false);
    assert.equal(samples[0].selectors['#sf-mobile-nav'], false);
    assert.equal(samples[0].selectors['#sf-mobile-navigation'], true);
    assert.equal(samples[0].selectors['[data-testid="bottom-nav-bar"]'], true);
    assert.equal(samples[0].selectors['[data-testid="now-playing-bar"]'], true);
    assert.equal(Object.values(samples[0].selectors).every((value) => typeof value === 'boolean'), true);
    assert.equal(samples[0].guiMode, 'csshack');
    assert.equal(samples[0].touchInput, true);
    assert.equal(samples[0].dockLeftSidebar, false);
    assert.deepEqual(samples[0].bodyClasses, ['sf-mobile-shell', 'sf-library-open']);
    assert.deepEqual(samples[0].drawer, {
        expanded: true,
        libraryOpenClass: true,
        guestClass: false,
        expandedClass: false
    });
    assert.deepEqual(samples[0].dockDisplay, {
        sfMobileNav: null,
        sfMobileNavigation: 'grid'
    });
    assert.equal(samples[0].sidebarDisplay, 'block');
    assert.deepEqual(samples[0].ui, {
        andBridgeAvailable: true,
        andBridgeDiagAvailable: false,
        bridgeStarted: true,
        bridgeBootstrapReady: true,
        bridgeCompleted: true,
        bridgeBootstrapErrors: 0,
        bridgeRecoveryAttempts: 0,
        bridgeRecovered: false,
        bridgeExecMode: 'native-inject-started',
        bridgeBytes: 103723,
        bridgeReadExpected: 103723,
        bridgeReadReceived: 103723,
        bridgeReadChunks: 3,
        bridgeReadComplete: true,
        bridgeReadMethod: 'range',
        bridgeExecSteps: 'native-inject=started',
        bridgeLastError: '',
        bridgeCspViolation: 'script-src-elem:inline',
        mobileShellInitAttempted: true,
        homeInitAttempted: true,
        mobileShellClass: true,
        homeActiveClass: false,
        homeRootPresent: false,
        homeGuiMode: 'csshack',
        homeScreen: 'home',
        homeDecision: 'styles-not-ready',
        homeStylesReady: false,
        nativeUiShellStarted: true,
        nativeUiShellReady: true,
        nativeUiShellCompleted: true,
        nativeUiShellErrors: 0,
        nativeUiShellErrorSources: {
            'window-js': 0,
            'resource-script': 0,
            'resource-link': 0,
            'resource-image': 0,
            'resource-iframe': 0,
            'resource-other': 0,
            'run-update': 0,
            install: 0,
            callback: 0,
            promise: 0
        },
        nativeUiShellErrorDetails: [],
        nativeUiShellHomeRenderCycle: null,
        nativeUiReadyNotified: true,
        nativeUiShowMethodCalled: true,
        nativeUiRootFound: true,
        nativeUiRoute: null,
        nativeUiRootVisible: true,
        nativeUiRootWidth: 390,
        nativeUiRootHeight: 800,
        nativeUiRootParentFound: true,
        nativeUiRootParentConstraint: true,
        nativeUiRootIndex: 1,
        nativeUiHScrollIndex: 0,
        nativeUiSiblingCount: 2,
        nativeUiRootElevation: 45,
        nativeUiRootAboveWebHost: true,
        nativeUiRootLayoutReady: true,
        nativeUiVisibilityConfirmed: true,
        nativeUiHomeContentReady: true,
        nativeHomeRouteRecognized: null,
        nativeUiBridgeCallbacksReady: true,
        mediaLibStatus: 'error',
        libraryFetchDiagnostic: {
            attempt: 1, source: 'shell-update', requests: 1,
            http: 401, mime: 'json', phase: 'response', durationMs: 120, error: 'http-401'
        },
        nativeHomeDataSent: true,
        customStylesheetInjected: true
    });
    assert.equal(samples[3].mutations.observerStopped, true);
    assert.equal(run.observers[0].disconnected, true);
    for (const privateField of [
        'nativeUiSessionProven', 'mediaLibSessionProofKnown', 'mediaLibSessionProven',
        'homeSourceCardCount', 'homeRawAnchorCount', 'homeSectionCount',
        'nativeHomeDomRowsCount', 'nativeHomeRowsCount', 'homeWebNativeCountsMatch'
    ]) assert.equal(Object.prototype.hasOwnProperty.call(samples[0].ui, privateField), false,
        `${privateField} is not included in the runtime report`);
});

test('runtime renderer decisions use a neutral allowlist and discard proof/profile labels', () => {
    for (const homeDecision of ['session-unproven', 'session-rejected', 'session-proven', 'profile-control-unverified']) {
        const run = executeDiagnostic({ homeDecision });
        run.runScheduledSamples();
        assert.equal(run.samples[0].ui.homeDecision, null,
            `${homeDecision} must not become a runtime diagnostic label`);
    }
    const safe = executeDiagnostic({ homeDecision: 'renderer-inactive' });
    safe.runScheduledSamples();
    assert.equal(safe.samples[0].ui.homeDecision, 'renderer-inactive');
});

test('runtime samples repeat the last library result and retain its request-attempt identity', () => {
    const run = executeDiagnostic({ libraryDiagnostic: {
        attempt: 4, source: 'native-retry', requests: 1,
        phase: 'response', http: 401, mime: 'json', durationMs: 120, error: 'http-401'
    } });
    run.runScheduledSamples();
    assert.deepEqual(run.samples.map((sample) => sample.elapsedMs), expectedDelays);
    assert.deepEqual(run.samples.map((sample) => sample.ui.libraryFetchDiagnostic.attempt), [4, 4, 4, 4]);
    assert.deepEqual(run.samples.map((sample) => sample.ui.libraryFetchDiagnostic.source),
        ['native-retry', 'native-retry', 'native-retry', 'native-retry']);
    assert.deepEqual(run.samples.map((sample) => sample.ui.libraryFetchDiagnostic.requests), [1, 1, 1, 1],
        'three later samples of the same diagnostic are not three observed HTTP requests');
});

test('shell error diagnostics preserve only allowlisted attribution, bounded coordinates and repeat counts', () => {
    const run = executeDiagnostic();
    run.window.__sfNativeUiHomeRenderCycle = 10000000;
    run.window.__sfNativeUiShellErrorSources = {
        'window-js': 2,
        'run-update': 1,
        callback: 3,
        promise: 2,
        'https://private.invalid/path': 7
    };
    run.window.__sfNativeUiShellErrorDetails = [
        {
            script: 'spotify-bridge', source: 'window-js', phase: 'unhandled-rejection',
            type: 'TypeError', callback: 'onNativeUiRoute', line: 12, column: 34,
            route: 'settings', renderCycle: 4, lastRenderCycle: 5, repeatCount: 10000000,
            message: 'private message'
        },
        {
            script: 'Bearer private-token', source: 'run-update', phase: 'secret',
            name: 'RangeError', callback: 'secret-callback', line: 0, column: 10000001,
            route: 'spotify:playlist:private', renderCycle: -1, lastRenderCycle: 10000000, repeatCount: 0,
            stack: 'private stack'
        },
        {
            source: 'https://private.invalid/path', name: 'Bearer private-token', line: 1, column: 2,
            renderCycle: null, lastRenderCycle: null
        }
    ];
    run.runScheduledSamples();
    const ui = run.samples[0].ui;
    assert.equal(ui.nativeUiShellErrorSources['window-js'], 2);
    assert.equal(ui.nativeUiShellErrorSources['run-update'], 1);
    assert.equal(ui.nativeUiShellErrorSources.callback, 3);
    assert.equal(ui.nativeUiShellErrorSources.promise, 2);
    assert.equal(Object.prototype.hasOwnProperty.call(ui.nativeUiShellErrorSources, 'https://private.invalid/path'), false);
    assert.equal(ui.nativeUiShellHomeRenderCycle, 999999);
    assert.deepEqual(ui.nativeUiShellErrorDetails, [
        {
            script: 'spotify-bridge', source: 'window-js', phase: 'unhandled-rejection',
            type: 'TypeError', name: 'TypeError', callback: 'onNativeUiRoute',
            line: 12, column: 34, route: 'settings', renderCycle: 4, lastRenderCycle: 5, repeatCount: 9999
        },
        {
            script: 'unknown', source: 'run-update', phase: 'uncaught',
            type: 'RangeError', name: 'RangeError', callback: 'unknown',
            line: null, column: null, route: 'other', renderCycle: null, lastRenderCycle: null, repeatCount: 1
        },
        {
            script: 'unknown', source: 'resource-other', phase: 'uncaught',
            type: 'unknown', name: 'unknown', callback: 'unknown',
            line: 1, column: 2, route: 'other', renderCycle: null, lastRenderCycle: null, repeatCount: 1
        }
    ]);
    assert.doesNotMatch(JSON.stringify(ui.nativeUiShellErrorDetails),
        /private message|private stack|private-token|private\.invalid|spotify:playlist/);
});

test('runtime library telemetry sanitizes HTTP claims and exports only the response metadata allowlist', () => {
    const run = executeDiagnostic({ libraryDiagnostic: {
        phase: 'request', http: 0, mime: 'missing', durationMs: 12, error: 'http-401',
        token: 'private-token-fixture', body: 'private-response-fixture'
    } });
    run.runScheduledSamples();
    const diagnostic = run.samples[0].ui.libraryFetchDiagnostic;
    assert.deepEqual(diagnostic, {
        attempt: 0, source: 'unspecified', requests: 0,
        http: 0, mime: 'missing', phase: 'request', durationMs: 12, error: 'http-other'
    }, '401 is downgraded unless it is an observed HTTP response with status 401');
    assert.deepEqual(Object.keys(diagnostic).sort(),
        ['attempt', 'durationMs', 'error', 'http', 'mime', 'phase', 'requests', 'source'].sort());
    assert.doesNotMatch(JSON.stringify(run.samples[0]), /private-token-fixture|private-response-fixture/i);
    assert.doesNotMatch(script, /homeSourceCardCount|homeRawAnchorCount|homeSectionCount|nativeHomeDomRowsCount|nativeHomeRowsCount|mediaLibSessionProofKnown|mediaLibSessionProven/);
});

test('runtime geometry records viewport, zoom, safe-area, surface bounds, overflow, and reachable controls', () => {
    const run = executeDiagnostic();
    installGeometryFixture(run);
    run.runScheduledSamples();
    const geometry = run.samples[0].layoutGeometry;

    assert.deepEqual(geometry.viewport, {
        innerWidth: 390,
        innerHeight: 844,
        screenWidth: 432,
        screenHeight: 960,
        devicePixelRatio: 3,
        orientation: 'portrait-primary',
        portrait: true,
        landscape: false,
        visualViewport: {
            width: 390,
            height: 844,
            offsetLeft: 0,
            offsetTop: 0,
            pageLeft: 0,
            pageTop: 0,
            scale: 1
        }
    });
    assert.deepEqual(geometry.safeArea, {
        viewportFitCover: true,
        topCustomInsetCssPx: 24,
        mobileNavigationPaddingTopCssPx: 5,
        mobileNavigationPaddingBottomCssPx: 25,
        mobileNavigationBottomGapCssPx: 0,
        mobileNavigationBottomInsetInferredCssPx: 20,
        playerBottomGapCssPx: 98,
        playerPaddingBottomCssPx: 8
    });
    assert.equal(geometry.surfaces.mobileNavigation.style.position, 'fixed');
    assert.equal(geometry.surfaces.mobileNavigation.style.zIndex, 10010);
    assert.equal(geometry.surfaces.mobileNavigation.box.height, 92);
    assert.equal(geometry.surfaces.nowPlayingBar.style.zIndex, 10015);
    assert.equal(geometry.overlap.navigationPlayerVerticalPx, 0);
    assert.equal(geometry.overlap.navigationPlayerIntersecting, false);
    assert.equal(geometry.overlap.homePlayerIntersecting, false);
    assert.equal(geometry.scroll.document.horizontalOverflowPx, 0);
    assert.equal(geometry.scroll.melodixHome.verticalOverflowPx, 254);
    assert.deepEqual(geometry.hitTargets.mobileNavigation.map(({ action, reachable, width, height }) => ({
        action, reachable, width, height
    })), [
        { action: 'home', reachable: true, width: 112, height: 54 },
        { action: 'search', reachable: true, width: 112, height: 54 },
        { action: 'library', reachable: true, width: 112, height: 54 }
    ]);
    assert.deepEqual(geometry.hitTargets.playPause, {
        available: true,
        width: 44,
        height: 44,
        owner: 'now-playing-bar',
        reachable: true
    });
    assert.equal(geometry.hitTargets.firstHomeCard.reachable, true);
});

test('missing runtime geometry metrics stay null instead of becoming zero', () => {
    const run = executeDiagnostic();
    installGeometryFixture(run);
    run.window.screen.width = null;
    run.window.visualViewport.scale = null;
    run.runScheduledSamples();

    const viewport = run.samples[0].layoutGeometry.viewport;
    assert.equal(viewport.screenWidth, null);
    assert.equal(viewport.visualViewport.scale, null);
});

test('runtime diagnostic exposes dock/player occlusion in a synthetic library-open hit-test', () => {
    const run = executeDiagnostic();
    installGeometryFixture(run, { libraryOpen: true });
    run.runScheduledSamples();
    const geometry = run.samples[0].layoutGeometry;

    assert.equal(run.samples[0].drawer.libraryOpenClass, true);
    assert.equal(geometry.overlap.navigationPlayerVerticalPx, 62);
    assert.equal(geometry.overlap.navigationPlayerIntersecting, true);
    assert.equal(geometry.hitTargets.mobileNavigation.every((target) => !target.reachable), true);
    assert.equal(geometry.hitTargets.playPause.reachable, true);
    assert.equal(run.samples[0].ui.nativeHomeDataSent, true);
    assert.equal(run.samples[0].ui.homeRootPresent, true);
});

test('mutation observation is capped and records only identifier presence, never private identifier values', () => {
    const run = executeDiagnostic();
    const addedNodes = Array.from({ length: 10005 }, (_, index) => makeElement({
        id: index < 12 ? `private-resource-${index}` : '',
        dataTestId: index < 12 ? `spotify-private-test-${index}` : null
    }));
    run.observers[0].emit(addedNodes);
    run.runScheduledSamples();

    const mutation = run.samples[3].mutations;
    assert.equal(mutation.addedNodeCount, 10000);
    assert.equal(mutation.addedNodeCountCapped, true);
    assert.equal(mutation.firstAddedIdentityPresence.length, 10);
    assert.deepEqual(mutation.firstAddedIdentityPresence[0], {
        hasId: true,
        hasTestId: true
    });
    assert.equal(JSON.stringify(mutation).includes('private-resource-'), false);
    assert.equal(JSON.stringify(mutation).includes('spotify-private-test-'), false);
    assert.equal(mutation.observerStopped, true);
    assert.equal(run.observers[0].disconnected, true);
});

test('diagnostic output contains no page text, full URL, cookies, or tokens', () => {
    assert.doesNotMatch(
        script,
        /document\.cookie|CookieManager|localStorage|sessionStorage|\bfetch\s*\(|XMLHttpRequest|location\.href|textContent|innerText/i
    );

    const run = executeDiagnostic();
    run.runScheduledSamples();
    const samples = run.samples;
    const serialized = JSON.stringify(samples);
    const visitKeys = (value) => Object.entries(value || {}).flatMap(([key, child]) => [
        key,
        ...(child && typeof child === 'object'
            ? (Array.isArray(child) ? child.flatMap(visitKeys) : visitKeys(child))
            : [])
    ]);

    assert.doesNotMatch(serialized, /https?:\/\/|cookie|token|secret/i);
    assert.ok(visitKeys(samples).every((key) => !/(?:text|url|cookie|token|secret)/i.test(key)));
});

test('native hook keeps the Preview/origin guard and fetches the completed array once', () => {
    assert.match(helperSmali, /com\.melodix\.music\.preview/);
    assert.match(helperSmali, /open\.spotify\.com/);
    assert.match(helperSmali, /equalsIgnoreCase/);
    assert.match(helperSmali, /evaluateJavascript/);
    assert.match(script, /window\.location\.protocol !== 'https:'/);
    assert.match(script, /window\.location\.hostname !== 'open\.spotify\.com'/);
    assert.match(script, /window\.location\.port && window\.location\.port !== '443'/);
    assert.match(callbackSmali, /Handler;->postDelayed\(Ljava\/lang\/Runnable;J\)Z/);
    assert.match(callbackSmali, /RuntimeDiagnostic\$FetchRunnable/);
    assert.match(fetchRunnableSmali, /window\.location\.protocol!=='https:'/);
    assert.match(fetchRunnableSmali, /window\.location\.hostname!=='open\.spotify\.com'/);
    assert.match(fetchRunnableSmali, /window\.location\.port&&window\.location\.port!=='443'/);
    assert.match(fetchRunnableSmali, /com\.melodix\.music\.preview/);
    assert.match(fetchRunnableSmali, /evaluateJavascript/);
    assert.match(webViewClientSmali, /invoke-static\/range \{p1 \.\. p2\}, Lcom\/melodix\/music\/RuntimeDiagnostic;->runIfPreview/);
});

test('result dialog is selectable and its copy button writes the JSON once', () => {
    assert.match(dialogSmali, /TextView;->setTextIsSelectable\(Z\)V/);
    assert.match(dialogSmali, /setPositiveButton/);
    assert.match(copySmali, /ClipData;->newPlainText/);
    assert.match(copySmali, /ClipboardManager;->setPrimaryClip/);
});
