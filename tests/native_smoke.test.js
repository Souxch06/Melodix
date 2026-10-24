const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const dataFor = (calls, screen) => {
    const hit = calls.filter((call) => call.screen === screen || String(call.screen).indexOf(screen) === 0);
    return hit[hit.length - 1];
};

function bootShell(extra) {
    const calls = [];
    const store = new Map();
    class TestMutationObserver {
        observe() {}
    }
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: () => null,
        querySelectorAll: () => [],
        addEventListener: () => {},
        body: { classList: { toggle: () => {}, contains: () => false } }
    };
    const window = Object.assign({
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/'
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {},
        localStorage: {
            getItem: (key) => (store.has(key) ? store.get(key) : null),
            setItem: (key, value) => store.set(key, value),
            clear: () => store.clear()
        },
        mediaLib: {
            playlists: [
                { name: 'Liked Songs', type: 'Playlist', uri: 'spotify:collection:tracks' },
                { name: 'Ma Playlist', type: 'Playlist', uri: 'spotify:playlist:mine1', image: 'https://i.scdn.co/image/a' }
            ]
        }
    }, extra);
    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL, MutationObserver: TestMutationObserver });
    return { window, document, calls, store };
}

test('smoke: settings request lists every Spotify row and toggles persist', () => {
    const { window, calls, store } = bootShell();
    calls.length = 0;
    window.__sfRequestSpotifySettings();
    const rows = JSON.parse(dataFor(calls, 'settings').data);
    const uris = rows.map((row) => row.uri);
    for (const key of [
        'account_info', 'private_session', 'logout', 'audio_quality', 'normalize_volume',
        'data_saver', 'gapless', 'autoplay', 'shuffle', 'repeat', 'explicit', 'crossfade',
        'automix', 'mono', 'hardware_volume', 'podcast_boost', 'canvas', 'bg_audio',
        'lyrics', 'show_unplayable', 'notifications', 'clear_cache', 'resync', 'about'
    ]) {
        assert.ok(uris.includes(`spotify:settings:${key}`), key);
        assert.ok(rows.find((row) => row.uri === `spotify:settings:${key}`).settingValue);
    }
    calls.length = 0;
    // Rows owned by the Spotify account (private session, quality, gapless…)
    // are honest information rows: tapping them must never fake a toggle.
    window.__sfToggleSpotifySetting('spotify:settings:private_session');
    const priv = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:private_session');
    assert.equal(priv.settingValue, 'Géré par Spotify');
    assert.ok(!store.has('melodix_spotify_settings_v1') || !/private_session"?\s*:\s*true/.test(store.get('melodix_spotify_settings_v1') || ''));

    // Real toggles keep persisting and reporting their true state.
    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:canvas');
    const canvas = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:canvas');
    assert.equal(canvas.settingValue, 'OFF');
    assert.match(store.get('melodix_spotify_settings_v1'), /canvas"?\s*:\s*false/);
});

test('smoke: home keeps owned playlists in Vos playlists', () => {
    const { window, calls } = bootShell();
    window.__sfNativeRequestHome();
    const home = dataFor(calls, 'home');
    assert.ok(home, 'home payload');
    const rows = JSON.parse(home.data);
    const mine = rows.filter((row) => row.uri === 'spotify:playlist:mine1');
    assert.equal(mine.length, 1);
    assert.equal(mine[0].section, 'Vos playlists');
    assert.equal(rows[0].title, 'Liked Songs');
});

test('smoke: native helpers for tabs and playback exist', () => {
    const { window } = bootShell();
    assert.equal(typeof window.__sfNativeRequestHome, 'function');
    assert.equal(typeof window.__sfRequestSpotifySettings, 'function');
    assert.equal(typeof window.__sfToggleSpotifySetting, 'function');
    assert.equal(typeof window.__sfNativeOpenUri, 'function');
    assert.equal(typeof window.__sfSubmitSearch, 'function');
    assert.equal(typeof window.__sfNativeUiRefresh, 'function');
});

test('smoke: layout still has every tab, search, player and settings control', () => {
    const layout = read('res/layout/activity_main.xml');
    for (const id of [
        'nativeRoot', 'nativeHomeTab', 'nativeSearchTab', 'nativeLibraryTab',
        'nativeSearchInput', 'nativeMiniPlayer', 'nativePlayPauseButton',
        'nativeHeaderAvatar', 'nativePlayerPanel', 'nativeContent'
    ]) {
        assert.match(layout, new RegExp(`@id/${id}\\b`));
    }
    assert.match(layout, /onNativeHomeClick/);
    assert.match(layout, /onNativeSearchClick/);
    assert.match(layout, /onNativeLibraryClick/);
    assert.match(layout, /onNativeSettingsClick/);
    assert.match(layout, /onNativePlayPauseClick/);
    assert.match(layout, /onNativeSearchSubmit/);
});

test('smoke: Accueil uses grid, search stays a list, settings open from other screens', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const feed = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const rowsAt = activity.indexOf('.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
    const rows = activity.slice(rowsAt, activity.indexOf('.method public final findNativeByTag', rowsAt));
    assert.match(rows, /NativeHomeFeed;->useGrid:Z/);
    assert.match(rows, /const-string v0, "Accueil"/);
    assert.match(rows, /const-string v0, "Votre bibliothèque"/);
    assert.match(feed, /:add_list/);
    assert.match(feed, /:make_pair/);
    const settingsAt = activity.indexOf('.method public final openNativeSettings()V');
    const settings = activity.slice(settingsAt, activity.indexOf('.method public final setNativeProfileImage', settingsAt));
    assert.match(settings, /if-eqz v1, :native_settings_save_return/);
    assert.doesNotMatch(settings, /NativeHomeShelfRenderer;->render/);
});

test('smoke: shell respects system windows and rejects oversized JS payloads', () => {
    const layout = read('res/layout/activity_main.xml');
    assert.match(layout, /android:fitsSystemWindows="true"/);
    assert.match(layout, /contentDescription="Accueil"/);
    assert.match(read('res/drawable/native_shell_background.xml'), /android:color="#ff121212"/);
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const dispatchAt = bridge.indexOf('.method private final dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V');
    const dispatch = bridge.slice(dispatchAt, bridge.indexOf('.end method', dispatchAt));
    // if-eqz null → skip the cap (existing null path). if-gt length, 256KiB → drop.
    assert.match(dispatch, /if-eqz p2, :payload_ok/);
    assert.match(dispatch, /const\/high16 v2, 0x40000/);
    assert.match(dispatch, /if-gt v0, v2, :dispatch_drop/);
    assert.doesNotMatch(dispatch, /if-le v0, v2, :dispatch_drop/);
    // every drop path is counted for the diagnostic screen before it ends
    assert.match(dispatch, /DiagCounters;->dispatchDropped\(\)V/);
    assert.match(dispatch, /DiagCounters;->dispatchIn\(\)V/);
    const homeAt = bridge.indexOf('.method public final onNativeHomeRows(Ljava/lang/String;)V');
    const home = bridge.slice(homeAt, bridge.indexOf('.end method', homeAt));
    assert.match(home, /if-eqz p1, :home_rows_size_ok/);
    assert.match(home, /if-gt v0, v1, :native_home_rows_done/);
    assert.doesNotMatch(home, /if-le v0, v1, :native_home_rows_done/);
    const navSrc = read('smali/c91.smali');
    const navAt = navSrc.indexOf('.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z');
    const nav = navSrc.slice(navAt, navSrc.indexOf('.end method', navAt));
    assert.match(nav, /getScheme\(\)Ljava\/lang\/String;/);
    assert.match(nav, /equalsIgnoreCase\(Ljava\/lang\/String;\)Z/);
    assert.doesNotMatch(nav, /toLowerCase\(\)/);
    assert.match(nav, /const-string v3, "javascript"/);
    assert.match(nav, /if-nez v3, :block_nav_scheme/);
    assert.match(nav, /invoke-static \{v1\}, Ldl1;->l/);
    const playerAt = read('smali/com/melodix/music/MainActivity.smali').indexOf('.method public final updateNativePlayer(Ljava/lang/String;)V');
    const player = read('smali/com/melodix/music/MainActivity.smali').slice(playerAt, playerAt + 900);
    assert.match(player, /isEmpty\(\)Z[\s\S]*if-nez v1, :native_player_no_track/);
    assert.doesNotMatch(player, /if-eqz v1, :native_player_no_track/);
    assert.match(read('smali/com/melodix/music/WebService.smali'), /startForeground failed/);
    const resume = read('smali/com/melodix/music/MainActivity.smali');
    const startAt = resume.indexOf('Li1;->u(Lcom/melodix/music/MainActivity;Landroid/content/Intent;)V');
    const cAt = resume.lastIndexOf('MainActivity;->C()V', startAt);
    assert.ok(cAt > 0 && cAt < startAt, 'C() must finish before startForegroundService');
    assert.equal(resume.split('Li1;->u(Lcom/melodix/music/MainActivity;Landroid/content/Intent;)V').length - 1, 1);
    assert.doesNotMatch(read('assets/native_ui_shell.js'), /waitForHomeFeed/);
});
