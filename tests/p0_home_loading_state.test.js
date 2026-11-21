'use strict';

// P0 non-regression: the native loading spinner must be bound to the REAL
// in-flight library state, never fabricated — and Settings must show real
// connection information with real actions, never a static label.
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
const HOME_RENDERER = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');

function makeShell(overrides) {
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
    const window = Object.assign({
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/'
        },
        AndBridge: {
            onNativeUiReady() {},
            onNativeUiRoute() {},
            onNativeUiData(screen, data) { calls.push({ screen, data }); },
            logDiagEvent() {}
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
    }, overrides);
    vm.runInNewContext(SHELL, { window, document, URL, MutationObserver: TestMutationObserver, console });
    timers.clear();
    calls.length = 0;
    return { window, calls };
}

function homeStatePayloads(calls) {
    return calls
        .filter((c) => c.screen === 'home')
        .map((c) => JSON.parse(c.data))
        .filter((rows) => Array.isArray(rows) && rows[0] && rows[0].kind === 'state')
        .map((rows) => rows[0]);
}

test('P0: an in-flight library request yields the real loading state that drives the native spinner', () => {
    const { window, calls } = makeShell({
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        __sfMediaLibStatus: 'loading',
        __sfGetSpotifyAuthUiState: () => 'connected'
    });
    assert.equal(window.__sfNativeRequestHome(), true);
    const states = homeStatePayloads(calls);
    assert.ok(states.length >= 1, 'a state payload is sent for a proven session without rows');
    assert.equal(states[0].state, 'loading', 'in-flight request maps to state=loading');
    assert.equal(states[0].sessionUnproven, false, 'a proven session is not flagged unproven');
    // The native spinner branch must exist and be bound to exactly this state.
    const at = HOME_RENDERER.indexOf('.method private static renderHomeStatus');
    const body = HOME_RENDERER.slice(at, HOME_RENDERER.indexOf('.end method', at))
        .split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
    assert.match(body, /const-string v\d+, "loading"/);
    assert.match(body, /if-eqz v\d+, :home_status_no_spinner/);
    assert.match(body, /setIndeterminate\(Z\)V/);
});

test('P0: ready-but-empty and error are NOT loading — the spinner cannot mask a finished state', () => {
    const empty = makeShell({
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        __sfMediaLibStatus: 'ready',
        __sfMediaLibRawItemCount: 0,
        __sfGetSpotifyAuthUiState: () => 'connected'
    });
    empty.window.__sfNativeRequestHome();
    const emptyStates = homeStatePayloads(empty.calls);
    assert.ok(emptyStates.length >= 1);
    assert.equal(emptyStates[0].state, 'empty', 'a settled empty library is state=empty, never loading');

    const failing = makeShell({
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        __sfMediaLibStatus: 'error',
        __sfMediaLibError: 'network-error',
        __sfGetSpotifyAuthUiState: () => 'connected'
    });
    failing.window.__sfNativeRequestHome();
    const errorStates = homeStatePayloads(failing.calls);
    assert.ok(errorStates.length >= 1);
    assert.equal(errorStates[0].state, 'error', 'a failed request is state=error');
    assert.equal(errorStates[0].uri, 'melodix:action:retry-library', 'the error state offers the real retry action');
});

test('P0: an unproven session never sends cards and flags the status as unproven', () => {
    const { window, calls } = makeShell({
        __sfMediaLibSessionProofKnown: false,
        __sfMediaLibSessionProven: false,
        __sfMediaLibStatus: 'absent',
        __sfGetSpotifyAuthUiState: () => 'required'
    });
    assert.equal(window.__sfNativeRequestHome(), true);
    const homeRows = calls.filter((c) => c.screen === 'home').map((c) => JSON.parse(c.data));
    const cards = homeRows.flat().filter((r) => r && r.kind !== 'state');
    assert.equal(cards.length, 0, 'no fabricated card rows without session proof');
    const states = homeStatePayloads(calls);
    assert.ok(states.length >= 1);
    assert.equal(states[0].sessionUnproven, true, 'the status is explicitly unproven');
    assert.notEqual(states[0].state, 'loading', 'an absent library is not reported as loading');
});

test('P0: Settings show the real connection state and real actions, never a static label', () => {
    const off = makeShell({
        __sfMediaLibSessionProofKnown: false,
        __sfMediaLibSessionProven: false,
        __sfMediaLibStatus: 'absent',
        __sfGetSpotifyAuthUiState: () => 'required'
    });
    assert.equal(off.window.__sfNativeSettingsRequest(7), true);
    const offRows = off.calls.filter((c) => c.screen === 'settings').flatMap((c) => JSON.parse(c.data));
    const offConn = offRows.find((r) => r.title === 'État de la connexion Spotify');
    assert.ok(offConn, 'the connection row exists');
    assert.equal(offConn.settingValue, 'Se connecter');
    assert.equal(offConn.uri, 'melodix:action:open-login', 'connects through the real login action');
    const offAccount = offRows.find((r) => r.settingValue === 'Non confirmé');
    assert.ok(offAccount, 'the account row honestly reports "Non confirmé"');
    assert.ok(offRows.some((r) => r.uri === 'melodix:action:open-login'), 'a connect action row is present');
    assert.ok(!offRows.some((r) => /connecté/i.test(String(r.settingValue)) && r.settingValue !== 'Se connecter'),
        'no row claims to be connected without proof');

    const on = makeShell({
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        __sfMediaLibStatus: 'ready',
        __sfMediaLibRawItemCount: 3,
        __sfGetSpotifyAuthUiState: () => 'connected'
    });
    assert.equal(on.window.__sfNativeSettingsRequest(9), true);
    const onRows = on.calls.filter((c) => c.screen === 'settings').flatMap((c) => JSON.parse(c.data));
    const onAccount = onRows.find((r) => r.title === 'Compte non identifié');
    assert.equal(onAccount.settingValue, 'Non confirmé', 'library proof does not establish account identity');
    assert.match(onAccount.subtitle, /Identité non vérifiée/);
    const onConnection = onRows.find((r) => r.title === 'État de la connexion Spotify');
    assert.equal(onConnection.settingValue, 'Accès vérifié');
    assert.match(onConnection.subtitle, /identité du compte non vérifiée/);
    assert.ok(onRows.some((r) => r.uri === 'spotify:settings:logout' && r.settingValue === 'Se déconnecter'),
        'a proven session offers the real logout action');
});

test('P0: the no-WebView Settings fallback offers real actions and never claims a connection', () => {
    const at = ACTIVITY.indexOf('.method public final onNativeSettingsTimeout(I)V');
    const method = ACTIVITY.slice(at, ACTIVITY.indexOf('.end method', at));
    const fallback = method.match(/const-string v\d+, "(\[\{\\"section\\":\\"État\\".*?)"\n/);
    assert.ok(fallback, 'the timeout fallback payload exists');
    const payload = JSON.parse(fallback[1].replace(/\\"/g, '"'));
    const retry = payload.find((r) => r.uri === 'melodix:action:retry-settings');
    const login = payload.find((r) => r.uri === 'melodix:action:open-login');
    assert.ok(retry, 'fallback offers a real retry action');
    assert.ok(login, 'fallback offers the real login action');
    assert.ok(!/Connecté|connecté/.test(JSON.stringify(payload)),
        'the fallback never claims an unverified connection');
    assert.ok(method.includes('appendNativeAboutRows'), 'the fallback appends the real About section (version)');
});
