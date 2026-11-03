// Behavioral control-flow regression for the native screen state path.
// This executes the route setter, UI-update dispatch, and Back-handler Smali
// instructions (including conditional branches); readiness/render visibility
// gates are checked against their actual source order. Android/ART behavior is
// separately checked by the Preview emulator workflow.
'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const ACTIVITY = fs.readFileSync(
    path.join(ROOT, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

function extractMethod(source, signature) {
    const start = source.indexOf(signature);
    assert.ok(start >= 0, `missing Smali method: ${signature}`);
    const end = source.indexOf('.end method', start);
    assert.ok(end > start, `unterminated Smali method: ${signature}`);
    return source.slice(start, end);
}

/**
 * Small, deliberately strict executor for the state-changing prefix of this
 * method. If the implementation grows new opcodes before storing the state,
 * the test fails closed and requires the executor to be reviewed/extended.
 */
function executeSetNativeScreen(
    previousScreen,
    destination,
    previousFade = false,
    contentSentinel = { value: 'unchanged' },
    previousHomeState = {}
) {
    const method = extractMethod(
        ACTIVITY,
        '.method public final setNativeScreen(Ljava/lang/String;)V');
    const state = {
        nativeCurrentScreen: previousScreen,
        nativeFadeNextScreen: previousFade,
        nativeHomeCardsAttached: Boolean(previousHomeState.nativeHomeCardsAttached),
        nativeHomeStatusAttached: Boolean(previousHomeState.nativeHomeStatusAttached),
        nativeHomeSessionUnprovenStatusAttached: Boolean(previousHomeState.nativeHomeSessionUnprovenStatusAttached),
        nativeHomeContentReady: Boolean(previousHomeState.nativeHomeContentReady),
        nativeHomeVisibilityDiagnosticReported: Boolean(previousHomeState.nativeHomeVisibilityDiagnosticReported),
        nativeHomeFirstCard: previousHomeState.nativeHomeFirstCard || null,
        nativeHomeStatusView: previousHomeState.nativeHomeStatusView || null,
        contentSentinel
    };
    const registers = { p0: state, p1: destination };
    const instructions = [];
    const labels = new Map();
    let pendingResult;
    let fadeValueAtStore;

    for (const rawLine of method.split(/\r?\n/)) {
        const line = rawLine.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) {
            labels.set(line.slice(1), instructions.length);
            continue;
        }
        instructions.push(line);
    }

    let pc = 0;
    let steps = 0;
    while (pc >= 0 && pc < instructions.length) {
        assert.ok(++steps <= 80, 'setNativeScreen control flow must terminate');
        const instruction = instructions[pc++];
        let match;

        if ((match = /^const\/4 (\w+), (0x[0-9a-f]+|0x0|0x1)$/.exec(instruction))) {
            registers[match[1]] = Number.parseInt(match[2], 16);
            continue;
        }
        if ((match = /^const-string (\w+), ".*"$/.exec(instruction))) {
            registers[match[1]] = instruction.slice(instruction.indexOf(', ') + 2).slice(1, -1);
            continue;
        }
        if (/^invoke-static \{\w+\}, Lcom\/melodix\/music\/(?:NativeCrashGuard;->diagLine|StartupDiagnosticOverlay;->appendDiagnosticLine)\(Ljava\/lang\/String;\)V$/.test(instruction)) {
            continue; // Safe, static diagnostic markers have no routing side effects.
        }
        if ((match = /^iget-object (\w+), p0, .*->nativeCurrentScreen:Ljava\/lang\/String;$/.exec(instruction))) {
            registers[match[1]] = state.nativeCurrentScreen;
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+)\}, Ljava\/lang\/String;->isEmpty\(\)Z$/.exec(instruction))) {
            const receiver = registers[match[1]];
            if (receiver == null) throw new TypeError('String.isEmpty() receiver was null');
            pendingResult = receiver.length === 0 ? 1 : 0;
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z$/.exec(instruction))) {
            const receiver = registers[match[1]];
            if (receiver == null) throw new TypeError('String.equals() receiver was null');
            pendingResult = receiver === registers[match[2]] ? 1 : 0;
            continue;
        }
        if ((match = /^move-result (\w+)$/.exec(instruction))) {
            assert.notEqual(pendingResult, undefined, 'move-result must follow an invoke');
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^if-(eqz|nez) (\w+), :([\w$.-]+)$/.exec(instruction))) {
            const value = registers[match[2]];
            const zero = value == null || value === false || value === 0;
            const takeBranch = match[1] === 'eqz' ? zero : !zero;
            if (takeBranch) {
                assert.ok(labels.has(match[3]), `branch target exists: :${match[3]}`);
                pc = labels.get(match[3]);
            }
            continue;
        }
        if ((match = /^goto :([\w$.-]+)$/.exec(instruction))) {
            assert.ok(labels.has(match[1]), `goto target exists: :${match[1]}`);
            pc = labels.get(match[1]);
            continue;
        }
        if ((match = /^iput-boolean (\w+), p0, .*->nativeFadeNextScreen:Z$/.exec(instruction))) {
            state.nativeFadeNextScreen = Boolean(registers[match[1]]);
            fadeValueAtStore = state.nativeFadeNextScreen;
            continue;
        }
        if ((match = /^iput-boolean (\w+), p0, .*->(nativeHomeCardsAttached|nativeHomeStatusAttached|nativeHomeSessionUnprovenStatusAttached|nativeHomeContentReady|nativeHomeVisibilityDiagnosticReported):Z$/.exec(instruction))) {
            state[match[2]] = Boolean(registers[match[1]]);
            continue;
        }
        if ((match = /^iput-object (\w+), p0, .*->(nativeHomeFirstCard|nativeHomeStatusView):Landroid\/view\/View;$/.exec(instruction))) {
            state[match[2]] = registers[match[1]] === 0 ? null : registers[match[1]];
            continue;
        }
        if ((match = /^iput-object (\w+), p0, .*->nativeCurrentScreen:Ljava\/lang\/String;$/.exec(instruction))) {
            state.nativeCurrentScreen = registers[match[1]];
            return { state, fadeValueAtStore };
        }
        if (instruction === 'return-void') return { state, fadeValueAtStore };

        throw new Error(`Unreviewed opcode in setNativeScreen state prefix: ${instruction}`);
    }
    throw new Error('setNativeScreen returned without a valid state assignment');
}

test('D1 — null previous screen initializes Home without dereferencing null', () => {
    const contentSentinel = { value: 'preserve-existing-content' };
    const result = executeSetNativeScreen(null, 'home', true, contentSentinel);
    assert.equal(result.state.nativeCurrentScreen, 'home');
    assert.equal(result.fadeValueAtStore, false, 'first initialization does not fade');
    assert.equal(result.state.nativeFadeNextScreen, false);
    assert.strictEqual(result.state.contentSentinel, contentSentinel, 'route initialization leaves existing content untouched');
});

test('D2 — repeated Home destination is idempotent and preserves existing content', () => {
    const contentSentinel = { value: 'already-rendered' };
    const cardSentinel = { attached: true };
    const previousHomeState = {
        nativeHomeCardsAttached: true,
        nativeHomeStatusAttached: false,
        nativeHomeContentReady: true,
        nativeHomeVisibilityDiagnosticReported: true,
        nativeHomeFirstCard: cardSentinel
    };
    const result = executeSetNativeScreen('home', 'home', true, contentSentinel, previousHomeState);
    assert.equal(result.state.nativeCurrentScreen, 'home');
    assert.equal(result.fadeValueAtStore, false, 'same destination does not schedule a fade');
    assert.equal(result.state.nativeFadeNextScreen, false);
    assert.equal(result.state.nativeHomeCardsAttached, true, 'repeated Home retains attached rows');
    assert.equal(result.state.nativeHomeContentReady, true, 'repeated Home retains verified readiness');
    assert.equal(result.state.nativeHomeVisibilityDiagnosticReported, true,
        'an idempotent Home route does not reset a completed visibility report');
    assert.strictEqual(result.state.nativeHomeFirstCard, cardSentinel);
    assert.strictEqual(result.state.contentSentinel, contentSentinel, 'repeated feed updates retain rendered content');
});

test('status-only Home remains attached on repeated Home, then clears on a genuine route change', () => {
    const statusSentinel = { attached: true };
    const statusHomeState = {
        nativeHomeCardsAttached: false,
        nativeHomeStatusAttached: true,
        nativeHomeSessionUnprovenStatusAttached: true,
        nativeHomeContentReady: true,
        nativeHomeStatusView: statusSentinel
    };
    const repeated = executeSetNativeScreen('home', 'home', false, { value: 'status-only' }, statusHomeState);
    assert.equal(repeated.state.nativeHomeStatusAttached, true);
    assert.equal(repeated.state.nativeHomeSessionUnprovenStatusAttached, true);
    assert.strictEqual(repeated.state.nativeHomeStatusView, statusSentinel);

    const leftHome = executeSetNativeScreen('home', 'library', false, { value: 'status-only' }, statusHomeState);
    assert.equal(leftHome.state.nativeHomeStatusAttached, false);
    assert.equal(leftHome.state.nativeHomeSessionUnprovenStatusAttached, false);
    assert.equal(leftHome.state.nativeHomeContentReady, false);
    assert.equal(leftHome.state.nativeHomeStatusView, null);
});

test('D3 — a genuine Home to Search change stores the route and schedules a fade', () => {
    const previousHomeState = {
        nativeHomeCardsAttached: false,
        nativeHomeStatusAttached: true,
        nativeHomeSessionUnprovenStatusAttached: true,
        nativeHomeContentReady: true,
        nativeHomeVisibilityDiagnosticReported: true,
        nativeHomeFirstCard: { attached: true },
        nativeHomeStatusView: { attached: true }
    };
    const result = executeSetNativeScreen('home', 'search', false, { value: 'unchanged' }, previousHomeState);
    assert.equal(result.state.nativeCurrentScreen, 'search');
    assert.equal(result.fadeValueAtStore, true, 'different destination schedules the transition fade');
    assert.equal(result.state.nativeFadeNextScreen, true);
    assert.equal(result.state.nativeHomeCardsAttached, false, 'leaving Home invalidates card attachment state');
    assert.equal(result.state.nativeHomeStatusAttached, false, 'leaving Home invalidates status attachment state');
    assert.equal(result.state.nativeHomeSessionUnprovenStatusAttached, false,
        'leaving Home clears the status-only state so it cannot leak into Search or Library');
    assert.equal(result.state.nativeHomeContentReady, false, 'leaving Home invalidates visibility readiness');
    assert.equal(result.state.nativeHomeVisibilityDiagnosticReported, false,
        'a later Home visit gets a fresh one-shot measured-visibility diagnostic');
    assert.equal(result.state.nativeHomeFirstCard, null, 'leaving Home drops the stale card reference');
    assert.equal(result.state.nativeHomeStatusView, null, 'leaving Home drops the stale status reference');
});

test('invalid null/empty/URL destinations do not overwrite the last valid route', () => {
    for (const destination of [null, '', 'https://open.spotify.com/playlist/private-id', 'home?playlist=private-id']) {
        const result = executeSetNativeScreen('home', destination, true);
        assert.equal(result.state.nativeCurrentScreen, 'home');
        assert.equal(result.state.nativeFadeNextScreen, true);
        assert.equal(result.fadeValueAtStore, undefined, 'invalid route exits before state writes');
    }
});

test('the native screen route whitelist preserves every supported UI screen', () => {
    for (const screen of ['home', 'search', 'library', 'detail', 'player', 'settings']) {
        const result = executeSetNativeScreen('home', screen, false);
        assert.equal(result.state.nativeCurrentScreen, screen);
    }
});

function executeNativeRouteActivation(activity, destination) {
    const method = extractMethod(
        ACTIVITY,
        '.method public final activateNativeUiRoute(Ljava/lang/String;)V');
    const registers = { p0: activity, p1: destination };
    const instructions = [];
    const labels = new Map();
    for (const rawLine of method.split(/\r?\n/)) {
        const line = rawLine.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) {
            labels.set(line.slice(1), instructions.length);
            continue;
        }
        instructions.push(line);
    }
    let pendingResult;
    let pc = 0;
    let steps = 0;
    while (pc < instructions.length) {
        assert.ok(++steps <= 80, 'activateNativeUiRoute control flow must terminate');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^if-(eqz|nez) (\w+), :([\w$.-]+)$/.exec(instruction))) {
            const value = registers[match[2]];
            const zero = value == null || value === 0 || value === false;
            const takeBranch = match[1] === 'eqz' ? zero : !zero;
            if (takeBranch) {
                assert.ok(labels.has(match[3]), `route activation branch exists: :${match[3]}`);
                pc = labels.get(match[3]);
            }
            continue;
        }
        if ((match = /^const-string (\w+), "([^"]*)"$/.exec(instruction))) {
            registers[match[1]] = match[2];
            continue;
        }
        if ((match = /^const(?:\/4|\/16)? (\w+), (0x[0-9a-f]+|0x0|0x1|0x8)$/.exec(instruction))) {
            registers[match[1]] = Number.parseInt(match[2], 16);
            continue;
        }
        if ((match = /^iput-object (\w+), p0, .*->nativeExpectedSearch:Ljava\/lang\/String;$/.exec(instruction))) {
            activity.nativeExpectedSearch = registers[match[1]] === 0 ? null : registers[match[1]];
            continue;
        }
        if ((match = /^iget-object (\w+), p0, .*->(nativeCurrentScreen|nativeCurrentTitle):Ljava\/lang\/String;$/.exec(instruction))) {
            registers[match[1]] = activity[match[2]];
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z$/.exec(instruction))) {
            pendingResult = registers[match[1]] === registers[match[2]] ? 1 : 0;
            continue;
        }
        if ((match = /^move-result (\w+)$/.exec(instruction))) {
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+)\}, Landroid\/app\/Activity;->findViewById\(I\)Landroid\/view\/View;$/.exec(instruction))) {
            const id = registers[match[1]];
            pendingResult = (activity.missingViewIds || []).includes(id) ? null : { resourceId: id };
            continue;
        }
        if ((match = /^move-result-object (\w+)$/.exec(instruction))) {
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Landroid\/view\/View;->setVisibility\(I\)V$/.exec(instruction))) {
            activity.visibilityById = activity.visibilityById || {};
            activity.visibilityById[registers[match[1]].resourceId] = registers[match[2]];
            continue;
        }
        if ((match = /^invoke-virtual \{p0, p1\}, Lcom\/melodix\/music\/MainActivity;->setNativeScreen\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            const result = executeSetNativeScreen(
                activity.nativeCurrentScreen,
                destination,
                activity.nativeFadeNextScreen,
                activity.contentSentinel,
                activity);
            Object.assign(activity, {
                nativeCurrentScreen: result.state.nativeCurrentScreen,
                nativeFadeNextScreen: result.state.nativeFadeNextScreen,
                nativeHomeCardsAttached: result.state.nativeHomeCardsAttached,
                nativeHomeStatusAttached: result.state.nativeHomeStatusAttached,
                nativeHomeSessionUnprovenStatusAttached: result.state.nativeHomeSessionUnprovenStatusAttached,
                nativeHomeContentReady: result.state.nativeHomeContentReady,
                nativeHomeVisibilityDiagnosticReported: result.state.nativeHomeVisibilityDiagnosticReported
            });
            continue;
        }
        if ((match = /^goto :([\w$.-]+)$/.exec(instruction))) {
            assert.ok(labels.has(match[1]), `route activation goto exists: :${match[1]}`);
            pc = labels.get(match[1]);
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            activity.renderCalls = activity.renderCalls || [];
            activity.renderCalls.push({ title: registers[match[1]], json: registers[match[2]] });
            continue;
        }
        if (instruction === 'invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->showNativeUi()V') {
            activity.showCalls = (activity.showCalls || 0) + 1;
            activity.showResult = executeHomeReadinessGate(activity);
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->showNativeUiFrom\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            activity.showCalls = (activity.showCalls || 0) + 1;
            activity.showReason = registers[match[1]];
            activity.showOrigin = registers[match[2]];
            activity.showResult = executeHomeReadinessGate(activity);
            continue;
        }
        if (instruction === 'return-void') return activity;
        throw new Error(`Unreviewed opcode in activateNativeUiRoute: ${instruction}`);
    }
    throw new Error('activateNativeUiRoute completed without return-void');
}

function executeUiUpdateRunnable(activity, screen, action) {
    const source = fs.readFileSync(
        path.join(ROOT, 'smali/com/melodix/music/NativeUiUpdateRunnable.smali'), 'utf8');
    const method = extractMethod(source, '.method public final run()V');
    const runnable = { activity, screen, data: '', action };
    const registers = { p0: runnable };
    const instructions = [];
    const labels = new Map();
    for (const rawLine of method.split(/\r?\n/)) {
        const line = rawLine.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.') || line.startsWith(':try_')) continue;
        if (line.startsWith(':')) {
            labels.set(line.slice(1), instructions.length);
            continue;
        }
        instructions.push(line);
    }

    let pc = 0;
    let steps = 0;
    while (pc < instructions.length) {
        assert.ok(++steps <= 60, 'NativeUiUpdateRunnable control flow must terminate');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^iget-object (\w+), p0, .*->(activity|screen):L/.exec(instruction))) {
            registers[match[1]] = runnable[match[2]];
            continue;
        }
        if ((match = /^iget (\w+), p0, .*->action:I$/.exec(instruction))) {
            registers[match[1]] = runnable.action;
            continue;
        }
        if ((match = /^const\/4 (\w+), (0x[0-9a-f]+|0x0|0x1)$/.exec(instruction))) {
            registers[match[1]] = Number.parseInt(match[2], 16);
            continue;
        }
        if ((match = /^if-eqz (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] === 0) {
                assert.ok(labels.has(match[2]), `branch target exists: :${match[2]}`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^if-ne (\w+), (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] !== registers[match[2]]) {
                assert.ok(labels.has(match[3]), `branch target exists: :${match[3]}`);
                pc = labels.get(match[3]);
            }
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->activateNativeUiRoute\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            executeNativeRouteActivation(registers[match[1]], registers[match[2]]);
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+)\}, Lcom\/melodix\/music\/MainActivity;->showNativeUi\(\)V$/.exec(instruction))) {
            registers[match[1]].showCalls = (registers[match[1]].showCalls || 0) + 1;
            registers[match[1]].showResult = executeHomeReadinessGate(registers[match[1]]);
            continue;
        }
        if (instruction === 'return-void') return activity;
        // Any new route handoff side effect must be added to the strict
        // activation executor above instead of being silently accepted here.
        throw new Error(`Unreviewed opcode in NativeUiUpdateRunnable.run(): ${instruction}`);
    }
    throw new Error('NativeUiUpdateRunnable.run() completed without return-void');
}

function executeHomeReadinessGate(activity) {
    const method = extractMethod(
        ACTIVITY,
        '.method public final showNativeUiFrom(Ljava/lang/String;Ljava/lang/String;)V');
    const homeCheck = method.indexOf(':native_home_content_check');
    const contentCheck = method.indexOf('hasNativeHomeContentAttached()Z', homeCheck);
    const loadingState = method.indexOf('state\\\":\\\"loading', contentCheck);
    const rootLookup = method.indexOf('\n    :native_root_lookup\n', contentCheck);
    const rootShown = method.indexOf('native-root-found', rootLookup);
    assert.ok(homeCheck >= 0 && contentCheck > homeCheck && loadingState > contentCheck &&
        rootLookup > loadingState && rootShown > rootLookup,
    'missing Home content receives a native loading state before the native root is shown');
    assert.doesNotMatch(method, /revealWebUi\(\)V/,
        'the shell show path never falls back to Spotify Web');

    const homeOrUninitialized = activity.nativeCurrentScreen == null ||
        activity.nativeCurrentScreen === 'home';
    const contentAttached = Boolean(activity.nativeHomeCardsAttached || activity.nativeHomeStatusAttached);
    if (homeOrUninitialized && !contentAttached) {
        activity.nativeHomeStatusAttached = true;
        activity.nativeHomeSessionUnprovenStatusAttached = true;
        activity.nativeHomeStatusKind = 'loading';
        activity.nativeHomeContentReady = false;
    }
    activity.webViewVisible = true;
    activity.nativeRootVisibilityRequested = true;
    activity.nativeRootVisible = false;
    return 'native-root-requested';
}

test('D4 — Home route immediately shows native loading while the WebView remains mounted', () => {
    const contentSentinel = { value: 'no-home-payload-yet' };
    const activity = {
        nativeCurrentScreen: null,
        nativeFadeNextScreen: false,
        nativeHomeCardsAttached: false,
        nativeHomeStatusAttached: false,
        contentSentinel,
        webViewVisible: true,
        nativeRootVisible: false,
        showCalls: 0
    };
    executeUiUpdateRunnable(activity, 'home', 2);
    assert.equal(activity.nativeCurrentScreen, 'home', 'route runnable applies Home first');
    assert.equal(activity.showCalls, 1, 'Home route requests native ownership immediately');
    assert.equal(activity.showResult, 'native-root-requested');
    assert.equal(activity.nativeHomeStatusAttached, true, 'missing rows become explicit native loading state');
    assert.equal(activity.nativeHomeStatusKind, 'loading');
    assert.equal(activity.webViewVisible, true, 'the Spotify engine remains mounted beneath the shell');
    assert.equal(activity.nativeRootVisible, false, 'only the later measured callback confirms visible pixels');

    executeUiUpdateRunnable(activity, '', 0);
    assert.equal(activity.showCalls, 2, 'the readiness callback reasserts the native owner');
    assert.equal(activity.showResult, 'native-root-requested');
    assert.equal(activity.webViewVisible, true);
    assert.strictEqual(activity.contentSentinel, contentSentinel);
});

test('D4c — accepted Search, Library, detail, and Player routes reveal the native shell', () => {
    for (const screen of ['search', 'library', 'detail', 'player']) {
        const activity = {
            nativeCurrentScreen: 'home',
            nativeFadeNextScreen: false,
            nativeHomeCardsAttached: true,
            nativeHomeStatusAttached: false,
            nativeHomeContentReady: true,
            contentSentinel: { value: 'previous-home-content' },
            webViewVisible: true,
            nativeRootVisible: false,
            showCalls: 0
        };
        executeUiUpdateRunnable(activity, screen, 2);
        assert.equal(activity.nativeCurrentScreen, screen, `${screen}: native route is applied first`);
        assert.equal(activity.showCalls, 1, `${screen}: the Web Home owner cannot leave the native root hidden`);
        assert.equal(activity.nativeRootVisibilityRequested, true,
            `${screen}: showNativeUi requests the measured native surface`);
        if (screen === 'player') {
            assert.equal(activity.renderCalls, undefined, 'full-player controls are not replaced by a rows placeholder');
        } else if (screen === 'search') {
            assert.equal(activity.renderCalls, undefined, 'the browse grid is not hidden by an empty rows render');
            assert.equal(activity.nativeExpectedSearch, null);
            assert.equal(activity.visibilityById[0x7f09024f], 0, 'the real genre grid is visible');
            assert.equal(activity.visibilityById[0x7f090239], 8, 'stale result rows are hidden');
        } else {
            assert.equal(activity.renderCalls.length, 1,
                `${screen}: stale Home rows are cleared before new route data arrives`);
            assert.equal(activity.renderCalls[0].json, '[]',
                `${screen}: the initial placeholder does not contain stale Spotify rows`);
        }
    }
});

test('D4b — only the explicit login action can restore Web ownership', () => {
    const networkError = extractMethod(ACTIVITY, '.method public final D(Z)V');
    const reveal = extractMethod(ACTIVITY, '.method public final revealWebUi()V');
    const guarded = extractMethod(ACTIVITY, '.method public final revealWebUiFrom(Ljava/lang/String;Ljava/lang/String;)V');
    const login = extractMethod(ACTIVITY, '.method private final applyLoginWebUi(Ljava/lang/String;Ljava/lang/String;)V');
    const loginAction = extractMethod(ACTIVITY, '.method public final revealLoginWebUi()V');
    assert.match(networkError, /->N:Landroid\/widget\/FrameLayout;[\s\S]*?const\/4 v2, 0x4[\s\S]*?setVisibility\(I\)V/,
        'the network-error state makes the WebView container INVISIBLE');
    assert.match(reveal, /revealWebUiFrom\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
        'the legacy callback routes through the explicit login guard');
    assert.match(guarded, /isLoginWebRoute\(\)Z[\s\S]*?applyLoginWebUi[\s\S]*?showNativeUiFrom/,
        'a generic or late reveal request keeps native ownership unless login was explicitly requested');
    assert.match(loginAction, /nativeLoginWebRequested:Z[\s\S]*?applyLoginWebUi/,
        'the login button sets the allowed Web-owner state');
    assert.match(login, /0x7f09022f[\s\S]*?setVisibility\(I\)V[\s\S]*?N:Landroid\/widget\/FrameLayout;[\s\S]*?setVisibility\(I\)V/,
        'the explicit login path hides nativeRoot and restores the already-mounted WebView container');
    assert.doesNotMatch(reveal, /loadUrl|clearCache|clearHistory|removeAllCookies/,
        'the legacy request does not reload or clear session state');
});

test('D5 — Home, Search, Library, and back-to-Home route transitions execute in order', () => {
    let state = executeSetNativeScreen(null, 'home').state;
    const transitions = ['search', 'library', 'home'];
    const observed = [state.nativeCurrentScreen];
    for (const screen of transitions) {
        state = executeSetNativeScreen(state.nativeCurrentScreen, screen,
            state.nativeFadeNextScreen, state.contentSentinel).state;
        observed.push(state.nativeCurrentScreen);
    }
    assert.deepEqual(observed, ['home', 'search', 'library', 'home']);
    assert.equal(state.nativeCurrentScreen, 'home');
});

test('D6 — attached real cards allow only an async Home root request, not a render claim', () => {
    const activity = {
        nativeCurrentScreen: 'home',
        nativeFadeNextScreen: false,
        nativeHomeCardsAttached: true,
        nativeHomeStatusAttached: false,
        contentSentinel: { value: 'renderer-owned-content' },
        webViewVisible: true,
        nativeRootVisibilityRequested: false,
        nativeRootVisible: false,
        showCalls: 0
    };
    executeUiUpdateRunnable(activity, '', 0);
    assert.equal(activity.showCalls, 1);
    assert.equal(activity.showResult, 'native-root-requested');
    assert.equal(activity.webViewVisible, true, 'the WebView remains mounted beneath native UI');
    assert.equal(activity.nativeRootVisibilityRequested, true);
    assert.equal(activity.nativeRootVisible, false,
        'only a later Android visibility check can confirm pixels');
});

test('D6b — an attached explicit status view can request Home, but never sets the card flag', () => {
    const activity = {
        nativeCurrentScreen: 'home',
        nativeFadeNextScreen: false,
        nativeHomeCardsAttached: false,
        nativeHomeStatusAttached: true,
        contentSentinel: { value: 'renderer-owned-status' },
        webViewVisible: true,
        nativeRootVisibilityRequested: false,
        nativeRootVisible: false,
        showCalls: 0
    };
    executeUiUpdateRunnable(activity, '', 0);
    assert.equal(activity.showResult, 'native-root-requested');
    assert.equal(activity.nativeHomeCardsAttached, false,
        'an empty/loading/error state is not mislabeled as a Spotify card');
    assert.equal(activity.nativeHomeStatusAttached, true);
    assert.equal(activity.nativeHomeContentReady, undefined,
        'the status view is not pixel-ready until the Android measurement callback runs');
});

function executeNativeBackClick(activity) {
    const method = extractMethod(
        ACTIVITY,
        '.method public final onNativeBackClick(Landroid/view/View;)V');
    const registers = { p0: activity, p1: null };
    const instructions = [];
    const labels = new Map();
    for (const rawLine of method.split(/\r?\n/)) {
        const line = rawLine.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) {
            labels.set(line.slice(1), instructions.length);
            continue;
        }
        instructions.push(line);
    }

    let pendingResult;
    let pc = 0;
    let steps = 0;
    while (pc < instructions.length) {
        assert.ok(++steps <= 80, 'onNativeBackClick control flow must terminate');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^iget-object (\w+), p0, .*->(nativeReturnScreen|nativeReturnExpectedId|nativeReturnSearch|nativeReturnTitle|nativeReturnJson):Ljava\/lang\/String;$/.exec(instruction))) {
            registers[match[1]] = activity[match[2]];
            continue;
        }
        if ((match = /^const-string (\w+), ".*"$/.exec(instruction))) {
            registers[match[1]] = instruction.slice(instruction.indexOf(', ') + 2).slice(1, -1);
            continue;
        }
        if ((match = /^if-eqz (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] == null || registers[match[1]] === 0) {
                assert.ok(labels.has(match[2]), `branch target exists: :${match[2]}`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^goto :([\w$.-]+)$/.exec(instruction))) {
            assert.ok(labels.has(match[1]), `goto target exists: :${match[1]}`);
            pc = labels.get(match[1]);
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z$/.exec(instruction))) {
            pendingResult = registers[match[1]] === registers[match[2]] ? 1 : 0;
            continue;
        }
        if ((match = /^move-result (\w+)$/.exec(instruction))) {
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^iput-object (\w+), p0, .*->(nativeExpectedId|nativeExpectedSearch):Ljava\/lang\/String;$/.exec(instruction))) {
            activity[match[2]] = registers[match[1]];
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+)\}, Lcom\/melodix\/music\/MainActivity;->setNativeScreen\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            const route = executeSetNativeScreen(activity.nativeCurrentScreen, registers[match[1]],
                activity.nativeFadeNextScreen, activity.contentSentinel);
            activity.nativeCurrentScreen = route.state.nativeCurrentScreen;
            activity.nativeFadeNextScreen = route.state.nativeFadeNextScreen;
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            activity.renderedRows = { title: registers[match[1]], json: registers[match[2]] };
            continue;
        }
        if (instruction === 'return-void') return activity;
        throw new Error(`Unreviewed opcode in onNativeBackClick(): ${instruction}`);
    }
    throw new Error('onNativeBackClick() completed without return-void');
}

test('D7 — native Back restores the prior Library route, search state, title, and real rows', () => {
    const previousJson = JSON.stringify([
        { title: 'Saved playlist', uri: 'spotify:playlist:fixture-id' }
    ]);
    const activity = {
        nativeCurrentScreen: 'detail',
        nativeFadeNextScreen: false,
        nativeReturnScreen: 'library',
        nativeReturnExpectedId: 'collection:playlists',
        nativeExpectedId: 'detail:temporary',
        nativeReturnSearch: 'ambient',
        nativeExpectedSearch: 'old-query',
        nativeReturnTitle: 'Votre bibliothèque',
        nativeReturnJson: previousJson,
        contentSentinel: { value: 'retained' }
    };
    executeNativeBackClick(activity);
    assert.equal(activity.nativeCurrentScreen, 'library');
    assert.equal(activity.nativeExpectedId, 'collection:playlists');
    assert.equal(activity.nativeExpectedSearch, 'ambient');
    assert.deepEqual(activity.renderedRows, { title: 'Votre bibliothèque', json: previousJson });
    assert.deepEqual(JSON.parse(activity.renderedRows.json), [
        { title: 'Saved playlist', uri: 'spotify:playlist:fixture-id' }
    ]);
});

test('trace separates attached Home cards/status from measured visible native content', () => {
    const apply = extractMethod(ACTIVITY, '.method public final applyNativeUiData(');
    const received = apply.indexOf('"native-home-data-received"');
    const renderCall = apply.indexOf('->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V', received);
    assert.ok(received >= 0 && renderCall > received, 'Home data receipt is before the renderer call');

    const rendererSource = fs.readFileSync(
        path.join(ROOT, 'smali/com/melodix/music/NativeHomeShelfRenderer.smali'), 'utf8');
    const renderer = extractMethod(rendererSource, '.method public static render(');
    const addCard = renderer.indexOf('->addView(Landroid/view/View;)V');
    const markAttached = renderer.indexOf('noteNativeHomeCardAttached(Landroid/view/View;)V', addCard);
    const attachedStage = renderer.indexOf('"home-cards-attached"');
    const showNative = renderer.indexOf('->showNativeUi()V', attachedStage);
    assert.ok(addCard >= 0 && markAttached > addCard && attachedStage > markAttached &&
        showNative > attachedStage,
    'real Spotify cards report attachment before requesting the asynchronous visibility gate');
    assert.match(renderer, /renderHomeStatus[\s\S]*?native-home-status-attached[\s\S]*?showNativeUi\(\)V/,
        'explicit status panels have a separate attachment path');
    assert.doesNotMatch(renderer, /nativeHomeContentReady:Z|"home-rendered"/,
        'the renderer cannot turn addView into a pixel-visible success flag');

    const visible = extractMethod(ACTIVITY, '.method public final completeNativeUiVisibility(Z)Z');
    const firstContentCheck = visible.indexOf('hasMeasuredVisibleNativeHomeContent()Z');
    const splashHidden = visible.indexOf('hideStartupOverlay()V');
    const secondContentCheck = visible.indexOf('hasMeasuredVisibleNativeHomeContent()Z', firstContentCheck + 1);
    const homeRendered = visible.indexOf('"home-rendered"');
    assert.ok(firstContentCheck >= 0 && splashHidden > firstContentCheck &&
        secondContentCheck > splashHidden && homeRendered > secondContentCheck,
    'home-rendered and ready flags follow measured global content bounds after splash removal');
    assert.match(visible, /native-home-card-visible=true[\s\S]*?native-home-status-visible=true/);
    assert.match(visible, /sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->l:Z[\s\S]*?sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);

    const trace = fs.readFileSync(
        path.join(ROOT, 'smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali'), 'utf8');
    assert.match(trace, /getGlobalVisibleRect\(Landroid\/graphics\/Rect;\)Z/);
    assert.match(trace, /if-le v8, v9, :native_layout_root_checked/,
        'nativeRoot must be after its WebView horizontal-scroll host');
    assert.match(trace, /cmpl-float[\s\S]*?getGlobalVisibleRect[\s\S]*?completeNativeUiVisibility\(Z\)Z/);
    assert.match(trace, /:native_layout_give_up[\s\S]*?visibility-timeout[\s\S]*?native-shell-visibility-pending/);
    assert.doesNotMatch(trace, /revealWebUi\(\)V/,
        'late watchdog failure never transfers the foreground to Spotify Web');

    const show = extractMethod(ACTIVITY, '.method public final showNativeUiFrom(Ljava/lang/String;Ljava/lang/String;)V');
    const request = show.indexOf('"native-shell-show-requested"');
    const rootLookup = show.indexOf('->findViewById(I)Landroid/view/View;', show.indexOf(':native_root_lookup'));
    const found = show.indexOf('"native-root-found"', rootLookup);
    const returned = show.indexOf('"native-shell-show-request-returned"', found);
    assert.ok(request >= 0 && rootLookup > request && found > rootLookup && returned > found,
        'the owner request and root lookup precede the measured visibility callback');
});

test('native render failures are explicit and do not persist exception messages or stack traces', () => {
    const rendererSource = fs.readFileSync(
        path.join(ROOT, 'smali/com/melodix/music/NativeHomeShelfRenderer.smali'), 'utf8');
    const renderer = extractMethod(rendererSource, '.method public static render(');
    for (const reason of ['no-real-cards', 'content-container', 'invalid-json']) {
        assert.ok(renderer.includes(`native-render-failed step=home-render reason=${reason}`) ||
            renderer.includes(`native-render-failed step=home-render exception=JSONException reason=${reason}`),
        `renderer failure is identified: ${reason}`);
    }
    const updateSource = fs.readFileSync(
        path.join(ROOT, 'smali/com/melodix/music/NativeUiUpdateRunnable.smali'), 'utf8');
    const update = extractMethod(updateSource, '.method public final run()V');
    assert.match(update, /native-render-failed step=ui-update exception=/);
    assert.match(update, /Class;->getSimpleName\(\)Ljava\/lang\/String;/);
    assert.doesNotMatch(update, /NativeCrashGuard;->record\(Ljava\/lang\/Throwable;\)V|Log;->getStackTraceString|getMessage\(\)/,
        'caught render errors are reported by safe stage + class only');
});
