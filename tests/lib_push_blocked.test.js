// P0 bridge-startup — zones 6 (bridge<->Android), 8 (recuperation bibliotheque),
// 9 (nouvelle navigation / evenements tardifs).
//
// Contrat ajoute avec la correction : pushBridgeDiagState() ne peut plus echouer
// silencieusement quand AndBridge/onLibDiagState est indisponible (le symptome
// "lib-state calls=0" n'etait alors visible NOWHERE). Execution reelle du bloc
// observabilite du shell avec un window simule.
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

function buildStack(shell) {
    // Real shell code: sanitizer + loader helpers + observability stack + watcher.
    const parts = [fnBody(shell, 'sanitizeDiagnostic')];
    for (const name of [
        'bridgeHasStarted', 'recordBridgeFailure', 'sameOriginBridgeSrc',
        'setBridgeLoadStage', 'bridgeDiagWatchCopy', 'bridgeDiagStateJson',
        'markLibPushBlocked', 'pushBridgeDiagState', 'startBridgeDiagWatch'
    ]) {
        parts.push(fnBody(shell, name));
    }
    const rankAt = shell.indexOf('var BRIDGE_STAGE_RANK');
    assert.ok(rankAt > 0, 'BRIDGE_STAGE_RANK present');
    parts.push(shell.slice(rankAt, shell.indexOf('};', rankAt) + 2));
    const ledAt = shell.indexOf('bridgeDiagLastAt');
    assert.ok(ledAt > 0, 'ledger vars present');
    parts.push('var bridgeDiagLastAt = 0, bridgeDiagLastStage, bridgeDiagOkLogged = false;');
    parts.push('var libPushBlockedLogged = null;');
    parts.push('return { pushBridgeDiagState: pushBridgeDiagState, startBridgeDiagWatch: startBridgeDiagWatch, '
        + 'markLibPushBlocked: markLibPushBlocked, setBridgeLoadStage: setBridgeLoadStage, '
        + 'bridgeDiagStateJson: bridgeDiagStateJson };');
    return new Function('window', parts.join('\n'));
}

function mockWindow(bridge) {
    const calls = { logDiagEvent: [], onLibDiagState: [] };
    const window = {
        __sfDiagTicks: 0,
        __sfDiagPushes: 0,
        __sfDiagSent: 0,
        __sfBridgeLoadStage: 'bridge-initialized'
    };
    window.AndBridge = bridge ? {
        logDiagEvent: (m) => { calls.logDiagEvent.push(String(m)); },
        onLibDiagState: (json) => { calls.onLibDiagState.push(String(json)); }
    } : bridge;
    window.setInterval = (fn) => { window.__tick = fn; return 1; };
    window.clearInterval = () => {};
    return { window, calls };
}

test('execution reelle : push recu quand AndBridge est present, "lib-push ok" annonce une fois', () => {
    const shell = read('assets/native_ui_shell.js');
    const { window, calls } = mockWindow(true);
    const api = buildStack(shell)(window);
    api.pushBridgeDiagState();
    assert.strictEqual(calls.onLibDiagState.length, 1, 'premier push delivre');
    api.pushBridgeDiagState();
    assert.strictEqual(calls.onLibDiagState.length, 2, 'deuxieme push delivre');
    assert.strictEqual(window.__sfDiagSent, 2, 'compteur sent');
    assert.ok(calls.onLibDiagState[0].includes('"stage"'), 'payload JSON reel');
    assert.strictEqual(calls.logDiagEvent.filter((m) => m === 'lib-push ok').length, 1,
        'annonce succes une seule fois');
    assert.strictEqual(window.__sfLibPushBlocked, '', 'etat non bloque');
});

test('execution reelle : AndBridge absent -> bloque annonce (no-bridge), jamais de faux succes', () => {
    const shell = read('assets/native_ui_shell.js');
    const { window, calls } = mockWindow(false);
    const api = buildStack(shell)(window);
    api.pushBridgeDiagState();
    assert.strictEqual(calls.onLibDiagState.length, 0, 'aucun appel (pas de simulation)');
    assert.strictEqual(window.__sfLibPushBlocked, 'no-bridge', 'raison posee sur window');
    // Recovery: the channel comes back -> the next push is delivered and the
    // blocked state is cleared (zone 8: la bibliotheque redevient requetable).
    const recovered = mockWindow(true);
    // Same api/window: swap the interface back in place.
    window.AndBridge = recovered.window.AndBridge;
    api.pushBridgeDiagState();
    assert.strictEqual(recovered.calls.onLibDiagState.length, 1, 'push recu apres retour du canal');
    assert.strictEqual(window.__sfLibPushBlocked, '', 'blocage eface apres recuperation');
});

test('execution reelle : methode absente -> "no-method" journalise via logDiagEvent, une seule fois', () => {
    const shell = read('assets/native_ui_shell.js');
    const { window, calls } = mockWindow(false);
    window.AndBridge = { logDiagEvent: (m) => { calls.logDiagEvent.push(String(m)); } };
    const api = buildStack(shell)(window);
    api.pushBridgeDiagState();
    api.pushBridgeDiagState();
    api.pushBridgeDiagState();
    assert.strictEqual(window.__sfLibPushBlocked, 'no-method');
    assert.strictEqual(calls.logDiagEvent.filter((m) => m === 'lib-push blocked no-method').length, 1,
        'annonce dedupliquee (journal borne)');
});

test('execution reelle : changement de stage declenche un push (watcher), le rang empeche une regression d\'etat', () => {
    const shell = read('assets/native_ui_shell.js');
    const { window, calls } = mockWindow(true);
    const api = buildStack(shell)(window);
    api.setBridgeLoadStage('bridge-initialized');
    api.setBridgeLoadStage('script-load'); // late/stale event: rank 4 < 6 -> ignored
    assert.strictEqual(window.__sfBridgeLoadStage, 'bridge-initialized', 'un evenement tardif n\'ecrase pas l\'etat recent');
    api.setBridgeLoadStage('home-initialized'); // real progress
    assert.strictEqual(window.__sfBridgeLoadStage, 'home-initialized');
    api.startBridgeDiagWatch();
    assert.ok(typeof window.__tick === 'function', 'watcher armee');
    window.__tick();
    assert.strictEqual(calls.onLibDiagState.length, 1, 'changement de stage -> push immediat');
    const payload = JSON.parse(calls.onLibDiagState[0]);
    assert.strictEqual(payload.stage, 'home-initialized', 'le push transporte l\'etat recent');
});

test('[structurel] markLibPushBlocked journalise "lib-push blocked" sur le canal existant', () => {
    const shell = read('assets/native_ui_shell.js');
    const body = fnBody(shell, 'markLibPushBlocked');
    assert.ok(body.includes("logDiagEvent('lib-push blocked '"), 'annonce presente');
    assert.ok(body.includes('window.__sfLibPushBlocked'), 'etat lisible hors canal');
    const push = fnBody(shell, 'pushBridgeDiagState');
    assert.ok(push.includes("markLibPushBlocked(!bridge ? 'no-bridge' : 'no-method')"), 'raison exacte');
    assert.ok(push.includes("markLibPushBlocked('')"), 'recuperation explicite');
});

test('[structurel] onLibDiagState porte la garde d\'epoque des autres sinks (evenements tardifs)', () => {
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const body = bridge.split('.method public final onLibDiagState(Ljava/lang/String;)V')[1].split('.end method')[0];
    assert.ok(body, 'methode presente');
    const epoch = body.indexOf('bridgeEpoch:I');
    const session = body.indexOf('nativeSessionEpoch:I');
    const store = body.indexOf('DiagCounters;->libState');
    assert.ok(epoch > 0 && session > epoch && store > session, 'garde d\'epoque AVANT le stockage');
    assert.ok(body.includes('.locals 2'), 'registres suffisants pour la comparaison');
});
