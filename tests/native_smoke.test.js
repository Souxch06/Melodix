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
    window.__sfToggleSpotifySetting('spotify:settings:private_session');
    const priv = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:private_session');
    assert.equal(priv.settingValue, 'ON');
    assert.match(store.get('melodix_spotify_settings_v1'), /"private_session":true/);
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

test('smoke: demo-home extra paints labelled playlists without login', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(activity, /paintDemoHomeIfRequested\(\)V/);
    assert.match(activity, /melodix_demo_home/);
    assert.match(activity, /DEMO Liked Songs/);
    assert.match(activity, /DEMO Mix Spotify/);
    assert.match(read('scripts/preview-launch-trace.sh'), /melodix_demo_home true/);
    assert.match(read('.github/workflows/preview-launch-trace.yml'), /\[launch-trace\]/);
});
