// P0 bridge-startup — zones 1 (injection/demarrage bridge) et 3 (propagation
// des erreurs JS/CSP).
//
// Contrats ajoutes avec la correction : la fin du shell ne peut plus etre
// prise pour un demarrage reussi ("js-shell end ok" vs "install-threw"), et
// les echecs du bridge (recordBridgeFailure, abandon apres 4 tentatives)
// s'annoncent sur le journal natif au lieu de rester silencieux.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

function fnBody(src, name) {
    const start = src.indexOf('function ' + name + '(');
    assert.ok(start >= 0, 'function ' + name + ' exists');
    let depth = 0, j = src.indexOf('{', start);
    for (let i = j; i < src.length; i += 1) {
        if (src[i] === '{') depth += 1;
        else if (src[i] === '}') { depth -= 1; if (!depth) { j = i + 1; break; } }
    }
    return src.slice(start, j);
}

test('[structurel] js-shell end porte le resultat de install() (ok / install-threw)', () => {
    const shell = read('assets/native_ui_shell.js');
    assert.ok(
        /window\.AndBridge\.logDiagEvent\('js-shell end '\s*\+\s*\(window\.__sfNativeUiShellCompleted\s*\?\s*'ok'\s*:\s*'install-threw'\)\)/.test(shell),
        'fin du shell = resultat explicite, plus un marqueur nu'
    );
    // The native counter must still count both suffixes (prefix match).
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    const ev = counters.split('.method public static declared-synchronized event(')[1].split('.end method')[0];
    assert.ok(ev.includes('const-string v1, "js-shell end"'), 'compteur natif conserve le prefixe');
    assert.ok(ev.includes('startsWith(Ljava/lang/String;)Z'), 'apparie par prefixe -> ok/install-threw comptes');
});

test('[structurel] recordBridgeFailure annonce l\'etape en echec sur le journal (stage seul, sans message)', () => {
    const shell = read('assets/native_ui_shell.js');
    const body = fnBody(shell, 'recordBridgeFailure');
    assert.ok(body.includes("logDiagEvent('js-bridge err '"), 'annonce journal');
    assert.ok(body.includes("String(stage || 'unknown')"), 'etape exacte');
    assert.ok(!body.includes("logDiagEvent('js-bridge err ' + message"), 'jamais le message d\'erreur (secret)');
    assert.ok(body.includes('window.__sfBridgeLastError'), 'etat local preserve');
});

test('[structurel] installBridgeRecovery annonce l\'abandon terminal ("js-bridge gave-up")', () => {
    const shell = read('assets/native_ui_shell.js');
    const body = fnBody(shell, 'installBridgeRecovery');
    assert.ok(body.includes("logDiagEvent('js-bridge gave-up '"), 'abandon annonce');
    const gaveIdx = body.indexOf('js-bridge gave-up');
    const retryIdx = body.indexOf('bridgeRetryTimer = window.setTimeout(attempt');
    assert.ok(retryIdx >= 0 && gaveIdx > retryIdx, 'apres la derniere tentative (borne 4)');
    assert.ok(body.includes('__sfBridgeLoadStage || \'unknown\''), 'etape exacte raportee');
});

test('execution reelle : recordBridgeFailure pose l\'etat ET journalise "js-bridge err <stage>"', () => {
    const shell = read('assets/native_ui_shell.js');
    const calls = [];
    const window = {
        AndBridge: { logDiagEvent: (m) => { calls.push(String(m)); } }
    };
    const api = new Function('window',
        fnBody(shell, 'sanitizeDiagnostic') + '\n'
        + fnBody(shell, 'recordBridgeFailure') + '\n'
        + 'recordBridgeFailure("script-error", "load-failed");'
        + 'var first = window.__sfBridgeLastError;'
        + 'recordBridgeFailure("prefix-only", null);'
        + 'return [first, window.__sfBridgeLastError];')(window);
    assert.strictEqual(api[0], 'script-error: load-failed', 'etat local (etape + detail sanitarise)');
    assert.strictEqual(api[1], 'prefix-only', 'second echec = etape seule');
    assert.deepStrictEqual(calls, ['js-bridge err script-error', 'js-bridge err prefix-only'],
        'chaque echec annonce son etape sur le journal');
});

test('execution reelle : hook d\'erreur script -> etat + etape "script-exec-error"', () => {
    const shell = read('assets/native_ui_shell.js');
    let hook = null;
    const window = {
        AndBridge: { logDiagEvent: () => {} },
        addEventListener: (type, fn) => { if (type === 'error') hook = fn; },
        __sfBridgeEntered: false
    };
    const sandbox = new Function('window',
        fnBody(shell, 'sanitizeDiagnostic') + '\n'
        + fnBody(shell, 'recordBridgeFailure') + '\n'
        + fnBody(shell, 'setBridgeLoadStage').replace('setBridgeLoadStage', 'setBridgeLoadStage') + '\n'
        + 'var BRIDGE_STAGE_RANK = { start: 0, "inject-src": 1, "src-pending": 2, "asset-response-created": 3, '
        + '"script-load": 4, "script-error": 4, "prefix-only": 4, "script-exec-error": 4, "iife-throw": 4, '
        + '"bridge-entered": 5, "bridge-initialized": 6, "home-initialized": 7, "native-src": 3 };\n'
        + fnBody(shell, 'attachBridgeScriptEvents') + '\n'
        + 'attachBridgeScriptEvents({}, "https://open.spotify.com/__melodix__/spotify_bridge.js");'
        + 'return window;');
    const state = sandbox(window);
    const errHook = hook;
    assert.ok(typeof errHook === 'function', 'hook d\'erreur installe');
    errHook({ filename: 'https://open.spotify.com/__melodix__/spotify_bridge.js', message: 'SyntaxError: x', lineno: 42 });
    assert.ok(String(state.__sfBridgeLastError).startsWith('exec-error: SyntaxError: x:L42'), 'erreur JS propagee');
    assert.strictEqual(state.__sfBridgeLoadStage, 'script-exec-error', 'etape exacte');
    errHook({ filename: 'other.js', message: 'nope', lineno: 1 });
    assert.ok(String(state.__sfBridgeLastError).startsWith('exec-error: SyntaxError'), 'les erreurs etrangeres sont ignorees');
});
