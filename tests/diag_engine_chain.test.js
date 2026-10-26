// ---------------------------------------------------------------------------
// Diagnostic décisif : moteur de tests (« Aucune réponse après 35 s ») et chaîne
// de chargement du bridge. Contrats [structurel] — direction des gardes, présence
// et ordre des compteurs. Ces contrats NE PROUVENT PAS l'exécution Android
// (ni Dalvik, ni WebView, ni émulateur) : ils ne vérifient que le texte Smali/JS.
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

// --- ÉTAPE 1 : le dispatcher doit acheminer « diag:… » vers :check_diag ------

test('[structurel] applyNativeUiData : un message non-« search: » doit CONTINUER vers :check_diag (jamais :apply_done) — sinon diag:report est jeté et le watchdog ment', () => {
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const from = main.indexOf('\n    :check_search_results\n');
    assert.ok(from > 0, ':check_search_results existe');
    const to = main.indexOf('\n    :check_diag\n', from);
    assert.ok(to > from, ':check_diag suit :check_search_results');
    const slice = main.slice(from, to);
    assert.ok(slice.includes('const-string v0, "search:"'), 'la branche teste le préfixe search:');
    assert.ok(slice.includes('if-eqz v1, :check_diag'),
        'le garde d’entrée de branche doit viser :check_diag');
    assert.ok(!slice.includes('if-eqz v1, :apply_done'),
        'le garde d’entrée de branche ne doit plus jeter les messages non-search');
});

// --- ÉTAPE 2 : compteurs de la chaîne (JS) ----------------------------------

const shell = () => read('assets/native_ui_shell.js');

test('[structurel] c. ticks incrémenté dans le corps du minuteur (setInterval de startBridgeDiagWatch) — sinon ticks=0 signale un minuteur mort', () => {
    const s = shell();
    const from = s.indexOf('function startBridgeDiagWatch');
    assert.ok(from > 0, 'startBridgeDiagWatch existe');
    const slice = s.slice(from, s.indexOf('function installBridgeRecovery'));
    assert.ok(slice.includes('__sfDiagTicks'), 'le corps du minuteur incrémente __sfDiagTicks');
});

test('[structurel] d. pushes incrémenté à l’entrée de pushBridgeDiagState', () => {
    const s = shell();
    const from = s.indexOf('function pushBridgeDiagState');
    assert.ok(from > 0, 'pushBridgeDiagState existe');
    const slice = s.slice(from, s.indexOf('function startBridgeDiagWatch'));
    const entry = slice.slice(0, slice.indexOf('try {'));
    assert.ok(entry.includes('__sfDiagPushes'), 'l’entrée de pushBridgeDiagState incrémente __sfDiagPushes');
});

test('[structurel] e. sent après l’appel natif onLibDiagState, sendErr dans le catch (nom d’exception déjà journalisé, sans message)', () => {
    const s = shell();
    const from = s.indexOf('function pushBridgeDiagState');
    const slice = s.slice(from, s.indexOf('function startBridgeDiagWatch'));
    const afterCall = slice.slice(slice.indexOf('onLibDiagState('));
    assert.ok(afterCall.includes('__sfDiagSent'), 'sent est incrémenté après l’appel natif');
    const catchPart = slice.slice(slice.indexOf('} catch (err)'));
    assert.ok(catchPart.includes('__sfDiagSendErr'), 'sendErr est incrémenté dans le catch');
    assert.ok(/logDiagEvent\('lib-push err ' \+ n\.slice\(0, 40\)\)/.test(catchPart),
        'le catch journalise le nom d’exception tronqué à 40 caractères');
});

test('[structurel] f. loaderCalls incrémenté dans __sfLoadBundledBridge (loadBundledBridge)', () => {
    const s = shell();
    const from = s.indexOf('function loadBundledBridge');
    assert.ok(from > 0, 'loadBundledBridge existe');
    const slice = s.slice(from, s.indexOf('window.__sfLoadBundledBridge ='));
    const entry = slice.slice(0, slice.indexOf('try {'));
    assert.ok(entry.includes('__sfLoaderCalls'), 'l’entrée de loadBundledBridge incrémente __sfLoaderCalls');
});

test('[structurel] g. bridgeInjected incrémenté à la fin de injectSameOriginBridge', () => {
    const s = shell();
    const from = s.indexOf('function injectSameOriginBridge');
    const slice = s.slice(from, s.indexOf('function loadBundledBridge'));
    const tail = slice.slice(slice.indexOf('appendChild'));
    assert.ok(tail.includes('__sfBridgeInjected'), 'la fin de injectSameOriginBridge incrémente __sfBridgeInjected');
});

test('[structurel] h. bridgeStarted compté dans spotify_bridge.js aux poses de __sfMelodixBridgeStarted=true', () => {
    const bridge = read('assets/spotify_bridge.js');
    const setsTrue = bridge.match(/window\.__sfMelodixBridgeStarted = true;/g) || [];
    assert.ok(setsTrue.length >= 2, 'le drapeau est posé à vrai en deux points du bridge');
    const counted = bridge.match(/window\.__sfBridgeStartedSets = \(window\.\.__sfBridgeStartedSets \|\| 0\) \+ 1;|window\.__sfBridgeStartedSets = \(window\.__sfBridgeStartedSets \|\| 0\) \+ 1;/g) || [];
    assert.ok(counted.length >= setsTrue.length,
        'chaque pose à vrai du drapeau incrémente le compteur bridgeStarted');
});

test('[structurel] payload bridgeDiagStateJson : champ compact chain (7 compteurs c→h) AVANT les champs élagables (survie au clip 400)', () => {
    const s = shell();
    const from = s.indexOf('function bridgeDiagStateJson');
    const slice = s.slice(from, s.indexOf('function pushBridgeDiagState'));
    const chainAt = slice.indexOf('chain:');
    assert.ok(chainAt > 0, 'champ chain présent dans le payload');
    for (const k of ['__sfDiagTicks', '__sfDiagPushes', '__sfDiagSent', '__sfDiagSendErr',
                     '__sfLoaderCalls', '__sfBridgeInjected', '__sfBridgeStartedSets']) {
        assert.ok(slice.includes(k), `compteur ${k} embarqué dans chain`);
    }
    const watchAt = slice.indexOf('watch:');
    assert.ok(watchAt > chainAt, 'chain précède watch (élagable)');
});

// --- ÉTAPE 2/3 : lecture côté natif -----------------------------------------

const counters = () => read('smali/com/melodix/music/DiagCounters.smali');

test('[structurel] a/b. compteurs natifs : logShellInject mémorise len+nombre, event() compte js-shell begin/end', () => {
    const c = counters();
    const lsi = c.split('.method public static logShellInject')[1].split('.end method')[0];
    assert.ok(lsi.includes('shellInjectLen'), 'logShellInject mémorise la longueur brute');
    assert.ok(lsi.includes('shellInjects'), 'logShellInject compte les injections');
    const ev = c.split('.method public static declared-synchronized event(')[1].split('.end method')[0];
    assert.ok(ev.includes('js-shell begin') && ev.includes('shellBegin'), 'event() compte js-shell begin');
    assert.ok(ev.includes('js-shell end') && ev.includes('shellEnd'), 'event() compte js-shell end');
});

test('[structurel] buildBridgeSection liste le champ chain (compteurs c→h) pour la section Bridge (temporaire)', () => {
    const c = counters();
    const bbs = c.split('.method public static buildBridgeSection')[1].split('.end method')[0];
    assert.ok(bbs.includes('const-string v2, "chain"'), 'champ chain listé');
});

test('[structurel] readReport : résumé de chaîne en tête, étapes a→h dans l’ordre, valeurs brutes', () => {
    const c = counters();
    assert.ok(c.includes('.method public static buildChainSummary()Ljava/lang/String;'),
        'buildChainSummary existe');
    const sum = c.split('.method public static buildChainSummary()Ljava/lang/String;')[1].split('.end method')[0];
    const order = ['a shellInject', 'b shell', 'c ticks', 'd pushes', 'e sent', 'f loaderCalls', 'g bridgeInjected', 'h bridgeStarted'];
    let last = -1;
    for (const label of order) {
        const at = sum.indexOf(label);
        assert.ok(at > 0, `étape ${label[0]} affichée`);
        assert.ok(at > last, `étape ${label[0]} dans l’ordre a→h`);
        last = at;
    }
    const rr = c.split('.method public static declared-synchronized readReport()Ljava/lang/String;')[1].split('.end method')[0];
    const head = rr.slice(rr.indexOf('new-instance v0'), rr.indexOf('const-string v1, "Bridge (temporaire)'));
    assert.ok(head.includes('buildChainSummary'), 'readReport insère le résumé AVANT la section Bridge');
});
