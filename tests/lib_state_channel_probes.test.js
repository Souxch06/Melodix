// ---------------------------------------------------------------------------
// Instrumentation du canal du diagnostic bridge (observabilité uniquement) :
//   (1a) DiagCounters.libStateCalls : compteur d'entrées de libState(String) ;
//   (1b) DiagCounters.libStateLastLen : longueur (caractères) du dernier
//        contenu RÉCU — clip et stockage existants inchangés ;
//   (1c) readReport() : ligne « lib-state calls=<n> lastLen=<m> » en tête de
//        la section « Bridge (temporaire) » ;
//   (2a) pushBridgeDiagState() : le catch journalise « lib-push err » +
//        error.name tronqué à 40 caractères via window.AndBridge.logDiagEvent
//        (si la fonction existe) — jamais error.message ni de contenu ;
//   (2b) pushBridgeDiagState() : « lib-push ok » journalisé une seule fois,
//        au premier envoi réussi.
// NATURE : [structurel] uniquement — présence et ordre de texte dans les
// fichiers. Ces contrats NE PROUVENT PAS l'exécution dans la WebView (ni
// JavaScript exécuté, ni Dalvik exécuté, ni appel réel d'AndBridge).
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const libStateBody = () => {
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    const method = counters.split('.method public static libState(Ljava/lang/String;)V')[1];
    assert.ok(method, 'DiagCounters.libState(String) exists');
    return method.split('.end method')[0];
};

const pushBridgeDiagStateBody = () => {
    const shell = read('assets/native_ui_shell.js');
    const fn = shell.split('function pushBridgeDiagState()')[1];
    assert.ok(fn, 'pushBridgeDiagState() exists');
    return fn.split('\n    }')[0];
};

test('[structurel] 1a : libStateCalls incrémenté à CHAQUE entrée de libState (avant le garde-fou null)', () => {
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    assert.ok(counters.includes('.field public static libStateCalls:I'), 'field libStateCalls exists');
    const body = libStateBody();
    const incIdx = body.indexOf('libStateCalls:I');
    assert.ok(incIdx >= 0, 'libStateCalls is touched inside libState');
    const guardIdx = body.indexOf('if-eqz p0, :ls_done');
    assert.ok(guardIdx >= 0, 'null guard exists');
    assert.ok(incIdx < guardIdx, 'the counter increments before the null guard (every entry)');
    assert.ok(body.includes('add-int/lit8'), 'the counter really increments');
});

test('[structurel] 1b : libStateLastLen = longueur du contenu reçu (p0.length), écrit dans libState', () => {
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    assert.ok(counters.includes('.field public static libStateLastLen:I'), 'field libStateLastLen exists');
    const body = libStateBody();
    const lenIdx = body.indexOf('Ljava/lang/String;->length()I');
    const putIdx = body.indexOf('libStateLastLen:I');
    assert.ok(lenIdx >= 0, 'received length is computed');
    assert.ok(putIdx >= 0, 'libStateLastLen is written inside libState');
    assert.ok(lenIdx < putIdx, 'length is computed before being stored');
    // The pre-existing clip and storage must stay untouched.
    assert.ok(body.includes('clip(Ljava/lang/String;I)Ljava/lang/String;'), 'clip call is still present');
    assert.ok(body.includes('libStateText:Ljava/lang/String;'), 'existing store is still present');
});

test('[structurel] 1c : readReport place « lib-state calls=… lastLen=… » en tête de la section Bridge (temporaire)', () => {
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    const report = counters.split('.method public static declared-synchronized readReport()Ljava/lang/String;')[1].split('.end method')[0];
    const headIdx = report.indexOf('Bridge (temporaire):');
    const lineIdx = report.indexOf('lib-state calls=');
    const bridgeIdx = report.indexOf('buildBridgeSection()Ljava/lang/String;');
    assert.ok(headIdx >= 0, 'Bridge (temporaire) section exists');
    assert.ok(lineIdx >= 0, 'the probe line is present');
    assert.ok(bridgeIdx >= 0, 'the bridge section body is present');
    assert.ok(headIdx < lineIdx && lineIdx < bridgeIdx, 'the probe line sits at the head of the section');
    assert.ok(report.includes('lastLen='), 'the line shows lastLen');
});

test('[structurel] 2a : le catch de pushBridgeDiagState journalise « lib-push err » + name tronqué 40, sans message', () => {
    const body = pushBridgeDiagStateBody();
    assert.ok(body.includes('lib-push err '), 'the error journal line is present');
    assert.ok(body.includes('logDiagEvent'), 'it goes through logDiagEvent');
    assert.ok(/typeof\s+\w+\.logDiagEvent\s+===\s+'function'/.test(body), 'logDiagEvent is guarded (if the function exists)');
    assert.ok(body.includes('slice(0, 40)'), 'the exception name is truncated to 40 chars');
    assert.ok(!/err\.message|e\.message|\.message\b/.test(body), 'never logs error.message');
});

test('[structurel] 2b : « lib-push ok » journalisé une seule fois, après le premier envoi réussi', () => {
    const body = pushBridgeDiagStateBody();
    const sendIdx = body.indexOf('bridge.onLibDiagState(bridgeDiagStateJson())');
    const okIdx = body.indexOf('lib-push ok');
    assert.ok(sendIdx >= 0, 'the send call is present');
    assert.ok(okIdx >= 0, 'the ok journal line is present');
    assert.ok(sendIdx < okIdx, 'the ok line is logged after the successful send');
    assert.ok(body.includes('bridgeDiagOkLogged'), 'a one-shot flag guards the ok line');
});
