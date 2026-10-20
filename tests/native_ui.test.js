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
    const readiness = read('assets/spotify_bridge.js').match(/function notifyNativeUiReady\(mainView\) \{[\s\S]*?\n    \}/);
    assert.ok(readiness, 'native shell readiness guard should exist');
    assert.match(readiness[0], /user-widget-link/);
    assert.match(readiness[0], /open\.spotify\.com/);
    assert.match(activity, /\.method public final showNativeUi\(\)V/);
    assert.match(activity, /\.method public final applyNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final runNativeJavascript\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final openNativeRow\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final onNativePlayerExpandClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final onNativePlayerNextClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final updateNativePlayer\(Ljava\/lang\/String;\)V[\s\S]*?"duration"[\s\S]*?"position"[\s\S]*?setProgress\(I\)V/);
});

test('Spotify links are normalized to safe native row URIs', () => {
    const bridge = read('assets/spotify_bridge.js');
    const helper = bridge.match(/function nativeSpotifyUri\(value\) \{[\s\S]*?\n    \}/);
    assert.ok(helper, 'native Spotify URI helper should exist');

    const context = {
        URL,
        window: { location: { href: 'https://open.spotify.com/', hostname: 'open.spotify.com' } }
    };
    vm.runInNewContext(`${helper[0]}; globalThis.nativeSpotifyUri = nativeSpotifyUri;`, context);

    assert.equal(context.nativeSpotifyUri('https://open.spotify.com/album/abc123?si=xyz'), 'spotify:album:abc123');
    assert.equal(context.nativeSpotifyUri('spotify:user:person:playlist:abc123'), 'spotify:playlist:abc123');
    assert.equal(context.nativeSpotifyUri('https://example.org/playlist/abc123'), 'https://example.org/playlist/abc123');
});
