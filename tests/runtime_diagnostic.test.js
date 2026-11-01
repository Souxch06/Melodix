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

function executeDiagnostic() {
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
        __sfMelodixHomeDecision: 'styles-not-ready',
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
        __sfMediaLibStatus: 'ready',
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
        timers,
        observers,
        runScheduledSamples,
        get samples() {
            return JSON.parse(JSON.stringify(window.__melodixRuntimeDiagnosticV2.samples));
        }
    };
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
        homeCardCount: 0,
        homeGuiMode: 'csshack',
        homeScreen: 'home',
        homeDecision: 'styles-not-ready',
        homeStylesReady: false,
        homeSourceCardCount: 2,
        homeRawAnchorCount: 3,
        homeSectionCount: 1,
        nativeUiShellStarted: true,
        nativeUiShellReady: true,
        nativeUiShellCompleted: true,
        nativeUiShellErrors: 0,
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
        nativeUiSessionProven: true,
        nativeUiBridgeCallbacksReady: true,
        mediaLibStatus: 'ready',
        mediaLibSessionProofKnown: true,
        mediaLibSessionProven: true,
        nativeHomeDomRowsCount: 3,
        nativeHomeRowsCount: 4,
        homeWebNativeCountsMatch: false,
        nativeHomeDataSent: true,
        customStylesheetInjected: true
    });
    assert.equal(samples[3].mutations.observerStopped, true);
    assert.equal(run.observers[0].disconnected, true);
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
