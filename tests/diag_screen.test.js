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

console.log('OK diag_screen');
