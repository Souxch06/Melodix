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
function executeSetNativeScreen(previousScreen, destination, previousFade = false, contentSentinel = { value: 'unchanged' }) {
    const method = extractMethod(
        ACTIVITY,
        '.method public final setNativeScreen(Ljava/lang/String;)V');
    const state = {
        nativeCurrentScreen: previousScreen,
        nativeFadeNextScreen: previousFade,
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
    const result = executeSetNativeScreen('home', 'home', true, contentSentinel);
    assert.equal(result.state.nativeCurrentScreen, 'home');
    assert.equal(result.fadeValueAtStore, false, 'same destination does not schedule a fade');
    assert.equal(result.state.nativeFadeNextScreen, false);
    assert.strictEqual(result.state.contentSentinel, contentSentinel, 'repeated feed updates retain rendered content');
});

test('D3 — a genuine Home to Search change stores the route and schedules a fade', () => {
    const result = executeSetNativeScreen('home', 'search', false);
    assert.equal(result.state.nativeCurrentScreen, 'search');
    assert.equal(result.fadeValueAtStore, true, 'different destination schedules the transition fade');
    assert.equal(result.state.nativeFadeNextScreen, true);
});

test('invalid null/empty destinations do not overwrite the last valid route', () => {
    for (const destination of [null, '']) {
        const result = executeSetNativeScreen('home', destination, true);
        assert.equal(result.state.nativeCurrentScreen, 'home');
        assert.equal(result.state.nativeFadeNextScreen, true);
        assert.equal(result.fadeValueAtStore, undefined, 'invalid route exits before state writes');
    }
});

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
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->setNativeScreen\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            const result = executeSetNativeScreen(
                registers[match[1]].nativeCurrentScreen,
                registers[match[2]],
                registers[match[1]].nativeFadeNextScreen,
                registers[match[1]].contentSentinel);
            Object.assign(registers[match[1]], {
                nativeCurrentScreen: result.state.nativeCurrentScreen,
                nativeFadeNextScreen: result.state.nativeFadeNextScreen
            });
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+)\}, Lcom\/melodix\/music\/MainActivity;->showNativeUi\(\)V$/.exec(instruction))) {
            registers[match[1]].showCalls = (registers[match[1]].showCalls || 0) + 1;
            registers[match[1]].showResult = executeHomeReadinessGate(registers[match[1]]);
            continue;
        }
        if (instruction === 'return-void') return activity;
        // The route and ready branches under test must not silently begin
        // invoking unrelated data/render callbacks.
        throw new Error(`Unreviewed opcode in NativeUiUpdateRunnable.run(): ${instruction}`);
    }
    throw new Error('NativeUiUpdateRunnable.run() completed without return-void');
}

function executeHomeReadinessGate(activity) {
    const method = extractMethod(
        ACTIVITY,
        '.method public final showNativeUi()V');
    const homeCheck = method.indexOf(':show_native_root');
    const homeGate = method.indexOf(':native_home_ready_check', homeCheck);
    const readyRead = method.indexOf('->nativeHomeContentReady:Z', homeGate);
    const blocked = method.indexOf('native-shell-show-blocked reason=home-content-not-ready', readyRead);
    const webFallback = method.indexOf('->revealWebUi()V', blocked);
    const rootLookup = method.indexOf('\n    :native_root_lookup\n', readyRead);
    assert.ok(homeCheck >= 0 && homeGate > homeCheck && readyRead > homeGate &&
        blocked > readyRead && webFallback > blocked && rootLookup > webFallback,
    'the no-content gate must block before root lookup and reveal the original WebView');

    const homeOrUninitialized = activity.nativeCurrentScreen == null ||
        activity.nativeCurrentScreen === 'home';
    if (homeOrUninitialized && !activity.nativeHomeContentReady) {
        activity.webViewVisible = true;
        activity.nativeRootVisible = false;
        return 'blocked-no-content';
    }
    activity.webViewVisible = false;
    activity.nativeRootVisible = true;
    return 'native-root-requested';
}

test('D4 — Home route queued before readiness is applied; empty Home keeps the WebView visible', () => {
    const contentSentinel = { value: 'no-home-payload-yet' };
    const activity = {
        nativeCurrentScreen: null,
        nativeFadeNextScreen: false,
        nativeHomeContentReady: false,
        contentSentinel,
        webViewVisible: true,
        nativeRootVisible: false,
        showCalls: 0
    };
    executeUiUpdateRunnable(activity, 'home', 2);
    assert.equal(activity.nativeCurrentScreen, 'home', 'route runnable applies Home first');
    assert.equal(activity.showCalls, 0, 'route changes do not claim readiness or show the shell');

    executeUiUpdateRunnable(activity, '', 0);
    assert.equal(activity.showCalls, 1, 'ready runnable reaches showNativeUi');
    assert.equal(activity.showResult, 'blocked-no-content');
    assert.equal(activity.webViewVisible, true, 'no-content path preserves Spotify WebView');
    assert.equal(activity.nativeRootVisible, false, 'no-content path does not cover the page');
    assert.strictEqual(activity.contentSentinel, contentSentinel);
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

test('D6 — renderer readiness is the gate that allows a Home shell request', () => {
    const activity = {
        nativeCurrentScreen: 'home',
        nativeFadeNextScreen: false,
        nativeHomeContentReady: true,
        contentSentinel: { value: 'real-renderer-owned-content' },
        webViewVisible: true,
        nativeRootVisible: false,
        showCalls: 0
    };
    executeUiUpdateRunnable(activity, '', 0);
    assert.equal(activity.showCalls, 1);
    assert.equal(activity.showResult, 'native-root-requested');
    assert.equal(activity.webViewVisible, false);
    assert.equal(activity.nativeRootVisible, true);
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

test('trace events follow the route, data, real-card render, and visible-root operations', () => {
    const apply = extractMethod(ACTIVITY, '.method public final applyNativeUiData(');
    const received = apply.indexOf('"native-home-data-received"');
    const renderCall = apply.indexOf('->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V', received);
    assert.ok(received >= 0 && renderCall > received, 'Home data receipt is before the renderer call');

    const rendererSource = fs.readFileSync(
        path.join(ROOT, 'smali/com/melodix/music/NativeHomeShelfRenderer.smali'), 'utf8');
    const renderer = extractMethod(rendererSource, '.method public static render(');
    const addCard = renderer.indexOf('->addView(Landroid/view/View;)V');
    const markContentReady = renderer.indexOf('->nativeHomeContentReady:Z', addCard);
    const rowsRendered = renderer.indexOf('"native-home-rows-rendered"');
    const success = renderer.indexOf('"native-home-render rendered=true"', rowsRendered);
    const homeRendered = renderer.indexOf('"home-rendered"', success);
    const showNative = renderer.indexOf('->showNativeUi()V', homeRendered);
    assert.ok(addCard >= 0 && markContentReady > addCard && rowsRendered > markContentReady &&
        success > rowsRendered && homeRendered > success && showNative > homeRendered,
    'success traces and shell takeover must follow actual child attachment/readiness');

    const show = extractMethod(ACTIVITY, '.method public final showNativeUi()V');
    const request = show.indexOf('"native-shell-show-requested"');
    const rootLookup = show.indexOf('->findViewById(I)Landroid/view/View;', show.indexOf(':native_root_lookup'));
    const found = show.indexOf('"native-root-found"', rootLookup);
    const initialized = show.indexOf('"native-screen-initialized"', found);
    const completed = show.indexOf('"native-shell-show-completed"', initialized);
    assert.ok(request >= 0 && rootLookup > request && found > rootLookup &&
        initialized > found && completed > initialized,
    'root-found, screen-initialized, and completed are reported only after their respective steps');
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
