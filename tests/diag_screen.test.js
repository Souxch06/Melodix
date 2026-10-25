#!/usr/bin/env node
/**
 * P0-DIAG: real Diagnostic Melodix screen — engine contracts and detection.
 *
 * The diagnostic screen is built from real signals only: the pipeline
 * classifiers (diag_engine.js) decide WHERE a category was lost, and the smali
 * instrumentation (DiagCounters + hooks) reports what the native pipeline
 * really did. These tests fail when any of the 11 loss classes stops being
 * detected, when the instrumentation is missing, or when the sanitization can
 * leak names/tokens.
 */
const fs = require('fs');
const path = require('path');
const assert = require('assert');
const vm = require('vm');

const repo = path.resolve(__dirname, '..');
const read = p => fs.readFileSync(path.join(repo, p), 'utf8');

const engineSrc = read('assets/diag_engine.js');
const sandbox = { window: {}, setTimeout: () => 0, clearTimeout: () => 0, Date, JSON, console: {} };
vm.createContext(sandbox);
vm.runInContext(engineSrc, sandbox);
const classify = sandbox.window.__sfDiagClassify;
assert.strictEqual(typeof classify, 'function', 'diag_engine.js must export window.__sfDiagClassify');

// Sanitized fixture (what the screen may legitimately hold): counts + shaped
// library payloads, no names, no ids, no tokens.
const emptyItems = { items: [], total: 0, playlistCount: 0, type: 'library', catalog: 'playlists' };
const threePlaylists = {
    items: [
        { type: 'playlist', name: 'Privée', owner: 'userX', id: 'pl-1', uri: 'spotify:playlist:pl-1' },
        { type: 'playlist', name: 'Autre', owner: 'userX', id: 'pl-2', uri: 'spotify:playlist:pl-2' },
        { type: 'playlist', name: 'Encore', owner: 'userX', id: 'pl-3', uri: 'spotify:playlist:pl-3' }
    ],
    total: 3, playlistCount: 3, type: 'library', catalog: 'playlists'
};

const CATALOGS = ['playlists', 'liked', 'albums', 'artists', 'podcasts'];
const outcomes = new Map();
const record = (cat, o) => {
    if (!outcomes.has(cat)) outcomes.set(cat, []);
    outcomes.get(cat).push(o);
};

function run(cat, scenario) {
    const o = classify(cat, scenario);
    record(cat, o);
    return o;
}

const t = (name, fn) => {
    try {
        fn();
        console.log('PASS', name);
    } catch (e) {
        console.error('FAIL', name);
        throw e;
    }
};

/* ------------------------------------------------------------------ */
/* 11 detection scenarios — every class must be detected when present  */
/* ------------------------------------------------------------------ */

t('scenario 1: non-empty list -> class:ok count:3', () => {
    const o = run('playlists', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 3, rawJson: threePlaylists, delivered: true },
        after: { len: 3, empty: false, error: '' },
        admission: { title: 'Playlists' }
    });
    assert.strictEqual(o.class, 'ok');
    assert.strictEqual(o.count, 3);
    assert.strictEqual(o.note, 'de 0 à 3 éléments');
});

t('scenario 2: truly empty -> class:empty not blocked at 0', () => {
    const o = run('albums', {
        before: { len: 0, empty: true, error: '' },
        delivered: { len: 0, rawJson: emptyItems, delivered: true },
        after: { len: 0, empty: true, error: '' },
        admission: { title: 'Albums' }
    });
    assert.strictEqual(o.class, 'empty');
    assert.strictEqual(o.blocked, 'non');
    assert.strictEqual(o.count, 0);
});

t('scenario 3: refused response -> class:different', () => {
    const o = run('artists', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 1, rawJson: '{"message":"Access denied","code":403}', delivered: true },
        after: { len: 1, empty: false, error: '' },
        admission: { title: 'Artistes' }
    });
    assert.strictEqual(o.class, 'different');
    assert.strictEqual(o.blocked, 'oui');
    assert.ok(/accès refusé/i.test(o.note), 'refused must be stated: ' + o.note);
});

t('scenario 4: network error -> class:fetch', () => {
    const o = run('podcasts', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 0, rawJson: null, delivered: true, fetchError: 'net::ERR_TIMED_OUT' },
        after: { len: 0, empty: false, error: '' },
        admission: { title: 'Podcasts' }
    });
    assert.strictEqual(o.class, 'fetch');
    assert.strictEqual(o.blocked, 'oui');
    assert.strictEqual(o.count, 0);
});

t('scenario 5: unexpected format -> class:different keeps items', () => {
    const o = run('playlists', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 2, rawJson: '{"weird":true,"payload":[1,2]}', delivered: true },
        after: { len: 2, empty: false, error: '' },
        admission: { title: 'Playlists' }
    });
    assert.strictEqual(o.class, 'different');
    assert.strictEqual(o.count, 2);
});

t('scenario 6: normalization error -> class:normalize', () => {
    const o = run('liked', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 5, rawJson: '{"items":[1,2,3,4,5]}', delivered: true },
        after: { len: 0, empty: false, error: 'TypeError: Cannot read property name of undefined' },
        admission: { title: 'Titres likés' }
    });
    assert.strictEqual(o.class, 'normalize');
    assert.strictEqual(o.blocked, 'oui');
});

t('scenario 7: render-filter rejection -> class:paint (hidden gate)', () => {
    const o = run('playlists', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 3, rawJson: threePlaylists, delivered: true },
        after: { len: 3, empty: false, error: '' },
        paint: { inCount: 3, accepted: 0, empty: 1 },
        admission: { title: 'Playlists' }
    });
    assert.strictEqual(o.class, 'paint');
    assert.strictEqual(o.blocked, 'oui');
    assert.strictEqual(o.hidden, 'oui');
});

t('scenario 8: late response -> class:late counted, not lost', () => {
    const o = run('albums', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 0, rawJson: null, delivered: true, late: 2 },
        after: { len: 0, empty: false, error: '' },
        admission: { title: 'Albums' }
    });
    assert.strictEqual(o.class, 'late');
    assert.ok(o.note.includes('retard'), 'late must be stated: ' + o.note);
});

t('scenario 9: account change -> class:account reset', () => {
    const o = run('playlists', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 0, rawJson: '{"reset":"compte"}', delivered: true, accountChanged: true },
        after: { len: 0, empty: false, error: '' },
        admission: { title: 'Playlists' }
    });
    assert.strictEqual(o.class, 'account');
    assert.strictEqual(o.blocked, 'oui');
});

t('scenario 10: unavailable category -> class:unavailable', () => {
    const o = run('podcasts', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 0, rawJson: null, delivered: true, unavailable: true },
        after: { len: 0, empty: false, error: '' },
        admission: { title: 'Podcasts' }
    });
    assert.strictEqual(o.class, 'unavailable');
    assert.strictEqual(o.blocked, 'oui');
});

t('scenario 11: section never receives callback -> class:lost', () => {
    const o = run('artists', {
        before: { len: 0, empty: false, error: '' },
        delivered: { len: 0, rawJson: null, delivered: false },
        after: { len: 0, empty: false, error: '' },
        admission: { title: 'Artistes' }
    });
    assert.strictEqual(o.class, 'lost');
    assert.strictEqual(o.blocked, 'oui');
});

t('before/after counts show WHERE the items disappear', () => {
    const o = run('playlists', {
        before: { len: 3, empty: false, error: '' },
        delivered: { len: 3, rawJson: threePlaylists, delivered: true },
        after: { len: 0, empty: false, error: '' },
        admission: { title: 'Playlists' }
    });
    assert.strictEqual(o.class, 'render');
    assert.ok(o.note.includes('3 → 0'), 'move must show the drop: ' + o.note);
});

/* ------------------------------------------------------------------ */
/* Native instrumentation contracts (DiagCounters + hooks)             */
/* ------------------------------------------------------------------ */

const counters = read('smali/com/melodix/music/DiagCounters.smali');
const feed = read('smali/com/melodix/music/NativeHomeFeed.smali');
const bridge = read('smali/com/melodix/music/AndBridge.smali');
const main = read('smali/com/melodix/music/MainActivity.smali');

t('DiagCounters exposes the pipeline counters and bounded log', () => {
    for (const m of ['paintIn', 'paintAccepted', 'paintEmpty', 'dispatchIn', 'dispatchDropped', 'mediaRendered', 'mediaDropped', 'readJson', 'readLog']) {
        assert.ok(new RegExp('\\.method public static (declared-synchronized )?' + m + '\\b').test(counters), 'DiagCounters.' + m);
    }
    assert.ok(counters.includes('paintEmpty'), 'paintEmpty counted on zero-accept paints');
    assert.ok(/const\/16 v\d+, 0xc8/.test(counters), 'event log bounded to 200 entries');
    assert.ok(/const\/16 v\d+, 0x1770/.test(counters), 'log chars bounded to 6000');
});

t('NativeHomeFeed.paint counts what really renders (paintIn/paintAccepted)', () => {
    assert.ok(feed.includes('DiagCounters;->paintIn(I)V'), 'paint entry counted');
    assert.ok(feed.includes('DiagCounters;->paintAccepted(I)V'), 'accepted rows counted');
});

t('AndBridge.dispatchNativeUi counts drops (epoch/expired) and exposes diag APIs', () => {
    assert.ok(bridge.includes('DiagCounters;->dispatchIn()V'), 'dispatchIn at entry');
    assert.ok(bridge.includes('DiagCounters;->dispatchDropped()V'), 'dispatchDropped on drop paths');
    assert.ok(bridge.includes('readDiagCounters'), 'readDiagCounters JS API');
    assert.ok(bridge.includes('readDiagLog'), 'readDiagLog JS API');
    assert.ok(bridge.includes('copyToClipboard'), 'copyToClipboard JS API');
});

t('MainActivity media channel counts rendered vs gate-dropped payloads', () => {
    assert.ok(main.includes('DiagCounters;->mediaRendered()V'), 'mediaRendered before renderNativeRows');
    assert.ok(main.includes('DiagCounters;->mediaDropped()V'), 'mediaDropped on gate drops');
    assert.ok(main.includes(':media_gate_drop'), 'dedicated gate-drop label');
});

t('Diagnostic screen is reachable from settings and runs real engine actions', () => {
    assert.ok(main.includes('openNativeDiag()V'), 'openNativeDiag exists');
    assert.ok(main.includes('openNativeDiagAction(Ljava/lang/String;)V'), 'openNativeDiagAction exists');
    assert.ok(main.includes('spotify:diag:'), 'openNativeRow routes spotify:diag:');
    assert.ok(main.includes('window.__sfDiagAction'), 'actions reach the engine');
    assert.ok(main.includes('diag_engine.js'), 'engine injected from bundled asset');
    assert.ok(main.includes(':check_diag'), 'diag: report channel paints the screen');
    assert.ok(main.includes('spotify:diag:open'), 'settings row opens the screen');
});

t('native-first: opening the screen paints a real message without any JS', () => {
    // The screen must never depend on the JS engine to show content: the
    // message + copy action are painted natively, terminal, immediately.
    const openAt = main.indexOf('.method public final openNativeDiag()V');
    const open = main.slice(openAt, main.indexOf('.end method', openAt));
    assert.ok(open.includes('paintDiagNative'), 'open delegates to the native painter');
    // The only JS on open is the self-identification probe (journal enricher);
    // painting and copying never need it.
    assert.ok(!open.includes('diag_engine.js'), 'open must not inject the engine');
    assert.ok(open.indexOf('paintDiagNative') < open.indexOf('runNativeJavascript'),
        'native paint happens before any JS');

    const paintAt = main.indexOf('.method public final paintDiagNative');
    const paint = main.slice(paintAt, main.indexOf('.end method', paintAt));
    assert.ok(paint.includes('Message du diagnostic'), 'the message is painted');
    assert.ok(paint.includes('Copier le message'), 'copy action is painted');
    assert.ok(paint.includes('spotify:diag:copy'), 'copy action uri');
    assert.ok(paint.includes('buildDiagReport'), 'message built from real state');
    assert.ok(paint.includes('renderNativeRows'), 'painted through the native list');
});

t('copy is pure native (ClipboardManager) and never requires the engine', () => {
    const copyAt = main.indexOf('.method public final copyDiagAndPaint');
    const copy = main.slice(copyAt, main.indexOf('.end method', copyAt));
    assert.ok(copy.includes('copyToClipboardStatic'), 'uses the native clipboard helper');
    assert.ok(copy.includes('buildDiagReport'), 'report built natively');
    // The copy may refresh the JS self-probe (journal enricher) but must never
    // depend on the engine to build or deliver the report.
    assert.ok(!copy.includes('__sfDiagAction'), 'no engine in the copy path');
    assert.ok(!copy.includes('diag_engine.js'), 'no engine asset in the copy path');
    assert.ok(copy.includes('Message copié'), 'terminal success feedback');
    assert.ok(copy.includes('Copie impossible'), 'terminal failure feedback');

    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const stAt = bridge.indexOf('.method public static copyToClipboardStatic');
    const st = bridge.slice(stAt, bridge.indexOf('.end method', stAt));
    assert.ok(st.includes('setPrimaryClip'), 'really writes the clipboard');
    assert.ok(st.includes('ClipData;->newPlainText'), 'plain-text clip');

    const exportAt = main.indexOf('.method public final copyDiagExportAndPaint');
    const exp = main.slice(exportAt, main.indexOf('.end method', exportAt));
    assert.ok(exp.includes('countersJson'), 'JSON export carries the counters');
    assert.ok(!exp.includes('__sfDiagAction'), 'no engine in the export path');
});

t('engine runs are bounded: asset-robust read + watchdog terminal fallback', () => {
    // readAssetUtf8(Context, String) variant — no m9.c() throw risk.
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    assert.ok(asset.includes('.method public static readAssetUtf8(Landroid/content/Context;Ljava/lang/String;)'),
        'context-first asset reader exists');
    const actAt = main.indexOf('.method public final openNativeDiagAction');
    const act = main.slice(actAt, main.indexOf('.end method', actAt));
    assert.ok(act.includes('readAssetUtf8(Landroid/content/Context;Ljava/lang/String;)'),
        'actions use the context-first reader');
    assert.ok(act.includes('DiagWatchdog;->arm'), 'watchdog armed before the engine runs');
    assert.ok(act.includes('Moteur de tests indisponible'), 'missing asset -> terminal error');

    const wd = read('smali/com/melodix/music/DiagWatchdog.smali');
    assert.ok(wd.includes('postDelayed'), 'bounded timeout');
    assert.ok(wd.includes('paintDiagNative'), 'timeout repaints a terminal native state');
    assert.ok(wd.includes('.method public static disarm()V'), 'engine reports disarm it');
    const applyAt = main.indexOf('.method public final applyNativeUiData');
    const applyEnd = main.indexOf('.end method', applyAt);
    const checkDiag = main.slice(main.indexOf(':check_diag', applyAt), applyEnd);
    assert.ok(checkDiag.includes('DiagWatchdog;->disarm()V'), 'report arrival disarms the watchdog');
});

t('journal is never masked: non-empty log is always shown in the report', () => {
    // Regression: the isEmpty branch was inverted so the report ALWAYS showed
    // "aucun événement" even with a full journal.
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    const repAt = counters.indexOf('readReport()Ljava/lang/String;');
    const rep = counters.slice(repAt, counters.indexOf('.end method', repAt));
    assert.ok(rep.includes('if-nez v3, :report_no_log'), 'empty -> "aucun événement" only when empty');
    assert.ok(!/if-eqz v3, :report_no_log/.test(rep), 'the inverted branch is gone');
});

t('asset read failures are journaled and have a second read path', () => {
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const ctxAt = asset.indexOf('readAssetUtf8(Landroid/content/Context;Ljava/lang/String;)');
    const ctx = asset.slice(asset.lastIndexOf('.method', ctxAt), asset.indexOf('.end method', ctxAt));
    assert.ok(ctx.includes('asset-err'), 'failure reason journaled');
    assert.ok(ctx.includes('NativeCrashGuard;->excerpt'), 'real exception text captured');

    const actAt = main.indexOf('.method public final openNativeDiagAction');
    const act = main.slice(actAt, main.indexOf('.end method', actAt));
    assert.ok(act.includes('asset-via-activity'), 'first read path journaled');
    assert.ok(act.includes('asset-via-appctx'), 'second read path journaled');
    assert.ok(act.includes('readAssetUtf8(Ljava/lang/String;)'), 'fallback to the app-context reader');
    assert.ok(act.indexOf('asset-via-appctx') < act.indexOf('Moteur de tests indisponible'),
        'fallback runs before the terminal error');
});

t('navigation traces + bridge re-attach explain a dead JS channel', () => {
    // onPageStarted REMOVES AndBridge on any non-open.spotify.com URL (token
    // refresh, error page...). Without traces the channel can die silently;
    // without re-attach it stays dead. Both are now covered.
    const c91 = read('smali/c91.smali');
    const psAt = c91.indexOf('.method public onPageStarted');
    const ps = c91.slice(psAt, c91.indexOf('.end method', psAt));
    assert.ok(ps.includes('page-start'), 'navigation traced');
    assert.ok(ps.includes('bridge-attached'), 'attach traced');
    assert.ok(ps.includes('bridge-removed'), 'remove traced');

    const pfAt = c91.indexOf('.method public final onPageFinished');
    const pf = c91.slice(pfAt, c91.indexOf('.end method', pfAt));
    assert.ok(pf.includes('page-done'), 'page completion traced');
    assert.ok(pf.includes('bridge-reattached'), 'bridge re-attached');
    assert.ok(pf.includes('addJavascriptInterface'), 'really re-attaches');
    assert.ok(pf.includes('"open.spotify.com"'), 're-attach gated to trusted host');

    const rgAt = c91.indexOf('onRenderProcessGone');
    assert.ok(rgAt !== -1, 'renderer crash detected');
    const rg = c91.slice(c91.lastIndexOf('.method', rgAt), c91.indexOf('.end method', rgAt));
    assert.ok(rg.includes('renderer-gone'), 'crash journaled');

    // Security: traces carry host+path only — never query/fragment (tokens).
    assert.ok(ps.includes('getPath()'), 'path only');
    assert.ok(!ps.includes('getQuery()'), 'no query in traces');
    assert.ok(!pf.includes('getQuery()'), 'no query in page-done either');
});

t('copied report matches the screen: last displayed status + native journal', () => {
    // The copy must carry what was DISPLAYED (terminal status rows) and the
    // bounded native journal — otherwise the export cannot explain the screen.
    assert.ok(main.includes('diagLastReason'), 'last status stored');
    const repAt = main.indexOf('.method public final buildDiagReport');
    const rep = main.slice(repAt, main.indexOf('.end method', repAt));
    assert.ok(rep.includes('Dernier état affiché'), 'report includes the displayed status');
    assert.ok(rep.includes('diagLastReason'), 'reads the stored status');
    const paintAt = main.indexOf('.method public final paintDiagNative');
    const paint = main.slice(paintAt, main.indexOf('.end method', paintAt));
    assert.ok(paint.includes('sput-object p1, Lcom/melodix/music/MainActivity;->diagLastReason'),
        'paint stores the status it displays');
});

t('JS self-identification probe: journal distinguishes dead WebView from missing bridge', () => {
    // "js-probe asked" is logged natively before the probe runs; the WebView
    // answers with "js-probe bridge=1 started=... fetch=... shell=... path=...".
    // asked-without-answer = the WebView layer never executes JS.
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    assert.ok(/\.method public final logDiagEvent\(Ljava\/lang\/String;\)V/.test(bridge), 'logDiagEvent JS API');
    const logAt = bridge.indexOf('logDiagEvent(Ljava/lang/String;)V');
    const log = bridge.slice(bridge.lastIndexOf('.method', logAt), bridge.indexOf('.end method', logAt));
    assert.ok(log.includes('JavascriptInterface'), 'reachable from JS');
    assert.ok(log.includes('DiagCounters;->event'), 'feeds the native journal');

    const openAt = main.indexOf('.method public final openNativeDiag()V');
    const open = main.slice(openAt, main.indexOf('.end method', openAt));
    assert.ok(open.includes('js-probe asked'), 'probe ask is journaled natively');
    assert.ok(open.includes('js-probe bridge=1 started='), 'probe reports bridge state');
    assert.ok(open.includes('__sfMelodixBridgeStarted'), 'probe reports the playback bridge');
    assert.ok(open.includes('typeof window.fetchMediaItems'), 'probe reports fetchMediaItems');
    assert.ok(open.includes('runNativeJavascript'), 'probe actually runs');

    const copyAt = main.indexOf('.method public final copyDiagAndPaint');
    const copy = main.slice(copyAt, main.indexOf('.end method', copyAt));
    assert.ok(copy.includes('js-probe asked'), 'copy refreshes the probe');
    assert.ok(copy.includes('diag-copy req'), 'copy asks are journaled');
});

t('engine steps mirror into the native journal (report keeps engine results)', () => {
    assert.ok(engineSrc.includes('window.AndBridge.logDiagEvent'), 'engine mirrors events natively');
    assert.ok(engineSrc.includes("'moteur: '"), 'mirrored entries are tagged');
    const i = engineSrc.indexOf('function pushEvent');
    const fn = engineSrc.slice(i, engineSrc.indexOf('\n    }', i));
    assert.ok(fn.includes('logDiagEvent'), 'pushEvent is the single mirror point');
});

t('native message carries real state and stays free of personal data', () => {
    const repAt = main.indexOf('.method public final buildDiagReport');
    const rep = main.slice(repAt, main.indexOf('.end method', repAt));
    assert.ok(rep.includes('nativeCurrentScreen'), 'real screen state');
    assert.ok(rep.includes('nativeLibraryJson'), 'real cache state');
    assert.ok(rep.includes('DiagCounters;->readReport()'), 'real pipeline counters');
    assert.ok(!rep.includes('spotifyProfileName'), 'no account name in the report');
    assert.ok(!rep.includes('Bearer'), 'no auth material');
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    assert.ok(counters.includes('.method public static declared-synchronized readReport()'),
        'readReport exists');
});

t('back navigation from the diagnostic returns to settings', () => {
    const method = main.slice(main.indexOf('.method public final handleNativeBack'));
    const i = method.indexOf(':native_back_check_diag');
    assert.ok(i !== -1, 'handleNativeBack knows the diagnostic screen');
    const seg = method.slice(i, i + 500);
    assert.ok(seg.includes('openNativeSettings()V'), 'Back -> settings');
    assert.ok(method.includes('"diagnostic"'), 'screen matched');
});

t('settings shell rows carry the diagnostic entry', () => {
    const shell = read('assets/native_ui_shell.js');
    assert.ok(shell.includes('spotify:diag:open'), 'buildSpotifySettingsRows has the entry row');
    assert.ok(shell.includes('Diagnostic Melodix'), 'entry row titled');
});

t('engine action list covers run/retry/export/copy and closes every run', () => {
    assert.ok(main.includes("const-string v0, \"copy\""), 'copy routed natively');
    assert.ok(main.includes("const-string v0, \"summary\""), 'summary routed natively');
    assert.ok(main.includes("const-string v0, \"export\""), 'export routed natively');
    assert.ok(engineSrc.includes("a === 'run'"), 'full run action');
    assert.ok(engineSrc.includes("a.indexOf('cat:') === 0"), 'per-category actions');
    assert.ok(engineSrc.includes("a === 'retry'"), 'safe retry action');
    assert.ok(engineSrc.includes("a === 'export'"), 'export action');
    assert.ok(engineSrc.includes("a === 'summary'"), 'copy summary action');
    assert.ok(engineSrc.includes('state.running = false'), 'runs close with a terminal state');
    assert.ok((engineSrc.match(/state\.running = false/g) || []).length >= 2, 'every run closes');
    assert.ok(engineSrc.includes("sendScreen(rows)"), 'runs end by painting terminal rows');
});

/* ------------------------------------------------------------------ */
/* Sanitization: no names, no tokens, bounded text                     */
/* ------------------------------------------------------------------ */

t('screen text is sanitized: no token/cookie patterns, names stripped', () => {
    const i = engineSrc.indexOf('function sanitizeDetail');
    const fnMatch = engineSrc.slice(i).match(/function sanitizeDetail[\s\S]*?\n    }/);
    assert.ok(fnMatch, 'sanitizeDetail() exists');
    const fn = vm.runInContext('(' + fnMatch[0] + ')', sandbox);
    const dirty = 'Bearer AAAABBBBCCCC token=xyz123 Set-Cookie: session=abc; sid=deadbeef';
    const clean = fn(dirty);
    assert.ok(!/AAAA/.test(clean), 'token-like segments must be scrubbed: ' + clean);
    assert.ok(!/xyz123/.test(clean), 'token values must be scrubbed: ' + clean);
    assert.ok(!/session=abc/.test(clean), 'cookie values must be scrubbed: ' + clean);
    assert.ok(!/deadbeef/.test(clean), 'sid values must be scrubbed: ' + clean);
    assert.ok(clean.length <= 220, 'bounded');
});

t('fingerprint is irreversible (fnv1a-8 hex, not reversible text)', () => {
    const i = engineSrc.indexOf('function fingerprint');
    const fnMatch = engineSrc.slice(i).match(/function fingerprint[\s\S]*?\n    }/);
    assert.ok(fnMatch, 'fingerprint() exists');
    const fn = vm.runInContext('(' + fnMatch[0] + ')', sandbox);
    const fp = fn('spotify:user:secret-name');
    assert.ok(/^[0-9a-f]{8}$/.test(fp), 'fingerprint format: ' + fp);
    assert.ok(!fp.includes('secret'), 'no raw text in fingerprint');
    assert.strictEqual(fn('a'), fn('a'), 'stable');
    assert.notStrictEqual(fn('a'), fn('b'), 'discriminating');
});

t('summary excludes raw json by default (no private bodies on screen)', () => {
    assert.ok(engineSrc.includes('window.__sfDiagSummary = summaryText'), 'exportable summary exists');
    assert.ok(engineSrc.includes('window.__sfDiagReportJson = reportJson'), 'exportable report exists');
    const summary = sandbox.window.__sfDiagSummary();
    assert.ok(!/rawJson/.test(summary), 'summary must not carry raw bodies');
    assert.ok(!/Bearer /.test(summary), 'no auth material in summary');
    assert.ok(typeof summary === 'string' && summary.indexOf('Melodix') !== -1, 'readable summary');
    const report = JSON.parse(sandbox.window.__sfDiagReportJson());
    assert.strictEqual(report.includeNames, false, 'report excludes playlist names by default');
    assert.ok(Array.isArray(report.steps) && report.events, 'bounded structures');
});

t('native->JS delivery: singleton fallback and observable dead-end', () => {
    // The device reports proved evaluateJavascript never executes. The send
    // path must (1) fall back to the app-wide WebView singleton when the
    // activity reference is stale and (2) journal a marker when there is
    // nothing to send to instead of silently doing nothing.
    const rnAt = main.indexOf('.method public final runNativeJavascript');
    const rn = main.slice(rnAt, main.indexOf('.end method', rnAt));
    assert.ok(rn.includes('Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;'), 'primary: activity WebView');
    assert.ok(rn.includes('Lcom/melodix/music/AppSingleton;->w:Ll9;'), 'fallback: app singleton WebView');
    assert.ok(rn.includes('js-out webview=none'), 'dead-end is journaled');
    assert.ok(rn.includes('evaluateJavascript'), 'really sends');
});

t('callback probe proves evaluateJavascript delivery independent of the bridge', () => {
    // ValueCallback fires from the renderer layer itself: js-cb <id> means JS
    // executed; js-probe miss cb=absent means native->JS delivery is dead.
    const prAt = main.indexOf('.method public final probeJsChannel()V');
    assert.ok(prAt !== -1, 'probeJsChannel exists');
    const pr = main.slice(prAt, main.indexOf('.end method', prAt));
    assert.ok(pr.includes('js-cb ask'), 'ask journaled');
    assert.ok(pr.includes('Lcom/melodix/music/DiagJsProbeCallback;'), 'ValueCallback probe class used');
    assert.ok(pr.includes('Lcom/melodix/music/DiagJsProbeTimeout;'), 'bounded miss marker');
    assert.ok(pr.includes('evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V'),
        'probe passes a ValueCallback');
    assert.ok(pr.includes('bridge-ok') && pr.includes('no-bridge'), 'callback value distinguishes bridge state');
    assert.ok(pr.includes('js-out webview=none'), 'no-webview case terminal');

    const cb = read('smali/com/melodix/music/DiagJsProbeCallback.smali');
    assert.ok(cb.includes('Landroid/webkit/ValueCallback;'), 'implements ValueCallback');
    // The erased interface method is (Ljava/lang/Object;)V — implementing only
    // the String overload raises AbstractMethodError inside the WebView.
    assert.ok(cb.includes('onReceiveValue(Ljava/lang/Object;)V'), 'erased ValueCallback signature');
    assert.ok(cb.includes('js-cb '), 'answers journaled');
    assert.ok(cb.includes('DiagCounters;->answerProbe()V'), 'pending flag cleared');
    assert.ok(cb.includes('Ljava/lang/Throwable;'), 'probe can never crash the app');
    // Never check-cast the value: some WebViews hand over non-String objects
    // and a cast would swallow the evidence silently.
    assert.ok(!/check-cast v\d+, /.test(cb), 'value stringified, not cast');
    assert.ok(cb.includes('Ljava/lang/Object;->toString()Ljava/lang/String;'), 'stringified value');
    assert.ok(cb.includes('js-cb err'), 'callback failures are journaled too');

    const to = read('smali/com/melodix/music/DiagJsProbeTimeout.smali');
    assert.ok(to.includes('js-cb tmo '), 'timeout always journaled');
    assert.ok(!to.includes('probePending'), 'no shared-state gate that could silence it');
    assert.ok(to.includes('probeAnswered'), 'reports whether the callback answered');
});

t('native->JS targets the WebView that is actually loading the page', () => {
    // c91 registers every WebView it serves (the instance whose JS really
    // runs); sends resolve pageView -> G -> singleton so traffic can never
    // land on a stale instance after a recovery.
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    assert.ok(counters.includes('pageView:Ljava/lang/ref/WeakReference;'), 'tracked page WebView');
    assert.ok(/\.method public static setPageView\(/.test(counters), 'registered from the client');
    assert.ok(/\.method public static getPageView\(/.test(counters), 'resolved by senders');

    const c91 = read('smali/c91.smali');
    const psAt = c91.indexOf('.method public onPageStarted');
    const ps = c91.slice(psAt, c91.indexOf('.end method', psAt));
    assert.ok(ps.includes('setPageView'), 'page-start registers the live WebView');
    assert.ok(ps.includes('identityHashCode'), 'page-start carries the instance hash');
    const pfAt = c91.indexOf('.method public final onPageFinished');
    const pf = c91.slice(pfAt, c91.indexOf('.end method', pfAt));
    assert.ok(pf.includes('setPageView'), 'page-done registers it too');

    const rnAt = main.indexOf('.method public final runNativeJavascript');
    const rn = main.slice(rnAt, main.indexOf('.end method', rnAt));
    assert.ok(rn.includes('DiagCounters;->getPageView()Landroid/webkit/WebView;'), 'page WebView first');
    assert.ok(rn.indexOf('getPageView') < rn.indexOf('MainActivity;->G:'), 'before the activity field');

    const prAt = main.indexOf('.method public final probeJsChannel()V');
    const pr = main.slice(prAt, main.indexOf('.end method', prAt));
    assert.ok(pr.includes('js-cb tgt '), 'probe journals the target identity');
});

t('renderer crash flag: set on onRenderProcessGone, cleared when a page runs', () => {
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    assert.ok(counters.includes('.field public static volatile rendererGone:Z'), 'flag exists');
    assert.ok(/\.method public static markRendererGone\(\)V/.test(counters), 'setter');
    assert.ok(/\.method public static markWebviewReady\(\)V/.test(counters), 'clearer');

    const c91 = read('smali/c91.smali');
    const rgAt = c91.indexOf('onRenderProcessGone');
    const rg = c91.slice(c91.lastIndexOf('.method', rgAt), c91.indexOf('.end method', rgAt));
    assert.ok(rg.includes('markRendererGone'), 'crash sets the flag');
    const pfAt = c91.indexOf('.method public final onPageFinished');
    const pf = c91.slice(pfAt, c91.indexOf('.end method', pfAt));
    assert.ok(pf.includes('markWebviewReady'), 'page completion clears the flag');
});

t('one-tap diagnostic: full action probes, tests playlists and auto-copies', () => {
    const actAt = main.indexOf('.method public final openNativeDiagAction');
    const act = main.slice(actAt, main.indexOf('.end method', actAt));
    assert.ok(act.includes('"full"'), 'full action routed');
    assert.ok(act.includes('probeJsChannel'), 'delivery probed');
    assert.ok(act.includes('diagAutoCopy'), 'auto-copy armed');
    assert.ok(act.includes('"diag-full"'), 'run journaled');
    assert.ok(act.includes('DiagWatchdog;->arm'), 'watchdog still bounded');

    const wd = read('smali/com/melodix/music/DiagWatchdog.smali');
    assert.ok(wd.includes('autoCopyDiagIfArmed'), 'timeout terminal auto-copies');

    const applyAt = main.indexOf('.method public final applyNativeUiData');
    const applyEnd = main.indexOf('.end method', applyAt);
    const checkDiag = main.slice(main.indexOf(':check_diag', applyAt), applyEnd);
    assert.ok(checkDiag.includes('autoCopyDiagIfArmed'), 'engine report auto-copies too');

    const paintAt = main.indexOf('.method public final paintDiagNative');
    const paint = main.slice(paintAt, main.indexOf('.end method', paintAt));
    assert.ok(paint.includes('spotify:diag:full'), 'one-tap row painted first');
});

t('report appears line by line on the screen without copying', () => {
    const paintAt = main.indexOf('.method public final paintDiagNative');
    const paint = main.slice(paintAt, main.indexOf('.end method', paintAt));
    assert.ok(paint.includes('split('), 'report split into lines');
    assert.ok(/section\\":\\"Rapport/.test(paint), 'lines painted as their own rows');
    assert.ok(paint.includes(':report_line_loop'), 'bounded line loop');
});

t('service-path recovery rebinds the activity WebView', () => {
    const yi1 = read('smali/yi1.smali');
    assert.ok(yi1.includes('Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;'),
        'rebuilt WebView is rebound to MainActivity.G');
    assert.ok(yi1.includes('Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;'),
        'rebind goes through the live activity reference');
});

console.log('OK diag_screen');
