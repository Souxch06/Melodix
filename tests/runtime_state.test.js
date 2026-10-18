const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const runtime = require('../assets/runtime_state.js');

const repo = path.resolve(__dirname, '..');
const read = (relativePath) => fs.readFileSync(path.join(repo, relativePath), 'utf8');

test('public home/login CTA is signed out, never authenticated', () => {
    const transitions = [];
    const machine = runtime.createAuthStateMachine((state) => transitions.push(state));

    assert.equal(machine.observe({ loginAction: true }), runtime.AUTH_STATE.SIGNED_OUT);
    assert.equal(machine.getConfirmedState(), runtime.AUTH_STATE.SIGNED_OUT);
    assert.deepEqual(transitions, [runtime.AUTH_STATE.SIGNED_OUT]);

    // A generic public homepage with no player/account evidence remains unknown.
    const freshMachine = runtime.createAuthStateMachine();
    assert.equal(freshMachine.observe({}), runtime.AUTH_STATE.UNKNOWN);
    assert.equal(freshMachine.getConfirmedState(), runtime.AUTH_STATE.UNKNOWN);
});

test('login and public routes override any ambiguous positive-looking UI', () => {
    assert.equal(
        runtime.classifyAuthSignals({
            accountsPage: true,
            profileControl: true,
            playerControls: true
        }),
        runtime.AUTH_STATE.SIGNED_OUT
    );
    assert.equal(
        runtime.classifyAuthSignals({
            loginRoute: true,
            profileControl: true,
            playerControls: true
        }),
        runtime.AUTH_STATE.SIGNED_OUT
    );
    assert.equal(
        runtime.classifyAuthSignals({ profileControl: true }),
        runtime.AUTH_STATE.UNKNOWN
    );
});

test('expired session transitions from confirmed player UI to signed out once', () => {
    const transitions = [];
    const machine = runtime.createAuthStateMachine((state) => transitions.push(state));

    assert.equal(machine.observe({ profileControl: true, playerControls: true }), runtime.AUTH_STATE.SIGNED_IN);
    assert.equal(machine.observe({}), runtime.AUTH_STATE.UNKNOWN);
    assert.equal(machine.getConfirmedState(), runtime.AUTH_STATE.SIGNED_IN);
    assert.equal(machine.observe({ accountsPage: true }), runtime.AUTH_STATE.SIGNED_OUT);
    assert.equal(machine.observe({ accountsPage: true }), runtime.AUTH_STATE.SIGNED_OUT);
    assert.deepEqual(transitions, [runtime.AUTH_STATE.SIGNED_IN, runtime.AUTH_STATE.SIGNED_OUT]);

    // A new process/page starts unconfirmed; a persisted legacy flag is not an input.
    const restartedMachine = runtime.createAuthStateMachine();
    assert.equal(restartedMachine.getState(), runtime.AUTH_STATE.UNKNOWN);
    assert.equal(
        restartedMachine.observe({ profileControl: true, playerControls: true }),
        runtime.AUTH_STATE.SIGNED_IN
    );
});

test('official login return is confirmed only by account and player UI together', () => {
    const transitions = [];
    const machine = runtime.createAuthStateMachine((state) => transitions.push(state));

    assert.equal(machine.observe({ accountsPage: true }), runtime.AUTH_STATE.SIGNED_OUT);
    assert.equal(machine.observe({ profileControl: true }), runtime.AUTH_STATE.UNKNOWN);
    assert.equal(machine.observe({ playerControls: true }), runtime.AUTH_STATE.UNKNOWN);
    assert.equal(machine.observe({ profileControl: true, playerControls: true }), runtime.AUTH_STATE.SIGNED_IN);
    assert.deepEqual(transitions, [runtime.AUTH_STATE.SIGNED_OUT, runtime.AUTH_STATE.SIGNED_IN]);
});

test('unknown state after previously signed-out UI still reaches the unconfirmed notice', () => {
    const machine = runtime.createAuthStateMachine();
    machine.observe({ loginAction: true });
    assert.equal(machine.getConfirmedState(), runtime.AUTH_STATE.SIGNED_OUT);
    assert.equal(machine.observe({}), runtime.AUTH_STATE.UNKNOWN);
    assert.equal(runtime.shouldShowUnconfirmedNotice(machine.getState()), true);
    assert.equal(runtime.shouldShowUnconfirmedNotice(runtime.AUTH_STATE.SIGNED_OUT), false);
    assert.equal(runtime.shouldShowUnconfirmedNotice(runtime.AUTH_STATE.SIGNED_IN), false);

    const bridge = read('assets/spotify_bridge.js');
    assert.match(bridge, /runtime\.shouldShowUnconfirmedNotice\(machine\.getState\(\)\)/);
    assert.doesNotMatch(bridge, /machine\.getConfirmedState\(\) === runtime\.AUTH_STATE\.SIGNED_OUT/);
});

test('drawer state is closed initially and toggles deterministically', () => {
    const drawer = runtime.createDrawerState();
    assert.equal(drawer.isOpen(), false);
    assert.equal(drawer.toggle(), true);
    assert.equal(drawer.isOpen(), true);
    assert.equal(drawer.setOpen(false), false);
    assert.equal(drawer.toggle(), true);

    const bridge = read('assets/spotify_bridge.js');
    const switchStart = bridge.indexOf('window.switchLs = function(forceExpanded)');
    const switchStateWrite = bridge.indexOf('window.__sfLibraryExpanded = expanded;', switchStart);
    const noSidebarGuard = bridge.indexOf('if (!ls)', switchStart);
    assert.ok(switchStart >= 0 && switchStateWrite > switchStart && noSidebarGuard > switchStateWrite);
    assert.match(bridge, /if \(window\.__sfDrawerState\) window\.__sfDrawerState\.setOpen\(false\)/);
    assert.match(bridge, /window\.switchLs\(false\)/);
    assert.match(bridge, /function closeLibraryDrawer\(\)[\s\S]*?window\.lBtn\.setAttribute\('aria-expanded', 'false'\)/);
    assert.match(bridge, /closeLibraryDrawer\(\);\s*activateRoute\(kind\)/);
    assert.match(bridge, /const safeTop = 'max\(var\(--sf-safe-area-top, 0px\), env\(safe-area-inset-top, 0px\), 24px\)'/);
    assert.match(bridge, /env\(safe-area-inset-bottom, 0px\)/);
});

test('unknown-session notice is in document flow, not over primary UI', () => {
    const bridge = read('assets/spotify_bridge.js');
    const css = read('assets/css_hacks.css');

    assert.match(bridge, /mainView\.insertBefore\(notice, mainView\.firstChild\)/);
    assert.match(bridge, /sf-auth-status-body-root/);
    assert.match(css, /#sf-auth-status\s*\{[^}]*position:\s*relative/);
    assert.doesNotMatch(css, /#sf-auth-status\s*\{[^}]*position:\s*fixed/);
});

test('official account host resets stale state without clearing WebView session data', () => {
    const webViewClient = read('smali/c91.smali');
    const app = read('smali/com/melodix/music/AppSingleton.smali');

    assert.match(webViewClient, /const-string v2, "accounts\.spotify\.com"/);
    assert.match(webViewClient, /sput-boolean v2, Lcom\/melodix\/music\/AppSingleton;->B:Z/);
    assert.match(webViewClient, /const-string v4, "LoggedIn"/);
    assert.doesNotMatch(webViewClient, /CookieManager;->removeAllCookies|WebStorage;->deleteAllData/);
    assert.doesNotMatch(app, /const-string[^\n]*"LoggedIn"/);
});

test('startup never trusts a persisted LoggedIn flag and starts auth unconfirmed', () => {
    const app = read('smali/com/melodix/music/AppSingleton.smali');
    const mainActivity = read('smali/com/melodix/music/MainActivity.smali');

    assert.equal(app.includes('"LoggedIn"'), false);
    assert.equal(app.includes('sput-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z'), true);
    assert.match(mainActivity, /AppSingleton;->B:Z/);
});

test('auth and WebView code do not capture credentials or proxy Spotify requests', () => {
    const bridge = read('assets/spotify_bridge.js');
    const nativeBridge = read('smali/com/melodix/music/AndBridge.smali');
    const webViewClient = read('smali/c91.smali');
    const app = read('smali/com/melodix/music/AppSingleton.smali');
    const appWebView = read('smali/m9.smali');
    const assetLoader = read('smali/c40.smali');

    assert.doesNotMatch(bridge, /spot_auth_token|spot_cli_token|Client-Token|pathfinder\/v2\/query|connect-state|AndBridge\.nativeFetch/);
    assert.doesNotMatch(bridge, /window\.fetch\s*=/);
    assert.doesNotMatch(bridge, /location\.replace\s*\(/);
    assert.doesNotMatch(bridge, /web-player-link[^\n]*\.click\s*\(/);
    assert.match(bridge, /hasAccountIdentity/);
    assert.match(bridge, /window\.location\.assign\(target\)/);
    assert.match(nativeBridge, /Native Spotify request proxy disabled/);
    assert.doesNotMatch(nativeBridge, /CookieManager;->getCookie|CookieManager;->setCookie|CookieManager;->removeAllCookies/);
    assert.doesNotMatch(webViewClient, /CookieManager;->getCookie|CookieManager;->setCookie|openConnection|Access-Control-Allow-Origin/);
    assert.doesNotMatch(webViewClient, /prompt=select_account/);
    assert.match(webViewClient, /invoke-super \{p0, p1, p2\}, Landroid\/webkit\/WebViewClient;->shouldOverrideUrlLoading/);
    assert.match(webViewClient, /Uri;->getScheme\(\)Ljava\/lang\/String;/);
    assert.match(webViewClient, /Uri;->getPort\(\)I/);
    assert.match(webViewClient, /Uri;->getAuthority\(\)Ljava\/lang\/String;/);
    assert.match(webViewClient, /const\/16 v5, 0x1bb/);
    assert.doesNotMatch(webViewClient, /google_spoof\.js|desktop_spoof\.js|playlist_sort\.js|facebook_consent\.js|classic_login\.js/);
    assert.doesNotMatch(app, /CookieManager/);
    assert.doesNotMatch(appWebView, /setUserAgentString|desktop_spoof\.js/);
    assert.match(appWebView, /DOCUMENT_START_SCRIPT/);
    assert.match(appWebView, /spotify_sw_compat\.js/);
    assert.match(webViewClient, /const-string v2, "runtime_state\.js"/);
    assert.match(assetLoader, /const-string v7, "runtime_state\.js"/);
});

test('WebView rejects TLS/mixed content and gates bridge attachment by top-level navigation', () => {
    const webViewClient = read('smali/c91.smali');
    const appWebView = read('smali/m9.smali');
    const factory = appWebView.match(/\.method public static g\(Landroid\/content\/Context;\)Landroid\/webkit\/WebView;([\s\S]*?)\.end method/);
    const pageStart = webViewClient.match(/\.method public onPageStarted\(Landroid\/webkit\/WebView;Ljava\/lang\/String;Landroid\/graphics\/Bitmap;\)V([\s\S]*?)\.end method/);

    assert.ok(factory, 'WebView factory should exist');
    assert.ok(pageStart, 'WebViewClient page-start callback should exist');
    assert.match(factory[1], /const\/4 v1, 0x0[\s\S]*?setWebContentsDebuggingEnabled\(Z\)V/);
    assert.match(factory[1], /const\/4 v3, 0x1[\s\S]{0,100}setMixedContentMode\(I\)V/);
    assert.match(factory[1], /invoke-virtual \{v2, v1\}, Landroid\/webkit\/WebSettings;->setAllowFileAccess\(Z\)V/);
    assert.match(factory[1], /invoke-virtual \{v2, v1\}, Landroid\/webkit\/WebSettings;->setAllowContentAccess\(Z\)V/);
    assert.doesNotMatch(webViewClient, /SslErrorHandler;->proceed/);
    assert.match(webViewClient, /SslErrorHandler;->cancel/);
    assert.match(pageStart[1], /const-string v2, "open\.spotify\.com"/);
    assert.match(pageStart[1], /sput-object v0, Lcom\/melodix\/music\/AppSingleton;->g0:Ljava\/lang\/String;/);
    assert.match(pageStart[1], /addJavascriptInterface/);
    assert.match(pageStart[1], /removeJavascriptInterface/);
    assert.match(pageStart[1], /Uri;->getPort\(\)I/);
});

test('HTTP status responses are not misreported as network disconnections', () => {
    const webViewClient = read('smali/c91.smali');
    const legacyError = webViewClient.match(/\.method public final onReceivedError\(Landroid\/webkit\/WebView;ILjava\/lang\/String;Ljava\/lang\/String;\)V([\s\S]*?)\.end method/);
    const httpError = webViewClient.match(/\.method public final onReceivedHttpError\(Landroid\/webkit\/WebView;Landroid\/webkit\/WebResourceRequest;Landroid\/webkit\/WebResourceResponse;\)V([\s\S]*?)\.end method/);
    const transportError = webViewClient.match(/\.method public final onReceivedError\(Landroid\/webkit\/WebView;Landroid\/webkit\/WebResourceRequest;Landroid\/webkit\/WebResourceError;\)V([\s\S]*?)\.end method/);

    assert.ok(legacyError, 'legacy error callback should exist');
    assert.doesNotMatch(legacyError[1], /AppSingleton;->m:Z|MainActivity;->D\(Z\)V/);
    assert.ok(httpError, 'HTTP error callback should exist');
    assert.match(httpError[1], /invoke-super[\s\S]*?onReceivedHttpError/);
    assert.doesNotMatch(httpError[1], /AppSingleton;->m:Z|MainActivity;->D\(Z\)V/);
    assert.ok(transportError, 'transport error callback should exist');
    assert.match(transportError[1], /WebResourceRequest;->isForMainFrame\(\)Z/);
    assert.match(transportError[1], /WebResourceError;->getErrorCode\(\)I/);
    assert.match(transportError[1], /WebView error code:/);
    assert.match(transportError[1], /AppSingleton;->g0:Ljava\/lang\/String;/);
    assert.doesNotMatch(transportError[1], /WebResourceRequest;->getUrl/);
    assert.match(transportError[1], /sput-boolean p0, Lcom\/melodix\/music\/AppSingleton;->m:Z/);
    assert.match(read('smali/zk0.smali'), /AppSingleton;->g0:Ljava\/lang\/String;/);
});

test('Spotify service-worker compatibility is exact-origin and does not spoof player identity', () => {
    const webViewFactory = read('smali/m9.smali');
    const serviceWorkerCompat = read('assets/spotify_sw_compat.js');

    assert.match(webViewFactory, /DOCUMENT_START_SCRIPT/);
    assert.match(webViewFactory, /spotify_sw_compat\.js/);
    assert.ok(webViewFactory.includes('https://open.spotify.com'));
    assert.match(webViewFactory, /Lgj1;->a\(Ll9;Ljava\/lang\/String;Ljava\/util\/Set;\)V/);
    assert.ok(serviceWorkerCompat.includes("window.location.origin !== 'https://open.spotify.com'"));
    assert.match(serviceWorkerCompat, /serviceWorker\.getRegistrations/);
    assert.match(serviceWorkerCompat, /registration\.unregister\(\)/);
    assert.doesNotMatch(serviceWorkerCompat, /can_be_player|connect-state|userAgent|webdriver|navigator\.platform/);
});

test('native media artwork accepts only bounded HTTPS Spotify CDN URIs', () => {
    const nativeBridge = read('smali/com/melodix/music/AndBridge.smali');
    const method = nativeBridge.match(/\.method public final recMediaStatus\(Ljava\/lang\/String;\)V([\s\S]*?)\.end method/);

    assert.ok(method, 'recMediaStatus method should exist');
    assert.match(method[1], /const\/16 v2, 0x800/);
    assert.match(method[1], /Uri;->getScheme\(\)Ljava\/lang\/String;/);
    assert.match(method[1], /const-string v3, "https"/);
    assert.match(method[1], /Uri;->getPort\(\)I/);
    assert.match(method[1], /const\/16 v3, 0x1bb/);
    assert.match(method[1], /Uri;->getUserInfo\(\)Ljava\/lang\/String;/);
    assert.match(method[1], /Uri;->getHost\(\)Ljava\/lang\/String;/);
    assert.match(method[1], /Locale;->ROOT:Ljava\/util\/Locale;/);
    assert.match(method[1], /String;->toLowerCase\(Ljava\/util\/Locale;\)Ljava\/lang\/String;/);
    assert.match(method[1], /const-string v2, "\.scdn\.co"/);
    assert.match(method[1], /const-string v2, "\.spotifycdn\.com"/);
    assert.match(method[1], /:cond_artwork_invalid[\s\S]*?const-string p0, ""[\s\S]*?:goto_artwork_validated/);
    assert.ok(method[1].indexOf(':cond_artwork_safe') < method[1].indexOf('invoke-static {p0, p1, v0}, Lla1;->v'), 'validation must precede image-size rewriting and loading');
});

test('JavascriptInterface annotations are limited to bridge methods used by active JavaScript', () => {
    const bridge = [read('assets/runtime_state.js'), read('assets/spotify_bridge.js')].join('\n');
    const nativeBridge = read('smali/com/melodix/music/AndBridge.smali');
    const referenced = new Set(
        [...bridge.matchAll(/\b(?:window\.)?AndBridge\.([A-Za-z_$][\w$]*)\s*\(/g)].map(match => match[1])
    );
    const annotated = new Set();
    const methods = /^\.method\b[^\n]*\s([A-Za-z_$][\w$]*)\([^)]*\)[^\n]*\n([\s\S]*?)^\.end method/gm;
    for (const match of nativeBridge.matchAll(methods)) {
        if (match[2].includes('.annotation runtime Landroid/webkit/JavascriptInterface;')) {
            annotated.add(match[1]);
        }
    }

    assert.deepEqual([...annotated].sort(), [...referenced].sort());
});

test('deferMessage displays only fixed local messages and rejects arbitrary frame input', () => {
    const nativeBridge = read('smali/com/melodix/music/AndBridge.smali');
    const method = nativeBridge.match(/\.method public final deferMessage\(Ljava\/lang\/String;\)V([\s\S]*?)\.end method/);

    assert.ok(method, 'deferMessage method should exist');
    for (const key of ['unlock', 'reload', 'adblock']) {
        assert.match(method[1], new RegExp(`const-string v0, "${key}"`));
    }
    assert.equal((method[1].match(/goto :goto_0/g) || []).length, 2, 'only the mapped message paths reach the display helper');
    assert.equal((method[1].match(/goto :cond_6/g) || []).length, 4, 'unknown inputs and hash collisions return without display');
});

test('frame-origin risk remains explicit; main-page checks do not isolate JavascriptInterface frames', () => {
    const webViewClient = read('smali/c91.smali');
    const appWebView = read('smali/m9.smali');
    const nativeBridge = read('smali/com/melodix/music/AndBridge.smali');
    const providerBoundary = read('smali/org/chromium/support_lib_boundary/WebViewProviderBoundaryInterface.smali');
    const listenerBoundary = read('smali/org/chromium/support_lib_boundary/WebMessageListenerBoundaryInterface.smali');
    const features = read('smali/jj1.smali');
    const factory = appWebView.match(/\.method public static g\(Landroid\/content\/Context;\)Landroid\/webkit\/WebView;([\s\S]*?)\.end method/);
    const pageStart = webViewClient.match(/\.method public onPageStarted\(Landroid\/webkit\/WebView;Ljava\/lang\/String;Landroid\/graphics\/Bitmap;\)V([\s\S]*?)\.end method/);

    assert.ok(factory, 'WebView factory should exist');
    assert.match(factory[1], /addJavascriptInterface/, 'factory attaches the interface before origin-based navigation checks');
    assert.ok(pageStart, 'top-level navigation callback should exist');
    assert.match(pageStart[1], /addJavascriptInterface/);
    assert.doesNotMatch(pageStart[1], /sourceOrigin|isMainFrame/);
    assert.match(nativeBridge, /\.method public final loginDetected\(\)V[\s\S]*?\.annotation runtime Landroid\/webkit\/JavascriptInterface;/);
    assert.match(providerBoundary, /addWebMessageListener\(Ljava\/lang\/String;\[Ljava\/lang\/String;Ljava\/lang\/reflect\/InvocationHandler;\)V/);
    assert.match(listenerBoundary, /onPostMessage\(Landroid\/webkit\/WebView;Ljava\/lang\/reflect\/InvocationHandler;Landroid\/net\/Uri;Z/);
    assert.match(features, /"WEB_MESSAGE_LISTENER"/);
    assert.equal(fs.existsSync(path.join(repo, 'smali/androidx/webkit/WebViewCompat.smali')), false);
});

test('manual Android assembly workflow cannot sign, upload, or publish an APK', () => {
    const workflow = read('.github/workflows/validate-android-assembly.yml');

    assert.match(workflow, /^on:\n  workflow_dispatch:\n/m);
    assert.match(workflow, /permissions:\n  contents: read/);
    assert.match(workflow, /actions\/setup-java@v6\.1\.0/);
    assert.match(workflow, /android-actions\/setup-android@v4\.0\.4/);
    assert.match(workflow, /apktool_2\.9\.3\.jar/);
    assert.match(workflow, /RUNNER_TEMP\/melodix-validation-unsigned\.apk/);
    assert.match(workflow, /android\/apktool-framework\/1\.apk/);
    assert.doesNotMatch(workflow, /^  (?:push|pull_request|release):/m);
    assert.doesNotMatch(workflow, /secrets\.|softprops\/action-gh-release|actions\/upload-artifact/);
});

test('saved Spotify session profile read, write, and restore paths are disabled', () => {
    const profileStore = read('smali/bh.smali');
    const saveCallback = read('smali/u51.smali');
    const switchCallback = read('smali/v51.smali');
    const importCallback = read('smali/z1.smali');
    const deleteCallback = read('smali/a61.smali');
    const profileList = profileStore.match(/\.method public static final s\(Landroid\/content\/Context;\)Ljava\/util\/List;([\s\S]*?)\.end method/);

    assert.ok(profileList, 'profile-list method should still exist as a safe empty result');
    assert.match(profileList[1], /new-instance v0, Ljava\/util\/ArrayList;/);
    assert.match(profileList[1], /return-object v0/);
    assert.doesNotMatch(profileList[1], /File;|getFilesDir/);
    assert.doesNotMatch(profileStore, /account_profiles|active_account_profile_id/);
    assert.doesNotMatch(saveCallback, /CookieManager;->getCookie|CookieManager;->setCookie/);
    assert.doesNotMatch(switchCallback, /CookieManager;->removeAllCookies|CookieManager;->setCookie/);
    assert.doesNotMatch(importCallback, /CookieManager;->setCookie|removeAllCookies|localStorage\.setItem/);
    assert.match(saveCallback, /Session saving is disabled/);
    assert.match(switchCallback, /Saved session switching is disabled/);
    assert.match(deleteCallback, /No files were changed/);
    assert.match(deleteCallback, /check-cast v1, Lhz0;/);
    assert.doesNotMatch(deleteCallback, /account_profiles|File;->delete/);
});
