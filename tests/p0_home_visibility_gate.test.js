'use strict';

// Structural checks on the real Smali sources. They do not prove Android frame
// output; tests/android/HomeRenderInstrumentation.java exercises the empty-Home
// fallback on the Preview APK without injecting playlists or account data.
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
  assert.match(complete, /:native_visibility_web_fallback[\s\S]*?revealWebUi\(\)V/);
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
  assert.match(trace, /:native_layout_give_up[\s\S]*?revealWebUi\(\)V/,
    'failed measurements return to the existing WebView');
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
  assert.match(renderer, /if \(!sessionProven\)[\s\S]*?session-unproven/);
  assert.doesNotMatch(renderer, /itemCount\s*<\s*2/,
    'one verified Spotify card is sufficient; empty and error states do not need fake cards');
  assert.match(renderer, /collectMelodixHomeLibrarySections\(seenResources\)/);
  assert.match(renderer, /rendered-status-\$\{statusState\}/);
  assert.match(renderer, /sf-media-library-state-changed/);
  assert.match(renderer, /sf-native-ui-session-proof-changed/);
  assert.match(nativeShell, /previousSessionProven !== sessionProven[\s\S]*?sf-native-ui-session-proof-changed/,
    'native session proof changes wake the Web renderer without exposing account data');
  assert.match(renderer, /window\.location\.assign\('https:\/\/accounts\.spotify\.com\/login'\)/,
    'an expired session has a recovery path through Spotify’s official sign-in page');
  assert.match(runtime, /session-unproven/,
    'the packaged renderer is regenerated from the session-gated source');
  assert.match(css, /sf-melodix-home__status--error[\s\S]*?sf-melodix-home__retry/);
});

test('the CI Home integration contains no fake account data or credentials and labels its renderer proof as a fixture', () => {
  const harness = read('tests/android/HomeRenderInstrumentation.java');
  const inspector = read('tests/android/inspect_hierarchy.py');
  assert.doesNotMatch(harness, /spotify:playlist:|FIXTURE_TITLE|FIXTURE_JSON|Bearer\s+[A-Za-z0-9._-]+|sp_dc=/i);
  assert.match(harness, /fixture is test-only; its explicit[\s\S]*renderer-session flag/i);
  assert.match(harness, /window\.__sfNativeUiSessionProven=true/,
    'the isolated fixture supplies a renderer-only proof and is not labeled as Spotify authentication');
  assert.match(harness, /authenticated_home_test_performed", false/);
  assert.match(harness, /onNativeUiData"\s*,\s*String\.class\s*,\s*String\.class/);
  assert.match(harness, /LOGIN_DOM_PROBE[\s\S]*?awaitLoginUiVisible\(webView\)/,
    'the clean session checks for actual login DOM before the recovery transition');
  assert.match(harness, /login_ui_visible_in_webview_dom/);
  assert.match(harness, /login_dom_probe_completed/,
    'the DOM probe records an explicit false result before failing, instead of making absence of status look like false');
  assert.match(harness, /Log\.e\(HARNESS_TAG, "failure phase=" \+ failurePhase \+ " type=" \+ failure\.getClass\(\)\.getSimpleName\(\)\)/,
    'instrumentation failures expose only a phase and exception type, never page text');
  assert.match(harness, /"home",\s*"\[\]"/,
    'the integration sends only an empty Home payload to test the safe fallback');
  assert.match(harness, /putBoolean\("native_home_cards_attached", false\)/);
  assert.match(inspector, /splash_accessibility_visible/);
  assert.match(inspector, /webview_accessibility_node_present/);
  assert.match(inspector, /ui_hierarchy_top_node_package/,
    'a missing app surface records only the safe top hierarchy package/class, not raw text');
  assert.match(inspector, /screen_nonuniform=/,
    'a missing WebView node reports redacted full-screen pixel metrics');
  assert.match(inspector,
    /Path\(summary_path\)\.write_text[\s\S]*?if not webview_class_visible/,
    'redacted hierarchy and pixel diagnostics are saved before a visibility failure');
  assert.match(inspector, /fail\("startup_splash_accessibility_visible"\)/,
    'the screenshot check rejects a visible splash covering the WebView');
  assert.match(inspector, /notice title=Android login surface visibility[\s\S]*?webview_crop_bright_pixels/,
    'a passing login screenshot reports measured WebView pixels without raw page text');
  assert.doesNotMatch(inspector, /FIXTURE_TITLE|Controlled Home fixture|fixture_title/);
});
