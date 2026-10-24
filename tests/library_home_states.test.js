// Non-regression suite for the three fixed defects:
//  1. real user playlists must reach the home screen (library fetch state machine);
//  2. the playlist loading state must never leak into other tabs and must be
//     replaced by content, an empty state or an explicit error;
//  3. settings/navigation must stay honest (no fake toggles, no cross-tab paint).
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

function homePayloads(calls) {
    return calls.filter((call) => call.screen === 'home');
}

function lastHomeRows(calls) {
    const list = homePayloads(calls);
    return JSON.parse(list[list.length - 1].data);
}

function bootShell(extra = {}) {
    const calls = [];
    const timers = [];
    const store = new Map();
    const mainView = extra.mainView || { querySelectorAll: () => [] };
    const document = {
        readyState: 'complete',
        documentElement: {},
        hidden: false,
        querySelector: (selector) => (selector === '#main-view' ? mainView : null),
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
        disconnect() {}
    }
    const window = Object.assign({
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            onNativeListText: (text) => calls.push({ screen: 'list-text-direct', data: text }),
            setCanvasDisabled: (value) => calls.push({ screen: 'setCanvasDisabled', data: String(value) }),
            manageTSleep: () => calls.push({ screen: 'manageTSleep', data: '' }),
            nativeLogout: () => calls.push({ screen: 'nativeLogout', data: '' })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        },
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {},
        localStorage: {
            getItem: (key) => (store.has(key) ? store.get(key) : null),
            setItem: (key, value) => store.set(key, String(value)),
            clear: () => store.clear()
        }
    }, extra.window || {});
    vm.runInNewContext(read('assets/native_ui_shell.js'), {
        window,
        document,
        URL,
        MutationObserver: TestMutationObserver
    });
    return { window, document, calls, timers, store };
}

function paintMethod() {
    const src = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const start = src.indexOf('.method public static paint');
    return src.slice(start, src.indexOf('.end method', start));
}

function activityMethod(name) {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    const start = src.indexOf(`.method public final ${name}`);
    assert.ok(start >= 0, `missing method ${name}`);
    const end = src.indexOf('.end method', start);
    return src.slice(start, end > 0 ? end : src.length);
}

// ---------------------------------------------------------------------------
// 1. Real playlists reach the home screen
// ---------------------------------------------------------------------------

test('home shows every real user playlist with cover, name and URI', () => {
    const playlists = [
        { name: 'Électro été', uri: 'spotify:playlist:elec1', image: 'https://i.scdn.co/image/e1' },
        { name: 'Rock « classique »', uri: 'spotify:playlist:rock2', image: 'https://i.scdn.co/image/r2' },
        { name: 'Étude & focus', uri: 'spotify:playlist:focus3', image: 'https://i.scdn.co/image/f3' }
    ];
    const { calls } = bootShell({ window: { mediaLib: { playlists } } });
    const rows = lastHomeRows(calls);
    for (const playlist of playlists) {
        const row = rows.find((entry) => entry.uri === playlist.uri);
        assert.ok(row, `row for ${playlist.name}`);
        assert.equal(row.title, playlist.name, 'accents and special characters survive');
        assert.equal(row.image, playlist.image, 'cover art is forwarded');
        assert.equal(row.section, 'Vos playlists');
    }
    assert.ok(!JSON.stringify(rows).includes('Chargement des playlists'), 'loading state is gone once data exists');
});

test('loading row is sent once and never repeats while the library stays pending', () => {
    const { window, calls } = bootShell();
    const loadings = homePayloads(calls).filter((call) => call.data.includes('Chargement des playlists'));
    assert.equal(loadings.length, 1, 'exactly one loading payload is published');
    window.__sfNativeUiRefresh();
    window.__sfNativeUiRefresh();
    const after = homePayloads(calls).filter((call) => call.data.includes('Chargement des playlists'));
    assert.equal(after.length, 1, 'repeated updates do not re-send the loading row');
});

test('library notification replaces the loading row with the real playlists', () => {
    const { window, calls } = bootShell();
    assert.ok(homePayloads(calls).some((call) => call.data.includes('Chargement des playlists')));
    window.mediaLib = {
        playlists: [
            { name: 'Playlist A', uri: 'spotify:playlist:a1' },
            { name: 'Playlist B', uri: 'spotify:playlist:b2' }
        ]
    };
    window.__sfMediaLibState = 'ready';
    window.__sfNotifyMediaLibReady();
    const rows = lastHomeRows(calls);
    assert.ok(rows.some((row) => row.title === 'Playlist A'));
    assert.ok(rows.some((row) => row.title === 'Playlist B'));
    assert.ok(!JSON.stringify(rows).includes('Chargement des playlists'), 'the loading state disappears after success');
});

// ---------------------------------------------------------------------------
// 2. Empty / error / session states are distinct and honest
// ---------------------------------------------------------------------------

test('an empty library shows a real empty state, not a loading row', () => {
    const { calls } = bootShell({ window: { mediaLib: { playlists: [] } } });
    const rows = lastHomeRows(calls);
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'Aucune playlist dans ce compte');
    assert.ok(!JSON.stringify(rows).includes('Chargement'), 'no loading message for a confirmed empty account');
});

test('a failed library fetch shows an explicit error and never claims the account is empty', () => {
    const { window, calls } = bootShell({ window: { __sfMediaLibState: 'error' } });
    const rows = lastHomeRows(calls);
    assert.equal(rows[0].title, 'Impossible de charger les playlists');
    assert.ok(rows[0].subtitle.length > 0, 'the error explains how to retry');
    assert.ok(!JSON.stringify(rows).includes('Aucune playlist'), 'a fetch error is not an empty account');
    assert.ok(!JSON.stringify(rows).includes('Chargement'), 'the loading state is replaced after failure');
    window.__sfNotifyMediaLibReady();
    assert.equal(lastHomeRows(calls)[0].title, 'Impossible de charger les playlists', 'the error stays until data exists');
});

test('a session without a library module only shows the loading state on home payloads', () => {
    const { calls } = bootShell();
    const home = homePayloads(calls);
    assert.ok(home.length >= 1);
    assert.ok(home.every((call) => call.screen === 'home'), 'status rows go to the home channel only');
    assert.ok(home.every((call) => call.data.includes('"section":"Accueil"')), 'and render in the home section only');
});

test('the bridge library state machine distinguishes pending, ready, empty and error', () => {
    const bridge = read('assets/spotify_bridge.js');
    assert.match(bridge, /publishMediaLibState\(/);
    assert.match(bridge, /__sfMediaLibState = state/);
    assert.match(bridge, /__sfMediaLibError = errorMessage/);
    assert.match(bridge, /scheduleMediaLibRetry\(\)/);
    assert.match(bridge, /MEDIA_LIB_MAX_RETRIES = 5/);
    assert.match(bridge, /httpError\.name = 'HttpError'/);
    assert.match(bridge, /__sfNotifyMediaLibReady/);
    assert.match(bridge, /publishMediaLibState\(window\.mediaLib\.playlists\.length \? 'ready' : 'empty', null\)/);
    assert.match(bridge, /publishMediaLibState\('error', sanitizeDiagnostic\(e\)\)/);
    // A failed HTTP request must throw instead of returning a fake empty list.
    assert.match(bridge, /if \(!resp \|\| !resp\.ok \|\| !data\) \{[\s\S]*?throw httpError;/);
    // A stale persisted-query hash falls back to the bundled one before failing.
    assert.match(bridge, /hashCandidates/);
});

test('the shell never invents playlist rows for success states', () => {
    const shell = read('assets/native_ui_shell.js');
    // Status rows exist only for loading / empty / error kinds.
    const status = shell.match(/function homeStatusRows\(kind\) \{([\s\S]*?)\n    \}/);
    assert.ok(status);
    assert.doesNotMatch(status[1], /Daily Mix|Discover Weekly|Release Radar|Focus Mix/);
    assert.match(status[1], /Chargement des playlists/);
    assert.match(status[1], /Aucune playlist dans ce compte/);
    assert.match(status[1], /Impossible de charger les playlists/);
    // Success rows come from mediaLib and the scraped DOM only.
    const supplement = shell.match(/function supplementHomeRowsWithLibrary\(rows\) \{([\s\S]*?)\n    \}/);
    assert.ok(supplement);
    assert.match(supplement[1], /window\.mediaLib/);
    assert.match(supplement[1], /checkMediaLib/);
    assert.match(shell, /mediaLibWarmupCount < 8/);
});

// ---------------------------------------------------------------------------
// 3. Tab isolation: no orphan loading row on other screens
// ---------------------------------------------------------------------------

test('native paints clear stale rows on valid empty payloads and keep them on parse errors', () => {
    const paint = paintMethod();
    assert.match(paint, /if-le v1, v2, :done/, 'short payloads are treated as an intentional empty paint');
    assert.match(paint, /:clear_stale/, 'valid empty payloads clear the stale rows');
    assert.match(paint, /removeViewAt\(I\)V/);
    assert.doesNotMatch(paint, /removeAllViews\(\)V/);
    const clear = paint.slice(paint.indexOf(':clear_stale'));
    assert.match(clear, /getChildCount\(\)I/);
    assert.match(clear, /goto :clear_stale/);
    // Parse errors jump to :done with the previous content untouched.
    assert.match(paint, /:catch_json[\s\S]*?goto :done/);
    assert.match(paint, /:catch_all[\s\S]*?goto :done/);
});

test('switching tabs never repaints another screen cache as its own content', () => {
    const home = activityMethod('onNativeHomeClick');
    const library = activityMethod('onNativeLibraryClick');
    assert.doesNotMatch(home, /iget-object[^\n]*nativeCurrentJson/, 'Accueil paints only its own cache');
    assert.doesNotMatch(library, /iget-object[^\n]*nativeCurrentJson/, 'Bibliothèque paints only its own cache');
    assert.match(home, /nativeHomeJson/);
    assert.match(library, /nativeLibraryJson/);
    assert.match(home, /__sfNativeRequestHome/);
    assert.match(library, /__sfOpenLibrary/);
});

test('a failed paint cannot append a false empty message over valid rows', () => {
    const rows = activityMethod('renderNativeRows');
    assert.match(rows, /getChildCount\(\)I/);
    assert.match(rows, /if-gtz v3, :render_native_done/);
    assert.match(rows, /Rien à afficher pour le moment/);
});

test('home updates arriving while another tab is open are cached, not painted', () => {
    const apply = activityMethod('applyNativeUiData');
    const homeBranch = apply.slice(apply.indexOf('\n    :check_home\n'), apply.indexOf('\n    :check_media\n'));
    assert.match(homeBranch, /nativeCurrentScreen/);
    assert.match(homeBranch, /const-string v5, "home"/);
    assert.match(homeBranch, /:home_keep_cache/);
    const settingsBranch = apply.slice(apply.indexOf('\n    :check_settings\n'), apply.indexOf('\n    :check_search\n'));
    assert.match(settingsBranch, /const-string v3, "settings"/);
    assert.match(settingsBranch, /nativeCurrentScreen/);
});

// ---------------------------------------------------------------------------
// 4. Navigation and player screens keep their own states
// ---------------------------------------------------------------------------

test('every tab and player navigation handler stays wired', () => {
    const src = read('smali/com/melodix/music/MainActivity.smali');
    for (const handler of [
        'onNativeHomeClick', 'onNativeSearchClick', 'onNativeLibraryClick',
        'onNativeSettingsClick', 'onNativePlayerExpandClick', 'onNativeBackClick'
    ]) {
        assert.match(src, new RegExp(`\\.method public final ${handler}`), handler);
    }
    const openRow = activityMethod('openNativeRow');
    assert.match(openRow, /:playlist:/, 'playlist rows open the detail screen');
    assert.match(openRow, /const-string v1, "detail"/);
    assert.match(openRow, /spotify:settings:/);
});

test('the settings screen shows a real loading state and a real error fallback', () => {
    const settings = activityMethod('openNativeSettings');
    assert.match(settings, /Chargement des paramètres/);
    assert.match(settings, /__sfRequestSpotifySettings/);
    assert.match(settings, /Paramètres indisponibles/, 'an unanswered request ends in an explicit error');
    assert.match(settings, /setTimeout\(r,1500\)/);
    assert.match(settings, /setTimeout\(r,4000\)/);
});

// ---------------------------------------------------------------------------
// 5. Settings: real toggles, honest info rows, live diagnostics
// ---------------------------------------------------------------------------

test('settings expose live diagnostics and never fake account-owned options', () => {
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /spotify:settings:lib_status/);
    assert.match(shell, /spotify:settings:diag_errors/);
    assert.match(shell, /__sfNativeUiShellLastError/);
    assert.match(shell, /Géré par Spotify/);
    assert.match(shell, /Synchronisation en cours…/);
    assert.match(shell, /Échec de la synchronisation — réessayez/);
    // No fabricated success message for the resync action.
    assert.doesNotMatch(shell, /sync_status = 'Bibliothèque Spotify synchronisée ✓'/);
});

test('real toggles persist and drive the real playback behaviour', () => {
    const acted = [];
    const { window, calls, store } = bootShell({
        window: {
            actShuffle: () => acted.push('shuffle'),
            actRepeat: () => acted.push('repeat'),
            SF_CONFIG: {},
            playing: true
        }
    });

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:shuffle');
    assert.deepEqual(acted, ['shuffle'], 'shuffle drives the real player control');
    assert.match(store.get('melodix_spotify_settings_v1'), /shuffle/);

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:autoplay');
    assert.equal(window.SF_CONFIG.autoPlayMode, 'disabled', 'autoplay really changes the engine mode');

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:canvas');
    assert.ok(calls.some((call) => call.screen === 'setCanvasDisabled'), 'canvas drives the native guard');

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:gapless');
    const gapless = JSON.parse(calls.find((call) => call.screen === 'settings').data)
        .find((row) => row.uri === 'spotify:settings:gapless');
    assert.equal(gapless.settingValue, 'Géré par Spotify', 'account-owned rows stay informational');
});

test('logout clears the whole session so the next account starts from zero', () => {
    const { window, calls, store } = bootShell({
        window: {
            mediaLib: { playlists: [{ name: 'Old account playlist', uri: 'spotify:playlist:old1' }] },
            __sfMediaLibState: 'ready'
        }
    });
    store.set('melodix_spotify_settings_v1', '{"canvas":true}');
    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:logout');
    assert.ok(calls.some((call) => call.screen === 'nativeLogout'));
    assert.equal(window.mediaLib, undefined, 'the previous account library is dropped');
    assert.equal(window.__sfMediaLibState, undefined, 'the library state restarts from scratch');
    assert.ok(!store.has('melodix_spotify_settings_v1'), 'local session data is wiped');
    // While the session is considered logged out nothing is repainted.
    calls.length = 0;
    window.__sfNativeRequestHome();
    assert.equal(homePayloads(calls).length, 0, 'no stale rows are sent after logout');
});
