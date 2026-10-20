const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const nativeIds = [
    'nativeRoot',
    'nativeScreenTitle',
    'nativeBackButton',
    'nativeSearchPanel',
    'nativeSearchInput',
    'nativeLibraryCategories',
    'nativeContent',
    'nativePlayerTitle',
    'nativePlayerArtist',
    'nativePlayPauseButton',
    'nativeRowsScroll',
    'nativePlayerPanel',
    'nativePlayerLargeTitle',
    'nativePlayerLargeArtist',
    'nativePlayerProgress',
    'nativePlayerLargePlayPauseButton',
    'nativePlayerPreviousButton',
    'nativePlayerNextButton',
    'nativePlayerShuffleButton',
    'nativePlayerRepeatButton',
    'nativeMiniPlayer'
];

test('native shell overlays, but does not replace or detach, the existing WebView', () => {
    const layout = read('res/layout/activity_main.xml');
    const webViewPosition = layout.indexOf('android:id="@id/webViewContainer"');
    const nativeRootPosition = layout.indexOf('android:id="@id/nativeRoot"');

    assert.ok(webViewPosition >= 0, 'the existing WebView container must remain in the layout');
    assert.ok(nativeRootPosition > webViewPosition, 'native shell should draw over the WebView');
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:visibility="gone"/);
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:clickable="true"/);
    assert.match(layout, /android:id="@id\/nativeContent"/);
    assert.match(layout, /android:onClick="onNativePlayPauseClick"/);
    assert.match(layout, /android:onClick="onNativeSearchSubmit"/);
    assert.match(layout, /android:id="@id\/nativePlayerPanel"/);
    assert.match(layout, /android:onClick="onNativePlayerPreviousClick"/);
    assert.match(layout, /android:onClick="onNativePlayerNextClick"/);
});

test('all native layout IDs are assigned stable public resource IDs', () => {
    const layout = read('res/layout/activity_main.xml');
    const publicXml = read('res/values/public.xml');

    for (const id of nativeIds) {
        assert.match(layout, new RegExp(`@id/${id}\\b`), `${id} should be referenced by the layout`);
        assert.match(publicXml, new RegExp(`type="id" name="${id}" id="0x7f09[0-9a-f]+"`), `${id} should be public`);
    }
});

test('native bridge exposes UI callbacks and routes media, search and player data to the activity', () => {
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const activity = read('smali/com/melodix/music/MainActivity.smali');

    assert.match(bridge, /\.method public final onNativeUiReady\(\)V[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /\.method public final onNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /const-string v1, "media:"[\s\S]*?dispatchNativeUi/);
    assert.match(bridge, /const-string v1, "search:"[\s\S]*?dispatchNativeUi/);
    assert.match(bridge, /const-string v0, "player"[\s\S]*?dispatchNativeUi/);
    const shell = read('assets/native_ui_shell.js');
    const readiness = shell.match(/function notifyNativeUiReady\(mainView\) \{[\s\S]*?\n    \}/);
    const client = read('smali/c91.smali');
    const hotfixList = read('smali/c40.smali').split('.method public static a')[0];
    assert.ok(readiness, 'native shell readiness guard should exist');
    assert.match(readiness[0], /user-widget-link/);
    assert.match(readiness[0], /open\.spotify\.com/);
    assert.match(client, /const-string v5, "native_ui_shell\.js"[\s\S]*?evaluateJavascript/);
    assert.doesNotMatch(hotfixList, /native_ui_shell\.js/);
    assert.doesNotMatch(read('assets/spotify_bridge.js'), /notifyNativeUiReady\(/);
    assert.match(activity, /\.method public final showNativeUi\(\)V/);
    assert.match(activity, /\.method public final applyNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final runNativeJavascript\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final openNativeRow\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final onNativePlayerExpandClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final onNativePlayerNextClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final updateNativePlayer\(Ljava\/lang\/String;\)V[\s\S]*?"duration"[\s\S]*?"position"[\s\S]*?setProgress\(I\)V/);
});

test('Spotify links are normalized to safe native row URIs', () => {
    const shell = read('assets/native_ui_shell.js');
    const helper = shell.match(/function nativeSpotifyUri\(value\) \{[\s\S]*?\n    \}/);
    assert.ok(helper, 'native Spotify URI helper should exist');

    const context = {
        URL,
        window: { location: { href: 'https://open.spotify.com/', hostname: 'open.spotify.com' } }
    };
    vm.runInNewContext(`const SUPPORTED_TYPES = ['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook']; ${helper[0]}; globalThis.nativeSpotifyUri = nativeSpotifyUri;`, context);

    assert.equal(context.nativeSpotifyUri('https://open.spotify.com/album/abc123?si=xyz'), 'spotify:album:abc123');
    assert.equal(context.nativeSpotifyUri('spotify:user:person:playlist:abc123'), 'spotify:playlist:abc123');
    assert.equal(context.nativeSpotifyUri('https://example.org/playlist/abc123'), 'https://example.org/playlist/abc123');
});

test('bundled native bootstrap activates the shell, sends Home rows, and only opens Spotify links', () => {
    const script = read('assets/native_ui_shell.js');
    const calls = [];
    const assigned = [];
    const timers = [];
    let readyCount = 0;

    const anchor = {
        href: 'https://open.spotify.com/playlist/abc123?si=xyz',
        innerText: 'Focus Mix',
        textContent: 'Focus Mix',
        getAttribute: () => null,
        querySelector: () => null
    };
    const card = {
        innerText: 'Focus Mix\nPicked for you',
        textContent: 'Focus Mix\nPicked for you',
        matches: () => false,
        querySelector: (selector) => selector === 'a[href]' ? anchor : null,
        getAttribute: () => null,
        closest: () => null
    };
    const mainView = {
        querySelectorAll: (selector) => selector === '[data-testid="card"]' ? [card] : []
    };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => selector === '#main-view'
            ? mainView
            : selector.indexOf('user-widget-link') >= 0 ? {} : null,
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
    }
    const window = {
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: (value) => assigned.push(value)
        },
        AndBridge: {
            onNativeUiReady: () => { readyCount += 1; },
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        },
        clearTimeout: () => {}
    };

    vm.runInNewContext(script, { window, document, URL, MutationObserver: TestMutationObserver });

    assert.equal(window.__sfNativeUiShellStarted, true);
    assert.equal(window.__sfNativeUiShellReady, true);
    assert.equal(window.__sfNativeUiShellCompleted, true);
    assert.equal(readyCount, 1);
    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'home');
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Focus Mix',
        subtitle: 'Picked for you',
        uri: 'spotify:playlist:abc123'
    }]);

    assert.equal(window.__sfNativeOpenUri('spotify:track:track123'), true);
    assert.equal(assigned.pop(), 'https://open.spotify.com/track/track123');
    assert.equal(window.__sfNativeOpenUri('https://example.org/track/track123'), false);
    assert.equal(window.__sfNativeRequestHome(), true);
    assert.equal(calls.length, 2, 'requesting Home should resend current rows');
    assert.equal(timers.length, 0, 'a signed-in page with a ready bridge should not keep retry timers');
});
