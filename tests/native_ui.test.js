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
    'nativeMiniPlayer',
    'nativePlayerArtwork',
    'nativePlayerLargeArtwork',
    'nativeHomeTab',
    'nativeSearchTab',
    'nativeLibraryTab'
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
    assert.match(layout, /Loading your music/);
    assert.match(layout, /android:id="@id\/nativePlayerArtwork"/);
    assert.match(layout, /android:id="@id\/nativePlayerLargeArtwork"/);
    assert.match(layout, /android:id="@id\/nativeHomeTab"/);
    assert.match(layout, /@drawable\/native_shell_background/);
    assert.match(layout, /@drawable\/native_mini_player_bg/);
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
    assert.match(activity, /styleNativeTab[\s\S]*?setBackgroundTintList/);
    assert.match(activity, /\.method public final postNativeUiRoute\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final applyNativeUiData\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final runNativeJavascript\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final openNativeRow\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
    assert.match(activity, /\.method public final onNativePlayerExpandClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final onNativePlayerNextClick\(Landroid\/view\/View;\)V/);
    assert.match(activity, /\.method public final updateNativePlayer\(Ljava\/lang\/String;\)V[\s\S]*?"cover"[\s\S]*?NativeImageLoader;->load[\s\S]*?"duration"[\s\S]*?"position"[\s\S]*?setProgress\(I\)V/);
    assert.match(activity, /applyNativeUiData[\s\S]*?"screen-title"[\s\S]*?"detail"[\s\S]*?renderNativeRows[\s\S]*?NativeUiRowFactory;->create/);
    assert.match(read('smali/com/melodix/music/NativeUiUpdateRunnable.smali'), /const\/4 v2, 0x2[\s\S]*?onNativeLibraryClick/);
    assert.match(activity, /renderNativeRows[\s\S]*?NativeUiRowFactory;->create/);
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

    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'home');
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Fallback track',
        subtitle: 'Artist name',
        section: '',
        image: '',
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

    assert.equal(calls.length, 1);
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Saved mix',
        subtitle: 'Playlist',
        section: 'Your playlists',
        image: 'https://i.scdn.co/image/saved',
        uri: 'spotify:playlist:saved123'
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
    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'home');
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Sélection du jour',
        subtitle: 'Playlist',
        section: 'Your playlists',
        image: 'https://i.scdn.co/image/fr-cover',
        uri: 'spotify:playlist:fr123'
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
    assert.deepEqual(calls.map((call) => call.screen), ['screen-title', 'detail']);
    assert.equal(calls[0].data, 'A playlist');
    assert.deepEqual(JSON.parse(calls[1].data), [{
        title: 'A track',
        subtitle: 'An artist',
        section: '',
        image: '',
        uri: 'spotify:track:track123'
    }]);
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
    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'home');
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Focus Mix',
        subtitle: 'Picked for you',
        section: '',
        image: 'https://i.scdn.co/image/focus',
        uri: 'spotify:playlist:abc123'
    }]);
    assert.equal(window.__sfNativeUiHomeRowsCount, 1);
    assert.equal(window.__sfNativeUiHomeDataSent, true);
    assert.equal(window._sfNativeHomeSignature, JSON.stringify([{
        title: 'Focus Mix',
        subtitle: 'Picked for you',
        section: '',
        image: 'https://i.scdn.co/image/focus',
        uri: 'spotify:playlist:abc123'
    }]), 'the shell must not overwrite or depend on the shared legacy signature');

    assert.equal(window.__sfNativeOpenUri('spotify:track:track123'), true);
    assert.equal(assigned.pop(), 'https://open.spotify.com/track/track123');
    assert.equal(window.__sfNativeOpenUri('https://example.org/track/track123'), false);
    assert.equal(window.__sfNativeRequestHome(), true);
    assert.equal(calls.length, 2, 'requesting Home should resend current rows');
    assert.equal(timers.length, 0, 'a signed-in page with a ready bridge should not keep retry timers');
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

    assert.equal(calls.length, 1);
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'UHQ FREESTYLE #1',
        subtitle: 'Creator Name',
        section: '',
        image: 'https://i.scdn.co/image/ep123',
        uri: 'spotify:episode:ep123'
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

    const rows = JSON.parse(calls[0].data);
    assert.equal(rows[0].title, 'Liked Songs');
    assert.equal(rows[0].section, 'Your playlists');
    assert.equal(rows[1].title, 'Ma Playlist Perso');
    assert.equal(rows[1].section, 'Your playlists');
    assert.equal(rows[2].title, 'Spotify Mix 0');
    assert.equal(rows[2].section, 'Sélections Spotify');

    assert.match(activity, /createSectionHeader\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;\)Landroid\/widget\/TextView;/);
    assert.match(activity, /createPlaylistBanner\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;ILjava\/lang\/String;Ljava\/lang\/String;\)Landroid\/widget\/LinearLayout;/);
    assert.match(activity, /\.method public final onNativeSearchClick\(Landroid\/view\/View;\)V[\s\S]*?renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
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
    assert.doesNotMatch(shell, /function clearHomeRetry\(\) \{[^}]*observer\.disconnect\(\)/);
    assert.match(bridge, /if \(window\.__sfMelodixBridgeCompleted\)/);
    assert.doesNotMatch(bridge, /AndBridge\.deferMessage\('reload'\);\s*location\.reload\(\)/);
    assert.match(bridge, /limit:\s*12/);
    assert.match(bridge, /window\.__sfSearchCache/);
    assert.match(activity, /performNativeLiveSearch\(Ljava\/lang\/String;\)V/);
    assert.match(activity, /NativeSearchWatcher;-><init>/);
    assert.match(watcher, /implements Landroid\/text\/TextWatcher;/);
});



