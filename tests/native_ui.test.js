const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');
const { JSDOM } = require('jsdom');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const { loadDimens, resolveSize, size, PHONE, TABLET } = require('./helpers/mel_dimens');

const nativeIds = [
    'nativeRoot',
    'nativeScreenTitle',
    'nativeSettingsButton',
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
    'nativeTabBar',
    'nativeMiniPlayerContainer',
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
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:visibility="gone"/);
    assert.match(layout.slice(nativeRootPosition, nativeRootPosition + 900), /android:clickable="true"/);
    assert.match(layout, /android:id="@id\/nativeContent"/);
    assert.match(layout, /Chargement de votre musique/);
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

test('Android WebView instruments real CSS layout states at all requested phone viewport widths without authenticated account data', () => {
    const harness = read('tests/android/HomeRenderInstrumentation.java');
    assert.match(harness, /MOBILE_VIEWPORT_MATRIX_WIDTHS = \{360, 384, 393, 412\}/,
        'the Android matrix must exercise each explicitly requested CSS viewport width');
    const probeBlock = harness.split('private static final String MOBILE_VIEWPORT_LAYOUT_PROBE =')[1]
        .split('private static final String BROWSER_COMPATIBILITY_PROBE')[0];
    const javaStrings = Array.from(probeBlock.matchAll(/"((?:\\.|[^"\\])*)"/g), (match) => match[1]);
    const probe = javaStrings.map((value) => JSON.parse('"' + value + '"')).join('');
    for (const measurement of [
        'window.visualViewport', 'viewportFitCover', 'topCustomInsetCssPx', 'homeBottomGapCssPx', 'bottomInsetInferredCssPx',
        'sidebarPlayerIntersecting', 'dockPlayerIntersecting', 'sidebarCenterOwner', 'hitTargets', 'elementFromPoint',
        'documentHorizontalOverflow', 'homeVerticalOverflow', 'sidebarVerticalOverflow', 'settledStyles.textContent'
    ]) {
        assert.ok(probe.includes(measurement), `the real Android WebView probe should report ${measurement}`);
    }
    for (const phase of ['compact', 'library-open', 'expanded']) {
        assert.ok(probe.includes(`state('${phase}')`), `the same viewport must measure the ${phase} state`);
    }
    assert.ok(probe.includes('fixture_test_only:true') && probe.includes('states:[compact,libraryOpen,expanded]'));
    const fixtureFactory = harness.split('private WebView createMobileViewportFixture')[1]
        .split('private void installPackagedMobileViewportCss')[0];
    const factory = fixtureFactory.indexOf('settings.setBlockNetworkLoads(true)');
    const wideViewport = fixtureFactory.indexOf('settings.setUseWideViewPort(false)', factory);
    const textZoom = fixtureFactory.indexOf('settings.setTextZoom(100)', wideViewport);
    assert.ok(factory >= 0 && wideViewport > factory && textZoom > wideViewport,
        'fixture measurements match the primary WebView width behavior, use the packaged CSS, and load no account data');
    assert.ok(fixtureFactory.includes('viewport-fit=cover') && fixtureFactory.includes('height:1200px')
        && fixtureFactory.includes('min-height:960px;flex:none') && fixtureFactory.includes('sf-melodix-home__card'));
    assert.doesNotMatch(fixtureFactory, /playlist|album|artist|spotify:|cookie|token/i,
        'the geometry fixture has no fabricated account, library, playlist, or credential data');
    const matrix = harness.split('private Bundle runMobileViewportMatrix')[1]
        .split('private JSONObject findViewportState')[0];
    assert.ok(matrix.includes('MOBILE_VIEWPORT_MATRIX_WIDTHS')
        && matrix.includes('createMobileViewportFixture') && matrix.includes('installPackagedMobileViewportCss'));
    assert.ok(matrix.includes('authenticated_home_test_performed", false')
        && matrix.includes('originalWebViewStatePreserved'),
        'fixture measurements remain distinct from authenticated Spotify Home and preserve the original login WebView');
    assert.ok(matrix.includes('mobile_viewport_layout_contract_passed')
        && matrix.includes('mobile_viewport_matrix_measurements_complete'),
        'collected geometry and the visual layout contract are reported separately');
    assert.ok(harness.includes('sendMobileViewportCaseStatus') && harness.includes('reportMobileViewportFailure')
        && harness.includes('mobile_viewport_failure_type') && harness.includes('LayoutContractMismatch')
        && harness.includes('compactViewportLayoutFailureCodes') && harness.includes('appendViewportFailureCode'),
        'each Android width exposes bounded progress, enforces the layout contract, and reports safe failure-stage diagnostics');
    assert.ok(harness.includes('Math.floor(viewportWidth * density)') && harness.includes('settings.setUseWideViewPort(false)')
        && harness.includes('154.0 + bottomInset') && harness.includes('rendererView.setAlpha(0.0f)')
        && harness.includes('rendererView.setTranslationX(Math.max(0, root.getWidth()))'),
        'the test fixture must measure a real requested CSS width without visually covering or focusing the primary Spotify WebView');
    const expandedChecks = harness.split('private String expandedViewportLayoutFailureCodes')[1]
        .split('private void appendViewportFailureCode')[0];
    assert.match(expandedChecks, /surfaceVisible\(nav\), "dock_visible"/,
        'the fullscreen state preserves the visible mobile dock');
    assert.match(expandedChecks, /surfacePosition\(nav, "fixed"\)/);
    assert.match(expandedChecks, /navigationTargetsReachable\(hits\), "dock_targets"/,
        'Home, Search and Library remain real, reachable touch targets above the player overlay');
    assert.match(expandedChecks, /fullPlay\.optBoolean\("reachable", false\)/,
        'the fullscreen player controls remain reachable as well as large enough');
    const mobileCss = read('assets/css_hacks.css');
    const fullscreenDockRule = mobileCss.match(/body\.sf-mobile-shell\.sf-fs-open #sf-mobile-nav\s*\{([^}]*)\}/);
    const fullscreenPlayerRule = mobileCss.match(/#sf-fs-player\s*\{([^}]*)\}/);
    assert.ok(fullscreenDockRule && fullscreenPlayerRule, 'the packaged CSS defines both fullscreen surfaces');
    assert.match(fullscreenDockRule[1], /display:\s*grid !important/);
    assert.match(fullscreenDockRule[1], /z-index:\s*100010 !important/);
    assert.match(fullscreenPlayerRule[1], /z-index:\s*100000/,
        'the dock is layered above the fullscreen player, rather than hiding either surface');
});

test('native Player scrolls above the fixed dock without reparenting mini-player or tabs', () => {
    const layout = new JSDOM(read('res/layout/activity_main.xml'), { contentType: 'text/xml' }).window.document;
    const byAndroidId = (id) => Array.from(layout.getElementsByTagName('*'))
        .find((node) => node.getAttribute('android:id') === `@id/${id}`);
    const root = byAndroidId('nativeRoot');
    const player = byAndroidId('nativePlayerPanel');
    const miniPlayer = byAndroidId('nativeMiniPlayerContainer');
    const tabBar = byAndroidId('nativeTabBar');
    assert.ok(root && player && miniPlayer && tabBar, 'all native shell surfaces exist');
    // The adaptive player is a ScrollView subclass; wrap content naturally so
    // its two-pass measurement can reserve height for the rest of the player.
    assert.equal(player.tagName, 'com.melodix.music.NativePlayerScroll');
    assert.match(read('smali/com/melodix/music/NativePlayerScroll.smali'), /\.super Landroid\/widget\/ScrollView;/);
    assert.equal(player.getAttribute('android:fillViewport'), 'false');
    assert.strictEqual(player.parentElement, root);
    assert.strictEqual(miniPlayer.parentElement, root);
    assert.strictEqual(tabBar.parentElement, root);
    assert.ok(Array.from(root.children).indexOf(miniPlayer) < Array.from(root.children).indexOf(tabBar),
        'the mini-player and navigation remain independent siblings in their existing order');

    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const screen = activity.slice(activity.indexOf('.method public final setNativeScreen(Ljava/lang/String;)V'));
    const dockStart = screen.lastIndexOf('\n    :native_tab_bar');
    const dock = screen.slice(dockStart, screen.indexOf('\n    :screen_title', dockStart));
    assert.match(dock, /const v2, 0x7f09024e[\s\S]*?if-eqz v2, :screen_title[\s\S]*?const\/4 v3, 0x0[\s\S]*?setVisibility\(I\)V/);
    assert.doesNotMatch(dock, /nativeCurrentScreen|if-eqz v1/,
        'Player never hides the native bottom navigation');
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
    const shell = read('scripts/native_ui_shell.source.js');
    const readiness = shell.match(/function notifyNativeUiReady\(mainView\) \{[\s\S]*?\n    \}/);
    const client = read('smali/c91.smali');
    const hotfixList = read('smali/c40.smali').split('.method public static a')[0];
    assert.ok(readiness, 'native shell readiness guard should exist');
    assert.match(readiness[0], /sessionProven = libraryProvesSession\(\)/,
        'readiness uses verified private API proof rather than a profile widget');
    assert.match(readiness[0], /homeShellStateReady = nativeHomeRoute[\s\S]*?__sfNativeUiHomeSessionUnproven === true/,
        'a sent status-only Home can display the shell without weakening the private-data gate');
    const nativeShell = read('scripts/native_ui_shell.source.js');
    assert.match(nativeShell, /function pageHasProfileSignal\(\)[\s\S]*?sfDeepQuery/,
        'profile controls remain an internal page signal, not session proof');
    assert.doesNotMatch(nativeShell, /diagTrace\([^\n]*profile|diagTrace\([^\n]*session=|diagTrace\([^\n]*proof=/i,
        'profile and proof indicators are absent from shell traces');
    assert.match(readiness[0], /open\.spotify\.com/);
    assert.match(client, /const-string v5, "native_ui_shell\.js"[\s\S]*?evaluateJavascript/);
    assert.doesNotMatch(hotfixList, /native_ui_shell\.js/);
    assert.doesNotMatch(read('scripts/spotify_bridge.source.js'), /notifyNativeUiReady\(/);
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
    const runnable = read('smali/com/melodix/music/NativeUiUpdateRunnable.smali');
    assert.match(runnable, /const\/4 v2, 0x2[\s\S]*?applyNativeUiData/);
    assert.match(runnable, /setNativeScreen\(Ljava\/lang\/String;\)V/);
    assert.doesNotMatch(runnable, /onNativeLibraryClick/, 'a route update must not re-trigger the library tab');
    assert.match(activity, /renderNativeRows[\s\S]*?NativeUiRowFactory;->create/);
    assert.match(read('smali/com/melodix/music/NativeImageLoader.smali'), /Picasso;->load[\s\S]*?RequestCreator;->into/);
    assert.match(read('smali/com/melodix/music/NativeUiRowFactory.smali'), /GradientDrawable;->setCornerRadius[\s\S]*?setContentDescription/);
});

test('Spotify links are normalized to safe native row URIs', () => {
    const shell = read('scripts/native_ui_shell.source.js');
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

test('player recovery rejects unsafe URLs and routes valid targets through native WebView.loadUrl', () => {
    const shell = read('scripts/native_ui_shell.source.js');
    const safeHelper = shell.match(/function safeWebPlayerUrl\(raw, fallback\) \{[\s\S]*?\n    \}/);
    const navHelper = shell.match(/function navToPlayer\(n, href, frameSrc\) \{[\s\S]*?\n    \}/);
    const navigateHelper = shell.match(/function navigateWebPlayer\(raw\) \{[\s\S]*?\n    \}/);
    assert.ok(safeHelper, 'the Web Player URL validator should exist');
    assert.ok(navHelper, 'player recovery should have a single navigation helper');
    assert.ok(navigateHelper, 'native WebView routing should be the only player navigation path');

    const assigned = [];
    const loaded = [];
    const traces = [];
    const context = {
        URL,
        window: {
            location: { assign: (target) => assigned.push(target) },
            AndBridge: { loadWebPlayerUrl: (target) => loaded.push(target) }
        },
        diagTrace: (line) => traces.push(line)
    };
    vm.runInNewContext(`${safeHelper[0]}\n${navigateHelper[0]}\n${navHelper[0]}\nglobalThis.navToPlayer = navToPlayer;`, context);

    context.navToPlayer(1, 'intent://open.spotify.com/app#Intent;scheme=https;end', '');
    assert.equal(loaded.pop(), 'https://open.spotify.com/app', 'intent targets fall back to the safe player route');

    context.navToPlayer(1, 'https://open.spotify.com.evil.test/app', '');
    assert.equal(loaded.pop(), 'https://open.spotify.com/app', 'lookalike hosts never reach the native loader');

    context.navToPlayer(1, 'https://open.spotify.com:8443/app', '');
    assert.equal(loaded.pop(), 'https://open.spotify.com/app', 'unexpected ports are rejected');

    context.navToPlayer(1, '/app', 'https://open.spotify.com/search?query=Jazz');
    assert.equal(loaded.pop(), 'https://open.spotify.com/search?query=Jazz', 'a valid player frame remains the preferred target');

    context.navToPlayer(1, '/app', '');
    assert.equal(loaded.pop(), 'https://open.spotify.com/app', 'relative CTA links stay on the Spotify Web Player host');
    assert.deepEqual(assigned, [], 'automatic recovery never asks Android to resolve a Spotify App Link');
    assert.equal(traces.length, 5);
});

test('a Spotify landing CTA is read but never auto-clicked during player recovery', () => {
    const script = read('scripts/native_ui_shell.source.js');
    let now = 10000;
    let clicked = 0;
    const assigned = [];
    const loaded = [];
    const timers = [];
    const traces = [];
    const values = new Map();
    const FakeDate = class extends Date {
        static now() { return now; }
    };
    const cta = {
        closest: () => null,
        getAttribute: (name) => name === 'href' ? '/app' : null,
        click: () => { clicked += 1; }
    };
    const document = {
        readyState: 'complete',
        title: 'Spotify - Web Player',
        body: { childElementCount: 1 },
        documentElement: null,
        querySelector: (selector) => selector.indexOf('web-player-link') >= 0 ? cta : null,
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    const window = {
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        location: {
            hostname: 'open.spotify.com',
            pathname: '/intl-fr/',
            href: 'https://open.spotify.com/intl-fr/',
            assign: (target) => assigned.push(target)
        },
        localStorage: {
            getItem: (key) => values.has(key) ? values.get(key) : null,
            setItem: (key, value) => values.set(key, value)
        },
        AndBridge: {
            logDiagEvent: (line) => traces.push(line),
            loadWebPlayerUrl: (target) => loaded.push(target)
        },
        addEventListener: () => {},
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        },
        clearTimeout: () => {}
    };

    vm.runInNewContext(script, { window, document, URL, Date: FakeDate });
    assert.equal(window.__sfNativeUiShellCompleted, true);
    assert.equal(window.__sfNativeUiShellErrors, 0);
    const recoveryTimer = timers.find((timer) => timer.delay === 2600);
    assert.ok(recoveryTimer, 'the page gets its grace period before navigating');

    now += 2600;
    recoveryTimer.callback();

    assert.equal(clicked, 0, 'the page CTA is never activated programmatically');
    assert.deepEqual(loaded, ['https://open.spotify.com/app'], 'recovery is loaded directly by the app WebView');
    assert.deepEqual(assigned, [], 'recovery never resolves a Spotify App Link outside the app');
    assert.ok(traces.includes('player-cta found; web navigation only'));
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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

    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });

    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'home');
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Fallback track',
        subtitle: 'Artist name',
        section: '',
        image: '',
        uri: 'spotify:track:track99',
        __sfHomeCorrelationId: 1
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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

    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });

    assert.equal(calls.length, 1);
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Saved mix',
        subtitle: 'Playlist',
        section: 'Vos playlists',
        image: 'https://i.scdn.co/image/saved',
        uri: 'spotify:playlist:saved123',
        __sfHomeCorrelationId: 1
    }]);
});

test('localized Spotify /app Home route still collects and sends Home rows', () => {
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        location: {
            hostname: 'open.spotify.com',
            pathname: '/intl-fr/app',
            href: 'https://open.spotify.com/intl-fr/app',
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

    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });

    assert.deepEqual(routes, ['home']);
    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'home');
    assert.deepEqual(JSON.parse(calls[0].data), [{
        title: 'Sélection du jour',
        subtitle: 'Playlist',
        section: 'Vos playlists',
        image: 'https://i.scdn.co/image/fr-cover',
        uri: 'spotify:playlist:fr123',
        __sfHomeCorrelationId: 1
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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

    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });

    assert.deepEqual(routes, ['detail']);
    assert.equal(readyCount, 1);
    assert.deepEqual(calls.map((call) => call.screen), ['screen-title', 'detail'],
        'detail content is sent only to the detail screen; no synthetic Home payload is emitted');
    assert.equal(calls[0].data, 'A playlist');
    assert.deepEqual(JSON.parse(calls[1].data), [{
        title: 'A track',
        subtitle: 'An artist',
        section: '',
        image: '',
        uri: 'spotify:track:track123'
    }]);
    assert.equal(calls.length, 2, 'no Home payload is sent while a detail route is open');
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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

    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });

    assert.deepEqual(routes, ['search']);
    assert.deepEqual(calls.map((call) => call.screen), ['initial-search']);
    assert.equal(calls[0].data, 'Jazz Funk');
    assert.equal(calls.some((call) => call.screen === 'home'), false,
        'the search route does not receive a synthetic Home payload');
});

test('bundled native bootstrap activates the shell, sends Home rows, and only opens Spotify links', () => {
    const script = read('scripts/native_ui_shell.source.js');
    const calls = [];
    const assigned = [];
    const loaded = [];
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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
            onNativeUiRoute: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            loadWebPlayerUrl: (url) => loaded.push(url)
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
        uri: 'spotify:playlist:abc123',
        __sfHomeCorrelationId: 1
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
    assert.equal(loaded.pop(), 'https://open.spotify.com/track/track123');
    assert.deepEqual(assigned, [], 'Spotify content navigation stays in the existing WebView');
    assert.equal(window.__sfNativeOpenUri('https://example.org/track/track123'), false);
    assert.equal(window.__sfNativeRequestHome(), true);
    assert.equal(calls.length, 2, 'requesting Home should resend current rows');
    assert.equal(timers.length, 0, 'a signed-in page with a ready bridge should not keep retry timers');
});

test('Home cards with sibling artwork outside the title anchor still resolve their cover image', () => {
    const script = read('scripts/native_ui_shell.source.js');
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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
        uri: 'spotify:episode:ep123',
        __sfHomeCorrelationId: 1
    }]);
});

test('Home separates user playlists from Spotify official recommendations and prevents false playing state', () => {
    const script = read('scripts/native_ui_shell.source.js');
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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
    assert.equal(rows[0].section, 'Vos playlists');
    assert.equal(rows[1].title, 'Ma Playlist Perso');
    assert.equal(rows[1].section, 'Vos playlists');
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
    const shell = read('scripts/native_ui_shell.source.js');
    const bridge = read('scripts/spotify_bridge.source.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const watcher = read('smali/com/melodix/music/NativeSearchWatcher.smali');

    const showNative = activity.match(/\.method public final showNativeUi\(\)V([\s\S]*?)\.end method/);
    assert.ok(showNative, 'showNativeUi exists');
    assert.doesNotMatch(showNative[1], /sput-boolean [^,]+, Lcom\/melodix\/music\/AppSingleton;->(?:l|startupDone):Z/,
        'a show request cannot pre-claim player/UI readiness before visibility checks');
    assert.match(activity, /\.method public final completeNativeUiVisibility\(Z\)Z[\s\S]*?hasMeasuredVisibleNativeHomeContent\(\)Z[\s\S]*?sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->l:Z[\s\S]*?AppSingleton;->startupDone:Z/,
        'readiness flags follow the measured visible Home-content confirmation');
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

test('native settings replace the web sheet and distinguish Spotify, local preferences, diagnostics, and unavailable features', () => {
    const shell = read('scripts/native_ui_shell.source.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const factory = read('smali/com/melodix/music/NativeSettingsRowFactory.smali');

    assert.match(shell, /window\.__sfRequestSpotifySettings/);
    assert.match(shell, /window\.__sfToggleSpotifySetting/);
    assert.match(read('scripts/spotify_bridge.source.js'),
        /function syncBackgroundAudioWake\(playing\)[\s\S]*?Boolean\(playing && window\.__sfBackgroundAudioEnabled !== false\)[\s\S]*?manageTSleep\(shouldKeepAwake\)/,
        'the persisted background-audio preference controls the native sleep hold using observed playback state');
    assert.match(read('scripts/spotify_bridge.source.js'),
        /window\.manageAll = function\(play\)[\s\S]*?syncBackgroundAudioWake\(play\)/);
    assert.match(shell, /spotify:settings:shuffle/);
    assert.match(shell, /spotify:settings:repeat/);
    for (const key of ['autoplay', 'canvas', 'bg_audio']) {
        assert.ok(shell.includes(`melodix:setting:${key}`), `${key} is namespaced as a Melodix-local preference`);
    }
    for (const key of ['audio_quality', 'normalize_volume', 'data_saver', 'gapless', 'explicit']) {
        assert.doesNotMatch(shell, new RegExp(`spotify:settings:${key}`), `${key} must not be presented as an available Spotify setting`);
    }
    assert.match(shell, /Non implémenté/);
    assert.match(shell, /le résultat ne sera confirmé qu’après sa réponse/);
    assert.doesNotMatch(shell, /Bibliothèque Spotify synchronisée ✓/,
        'a request is never reported as a completed synchronization');

    assert.match(activity, /\.method public final openNativeSettings\(\)V/);
    assert.match(activity, /beginNativeSettingsLoad\(\)V/);
    assert.match(activity, /onNativeSettingsClick[\s\S]*?openNativeSettings\(\)V/);
    assert.match(activity, /"spotify:settings:"[\s\S]*?__sfToggleSpotifySetting/);
    assert.match(activity, /"melodix:setting:"[\s\S]*?__sfToggleSpotifySetting/);
    assert.match(activity, /:check_settings[\s\S]*?"Paramètres"/);
    assert.match(activity, /NativeSettingsRowFactory;->create\(Lcom\/melodix\/music\/MainActivity;Lorg\/json\/JSONObject;\)Landroid\/widget\/LinearLayout;/);
    assert.match(bridge, /nativeLogout\(\)V[\s\S]*?JavascriptInterface[\s\S]*?NativeLogoutRunnable/);
    assert.match(factory, /GradientDrawable;->setCornerRadius[\s\S]*?setTextColor\(I\)V/);
    assert.match(factory, /invoke-virtual \{v7\}, Ljava\/lang\/String;->isEmpty\(\)Z[\s\S]*?setClickable\(Z\)V[\s\S]*?setFocusable\(Z\)V[\s\S]*?NativeRowClickListener/,
        'rows with no action URI are disabled, while real settings actions remain focusable and clickable');
});

test('account greeting, avatar, and logout paths remain proof-gated and available', () => {
    const shell = read('scripts/native_ui_shell.source.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const bridge = read('smali/com/melodix/music/AndBridge.smali');
    const layout = read('res/layout/activity_main.xml');

    assert.match(shell, /if \(!libraryProvesSession\(\)\) return \{ name: '', avatar: '' \}/,
        'profile names and avatars stay hidden until the private library proof succeeds');
    assert.match(activity, /"home-greeting"[\s\S]*?"home"[\s\S]*?setText\(Ljava\/lang\/CharSequence;\)V/);
    assert.match(shell, /onNativeUiData\('home-greeting', greeting\)/);
    assert.match(bridge, /onNativeProfileImage\(Ljava\/lang\/String;\)V[\s\S]*?JavascriptInterface/);
    assert.match(shell, /AndBridge\.nativeLogout/);
    assert.match(layout, /@id\/nativeHeaderAvatar/);
});

test('native settings rows reflect real controls, keep Melodix preferences local, and never invent sync results', () => {
    const calls = [];
    const sleepCalls = [];
    const store = new Map();
    const controls = {
        'control-button-shuffle': { enabled: false, clickCount: 0 },
        'control-button-repeat': { enabled: true, clickCount: 0 }
    };
    Object.values(controls).forEach((control) => {
        control.getAttribute = (name) => name === 'aria-checked' ? String(control.enabled) : null;
        control.click = () => { control.enabled = !control.enabled; control.clickCount += 1; };
    });
    const document = {
        readyState: 'complete',
        documentElement: {},
        body: { classList: { toggle: () => {} } },
        querySelector: (selector) => {
            const match = /data-testid="([^"]+)"/.exec(selector);
            return match ? controls[match[1]] || null : null;
        },
        addEventListener: () => {}
    };
    class TestMutationObserver {
        observe() {}
    }
    const window = {
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
        __sfMediaLibStatus: 'ready',
        __sfMediaLibRawItemCount: 1,
        SF_CONFIG: { autoPlayMode: 'permanent', isCanvasDisabled: false },
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/'
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            setCanvasDisabled: () => {},
            manageTSleep: (enabled) => sleepCalls.push(enabled)
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

    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL, MutationObserver: TestMutationObserver });

    assert.equal(typeof window.__sfRequestSpotifySettings, 'function');
    calls.length = 0;
    window.__sfRequestSpotifySettings();
    assert.equal(calls.length, 1);
    assert.equal(calls[0].screen, 'settings');

    const rows = JSON.parse(calls[0].data);
    const localCanvas = rows.find((row) => row.uri === 'melodix:setting:canvas');
    const shuffleRow = rows.find((row) => row.uri === 'spotify:settings:shuffle');
    const repeatRow = rows.find((row) => row.uri === 'spotify:settings:repeat');
    const unavailable = rows.find((row) => row.title === 'Autres réglages Spotify');
    const refresh = rows.find((row) => row.title === 'Actualiser la bibliothèque');
    assert.ok(localCanvas && localCanvas.section === 'Préférences de lecture');
    assert.equal(localCanvas.settingValue, 'ON');
    assert.equal(shuffleRow.settingValue, 'OFF', 'the value comes from Spotify control-button-shuffle');
    assert.equal(repeatRow.settingValue, 'ON', 'the value comes from Spotify control-button-repeat');
    assert.equal(unavailable.settingValue, 'Non implémenté');
    assert.equal(unavailable.uri, '', 'unavailable Spotify settings cannot be clicked');
    assert.match(refresh.subtitle, /résultat ne sera confirmé qu’après sa réponse/);
    assert.doesNotMatch(rows.map((row) => row.subtitle).join('\n'), /synchronisée ✓/);
    for (const unsupported of ['audio_quality', 'normalize_volume', 'data_saver', 'gapless', 'explicit', 'resync']) {
        assert.equal(rows.some((row) => row.uri === `spotify:settings:${unsupported}`), false);
    }

    calls.length = 0;
    window.__sfToggleSpotifySetting('melodix:setting:canvas');
    const toggled = JSON.parse(calls[0].data).find((row) => row.uri === 'melodix:setting:canvas');
    assert.equal(toggled.settingValue, 'OFF');
    assert.ok(store.get('melodix_spotify_settings_v1').includes('"canvas":false'));

    window.__sfToggleSpotifySetting('melodix:setting:autoplay');
    assert.equal(window.SF_CONFIG.autoPlayMode, 'disabled',
        'the Melodix autoplay preference updates the local playback behavior');
    assert.ok(store.get('melodix_spotify_settings_v1').includes('"autoplay":false'));
    window.playing = true;
    window.__sfToggleSpotifySetting('melodix:setting:bg_audio');
    assert.equal(window.__sfBackgroundAudioEnabled, false);
    assert.ok(sleepCalls.includes(false), 'background-audio preference disables the native sleep hold');

    assert.equal(window.__sfToggleSpotifySetting('spotify:settings:shuffle'), true);
    assert.equal(controls['control-button-shuffle'].clickCount, 1,
        'the action invokes the real Spotify player control instead of flipping a local shadow value');
    calls.length = 0;
    window.__sfRequestSpotifySettings();
    const updatedShuffle = JSON.parse(calls[0].data).find((row) => row.uri === 'spotify:settings:shuffle');
    assert.equal(updatedShuffle.settingValue, 'ON');
    assert.equal(window.__sfToggleSpotifySetting('spotify:settings:audio_quality'), false);
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
    const shell = read('scripts/native_ui_shell.source.js');
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
        'c91 must leave bridge evaluation to the shell-owned verified loader'
    );
});

test('native row dispatch branches on settingValue emptiness before selecting a factory', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.lastIndexOf(':native_row_build_card');
    assert.ok(start > 0, 'the row dispatch label should exist');
    const dispatch = activity.slice(start, start + 2600);

    assert.match(dispatch, /const-string v0, "settingValue"[\s\S]*?isEmpty\(\)Z[\s\S]*?move-result v1/);
    assert.match(dispatch, /if-nez v1, :native_row_create_standard/,
        'nonempty settingValue selects a settings row; empty settingValue falls through to content');
    assert.doesNotMatch(dispatch, /if-eqz v1, :native_row_create_standard/);
    const settingsAt = dispatch.indexOf('NativeSettingsRowFactory;->create');
    const standardLabel = dispatch.lastIndexOf(':native_row_create_standard');
    const contentAt = dispatch.indexOf('NativeUiRowFactory;->create(');
    assert.ok(settingsAt > 0, 'settings rows still need the settings factory');
    assert.ok(standardLabel > settingsAt && contentAt > standardLabel);
});

test('merged Spotify card labels are split into a title and a subtitle', () => {
    const shell = read('scripts/native_ui_shell.source.js');
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

test('Home is rendered as Spotify-style cover shelves, not a flat settings list', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
    const layout = read('res/layout/activity_main.xml');

    const rowsStart = activity.indexOf('.method public final renderNativeRows(');
    const rowsBody = activity.slice(rowsStart, activity.indexOf('.end method', rowsStart));
    assert.ok(rowsStart >= 0, 'the native row renderer exists');
    assert.match(rowsBody, /const-string v1, "home"[\s\S]*?String;->equals\(Ljava\/lang\/Object;\)Z[\s\S]*?move-result v0[\s\S]*?if-eqz v0, :native_rows_list[\s\S]*?NativeHomeShelfRenderer;->render\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;\)V/,
        'only a non-Home screen branches to the flat list; Home must reach the shelf renderer');
    assert.match(renderer, /Landroid\/widget\/HorizontalScrollView;-><init>/, 'each section scrolls horizontally');
    assert.match(renderer, /Landroid\/widget\/HorizontalScrollView;->setHorizontalScrollBarEnabled/);
    assert.match(renderer, /NativeRowClickListener;-><init>/, 'shelf cards stay clickable');
    assert.match(renderer, /NativeImageLoader;->load/, 'shelf covers load Spotify CDN artwork');
    // Card width is a design token now. Assert the renderer actually asks for
    // it, and that the accessor still falls back to the historical 148 dp.
    assert.match(renderer, /NativeUiMetrics;->shelfCardWidth\(Landroid\/content\/Context;\)I/,
        'shelf card width resolves through the design tokens');
    assert.match(renderer, /NativeUiMetrics;->shelfArtHeight\(Landroid\/content\/Context;\)I/,
        'shelf covers stay square through the same token family');
    const metrics = read('smali/com/melodix/music/NativeUiMetrics.smali');
    assert.match(metrics, /shelfCardWidth[\s\S]*?const-string v0, "mel_shelf_card_width"[\s\S]*?const\/16 v1, 0x94/,
        'the card accessor keeps 148 dp as its fallback');
    assert.equal(resolveSize('@dimen/mel_shelf_card_width', loadDimens(PHONE)), 148);
    assert.equal(resolveSize('@dimen/mel_shelf_card_width', loadDimens(TABLET)), 190);
    assert.equal(resolveSize('@dimen/mel_shelf_art_height', loadDimens(TABLET)), 190,
        'tablet covers stay square');
    assert.match(renderer, /createSectionHeader/, 'every shelf keeps its section title');
    // The mini player insets come from tokens; the tablet must inset further
    // than the phone rather than reuse the phone margin.
    const miniAt = layout.indexOf('@id/nativeMiniPlayerContainer');
    const miniBlock = layout.slice(layout.lastIndexOf('<', miniAt), layout.indexOf('>', miniAt));
    const miniMargin = (qualifier) => size(miniBlock, 'layout_marginLeft', loadDimens(qualifier));
    assert.equal(miniMargin(PHONE), 8, 'the phone keeps its 8dp mini player inset');
    assert.equal(miniMargin(TABLET), 16, 'the tablet widens the mini player inset');
    assert.ok(miniMargin(TABLET) > miniMargin(PHONE), 'the tablet is not a stretched phone');
    assert.match(layout, /android:id="@id\/nativeMiniProgress"/, 'the mini player shows a progress line');
});

test('opening a playlist no longer depends on the playback bridge', () => {
    const shell = read('scripts/native_ui_shell.source.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');

    assert.match(shell, /window\.__sfOpenCollection = function\(value\)/);
    assert.match(shell, /__sfMelodixBridgeStarted === true && typeof window\.fetchMediaItems === 'function'/);
    assert.match(shell, /return window\.__sfNativeOpenUri\(uri\);/, 'navigation is the fallback when the bridge is absent');
    assert.match(shell, /openCollectionTimer = window\.setTimeout\(navigate, 6000\)/, 'a silent bridge cannot leave an empty screen');
    assert.match(shell, /cancelPendingCollectionNavigation/);

    const openRow = activity.slice(activity.indexOf('.method public final openNativeRow'));
    assert.match(openRow, /const-string v1, "window\.__sfOpenCollection"/);
    assert.doesNotMatch(openRow, /const-string v1, "window\.fetchMediaItems"/);
});

test('detail rows are collected for any playlist route, not only the first page load', () => {
    const shell = read('scripts/native_ui_shell.source.js');

    assert.match(shell, /function updateDetailRows\(mainView\)/);
    assert.match(shell, /nativeScreenForPath\(\) !== 'detail'/);
    assert.match(shell, /path !== lastDetailPath/);
    assert.match(shell, /lastDetailPath = path;/);
    assert.match(shell, /updateDetailRows\(mainView\);/);
});

test('library and search still work when the bridge never starts', () => {
    const shell = read('scripts/native_ui_shell.source.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');

    // Library tab: bridge first, real collection page otherwise.
    assert.match(shell, /window\.__sfOpenLibrary = function\(\)/);
    assert.match(shell, /__sfMelodixBridgeStarted === true && typeof window\.fetchMediaItems === 'function'/);
    // Le repli ouvre la vraie page collection via un helper partage (l ancien
    // retour immediat sur une reponse vide rendait l onglet inerte).
    assert.match(shell, /function openCollectionPage\(target\)/);
    assert.match(shell, /navigateWebPlayer\('https:\/\/open\.spotify\.com' \+ target\)/,
        'collection fallbacks load inside the app WebView');
    assert.match(shell, /openCollectionPage\('\/collection\/playlists'\)/);
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
    assert.match(factory, /if-eqz v0, :native_row_default_title/);
    assert.match(factory, /if-eqz v10, :native_row_text_column/, 'the cover loads only for a real URL');
    assert.match(factory, /if-eqz v10, :native_row_return/);
    assert.ok(
        factory.indexOf('NativeRowClickListener;-><init>') > factory.lastIndexOf('if-eqz v10, :native_row_return'),
        'the click listener is attached to rows with a URI'
    );
    assert.match(loader, /if-eqz v1, :clear_native_image/, 'a non-empty https URL is loaded, not cleared');
});

test('row taps open playlists, albums and tracks', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const openRow = activity.slice(
        activity.indexOf('.method public final openNativeRow'),
        activity.indexOf('.end method', activity.indexOf('.method public final openNativeRow'))
    );

    assert.match(openRow, /if-eqz p1, :native_row_click_done/, 'null URIs are ignored');
    assert.match(openRow, /invoke-virtual \{p1\}, Ljava\/lang\/String;->isEmpty\(\)Z\s+move-result v0\s+if-nez v0, :native_row_click_done/,
        'non-empty URIs and action identifiers continue to dispatch');
    assert.match(openRow, /const-string v2, ":playlist:"/);
    assert.match(openRow, /const-string v2, "\/collection"/);
    assert.match(openRow, /if-eqz v1, :native_open_single/, 'tracks are played by the WebView');
    assert.match(openRow, /window\.__sfOpenCollection/);
    assert.match(openRow, /window\.__sfNativeOpenUri/);
});

test('root screens hide Back while detail, player and Settings show it; the dock stays visible', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const screen = activity.slice(
        activity.indexOf('.method public final setNativeScreen'),
        activity.indexOf('.end method', activity.indexOf('.method public final setNativeScreen'))
    );

    assert.match(screen, /const-string v0, "detail"[\s\S]*?if-nez v1, :native_back_visible/);
    assert.match(screen, /const-string v0, "player"[\s\S]*?if-nez v1, :native_back_visible/);
    assert.match(screen, /const-string v0, "settings"[\s\S]*?if-eqz v1, :native_back_hidden/);
    assert.match(screen, /:native_back_hidden\s+const\/4 v1, 0x0/);
    assert.match(screen, /const v2, 0x7f090231[\s\S]*?setVisibility\(I\)V/,
        'the button is shown for secondary screens and hidden on root screens');
    assert.match(screen, /const v2, 0x7f09024c/, 'the whole mini player card is hidden on the full player');
    const dockStart = screen.lastIndexOf('\n    :native_tab_bar');
    const dock = screen.slice(dockStart, screen.indexOf('\n    :screen_title', dockStart));
    assert.match(dock, /const v2, 0x7f09024e[\s\S]*?const\/4 v3, 0x0[\s\S]*?setVisibility\(I\)V/,
        'the native bottom dock stays visible on the full player');
});

test('the compact Settings icon opens and preserves the screen to return to', () => {
    const layout = new JSDOM(read('res/layout/activity_main.xml'), { contentType: 'text/xml' }).window.document;
    const settings = layout.querySelector('[android\:id="@id/nativeSettingsButton"]');
    assert.ok(settings, 'the header has a stable native Settings control');
    assert.equal(settings.tagName, 'ImageView');
    assert.equal(settings.getAttribute('android:contentDescription'), 'Paramètres');
    assert.equal(settings.getAttribute('android:onClick'), 'onNativeSettingsClick');
    // The size is a design token now, so resolve it on both form factors
    // instead of pinning a literal that no longer appears in the layout.
    for (const qualifier of [PHONE, TABLET]) {
        const dimens = loadDimens(qualifier);
        const width = resolveSize(settings.getAttribute('android:layout_width'), dimens);
        const height = resolveSize(settings.getAttribute('android:layout_height'), dimens);
        assert.ok(width >= 48, `Settings stays a >=48dp target on ${qualifier}, got ${width}`);
        assert.equal(width, height, `the Settings target is square on ${qualifier}`);
    }
    assert.equal(resolveSize(settings.getAttribute('android:layout_width'), loadDimens(PHONE)), 48);
    assert.equal(resolveSize(settings.getAttribute('android:layout_width'), loadDimens(TABLET)), 52);

    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const open = activity.slice(
        activity.indexOf('.method public final openNativeSettings'),
        activity.indexOf('.end method', activity.indexOf('.method public final openNativeSettings'))
    );
    assert.match(activity, /onNativeSettingsClick[\s\S]*?openNativeSettings\(\)V/);
    assert.match(open, /iput-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeReturnScreen:Ljava\/lang\/String;/);
    assert.match(open, /iput-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeReturnJson:Ljava\/lang\/String;/);
    assert.match(open, /setNativeScreen\(Ljava\/lang\/String;\)V[\s\S]*?beginNativeSettingsLoad\(\)V/);
});

test('library chips and the search tab never call a bridge-only function', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const shell = read('scripts/native_ui_shell.source.js');
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
    const shell = read('scripts/native_ui_shell.source.js');
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
        // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
        __sfMediaLibSessionProofKnown: true,
        __sfMediaLibSessionProven: true,
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
    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });
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
    assert.equal(payload.duration, 200);
    assert.equal(payload.position, 42);
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
        const loaded = [];
        const window = {
            // Positive API-proof fixture only; negative auth cases are covered in p0_shell_takeover.test.js.
            __sfMediaLibSessionProofKnown: true,
            __sfMediaLibSessionProven: true,
            location: {
                hostname: 'open.spotify.com',
                pathname,
                href: 'https://open.spotify.com' + pathname,
                assign: (url) => navigations.push(url)
            },
            AndBridge: {
                onNativeUiReady: () => {},
                onNativeUiData: () => {},
                loadWebPlayerUrl: (url) => loaded.push(url)
            },
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
        vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL });
        return { window, navigations, loaded };
    };

    const onPlaylists = build('/collection/playlists');
    onPlaylists.window.__sfOpenLibrary();
    assert.deepEqual(onPlaylists.loaded, [], 'the playlists tab is already displayed');
    assert.deepEqual(onPlaylists.navigations, [], 'no external navigation occurs');

    const onAlbums = build('/collection/albums');
    onAlbums.window.__sfOpenLibraryCategory('albums');
    assert.deepEqual(onAlbums.loaded, [], 'the selected chip is already displayed');
    assert.deepEqual(onAlbums.navigations, [], 'no external navigation occurs');

    const onHome = build('/');
    onHome.window.__sfOpenLibrary();
    assert.match(onHome.loaded[0] || '', /\/collection\/playlists$/);
    assert.deepEqual(onHome.navigations, [], 'library recovery stays in the app WebView');
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
    // Slice to the end of the method: a fixed window silently broke whenever a
    // guard was added at the top (MEL-BUG-070).
    const rows = activity.slice(rowsAt, activity.indexOf('\n.end method', rowsAt));
    const searchAt = activity.indexOf('.method public final onNativeSearchClick(Landroid/view/View;)V');
    // Inspect the entire method; the haptic guard makes a fixed character window brittle.
    const search = activity.slice(searchAt, activity.indexOf('\n.end method', searchAt));
    const screenAt = activity.indexOf('.method public final setNativeScreen(Ljava/lang/String;)V');
    const screen = activity.slice(screenAt, activity.indexOf('\n.end method', screenAt));

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
    assert.match(search, /0x7f090239/);
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
    // La requete relue dans l URL n a jamais la casse/espace du texte tape:
    // une egalite exacte jetait silencieusement de vrais resultats.
    const searchBranch = apply.slice(apply.indexOf('\n    :check_search\n'), apply.indexOf('\n    :search_render\n'));
    assert.ok(searchBranch.includes('String;->trim()Ljava/lang/String;'), 'requete normalisee (trim)');
    assert.match(searchBranch, /String;->equalsIgnoreCase\(Ljava\/lang\/String;\)Z/,
        'la comparaison de la requete est insensible a la casse');
    assert.ok(!searchBranch.includes('String;->equals(Ljava/lang/Object;)Z'),
        'plus de comparaison exacte de la requete');
});

test('the bridge recovery loop is capped so a dead bridge cannot churn the launch', () => {
    // Repeated full-asset injection kept startup busy on-device. The compact
    // runtime stays capped at three attempts to avoid launch churn.
    const shell = read('scripts/native_ui_shell.source.js');
    assert.ok(/bridgeLoadAttempts < 3\b/.test(shell), 'retries capped at 3');
    assert.ok(!/bridgeLoadAttempts < 8\b/.test(shell), 'the old eight-attempt loop is gone');
});

test('a library payload is rendered even when no id was expected', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const branch = activity.slice(activity.indexOf('\n    :check_media\n', applyAt),
        activity.indexOf('\n    :media_detail\n', applyAt));
    // A null nativeExpectedId (page restored, deep link, first scrape) used to
    // fall straight to :apply_done, so the library screen stayed empty for good.
    assert.match(branch, /if-eqz v3, :media_render/, 'un identifiant absent ne jette plus le payload');
    assert.match(branch, /\n    :media_render\n/, 'le rendu a son propre label');
    assert.match(branch, /String;->equals\(Ljava\/lang\/Object;\)Z/, 'un identifiant different reste ignore');
});

test('the stage chain records the page finish and the shell injection', () => {
    const client = read('smali/c91.smali');
    // Without these marks a device report cannot separate "the page never
    // finished loading" from "the shell never ran": both looked identical.
    assert.match(client, /const-string v2, "page-finished"[\s\S]{0,120}NativeCrashGuard;->stage/,
        'la fin de chargement de page est tracee');
    assert.match(client, /const-string v5, "shell-injection-queued"[\s\S]{0,160}NativeCrashGuard;->stage/,
        'la mise en file du shell est distinguee de son execution JavaScript');
    assert.match(client, /stageLoadedAsset\(Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
        'le retour d assets non vides est trace separement');
    const finished = client.slice(client.indexOf('.method public final onPageFinished'));
    const injectAt = finished.indexOf('native_ui_shell.js');
    const stageAt = finished.indexOf('"shell-injection-queued"');
    assert.ok(injectAt > 0 && stageAt > injectAt, 'le marqueur de mise en file suit la demande d injection');
});

test('startup stages distinguish loaded assets, queued injection, JS start, bridge marker, callback, and rendered Home', () => {
    const shell = read('scripts/native_ui_shell.source.js');
    const bridge = read('scripts/spotify_bridge.source.js');
    const andBridge = read('smali/com/melodix/music/AndBridge.smali');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const traceRunnable = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');

    assert.ok(shell.includes("diagTrace('js-shell begin')"));
    assert.ok(shell.includes("diagTrace('js-shell end ok screen='"));
    assert.ok(shell.includes("diagTrace('js-shell end threw name='"));
    assert.ok(bridge.includes("__sfBridgeTrace('bridge start')"));
    assert.ok(bridge.includes("__sfBridgeTrace('bridge marker set')"));
    assert.ok(bridge.includes("__sfBridgeTrace('bridge done')"));
    assert.ok(andBridge.includes('"js-shell-start"'));
    assert.ok(andBridge.includes('"js-shell-ready"'));
    assert.ok(andBridge.includes('"bridge-marker-set"'));
    assert.ok(andBridge.includes('"bridge-read-complete"'));
    assert.ok(andBridge.includes('"shell-js-started"'));
    assert.ok(andBridge.includes('"bridge-bootstrap-ready"'));
    assert.ok(andBridge.includes('"native-ui-ready-callback-returned"'));
    assert.match(activity, /const-string v1, "home-rendered"[\s\S]{0,140}NativeCrashGuard;->stage/);
    assert.match(activity, /const-string v1, "native-shell-visible"[\s\S]{0,140}NativeCrashGuard;->stage/);
    assert.match(traceRunnable, /completeNativeUiVisibility\(Z\)Z/,
        'the final native visibility stage follows measured post-layout bounds');
});

test('a null screen or a null payload through the bridge is ignored, never applied', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.indexOf('.method public final applyNativeUiData');
    const body = activity.slice(start, activity.indexOf('.end method', start));
    const head = body.slice(0, 400);
    // The bridge is callable from the page: p1/p2 can be null, and the old code
    // reached String.equals/length with them.
    assert.match(head, /if-eqz p1, :apply_done/, 'un ecran null est ignore');
    assert.match(head, /if-eqz p2, :apply_done/, 'un corps null est ignore');
});

test('tapping Home never clears real rows before the authenticated refresh', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.indexOf('.method public final onNativeHomeClick');
    const body = activity.slice(start, activity.indexOf('.end method', start));
    assert.match(body, /setNativeScreen\(Ljava\/lang\/String;\)V/);
    assert.match(body, /__sfNativeRequestHome/);
    assert.doesNotMatch(body, /nativeCurrentScreen|renderNativeRows|\"\[\]\"|native_home_render/,
        'Home refresh reuses the existing native shelf instead of blanking it first');
});

function executeDetailDataBranch(currentScreen, title, payload) {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.indexOf('.method public final applyNativeUiData');
    const methodEnd = activity.indexOf('.end method', start);
    const body = activity.slice(start, methodEnd);
    const detailAt = body.indexOf('\n    :check_detail_data\n');
    const playerAt = body.indexOf('\n    :check_player\n', detailAt);
    assert.ok(detailAt > 0 && playerAt > detailAt, 'la branche detail est bien identifiee');
    const branch = body.slice(detailAt, playerAt) + '\n    :check_player\n';
    const instructions = [];
    const labels = new Map();
    for (const rawLine of branch.split(/\r?\n/)) {
        const line = rawLine.replace(/#.*/, '').trim();
        if (!line || line.startsWith('.')) continue;
        if (line.startsWith(':')) {
            labels.set(line.slice(1), instructions.length);
            continue;
        }
        instructions.push(line);
    }

    const state = { nativeCurrentScreen: currentScreen, nativeCurrentTitle: title, renderedRows: null };
    const registers = { p0: state, p1: 'detail', p2: payload };
    let pendingResult;
    let pc = 0;
    let steps = 0;
    while (pc < instructions.length) {
        assert.ok(++steps <= 40, 'detail branch control flow must terminate');
        const instruction = instructions[pc++];
        let match;
        if ((match = /^const-string (\w+), "([^"]*)"$/.exec(instruction))) {
            registers[match[1]] = match[2];
            continue;
        }
        if ((match = /^iget-object (\w+), p0, .*->(nativeCurrentScreen|nativeCurrentTitle):Ljava\/lang\/String;$/.exec(instruction))) {
            registers[match[1]] = state[match[2]];
            continue;
        }
        if ((match = /^invoke-virtual \{(\w+), (\w+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z$/.exec(instruction))) {
            pendingResult = registers[match[1]] === registers[match[2]] ? 1 : 0;
            continue;
        }
        if ((match = /^move-result (\w+)$/.exec(instruction))) {
            registers[match[1]] = pendingResult;
            pendingResult = undefined;
            continue;
        }
        if ((match = /^if-eqz (\w+), :([\w$.-]+)$/.exec(instruction)) ||
            (match = /^if-nez (\w+), :([\w$.-]+)$/.exec(instruction))) {
            const isZeroBranch = instruction.startsWith('if-eqz');
            const value = registers[match[1]];
            const shouldBranch = isZeroBranch ? value == null || value === 0 : value != null && value !== 0;
            if (shouldBranch) {
                if (labels.has(match[2])) pc = labels.get(match[2]);
                else if (match[2] === 'apply_done') return state;
                else throw new Error(`unreviewed external branch target :${match[2]}`);
            }
            continue;
        }
        if ((match = /^invoke-virtual \{p0, (\w+), p2\}, Lcom\/melodix\/music\/MainActivity;->renderNativeRows\(Ljava\/lang\/String;Ljava\/lang\/String;\)V$/.exec(instruction))) {
            state.renderedRows = { title: registers[match[1]], json: registers.p2 };
            continue;
        }
        if (instruction === 'return-void') return state;
        throw new Error(`Unreviewed opcode in applyNativeUiData detail branch: ${instruction}`);
    }
    return state;
}

test('a real playlist title is applied before detail rows; an empty title is ignored', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const applyEnd = activity.indexOf('.end method', applyAt);
    const body = activity.slice(applyAt, applyEnd);
    const titleAt = body.lastIndexOf('\n    :check_screen_title');
    const detailAt = body.indexOf('\n    :check_detail_data', titleAt);
    const title = body.slice(titleAt, detailAt);
    assert.match(title, /String;->isEmpty\(\)Z[\s\S]*?if-nez v1, :apply_done[\s\S]*?nativeCurrentTitle:Ljava\/lang\/String;[\s\S]*?setText/,
        'a non-empty Spotify entity title reaches the native header and is retained for row rendering');
});

test('detail payload control flow renders on detail and is dropped on every other screen', () => {
    const payload = '[{"title":"Controlled track payload","uri":"spotify:track:test-fixture"}]';
    const detail = executeDetailDataBranch('detail', 'Controlled detail title', payload);
    assert.deepEqual(detail.renderedRows, { title: 'Controlled detail title', json: payload },
        'a playlist tap sets detail before the rows callback, which must render on that screen');

    const home = executeDetailDataBranch('home', 'Accueil', payload);
    assert.equal(home.renderedRows, null, 'playlist tracks must never replace the Home shelf');
    const uninitialized = executeDetailDataBranch(null, 'Détails', payload);
    assert.equal(uninitialized.renderedRows, null, 'a missing current route is ignored');
});

test('a playlist tap always lands on a non-empty detail payload path', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const start = activity.indexOf('.method public final openNativeRow');
    const body = activity.slice(start, activity.indexOf('.end method', start));
    // The row handler must set the screen to detail and ask the shell to open
    // the collection, otherwise no detail payload can ever arrive.
    assert.match(body, /const-string v1, "detail"[\s\S]{0,200}setNativeScreen/);
    assert.match(body, /window\.__sfOpenCollection/);
});

test('the launch marker leaves the branded window alone instead of painting debug text', () => {
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const start = guard.indexOf('.method public static showLaunchMarker');
    const body = guard.slice(start, guard.indexOf('.end method', start));
    // The theme paints the brand before this runs; a black screen with
    // "Melodix diag-6" replaced it on every launch.
    // Target the instruction, not the comment that explains why it is gone.
    assert.doesNotMatch(body, /const-string v\d+, "Melodix diag/,
        'aucun texte de developpement a l ecran');
    assert.doesNotMatch(body, /setContentView/, 'le marqueur ne remplace plus la fenetre');
    assert.doesNotMatch(body, /setBackgroundColor/, 'aucun fond noir impose par le marqueur');
    // The diagnostic value survives: the stage chain proves the activity got here.
    assert.match(body, /const-string v0, "launch-marker"[\s\S]{0,120}NativeCrashGuard;->stage/);
    assert.match(body, /if-eqz p0, :done/, 'la garde d argument reste la premiere instruction');
});

test('page-finished delegates to verification, never unlocks native home on a path alone', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const gate = read('smali/com/melodix/music/NativeSessionGate.smali');
    assert.match(activity, /onWebViewPageFinished\(\)V[\s\S]*?NativeSessionGate;->pageFinished/);
    assert.match(gate, /pageFinished\([\s\S]*?open.spotify.com[\s\S]*?nativeLoginWebRequested:Z[\s\S]*?->verify/);
    assert.match(activity, /showNativeUiFrom\([\s\S]*?NativeSessionGate;->blocked/);
    assert.doesNotMatch(gate, /removeAllCookies|deleteAllData/);
});

test('login Web ownership is explicit and verification must complete before private home', () => {
    const gate = read('smali/com/melodix/music/NativeSessionGate.smali');
    assert.match(gate, /blocked\([\s\S]*?loginActive:Z[\s\S]*?applySessionLoginSurface/);
    assert.match(gate, /result\([\s\S]*?"token"[\s\S]*?"libraryOk"[\s\S]*?token-and-library-ok/);
    assert.match(gate, /navigateLogin\([\s\S]*?nativeLoginPageCommitted:Z/);
});

test('settings page distinguishes connecté / expirée / réseau / non connecté, honestly', () => {
    const buildWindow = (over) => {
        const calls = [];
        const controls = {
            'control-button-shuffle': { enabled: false },
            'control-button-repeat': { enabled: false }
        };
        Object.values(controls).forEach((c) => {
            c.getAttribute = (n) => n === 'aria-checked' ? String(c.enabled) : null;
            c.click = () => {};
        });
        const document = {
            readyState: 'complete',
            documentElement: {},
            body: { classList: { toggle: () => {} } },
            querySelector: (sel) => {
                const m = /data-testid="([^"]+)"/.exec(sel);
                return m ? controls[m[1]] || null : null;
            },
            addEventListener: () => {}
        };
        class TestMutationObserver { observe() {} }
        const window = Object.assign({
            SF_CONFIG: { autoPlayMode: 'permanent', isCanvasDisabled: false },
            location: { hostname: 'open.spotify.com', pathname: '/', href: 'https://open.spotify.com/' },
            AndBridge: { onNativeUiReady: () => {}, onNativeUiData: (k, d) => calls.push({ k, d }), setCanvasDisabled: () => {}, manageTSleep: () => {} },
            MutationObserver: TestMutationObserver,
            addEventListener: () => {},
            setTimeout: () => 1,
            clearTimeout: () => {},
            localStorage: { getItem: () => null, setItem: () => {}, clear: () => {} }
        }, over);
        return { window, document, calls, TestMutationObserver };
    };
    const run = (over) => {
        const { window, document, calls, TestMutationObserver } = buildWindow(over);
        vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL, MutationObserver: TestMutationObserver });
        calls.length = 0;
        window.__sfRequestSpotifySettings();
        return JSON.parse(calls[0].d);
    };
    const state = (rows) => rows.find((r) => r.title === 'État de la connexion Spotify');

    // 1. Connecté (preuve libraryV3) : jamais de faux statut, action déconnexion réelle.
    let rows = run({ __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: true, __sfMediaLibStatus: 'ready', __sfMediaLibRawItemCount: 3 });
    assert.equal(state(rows).settingValue, 'Connecté');
    assert.equal(state(rows).uri, '', 'no action on a confirmed connection');
    assert.equal(rows.find((r) => r.title === 'Se déconnecter de Spotify').uri, 'spotify:settings:logout');
    const accountOk = rows.find((r) => r.section === 'Compte et connexion' && /Compte/.test(r.title));
    assert.equal(accountOk.title, 'Compte non identifié', 'no fabricated account name without a widget');
    assert.equal(accountOk.settingValue, 'Confirmé', 'the session proof is the confirmation, not the name');

    // 2. Session expirée (401) : état distinct + renouvellement réel.
    rows = run({ __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'http-401' });
    assert.equal(state(rows).settingValue, 'Renouveler la session');
    assert.equal(state(rows).uri, 'melodix:action:open-login');
    assert.match(state(rows).subtitle, /HTTP 401/);
    assert.match(state(rows).subtitle, /sans être prouvée/, 'a 401 must not be asserted as an expired session');

    // 3. Erreur réseau : état distinct + réessayer réel, pas de "connecté".
    rows = run({ __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'network-error' });
    assert.equal(state(rows).settingValue, 'Réessayer');
    assert.equal(state(rows).uri, 'melodix:action:retry-library');
    assert.match(state(rows).subtitle, /Erreur réseau/);

    // 4. Non connecté : connexion proposée, aucun statut inventé.
    rows = run({ __sfMediaLibStatus: 'absent' });
    assert.equal(state(rows).settingValue, 'Se connecter');
    assert.equal(state(rows).uri, 'melodix:action:open-login');
    const account = rows.find((r) => r.section === 'Compte et connexion' && /Compte/.test(r.title));
    assert.equal(account.title, 'Compte non identifié', 'no fabricated account name');
    assert.match(account.subtitle, /aucune donnée n’est inventée/);

    // 5. Sections demandées présentes, notifications = vraie action système.
    for (const section of ['Compte et connexion', 'Spotify', 'Apparence et thème', 'Préférences de lecture', 'Notifications']) {
        assert.ok(rows.some((r) => r.section === section), `section manquante: ${section}`);
    }
    const notif = rows.find((r) => r.section === 'Notifications');
    assert.equal(notif.uri, 'melodix:action:open-notifications');
    assert.equal(notif.settingValue, 'Réglages système');
    const theme = rows.find((r) => r.section === 'Apparence et thème');
    assert.match(theme.title, /Thème/);
    assert.equal(theme.uri, '', 'the theme row is information only, not a fake toggle');
    // Aucun jeton/scope inventé.
    assert.doesNotMatch(rows.map((r) => r.title + r.subtitle).join('\n'), /user-read-private|playlist-read-private|token/i);
});

test('native side: notifications action opens the real system screen, and the About section carries the real version', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const at = activity.indexOf('.method public final openNativeRow');
    const row = activity.slice(at, activity.indexOf('.end method', at));
    const code = row.split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
    const notifAt = code.indexOf('"melodix:action:open-notifications"');
    assert.ok(notifAt !== -1, 'openNativeRow must dispatch the notifications action');
    assert.match(code.slice(notifAt), /openNativeNotificationSettings\(\)V/);

    const notif = activity.slice(activity.indexOf('.method public final openNativeNotificationSettings'),
        activity.indexOf('.end method', activity.indexOf('.method public final openNativeNotificationSettings')));
    assert.match(notif, /android\.settings\.APP_NOTIFICATION_SETTINGS/);
    assert.match(notif, /Uri;->fromParts/);
    assert.match(notif, /startActivity\(Landroid\/content\/Intent;\)V/);
    assert.match(notif, /\.catch Ljava\/lang\/Throwable;/, 'a failed intent must not crash the row click');

    const about = activity.slice(activity.indexOf('.method private final appendNativeAboutRows'),
        activity.indexOf('.end method', activity.indexOf('.method private final appendNativeAboutRows')));
    assert.match(about, /getPackageManager\(\)Landroid\/content\/pm\/PackageManager;/);
    assert.match(about, /getPackageInfo\(Ljava\/lang\/String;I\)Landroid\/content\/pm\/PackageInfo;/);
    assert.match(about, /PackageInfo;->versionName:Ljava\/lang\/String;/);
    assert.match(about, /PackageInfo;->versionCode:I/);
    assert.match(about, /"Informations sur Melodix"/);
    assert.match(about, /Données sensibles/);
    // Repli propre: en cas d'échec, le payload d'origine est renvoyé tel quel.
    assert.match(about, /:about_catch[\s\S]*?return-object p1/);
    // Le payload settings passe par appendNativeAboutRows avant le rendu.
    const applyAt = activity.indexOf('.method public final applyNativeUiData');
    const apply = activity.slice(applyAt, activity.indexOf('.end method', applyAt));
    const settingsBlock = apply.slice(apply.indexOf('const-string v3, "settings"'));
    assert.match(settingsBlock, /appendNativeAboutRows\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
    assert.ok(settingsBlock.indexOf('appendNativeAboutRows') < settingsBlock.indexOf('renderNativeRows'),
        'the About rows are appended BEFORE rendering');
});

test('settings timeout renders a real local fallback (connect + notifications + about), never a dead end', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const at = activity.indexOf('.method public final onNativeSettingsTimeout');
    const body = activity.slice(at, activity.indexOf('.end method', at));
    const code = body.split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
    // The fallback always offers the real connect + notifications actions.
    const fallback = code;
    assert.match(fallback, /melodix:action:open-login/);
    assert.match(fallback, /melodix:action:open-notifications/);
    assert.match(fallback, /Aucune session confirmée/);
    assert.match(fallback, /melodix:action:retry-settings/, 'retrying the WebView stays possible');
    // The About rows (real version) are appended to the fallback too.
    assert.match(code, /appendNativeAboutRows\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
    assert.ok(code.indexOf('appendNativeAboutRows') < code.indexOf('renderNativeRows'),
        'About rows are appended before the fallback renders');
    // No fabricated "connected" claim in the fallback.
    assert.doesNotMatch(fallback, /"settingValue\":\"Connecté\"/);
});

test('the Home connection card is actionable in every state, not just on error', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    // Loading state (session unproven, verification in progress) must carry the
    // real connect action too: an identifiable connection state with a pertinent
    // action, without blocking the local shortcuts.
    // In the smali source the JSON quotes are escaped: use plain indexOf.
    const li = activity.indexOf('Connexion à Spotify…');
    assert.ok(li !== -1, 'the loading home payload exists');
    const lStart = activity.lastIndexOf('const-string', li);
    const lEnd = activity.indexOf('"]', li);
    const loadingPayload = activity.slice(lStart, lEnd);
    assert.ok(loadingPayload.includes('melodix:action:open-login'),
        'the loading connection card must offer the real connect action');
    // The unproven/error state keeps its connect action as well.
    const ei = activity.indexOf('Connexion Spotify non confirmée');
    assert.ok(ei !== -1, 'the unproven error payload exists');
    const eStart = activity.lastIndexOf('const-string', ei);
    const eEnd = activity.indexOf('"]', ei);
    assert.ok(activity.slice(eStart, eEnd).includes('melodix:action:open-login'));
    // The status renderer maps the action to a real label and dispatches it.
    const shelf = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
    assert.match(shelf, /"melodix:action:open-login"[\s\S]*?"Se connecter"/);
    // MEL-BUG-038: the "Explorer Melodix" shortcut grid was removed on user
    // request — the status branch must NOT render it anymore.
    assert.doesNotMatch(shelf, /NativeShortcutGrid;->render/);
});

test('settings connection state covers the full incident scenario matrix', () => {
  // The 10 incident scenarios, mapped to the real signals the page observes.
  // Every expectation is derived from libraryV3 proof / error, never asserted.
  const buildWindow = (over) => {
    const calls = [];
    const document = {
      readyState: 'complete', documentElement: {}, body: { classList: { toggle: () => {} } },
      querySelector: () => null, addEventListener: () => {}
    };
    class TestMutationObserver { observe() {} }
    const window = Object.assign({
      SF_CONFIG: { autoPlayMode: 'permanent', isCanvasDisabled: false },
      location: { hostname: 'open.spotify.com', pathname: '/', href: 'https://open.spotify.com/' },
      AndBridge: { onNativeUiReady: () => {}, onNativeUiData: (k, d) => calls.push({ k, d }), setCanvasDisabled: () => {}, manageTSleep: () => {} },
      MutationObserver: TestMutationObserver, addEventListener: () => {},
      setTimeout: () => 1, clearTimeout: () => {},
      localStorage: { getItem: () => null, setItem: () => {}, clear: () => {} }
    }, over);
    return { window, document, calls, TestMutationObserver };
  };
  const rowsFor = (over) => {
    const { window, document, calls, TestMutationObserver } = buildWindow(over);
    vm.runInNewContext(read('scripts/native_ui_shell.source.js'), { window, document, URL, MutationObserver: TestMutationObserver });
    calls.length = 0;
    window.__sfRequestSpotifySettings();
    return JSON.parse(calls[0].d);
  };
  const conn = (rows) => rows.find((r) => r.title === 'État de la connexion Spotify');

  const scenarios = [
    ['première connexion / session absente', { __sfMediaLibStatus: 'absent' }, 'Se connecter', 'melodix:action:open-login'],
    ['authentification en cours', { __sfMediaLibStatus: 'loading' }, 'Vérification…', ''],
    ['connexion réussie (preuve libraryV3)', { __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: true, __sfMediaLibStatus: 'ready', __sfMediaLibRawItemCount: 5 }, 'Connecté', ''],
    ['session refusée 401 (renouveler)', { __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'http-401' }, 'Renouveler la session', 'melodix:action:open-login'],
    ['accès refusé 403', { __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'http-403' }, 'Renouveler la session', 'melodix:action:open-login'],
    ['erreur réseau', { __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'network-error' }, 'Réessayer', 'melodix:action:retry-library'],
    ['délai dépassé', { __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'timeout' }, 'Réessayer', 'melodix:action:retry-library'],
    ['jeton absent (non connecté)', { __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'error', __sfMediaLibError: 'token-missing' }, 'Se connecter', 'melodix:action:open-login']
  ];
  for (const [name, over, value, uri] of scenarios) {
    const c = conn(rowsFor(over));
    assert.ok(c, `scénario "${name}": ligne d'état présente`);
    assert.equal(c.settingValue, value, `scénario "${name}"`);
    assert.equal(c.uri, uri, `scénario "${name}" action`);
  }
  // Déconnexion volontaire puis reconnexion: après déconnexion la preuve est
  // retirée -> on retombe sur "non connecté", jamais sur un faux "Connecté".
  const afterLogout = rowsFor({ __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: false, __sfMediaLibStatus: 'absent' });
  assert.equal(conn(afterLogout).settingValue, 'Se connecter');
  assert.equal(rowsFor({ __sfMediaLibSessionProofKnown: true, __sfMediaLibSessionProven: true, __sfMediaLibStatus: 'ready', __sfMediaLibRawItemCount: 5 })
    .find((r) => r.title === 'Se déconnecter de Spotify').uri, 'spotify:settings:logout');
  // Aucune ligne ne prétend jamais "synchronisé" sans preuve.
  const all = rowsFor({ __sfMediaLibStatus: 'loading' });
  assert.doesNotMatch(JSON.stringify(all), /synchronis/i);
});

test('the native status card shows one sentence and hides the machine string behind a disclosure', () => {
    const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
    const toggle = read('smali/com/melodix/music/NativeHomeShelfRenderer$DetailsToggle.smali');

    // No more full-size red monospace error line inside the card.
    assert.doesNotMatch(renderer, /MelColors;->warning:I[\s\S]{0,200}MONOSPACE/,
        'the raw diagnostic is no longer painted full size in red monospace');
    assert.doesNotMatch(renderer, /createHomeStatusText\(Landroid\/content\/Context;Ljava\/lang\/String;IZF\)Landroid\/widget\/TextView;[\s\S]{0,40}0x41800000/,
        'the 16sp technical line is gone');

    // The disclosure exists, is closed by default, and is 12sp/secondary.
    assert.match(renderer, /addHomeStatusDetails\(Lcom\/melodix\/music\/MainActivity;Landroid\/widget\/LinearLayout;Ljava\/lang\/String;\)V/);
    const details = renderer.match(/\.method private static addHomeStatusDetails[\s\S]*?\.end method/)[0];
    assert.match(details, /"D\\u00e9tails techniques"/, 'the toggle reads "Détails techniques"');
    assert.match(details, /const\/16 v4, 0x8\s*\n\s*invoke-virtual \{v3, v4\}, Landroid\/view\/View;->setVisibility\(I\)V/,
        'the panel starts hidden (View.GONE)');
    assert.match(details, /const\/high16 v4, 0x41400000/, 'the detail text is 12sp');
    assert.match(details, /MelColors;->textSecondary:I[\s\S]{0,220}0x41400000/, 'and uses the secondary colour, not red');
    assert.match(details, /"Copier le diagnostic"/, 'the copy action is present');
    const copyAction = read('smali/com/melodix/music/NativeHomeShelfRenderer$CopyDiagnosticAction.smali');
    assert.match(copyAction, /MainActivity;->onNativeDiagCopyClick\(Landroid\/view\/View;\)V/,
        'and reuses the single existing copy path');
    assert.match(details, /NativeHomeShelfRenderer\$CopyDiagnosticAction;-><init>\(Lcom\/melodix\/music\/MainActivity;\)V/);
    assert.doesNotMatch(details, /MelColors;->warning:I/, 'the disclosure must never use the warning colour');

    // Touch targets: the toggle and the copy button are both >= 44dp tall.
    assert.match(details, /NativeUiMetrics;->statusActionHeight\(Landroid\/content\/Context;\)I[\s\S]{0,80}setMinimumHeight/);
    // Opening never re-inflates: it flips visibility on the two text views.
    assert.match(toggle, /getVisibility\(\)I/);
    assert.match(toggle, /setVisibility\(I\)V[\s\S]*setVisibility\(I\)V/);
    assert.doesNotMatch(toggle, /removeAllViews|inflate|renderHomeStatus/);
    // The optional animation is resolved by name and guarded against 0.
    assert.match(toggle, /NativeUiRowFactory;->animId\(Landroid\/content\/Context;Ljava\/lang\/String;\)I/);
    assert.match(toggle, /if-nez v2, :no_anim/);
    assert.doesNotMatch(toggle, /const v2, 0x7f01/);
});

test('the disclosure animation stays inside the frame budget', () => {
    const xml = read('res/anim/mel_disclosure_expand.xml');
    const durations = [...xml.matchAll(/android:duration="(\d+)"/g)].map((m) => Number(m[1]));
    assert.ok(durations.length >= 1);
    for (const d of durations) assert.ok(d <= 150, `duration ${d}ms is short enough not to block a tap`);
    assert.match(xml, /android:fillAfter="true"/);
    assert.doesNotMatch(xml, /layoutAnimation|setVisibility/, 'it animates alpha/transform, never layout');
});
