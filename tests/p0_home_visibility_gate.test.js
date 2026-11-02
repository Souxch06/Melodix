'use strict';

// Structural checks on the real Smali sources. They do not prove Android frame
// output; tests/android/HomeRenderInstrumentation.java exercises native Home
// status rendering on the Preview APK without injecting playlists or account data.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { JSDOM } = require('jsdom');

const root = path.join(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const method = (source, signature) => {
  const start = source.indexOf(signature);
  assert.ok(start >= 0, `missing method: ${signature}`);
  const end = source.indexOf('.end method', start);
  assert.ok(end > start, `unterminated method: ${signature}`);
  return source.slice(start, end);
};

test('Home renderer keeps card and status attachment facts separate', () => {
  const rendererSource = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const renderer = method(rendererSource, '.method public static render(');
  const statusRenderer = method(rendererSource, '.method private static renderHomeStatus(');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(renderer, /beginNativeHomeRender\(\)V/);
  assert.match(renderer, /noteNativeHomeCardAttached\(Landroid\/view\/View;\)V/);
  assert.match(renderer, /kind[\s\S]*?renderHomeStatus[\s\S]*?native-home-status-attached/);
  assert.match(statusRenderer, /noteNativeHomeStatusAttached\(Landroid\/view\/View;\)V/);
  assert.match(renderer, /hasNativeHomeCardsAttached\(\)Z/);
  assert.doesNotMatch(rendererSource, /MainActivity;->nativeHome(?:CardsAttached|StatusAttached|ContentReady|FirstCard|StatusView):/,
    'no direct cross-class access to private Activity fields');
  assert.match(activity, /\.field private nativeHomeCardsAttached:Z/);
  assert.match(activity, /\.field private nativeHomeStatusAttached:Z/);
  assert.match(activity, /\.field private nativeHomeContentReady:Z/);
  assert.match(activity, /\.field private nativeHomeFirstCard:Landroid\/view\/View;/);
  assert.match(activity, /\.field private nativeHomeStatusView:Landroid\/view\/View;/);
});

test('missing or negative session proof preserves native ownership and purges stale Home rows', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const owner = method(activity, '.method public final setMelodixHomeVisibility(ZZ)V');
  const unprovenStart = owner.indexOf('\n    :melodix_home_session_unproven');
  const unproven = owner.slice(unprovenStart);
  assert.ok(unprovenStart >= 0);
  assert.match(owner, /\.locals 3[\s\S]*?if-eqz p2, :melodix_home_session_unproven/,
    'a negative libraryV3 signal takes the native invalidation path without relying on a prior renderer flag');
  assert.match(unproven, /isNativeHomeScreen\(\)Z[\s\S]*?Connexion Spotify non confirmée[\s\S]*?melodix:action:open-login/,
    'proof loss replaces any prior Home content with an explicit native session-unconfirmed state and login action');
  assert.match(unproven, /NativeHomeShelfRenderer;->render/);
  assert.doesNotMatch(unproven, /melodix_home_unproven_no_private_rows|hasNativeHomeContentAttached/,
    'a stale native card tree cannot survive merely because the Web renderer was not previously active');
  assert.doesNotMatch(unproven, /revealWebUi\(\)V/,
    'session proof loss never exposes Spotify Web as an automatic fallback');
  const renderer = method(read('smali/com/melodix/music/NativeHomeShelfRenderer.smali'), '.method public static render(');
  assert.match(renderer, /removeAllViews\(\)V[\s\S]*?new-instance v0, Lorg\/json\/JSONArray/,
    'new status/error payloads replace the old private native row tree before drawing');
});

test('Home readiness measures the attached card or explicit status view in global bounds', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const measured = method(activity, '.method private hasMeasuredVisibleNativeHomeContent()Z');
  assert.match(measured, /isNativeHomeScreen\(\)Z/);
  assert.match(measured, /nativeHomeCardsAttached:Z[\s\S]*?nativeHomeFirstCard:Landroid\/view\/View;/);
  assert.match(measured, /nativeHomeStatusAttached:Z[\s\S]*?nativeHomeStatusView:Landroid\/view\/View;/);
  assert.match(measured, /View;->getParent\(\)Landroid\/view\/ViewParent;/);
  assert.match(measured, /View;->isShown\(\)Z/);
  assert.match(measured, /View;->getWidth\(\)I[\s\S]*?if-lez/);
  assert.match(measured, /View;->getHeight\(\)I[\s\S]*?if-lez/);
  assert.match(measured, /View;->getGlobalVisibleRect\(Landroid\/graphics\/Rect;\)Z/);
  assert.match(measured, /Rect;->width\(\)I[\s\S]*?Rect;->height\(\)I/);
});

test('the visible-ready flag follows a second post-overlay measurement and records which content was seen', () => {
  const complete = method(read('smali/com/melodix/music/MainActivity.smali'),
    '.method public final completeNativeUiVisibility(Z)Z');
  const first = complete.indexOf('hasMeasuredVisibleNativeHomeContent()Z');
  const dismiss = complete.indexOf('hideStartupOverlay()V');
  const second = complete.indexOf('hasMeasuredVisibleNativeHomeContent()Z', first + 1);
  const ready = complete.indexOf('iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeHomeContentReady:Z');
  const rendered = complete.indexOf('"home-rendered"');
  const playerReady = complete.indexOf('AppSingleton;->l:Z');
  const startupDone = complete.indexOf('AppSingleton;->startupDone:Z');
  assert.ok(first >= 0 && dismiss > first && second > dismiss && ready > second && rendered > ready,
    'Home readiness is set only after the selected real content remains visible without the splash');
  assert.match(complete, /native-home-card-visible=true[\s\S]*?native-home-status-visible=true/,
    'diagnostics distinguish a Spotify card from an explicit state panel');
  assert.ok(playerReady > rendered && startupDone > playerReady,
    'global readiness flags follow the verified Home stage');
  assert.match(complete, /:native_visibility_measure_failed[\s\S]*?visibility-measure-failed[\s\S]*?visibility-measure-pending/);
  assert.doesNotMatch(complete, /revealWebUi\(\)V/,
    'a failed visibility measure cannot transfer ownership to Spotify Web');
});

test('failed native visibility returns a verifier-typed boolean after emitting its watchdog trace', () => {
  const complete = method(read('smali/com/melodix/music/MainActivity.smali'),
    '.method public final completeNativeUiVisibility(Z)Z');
  const pendingStart = complete.indexOf('\n    :native_visibility_not_ready');
  const confirmedStart = complete.indexOf('\n    :native_visibility_confirmed');
  assert.ok(pendingStart >= 0 && confirmedStart > pendingStart,
    'the pending branch remains distinct from a successful native visibility result');
  const pending = complete.slice(pendingStart, confirmedStart);
  assert.match(pending, /traceNativeDisplayOwner\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
  const instructions = pending.split('\n')
    .map((line) => line.trim())
    .filter((line) => line && !line.startsWith('#'));
  const returnIndex = instructions.lastIndexOf('return v0');
  assert.ok(returnIndex > 0, 'the pending branch has an explicit false result');
  assert.equal(instructions[returnIndex - 1], 'const/4 v0, 0x0',
    'the watchdog category string must not reach return v0 in a Z method');
});

test('[static layout] nativeRoot and hScrollView are later/earlier siblings under main with stable resource id', () => {
  const layout = new JSDOM(read('res/layout/activity_main.xml'), { contentType: 'text/xml' }).window.document;
  const main = layout.documentElement;
  const hScrollView = layout.getElementsByTagName('com.melodix.music.LockableHScrollView')[0];
  const nativeRoot = Array.from(layout.getElementsByTagName('LinearLayout'))
    .find((node) => node.getAttribute('android:id') === '@id/nativeRoot');
  assert.equal(main.getAttribute('android:id'), '@id/main');
  assert.ok(hScrollView, 'the horizontal-scroll WebView host exists');
  assert.ok(nativeRoot, 'the nativeRoot exists');
  assert.strictEqual(hScrollView.parentElement, main, 'hScrollView is a direct child of main');
  assert.strictEqual(nativeRoot.parentElement, main, 'nativeRoot is a direct child of the same main ConstraintLayout');
  assert.ok(Array.from(main.children).indexOf(nativeRoot) > Array.from(main.children).indexOf(hScrollView),
    'nativeRoot is a later sibling than the WebView host');

  const publicResources = new JSDOM(read('res/values/public.xml'), { contentType: 'text/xml' }).window.document;
  const hScrollId = Array.from(publicResources.getElementsByTagName('public'))
    .find((node) => node.getAttribute('type') === 'id' && node.getAttribute('name') === 'hScrollView');
  assert.equal(hScrollId && hScrollId.getAttribute('id'), '0x7f0900ea');
  const trace = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');
  assert.match(trace, /const v11, 0x7f0900ea[\s\S]*?findViewById\(I\)Landroid\/view\/View;/,
    'the visibility check resolves the verified public hScrollView ID in the common parent');
  assert.match(trace, /indexOfChild\(Landroid\/view\/View;\)I[\s\S]*?if-le v8, v9, :native_layout_root_checked/);
});

test('native root handoff fails closed on missing layout, bad stacking, or missing Home pixels', () => {
  const trace = read('smali/com/melodix/music/NativeUiVisibilityTraceRunnable.smali');
  assert.match(trace, /View;->isShown\(\)Z[\s\S]*?View;->getWidth\(\)I[\s\S]*?View;->getHeight\(\)I/);
  assert.match(trace, /ConstraintLayout;[\s\S]*?if-le v8, v9, :native_layout_root_checked/,
    'nativeRoot must be later than its horizontal-scroll/WebView host');
  assert.match(trace, /View;->getElevation\(\)F[\s\S]*?cmpl-float[\s\S]*?getGlobalVisibleRect\(Landroid\/graphics\/Rect;\)Z/);
  assert.match(trace, /completeNativeUiVisibility\(Z\)Z/);
  assert.match(trace, /attempts:I[\s\S]*?const\/4 v14, 0x5[\s\S]*?postDelayed\(Ljava\/lang\/Runnable;J\)Z/,
    'the UI waits a bounded number of layout turns instead of claiming readiness early');
  assert.match(trace, /:native_layout_give_up[\s\S]*?visibility-timeout[\s\S]*?native-shell-visibility-pending/);
  assert.doesNotMatch(trace, /revealWebUi\(\)V/,
    'late measurements do not take ownership away from the native shell');
});

test('Android instrumentation is declared as a manifest-level component, not nested in application', () => {
  const manifest = read('tests/android/AndroidManifest.xml');
  const applicationClose = manifest.indexOf('</application>');
  const instrumentationStart = manifest.indexOf('<instrumentation');
  const manifestClose = manifest.indexOf('</manifest>');
  assert.ok(applicationClose >= 0 && instrumentationStart > applicationClose && instrumentationStart < manifestClose,
    'PackageManager only registers instrumentation declared directly under <manifest>');
});

test('the Web Home renderer is session-gated, accepts one real item, and renders explicit data states', () => {
  const renderer = read('scripts/melodix_home.source.js');
  const runtime = read('assets/melodix_home.js');
  const nativeShell = read('scripts/native_ui_shell.source.js');
  const css = read('assets/css_hacks.css');
  assert.match(renderer, /function melodixHomeHasSessionEvidence\(\)/);
  assert.doesNotMatch(renderer, /user-widget-link|main-userWidget-box/,
    'profile widgets are not used by the Web renderer as authentication proof');
  assert.match(renderer, /return window\.__sfMediaLibSessionProofKnown === true &&[\s\S]*?window\.__sfMediaLibSessionProven === true/,
    'only a verified private API response can prove the WebView session, even for an empty library');
  assert.match(renderer, /if \(!sessionProven\)[\s\S]*?setMelodixHomeDecision\('renderer-inactive'/,
    'a failed internal proof guard keeps the Web renderer inactive without serializing the proof result');
  assert.doesNotMatch(renderer, /setMelodixHomeDecision\([^\n]*(?:session-unproven|session-rejected)/,
    'renderer decisions do not expose a proof outcome');
  assert.doesNotMatch(renderer, /itemCount\s*<\s*2/,
    'one verified Spotify card is sufficient; empty and error states do not need fake cards');
  assert.match(renderer, /collectMelodixHomeLibrarySections\(seenResources\)/);
  assert.match(renderer, /rendered-status-\$\{statusState\}/);
  assert.match(renderer, /sf-media-library-state-changed/);
  assert.match(renderer, /sf-native-ui-session-proof-changed/);
  assert.match(nativeShell, /function libraryProvesSession\(\)[\s\S]*?__sfMediaLibSessionProofKnown === true[\s\S]*?__sfMediaLibSessionProven === true/,
    'the native gate accepts an empty but verified private response, not library readiness alone');
  assert.match(nativeShell, /function pageHasProfileSignal\(\)[\s\S]*?main-userWidget-box/,
    'the profile control remains an internal page signal');
  assert.doesNotMatch(nativeShell, /diagTrace\([^\n]*profile|diagTrace\([^\n]*session=|diagTrace\([^\n]*proof=/i,
    'profile and session-proof signals are not serialized into native-shell traces');
  assert.match(nativeShell, /takeoverProven = sessionProven;/,
    'only private API proof can authorize native readiness');
  assert.match(nativeShell, /rows = sessionProven && actualHomeRoute \? collectedRows : \[\]/,
    'private Home rows require both libraryV3 proof and the real Spotify Home route');
  assert.match(nativeShell, /window\.__sfNativeUiPageSessionSignal = profileSignal/,
    'profile UI signal remains separate from the native session proof and is not report evidence');
  const nativeRenderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  assert.match(nativeRenderer, /shelf_render_spotify_rows[\s\S]*?showNativeUi\(\)V/,
    'a native card payload can reach showNativeUi after attachment');
  assert.match(nativeRenderer, /no-real-cards[\s\S]*?state\\\":\\\"error[\s\S]*?melodix:action:retry-library/);
  assert.doesNotMatch(nativeRenderer, /revealWebUi\(\)V/,
    'malformed or empty native card payloads remain in native Home with retry');
  const showNativeUi = method(activity, '.method public final showNativeUiFrom(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(showNativeUi, /hasNativeHomeContentAttached\(\)Z[\s\S]*?native-root-found/);
  assert.doesNotMatch(showNativeUi, /MediaLibSession|spotifySessionProven/,
    'Java visibility checks prove attachment, not Spotify authentication; the JS payload gate must therefore be strict');
  assert.match(nativeShell, /previousSessionProven !== sessionProven[\s\S]*?sf-native-ui-session-proof-changed/,
    'native session proof changes wake the Web renderer without exposing account data');
  assert.match(nativeShell, /rawItemCount > 0[\s\S]*?éléments non reconnus[\s\S]*?melodix:action:retry-library/,
    'non-empty but unrenderable real responses cannot be mislabeled empty by the native shell');
  assert.match(nativeShell, /function homePartialErrorRow\(\)[\s\S]*?Certaines données Spotify sont indisponibles[\s\S]*?rows = rows\.concat\(\[homePartialErrorRow\(\)\]\)/,
    'partial failures remain visible beside already received real library content in native Home');
  assert.doesNotMatch(renderer, /accounts\.spotify\.com\/login|sessionError|spotify-sign-in/,
    'a 401 response is not presented as proof of an expired session or forced login');
  assert.match(runtime, /renderer-inactive/,
    'the packaged renderer is regenerated with a proof-neutral display decision');
  assert.doesNotMatch(runtime, /session-unproven|session-rejected/,
    'runtime instrumentation does not expose proof outcomes as decision labels');
  assert.match(css, /sf-melodix-home__status--error[\s\S]*?sf-melodix-home__retry/);
});

test('native Home decision diagnostics accept no proof or profile outcome labels', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  assert.match(bridge, /home-web decision=\(body-missing\|route-not-home\|gui-mode-unsupported\|fullscreen-open\|renderer-inactive/);
  assert.doesNotMatch(bridge, /home-web decision=[^\n]*(?:session-unproven|session-rejected|profile-control)/,
    'AndBridge never persists proof/profile outcomes as Home renderer decisions');
});

test('the CI Home integration contains no fake account data or credentials and labels its renderer proof as a fixture', () => {
  const harness = read('tests/android/HomeRenderInstrumentation.java');
  const inspector = read('tests/android/inspect_hierarchy.py');
  assert.doesNotMatch(harness, /spotify:playlist:|FIXTURE_TITLE|FIXTURE_JSON|Bearer\s+[A-Za-z0-9._-]+|sp_dc=/i);
  assert.match(harness, /fixture is test-only; its explicit[\s\S]*private-library-proof flags/i);
  assert.match(harness, /window\.__sfMediaLibSessionProofKnown=true;window\.__sfMediaLibSessionProven=true/,
    'the isolated fixture supplies API-proof-shaped flags only for renderer testing; it is not labeled as Spotify authentication');
  assert.match(harness, /authenticated_home_requires_real_playlist/);
  assert.match(harness, /finalState\.putString\("overall"[\s\S]*?blocked_no_home_content_observed/,
    'the observer reports a generic content outcome instead of exporting a session-proof flag');
  assert.doesNotMatch(harness, /putBoolean\("authenticated_session"|putBoolean\("session_proven"|putString\("session_proof_source"/,
    'actual-account session proof is never added to an instrumentation Bundle');
  assert.match(harness, /if \(validSpotifyPage && probe\.optBoolean\("home_route"\) && realPlaylistObserved\) \{[\s\S]*?authenticatedHomeObserved = true;/,
    'authenticated-home observation requires a proof-gated, count-free real-playlist presence result');
  assert.match(harness, /authenticated_home_test_performed", false/);
  assert.match(harness, /onNativeUiData"\s*,\s*String\.class\s*,\s*String\.class/);
  assert.match(harness, /LOGIN_DOM_PROBE[\s\S]*?awaitLoginUiVisible\(webView\)/,
    'the clean session checks for actual login DOM before the recovery transition');
  assert.match(harness, /login_ui_visible_in_webview_dom/);
  assert.match(harness, /libraryProven=window\.__sfMediaLibSessionProofKnown===true&&window\.__sfMediaLibSessionProven===true[\s\S]*?real_library_playlist_observed:libraryPlaylistObserved/,
    'the probe uses libraryV3 evidence internally and exports only a count-free playlist-presence outcome');
  assert.doesNotMatch(harness, /putBoolean\("libraryv3_session_proven"|putBoolean\("native_takeover_proven"|putBoolean\("live_webview_session_proof"|putBoolean\("profile_control_visible"/,
    'proof and profile indicators are not serialized into Android instrumentation status');
  assert.doesNotMatch(harness, /state\.put(?:Boolean|Int|Long|String)\("[^"]*(?:session|proof|profile_control|profile_signal|account_profile)[^"]*"/i,
    'no instrumentation Bundle key reintroduces a session-proof or account-profile indicator');
  assert.doesNotMatch(harness, /failurePhase\s*=\s*"[^"]*(?:unproven|session[-_]?proof|profile_control|account_profile)[^"]*"/i,
    'failure phases do not disclose proof/account-profile outcomes either');
  assert.match(harness, /native_home_data_callback_returned:[\s\S]*?window\.__sfNativeUiHomeDataSent===true/,
    'the real probe distinguishes an executed Home-data bridge callback from mere callback availability');
  assert.match(harness, /runAuthenticatedHomeObservation\([\s\S]*?authenticated_home_test_performed/);
  assert.match(harness, /final_screen_owner[\s\S]*?primary_webview_melodix_home_is_visible_owner/,
    'the real observation reports the Android/WebView screen owner separately');
  assert.match(harness, /target_version_name[\s\S]*?target_version_code/,
    'the report identifies the exact installed candidate by package version');
  const manualObservation = harness.split('private void runAuthenticatedHomeObservation')[1].split('private Bundle inspectAuthenticatedHome')[0];
  assert.doesNotMatch(manualObservation, /CLEAR_TASK|loadUrl\(|dispatchEmptyHomeThroughAndBridge|dispatchHomeStatusThroughAndBridge|createWebHomeRendererFixture/,
    'the real-session mode preserves the primary WebView, never navigates or dispatches fixture data');
  assert.match(manualObservation, /launchTargetPreservingTask|AUTHENTICATED_HOME_PROBE/);
  assert.match(harness, /login_dom_probe_completed/,
    'the DOM probe records an explicit false result before failing, instead of making absence of status look like false');
  assert.match(harness, /Log\.e\(HARNESS_TAG, "failure phase=" \+ failurePhase \+ " type=" \+ failure\.getClass\(\)\.getSimpleName\(\)\)/,
    'instrumentation failures expose only a phase and exception type, never page text');
  assert.match(harness, /"home",\s*"\[\]"/,
    'the integration sends only an empty Home payload to test the native error state');
  assert.match(harness, /putBoolean\("native_home_cards_attached", false\)/);
  assert.match(inspector, /splash_accessibility_visible/);
  assert.match(inspector, /webview_accessibility_node_present/);
  assert.match(inspector, /ui_hierarchy_top_node_package/,
    'a missing app surface records only the safe top hierarchy package/class, not raw text');
  assert.match(inspector, /native_root_accessibility_visible/);
  assert.match(inspector, /if phase in \{\"empty-home\", \"home-status\"\}:[\s\S]*?if phase == \"empty-home\" and not home_error_message_visible[\s\S]*?native_root_visible[\s\S]*?home_status_pixels_rendered/s,
    'empty Home now requires a visible native error/retry status and native root instead of Web takeover');
  assert.match(inspector,
    /Path\(summary_path\)\.write_text[\s\S]*?if phase == \"empty-home\"[\s\S]*?fail\(/,
    'redacted hierarchy and pixel diagnostics are saved before a native visibility failure');
  assert.match(inspector, /fail\("startup_splash_accessibility_visible"\)/,
    'the screenshot check rejects a visible splash covering the WebView');
  assert.match(inspector, /notice title=Android login surface visibility[\s\S]*?webview_crop_bright_pixels/,
    'a passing login screenshot reports measured WebView pixels without raw page text');
  assert.doesNotMatch(inspector, /FIXTURE_TITLE|Controlled Home fixture|fixture_title/);
});

test('native Home hierarchy inspection recognizes safe loading and error labels without exporting text', () => {
  const inspector = read('tests/android/inspect_hierarchy.py');
  assert.match(inspector, /HOME_STATUS_MARKERS = \([\s\S]*\"connexion a spotify\"[\s\S]*\"verification de la session\"[\s\S]*\"etat de connexion non confirme\"[\s\S]*\"chargement de votre accueil\"[\s\S]*\"touchez pour reessayer\"/,
    'the allowlist matches native connection/loading and error/retry panels');
  assert.match(inspector, /def normalized_text\(value\):[\s\S]*?unicodedata\.normalize\(\"NFKD\", value\)/);
  assert.match(inspector, /def is_home_status_message\(value\):[\s\S]*?normalized_text\(value\)[\s\S]*?any\(marker in normalized for marker in HOME_STATUS_MARKERS\)/);
  assert.match(inspector, /def is_home_error_message\(value\):[\s\S]*?any\(marker in normalized for marker in HOME_ERROR_MARKERS\)/);
  assert.match(inspector, /if is_home_status_message\(status_text\):[\s\S]*?if accessibility_visible:[\s\S]*?home_status_bounds = bounds/,
    'a matching status only counts as visible when its real hierarchy node has visible bounds');
  assert.match(inspector, /if phase in \{\"empty-home\", \"home-status\"\}:[\s\S]*?if not home_status_message_visible or home_status_bounds is None:[\s\S]*?if phase == \"empty-home\" and not home_error_message_visible[\s\S]*?native_root_visible[\s\S]*?home_status_pixels_rendered/,
    'the screenshot gate requires a visible native status and an error/retry label for empty Home');
  assert.match(inspector, /\"home_status_message_accessible\": home_status_message_accessible,[\s\S]*?\"home_status_message_visible_to_user\": home_status_message_visible,[\s\S]*?\"home_error_message_visible_to_user\": home_error_message_visible/);
  assert.match(inspector, /\"text_present\": bool\(text\)/);
  assert.doesNotMatch(inspector, /\"home_status_(?:message|text)\":\s*status_text/,
    'raw Home status text is compared in-process but never serialized into CI reports');
});

test('authenticated-home mode is opt-in, non-destructive, and samples actual Android surfaces at runtime', () => {
  const harness = read('tests/android/HomeRenderInstrumentation.java');
  const observation = harness.split('private void runAuthenticatedHomeObservation')[1]
    .split('private Bundle inspectAuthenticatedHome')[0];
  const foreground = harness.split('private Bundle inspectAuthenticatedHomeOnMain')[1]
    .split('private boolean readBooleanSafely')[0];
  assert.match(harness, /"authenticated-home"\.equals\(runnerArguments\.getString\("mode"\)\)/,
    'the passive observer runs only when explicitly requested');
  assert.match(harness, /registerActivityLifecycleObservation\(\)[\s\S]*?launchTargetPreservingTask\(\)/);
  const preservingLaunch = harness.split('private Activity launchTargetPreservingTask')[1]
    .split('private boolean isTargetActivity')[0];
  assert.doesNotMatch(preservingLaunch, /FLAG_ACTIVITY_CLEAR_TOP|FLAG_ACTIVITY_CLEAR_TASK/,
    'foregrounding does not clear task/history or restart the existing singleInstance activity');
  assert.match(observation, /findWebView\(sampleActivity\)/,
    'the observer re-finds the activity’s original primary WebView on every sample');
  assert.doesNotMatch(observation, /getUrl\(\)|safeSpotifyUrl|safe_url|initial_safe_url|putString\([^\n]*url/i,
    'it preserves the live page without exporting any part of its URL');
  assert.match(observation, /AUTHENTICATED_HOME_PROBE/);
  assert.match(observation, /String screen = webRoute/,
    'manual transition coverage follows the recognized primary-WebView route, not a stale native route flag');
  assert.match(observation, /home_to_search_observed[\s\S]*?search_to_home_observed[\s\S]*?home_to_library_observed[\s\S]*?library_to_home_observed/);
  assert.match(observation, /android_back_key_seen[\s\S]*?android_back_return_to_home_observed/);
  assert.match(observation, /activity_resumed_after_background[\s\S]*?activity_recreated_during_observation/);
  assert.match(observation, /process_restart_requires_a_new_observation_run/,
    'the instrumentation does not pretend a runner surviving process death has been observed');
  assert.match(harness, /KeyEvent\.KEYCODE_BACK[\s\S]*?method\.invoke\(original, args\)/,
    'the opt-in key observer records Back then delegates the event unchanged');
  assert.equal((harness.match(/private long authenticatedHomeTimeoutMs\(/g) || []).length, 1,
    'the Java harness has one bounded authenticated-observation timeout implementation');
  assert.match(foreground, /requiredView|optionalView/);
  for (const surface of ['hScrollView', 'webViewContainer', 'nativeRoot', 'splashOverlay', 'progressBar']) {
    assert.ok(harness.includes('optionalView(activity, "' + surface + '")'), 'measures ' + surface);
  }
  const surfaceTelemetry = harness.split('private Rect measureSurface')[1]
    .split('private String safeHomeHost')[0];
  assert.match(surfaceTelemetry, /getLocationOnScreen[\s\S]*?getAlpha\(\)[\s\S]*?getWidth\(\)[\s\S]*?getHeight\(\)/,
    'surface telemetry samples screen position, alpha, and laid-out dimensions');
  assert.match(surfaceTelemetry, /getGlobalVisibleRect[\s\S]*?getZ\(\)[\s\S]*?indexOfChild/,
    'surface ownership uses measured runtime geometry, Z, and sibling drawing order—not XML elevation alone');
  assert.match(foreground, /runtime_frontmost_fullscreen_surface[\s\S]*?owner_determination/);
  assert.match(foreground, /first_defective_condition|primary_webview_melodix_home_is_visible_owner/);
  assert.match(harness, /app_process_restart_verified", false/,
    'process death is explicitly not reported as a same-run success');
  assert.doesNotMatch(observation, /new WebView\(|createWebHomeRendererFixture|dispatchHomeStatusThroughAndBridge|dispatchEmptyHomeThroughAndBridge|loadUrl\(|\.click\(/,
    'the opt-in pass never creates a second WebView, injects fixture data, or drives navigation');
});

test('the authenticated DOM probe exports only safe routes, HTTP metadata, count-free playlist presence, and callback evidence', () => {
  const harness = read('tests/android/HomeRenderInstrumentation.java');
  const block = harness.split('private static final String AUTHENTICATED_HOME_PROBE =')[1]
    .split('private static final String MOBILE_VIEWPORT_LAYOUT_PROBE')[0];
  const javaStrings = Array.from(block.matchAll(/"((?:\\.|[^"\\])*)"/g), (match) => match[1]);
  const script = javaStrings.map((value) => JSON.parse('"' + value + '"')).join('');
  assert.match(script, /libraryProven=window\.__sfMediaLibSessionProofKnown===true&&window\.__sfMediaLibSessionProven===true/,
    'libraryV3 is the only internal source that permits a real-playlist presence result');
  assert.match(script, /real_library_playlist_observed:libraryPlaylistObserved/);
  assert.match(script, /fetchStatusMatches=function\(code\).*?fetchPhase==='response'.*?fetchHttp===code/);
  assert.match(script, /library_fetch_http_status:fetchHttp[\s\S]*?library_fetch_mime:fetchMime[\s\S]*?library_fetch_duration_ms:fetchDuration[\s\S]*?library_fetch_error:fetchError/);
  for (const field of ['sf_melodix_home_present', 'main_view_id_present', 'home_active_class',
    'native_home_data_callback_returned', 'native_ready_callback_returned']) {
    assert.ok(script.includes(field), `the probe retains necessary UI/handoff evidence: ${field}`);
  }
  assert.doesNotMatch(script, /session_proven|session_proof_source|profile_control|safe_url|library_fetch_received_count|library_fetch_transformed_count|library_fetch_proof|library_fetch_page_signal|raw_library_item|playlist_count|source_anchor_count|real_home_.*count|document\.cookie|localStorage|sessionStorage/,
    'the serialized probe contains no proof/profile flags, URL, body, identity, or private-content counters');

  const dom = new JSDOM(
    '<!doctype html><body class="sf-melodix-home-active"><main id="main-view" style="display:block;visibility:visible;opacity:1">' +
    '<a href="/intl-fr/playlist/PRIVATE_ID_123">private fixture title</a>' +
    '<a href="https://example.com/playlist/EXTERNAL_PRIVATE_ID">external link</a></main>' +
    '<section id="sf-melodix-home" style="display:flex;position:fixed;visibility:visible;opacity:1">' +
    '<a href="/intl-fr/playlist/PRIVATE_ID_123">same real resource</a></section></body>',
    { runScripts: 'outside-only', url: 'https://open.spotify.com/intl-fr/home?session=PRIVATE&si=SECRET#token=PRIVATE' }
  );
  const window = dom.window;
  const rect = (width, height) => () => ({ left: 8, top: 12, right: 8 + width, bottom: 12 + height, width, height });
  window.document.getElementById('main-view').getBoundingClientRect = rect(400, 700);
  window.document.getElementById('sf-melodix-home').getBoundingClientRect = rect(400, 700);
  window.__sfMediaLibSessionProofKnown = true;
  window.__sfMediaLibSessionProven = true;
  window.__sfMediaLibStatus = 'ready';
  window.__sfMediaLibError = '';
  window.__sfMediaLibLastDiagnostic = {
    http: 200, mime: 'json', phase: 'response', durationMs: 12, error: 'none',
    body: 'PRIVATE_RESPONSE_BODY', url: 'https://open.spotify.com/private?token=SECRET'
  };
  window.mediaLib = { playlists: [{ id: 'private-playlist', name: 'private title' }],
    albums: [{ id: 'private-album' }], artists: [], podcasts: [] };
  window.__sfNativeUiSessionProven = true;
  window.__sfNativeUiRoute = 'home';
  window.__sfNativeUiLastRouteSent = 'home';
  window.__sfNativeUiHomeDataSent = true;
  window.__sfNativeUiHomeStateSent = false;
  window.__sfNativeUiReadyNotified = true;
  window.__sfMelodixBridgeStarted = true;
  window.__sfMelodixHomeDecision = 'visible';
  window.AndBridge = {
    onNativeUiRoute() {},
    onNativeUiData() {},
    onNativeUiReady() {}
  };
  try {
    const result = window.eval(script);
    assert.equal(result.probe_error, false);
    assert.equal(result.host_category, 'open.spotify.com');
    assert.equal(result.route_category, 'home');
    assert.equal(result.home_route, true);
    assert.equal(result.real_library_playlist_observed, true);
    assert.equal(result.library_fetch_diagnostic_available, true);
    assert.equal(result.library_fetch_http_status, 200);
    assert.equal(result.library_fetch_mime, 'json');
    assert.equal(result.library_fetch_phase, 'response');
    assert.equal(result.library_fetch_duration_ms, 12);
    assert.equal(result.library_fetch_error, 'none');
    assert.equal(result.sf_melodix_home_visible, true);
    assert.deepEqual({ ...result.sf_melodix_home_rect }, { left: 8, top: 12, width: 400, height: 700 });
    assert.equal(result.main_view_id_present, true);
    assert.equal(result.main_view_visible, true);
    assert.equal(result.home_active_class, true);
    assert.equal(result.native_route_callback_returned, true);
    assert.equal(result.native_home_data_callback_returned, true);
    assert.equal(result.native_ready_callback_returned, true);
    for (const privateField of ['session_proven', 'session_proof_source', 'profile_control_visible',
      'safe_url', 'playlist_count', 'raw_library_item_count', 'library_fetch_proof', 'body', 'url']) {
      assert.equal(Object.hasOwn(result, privateField), false, `the result omits ${privateField}`);
    }
    assert.doesNotMatch(JSON.stringify(result), /PRIVATE_ID|session=|SECRET|token=|PRIVATE_RESPONSE_BODY|private-playlist|private-album|private title/,
      'no URL, private playlist data, response body, or token-like value is returned');

    // A native-session flag, profile control, or library array alone must not
    // establish private content without the libraryV3 response proof.
    window.__sfMediaLibSessionProofKnown = false;
    window.__sfMediaLibSessionProven = false;
    window.__sfNativeUiSessionProven = true;
    const profileControl = window.document.createElement('button');
    profileControl.setAttribute('data-testid', 'user-widget-link');
    profileControl.style.cssText = 'display:block;visibility:visible;opacity:1';
    profileControl.getBoundingClientRect = rect(40, 40);
    window.document.body.appendChild(profileControl);
    const unproven = window.eval(script);
    assert.equal(unproven.real_library_playlist_observed, false);
    assert.equal(Object.hasOwn(unproven, 'session_proven'), false);
    assert.equal(Object.hasOwn(unproven, 'profile_control_visible'), false);

    // A 401/403 label is retained only for a matching response-phase status.
    window.__sfMediaLibError = 'http-401';
    window.__sfMediaLibLastDiagnostic = {
      http: 401, mime: 'json', phase: 'parse', durationMs: 24, error: 'http-401'
    };
    const mismatched401 = window.eval(script);
    assert.equal(mismatched401.library_error, 'other');
    assert.equal(mismatched401.library_fetch_error, 'http-other');
    window.__sfMediaLibLastDiagnostic = {
      http: 401, mime: 'json', phase: 'response', durationMs: 25, error: 'http-401'
    };
    const matched401 = window.eval(script);
    assert.equal(matched401.library_error, 'http-401');
    assert.equal(matched401.library_fetch_error, 'http-401');
    window.__sfMediaLibError = 'http-403';
    window.__sfMediaLibLastDiagnostic = {
      http: 401, mime: 'json', phase: 'response', durationMs: 26, error: 'http-403'
    };
    const mismatched403 = window.eval(script);
    assert.equal(mismatched403.library_error, 'other');
    assert.equal(mismatched403.library_fetch_error, 'http-other');
    window.__sfMediaLibError = 'http-429';
    window.__sfMediaLibLastDiagnostic = {
      http: 429, mime: 'json', phase: 'response', durationMs: 27, error: 'http-other'
    };
    const confirmedOtherHttp = window.eval(script);
    assert.equal(confirmedOtherHttp.library_error, 'http-other');
    assert.equal(confirmedOtherHttp.library_fetch_error, 'http-other');
  } finally {
    dom.window.close();
  }
});
