#!/usr/bin/env node
'use strict';
// P0 on-screen freeze diagnostic tests. Device evidence: the phone freezes on
// "the same interface" and no report ever reaches the user - the watchdog
// wrote its report to prefs but nothing displayed it on the device. These
// pins cover the phone-visible diagnostic chain:
//   1. stage() records a TIMESTAMPED stage chain (the freeze report must show
//      the whole trail, not just the last step).
//   2. StartupDiagnosticOverlay renders the report as a tap-to-dismiss panel
//      over the current UI (one screenshot names the blocker) and replays a
//      stored hang report at the next shell takeover.
//   3. The renderer records attached Home cards; only the measured visibility
//      callback marks home-rendered, so an empty shell is CONTENT STUCK.
// Static opcode checks on the real Smali + polarity checks both ways (the
// recurring inversion bug). NOT executed: Android, device.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const ROOT = path.resolve(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8');
const GUARD = () => read('smali/com/melodix/music/NativeCrashGuard.smali');
const OVERLAY = () => read('smali/com/melodix/music/StartupDiagnosticOverlay.smali');
const DISMISS = () => read('smali/com/melodix/music/DiagnosticDismissListener.smali');
const RENDERER = () => read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
const MI = () => read('smali/com/melodix/music/MainActivity.smali');
const UNS = () => read('smali/com/melodix/music/StartupUnstickRunnable.smali');

function methodBody(src, sigStart) {
  const start = src.indexOf(sigStart);
  assert.ok(start >= 0, `method not found: ${sigStart}`);
  return src.slice(start, src.indexOf('.end method', start));
}

function nativeProbeScript() {
  const body = methodBody(
    read('smali/com/melodix/music/AndBridge.smali'),
    '.method public static runProbe(Landroid/webkit/WebView;)V'
  );
  const marker = body.indexOf(':probe_collect');
  const match = body.slice(marker).match(/const-string v0, "((?:\\.|[^"\\])*)"/);
  assert.ok(match, 'the native probe JavaScript is embedded in the Smali method');
  return JSON.parse(`"${match[1]}"`);
}

// ---------------------------------------------------------------------------
// Part 1 - the timestamped stage chain
// ---------------------------------------------------------------------------

test('stage() appends the chain in addition to writing last_stage', () => {
  const body = methodBody(GUARD(), '.method public static stage(Ljava/lang/String;)V');
  assert.match(body, /NativeCrashGuard;->appendChain\(Ljava\/lang\/String;\)V/,
    'every stage call feeds the chain');
});

test('diagnostic stage chains never persist Spotify routes or login URLs', () => {
  const pageStart = methodBody(read('smali/c91.smali'),
    '.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V');
  const splashRunnable = methodBody(read('smali/zk0.smali'), '.method public final run()V');
  assert.doesNotMatch(pageStart, /sput-object [^,]+, Lcom\/melodix\/music\/AppSingleton;->g0:Ljava\/lang\/String;/,
    'the full top-level URL remains transient in WebView');
  assert.match(splashRunnable, /const-string v0, "webview-revealed"[\s\S]*?NativeCrashGuard;->stage\(Ljava\/lang\/String;\)V/,
    'the completion trace uses a fixed allowlisted label');
  assert.doesNotMatch(splashRunnable, /AppSingleton;->g0:Ljava\/lang\/String;/,
    'a route never becomes the persisted last stage');
});

test('VerifyError text is captured only for a nonce-armed debuggable Preview and never reaches UI/logs', () => {
  const guard = GUARD();
  const record = methodBody(guard, '.method public static record(Ljava/lang/Throwable;)V');
  const recordWithSource = methodBody(guard,
    '.method public static recordWithSource(Ljava/lang/Throwable;Ljava/lang/String;)V');
  const verifyTarget = methodBody(guard,
    '.method private static recordVerifyTarget(Ljava/lang/Throwable;Ljava/lang/String;)V');
  const pendingCapture = methodBody(guard,
    '.method private static takePendingVerifyCapture(Landroid/content/Context;)Ljava/lang/String;');
  const install = methodBody(guard, '.method public static install(Landroid/content/Context;)V');
  const storeDiagnostic = methodBody(guard,
    '.method private static storeVerifyDiagnostic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V');
  const storeVerifyTarget = methodBody(guard,
    '.method private static storeVerifyTarget(Ljava/lang/String;Ljava/lang/String;)V');
  const excerpt = methodBody(guard, '.method public static excerpt(Ljava/lang/Throwable;)Ljava/lang/String;');
  const uncaught = methodBody(guard, '.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V');
  const lastReport = methodBody(guard, '.method public static lastReport()Ljava/lang/String;');
  const sanitize = methodBody(guard, '.method private static sanitizeStoredReport(Ljava/lang/String;)Ljava/lang/String;');
  const clearTrail = methodBody(guard, '.method private static clearDiagnosticTrail()V');
  const clearReport = methodBody(guard, '.method private static clearReport()V');

  assert.match(record, /if-eqz p0, :done[\s\S]*?recordWithSource\(Ljava\/lang\/Throwable;Ljava\/lang\/String;\)V/);
  assert.match(recordWithSource, /Object;->getClass\(\)Ljava\/lang\/Class;[\s\S]*?write\(Ljava\/lang\/String;\)V[\s\S]*?recordVerifyTarget\(Ljava\/lang\/Throwable;Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(recordWithSource, /getStackTraceString|getMessage|printStackTrace/);
  assert.match(excerpt, /Class;->getSimpleName\(\)Ljava\/lang\/String;/);
  assert.doesNotMatch(excerpt, /getStackTraceString|getMessage|printStackTrace/);

  assert.match(pendingCapture, /getPackageName\(\)Ljava\/lang\/String;[\s\S]*?com\.melodix\.music\.preview[\s\S]*?getApplicationInfo\(\)Landroid\/content\/pm\/ApplicationInfo;[\s\S]*?ApplicationInfo;->flags:I[\s\S]*?arm-pending[\s\S]*?last_verify_run_id[\s\S]*?\[0-9a-f\]\{16\}/,
    'capture requires the exact Preview package, debuggable flag, pending state, and short nonce');
  assert.doesNotMatch(pendingCapture, /getMessage|Intent;|Activity;/,
    'the application-level arm works before MainActivity is loaded and never reads exception text');
  assert.match(install, /takePendingVerifyCapture[\s\S]*?clearDiagnosticTrail[\s\S]*?verifyCaptureRunId[\s\S]*?writeVerifyCaptureArmed/,
    'Application startup consumes the one-shot nonce before clearing and recording a VerifyError');

  assert.match(verifyTarget, /instance-of v0, p0, Ljava\/lang\/VerifyError;/,
    'only VerifyError is eligible for structured message capture');
  assert.match(verifyTarget, /Throwable;->getMessage\(\)Ljava\/lang\/String;[\s\S]*?Pattern;->compile\(Ljava\/lang\/String;\)Ljava\/util\/regex\/Pattern;[\s\S]*?Matcher;->group\(I\)Ljava\/lang\/String;/,
    'the transient message is parsed for app class/method identifiers');
  assert.match(verifyTarget, /sget-object v4, Lcom\/melodix\/music\/NativeCrashGuard;->verifyCaptureRunId:Ljava\/lang\/String;[\s\S]*?storeVerifyDiagnostic\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/,
    'the raw message is persisted only when the in-memory nonce is armed');
  assert.doesNotMatch(verifyTarget, /NativeCrashGuard;->write\(Ljava\/lang\/String;\)V|Log;->|showLastReport|appendDiagnosticLine/,
    'the exception message is never logged, displayed or placed in the crash report');

  assert.match(storeVerifyTarget, /"last_verify_class"[\s\S]*?putString[\s\S]*?"last_verify_method"[\s\S]*?putString/);
  assert.match(storeDiagnostic, /"last_verify_message"[\s\S]*?putString[\s\S]*?"last_verify_elapsed_ms"[\s\S]*?putLong/);
  assert.match(storeDiagnostic, /const\/16 v3, 0x1000[\s\S]*?String;->substring\(II\)Ljava\/lang\/String;/,
    'the private temporary message is length-bounded');
  assert.match(storeDiagnostic, /"MDXVERIFY"[\s\S]*?Log;->i\(Ljava\/lang\/String;Ljava\/lang\/String;\)I/);
  assert.doesNotMatch(storeDiagnostic, /Log;->i[\s\S]*?p0/,
    'logcat contains only run ID and fixed source metadata, never the raw message');

  for (const body of [clearTrail, clearReport]) {
    for (const key of ['last_verify_message', 'last_verify_run_id', 'last_verify_source', 'last_verify_state']) {
      assert.ok(body.includes(`"${key}"`), `${key} is cleared before a new capture or report dismissal`);
    }
  }
  assert.doesNotMatch(lastReport + excerpt + sanitize, /last_verify_message/,
    'the raw capture key is never read by an app-visible report path');
  assert.match(uncaught, /const-string v1, "uncaught-exception"[\s\S]*?recordWithSource\(Ljava\/lang\/Throwable;Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(uncaught, /getStackTraceString/);
  assert.match(lastReport, /NativeCrashGuard;->sanitizeStoredReport\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
  assert.match(sanitize, /0x1000[\s\S]*?STARTUP STUCK[\s\S]*?CONTENT STUCK/);
  assert.match(sanitize, /Exception\|Error\|Throwable/);
  assert.match(sanitize, /Previous diagnostic details redacted/);
});

test('diagnostic events share one ephemeral per-process correlation id', () => {
  const guard = GUARD();
  assert.match(guard, /\.field private static diagnosticSessionId:Ljava\/lang\/String;/);
  const id = methodBody(guard, '.method public static declared-synchronized diagnosticSessionId()Ljava/lang/String;');
  assert.match(id, /UUID;->randomUUID\(\)Ljava\/util\/UUID;/);
  assert.match(id, /String;->substring\(II\)Ljava\/lang\/String;/,
    'the random correlation id is short and contains no account-derived data');
  assert.match(id, /sput-object v0, Lcom\/melodix\/music\/NativeCrashGuard;->diagnosticSessionId:Ljava\/lang\/String;/);

  const diagLine = methodBody(guard, '.method public static diagLine(Ljava/lang/String;)V');
  assert.match(diagLine, /NativeCrashGuard;->diagnosticSessionId\(\)Ljava\/lang\/String;/);
  assert.match(diagLine, /const-string v1, "sid="/);
  assert.match(diagLine, /String;->startsWith\(Ljava\/lang\/String;\)Z/,
    'a JS event with the same id is not double-prefixed');

  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const jsGetter = methodBody(bridge, '.method public final getDiagnosticSessionId()Ljava/lang/String;');
  assert.match(jsGetter, /annotation runtime Landroid\/webkit\/JavascriptInterface;/);
  assert.match(jsGetter, /NativeCrashGuard;->diagnosticSessionId\(\)Ljava\/lang\/String;/);
  const bridgeLog = methodBody(bridge, '.method public final logDiagEvent(Ljava/lang/String;)V');
  assert.match(bridgeLog, /NativeCrashGuard;->diagnosticSessionId\(\)Ljava\/lang\/String;/);
  assert.match(bridgeLog, /const-string v5, "sid="/);
  assert.match(bridgeLog, /AndBridge;->safeDiagnosticEvent\(Ljava\/lang\/String;\)Ljava\/lang\/String;/,
    'untrusted page text is reduced to a fixed event category before logging');
  const safeEvent = methodBody(bridge, '.method private final safeDiagnosticEvent(Ljava/lang/String;)Ljava/lang/String;');
  assert.match(safeEvent, /:diagnostic_event_unknown[\s\S]*?const-string v0, "js-event"/);
  assert.doesNotMatch(bridgeLog, /invoke-virtual \{[^}]*p1[^}]*\}, Ljava\/lang\/String;->(?:concat|substring)/,
    'the raw JS string is never copied into a diagnostic sink');
});

test('appendChain() timestamps each stage and caps the chain', () => {
  const body = methodBody(GUARD(), '.method private static appendChain(Ljava/lang/String;)V');
  assert.match(body, /SystemClock;->elapsedRealtime\(\)J/);
  assert.match(body, /sget-wide v1, Lcom\/melodix\/music\/NativeCrashGuard;->chainStart:J/);
  assert.match(body, /const-string v2, "stage_chain"/);
  assert.match(body, /const-string v2, "\+"/, 'entries look like name+Xs');
  assert.match(body, /const\/16 v4, 0x400\s*\n\s*if-le v3, v4, :chain_append/,
    'the 1 KiB cap preserves the expanded startup milestones without allowing unbounded prefs growth');
  assert.ok(body.includes('cmp-long v5, v1, v3\n\n    if-nez v5, :chain_have_start'),
    'chainStart == 0 must initialise (polarity: if-nez jumps over the init only when already set)');
  assert.ok(!body.includes('if-eqz v5, :chain_have_start'),
    'the chainStart polarity must not be inverted (this exact bug shipped absolute timestamps)');
});

test('asset-loaded stages require non-empty content and only fixed APK asset names', () => {
  const body = methodBody(GUARD(), '.method public static stageLoadedAsset(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(body, /if-eqz p0, :asset_stage_done/);
  assert.match(body, /if-eqz p1, :asset_stage_done/);
  assert.match(body, /String;->isEmpty\(\)Z/);
  for (const asset of ['native_ui_shell.js', 'spotify_bridge.js', 'melodix_home.js', 'css_hacks.css']) {
    assert.ok(body.includes(`"${asset}"`), `fixed asset allowlist includes ${asset}`);
  }
  assert.match(body, /NativeCrashGuard;->stage\(Ljava\/lang\/String;\)V/);
  assert.doesNotMatch(body, /StringBuilder|concat\(/, 'untrusted asset names never become persisted stage labels');
});

test('stageChain() is public and fails safe to the empty string', () => {
  const guard = GUARD();
  assert.match(guard, /\.method public static stageChain\(\)Ljava\/lang\/String;/);
  const body = methodBody(guard, '.method public static stageChain()Ljava/lang/String;');
  assert.match(body, /:empty\n    const-string v0, ""/);
});

// ---------------------------------------------------------------------------
// Part 2 - the on-screen panel
// ---------------------------------------------------------------------------

test('overlay show() attaches a scrolling tap-to-dismiss panel to the decor', () => {
  const body = methodBody(OVERLAY(), '.method public static show(Landroid/app/Activity;Ljava/lang/String;)V');
  assert.match(body, /Landroid\/widget\/ScrollView;-><init>\(Landroid\/content\/Context;\)V/);
  assert.match(body, /Landroid\/widget\/TextView;-><init>\(Landroid\/content\/Context;\)V/);
  assert.match(body, /Landroid\/app\/Activity;->addContentView\(Landroid\/view\/View;Landroid\/view\/ViewGroup\$LayoutParams;\)V/);
  assert.match(body, /DiagnosticDismissListener;-><init>\(Landroid\/view\/View;\)V/);
  assert.match(body, /View;->setOnClickListener\(Landroid\/view\/View\$OnClickListener;\)V/,
    'tapping the panel removes it');
  assert.match(body, /\.catch Ljava\/lang\/Throwable;/,
    'a broken diagnostic must never crash the app');
});

test('overlay show() displays one panel per process (no stacking)', () => {
  const body = methodBody(OVERLAY(), '.method public static show(Landroid/app/Activity;Ljava/lang/String;)V');
  assert.match(body, /sget-boolean v0, Lcom\/melodix\/music\/StartupDiagnosticOverlay;->shown:Z\n\n    if-nez v0, :done/,
    'polarity: already-shown must skip (if-nez jumps to :done)');
  assert.match(body, /sput-boolean v0, Lcom\/melodix\/music\/StartupDiagnosticOverlay;->shown:Z/);
});

test('overlay null fallbacks are not inverted (null -> fallback text)', () => {
  // The recurring polarity bug: "if (x == null) x = fallback" is if-nez to
  // the skip label - the inverted if-eqz form replaces valid text instead.
  const report = methodBody(OVERLAY(), '.method public static buildReport(Ljava/lang/String;)Ljava/lang/String;');
  assert.match(report, /if-nez p0, :phase_ok\n\n    const-string p0, "\(sans phase\)"/);
  assert.ok(!/if-eqz p0, :phase_ok/.test(report), 'phase fallback must not be inverted');
  const show = methodBody(OVERLAY(), '.method public static show(Landroid/app/Activity;Ljava/lang/String;)V');
  assert.match(show, /if-nez p1, :have_text\n\n    const-string p1, "\(rapport vide\)"/);
  assert.ok(!/if-eqz p1, :have_text/.test(show), 'text fallback must not be inverted');
});

test('buildReport() names the phase, the device, the stage chain and the main thread', () => {
  const body = methodBody(OVERLAY(), '.method public static buildReport(Ljava/lang/String;)Ljava/lang/String;');
  assert.match(body, /Landroid\/os\/Build;->MODEL:Ljava\/lang\/String;/);
  assert.match(body, /Landroid\/os\/Build\$VERSION;->SDK_INT:I/);
  assert.match(body, /NativeCrashGuard;->stageChain\(\)Ljava\/lang\/String;/);
  assert.match(body, /NativeCrashGuard;->lastStage\(\)Ljava\/lang\/String;/);
  assert.match(body, /Looper;->getMainLooper\(\)Landroid\/os\/Looper;/);
  assert.match(body, /Thread;->getStackTrace\(\)\[Ljava\/lang\/StackTraceElement;/);
  assert.ok(!/access_token|refresh_token|Bearer /.test(body), 'no token material in the report');
});

test('maybeShowStored() replays hang reports only, never crash records', () => {
  const body = methodBody(OVERLAY(), '.method public static maybeShowStored(Landroid/app/Activity;)V');
  assert.match(body, /NativeCrashGuard;->lastReport\(\)Ljava\/lang\/String;/);
  assert.match(body, /const-string v1, "STARTUP STUCK"/);
  assert.match(body, /const-string v1, "CONTENT STUCK"/);
  assert.match(body, /String;->startsWith\(Ljava\/lang\/String;\)Z/);
  assert.match(body, /StartupDiagnosticOverlay;->show\(Landroid\/app\/Activity;Ljava\/lang\/String;\)V/,
    'the stored report reaches the panel');
});

test('the dismiss listener removes the panel from its parent', () => {
  const d = DISMISS();
  assert.match(d, /\.implements Landroid\/view\/View\$OnClickListener;/);
  const body = methodBody(d, '.method public final onClick(Landroid/view/View;)V');
  assert.match(body, /View;->getParent\(\)Landroid\/view\/ViewParent;/);
  assert.match(body, /ViewGroup;->removeView\(Landroid\/view\/View;\)V/);
});

// ---------------------------------------------------------------------------
// Part 3 - the content markers and the next-launch replay hook
// ---------------------------------------------------------------------------

test('Home distinguishes attached cards/status from content verified visible after the splash', () => {
  const body = methodBody(RENDERER(), '.method public static render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V');
  const reset = body.indexOf('beginNativeHomeRender()V');
  const json = body.indexOf('"home-json"');
  const cardAttached = body.indexOf('noteNativeHomeCardAttached(Landroid/view/View;)V');
  const cardStage = body.indexOf('"home-cards-attached"');
  const statusAttached = body.indexOf('renderHomeStatus');
  const statusStage = body.indexOf('"native-home-status-attached"');
  assert.ok(reset >= 0 && json > reset, 'each payload resets stale Home state before its receipt trace');
  assert.ok(cardAttached > json && cardStage > cardAttached,
    'real Spotify cards are marked separately before requesting a takeover');
  assert.ok(statusAttached > json && statusStage > statusAttached,
    'explicit state text has its own attached marker, never the card marker');
  assert.doesNotMatch(body, /nativeHomeContentReady:Z|"home-rendered"/,
    'the renderer cannot claim pixels are visible');
  assert.match(body, /:shelf_no_cards[\s\S]*?home-render-failed[\s\S]*?retry-library/);
  assert.doesNotMatch(body, /revealWebUi\(\)V/,
    'empty or malformed Home becomes a native retry state rather than a WebView takeover');

  const activity = methodBody(MI(), '.method public final completeNativeUiVisibility(Z)Z');
  const firstMeasure = activity.indexOf('hasMeasuredVisibleNativeHomeContent()Z');
  const overlayRemoved = activity.indexOf('hideStartupOverlay()V');
  const secondMeasure = activity.indexOf('hasMeasuredVisibleNativeHomeContent()Z', firstMeasure + 1);
  const rendered = activity.indexOf('"home-rendered"');
  assert.ok(firstMeasure >= 0 && overlayRemoved > firstMeasure &&
    secondMeasure > overlayRemoved && rendered > secondMeasure,
    'home-rendered follows two measured global-visibility checks around splash removal');
  assert.match(activity, /native-home-card-visible=true[\s\S]*?native-home-status-visible=true/);
  assert.match(activity, /sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->l:Z[\s\S]*?sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);
});

test('showNativeUiFrom() replays the stored freeze report (never a crash message)', () => {
  const body = methodBody(MI(), '.method public final showNativeUiFrom(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(body, /StartupDiagnosticOverlay;->maybeShowStored\(Landroid\/app\/Activity;\)V/,
    'the replay remains part of the recovered native shell request');
});

test('the unstick runnable shows the panel first, then unstick only on demand', () => {
  const body = methodBody(UNS(), '.method public final run()V');
  const panel = body.indexOf('StartupDiagnosticOverlay;->show');
  const unstick = body.indexOf('showNativeUi()V');
  assert.ok(panel > -1 && unstick > -1 && panel < unstick,
    'the panel must be on screen before any UI rescue');
  assert.match(body, /iget-boolean v1, p0, Lcom\/melodix\/music\/StartupUnstickRunnable;->unstick:Z\n\n    if-eqz v1, :unstick_done/,
    'polarity: unstick == false must skip showNativeUi');
});

test('model: a stuck shell is a content freeze, a stuck start is a startup freeze', () => {
  // The two freezes are the same user complaint and need the same evidence:
  // phase label + stage chain + main-thread stack on the screen.
  const classify = ({ shellShown, contentArrived }) => {
    if (!shellShown) return 'STARTUP STUCK';
    return contentArrived ? null : 'CONTENT STUCK';
  };
  assert.equal(classify({ shellShown: false, contentArrived: false }), 'STARTUP STUCK');
  assert.equal(classify({ shellShown: true, contentArrived: false }), 'CONTENT STUCK');
  assert.equal(classify({ shellShown: true, contentArrived: true }), null,
    'a healthy launch never shows the panel');
});


// ---------------------------------------------------------------------------
// Part 4 - verifier safety: never copy a Z result into an object register
// ---------------------------------------------------------------------------

test('no 32-bit invoke result is copied with move-result-object (ART verifier)', () => {
  // Regression pin: a commit()Z followed by move-result-object made the whole
  // NativeCrashGuard class fail verification on the API 25 emulator
  // (VerifyError -> NoClassDefFoundError at startup). move-result-object may
  // only follow an invoke whose descriptor returns a reference type.
  for (const f of ['smali/com/melodix/music/NativeCrashGuard.smali',
                   'smali/com/melodix/music/StartupDiagnosticOverlay.smali',
                   'smali/com/melodix/music/StartupHangWatchdog.smali',
                   'smali/com/melodix/music/StartupUnstickRunnable.smali',
                   'smali/com/melodix/music/DiagnosticDismissListener.smali',
                   'smali/com/melodix/music/NativeWebPlayerNavigationRunnable.smali']) {
    const src = read(f);
    const lines = src.split('\n');
    for (let i = 0; i < lines.length; i += 1) {
      if (/invoke-(virtual|interface|static|direct)[^\n]*\)Z$/.test(lines[i].trim())) {
        // the next non-blank instruction must not be move-result-object
        let j = i + 1;
        while (j < lines.length && lines[j].trim() === '') j += 1;
        assert.ok(j >= lines.length || !lines[j].includes('move-result-object'),
          `${f}:${i + 1}: Z result must use move-result, not move-result-object`);
      }
    }
  }
});


// ---------------------------------------------------------------------------
// Part 5 - the web-side trail: page state + JS status lines in the report
// ---------------------------------------------------------------------------

test('logDiagEvent persists a bounded event category with the native session id', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(bridge, '.method public final logDiagEvent(Ljava/lang/String;)V');
  assert.ok(body.includes('AndBridge;->safeDiagnosticEvent(Ljava/lang/String;)Ljava/lang/String;'),
    'the persisted value comes from a fixed category whitelist');
  assert.ok(body.includes('NativeCrashGuard;->diagnosticSessionId()Ljava/lang/String;'),
    'events correlate with this process without accepting a caller-supplied ID');
  assert.ok(body.includes('NativeCrashGuard;->diagLine(Ljava/lang/String;)V'),
    'the sanitized web-side trail must survive without logcat');
  assert.doesNotMatch(body, /substring|append\(Ljava\/lang\/String;\).*p1/,
    'no arbitrary input is truncated and then persisted');
});

test('diagLine stores a tail-bounded trail and lastDiag reads it back', () => {
  const guard = GUARD();
  const body = methodBody(guard, '.method public static diagLine(Ljava/lang/String;)V');
  assert.ok(body.includes('const-string v1, "last_diag"'), 'the trail key');
  assert.ok(body.includes('const/16 v3, 0x400') && body.includes('if-le v2, v3, :diag_store'),
    'a chatty caller cannot flood the prefs (tail cap)');
  assert.ok(body.includes('String;->substring(I)Ljava/lang/String;'),
    'the tail is kept, not the head');
  assert.ok(guard.includes('.method public static lastDiag()Ljava/lang/String;'),
    'the report can read the trail back');
});

test('a fresh app process clears transient diagnostics and verifier identifiers only', () => {
  const guard = GUARD();
  const install = methodBody(guard, '.method public static install(Landroid/content/Context;)V');
  const reset = methodBody(guard, '.method private static clearDiagnosticTrail()V');
  assert.ok(install.includes('NativeCrashGuard;->clearDiagnosticTrail()V'),
    'the current process must not display a stale JS trail from prior launches');
  assert.ok(install.includes('native-launch fresh') && install.includes('NativeCrashGuard;->diagLine(Ljava/lang/String;)V'),
    'the first persisted line identifies a fresh diagnostic run');
  assert.ok(reset.includes('const-string v1, "melodix_native"'));
  for (const key of ['last_diag', 'last_stage', 'stage_chain', 'last_verify_class', 'last_verify_method']) {
    assert.ok(reset.includes(`const-string v1, "${key}"`), `${key} is per-process diagnostic state`);
  }
  assert.match(reset, /SharedPreferences\$Editor;->remove\(Ljava\/lang\/String;\)/);
  assert.doesNotMatch(reset, /"last_crash"|"last_report"|"LoggedIn"|token/i,
    'crash/hang reports and the Spotify session are preserved');
});

test('webState names the page, the login detection and the JS trail', () => {
  const body = methodBody(OVERLAY(), '.method public static webState(Lcom/melodix/music/MainActivity;)Ljava/lang/String;');
  assert.ok(body.includes('Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;'),
    'the report reads the live WebView');
  assert.ok(body.includes('Landroid/webkit/WebView;->getUrl()Ljava/lang/String;'));
  assert.ok(body.includes('Landroid/webkit/WebView;->getProgress()I'));
  assert.ok(body.includes('Lcom/melodix/music/AppSingleton;->B:Z'),
    'loginDetected() state');
  assert.ok(body.includes('NativeCrashGuard;->lastDiag()Ljava/lang/String;'));
});

test('the panel report is enriched with the web state on the UI thread', () => {
  const body = methodBody(UNS(), '.method public final run()V');
  assert.ok(body.includes('StartupDiagnosticOverlay;->webState(Lcom/melodix/music/MainActivity;)Ljava/lang/String;'));
  const web = body.indexOf('webState');
  const show = body.indexOf('StartupDiagnosticOverlay;->show');
  assert.ok(web > -1 && show > -1 && web < show,
    'the web state is appended before the panel shows');
  assert.ok(body.includes('NativeCrashGuard;->write(Ljava/lang/String;)V'),
    'the stored report is enriched too');
});

test('the shell keeps process-correlated diagnostics free of session proof and page content', () => {
  const js = read('scripts/native_ui_shell.source.js');
  assert.ok(js.includes("diagTrace('ready-pending')"),
    'readiness reports only the pending handoff state, not a session verdict');
  assert.ok(js.includes("diagTrace('home-state sent')"),
    'status-only Home handoff is distinguishable without account contents');
  assert.ok(!js.includes('ready-pending proof='));
  assert.ok(!js.includes("' session=' + (sessionProven ? '1' : '0')"));
  assert.ok(js.includes('window.__sfNoWidgetCount % 20 === 0'),
    'the hold trace is throttled');
  assert.match(js, /getDiagnosticSessionId\(\)/,
    'each shell trace is correlated with the current process');
  assert.match(js, /bridge && typeof bridge\.logDiagEvent === 'function'\) bridge\.logDiagEvent\(message\)/,
    'the native sink applies its category whitelist');
  assert.doesNotMatch(js, /bridge\.logDiagEvent\(line\)/,
    'the JavaScript-only correlation prefix is not trusted as native diagnostic data');
  assert.match(js, /function safeErrorClass\(value\)/);
  assert.match(js, /function safeDiagnosticScreen\(value\)/);
  assert.doesNotMatch(js, /diagTrace\([^\n]*(?:document\.title|innerText|textContent|location\.href|spotifyRoutePath\(\)|session=|proof=|page=|session-unproven|session-rejected)/,
    'trace calls never include page content, raw paths, session/proof outcomes, or page signals');
});

test('the trace distinguishes WebView load, origin-gated AndBridge availability, and page completion', () => {
  const client = read('smali/c91.smali');
  const started = methodBody(client, '.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V');
  const attached = started.indexOf('addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V');
  const attachedStage = started.indexOf('"AndBridge-interface-attached"');
  const detached = started.indexOf('removeJavascriptInterface(Ljava/lang/String;)V');
  assert.ok(started.indexOf('"page-started"') >= 0 && attached > 0 && attachedStage > attached,
    'load start and successful interface registration have separate ordered marks');
  assert.ok(detached > 0 && started.indexOf('"AndBridge-interface-detached"') > detached,
    'non-player navigation records bridge detachment');
  const finished = methodBody(client, '.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V');
  assert.ok(finished.indexOf('"page-finished"') >= 0,
    'completion of the top-level document is distinct from its load start');
  assert.ok(finished.indexOf('"page-finished"') < finished.indexOf('"native_ui_shell.js"'),
    'runtime assets are queued only after the document has finished');
});


// ---------------------------------------------------------------------------
// Part 6 - CONTENT STUCK fix: deterministic navigation to the web player
// ---------------------------------------------------------------------------

test('native UI diagnostics keep route and row-title payloads out of persistent/report traces', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const route = methodBody(activity, '.method public final setNativeScreen(Ljava/lang/String;)V');
  const routeWhitelist = route.indexOf('const-string v0, "home"');
  const routeStore = route.indexOf('iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;');
  assert.ok(routeWhitelist >= 0 && routeStore > routeWhitelist,
    'only validated native screen categories reach stored screen state or route diagnostics');
  assert.match(route, /const-string v0, "native-route-rejected reason=unsupported"/);

  const data = methodBody(activity, '.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(data, /const-string v7, "native-payload"[\s\S]*?AppSingleton;->noteDiag\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
  const render = methodBody(activity, '.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
  assert.match(render, /const-string v7, "native-rows"[\s\S]*?AppSingleton;->noteDiag\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/lang\/String;\)V/);
  assert.match(render, /rows-received len=/);
  const traceStart = render.indexOf('# MDXTRACE: native side received a rows payload');
  const traceEnd = render.indexOf('# Rendering rows always means', traceStart);
  assert.ok(traceStart >= 0 && traceEnd > traceStart, 'the native row receipt trace is present');
  assert.doesNotMatch(render.slice(0, traceEnd), /invoke-static \{v8, p1, v9\}.*noteDiag|rows-received screen=|append\(v0, p1\)/,
    'playlist titles and incoming screen strings never enter diagnostic logs');
});

test('the shell opens the web player only through an allowlisted HTTPS URL', () => {
  const js = read('scripts/native_ui_shell.source.js');
  assert.ok(js.includes('function maybeNavigateToPlayer()'),
    'the player must open regardless of the landing DOM');
  assert.ok(js.includes('function safeWebPlayerUrl(raw, fallback)'),
    'all detected targets pass through one URL policy');
  const safeUrl = js.slice(js.indexOf('function safeWebPlayerUrl('), js.indexOf('function iframePlayerSrc()'));
  assert.ok(safeUrl.includes("url.protocol !== 'https:'"));
  assert.ok(safeUrl.includes("url.hostname.toLowerCase() !== 'open.spotify.com'"));
  assert.ok(safeUrl.includes('url.username || url.password'));
  assert.ok(js.includes('function navToPlayer(n, href, frameSrc)'),
    'navigation is its own traced step');
  assert.ok(js.includes("diagTrace('player-nav try '"),
    'each navigation attempt is traced for the photo');
  assert.ok(js.includes('window.AndBridge.loadWebPlayerUrl(target)'),
    'the allowlisted web route is loaded natively into the app WebView');
  const navigation = js.slice(js.indexOf('function navigateWebPlayer('), js.indexOf('function navToPlayer('));
  assert.doesNotMatch(navigation, /location\.assign/,
    'Spotify App Links must not hand recovery to Android as an external intent');
  assert.ok(js.includes("'https://open.spotify.com/app'") && js.includes("'https://open.spotify.com/search'"),
    'two player entry URLs are tried in order');
  const recovery = js.slice(js.indexOf('function maybeNavigateToPlayer()'), js.indexOf('function domCensusOnce()'));
  assert.doesNotMatch(recovery, /cta\.click\s*\(/,
    'the Android web-player CTA must never be synthetically clicked');
});

test('navigation is bounded across page loads (no loops)', () => {
  const js = read('scripts/native_ui_shell.source.js');
  assert.ok(js.includes("localStorage.getItem('mel_player_nav')"),
    'the attempt counter survives page navigations');
  assert.ok(js.includes('playerNavCount() >= 2'),
    'at most two attempts per window');
  assert.ok(js.includes('(Date.now() - rec.t) < 60000'),
    'a fresh launch gets a fresh chance');
});

test('runUpdate resolves the content root before navigation and refreshes its census', () => {
  const js = read('scripts/native_ui_shell.source.js');
  const start = js.indexOf('function runUpdate()');
  const body = js.slice(start, js.indexOf('function scheduleUpdate()', start));
  assert.ok(body.includes('mainView = findMainView();') && body.includes('domCensusOnce();') &&
    body.includes('maybeNavigateToPlayer(mainView, true);'));
  assert.ok(body.indexOf('mainView = findMainView();') < body.indexOf('domCensusOnce();') &&
    body.indexOf('domCensusOnce();') < body.indexOf('maybeNavigateToPlayer(mainView, true);'),
    'navigation sees the resolved semantic/fallback root before considering recovery');
});

test('the DOM census records only structural counts, not user-visible page content', () => {
  const js = read('scripts/native_ui_shell.source.js');
  const census = js.slice(js.indexOf('function domCensusOnce()'), js.indexOf('function runUpdate()'));
  assert.ok(census.includes("diagTrace('dom census m='"),
    'the structural state remains visible in the bounded trace');
  assert.ok(census.includes("diagTrace('dom iframes count='"),
    'iframe totals and the safe Spotify-frame count remain available');
  assert.match(census, /resourceCount/);
  assert.match(census, /anchorCount/);
  assert.doesNotMatch(census, /document\.title|innerText|textContent|getAttribute\('data-testid'\)|getAttribute\('src'\).*diagTrace|spotifyRoutePath\(\)/,
    'the census never serializes titles, headings, identifiers, URLs, or route paths');
});

test('the login-page CTA is observed without a synthetic click or duplicate navigation', () => {
  const c91 = read('smali/c91.smali');
  const ctaLine = c91.split('\n').find((line) => line.includes('player-cta observed; no auto-click'));
  assert.ok(ctaLine, 'the CTA observer remains present');
  // MEL-BUG-075: the CTA alone is NOT a login proof — the same control is on
  // logged-out pages. The marker is now asserted only from a positive auth
  // signal, and the observed state is journaled either way.
  assert.ok(ctaLine.includes('AndBridge.authUiSignal(s)'),
    'the observed auth state is journaled');
  assert.ok(ctaLine.includes("if(s!=='connected')return;"),
    'no proof without a positive auth signal');
  assert.ok(ctaLine.indexOf('AndBridge.loginDetected();') > ctaLine.indexOf("if(s!=='connected')return;"),
    'the login marker is guarded by the positive signal');
  assert.ok(ctaLine.includes('__sfPlayerCtaObserved'),
    'the marker only fires once per page');
  const embedded = ctaLine.match(/const-string v2, "([^"]+)"/);
  assert.ok(embedded, 'the observed-CTA JavaScript is embedded as a Smali string');
  assert.doesNotThrow(() => new Function(embedded[1]),
    'the compact JavaScript remains syntactically valid');
  assert.doesNotMatch(ctaLine, /\bl\.click\s*\(/,
    'detecting the CTA must not activate an Android app hand-off');
  assert.doesNotMatch(ctaLine, /window\.location\.(?:assign|replace)\s*\(/,
    'the native shell owns the single safe Web Player navigation path');
  assert.doesNotMatch(ctaLine, /player-cta nav/,
    'the old competing delayed navigation has been removed');
});


// ---------------------------------------------------------------------------
// Part 7 - wrapper page with a framed player: navigate, timers or not
// ---------------------------------------------------------------------------

test('the iframe hosting the player is preferred only after exact-host validation', () => {
  const js = read('scripts/native_ui_shell.source.js');
  assert.ok(js.includes('function iframePlayerSrc()'),
    'the wrapper page frames the player - its src is the door');
  const nav = js.slice(js.indexOf('function navToPlayer(n, href, frameSrc)'), js.indexOf('function sfDeepQuery('));
  assert.ok(nav.indexOf('safeFrame') < nav.indexOf('safeHref'),
    'a valid same-host iframe source wins over the CTA href');
  assert.ok(nav.indexOf('safeHref') < nav.indexOf('target = safeWebPlayerUrl(fallback'),
    'the fixed Web Player URL is the final fallback');
  assert.ok(nav.includes('open.spotify.com'));
});

test('navigation does not depend on JS timers being alive', () => {
  const js = read('scripts/native_ui_shell.source.js');
  const body = js.slice(js.indexOf('function maybeNavigateToPlayer()'),
    js.indexOf('function domCensusOnce()'));
  assert.ok(body.includes('navToPlayer(n, href, iframePlayerSrc());'),
    'the synchronous path navigates directly');
  assert.ok(body.includes('Date.now() - window.__sfShellStart < 2500'),
    'a grace period protects a player still rendering');
  const sched = js.slice(js.indexOf('function scheduleUpdate()'),
    js.indexOf('function scheduleUpdate()') + 400);
  assert.ok(!sched.includes('setTimeout'),
    'collecting must never wait for a paused timer');
  assert.ok(sched.includes('window.__sfLastUpdate'),
    'clock throttle instead of a debounce timer');
});

test('the census recognizes Spotify frames without logging their source URLs', () => {
  const js = read('scripts/native_ui_shell.source.js');
  const census = js.slice(js.indexOf('function domCensusOnce()'), js.indexOf('function runUpdate()'));
  assert.ok(census.includes("diagTrace('dom iframes count='"),
    'the photo includes a bounded frame count');
  assert.ok(census.includes("safeWebPlayerUrl(frames[i].getAttribute('src') || '', '')"),
    'frame origins are classified without retaining the URL');
  assert.doesNotMatch(census, /diagTrace\([^\n]*getAttribute\('src'\)/,
    'frame URLs are not passed to diagnostics');
});

test('the native safety net probes the page without any page JS', () => {
  const body = methodBody(UNS(), '.method public final run()V');
  assert.ok(body.includes('const-string v3, "CONTENT STUCK"'),
    'only the no-content verdict triggers it');
  assert.ok(body.includes('Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;'),
    'the live WebView is probed');
  assert.ok(body.includes('AndBridge;->runProbe(Landroid/webkit/WebView;)V'),
    'the probe runs immediately');
  assert.ok(body.includes('AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V'),
    'Android timers follow up (paused JS timers do not matter)');
});


// ---------------------------------------------------------------------------
// Part 8 - register hygiene: a mixed v0 at :no_panel rejects the whole class
// ---------------------------------------------------------------------------

test('the safety net never touches v0 (VerifyError guard)', () => {
  const raw = read('smali/com/melodix/music/StartupUnstickRunnable.smali');
  const body = methodBody(raw, '.method public final run()V');
  assert.ok(body.includes('.locals 4'),
    'the safety net gets its own registers');
  const net = body.slice(body.indexOf('const-string v3, "CONTENT STUCK"'));
  assert.ok(!net.includes('move-result v0') && !net.includes('iget-object v0'),
    'v0 must stay MainActivity on every path joining :no_panel');
  assert.ok(net.includes('move-exception v2'),
    'the catch handler must not clobber v0 either');
  const tail = body.slice(body.indexOf(':no_panel'));
  assert.ok(tail.includes('invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V'),
    ':no_panel still drives showNativeUi through v0');
});


// ---------------------------------------------------------------------------
// Part 9 - Android-side fallback probe; the page shell owns recovery when active
// ---------------------------------------------------------------------------

test('the probe uses redacted state, accepts consent walls, and routes through the native WebView', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(bridge, '.method public static runProbe(Landroid/webkit/WebView;)V');
  assert.ok(body.includes('probe dom='), 'the probe reports only whether a DOM exists');
  assert.ok(body.includes('probe iframe-count='), 'the probe reports bounded frame counts, not sources');
  assert.ok(body.includes('probe host='), 'the probe reports a coarse host category');
  assert.ok(body.includes('probe consent '), 'a cookie wall is accepted');
  assert.ok(body.includes('probe nav frame'), 'the framed player is the preferred target');
  assert.ok(body.includes('open.spotify.com/app') && body.includes('open.spotify.com/search'),
    'player entry URLs are tried in order');
  assert.ok(body.includes('window.AndBridge.loadWebPlayerUrl(frameNav)'),
    'framed player navigation stays inside the app WebView');
  assert.ok(body.includes('window.AndBridge.loadWebPlayerUrl(dest)'),
    'fallback player navigation stays inside the app WebView');
  assert.ok(!body.includes('window.location.assign'),
    'the recovery probe never launches a Spotify App Link externally');
  assert.ok(body.includes('mel_player_nav'), 'the same bounded counter prevents loops');
  assert.doesNotMatch(body, /document\.title|document\.body\.innerText|srcs\.join|probe url=|probe t=|probe f=/,
    'the probe never logs page text, route paths, or iframe URLs');
  assert.ok(body.includes('evaluateJavascript'),
    'the direct probe script does not rely on page-owned timers or callbacks');
});

test('the shell advertises completion only after install succeeds', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  assert.match(shell, /try \{\s*install\(\);\s*window\.__sfNativeUiShellCompleted = true;/,
    'successful installation sets the marker the probe trusts');
  assert.match(shell, /catch \(err\) \{[\s\S]*?window\.__sfNativeUiShellCompleted = false;/,
    'a partial shell failure keeps the native fallback enabled');
});

test('an active native shell owns recovery and the Android probe does not navigate over it', () => {
  const assigned = [];
  const logs = [];
  const location = {
    href: 'https://open.spotify.com/intl-fr/',
    assign: (url) => assigned.push(url),
  };
  const document = {
    querySelector: () => null,
    querySelectorAll: () => { throw new Error('active shell must stop the probe before iframe inspection'); },
  };
  const bridge = { logDiagEvent: (message) => logs.push(message) };
  const window = {
    __sfNativeUiShellStarted: true,
    __sfNativeUiShellCompleted: true,
    location,
    AndBridge: bridge,
    localStorage: {
      getItem: () => { throw new Error('active shell must stop before navigation state is read'); },
      setItem: () => { throw new Error('active shell must stop before navigation state is written'); },
    },
  };

  const result = vm.runInNewContext(nativeProbeScript(), {
    window, document, location, AndBridge: bridge, Date, JSON, String,
  });

  assert.equal(result, 'shell-active');
  assert.deepEqual(assigned, [], 'the probe cannot race the native UI shell with /app, /search or /');
  assert.ok(logs.includes('probe yield shell'), 'the hand-off is visible in startup diagnostics');
});

test('the native probe keeps its Web Player fallback in-app when shell startup did not complete', () => {
  const assigned = [];
  const loaded = [];
  const storage = new Map();
  const location = {
    href: 'https://open.spotify.com/intl-fr/',
    assign: (url) => assigned.push(url),
  };
  const document = {
    querySelector: () => null,
    querySelectorAll: () => [],
    title: 'Spotify - Web Player',
    body: { innerText: '' },
  };
  const bridge = {
    logDiagEvent: () => {},
    loadWebPlayerUrl: (url) => loaded.push(url),
  };
  const window = {
    __sfNativeUiShellStarted: true,
    __sfNativeUiShellCompleted: false,
    location,
    AndBridge: bridge,
    localStorage: {
      getItem: (key) => storage.get(key) || null,
      setItem: (key, value) => storage.set(key, value),
    },
  };

  const result = vm.runInNewContext(nativeProbeScript(), {
    window, document, location, AndBridge: bridge, Date, JSON, String,
  });

  assert.equal(result, 'nav');
  assert.deepEqual(loaded, ['https://open.spotify.com/app'],
    'the native recovery path loads the player without leaving the app');
  assert.deepEqual(assigned, [], 'the fallback never launches Spotify externally');
});

test('follow-ups run on Android timers, immune to paused JS timers', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(bridge, '.method public static scheduleProbe(Landroid/webkit/WebView;II)V');
  assert.ok(body.includes('Lcom/melodix/music/AndBridgeProbe;-><init>(Landroid/webkit/WebView;I)V'));
  assert.ok(body.includes('Landroid/webkit/WebView;->postDelayed(Ljava/lang/Runnable;J)Z'),
    'View.postDelayed is an Android timer');
});

test('every finished open.spotify.com page injects the shell before the Android fallback probe', () => {
  const c91 = read('smali/c91.smali');
  const shellAt = c91.indexOf('const-string v5, "native_ui_shell.js"');
  const probeAt = c91.indexOf('AndBridge;->runProbe(Landroid/webkit/WebView;)V');
  assert.ok(shellAt >= 0 && probeAt > shellAt,
    'the shell is queued first so the native probe can yield when it is active');
  assert.ok(c91.includes('AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V'),
    'Android-timed follow-up probes remain available as a fallback');
  assert.match(nativeProbeScript(), /__sfNativeUiShellCompleted === true/,
    'the probe checks whether the shell has claimed recovery');
});

test('the late native fallback only fires when the page is idle on the wrapper', () => {
  const probe = read('smali/com/melodix/music/AndBridgeProbe.smali');
  const body = methodBody(probe, '.method public final run()V');
  assert.ok(body.includes('Landroid/webkit/WebView;->getProgress()I'),
    'a running load is never interrupted');
  assert.ok(body.includes('native-nav late'),
    'the fallback is traced');
});

test('collectors see a player framed in a same-origin iframe', () => {
  const js = read('scripts/native_ui_shell.source.js');
  assert.ok(js.includes('function sfDeepQuery(sel)'),
    'queries walk into same-origin frames');
  assert.ok(js.includes('function findMainView()'));
  assert.ok(js.includes('mainView = findMainView();'),
    'runUpdate collects from the frame too');
  assert.ok(js.includes('function pageHasProfileSignal()') &&
      js.includes('profileSignal = pageHasProfileSignal();') &&
      js.includes('sessionProven = libraryProvesSession();'),
    'profile controls in same-origin frames remain diagnostic-only and do not prove a session');
});


// ---------------------------------------------------------------------------
// Part 10 - the panel leaves as soon as the content arrives
// ---------------------------------------------------------------------------

test('the diagnostic panel removes itself when the content arrives', () => {
  const overlay = OVERLAY();
  assert.ok(overlay.includes('.method public static dismissIfShowing()V'));
  const dismiss = methodBody(overlay, '.method public static dismissIfShowing()V');
  assert.ok(dismiss.includes('Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V'),
    'same removal as the tap listener');
  assert.ok(dismiss.includes('sput-object v0, Lcom/melodix/music/StartupDiagnosticOverlay;->panel:Landroid/view/View;'),
    'the panel reference is cleared');
  const show = methodBody(overlay, '.method public static show(Landroid/app/Activity;Ljava/lang/String;)V');
  assert.ok(show.includes('sput-object v0, Lcom/melodix/music/StartupDiagnosticOverlay;->panel:Landroid/view/View;'),
    'the panel keeps its reference for later dismissal');
});

test('showNativeUi dismisses the panel before any replay', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const i = main.indexOf('dismissIfShowing()V');
  const j = main.indexOf('maybeShowStored');
  assert.ok(i > -1 && j > -1 && i < j,
    'a recovered launch shows the content, not a stale panel');
});

test('a report written by this launch is never replayed as history', () => {
  const overlay = OVERLAY();
  const body = methodBody(overlay, '.method public static maybeShowStored(Landroid/app/Activity;)V');
  assert.ok(body.includes('Lcom/melodix/music/NativeCrashGuard;->written:Z'),
    'the same-launch marker gates the replay');
  const guard = GUARD();
  assert.ok(guard.includes('.field public static written:Z'));
  const write = methodBody(guard, '.method public static write(Ljava/lang/String;)V');
  assert.ok(write.includes('sput-boolean v0, Lcom/melodix/music/NativeCrashGuard;->written:Z'));
});


// ---------------------------------------------------------------------------
// Part 11 - the probe wakes the WebView before collecting
// ---------------------------------------------------------------------------

test('the probe resumes the WebView timers before evaluating anything', () => {
  const ab = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(ab, '.method public static runProbe(Landroid/webkit/WebView;)V');
  const i = body.indexOf('Landroid/webkit/WebView;->resumeTimers()V');
  const j = body.indexOf('Landroid/webkit/WebView;->onResume()V');
  const k = body.indexOf('evaluateJavascript');
  assert.ok(i > -1 && j > -1 && k > -1 && i < k && j < k,
    'frozen JS timers must wake before the collector runs');
});


// ---------------------------------------------------------------------------
// Part 14 - a relaunch starts with a fresh navigation budget
// ---------------------------------------------------------------------------

test('the first probe of a process resets the page-side navigation budget', () => {
  const ab = read('smali/com/melodix/music/AndBridge.smali');
  assert.ok(ab.includes('.field private static probeStarted:Z'));
  const body = methodBody(ab, '.method public static runProbe(Landroid/webkit/WebView;)V');
  const i = body.indexOf("removeItem('mel_player_nav')");
  const j = body.indexOf('if-nez v2, :probe_collect');
  const k = body.indexOf('sput-boolean v3, Lcom/melodix/music/AndBridge;->probeStarted:Z');
  assert.ok(i > -1 && j > -1 && k > -1 && j < k && k < i,
    'flag first, then reset, only on the first call');
  assert.ok(!/if-eqz v2, :probe_collect/.test(body),
    'polarity: if-nez = already started -> collect without touching the budget');
});

test('the probe reset never joins mixed register types at :probe_collect', () => {
  const ab = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(ab, '.method public static runProbe(Landroid/webkit/WebView;)V');
  assert.ok(body.includes('.locals 4'),
    'v2 (int flag) and v3 (reset script) are dedicated registers');
  const label = body.indexOf('\n    :probe_collect\n');
  assert.ok(label > -1, 'the join label exists on its own line');
  const before = body.slice(0, label);
  assert.ok(before.indexOf('const/4 v1, 0x0') < before.indexOf('if-nez v2, :probe_collect'),
    'v1 holds the same null on both paths into the join');
  const after = body.slice(label);
  assert.ok(after.indexOf('const/4 v1, 0x0') > -1 && after.indexOf('const-string v0') > -1,
    'v0/v1 are reassigned before use, so the join is never read');
});

test('markNativeSettingsPayloadApplied uses StringBuilder.append(String) for its comma literal', () => {
  const body = methodBody(MI(), '.method private final markNativeSettingsPayloadApplied(Ljava/lang/String;)V');
  assert.match(body,
    /const-string v3, ","\s+invoke-virtual \{v2, v3\}, Ljava\/lang\/StringBuilder;->append\(Ljava\/lang\/String;\)Ljava\/lang\/StringBuilder;/,
    'v3 is a String literal, so the invoked append prototype must accept String');
  assert.doesNotMatch(body, /append\(Ljava\/lang\/StringBuilder;\)/,
    'the method must not invoke a nonexistent StringBuilder.append(StringBuilder) overload');
});
