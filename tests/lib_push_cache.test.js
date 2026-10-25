// Change 1 contracts — the page pushes the normalized library to native over
// JS->native (bounded batches), the native side validates, persists next to
// the home cache (SharedPreferences "melodix_native") and paints the cached
// list first (marked "à jour il y a X") before any fresh push. An error never
// empties the cache. Each contract fails if its change is removed.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('AndBridge.onMediaLibBatch receives the page batches into NativeLibCache', () => {
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const at = bridge.indexOf('.method public final onMediaLibBatch');
    assert.ok(at !== -1, 'onMediaLibBatch entry point');
    const m = bridge.slice(at, bridge.indexOf('.end method', at));
    assert.ok(m.includes('JavascriptInterface'), 'callable from the page');
    assert.ok(m.includes('NativeLibCache;->accept'), 'stored through NativeLibCache');
});

test('NativeLibCache validates items strictly and builds rows for the library screen', () => {
    const cache = read('smali/com/melodix/music/NativeLibCache.smali');
    const vu = cache.indexOf('.method public static validUri');
    const vum = cache.slice(vu, cache.indexOf('.end method', vu));
    assert.ok(vum.includes('spotify:collection:tracks'), 'liked-songs uri accepted');
    assert.ok(vum.includes('spotify:(playlist|album|artist|show):[A-Za-z0-9]{22}'),
        'only validated 22-char media uris');
    assert.ok(vum.includes('Ljava/lang/String;->matches'), 'strict pattern match');

    const ai = cache.indexOf('.method private static declared-synchronized appendItem');
    const aim = cache.slice(ai, cache.indexOf('.end method', ai));
    assert.ok(aim.includes('\\"title\\":'), 'rows carry title');
    assert.ok(aim.includes('\\"subtitle\\":'), 'rows carry subtitle');
    assert.ok(aim.includes('\\"uri\\":'), 'rows carry uri');
    assert.ok(aim.includes('\\"image\\":'), 'rows carry image');
    assert.ok(aim.includes('https://'), 'only https artwork');
    assert.ok(aim.includes('catSection'), 'rows carry the screen section');
    const acc = cache.slice(cache.indexOf('.method public static declared-synchronized accept'),
        cache.indexOf('.end method', cache.indexOf('.method public static declared-synchronized accept')));
    assert.ok(acc.includes('"items"') && acc.includes('"last"'), 'batch protocol (items/last)');
    assert.ok(acc.includes('optInt'), 'bounded epochs and indexes');
});

test('the library cache persists next to the home cache and is written only when complete', () => {
    const cache = read('smali/com/melodix/music/NativeLibCache.smali');
    assert.ok(cache.includes('"melodix_native"'), 'same SharedPreferences as the home cache');
    assert.ok(cache.includes('lib_cache_'), 'library cache key');
    assert.ok(cache.includes('lib_cache_at_'), 'per-category freshness stamp');
    const saveAt = cache.indexOf('.method public static save');
    const callers = cache.slice(0, saveAt).split('NativeLibCache;->save').length - 1;
    assert.equal(callers, 1, 'save happens at exactly one place (batch completion)');
    assert.ok(cache.includes('.method public static load'), 'restored at startup');
    assert.ok(cache.includes('ageLabel'), 'freshness label');
    const cs = cache.indexOf('.method public static composeStamped');
    const csm = cache.slice(cs, cache.indexOf('.end method', cs));
    assert.ok(csm.includes('à jour il y a '), 'cache marked "à jour il y a X"');
    assert.ok(csm.includes('Bibliothèque en cache'), 'explicit cache marker row');
});

test('a confirmed-empty category is an honest empty list, never an error', () => {
    const cache = read('smali/com/melodix/music/NativeLibCache.smali');
    assert.ok(cache.includes('"Aucune playlist"'), 'confirmed-empty playlists state');
    assert.ok(cache.includes('\\"kind\\":\\"empty\\"'), 'typed as confirmed empty');
    const fin = cache.slice(cache.indexOf('.method private static declared-synchronized finish'),
        cache.indexOf('.end method', cache.indexOf('.method private static declared-synchronized finish')));
    assert.ok(!fin.includes('NativeCrashGuard'), 'completing a push is never an error path');
});

test('the Library screen paints the cached list first, then the loading state', () => {
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const at = main.indexOf('\n    :lib_render_loading\n');
    assert.ok(at !== -1, 'loading branch exists');
    const block = main.slice(at, main.indexOf(':lib_fetch', at) + 20);
    assert.ok(block.includes('NativeLibCache;->composeStamped'), 'cache consulted first');
    assert.ok(block.indexOf('composeStamped') < block.indexOf(':lib_paint_loading'),
        'the loading paint is reached only when the cache is empty');
    assert.ok(block.includes('playlists'), 'the main library category');

    const app = read('smali/com/melodix/music/AppSingleton.smali');
    assert.ok(app.includes('NativeLibCache;->install'), 'context installed at startup');
});

// ---------------------------------------------------------------------------
// Change 2 — the native command queue polled by the page replaces native->JS
// for user commands (evaluateJavascript kept as the secondary path).
// ---------------------------------------------------------------------------

test('AndBridge exposes a bounded command queue polled by the page', () => {
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const poll = bridge.indexOf('.method public final declared-synchronized pollCommands');
    assert.ok(poll !== -1, 'pollCommands entry point');
    const pm = bridge.slice(poll, bridge.indexOf('.end method', poll));
    assert.ok(pm.includes('JavascriptInterface'), 'synchronous JS-callable poll');
    assert.ok(pm.includes('\\"cmds\\"'), 'returns pending commands');
    assert.ok(pm.includes('\\"ui\\"'), 'tells the page when the native UI is visible');

    const q = bridge.indexOf('.method public static declared-synchronized queueCommand');
    const qm = bridge.slice(q, bridge.indexOf('.end method', q));
    assert.ok(qm.includes('0x20'), 'bounded queue (32 pending max)');
    assert.ok(bridge.includes('isSafeFn'), 'function names validated natively too');
    assert.ok(bridge.includes('[A-Za-z_][A-Za-z0-9_]{0,48}'), 'strict name charset');
});

test('existing native commands go through the queue (evaluateJavascript stays secondary)', () => {
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const queued = (fn) => main.split('AndBridge;->queueCommand').length - 1;
    assert.ok(queued() >= 5, 'several command paths are queued');

    const retry = main.indexOf('"spotify:retry:media:"');
    const retryBlock = main.slice(retry, main.indexOf(':native_row_not_lib_retry', retry));
    assert.ok(retryBlock.includes('queueCommand'), 'spotify:retry:media: queued');
    assert.ok(retryBlock.includes('runNativeFunction'), 'evaluateJavascript kept as secondary');

    assert.ok(/"__sfOpenCollection"\s*\n\s*invoke-static/.test(main), 'collection opens queued');
    assert.ok(main.includes('"__sfOpenLibrary"\n'), 'library open queued');
    assert.ok(main.includes('"__sfToggleSpotifySetting"'), 'settings toggles queued');
    assert.ok(main.includes('"__sfOpenLibraryCategory"'), 'category clicks queued');
});

// ---------------------------------------------------------------------------
// Change 3 — a playlist opens without native->JS: command queue, then the
// loadUrl("javascript:...") channel (no reload), then a strictly validated
// loadUrl("https://open.spotify.com/playlist/<22id>") fallback.
// ---------------------------------------------------------------------------

test('a secondary loadUrl("javascript:...") channel exists and never interpolates raw args', () => {
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const at = main.indexOf('.method public final runNativeFunctionSecondary');
    assert.ok(at !== -1, 'secondary channel exists');
    const m = main.slice(at, main.indexOf('.end method', at));
    assert.ok(m.includes('"javascript:"'), 'loadUrl javascript: channel (no page reload)');
    assert.ok(m.includes('loadUrl'), 'sent through the WebView');
    assert.ok(m.includes('AndBridge;->isSafeFn'), 'function names validated');
    assert.ok(m.includes('JSONObject;->quote'), 'arguments JSON-quoted, never interpolated raw');
    // No raw string concatenation of the argument into the JS source.
    assert.ok(m.indexOf('JSONObject;->quote') < m.indexOf('const-string v3, "javascript:"'), 'quote before send');
});

test('the https fallback accepts only validated spotify:playlist:<22> uris', () => {
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const at = main.indexOf('.method public final openPlaylistFallback');
    assert.ok(at !== -1, 'fallback exists');
    const m = main.slice(at, main.indexOf('.end method', at));
    assert.ok(m.includes('spotify:playlist:[A-Za-z0-9]{22}'), 'strict uri validation');
    assert.ok(m.includes('Ljava/lang/String;->matches'), 'full-match regex');
    assert.ok(m.includes('"https://open.spotify.com/playlist/"'), 'the only URL ever built');
    assert.ok(!m.includes('https://open.spotify.com/album'), 'no other collection URL');
    assert.ok(m.includes('NativeFetchGuard;->parseAllowedUrl'), 'host allowlist belt');
    assert.ok(m.includes('isSpotifyAuthHost'), 'Spotify host required');
    assert.ok(m.includes('loadUrl'), 'navigates the WebView');

    const fb = read('smali/com/melodix/music/LibOpenFallback.smali');
    assert.ok(fb.includes('0x1770'), 'bounded 6 s wait');
    assert.ok(fb.includes('nativeSessionEpoch'), 'session epoch gate');
    assert.ok(fb.includes('"detail"'), 'no navigation once the detail screen opened');
    assert.ok(fb.includes('openPlaylistFallback'), 'falls back to the validated navigation');
    assert.ok(fb.includes('nativeExpectedId'), 'only for the row still expected');

    const start = main.indexOf('"__sfOpenCollection"');
    const block = main.slice(start, main.indexOf(':native_row_click_done', start));
    assert.ok(block.includes('LibOpenFallback;->arm'), 'armed when a playlist row opens');
    assert.ok(block.includes('runNativeFunctionSecondary'), 'javascript: channel sent first');
    assert.ok(block.includes('queueCommand'), 'queue first');
});
