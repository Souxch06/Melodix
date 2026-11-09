'use strict';

// Execute the relevant Smali branches with a deliberately small interpreter.
// This proves the empty/nonempty settingValue split and the action/collection
// routing order, rather than inferring behavior from a text search.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const ACTIVITY = fs.readFileSync(
    path.join(ROOT, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

function extractMethod(source, signature) {
    const start = source.indexOf(signature);
    assert.ok(start >= 0, `missing method ${signature}`);
    const end = source.indexOf('.end method', start);
    assert.ok(end > start, `unterminated method ${signature}`);
    return source.slice(start, end);
}

function parseInstructions(method) {
    const instructions = [];
    const labels = new Map();
    for (const raw of method.split(/\r?\n/)) {
        const line = raw.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) {
            assert.ok(!labels.has(line.slice(1)), `duplicate label ${line}`);
            labels.set(line.slice(1), instructions.length);
        } else {
            instructions.push(line);
        }
    }
    return { instructions, labels };
}

function executeRowFactory(settingValue) {
    const method = extractMethod(ACTIVITY,
        '.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
    const start = method.lastIndexOf(':native_row_build_card');
    const end = method.indexOf('\n    :native_row_created\n', start);
    assert.ok(start >= 0 && end > start, 'row dispatch block is present');
    const block = method.slice(start, end + '\n    :native_row_created'.length);
    const { instructions, labels } = parseInstructions(block);
    const row = { settingValue };
    const registers = { p0: {}, v6: row };
    let pendingResult;
    let selectedFactory = null;
    let pc = 0;
    let steps = 0;

    while (pc < instructions.length) {
        assert.ok(++steps <= 30, 'row factory dispatch terminates');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^const-string (\w+), "(.*)"$/.exec(instruction))) {
            registers[match[1]] = match[2];
            continue;
        }
        if (/^invoke-virtual \{v6, v0\}, Lorg\/json\/JSONObject;->optString\(Ljava\/lang\/String;\)Ljava\/lang\/String;$/.test(instruction)) {
            pendingResult = typeof row[registers.v0] === 'string' ? row[registers.v0] : '';
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+)\}, Ljava\/lang\/String;->isEmpty\(\)Z$/.exec(instruction))) {
            assert.equal(typeof registers[match[1]], 'string');
            pendingResult = registers[match[1]].length === 0 ? 1 : 0;
            continue;
        }
        if ((match = /^move-result-object (\w+)$/.exec(instruction))) {
            assert.notEqual(pendingResult, undefined, 'move-result-object follows an invoke');
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^move-result (\w+)$/.exec(instruction))) {
            assert.notEqual(pendingResult, undefined, 'move-result follows an invoke');
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^if-nez (\w+), :([\w$.-]+)$/.exec(instruction))) {
            if (registers[match[1]] !== 0) {
                assert.ok(labels.has(match[2]), `branch target :${match[2]} exists`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if (/^invoke-static \{p0, v0, v1\}, Lcom\/melodix\/music\/NativeRowGeometryProbe;->attach\(Landroid\/content\/Context;Landroid\/view\/View;Ljava\/lang\/String;\)V$/.test(instruction)) {
            // MEL-BUG-001 diagnostic, explicitly reviewed rather than allowed by
            // loosening this guard. It returns void, so it must neither leave a
            // pending result nor replace the row the factory just produced.
            assert.equal(registers.v0, selectedFactory,
                'the geometry probe must not replace the created row in v0');
            assert.equal(pendingResult, undefined,
                'a void diagnostic call must not leave a pending result');
            continue;
        }
        if ((match = /^invoke-static \{p0, v6\}, Lcom\/melodix\/music\/(NativeSettingsRowFactory|NativeUiRowFactory);->create/.exec(instruction))) {
            selectedFactory = match[1];
            pendingResult = selectedFactory;
            continue;
        }
        if (/^goto :native_row_created$/.test(instruction)) {
            assert.ok(labels.has('native_row_created'));
            pc = labels.get('native_row_created');
            return selectedFactory;
        }
        throw new Error(`unreviewed row-dispatch instruction: ${instruction}`);
    }
    return selectedFactory;
}

function executeOpenNativeRow(uri, title = 'Test collection') {
    const method = extractMethod(ACTIVITY,
        '.method public final openNativeRow(Ljava/lang/String;Ljava/lang/String;)V');
    const { instructions, labels } = parseInstructions(method);
    const state = {
        nativeCurrentScreen: 'library',
        nativeCurrentTitle: 'Votre bibliothèque',
        nativeCurrentJson: '[{"title":"preserved"}]',
        nativeExpectedId: null,
        nativeExpectedSearch: null,
        nativeReturnScreen: null,
        nativeReturnTitle: null,
        nativeReturnJson: null,
        nativeReturnExpectedId: null,
        nativeReturnSearch: null,
        javascript: [],
        functions: [],
        renders: [],
        retrySettings: 0,
        opensLogin: 0,
        opensSettings: 0
    };
    const registers = { p0: state, p1: uri, p2: title };
    let pendingResult;
    let pc = 0;
    let steps = 0;

    while (pc < instructions.length) {
        assert.ok(++steps <= 180, 'native row click routing terminates');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^const\/4 (\w+), (0x[0-9a-f]+)$/.exec(instruction))) {
            registers[match[1]] = Number.parseInt(match[2], 16);
            continue;
        }
        if ((match = /^const-string (\w+), "(.*)"$/.exec(instruction))) {
            registers[match[1]] = match[2];
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
            if (registers[match[1]] !== 0 && registers[match[1]] != null) {
                assert.ok(labels.has(match[2]), `branch target :${match[2]} exists`);
                pc = labels.get(match[2]);
            }
            continue;
        }
        if ((match = /^invoke-virtual \{(p1|v\d+)\}, Ljava\/lang\/String;->isEmpty\(\)Z$/.exec(instruction))) {
            assert.equal(typeof registers[match[1]], 'string');
            pendingResult = registers[match[1]].length === 0 ? 1 : 0;
            continue;
        }
        if ((match = /^invoke-virtual \{(p1|v\d+), (v\d+)\}, Ljava\/lang\/String;->(equals|startsWith|contains)\(Ljava\/lang\/(Object|String|CharSequence);\)Z$/.exec(instruction))) {
            const left = registers[match[1]];
            const right = registers[match[2]];
            assert.equal(typeof left, 'string');
            if (match[3] === 'equals') pendingResult = left === right ? 1 : 0;
            else if (match[3] === 'startsWith') pendingResult = left.startsWith(right) ? 1 : 0;
            else pendingResult = left.includes(right) ? 1 : 0;
            continue;
        }
        if ((match = /^move-result (\w+)$/.exec(instruction))) {
            assert.notEqual(pendingResult, undefined, 'move-result follows an invoke');
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^or-int\/2addr (\w+), (\w+)$/.exec(instruction))) {
            registers[match[1]] = (registers[match[1]] | registers[match[2]]) >>> 0;
            continue;
        }
        if ((match = /^goto :([\w$.-]+)$/.exec(instruction))) {
            assert.ok(labels.has(match[1]), `branch target :${match[1]} exists`);
            pc = labels.get(match[1]);
            continue;
        }
        if ((match = /^iget-object (\w+), p0, .*->(nativeCurrentScreen|nativeCurrentTitle|nativeCurrentJson|nativeExpectedId|nativeExpectedSearch):Ljava\/lang\/String;$/.exec(instruction))) {
            registers[match[1]] = state[match[2]];
            continue;
        }
        if ((match = /^iput-object (p1|p2|v\d+), p0, .*->(nativeReturnScreen|nativeReturnTitle|nativeReturnJson|nativeReturnExpectedId|nativeReturnSearch|nativeExpectedId):Ljava\/lang\/String;$/.exec(instruction))) {
            state[match[2]] = registers[match[1]];
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (v\d+)\}, Lcom\/melodix\/music\/MainActivity;->setNativeScreen\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            state.nativeCurrentScreen = registers[match[1]];
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (v\d+)\}, Lcom\/melodix\/music\/MainActivity;->runNativeJavascript\(Ljava\/lang\/String;\)V$/.exec(instruction))) {
            state.javascript.push(registers[match[1]]);
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (v\d+), (p1|p2|v\d+)\}, Lcom\/melodix\/music\/MainActivity;->runNativeFunction\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            state.functions.push({ name: registers[match[1]], argument: registers[match[2]] });
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (v\d+), (v\d+)\}, Lcom\/melodix\/music\/MainActivity;->renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            state.renders.push({ title: registers[match[1]], json: registers[match[2]] });
            continue;
        }
        if ((match = /^move-object (v\d+), (p\d+)$/.exec(instruction))) {
            registers[match[1]] = registers[match[2]];
            continue;
        }
        if (instruction === 'invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->retryNativeSettings()V') {
            state.retrySettings += 1;
            continue;
        }
        if (instruction === 'invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->openSpotifyLogin()V') {
            state.opensLogin += 1;
            continue;
        }
        if (instruction === 'invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->openNativeSettings()V') {
            state.opensSettings += 1;
            continue;
        }
        if (instruction === 'invoke-static {p0}, Lcom/melodix/music/NativeSessionRecovery;->verify(Lcom/melodix/music/MainActivity;)V') {
            state.verifications = (state.verifications || 0) + 1;
            continue;
        }
        if (instruction === 'invoke-static {p0}, Lcom/melodix/music/NativeSessionReconnect;->start(Lcom/melodix/music/MainActivity;)V') {
            state.reconnections = (state.reconnections || 0) + 1;
            continue;
        }
        if (instruction === 'return-void') return state;
        throw new Error(`unreviewed openNativeRow instruction: ${instruction}`);
    }
    throw new Error('openNativeRow completed without return-void');
}

test('renderNativeRows routes empty settingValue to content and nonempty settingValue to settings', () => {
    assert.equal(executeRowFactory(''), 'NativeUiRowFactory',
        'content rows with no settingValue receive the cover/content renderer');
    assert.equal(executeRowFactory('ON'), 'NativeSettingsRowFactory',
        'a true setting row with settingValue receives the settings renderer');
});

test('retry-library dispatches cookie-preserving verification with Javascript recovery', () => {
    const result = executeOpenNativeRow('melodix:action:retry-library');
    assert.equal(result.verifications, 1);
    assert.deepEqual(result.javascript, []);
    assert.match(fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/NativeSessionRecovery.smali'), 'utf8'), /__sfRequestSessionVerification/);
    assert.equal(result.functions.length, 0);
    assert.equal(result.renders.length, 0);
});

test('Spotify and Melodix settings URIs are dispatched before collection fallback', () => {
    for (const uri of ['spotify:settings:shuffle', 'melodix:setting:canvas']) {
        const result = executeOpenNativeRow(uri);
        assert.deepEqual(result.functions, [{
            name: 'window.__sfToggleSpotifySetting', argument: uri
        }]);
        assert.equal(result.nativeCurrentScreen, 'library', 'settings do not navigate to detail');
        assert.equal(result.renders.length, 0);
    }
});

test('the explicit Settings retry action restarts the bounded native load', () => {
    const result = executeOpenNativeRow('melodix:action:retry-settings');
    assert.equal(result.retrySettings, 1);
    assert.equal(result.javascript.length, 0);
    assert.equal(result.renders.length, 0);
});

test('collection URIs still enter native detail and invoke the real collection loader', () => {
    const result = executeOpenNativeRow('spotify:playlist:fixture-id', 'Fixture collection');
    assert.equal(result.nativeReturnScreen, 'library');
    assert.equal(result.nativeReturnTitle, 'Votre bibliothèque');
    assert.equal(result.nativeReturnJson, '[{"title":"preserved"}]');
    assert.equal(result.nativeExpectedId, 'spotify:playlist:fixture-id');
    assert.equal(result.nativeCurrentScreen, 'detail');
    assert.deepEqual(result.renders, [{ title: 'Fixture collection', json: '[]' }]);
    assert.deepEqual(result.functions, [{
        name: 'window.__sfOpenCollection', argument: 'spotify:playlist:fixture-id'
    }]);
});

test('the shared renderer remains the destination for Home, Search, and Library payloads', () => {
    const method = extractMethod(ACTIVITY,
        '.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    for (const route of ['home', 'search', 'library']) {
        assert.match(method, new RegExp(`"${route}"[\\s\\S]*?renderNativeRows\\(Ljava/lang/String;Ljava/lang/String;\\)V`),
            `${route} payloads use renderNativeRows`);
    }
    assert.match(method, /const-string v0, "settings"[\s\S]*?isCurrentNativeSettingsPayload/,
        'Settings payloads use their separate acknowledged load gate');
});


test('only explicit reconnect dispatches session deletion; retry remains separate', () => {
    assert.equal(executeOpenNativeRow('melodix:action:reconnect').reconnections, 1);
    assert.equal(executeOpenNativeRow('melodix:action:retry-library').reconnections, undefined);
    assert.equal(executeOpenNativeRow('melodix:action:open-login').reconnections, undefined);
});
