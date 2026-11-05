'use strict';

// Settings-load retry/acknowledgement and native timeout regression tests.
// Browser bridge calls are synthetic; no Spotify account or session is used.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const ROOT = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(ROOT, file), 'utf8');
const SHELL = read('scripts/native_ui_shell.source.js');
const ACTIVITY = read('smali/com/melodix/music/MainActivity.smali');

function extractMethod(source, signature) {
    const start = source.indexOf(signature);
    assert.ok(start >= 0, `missing method: ${signature}`);
    const end = source.indexOf('.end method', start);
    assert.ok(end > start, `unterminated method: ${signature}`);
    return source.slice(start, end);
}

function makeSettingsHarness() {
    const calls = [];
    const timers = new Map();
    let nextTimerId = 1;
    const store = new Map();
    class TestMutationObserver {
        observe() {}
        disconnect() {}
    }
    const document = {
        readyState: 'complete',
        visibilityState: 'visible',
        documentElement: {},
        body: { classList: { toggle() {}, add() {}, remove() {} } },
        querySelector: () => null,
        querySelectorAll: () => [],
        addEventListener() {}
    };
    const window = {
        __sfMediaLibSessionProofKnown: false,
        __sfMediaLibSessionProven: false,
        __sfMediaLibStatus: 'pending',
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/'
        },
        AndBridge: {
            onNativeUiReady() {},
            onNativeUiRoute() {},
            onNativeUiData(screen, data) { calls.push({ screen, data }); },
            logDiagEvent(message) { calls.push({ diagnostic: message }); }
        },
        MutationObserver: TestMutationObserver,
        addEventListener() {},
        dispatchEvent() {},
        setTimeout(callback, delay) {
            const id = nextTimerId++;
            timers.set(id, { callback, delay });
            return id;
        },
        clearTimeout(id) { timers.delete(id); },
        setInterval() { return 1; },
        clearInterval() {},
        localStorage: {
            getItem(key) { return store.has(key) ? store.get(key) : null; },
            setItem(key, value) { store.set(key, value); },
            clear() { store.clear(); }
        },
        sessionStorage: { clear() {} }
    };
    vm.runInNewContext(SHELL, { window, document, URL, MutationObserver: TestMutationObserver });
    // Startup readiness timers are unrelated to the settings request under test.
    timers.clear();
    calls.length = 0;

    function runNextTimer() {
        const entry = Array.from(timers.entries()).sort((a, b) => a[0] - b[0])[0];
        assert.ok(entry, 'expected a pending settings retry timer');
        timers.delete(entry[0]);
        entry[1].callback();
        return entry[1].delay;
    }

    return { calls, timers, window, runNextTimer };
}

function executeSettingsTimeout(currentGeneration, timerGeneration, loading, screen) {
    const method = extractMethod(ACTIVITY, '.method public final onNativeSettingsTimeout(I)V');
    const instructions = [];
    const labels = new Map();
    for (const raw of method.split(/\r?\n/)) {
        const line = raw.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) labels.set(line.slice(1), instructions.length);
        else instructions.push(line);
    }
    const state = {
        nativeSettingsGeneration: currentGeneration,
        nativeSettingsLoading: loading,
        nativeCurrentScreen: screen,
        renders: [],
        diagnostics: []
    };
    const registers = { p0: state, p1: timerGeneration };
    let pendingResult;
    let pc = 0;
    let steps = 0;
    while (pc < instructions.length) {
        assert.ok(++steps <= 80, 'settings timeout control flow terminates');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^iget (\w+), p0, .*->nativeSettingsGeneration:I$/.exec(instruction))) {
            registers[match[1]] = state.nativeSettingsGeneration;
            continue;
        }
        if ((match = /^iget-boolean (\w+), p0, .*->nativeSettingsLoading:Z$/.exec(instruction))) {
            registers[match[1]] = state.nativeSettingsLoading ? 1 : 0;
            continue;
        }
        if ((match = /^iget-object (\w+), p0, .*->nativeCurrentScreen:Ljava\/lang\/String;$/.exec(instruction))) {
            registers[match[1]] = state.nativeCurrentScreen;
            continue;
        }
        if ((match = /^if-ne (\w+), (p1|\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] !== registers[match[2]]) {
                assert.ok(labels.has(match[3]), `branch target :${match[3]} exists`);
                pc = labels.get(match[3]);
            }
            continue;
        }
        if ((match = /^if-eqz (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] == null || registers[match[1]] === 0) {
                assert.ok(labels.has(match[2]), `branch target :${match[2]} exists`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^const\/4 (\w+), (0x[0-9a-f]+)$/.exec(instruction))) {
            registers[match[1]] = Number.parseInt(match[2], 16);
            continue;
        }
        if ((match = /^const-string (\w+), "(.*)"$/.exec(instruction))) {
            registers[match[1]] = JSON.parse('\"' + match[2] + '\"');
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z$/.exec(instruction))) {
            pendingResult = registers[match[1]] === registers[match[2]] ? 1 : 0;
            continue;
        }
        if ((match = /^move-result(?:-object)? (\w+)$/.exec(instruction))) {
            assert.notEqual(pendingResult, undefined);
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^iput-boolean (\w+), p0, .*->nativeSettingsLoading:Z$/.exec(instruction))) {
            state.nativeSettingsLoading = Boolean(registers[match[1]]);
            continue;
        }
        if ((match = /^invoke-virtual \{p0\}, Lcom\/melodix\/music\/MainActivity;->isNativeSessionUnproven\(\)Z$/.exec(instruction))) {
            pendingResult = state.nativeSessionUnproven === false ? 0 : 1;
            continue;
        }
        if ((match = /^invoke-direct \{p0, (\w+)\}, Lcom\/melodix\/music\/MainActivity;->appendNativeAboutRows\(Ljava\/lang\/String;\)Ljava\/lang\/String;$/.exec(instruction))) {
            pendingResult = registers[match[1]]; // identity in the interpreter
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            state.renders.push({ title: registers[match[1]], json: registers[match[2]] });
            continue;
        }
        if (/^invoke-static \{\w+\}, Lcom\/melodix\/music\/(?:NativeCrashGuard;->diagLine|StartupDiagnosticOverlay;->appendDiagnosticLine)\(Ljava\/lang\/String;\)V$/.test(instruction)) {
            continue;
        }
        if (instruction === 'return-void') return state;
        if ((match = /^goto :([\w$.-]+)$/.exec(instruction))) {
            assert.ok(labels.has(match[1]), `goto target :${match[1]} exists`);
            pc = labels.get(match[1]);
            continue;
        }
        throw new Error(`unreviewed settings-timeout instruction: ${instruction}`);
    }
    throw new Error('settings timeout completed without return-void');
}

function executeCurrentSettingsPayload(payload, state) {
    const method = extractMethod(ACTIVITY,
        '.method private final isCurrentNativeSettingsPayload(Ljava/lang/String;)Z');
    const instructions = [];
    const labels = new Map();
    for (const raw of method.split(/\r?\n/)) {
        const line = raw.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) labels.set(line.slice(1), instructions.length);
        else instructions.push(line);
    }
    const registers = { p0: state, p1: payload };
    let pendingResult;
    let pc = 0;
    let steps = 0;
    while (pc < instructions.length) {
        assert.ok(++steps <= 100, 'Settings payload validation terminates');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^new-instance (\w+), Lorg\/json\/JSONArray;$/.exec(instruction))) {
            registers[match[1]] = null;
            continue;
        }
        if ((match = /^invoke-direct \{(\w+), (\w+)\}, Lorg\/json\/JSONArray;-><init>\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            try {
                const rows = JSON.parse(registers[match[2]]);
                if (!Array.isArray(rows)) return 0;
                registers[match[1]] = rows;
            } catch (_) {
                return 0;
            }
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+)\}, Lorg\/json\/JSONArray;->length\(\)I$/.exec(instruction))) {
            pendingResult = registers[match[1]].length;
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Lorg\/json\/JSONArray;->optJSONObject\(I\)Lorg\/json\/JSONObject;$/.exec(instruction))) {
            const row = registers[match[1]][registers[match[2]]];
            pendingResult = row && typeof row === 'object' && !Array.isArray(row) ? row : null;
            continue;
        }
        if ((match = /^const-string (\w+), "(.*)"$/.exec(instruction))) {
            registers[match[1]] = JSON.parse('\"' + match[2] + '\"');
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+), (\w+)\}, Lorg\/json\/JSONObject;->optInt\(Ljava\/lang\/String;I\)I$/.exec(instruction))) {
            const value = registers[match[1]] && registers[match[1]][registers[match[2]]];
            let parsed = registers[match[3]];
            if (typeof value === 'number' && Number.isFinite(value)) parsed = Math.trunc(value);
            else if (typeof value === 'string' && value.trim() !== '' && Number.isFinite(Number(value))) {
                parsed = Math.trunc(Number(value));
            }
            pendingResult = parsed;
            continue;
        }
        if ((match = /^move-result(?:-object)? (\w+)$/.exec(instruction))) {
            assert.notEqual(pendingResult, undefined, 'move-result follows an invoked method');
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^const(?:\/4|\/16)? (\w+), (0x[0-9a-f]+)$/.exec(instruction))) {
            registers[match[1]] = Number.parseInt(match[2], 16);
            continue;
        }
        if ((match = /^iget(?:-boolean)? (\w+), p0, .*->(nativeSettingsGeneration|nativeSettingsReadyGeneration|nativeSettingsLoading):[IZ]$/.exec(instruction))) {
            const value = state[match[2]];
            registers[match[1]] = match[2] === 'nativeSettingsLoading' ? (value ? 1 : 0) : value;
            continue;
        }
        if ((match = /^if-eqz (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] == null || registers[match[1]] === 0) {
                assert.ok(labels.has(match[2]), `branch target :${match[2]} exists`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^if-nez (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] != null && registers[match[1]] !== 0) {
                assert.ok(labels.has(match[2]), `branch target :${match[2]} exists`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^if-lez (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] <= 0) {
                assert.ok(labels.has(match[2]), `branch target :${match[2]} exists`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^if-gt (\w+), (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] > registers[match[2]]) {
                assert.ok(labels.has(match[3]), `branch target :${match[3]} exists`);
                pc = labels.get(match[3]);
            }
            continue;
        }
        if ((match = /^if-ne (\w+), (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] !== registers[match[2]]) {
                assert.ok(labels.has(match[3]), `branch target :${match[3]} exists`);
                pc = labels.get(match[3]);
            }
            continue;
        }
        if ((match = /^goto :([\w$.-]+)$/.exec(instruction))) {
            assert.ok(labels.has(match[1]), `branch target :${match[1]} exists`);
            pc = labels.get(match[1]);
            continue;
        }
        if ((match = /^move-exception (\w+)$/.exec(instruction))) {
            registers[match[1]] = new Error('invalid JSONArray');
            continue;
        }
        if ((match = /^return (\w+)$/.exec(instruction))) return Number(registers[match[1]]);
        throw new Error(`unreviewed Settings payload instruction: ${instruction}`);
    }
    throw new Error('Settings payload validation completed without return');
}

test('a delayed Settings callback is acknowledged after native application and stops retries', () => {
    const harness = makeSettingsHarness();
    const { window, calls, timers, runNextTimer } = harness;
    const requestId = 41;

    assert.equal(window.__sfNativeSettingsRequest(requestId), true);
    assert.equal(calls.filter((call) => call.screen === 'settings').length, 1);
    assert.equal(window.__sfNativeSettingsAttemptCount, 1);
    assert.equal(runNextTimer(), 900);
    assert.equal(calls.filter((call) => call.screen === 'settings').length, 2,
        'a missing native acknowledgement causes one bounded retry');

    const rows = JSON.parse(calls.filter((call) => call.screen === 'settings')[1].data);
    assert.ok(rows.length > 0);
    assert.ok(rows.every((row) => row.__sfSettingsRequestId === requestId),
        'every row carries only the bounded request generation needed to reject stale responses');
    assert.equal(window.__sfNativeSettingsApplied(requestId, rows.length), true);
    assert.equal(window.__sfNativeSettingsAckedRequestId, requestId);
    assert.equal(timers.size, 0, 'confirmation cancels remaining retry timers');
    assert.equal(calls.filter((call) => call.screen === 'settings').length, 2,
        'the delayed callback does not trigger an unnecessary third request');
});

test('an absent native Settings callback is retried only three times and exhausts explicitly', () => {
    const harness = makeSettingsHarness();
    const { window, calls, runNextTimer } = harness;
    const requestId = 52;
    window.AndBridge.onNativeUiData = undefined;

    assert.equal(window.__sfNativeSettingsRequest(requestId), true);
    assert.equal(window.__sfNativeSettingsAttemptCount, 1);
    runNextTimer();
    assert.equal(window.__sfNativeSettingsAttemptCount, 2);
    runNextTimer();
    assert.equal(window.__sfNativeSettingsAttemptCount, 3);
    assert.equal(calls.filter((call) => call.screen === 'settings').length, 0,
        'missing bridge callbacks do not fabricate an empty or partial settings list');
    assert.equal(window.__sfNativeSettingsRequestExhaustedId, requestId);
    assert.equal(harness.timers.size, 0, 'there is no unbounded retry loop');
});

test('native Settings reject uncorrelated or stale payloads and acknowledge only bounded applied rows', () => {
    const validator = extractMethod(ACTIVITY,
        '.method private final isCurrentNativeSettingsPayload(Ljava/lang/String;)Z');
    const applied = extractMethod(ACTIVITY,
        '.method private final markNativeSettingsPayloadApplied(Ljava/lang/String;)V');
    const serializer = SHELL.slice(
        SHELL.indexOf('function sendNativeUiData('),
        SHELL.indexOf('// Route changes precede payloads', SHELL.indexOf('function sendNativeUiData('))
    );
    assert.match(serializer, /row\.settingValue = item\.settingValue[\s\S]*?row\.__sfSettingsRequestId = settingsRequestId/,
        'the bounded generation is serialized on Settings lines after their visible value');
    assert.match(validator, /__sfSettingsRequestId/);
    assert.match(validator, /if-lez v4, :native_settings_payload_reject/,
        'missing and non-positive request IDs are rejected even while loading');
    assert.match(validator, /0xf423f[\s\S]*?if-gt v4, v0, :native_settings_payload_reject/,
        'the native gate rejects unbounded request IDs');
    assert.match(validator, /nativeSettingsGeneration:I[\s\S]*?if-ne v4, v0, :native_settings_payload_reject/,
        'only the active Settings generation can be applied');
    assert.match(validator, /nativeSettingsReadyGeneration:I[\s\S]*?if-ne v4, v0, :native_settings_payload_reject/,
        'post-load refresh rows are accepted only for the generation already acknowledged');
    assert.match(applied, /if-lez v4, :native_settings_applied_done[\s\S]*?nativeSettingsGeneration:I[\s\S]*?if-ne v4, v5, :native_settings_applied_done/,
        'an absent/stale generation cannot mark a Settings response applied');

    const active = {
        nativeSettingsGeneration: 41,
        nativeSettingsReadyGeneration: 0,
        nativeSettingsLoading: true
    };
    const payload = (requestId) => JSON.stringify([{
        title: 'Lecture locale', settingValue: 'Activé',
        ...(requestId === undefined ? {} : { __sfSettingsRequestId: requestId })
    }]);
    assert.equal(executeCurrentSettingsPayload(payload(), active), 0,
        'rows with no serialized request ID are rejected while the load is pending');
    assert.equal(executeCurrentSettingsPayload(payload(40), active), 0,
        'a late response from the previous generation is rejected');
    assert.equal(executeCurrentSettingsPayload(payload(41), active), 1,
        'the current generation is accepted while its Settings load is active');
    assert.equal(executeCurrentSettingsPayload(payload(1000000), active), 0,
        'out-of-range correlation IDs are rejected');
    assert.equal(executeCurrentSettingsPayload('not-json', active), 0,
        'malformed payloads fail closed');
    assert.equal(executeCurrentSettingsPayload(JSON.stringify(Array.from({ length: 1001 },
        () => ({ __sfSettingsRequestId: 41 }))), active), 0,
        'oversized row payloads fail closed');

    const completed = { ...active, nativeSettingsLoading: false, nativeSettingsReadyGeneration: 41 };
    assert.equal(executeCurrentSettingsPayload(payload(41), completed), 1,
        'a same-generation refresh is accepted after the initial ACK');
    completed.nativeSettingsReadyGeneration = 40;
    assert.equal(executeCurrentSettingsPayload(payload(41), completed), 0,
        'after loading, only the generation that was actually acknowledged is accepted');
});

test('native Settings timeout replaces loading with a retryable error, and rejects stale deadlines', () => {
    const begin = extractMethod(ACTIVITY, '.method public final beginNativeSettingsLoad()V');
    const timeout = extractMethod(ACTIVITY, '.method public final onNativeSettingsTimeout(I)V');
    const applied = extractMethod(ACTIVITY, '.method private final markNativeSettingsPayloadApplied(Ljava/lang/String;)V');
    const apply = extractMethod(ACTIVITY, '.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');

    assert.match(begin, /Chargement des paramètres/);
    assert.doesNotMatch(begin, /const-string v2, "\[\]"/);
    assert.match(begin, /0x1194[\s\S]*?postDelayed\(Ljava\/lang\/Runnable;J\)Z/,
        'the native watchdog has a fixed 4500ms deadline');
    assert.match(timeout, /nativeSettingsGeneration:I[\s\S]*?nativeSettingsLoading:Z[\s\S]*?"settings"/);
    assert.match(timeout, /Paramètres indisponibles[\s\S]*?melodix:action:retry-settings/);
    assert.match(applied, /nativeSettingsReadyGeneration:I[\s\S]*?nativeSettingsLoading:Z[\s\S]*?__sfNativeSettingsApplied/);
    assert.match(apply, /isCurrentNativeSettingsPayload[\s\S]*?renderNativeRows[\s\S]*?markNativeSettingsPayloadApplied/,
        'native acknowledgement follows route/generation validation and row application');

    const timedOut = executeSettingsTimeout(7, 7, true, 'settings');
    assert.equal(timedOut.nativeSettingsLoading, false);
    assert.equal(timedOut.renders.length, 1);
    const errorRows = JSON.parse(timedOut.renders[0].json);
    assert.equal(errorRows[0].title, 'Paramètres indisponibles');
    assert.equal(errorRows[0].uri, 'melodix:action:retry-settings');
    // Unproven session (default in the interpreter): the fallback carries the
    // real connect and notifications actions, plus the About injection point.
    assert.ok(errorRows.some((r) => r.uri === 'melodix:action:open-login'), 'fallback offers a real connect action');
    assert.ok(errorRows.some((r) => r.uri === 'melodix:action:open-notifications'), 'fallback offers the real notifications screen');
    assert.ok(errorRows.some((r) => r.title === 'État de la connexion Spotify' && r.settingValue === 'Se connecter'));

    const staleDeadline = executeSettingsTimeout(7, 6, true, 'settings');
    assert.equal(staleDeadline.nativeSettingsLoading, true);
    assert.equal(staleDeadline.renders.length, 0,
        'an old timer cannot overwrite a newer Settings request');
    const routeChanged = executeSettingsTimeout(7, 7, true, 'home');
    assert.equal(routeChanged.nativeSettingsLoading, true);
    assert.equal(routeChanged.renders.length, 0,
        'a timeout for Settings cannot replace another screen');
});
