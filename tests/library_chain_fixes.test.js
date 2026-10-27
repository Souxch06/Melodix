// Non-regression contracts for the ROOT-CAUSE fixes of the playlist chain
// (2026-10-25 investigation). Each contract reproduces a defect that was
// demonstrated on the code path of a real device:
//
//   D1. "Chargement des playlists…" forever: a transient loading status row
//       disarmed the watchdog AND overwrote nativeLibraryJson, so a re-entry
//       painted the poisoned row again with NO watchdog at all.
//   D2. Terminal states (login/error after the bounded retry budget) only
//       repainted Accueil: the Library tab kept its loading row forever.
//   D3. The watchdog could paint an error over rows that had already arrived.
//   D4. An error/status row could overwrite the real cached library rows.
//
// The JS halves of these fixes are covered behaviorally in
// tests/library_fetch_diagnostics.test.js; this file pins the native side.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const main = read('smali/com/melodix/music/MainActivity.smali');
const bridge = read('smali/com/melodix/music/AndBridge.smali');
const cache = read('smali/com/melodix/music/NativeLibCache.smali');
const watchdog = read('smali/com/melodix/music/NativeLibWatchdog.smali');
const shell = read('assets/spotify_bridge.js');

test('D1. the Library watchdog is armed on EVERY tab entry (lib_fetch), not only the empty-cache branch', () => {
    const libAt = main.indexOf('\n    :lib_fetch\n');
    assert.ok(libAt !== -1, ':lib_fetch exists');
    const fetchBlock = main.slice(libAt, main.indexOf('\n    :try_end_lib\n', libAt));
    assert.ok(fetchBlock.includes('NativeLibWatchdog;->arm'),
        'arm() runs on every entry so no poisoned cache row can stay in a loading state forever');
});

test('D1. a transient "loading" status row never disarms the watchdog (library and detail gates)', () => {
    const gates = main.split('"kind\\":\\"loading\\"').length - 1;
    assert.ok(gates >= 2, 'both the library and the detail render gates check kind:loading');
    assert.ok(main.includes(':lib_disarm_skip'), 'library gate skips the disarm for loading rows');
    assert.ok(main.includes(':detail_disarm_skip'), 'detail gate skips the disarm for loading rows');
});

test('D4. loading/error/login status rows never fill nativeLibraryJson (an error cannot clobber a good cache)', () => {
    assert.ok(main.includes(':store_gate_1') && main.includes(':store_gate_2') && main.includes(':store_do'),
        'the cache store has status-row guards');
    const storeAt = main.indexOf('\n    :media_cache_store\n');
    assert.ok(storeAt !== -1, ':media_cache_store exists');
    const block = main.slice(storeAt, main.indexOf('\n    :media_render_gate\n', storeAt));
    for (const kind of ['loading', 'error', 'login']) {
        assert.ok(block.includes(`"kind\\":\\"${kind}\\"`), `kind:${kind} is excluded from the cache`);
    }
    assert.ok(block.includes('iput-object v2, p0, Lcom/melodix/music/MainActivity;->nativeLibraryJsonId'),
        'real content rows are still cached');
});

test('D3. paintLibLoadError resolves ready/empty from the cache BEFORE painting any error', () => {
    const at = main.indexOf('.method public final paintLibLoadError()V');
    assert.ok(at !== -1, 'paintLibLoadError exists');
    const method = main.slice(at, main.indexOf('.end method', at));
    assert.ok(method.includes('"status\\":\\"ready\\"') && method.includes('"status\\":\\"empty\\"'),
        'a ready/empty run is detected first');
    assert.ok(method.includes('NativeLibCache;->load'),
        'the real rows are repainted from the cache');
    const cachePaint = method.indexOf(':paint_cached_rows');
    assert.ok(cachePaint !== -1, 'the data-first branch exists');
    assert.ok(method.indexOf(':paint_cached_rows') < method.indexOf('"token\\":\\"oui\\"'),
        'data wins over the error/login classification');
});

test('D2. a terminal batch arriving on the bridge always repaints the visible Library screen', () => {
    // NativeLibCache.finish repaints via postNativeUiData("media:" + cat, rows)
    // so a fresh push replaces whatever loading/empty row is on screen.
    assert.ok(cache.includes('postNativeUiData'),
        'NativeLibCache.finish dispatches the finished category to the screen');
    assert.ok(cache.includes('"media:"'),
        'the dispatch targets the media:<cat> route');
    // And the watchdog terminal path repaints data, login or error — never a
    // stuck loading row (covered above); the watchdog itself is the last net.
    assert.ok(watchdog.includes('paintLibLoadError'), 'the watchdog resolves the terminal state');
});

test('D2. every queued request is answered on every terminal branch (JS drain contract)', () => {
    assert.ok(shell.includes('function drainPendingMediaRequests'),
        'the bridge drains pendingMediaRequests on terminal branches');
    const tokenMissing = shell.indexOf("__sfAuthMissing = true");
    assert.ok(tokenMissing !== -1, 'token-missing branch exists');
    assert.ok(shell.includes("drainPendingMediaRequests('login')"),
        'token-missing answers queued requests with a login row');
    assert.ok(shell.includes("drainPendingMediaRequests('error', e)"),
        'a failure answers queued requests with an error row');
});

test('D2. the login status row carries a real login action (not a retry of a dead fetch)', () => {
    assert.ok(shell.includes("actionUri: 'spotify:lib:login'"),
        'the login row opens the Spotify login');
    assert.ok(shell.includes("kind: 'login'"), 'the login row is typed');
});
