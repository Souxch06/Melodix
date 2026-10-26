// ---------------------------------------------------------------------------
// Observabilité temporaire du bridge (mission « Bridge (temporaire) ») :
// tests du pousseur d'état ajouté dans assets/native_ui_shell.js et de
// l'affichage ajouté dans smali/com/melodix/music/DiagCounters.smali.
//
// NATURE DES TESTS — distinctions explicites :
//   • « [simulation] » : la fonction de construction du JSON est EXTRAITE du
//     shell et EXÉCUTÉE dans node avec un objet window simulé. Cela prouve le
//     comportement de cette fonction en JS standard, mais PAS son comportement
//     dans la WebView (injection, CSP, ordre d'évaluation non couverts).
//   • « [structurel] » : vérifie la présence de texte dans les fichiers
//     (smali/js). Un test structurel ne prouve PAS que le code s'exécute.
//   • Aucun test n'exécute le bytecode Dalvik (aucun émulateur/harness dans
//     ce dépôt). L'affichage smali n'est couvert que structurellement.
//   • Aucun test appareil n'est réalisé dans cet environnement.
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const shellSrc = read('assets/native_ui_shell.js');
const countersSrc = read('smali/com/melodix/music/DiagCounters.smali');

// --- [simulation] extraction des fonctions du shell -------------------------
// (même technique que tests/sanitize_diagnostic.test.js : extraction de la
// source par marqueurs, exécution dans un contexte node isolé).

function extractSanitize() {
    const start = shellSrc.indexOf('function sanitizeDiagnostic');
    const end = shellSrc.indexOf('\n    function recordShellError');
    assert.ok(start >= 0 && end > start, 'sanitizeDiagnostic present');
    return vm.runInNewContext(shellSrc.slice(start, end) + '\nsanitizeDiagnostic;');
}

function extractBuilder(windowObj, documentObj) {
    const start = shellSrc.indexOf('    function bridgeDiagWatchCopy');
    const end = shellSrc.indexOf('\n    var bridgeDiagLastStage;');
    assert.ok(start >= 0 && end > start, 'bridgeDiagWatchCopy/bridgeDiagStateJson present');
    const src = shellSrc.slice(start, end);
    return vm.runInNewContext(src + '\nbridgeDiagStateJson;', {
        window: windowObj,
        document: documentObj,
        sanitizeDiagnostic: extractSanitize()
    });
}

// Modèle des transformations du canal natif DiagCounters.libState (Smali) :
// collapse des espaces, scrub de charset, clip à 400 caractères (la fin est
// coupée). C'est un MODÈLE lu dans le Smali, pas une exécution de ce Smali.
function channelModel(text) {
    return String(text)
        .replace(/\s+/g, ' ')
        .replace(/[^A-Za-z0-9 {}[\]",.:=+()/_-]/g, '')
        .slice(0, 400);
}

const WATCHED = [
    '__sfBridgeLoadStage', '__sfMelodixBridgeStarted', '__sfBridgeEntered',
    '__sfBridgeIntercepted', '__sfBridgeAssetServed', '__sfBridgePrefixExec',
    '__sfBridgeBytes', '__sfBridgeLastError', '__sfBridgeCspViolation',
    '__sfBridgeExecMode', '__sfNativeUiBridgeRecoveryAttempts', '__sfBridgeWatch'
];

// ---------------------------------------------------------------------------
// [simulation] construction du JSON — comportement de la fonction JS
// ---------------------------------------------------------------------------

test('[simulation] le snapshot contient exactement les 14 champs demandés (13 + chain), absents = null (jamais inventés)', () => {
    const win = {};
    const json = extractBuilder(win, { querySelector: () => null })();
    const obj = JSON.parse(json);
    assert.deepEqual(Object.keys(obj), [
        'stage', 'chain', 'started', 'entered', 'intercepted', 'assetServed', 'prefixExec',
        'bytes', 'lastError', 'cspViolation', 'execMode', 'recoveryAttempts',
        'watch', 'tagPresent'
    ]);
    for (const key of ['stage', 'chain', 'started', 'entered', 'intercepted', 'assetServed',
        'prefixExec', 'bytes', 'lastError', 'cspViolation', 'execMode', 'recoveryAttempts', 'watch']) {
        assert.equal(obj[key], null, `${key} absent -> null`);
    }
    assert.equal(obj.tagPresent, false, 'tagPresent reflects the real DOM lookup');
});

test('[simulation] les valeurs sont lues telles quelles : booléens stricts, entiers, chaînes', () => {
    const win = {
        __sfBridgeLoadStage: 'inject-src',
        __sfMelodixBridgeStarted: true,
        __sfBridgeEntered: false,
        __sfBridgeIntercepted: true,
        __sfBridgeAssetServed: true,
        __sfBridgePrefixExec: true,
        __sfBridgeBytes: 123456,
        __sfBridgeLastError: 'script-error: load-failed',
        __sfBridgeCspViolation: 'script-src-elem https://x',
        __sfBridgeExecMode: 'same-origin-src',
        __sfNativeUiBridgeRecoveryAttempts: 2
    };
    const obj = JSON.parse(extractBuilder(win, { querySelector: () => ({}) })());
    assert.equal(obj.stage, 'inject-src');
    assert.equal(obj.started, true);
    assert.equal(obj.entered, false);
    assert.equal(obj.bytes, 123456);
    assert.equal(obj.recoveryAttempts, 2);
    assert.equal(obj.tagPresent, true);
    // A non-boolean is never coerced into true/false: absent stays null.
    const win2 = { __sfMelodixBridgeStarted: 'yes' };
    assert.equal(JSON.parse(extractBuilder(win2, { querySelector: () => null })()).started, null);
});

test('[simulation] lastError est assaini (secrets redactés), sans quotes/backslash, borné à 160', () => {
    const win = {
        __sfBridgeLastError: 'exec-error: Bearer aaaaa.bbbbb.ccccc ' + 'x'.repeat(300)
    };
    const obj = JSON.parse(extractBuilder(win, { querySelector: () => null })());
    assert.doesNotMatch(obj.lastError, /aaaaa/, 'the secret is gone');
    assert.match(obj.lastError, /\[redacted\]/, 'a redaction marker is present');
    assert.ok(obj.lastError.length <= 160, 'lastError <= 160');
    assert.ok(!obj.lastError.includes('"') && !obj.lastError.includes('\\'), 'no JSON-breaking chars');
    // The Authorization: pattern is redacted too (whichever pattern fires
    // first, no credential material survives).
    const win2 = { __sfBridgeLastError: 'exec-error: Authorization: Basic zzzzz.yyyyy.xxxxx tail' };
    const obj2 = JSON.parse(extractBuilder(win2, { querySelector: () => null })());
    assert.doesNotMatch(obj2.lastError, /zzzzz/);
});

test('[simulation] cspViolation <= 120 ; watch = copie bornée des seules clés présentes', () => {
    // The 120 bound is measured without watch pressure.
    const longOnly = JSON.parse(extractBuilder({ __sfBridgeCspViolation: 'c'.repeat(300) }, { querySelector: () => null })());
    assert.ok(longOnly.cspViolation.length <= 120, 'cspViolation <= 120');
    // Watch copy semantics, with small surrounding values so the JSON keeps
    // its watch field (the builder sacrifices watch first when space runs out).
    const win = {
        __sfBridgeWatch: {
            stage: 'script-error',
            entered: true,
            srcHost: 'https://open.spotify.com/x',
            extra: 'a"b\\c',
            nested: { a: 1 },
            n: 5
        }
    };
    const obj = JSON.parse(extractBuilder(win, { querySelector: () => null })());
    assert.ok(obj.watch, 'watch kept when the JSON fits');
    // Only keys already present in __sfBridgeWatch are copied, bounded.
    assert.deepEqual(Object.keys(obj.watch).sort(),
        ['entered', 'extra', 'n', 'nested', 'srcHost', 'stage'].sort());
    assert.equal(obj.watch.stage, 'script-error');
    assert.equal(obj.watch.n, 5);
    assert.equal(obj.watch.nested, null, 'non-primitive values -> null');
    assert.ok(obj.watch.srcHost.length <= 24);
    assert.ok(!obj.watch.extra.includes('"') && !obj.watch.extra.includes('\\'));
});

test('[simulation] le JSON tient dans le canal natif (clip 400) et reste complet après scrub', () => {
    const win = {
        __sfBridgeLoadStage: 'script-error',
        __sfBridgeLastError: 'exec-error: ' + 'e'.repeat(300),
        __sfBridgeCspViolation: 'c'.repeat(120),
        __sfBridgeWatch: { error: 'z'.repeat(24), srcHost: 'h'.repeat(24) },
        __sfBridgeBytes: 424242,
        __sfNativeUiBridgeRecoveryAttempts: 3
    };
    const builder = extractBuilder(win, { querySelector: () => ({}) });
    const json = builder();
    assert.ok(json.length <= 400, `self-bounded to the channel capacity (got ${json.length})`);
    assert.ok(json.length <= 2048, 'mission bound 2 Ko');
    // After the native channel model (scrub + clip 400), every field survives.
    const after = JSON.parse(channelModel(json));
    assert.deepEqual(Object.keys(after), Object.keys(JSON.parse(json)));
    assert.equal(after.stage, 'script-error');
    assert.equal(after.bytes, 424242);
});

test('[simulation] la construction est en lecture seule : aucune variable surveillée n\'est écrite', () => {
    const win = {
        __sfBridgeLoadStage: 'inject-src',
        __sfMelodixBridgeStarted: false,
        __sfBridgeWatch: { stage: 'inject-src' }
    };
    const before = JSON.stringify(win);
    extractBuilder(win, { querySelector: () => null })();
    assert.equal(JSON.stringify(win), before, 'window untouched by the builder');
    for (const name of WATCHED) {
        const frozen = {};
        Object.defineProperty(frozen, name, {
            get: () => null,
            set: () => { throw new Error(`${name} must not be written`); }
        });
        // The builder only reads: property writes would throw above.
        extractBuilder(frozen, { querySelector: () => null })();
    }
});

// ---------------------------------------------------------------------------
// [corrections relecture 23303e5] — point 1 (purge timer logout) et point 2
// (execMode / plafond 400). Nature identique aux contrats ci-dessus :
// [simulation] = code JS extrait et exécuté dans node (PAS la WebView) ;
// [structurel] = présence de texte (NE prouve PAS l'exécution).
// ---------------------------------------------------------------------------

test('[structurel] purge logout : seule la ligne retenue (timer diag) est présente dans le bloc de déconnexion', () => {
    // Point 1, décision GARDER : startBridgeDiagWatch n'arrête jamais son
    // propre intervalle et le contrat D4 (audit_remediation) exige que tout
    // intervalle soit clear au logout. Ce contrat épingle que le bloc logout
    // ne porte QUE cette purge (clearInterval + reset du garde), rien d'autre.
    const start = shellSrc.indexOf('sessionLoggedOut = true;');
    const end = shellSrc.indexOf('endPauseHold();', start);
    assert.ok(start >= 0 && end > start, 'logout purge zone found');
    const zone = shellSrc.slice(start, end);
    assert.ok(zone.includes('clearInterval(window.__sfBridgeDiagTimer)'), 'diag timer cleared on logout');
    assert.ok(zone.includes('window.__sfBridgeDiagTimer = 0'), 'timer guard reset so the next injection can re-arm');
    const blocks = shellSrc.match(/if \(window\.__sfBridgeDiagTimer\) \{/g) || [];
    assert.equal(blocks.length, 1, 'exactly one __sfBridgeDiagTimer purge block in the whole shell');
    const blockStart = shellSrc.indexOf('if (window.__sfBridgeDiagTimer) {');
    const blockEnd = shellSrc.indexOf('}', shellSrc.indexOf('window.__sfBridgeDiagTimer = 0;'));
    const block = shellSrc.slice(blockStart, blockEnd);
    assert.ok(!block.includes('onLibDiagState'), 'purge sends nothing');
    assert.ok(!block.includes('pushBridgeDiagState'), 'purge never pushes state');
    assert.ok(!block.includes('loadBundledBridge'), 'purge never triggers the loader');
});

test('[simulation] execMode long : valeur de 500 caractères → tronquée à 24, JSON valide', () => {
    // Correction du point 2 : execMode utilise le même helper asText(..., 24)
    // que lastError. Prouve le comportement de la fonction en JS standard ;
    // ne prouve PAS l'exécution dans la WebView.
    const win = {
        __sfBridgeLoadStage: 'inject-src',
        __sfBridgeExecMode: 'x'.repeat(500),
        __sfBridgeWatch: { stage: 'inject-src' }
    };
    const json = extractBuilder(win, { querySelector: () => null })();
    const parsed = JSON.parse(json);
    assert.ok(parsed.execMode.length <= 24, `execMode bounded to 24 (got ${parsed.execMode.length})`);
    assert.equal(parsed.execMode, 'x'.repeat(24), 'truncated copy only, value otherwise raw');
    // A bounded snapshot now survives the native channel (scrub + clip 400).
    const after = JSON.parse(channelModel(json));
    assert.equal(after.execMode.length, 24, 'execMode survives the channel model');
});

test('[structurel] execMode est tronqué dans bridgeDiagStateJson (asText, 24)', () => {
    // Présence de texte uniquement : NE PROUVE PAS que la fonction s'exécute.
    const start = shellSrc.indexOf('function bridgeDiagStateJson');
    const end = shellSrc.indexOf('\n    var bridgeDiagLastStage;');
    const body = shellSrc.slice(start, end);
    assert.ok(body.includes('execMode: asText(window.__sfBridgeExecMode, 24)'),
        'execMode bounded through the same asText helper as lastError');
    assert.ok(!body.includes('typeof window.__sfBridgeExecMode === \'string\' ? window.__sfBridgeExecMode : null'),
        'the old unbounded read is gone');
});

test('[structurel] canal libState : clip 400 = tronquage (substring garde le début), pas de rejet', () => {
    // Ancre le mécanisme lu pour le point 2 : clip() est un tronquage, il
    // n'existe aucune voie de rejet silencieux. Si ce comportement change, la
    // décision execMode ci-dessus doit être réexaminée.
    const clipStart = countersSrc.indexOf('.method private static clip');
    const clipEnd = countersSrc.indexOf('.end method', clipStart);
    const clipBody = countersSrc.slice(clipStart, clipEnd);
    assert.ok(clipBody.includes('substring(II)'), 'clip truncates via substring');
    assert.ok(clipBody.includes('const/4 v0, 0x0'), 'substring(0, p1): the BEGINNING is kept');
    const libStart = countersSrc.indexOf('.method public static libState');
    const libEnd = countersSrc.indexOf('.end method', libStart);
    const libBody = countersSrc.slice(libStart, libEnd);
    assert.ok(/const\/16 v1, 0x190\s*\n\s*invoke-static \{v0, v1\}, Lcom\/melodix\/music\/DiagCounters;->clip/.test(libBody),
        'libState clips at 400 (0x190)');
});

// ---------------------------------------------------------------------------
// [structurel] présence dans les fichiers — NE PROUVE PAS l'exécution
// ---------------------------------------------------------------------------

test('[structurel] le shell envoie par le canal existant AndBridge.onLibDiagState', () => {
    assert.ok(shellSrc.includes('bridge.onLibDiagState(bridgeDiagStateJson())'),
        'push uses the existing JS->native channel');
    assert.ok(shellSrc.includes('window.__sfBridgeDiagStateJson = bridgeDiagStateJson;'),
        'builder exposed for the diagnostic test hook');
});

test('[structurel] cadence : envoi à chaque changement de stage + au moins toutes les 2 s', () => {
    assert.ok(shellSrc.includes('stage !== bridgeDiagLastStage'), 'stage-change detection');
    assert.ok(shellSrc.includes('bridgeDiagLastAt >= 2000'), 'regular cadence 2 s');
    assert.ok(shellSrc.includes('}, 500);'), 'sampling tick 500 ms');
});

test('[structurel] l\'écran Diagnostic affiche la section « Bridge (temporaire) » avec repli « non reçu »', () => {
    assert.ok(countersSrc.includes('"Bridge (temporaire):'), 'section title in readReport');
    assert.ok(countersSrc.includes('non reçu'), 'absent field fallback');
    assert.ok(countersSrc.includes('buildBridgeSection'), 'section builder');
    assert.ok(countersSrc.includes('readLibStateBridge'), 'snapshot extractor');
    assert.ok(countersSrc.includes('Lorg/json/JSONObject;'), 'raw values read via JSONObject');
    for (const key of ['stage', 'chain', 'started', 'entered', 'intercepted', 'assetServed',
        'prefixExec', 'bytes', 'lastError', 'cspViolation', 'execMode',
        'recoveryAttempts', 'watch', 'tagPresent']) {
        assert.ok(countersSrc.includes(`"${key}"`), `field ${key} displayed`);
    }
});

test('[structurel] le pousseur ne touche ni le chargement du bridge, ni la file de commandes, ni la bibliothèque', () => {
    const start = shellSrc.indexOf('function bridgeDiagWatchCopy');
    const end = shellSrc.indexOf('\n    function installBridgeRecovery');
    const block = shellSrc.slice(start, end);
    // Observability only: no stage writes, no bridge load calls, no queue/nav.
    assert.ok(!block.includes('setBridgeLoadStage'), 'never writes load stages');
    assert.ok(!block.includes('loadBundledBridge('), 'never triggers the loader');
    assert.ok(!block.includes('pollCommands'), 'never touches the command queue');
    assert.ok(!block.includes('checkMediaLib'), 'never touches the library');
    assert.ok(!block.includes('location.'), 'never navigates');
});
