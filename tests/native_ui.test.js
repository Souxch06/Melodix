const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const dataFor = (calls, screen) => {
    const hit = calls.filter((call) => call.screen === screen);
    return hit[hit.length - 1];
};

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
    'nativeMiniPlayer',
    'nativePlayerArtwork',
    'nativePlayerLargeArtwork',
    'nativeHomeTab',
    'nativeSearchTab',
    'nativeLibraryTab',
    'nativeHeaderAvatar',
    'nativePlayerPositionText',
    'nativePlayerDurationText'
];

test('native shell overlays, but does not replace or detach, the existing WebView', () => {
    const layout = read('res/layout/activity_main.xml');
    const webViewPosition = layout.indexOf('android:id="@id/webViewContainer"');
    const nativeRootPosition = layout.indexOf('android:id="@id/nativeRoot"');

    assert.ok(webViewPosition >= 0, 'the existing WebView container must remain in the layout');
    assert.ok(nativeRootPosition > webViewPosition, 'native shell should draw over the WebView');
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:visibility="visible"/);
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:fitsSystemWindows="true"/);
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:clickable="true"/);
    assert.match(layout, /android:id="@id\/nativeContent"/);
    assert.doesNotMatch(layout, /Titres likés/, 'XML placeholders were mistaken for playlists');
    assert.match(layout, /android:id="@id\/nativePlayerArtwork"/);
    assert.match(layout, /android:id="@id\/nativePlayerLargeArtwork"/);
    assert.match(layout, /android:id="@id\/nativeHomeTab"/);
    assert.match(layout, /@drawable\/native_shell_background/);
    assert.match(layout, /@drawable\/native_mini_player_bg/);
    assert.match(layout, /android:textSize=\"24.0sp\"/);
    assert.match(layout, /android:layout_height=\"72.0dip\"/);
    assert.match(read('res/drawable/native_mini_player_bg.xml'), /18.0dip/);
    assert.match(layout, /@drawable\/native_nav_home/);
    assert.match(layout, /@drawable\/native_nav_search/);
    assert.match(layout, /@drawable\/native_nav_library/);
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
    assert.match(bridge, /\.method public final onNativeUiRoute\(Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /\.method public final onNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /\.method public final onNativeListText\(Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(activity, /NativeHomeFeed;->paint/);
    assert.match(read('smali/com/melodix/music/NativeHomeFeed.smali'), /NativeUiRowFactory;->create/);
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
    assert.match(read('smali/com/melodix/music/MainActivity.smali'), /accountsHostHides/);
    assert.doesNotMatch(read('smali/com/melodix/music/MainActivity.smali'), /const\/high16 v1, 0x3f600000/);
    assert.match(activity, /\.method public final showNativeUi\(\)V/);
    assert.match(activity, /styleNativeTab[\s\S]*?setBackgroundTintList/);
    assert.match(activity, /\.method public final postNativeUiRoute\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final applyNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final runNativeJavascript\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final openNativeRow\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final onNativePlayerExpandClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final onNativePlayerNextClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final updateNativePlayer\(Ljava\/lang\/String;\)V[\s\S]*?"cover"[\s\S]*?NativeImageLoader;->load[\s\S]*?"duration"[\s\S]*?"position"[\s\S]*?setProgress\(I\)V/);
    assert.match(activity, /applyNativeUiData[\s\S]*?"screen-title"[\s\S]*?"detail"[\s\S]*?renderNativeRows/);
    const runnable = read('smali/com/melodix/music/NativeUiUpdateRunnable.smali');
    assert.match(runnable, /showNativeUi\(\)V/);
    assert.match(runnable, /const\/4 v2, 0x1[\s\S]*?applyNativeUiData/);
    assert.match(runnable, /setNativeScreen\(Ljava\/lang\/String;\)V/);
    assert.doesNotMatch(runnable, /onNativeLibraryClick/, 'a route update must not re-trigger the library tab');
    assert.match(activity, /renderNativeRows[\s\S]*?Landroid\/widget\/TextView;->setText/);
    assert.match(read('smali/com/melodix/music/NativeImageLoader.smali'), /Picasso;->load[\s\S]*?RequestCreator;->into/);
    assert.match(read('smali/com/melodix/music/NativeUiRowFactory.smali'), /GradientDrawable;->setCornerRadius[\s\S]*?setContentDescription/);
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

test('native Home collector keeps image-less Spotify links and filters non-Spotify artwork', () => {
    const calls = [];
    const externalArtwork = {
        currentSrc: 'https://example.org/cover.jpg',
        getAttribute: (name) => name === 'src' ? 'https://example.org/cover.jpg' : null
    };
    const anchor = {
        href: 'https://open.spotify.com/track/track99',
        innerText: 'Fallback track\nArtist name',
        textContent: 'Fallback track\nArtist name',
        matches: () => true,
        getAttribute: () => null,
        querySelector: (selector) => selector === 'img' ? externalArtwork : null,
        closest: () => null
    };
    const mainView = {
        querySelectorAll: (selector) => selector === 'a[href]' ? [anchor] : []
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
            assign: () => {}
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });

    assert.ok(dataFor(calls, 'list-text'));
    assert.equal(dataFor(calls, 'home').screen, 'home');
    assert.deepEqual(JSON.parse(dataFor(calls, 'home').data), [{
        title: 'Fallback track',
        subtitle: 'Artist name',
        section: '',
        uri: 'spotify:track:track99'
    }]);
});

test('Home uses saved library items as a fallback when Spotify has no visible Home cards', () => {
    const calls = [];
    const mainView = { querySelectorAll: () => [] };
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
            assign: () => {}
        },
        mediaLib: {
            playlists: [{
                id: 'spotify:playlist:saved123',
                name: 'Saved mix',
                image: 'https://i.scdn.co/image/saved',
                type: 'Playlist'
            }]
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });

    assert.ok(dataFor(calls, 'list-text'));
    assert.deepEqual(JSON.parse(dataFor(calls, 'home').data), [{
        title: 'Saved mix',
        subtitle: 'Playlist',
        section: 'Vos playlists',
        uri: 'spotify:playlist:saved123',
        image: 'https://i.scdn.co/image/saved'
    }]);
});

test('localized Spotify Home routes still collect and send Home rows', () => {
    const routes = [];
    const calls = [];
    const mainView = { querySelectorAll: () => [] };
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
            pathname: '/intl-fr/',
            href: 'https://open.spotify.com/intl-fr/',
            assign: () => {}
        },
        mediaLib: {
            playlists: [{
                id: 'spotify:playlist:fr123',
                name: 'Sélection du jour',
                image: 'https://i.scdn.co/image/fr-cover',
                type: 'Playlist'
            }]
        },
        AndBridge: {
            onNativeUiRoute: (screen) => routes.push(screen),
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });

    assert.deepEqual(routes, ['home']);
    assert.ok(dataFor(calls, 'list-text'));
    assert.equal(dataFor(calls, 'home').screen, 'home');
    assert.deepEqual(JSON.parse(dataFor(calls, 'home').data), [{
        title: 'Sélection du jour',
        subtitle: 'Playlist',
        section: 'Vos playlists',
        uri: 'spotify:playlist:fr123',
        image: 'https://i.scdn.co/image/fr-cover'
    }]);
});

test('native shell routes a Spotify detail deep link and transfers its title and rows', () => {
    const routes = [];
    const calls = [];
    let readyCount = 0;
    const anchor = {
        href: 'https://open.spotify.com/track/track123',
        innerText: 'A track\nAn artist',
        textContent: 'A track\nAn artist',
        matches: () => true,
        getAttribute: () => null,
        querySelector: () => null,
        closest: (selector) => selector === '[data-testid="card"]' ? card : null
    };
    const card = {
        innerText: 'A track\nAn artist',
        textContent: 'A track\nAn artist',
        matches: () => false,
        getAttribute: () => null,
        querySelector: (selector) => selector === 'a[href]' ? anchor : null,
        querySelectorAll: () => [],
        closest: () => null
    };
    const heading = { innerText: 'A playlist', textContent: 'A playlist' };
    const mainView = {
        querySelector: () => heading,
        querySelectorAll: (selector) => selector === '[data-testid="card"]'
            ? [card]
            : selector === 'a[href]' ? [anchor] : []
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
            pathname: '/playlist/playlist123',
            href: 'https://open.spotify.com/playlist/playlist123',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiRoute: (screen) => routes.push(screen),
            onNativeUiReady: () => { readyCount += 1; },
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });

    assert.deepEqual(routes, ['detail']);
    assert.equal(readyCount, 1);
    assert.equal(dataFor(calls, 'screen-title').data, 'A playlist');
    assert.deepEqual(JSON.parse(dataFor(calls, 'detail').data), [{
        title: 'A track',
        subtitle: 'An artist',
        section: '',
        uri: 'spotify:track:track123'
    }]);
});

test('playlist pages scrape tracklist rows, not home cards', () => {
    const calls = [];
    const trackAnchor = {
        href: 'https://open.spotify.com/track/trk1',
        textContent: 'Song One',
        innerText: 'Song One',
        matches: (sel) => sel === 'a[href]',
        getAttribute: () => 'https://open.spotify.com/track/trk1',
        querySelector: () => null,
        closest: (sel) => sel === '[data-testid="tracklist-row"]' ? trackRow : null
    };
    const artistAnchor = {
        href: 'https://open.spotify.com/artist/art1',
        textContent: 'An Artist',
        innerText: 'An Artist',
        matches: () => false,
        getAttribute: () => null,
        querySelector: () => null,
        closest: () => null
    };
    const trackRow = {
        innerText: 'Song One\nAn Artist',
        textContent: 'Song One\nAn Artist',
        matches: (sel) => sel === '[data-testid="tracklist-row"]',
        getAttribute: () => null,
        querySelector: (selector) => {
            if (selector.indexOf('/track/') >= 0) return trackAnchor;
            if (selector.indexOf('/artist/') >= 0) return artistAnchor;
            if (selector === 'a[href]') return trackAnchor;
            return null;
        },
        querySelectorAll: () => [],
        closest: () => null
    };
    const heading = { innerText: 'Ma Playlist', textContent: 'Ma Playlist' };
    const mainView = {
        querySelector: () => heading,
        querySelectorAll: (selector) => {
            if (selector === '[data-testid="tracklist-row"]') return [trackRow];
            if (selector === '[data-testid="card"]') return [];
            if (selector === 'a[href]') return [trackAnchor, artistAnchor];
            return [];
        }
    };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => selector === '#main-view'
            ? mainView
            : selector.indexOf('user-widget-link') >= 0 ? {} : null,
        addEventListener: () => {}
    };
    class TestMutationObserver { observe() {} }
    const window = {
        location: {
            hostname: 'open.spotify.com',
            pathname: '/playlist/pl123',
            href: 'https://open.spotify.com/playlist/pl123',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiRoute: () => {},
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };
    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });
    const detail = JSON.parse(dataFor(calls, 'detail').data);
    assert.equal(detail.length, 1);
    assert.equal(detail[0].title, 'Song One');
    assert.equal(detail[0].subtitle, 'An Artist');
    assert.equal(detail[0].uri, 'spotify:track:trk1');
});

test('native search deep links preserve their query in the native search field', () => {
    const routes = [];
    const calls = [];
    const mainView = { querySelectorAll: () => [], querySelector: () => null };
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
            pathname: '/intl-fr/search',
            href: 'https://open.spotify.com/intl-fr/search?query=Jazz+Funk',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiRoute: (screen) => routes.push(screen),
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });

    assert.deepEqual(routes, ['search']);
    assert.deepEqual(calls, [{ screen: 'initial-search', data: 'Jazz Funk' }]);
});

test('bundled native bootstrap activates the shell, sends Home rows, and only opens Spotify links', () => {
    const script = read('assets/native_ui_shell.js');
    const calls = [];
    const assigned = [];
    const timers = [];
    let readyCount = 0;

    const artwork = {
        currentSrc: 'https://i.scdn.co/image/focus',
        getAttribute: (name) => name === 'src' ? 'https://i.scdn.co/image/focus' : null
    };
    const anchor = {
        href: 'https://open.spotify.com/playlist/abc123?si=xyz',
        innerText: 'Focus Mix',
        textContent: 'Focus Mix',
        getAttribute: () => null,
        matches: () => true,
        closest: (selector) => selector === '[data-testid="card"]' ? card : null,
        querySelector: (selector) => selector === 'img' ? artwork : null
    };
    const card = {
        innerText: 'Focus Mix\nPicked for you',
        textContent: 'Focus Mix\nPicked for you',
        matches: () => false,
        querySelector: (selector) => selector === 'a[href]' ? anchor : selector === 'img' ? artwork : null,
        querySelectorAll: () => [],
        getAttribute: () => null,
        closest: () => null
    };
    const mainView = {
        querySelectorAll: (selector) => selector === '[data-testid="card"]'
            ? [card]
            : selector === 'a[href]' ? [anchor] : []
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
        _sfNativeHomeSignature: JSON.stringify([{
            title: 'Focus Mix',
            subtitle: 'Picked for you',
            section: '',
            image: 'https://i.scdn.co/image/focus',
            uri: 'spotify:playlist:abc123'
        }]),
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
    assert.ok(dataFor(calls, 'list-text'));
    assert.equal(dataFor(calls, 'home').screen, 'home');
    assert.deepEqual(JSON.parse(dataFor(calls, 'home').data), [{
        title: 'Focus Mix',
        subtitle: 'Picked for you',
        section: 'Playlists Spotify',
        uri: 'spotify:playlist:abc123',
        image: 'https://i.scdn.co/image/focus'
    }]);
    assert.equal(window.__sfNativeUiHomeRowsCount, 1);
    assert.equal(window.__sfNativeUiHomeDataSent, true);
    assert.notEqual(
        dataFor(calls, 'home').data,
        window._sfNativeHomeSignature,
        'the shell must not overwrite or depend on the shared legacy signature'
    );

    assert.equal(window.__sfNativeOpenUri('spotify:track:track123'), true);
    assert.equal(assigned.pop(), 'https://open.spotify.com/track/track123');
    assert.equal(window.__sfNativeOpenUri('https://example.org/track/track123'), false);
    assert.equal(window.__sfNativeRequestHome(), true);
    assert.ok(calls.filter((call) => call.screen === 'home').length >= 2, 'requesting Home should resend current rows');
    assert.equal(timers.length, 1, 'pending mediaLib still schedules one library warmup');
    assert.equal(timers[0].delay, 400);
});

test('Home cards with sibling artwork outside the title anchor still resolve their cover image', () => {
    const script = read('assets/native_ui_shell.js');
    const calls = [];
    const artwork = {
        currentSrc: '',
        getAttribute: (name) => name === 'srcset'
            ? 'https://i.scdn.co/image/ep123 300w, https://i.scdn.co/image/ep123_large 640w'
            : null
    };
    const cardWrapper = {
        tagName: 'DIV',
        innerText: 'UHQ FREESTYLE #1\nCreator Name',
        getAttribute: () => null,
        querySelector: (selector) => selector === 'img' ? artwork : null,
        closest: () => null
    };
    const textWrapper = {
        tagName: 'DIV',
        parentElement: cardWrapper,
        querySelector: () => null
    };
    const anchor = {
        href: 'https://open.spotify.com/episode/ep123',
        innerText: 'UHQ FREESTYLE #1',
        parentElement: textWrapper,
        matches: (selector) => selector === 'a[href]',
        getAttribute: (name) => name === 'href' ? '/episode/ep123' : null,
        querySelector: () => null,
        closest: () => null
    };
    const mainView = {
        querySelectorAll: (selector) => selector === 'a[href]' ? [anchor] : []
    };
    cardWrapper.parentElement = mainView;

    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => {
            if (selector === '#main-view') return mainView;
            if (selector.indexOf('user-widget-link') >= 0) return {};
            return null;
        },
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
    }
    const window = {
        location: {
            hostname: 'open.spotify.com',
            pathname: '/intl-fr/',
            href: 'https://open.spotify.com/intl-fr/'
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(script, { window, document, URL, MutationObserver: TestMutationObserver });

    assert.ok(dataFor(calls, 'list-text'));
    assert.deepEqual(JSON.parse(dataFor(calls, 'home').data), [{
        title: 'UHQ FREESTYLE #1',
        subtitle: 'Creator Name',
        section: '',
        uri: 'spotify:episode:ep123',
        image: 'https://i.scdn.co/image/ep123'
    }]);
});

test('Home separates user playlists from Spotify official recommendations and prevents false playing state', () => {
    const script = read('assets/native_ui_shell.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const rowFactory = read('smali/com/melodix/music/NativeUiRowFactory.smali');
    const layout = read('res/layout/activity_main.xml');
    const calls = [];
    const statusUpdates = [];

    const spotifyCards = Array.from({ length: 9 }, (_, i) => {
        const anchor = {
            href: `https://open.spotify.com/playlist/sp${i}`,
            innerText: `Spotify Mix ${i}`,
            textContent: `Spotify Mix ${i}`,
            getAttribute: () => null,
            matches: () => true,
            closest: () => null,
            querySelector: () => null
        };
        return anchor;
    });
    spotifyCards.push({
        href: 'https://open.spotify.com/playlist/my1',
        innerText: 'Ma Playlist Perso',
        textContent: 'Ma Playlist Perso',
        getAttribute: () => null,
        matches: () => true,
        closest: () => null,
        querySelector: () => null
    });
    const mainView = {
        querySelectorAll: (selector) => selector === 'a[href]' ? spotifyCards : []
    };
    const playPauseButton = {
        getAttribute: (name) => name === 'aria-label' ? 'Lecture' : null
    };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => {
            if (selector === '#main-view') return mainView;
            if (selector.indexOf('user-widget-link') >= 0) return {};
            if (selector.indexOf('control-button-playpause') >= 0) return playPauseButton;
            return null;
        },
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
    }
    const window = {
        location: {
            hostname: 'open.spotify.com',
            pathname: '/intl-fr/',
            href: 'https://open.spotify.com/intl-fr/'
        },
        playing: true,
        mediaLib: {
            playlists: [
                { name: 'Liked Songs', type: 'Playlist', uri: 'spotify:collection:tracks' },
                { name: 'Ma Playlist Perso', type: 'Playlist', image: 'https://i.scdn.co/image/mypl', uri: 'spotify:playlist:my1' }
            ]
        },
        updMedia: function() {
            statusUpdates.push(window.playing);
        },
        manageAll: function(play) {
            window.playing = play;
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(script, { window, document, URL, MutationObserver: TestMutationObserver });

    assert.equal(window.playing, false);
    window.manageAll(true);
    assert.equal(window.playing, false);

    const rows = JSON.parse(dataFor(calls, 'home').data);
    assert.equal(rows[0].title, 'Liked Songs');
    assert.equal(rows[0].section, 'Vos playlists');
    assert.equal(rows[1].title, 'Ma Playlist Perso');
    assert.equal(rows[1].section, 'Vos playlists');
    assert.equal(rows.filter((row) => row.uri === 'spotify:playlist:my1').length, 1);
    assert.equal(rows.filter((row) => row.uri === 'spotify:playlist:my1')[0].section, 'Vos playlists');
    assert.equal(rows[2].title, 'Spotify Mix 0');
    assert.equal(rows[2].section, 'Playlists Spotify');

    assert.doesNotMatch(read('assets/native_ui_shell.js'), /waitForHomeFeed/);
    assert.match(read('smali/com/melodix/music/NativeHomeFeed.smali'), /\"section\"/);
    assert.match(rowFactory, /createPlaylistBanner\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;ILjava\/lang\/String;Ljava\/lang\/String;\)Landroid\/widget\/LinearLayout;/);
    assert.match(activity, /\.method public final onNativeSearchClick\(Landroid\/view\/View;\)V[\s\S]*?renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(rowFactory, /const\/16 v10, 0x58/);
    assert.match(rowFactory, /optJSONArray\(Ljava\/lang\/String;\)Lorg\/json\/JSONArray;/);
    assert.ok(layout.includes('@drawable/previous'));
    assert.ok(layout.includes('@drawable/next'));
});

test('playback stability and fast live search optimizations are active across Smali and JS', () => {
    const shell = read('assets/native_ui_shell.js');
    const bridge = read('assets/spotify_bridge.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const watcher = read('smali/com/melodix/music/NativeSearchWatcher.smali');

    assert.match(activity, /\.method public final showNativeUi\(\)V[\s\S]*?sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->l:Z[\s\S]*?MainActivity;->H:Landroidx\/constraintlayout\/widget\/ConstraintLayout;/);
    assert.match(shell, /window\.__sfSearchCache/);
    assert.match(shell, /collectDetailRows\(mainView\)/);
    assert.doesNotMatch(shell, /function clearHomeRetry\(\) \{[^}]*observer\.disconnect\(\)/);
    assert.match(bridge, /if \(window\.__sfMelodixBridgeCompleted\)/);
    assert.doesNotMatch(bridge, /AndBridge\.deferMessage\('reload'\);\s*location\.reload\(\)/);
    assert.match(bridge, /limit:\s*12/);
    assert.match(bridge, /window\.__sfSearchCache/);
    assert.match(activity, /performNativeLiveSearch\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /NativeSearchWatcher;-><init>/);
    assert.match(watcher, /implements Landroid\/text\/TextWatcher;/);
});

test('native Spotify settings screen replaces the web settings sheet', () => {
    const shell = read('assets/native_ui_shell.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const factory = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');

    assert.match(shell, /window\.__sfRequestSpotifySettings/);
    assert.match(shell, /window\.__sfToggleSpotifySetting/);
    for (const key of [
        'account_info', 'logout', 'audio_quality', 'normalize_volume', 'data_saver',
        'gapless', 'autoplay', 'shuffle', 'repeat', 'explicit', 'canvas', 'bg_audio',
        'private_session', 'crossfade', 'automix', 'mono', 'hardware_volume',
        'podcast_boost', 'lyrics', 'show_unplayable', 'notifications',
        'clear_cache', 'resync', 'about'
    ]) {
        assert.ok(shell.includes(`spotify:settings:${key}`), `${key} should be a settings row`);
    }

    assert.match(activity, /\.method public final openNativeSettings\(\)V/);
    const settingsAt = activity.indexOf('.method public final openNativeSettings()V');
    const settings = activity.slice(settingsAt, activity.indexOf('.method public final setNativeProfileImage', settingsAt));
    assert.match(settings, /if-eqz v1, :native_settings_save_return/);
    assert.doesNotMatch(settings, /if-nez v1, :native_settings_save_return/);
    assert.match(activity, /onNativeSettingsClick[\s\S]*?openNativeSettings\(\)V/);
    assert.match(activity, /"spotify:settings:"[\s\S]*?__sfToggleSpotifySetting/);
    assert.match(activity, /:check_settings[\s\S]*?"Paramètres"/);
    assert.match(activity, /"home-greeting"[\s\S]*?"home"[\s\S]*?setText\(Ljava\/lang\/CharSequence;\)V/);
    assert.match(shell, /onNativeUiData\('home-greeting', greeting\)/);
    assert.match(factory, /GradientDrawable;->setCornerRadius/);
    assert.match(bridge, /onNativeProfileImage\(Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /nativeLogout\(\)V[\s\S]*?JavascriptInterface[\s\S]*?NativeLogoutRunnable/);
    assert.match(shell, /AndBridge\.nativeLogout/);
    assert.match(factory, /GradientDrawable;->setCornerRadius[\s\S]*?setTextColor\(I\)V/);
    assert.match(read('res/layout/activity_main.xml'), /@id\/nativeHeaderAvatar/);
});

test('native settings rows expose real Spotify options and toggles persist locally', () => {
    const calls = [];
    const store = new Map();
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: () => null,
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
    }
    const window = {
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
        }
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL, MutationObserver: TestMutationObserver });

    assert.equal(typeof window.__sfRequestSpotifySettings, 'function');
    calls.length = 0;
    window.__sfRequestSpotifySettings();
    assert.equal(dataFor(calls, 'settings').screen, 'settings');

    const rows = JSON.parse(dataFor(calls, 'settings').data);
    assert.ok(rows.length >= 22, 'the native settings screen lists the real Spotify options');
    const canvasRow = rows.find((row) => row.uri === 'spotify:settings:canvas');
    assert.equal(canvasRow.settingValue, 'ON');
    assert.equal(canvasRow.section, 'Vidéos et Arrière-plan');

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:canvas');
    const toggled = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:canvas');
    assert.equal(toggled.settingValue, 'OFF');
    assert.ok(store.get('melodix_spotify_settings_v1').includes('"canvas":false'));

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:audio_quality');
    const quality = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:audio_quality');
    assert.equal(quality.settingValue, 'Élevée (160 kbit/s)');

    calls.length = 0;
    window.__sfToggleSpotifySetting('spotify:settings:crossfade');
    const fade = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:crossfade');
    assert.equal(fade.settingValue, '2 s');
    const privateRow = JSON.parse(dataFor(calls, 'settings').data).find((row) => row.uri === 'spotify:settings:private_session');
    assert.equal(privateRow.settingValue, 'OFF');
});

test('mobile rows lead with the cover and drop the legacy play badge', () => {
    const factory = read('smali/com/melodix/music/NativeUiRowFactory.smali');
    const create = factory.slice(
        factory.indexOf('.method public static create('),
        factory.indexOf('.method public static createSectionHeader(')
    );

    assert.ok(create.includes('Landroid/widget/ImageView;-><init>'), 'rows must build a cover ImageView');
    assert.ok(
        create.indexOf('Landroid/widget/ImageView;-><init>') < create.indexOf(':native_row_text_column'),
        'the cover is added before the text column so it reads as a mobile list row'
    );
    assert.match(create, /int-to-float v11, v11[\s\S]{0,80}?setCornerRadius\(F\)V/, 'the cover keeps rounded corners');
    assert.match(create, /MarginLayoutParams;->topMargin:I/, 'the subtitle sits just under the title');
    assert.doesNotMatch(create, /▶/, 'the decorative grey play badge must not come back');
});

test('the native shell can ask Android to evaluate the playback bridge again', () => {
    const shell = read('assets/native_ui_shell.js');
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const runner = read('smali/com/melodix/music/NativeAssetRunner.smali');
    const diagnostic = read('assets/runtime_diagnostic.js');

    assert.match(shell, /__sfLoadBundledBridge/);
    assert.match(shell, /readBundledAsset\('spotify_bridge\.js'|readBundledAsset\(name\)/);
    assert.match(shell, /__sfMelodixBridgeStarted === true/);
    assert.match(shell, /__sfNativeUiBridgeRecoveryAttempts/);
    assert.match(shell, /securitypolicyviolation/, 'CSP rejections must be recorded, not guessed');
    assert.match(shell, /__sfBridgeExecMode/, 'the execution strategy must be reported');
    assert.match(bridge, /\.method public final readBundledAsset\(Ljava\/lang\/String;\)Ljava\/lang\/String;[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /const-string v0, "spotify_bridge\.js"[\s\S]*?Lm9;->d/, 'only whitelisted assets are readable');
    const readAt = bridge.indexOf('.method public final readBundledAsset');
    const readMethod = bridge.slice(readAt, bridge.indexOf('.end method', readAt));
    assert.match(readMethod, /equals\(Ljava\/lang\/Object;\)Z[\s\S]{0,80}if-eqz v0, :read_bundled_asset_done/, 'equal names must fall through to m9.d');
    assert.doesNotMatch(readMethod, /equals\(Ljava\/lang\/Object;\)Z[\s\S]{0,80}if-nez v0, :read_bundled_asset_done/, 'if-nez skipped the real asset and returned empty');
    const injectAt = bridge.indexOf('.method public final injectBundledAsset');
    const injectMethod = bridge.slice(injectAt, bridge.indexOf('.end method', injectAt));
    assert.match(injectMethod, /equals\(Ljava\/lang\/Object;\)Z[\s\S]{0,80}if-eqz v0, :asset_inject_done/);
    assert.doesNotMatch(injectMethod, /equals\(Ljava\/lang\/Object;\)Z[\s\S]{0,80}if-nez v0, :asset_inject_done/);
    assert.ok(fs.statSync(path.join(root, 'assets/spotify_bridge.js')).size > 1000, 'the bridge asset must be present and non-empty');
    assert.match(shell, /same-origin-src/);
    assert.match(shell, /__melodix__\/spotify_bridge\.js/);
    assert.match(shell, /script-src-elem/);
    assert.match(shell, /bridgeLoadAttempts < 4/);
    assert.doesNotMatch(shell, /createObjectURL\(new Blob/);
    assert.doesNotMatch(shell, /node\.textContent = source/);
    assert.match(read('assets/spotify_bridge.js'), /sf-melodix-home/);
    assert.match(read('assets/spotify_bridge.js'), /__sfMelodixHomeInitAttempted = true/);
    assert.match(read('assets/spotify_bridge.js'), /__sfMelodixBridgeBootstrapReady = true/);
    assert.match(read('assets/spotify_bridge.js'), /__sfMelodixBridgeStarted = true/);
    assert.match(bridge, /\.method public final injectBundledAsset\(Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(bridge, /NativeAssetRunner;-><init>[\s\S]*?runOnUiThread/, 'evaluation must be posted to the UI thread');
    assert.match(runner, /implements Ljava\/lang\/Runnable;/);
    assert.match(runner, /runNativeJavascript/);
    assert.match(diagnostic, /bridgeRecoveryAttempts/);
    assert.match(diagnostic, /bridgeExecMode/);
    assert.match(read('smali/c91.smali'), /__sfLoadBundledBridge[\s\S]*?native_ui_shell\.js|native_ui_shell\.js[\s\S]*?__sfLoadBundledBridge/);
    assert.doesNotMatch(
        read('smali/c91.smali'),
        /invoke-virtual \{v0, v3, v8\}, Landroid\/webkit\/WebView;->evaluateJavascript/,
        'the 200 KB bridge must not be evaluated in a single call'
    );
});

test('content rows reach the cover factory instead of the settings factory', () => {
    const feed = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const cardDef = feed.search(/^[ \t]*:card[ \t]*$/m);
    const addDef = feed.search(/^[ \t]*:add_settings[ \t]*$/m);
    const contentDef = feed.search(/^[ \t]*:content_row[ \t]*$/m);
    const card = feed.slice(cardDef, addDef);
    const branch = card.match(/isEmpty\(\)Z\s+move-result v(\d+)\s+if-(eqz|nez) v\1, :(content_row|settings_row|\w+)/);
    assert.ok(branch, 'settingValue emptiness must select a factory');
    assert.equal(branch[2], 'nez', 'empty settingValue must jump to the content factory');
    assert.equal(branch[3], 'content_row');
    const content = feed.slice(contentDef, addDef);
    assert.match(content, /NativeUiRowFactory;->create/);
    assert.doesNotMatch(content, /NativeSettingsRowFactory;->create/);
    assert.match(card, /NativeSettingsRowFactory;->create/);
});

test('merged Spotify card labels are split into a title and a subtitle', () => {
    const shell = read('assets/native_ui_shell.js');
    const helper = shell.match(/function splitCardTitle\(value\) \{[\s\S]*?\n    \}/);
    assert.ok(helper, 'splitCardTitle should exist');

    const fn = new Function(`${helper[0]}; return splitCardTitle;`)();
    assert.deepEqual(fn('Radio ecstasyAvec SUICIDAL-IDOL, Rebzyyx, SyKo'), {
        title: 'Radio ecstasy',
        subtitle: 'SUICIDAL-IDOL, Rebzyyx, SyKo'
    });
    assert.deepEqual(fn('Radio Night , Blooming Jasmine .Avec fakemink'), {
        title: 'Radio Night , Blooming Jasmine',
        subtitle: 'fakemink'
    });
    assert.deepEqual(fn('Titres likés'), { title: 'Titres likés', subtitle: '' });
    assert.match(shell, /heading\.subtitle \|\|/, 'the split subtitle must feed the row subtitle');
});

test('Home simulation: 33 playlists replace the loading placeholder', () => {
    const calls = [];
    const listTexts = [];
    const playlists = Array.from({ length: 33 }, (_, i) => ({
        name: `Playlist ${i + 1}`,
        uri: `spotify:playlist:sim${i + 1}`
    }));
    const mainView = { querySelectorAll: () => [] };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => selector === '#main-view'
            ? mainView
            : selector.indexOf('user-widget-link') >= 0 ? {} : null,
        addEventListener: () => {}
    };
    class TestMutationObserver { observe() {} }
    const window = {
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: () => {}
        },
        mediaLib: { playlists },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            onNativeListText: (text) => listTexts.push(text)
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {}
    };

    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });

    const listText = window.__sfNativeHomeListText || listTexts[listTexts.length - 1] || (dataFor(calls, 'list-text') || {}).data || '';
    assert.ok(listText.includes('Playlist 1'), 'the first playlist title is sent to native');
    assert.ok(listText.includes('Playlist 12'), 'library playlists are included in the native list');
    assert.doesNotMatch(listText, /Chargement de votre accueil/);

    const children = [];
    const nativeContent = {
        removeAllViews() { children.length = 0; },
        getChildCount() { return children.length; },
        addView(view) { children.push(view); }
    };
    listText.split('\n').forEach((line) => {
        const title = line.trim();
        if (title) nativeContent.addView({ text: title });
    });
    nativeContent.removeAllViews();
    listText.split('\n').forEach((line) => {
        const title = line.trim();
        if (title) nativeContent.addView({ text: title });
    });
    assert.ok(children.some((child) => child.text === 'Playlist 1'));
    assert.equal(children.some((child) => /Chargement/.test(child.text)), false);
    assert.ok(children.length >= 12, `home list painted ${children.length} rows`);
});

test('opening a playlist no longer depends on the playback bridge', () => {
    const shell = read('assets/native_ui_shell.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');

    assert.match(shell, /window\.__sfOpenCollection = function\(value\)/);
    assert.match(shell, /__sfMelodixBridgeStarted === true && typeof window\.fetchMediaItems === 'function'/);
    assert.match(shell, /return window\.__sfNativeOpenUri\(uri\);/, 'a playlist always loads the real Spotify page');
    assert.match(shell, /function collectDetailRows/);
    assert.match(shell, /data-testid="tracklist-row"/);
    assert.doesNotMatch(shell, /setTimeout\(navigate, 6000\)/);

    const openRow = activity.slice(activity.indexOf('.method public final openNativeRow'));
    assert.match(openRow, /const-string v1, "window\.__sfOpenCollection"/);
    assert.doesNotMatch(openRow, /const-string v1, "window\.fetchMediaItems"/);
});

test('detail rows are collected for any playlist route, not only the first page load', () => {
    const shell = read('assets/native_ui_shell.js');

    assert.match(shell, /function updateDetailRows\(mainView\)/);
    assert.match(shell, /collectDetailRows\(mainView\)/);
    assert.match(shell, /nativeScreenForPath\(\) !== 'detail'/);
    assert.match(shell, /path !== lastDetailPath/);
    assert.match(shell, /lastDetailPath = path;/);
    assert.match(shell, /updateDetailRows\(mainView\);/);
});

test('library and search still work when the bridge never starts', () => {
    const shell = read('assets/native_ui_shell.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');

    // Library tab: bridge first, real collection page otherwise.
    assert.match(shell, /window\.__sfOpenLibrary = function\(\)/);
    assert.match(shell, /__sfMelodixBridgeStarted === true && typeof window\.fetchMediaItems === 'function'/);
    assert.match(shell, /window\.location\.assign\('https:\/\/open\.spotify\.com\/collection\/playlists'\)/);
    const libraryClick = activity.slice(activity.indexOf('.method public final onNativeLibraryClick'));
    assert.match(libraryClick, /const-string v0, "window\.__sfOpenLibrary && window\.__sfOpenLibrary\(\)"/);
    assert.doesNotMatch(libraryClick, /const-string v0, "window\.fetchMediaItems"/);

    // Rows are still harvested from the real library and search pages.
    assert.match(shell, /function updateLibraryRows\(mainView\)/);
    assert.match(shell, /sendNativeUiData\('media:' \+ libraryCategoryForPath\(path\), rows\)/);
    assert.match(shell, /function libraryCategoryForPath\(path\)/);
    assert.match(shell, /function updateSearchRows\(mainView\)/);
    assert.match(shell, /sendNativeUiData\('search:' \+ query, rows\)/);

    // Typing in the native search panel falls back to the real search page.
    assert.match(shell, /function installSearchFallback\(\)/);
    assert.match(shell, /window\.searchMediaItems = fallback;/);
    assert.match(shell, /https:\/\/open\.spotify\.com\/search\//);
    assert.match(shell, /window\.setTimeout\(function\(\) \{\n\s+searchNavigateTimer = 0;/, 'live typing is debounced');
    // Submitting jumps immediately instead of waiting for the debounce.
    const submit = activity.slice(activity.indexOf('.method public final onNativeSearchSubmit'));
    assert.match(submit, /const-string v2, "\(window\.__sfSubmitSearch\|\|window\.searchMediaItems\)"/);
});

test('content rows keep their title, cover and tap target', () => {
    const factory = read('smali/com/melodix/music/NativeUiRowFactory.smali');
    const loader = read('smali/com/melodix/music/NativeImageLoader.smali');

    // Inverted empty checks used to rename every row "Untitled", drop artwork
    // and leave rows unclickable.
    assert.match(factory, /if-eqz v0, :native_row_title_ready/);
    assert.match(factory, /if-eqz v0, :native_row_read_subtitle/, 'a non-empty title must not be replaced with Untitled');
    assert.doesNotMatch(factory, /if-eqz v0, :native_row_default_title/);
    assert.match(factory, /if-nez v10, :native_row_text_column/, 'empty image URLs skip Picasso; real covers load');
    assert.match(factory, /NativeRowClickListener;-><init>/, 'every row gets a click listener');
    assert.match(factory, /setDescendantFocusability/);
    assert.doesNotMatch(
        factory.slice(factory.lastIndexOf('setContentDescription'), factory.indexOf(':native_row_return')),
        /if-e[qz]z v10, :native_row_return/,
        'URI emptiness must not skip the click listener'
    );
    assert.match(loader, /if-eqz v1, :clear_native_image/, 'a non-empty https URL is loaded, not cleared');
});

test('row taps open playlists, albums and tracks', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const openRow = activity.slice(
        activity.indexOf('.method public final openNativeRow'),
        activity.indexOf('.end method', activity.indexOf('.method public final openNativeRow'))
    );

    assert.match(openRow, /if-eqz v0, :native_row_click_done/, 'only empty URIs are ignored');
    assert.match(openRow, /const-string v2, ":playlist:"/);
    assert.match(openRow, /const-string v2, "\/collection"/);
    assert.match(openRow, /if-eqz v1, :native_open_single/, 'tracks are played by the WebView');
    assert.match(openRow, /window\.__sfOpenCollection/);
    assert.doesNotMatch(openRow, /loadNativeSpotifyUri/);
    assert.match(openRow, /window\.__sfNativeOpenUri/);
    assert.match(openRow, /Chargement des titres/);
    assert.match(openRow, /JSONObject;->quote/);
});

test('detail and player screens expose the back arrow and hide the tab bar', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const screen = activity.slice(
        activity.indexOf('.method public final setNativeScreen'),
        activity.indexOf('.end method', activity.indexOf('.method public final setNativeScreen'))
    );

    assert.match(screen, /:native_back_check_player/);
    assert.match(screen, /if-eqz v3, :native_back_check_player/, 'detail shows the arrow');
    assert.match(screen, /const\/4 v1, 0x1\s+goto :set_back_button_visibility/);
    assert.match(screen, /const v2, 0x7f09024c/, 'the whole mini player card is hidden on the full player');
    assert.match(screen, /const v2, 0x7f09024e/, 'the tab bar is hidden on the full player');
});

test('library chips and the search tab never call a bridge-only function', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const shell = read('assets/native_ui_shell.js');
    const categories = activity.slice(
        activity.indexOf('.method public final onNativeLibraryCategoryClick'),
        activity.indexOf('.end method', activity.indexOf('.method public final onNativeLibraryCategoryClick'))
    );

    assert.match(categories, /window\.__sfOpenLibraryCategory/);
    assert.doesNotMatch(categories, /window\.fetchMediaItems/);
    assert.match(shell, /window\.__sfOpenLibraryCategory = function\(tag\)/);
    assert.match(shell, /LIBRARY_CATEGORY_PATHS/);
    assert.match(read('smali/com/melodix/music/NativeSearchFocusRunnable.smali'), /showSoftInput/);
    assert.match(activity, /new-instance v2, Lcom\/melodix\/music\/NativeSearchFocusRunnable;/, 'the search tab raises the keyboard');
});

test('the shell publishes the real player state without the bridge', () => {
    const shell = read('assets/native_ui_shell.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');

    assert.match(shell, /function readNowPlaying\(\)/);
    assert.match(shell, /bridge\.onNativeUiData\('player', JSON\.stringify\(payload\)\)/);
    assert.match(shell, /PLAYER_SEND_INTERVAL_MS = 1000/);
    assert.match(shell, /function publishPlayerState\(force\)/);

    // The pause latch and the sticky hold live in the always-loaded shell now.
    assert.match(shell, /PAUSE_HOLD_MS = 45000/);
    assert.match(shell, /PAUSE_HOLD_MAX_REAPPLIES = 5/);
    assert.match(shell, /window\.__sfTogglePlayback = function\(\)/);
    assert.match(shell, /window\.__sfSkip = function\(direction\)/);
    assert.match(shell, /window\.__sfMarkUserPlaybackIntent = markUserPlaybackIntent/);

    assert.match(activity, /window\.__sfTogglePlayback/);
    assert.match(activity, /window\.__sfSkip/);
    assert.match(activity, /window\.__sfSkip\(\\'back\\'\)/);
    assert.match(activity, /window\.__sfSkip\(\\'forward\\'\)/);
});

function buildPlayerShellHarness(options) {
    const opts = options || {};
    const calls = [];
    const store = new Map();
    const clicks = { playpause: 0, forward: 0, back: 0 };
    const media = {
        tagName: 'AUDIO',
        paused: false,
        ended: false,
        muted: false,
        currentTime: opts.position === undefined ? 42 : opts.position,
        duration: opts.duration === undefined ? 200 : opts.duration,
        src: 'https://open.spotify.com/blobs/audio'
    };
    const playButton = {
        getAttribute: (name) => name === 'aria-label' ? (opts.label || 'Mettre en pause') : null,
        click: () => { clicks.playpause += 1; }
    };
    const nodes = {
        '[data-testid="context-item-link"]': { textContent: opts.track || 'Titre test' },
        '[data-testid="context-item-info-artist"]': { textContent: opts.artist || 'Artiste test' },
        '[data-testid="cover-art-image"]': {
            tagName: 'IMG',
            src: 'https://i.scdn.co/image/abc123'
        }
    };
    const bar = {
        querySelector: (selector) => nodes[selector] || null
    };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => {
            if (selector === '#main-view') return null;
            if (selector.indexOf('control-button-playpause') >= 0) return playButton;
            if (selector.indexOf('control-button-skip-forward') >= 0) return { click: () => { clicks.forward += 1; } };
            if (selector.indexOf('control-button-skip-back') >= 0) return { click: () => { clicks.back += 1; } };
            if (selector.indexOf('now-playing-bar') >= 0 || selector.indexOf('now-playing-widget') >= 0) return bar;
            return null;
        },
        querySelectorAll: (selector) => selector === 'audio, video' ? [media] : [],
        addEventListener: () => {}
    };
    const window = {
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiRoute: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data })
        },
        MutationObserver: class { observe() {} },
        addEventListener: () => {},
        setTimeout: (fn) => { try { fn(); } catch (_) {} return 1; },
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {},
        localStorage: {
            getItem: (key) => store.has(key) ? store.get(key) : null,
            setItem: (key, value) => store.set(key, String(value)),
            removeItem: (key) => store.delete(key)
        }
    };
    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });
    return { window, calls, clicks, store };
}

test('the shell sends the real now-playing state to the native player', () => {
    const harness = buildPlayerShellHarness();
    const playerCall = harness.calls.find((call) => call.screen === 'player');

    assert.ok(playerCall, 'the shell publishes a player payload');
    const payload = JSON.parse(playerCall.data);
    assert.equal(payload.track, 'Titre test');
    assert.equal(payload.artist, 'Artiste test');
    assert.equal(payload.cover, 'https://i.scdn.co/image/abc123');
    assert.equal(payload.playing, true);
    assert.equal(payload.duration, 200000);
    assert.equal(payload.position, 42000);
});

test('the shell pause button latches the pause and a skip releases it', () => {
    const harness = buildPlayerShellHarness();
    const target = harness.window.__sfTogglePlayback();

    assert.equal(target, false, 'a playing player is paused');
    assert.equal(harness.clicks.playpause, 1);
    assert.equal(harness.window.__sfIsUserPaused(), true);
    assert.equal(harness.window.__sfPauseHoldActive, true);

    harness.window.__sfSkip('forward');
    assert.equal(harness.clicks.forward, 1);
    assert.equal(harness.window.__sfIsUserPaused(), false, 'a skip releases the pause latch');
    assert.equal(harness.window.__sfPauseHoldActive, false);
});

test('the library tab never reloads its own page in a loop', () => {
    const build = (pathname) => {
        const navigations = [];
        const window = {
            location: {
                hostname: 'open.spotify.com',
                pathname,
                href: 'https://open.spotify.com' + pathname,
                assign: (url) => navigations.push(url)
            },
            AndBridge: { onNativeUiReady: () => {}, onNativeUiData: () => {} },
            MutationObserver: class { observe() {} },
            addEventListener: () => {},
            setTimeout: () => 1,
            clearTimeout: () => {},
            setInterval: () => 1,
            clearInterval: () => {}
        };
        const document = {
            readyState: 'complete',
            documentElement: {},
            querySelector: () => null,
            querySelectorAll: () => [],
            addEventListener: () => {}
        };
        vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });
        return { window, navigations };
    };

    const onPlaylists = build('/collection/playlists');
    onPlaylists.window.__sfOpenLibrary();
    assert.deepEqual(onPlaylists.navigations, [], 'the playlists tab is already displayed');

    const onAlbums = build('/collection/albums');
    onAlbums.window.__sfOpenLibraryCategory('albums');
    assert.deepEqual(onAlbums.navigations, [], 'the selected chip is already displayed');

    const onHome = build('/');
    onHome.window.__sfOpenLibrary();
    assert.match(onHome.navigations[0] || '', /\/collection\/playlists$/);
});

test('browse tiles drive the live search and the grid yields to real results', () => {
    const layout = read('res/layout/activity_main.xml');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const publicXml = read('res/values/public.xml');
    const gridAt = layout.indexOf('@id/nativeGenreScroll');
    const chipsAt = layout.indexOf('@id/nativeLibraryCategories');
    const grid = layout.slice(gridAt, chipsAt);
    const handlerAt = activity.indexOf('.method public final onNativeGenreClick(Landroid/view/View;)V');
    const handler = activity.slice(handlerAt, handlerAt + 1400);
    const rowsAt = activity.indexOf('.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
    const rows = activity.slice(rowsAt, rowsAt + 1600);
    const searchAt = activity.indexOf('.method public final onNativeSearchClick(Landroid/view/View;)V');
    const search = activity.slice(searchAt, searchAt + 2200);
    const screenAt = activity.indexOf('.method public final setNativeScreen(Ljava/lang/String;)V');
    const screen = activity.slice(screenAt, screenAt + 1600);

    assert.ok(gridAt > layout.indexOf('@+id/nativeSearchPanel'), 'the grid sits under the search field');
    assert.ok(gridAt < chipsAt, 'the grid sits above the library chips');
    assert.match(publicXml, /name="nativeGenreScroll" id="0x7f09024f"/);
    assert.equal((grid.match(/android:onClick="onNativeGenreClick"/g) || []).length, 8);
    assert.match(grid, /android:text="Parcourir tout"/);
    assert.ok(handlerAt > 0, 'the tile handler exists');
    assert.match(handler, /performNativeLiveSearch/);
    assert.match(handler, /"screen-title"/, 'the header echoes the chosen genre');

    // Every row render restores the list and hides the grid; the search tab does
    // the opposite, and leaving the screen always hides the grid.
    assert.match(rows, /0x7f090239/);
    assert.match(rows, /0x7f09024f/);
    assert.match(search, /0x7f09024f/);
    assert.match(screen, /0x7f09024f/);
});

test('search results coming from the fallback path reach the native list', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const applyEnd = activity.indexOf('.method public final updateNativePlayer(Ljava/lang/String;)V', applyAt);
    const apply = activity.slice(applyAt, applyEnd);

    assert.match(apply, /const-string v0, "search:"/);
    assert.match(apply, /nativeExpectedSearch/);
    assert.match(apply, /const-string v8, "Résultats de recherche"/);
});

test('home shelf renderer skips missing views, not existing ones', () => {
    const shelf = require('fs').readFileSync(require('path').join(__dirname, '..', 'smali/com/melodix/music/NativeHomeShelfRenderer.smali'), 'utf8');
    assert.match(shelf, /if-eqz v13, :shelf_done/);
    assert.match(shelf, /if-eqz v5, :shelf_next/);
    assert.match(shelf, /if-eqz v1, :shelf_empty/);
    assert.match(shelf, /const\/16 v9, 0x98/);
});

test('navigation clicks keep home JSON and do not force the home screen', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(activity, /\.field private nativeHomeJson:Ljava\/lang\/String;/);
    assert.match(activity, /\.field private nativeLibraryJson:Ljava\/lang\/String;/);

    const searchAt = activity.indexOf('.method public final onNativeSearchClick(Landroid/view/View;)V');
    const search = activity.slice(searchAt, activity.indexOf('.method public final performNativeLiveSearch', searchAt));
    assert.match(search, /:try_start_search/);
    assert.match(search, /NativeCrashGuard;->record/);

    const homeAt = activity.indexOf('.method public final onNativeHomeClick(Landroid/view/View;)V');
    const home = activity.slice(homeAt, activity.indexOf('.method public final onNativeSearchClick', homeAt));
    assert.match(home, /nativeHomeJson/);

    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const apply = activity.slice(applyAt, activity.indexOf('.method public final updateNativePlayer', applyAt));
    assert.match(apply, /if-eqz p1, :apply_done/);
    assert.match(apply, /if-eqz p2, :apply_done/);
    assert.match(apply, /iput-object p2, p0, Lcom\/melodix\/music\/MainActivity;->nativeHomeJson/);
    assert.match(activity, /:show_paint_home/);

    const rowsAt = activity.indexOf('.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
    const rows = activity.slice(rowsAt, activity.indexOf('.method public final findNativeByTag', rowsAt));
    assert.doesNotMatch(rows, /NativeHomeShelfRenderer;->render/, 'zero-height shelves hid every playlist card');
    assert.doesNotMatch(rows, /NativeRowList;->fill/, 'NativeRowList VerifyError crashed launch');
    assert.doesNotMatch(rows, /Lorg\/json\/JSONArray;-><init>/, 'JSONArray loop VerifyError crashed home');
    assert.match(rows, /NativeHomeFeed;->paint/);
    assert.match(rows, /:render_native_done/);

    const backAt = activity.indexOf(':back_button');
    const back = activity.slice(backAt, backAt + 900);
    assert.match(back, /const\/4 v1, 0x0/);
    assert.match(back, /if-eqz v3, :native_back_check_player/);
});

test('runNativeFunction ignores a null name and quotes an empty argument', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const at = activity.indexOf('.method public final runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V');
    const method = activity.slice(at, activity.indexOf('.method public final onNativeHomeClick', at));
    assert.match(method, /if-eqz p1, :native_fn_done/);
    assert.match(method, /if-eqz p2, :native_fn_empty/);
    assert.match(method, /:native_fn_done/);
});

test('the playback bridge is served same-origin so CSP script-src-elem inline is not required', () => {
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const client = read('smali/c91.smali');
    const inject = read('smali/com/melodix/music/AndBridge.smali');
    const interceptAt = client.indexOf('.method public final shouldInterceptRequest');
    const intercept = client.slice(interceptAt, interceptAt + 2500);

    assert.match(asset, /const-string v1, "\/__melodix__\/spotify_bridge\.js"/);
    assert.match(asset, /readAssetUtf8/);
    assert.match(asset, /text\/javascript/);
    assert.match(asset, /Content-Length/);
    assert.match(asset, /const\/16 v5, 0xc8/);
    assert.match(asset, /loaderJavascript/);
    assert.match(intercept, /NativeBridgeAsset;->responseForUrl/);
    assert.match(inject, /NativeBridgeAsset;->loaderJavascript/);
    assert.doesNotMatch(
        inject.slice(inject.indexOf('injectBundledAsset'), inject.indexOf('readBundledAsset')),
        /Lm9;->d/,
        'native recovery must not evaluateJavascript the 200 KB file'
    );
});


function dalvikIf(reg, op, jumpIf) {
    if (op === 'eqz') return reg === 0 ? jumpIf : 'fall';
    if (op === 'nez') return reg !== 0 ? jumpIf : 'fall';
    throw new Error(op);
}

function miniPlayerVisibleOnScreen(isPlayerScreen, hideOpcode) {
    const branch = dalvikIf(isPlayerScreen ? 1 : 0, hideOpcode, 'hide');
    return branch !== 'hide';
}

function accountsHostHidesShell(url) {
    try {
        return new URL(url).hostname === 'accounts.spotify.com';
    } catch (_) {
        return false;
    }
}

test('mini player stays visible on Accueil and hides only on the full player screen', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const miniAt = activity.indexOf('    :native_mini_player\n');
    const mini = activity.slice(Math.max(0, miniAt - 120), miniAt + 400);
    const hideOp = mini.match(/if-(eqz|nez) v1, :hide_native_mini_player/);
    assert.ok(hideOp, 'setNativeScreen must gate the mini player on the player flag');
    assert.equal(hideOp[1], 'nez', 'home (flag=0) must not jump to GONE');
    assert.equal(miniPlayerVisibleOnScreen(false, hideOp[1]), true);
    assert.equal(miniPlayerVisibleOnScreen(true, hideOp[1]), false);
    assert.equal(miniPlayerVisibleOnScreen(false, 'eqz'), false, 'the previous if-eqz hid the mini player on Accueil');
});

test('nativeRoot is hidden only on the accounts.spotify.com host, not on /auth substrings', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.indexOf('const v5, 0x7f09022f');
    const block = activity.slice(start, start + 1200);
    assert.match(block, /accountsHostHides/);
    assert.match(block, /native-root-gone:accounts-host/);
    assert.ok(!block.includes('"/login"'));
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    assert.match(guard, /Landroid\/net\/Uri;->parse/);
    assert.match(guard, /getHost\(\)Ljava\/lang\/String;/);
    assert.match(guard, /accounts.spotify.com/);
    assert.equal(accountsHostHidesShell('https://open.spotify.com/'), false);
    assert.equal(accountsHostHidesShell('https://open.spotify.com/playlist/abc'), false);
    assert.equal(accountsHostHidesShell('https://open.spotify.com/search/auth-hits'), false);
    assert.equal(accountsHostHidesShell('https://accounts.spotify.com/login'), true);
});

test('DOM observer ignores script/style noise and skips work while the tab is hidden', () => {
    const script = read('assets/native_ui_shell.js');
    assert.match(script, /function mutationLooksRelevant\(/);
    assert.match(script, /visibilitychange/);
    assert.ok(script.includes("addEventListener('visibilitychange', function() {\n            if (!shellIsHidden()) scheduleUpdate();"));
    assert.ok(!script.includes('if (!shellIsHidden()) runUpdate();'));
    assert.match(script, /shellIsHidden\(\)/);
    assert.match(script, /__sfNativeUiShellLastError/);

    const timers = [];
    let observerCb = null;
    const document = {
        hidden: false,
        readyState: 'complete',
        documentElement: {},
        querySelector: () => null,
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver {
        constructor(cb) { observerCb = cb; }
        observe() {}
    }
    const window = {
        location: { hostname: 'open.spotify.com', pathname: '/', href: 'https://open.spotify.com/' },
        AndBridge: {},
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        },
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {}
    };
    vm.runInNewContext(script, { window, document, URL, MutationObserver: TestMutationObserver });
    assert.equal(typeof observerCb, 'function');
    const afterInstall = timers.length;
    observerCb([{
        addedNodes: [{ nodeType: 1, tagName: 'SCRIPT' }],
        removedNodes: []
    }]);
    assert.equal(timers.length, afterInstall, 'script tags must not schedule a home scrape');
    observerCb([{
        addedNodes: [{ nodeType: 3, data: 'Mix du soir' }],
        removedNodes: []
    }]);
    assert.ok(timers.length > afterInstall, 'playlist text node updates must still schedule a scrape');
    const afterText = timers.length;
    observerCb([{
        addedNodes: [{ nodeType: 1, tagName: 'DIV' }],
        removedNodes: []
    }]);
    assert.equal(timers.length, afterText, 'debounce coalesces a second mutation while a scrape is queued');
    document.hidden = true;
    observerCb([{
        addedNodes: [{ nodeType: 1, tagName: 'SECTION' }],
        removedNodes: []
    }]);
    assert.equal(timers.length, afterText, 'hidden tab must not queue another scrape');
});

test('shell diagnostics redact tokens and clear the matching operation', () => {
    const script = read('assets/native_ui_shell.js');
    assert.match(script, /function sanitizeDiagnostic\(/);
    assert.match(script, /function recordShellError\(/);
    assert.match(script, /function clearShellError\(/);
    assert.match(script, /Bearer \[redacted\]/);
    assert.match(script, /MAX_HOME_RETRIES = 40/);

    let boom = true;
    const document = {
        hidden: false,
        readyState: 'complete',
        documentElement: {},
        querySelector: () => {
            if (boom) throw new Error('Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.payload.signature access_token=secretvalue123');
            return null;
        },
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver { observe() {} }
    const window = {
        location: { hostname: 'open.spotify.com', pathname: '/', href: 'https://open.spotify.com/' },
        AndBridge: {},
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {}
    };
    vm.runInNewContext(script, { window, document, URL, MutationObserver: TestMutationObserver });
    assert.ok(window.__sfNativeUiShellErrors >= 1);
    assert.match(String(window.__sfNativeUiShellLastError), /^(install|update):/);
    assert.doesNotMatch(String(window.__sfNativeUiShellLastError), /eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9/);
    assert.doesNotMatch(String(window.__sfNativeUiShellLastError), /secretvalue123/);
    assert.match(String(window.__sfNativeUiShellLastError), /\[redacted\]/);
    assert.ok(window.__sfNativeUiShellLastErrorOp === 'install' || window.__sfNativeUiShellLastErrorOp === 'update');
});
