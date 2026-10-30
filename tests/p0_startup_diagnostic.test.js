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
//   3. The renderer marks home-json/home-rendered so a shell stuck on an
//      empty screen is detected as CONTENT STUCK.
// Static opcode checks on the real Smali + polarity checks both ways (the
// recurring inversion bug). NOT executed: Android, device.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

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

// ---------------------------------------------------------------------------
// Part 1 - the timestamped stage chain
// ---------------------------------------------------------------------------

test('stage() appends the chain in addition to writing last_stage', () => {
  const body = methodBody(GUARD(), '.method public static stage(Ljava/lang/String;)V');
  assert.match(body, /NativeCrashGuard;->appendChain\(Ljava\/lang\/String;\)V/,
    'every stage call feeds the chain');
});

test('appendChain() timestamps each stage and caps the chain', () => {
  const body = methodBody(GUARD(), '.method private static appendChain(Ljava/lang/String;)V');
  assert.match(body, /SystemClock;->elapsedRealtime\(\)J/);
  assert.match(body, /sget-wide v1, Lcom\/melodix\/music\/NativeCrashGuard;->chainStart:J/);
  assert.match(body, /const-string v2, "stage_chain"/);
  assert.match(body, /const-string v2, "\+"/, 'entries look like name+Xs');
  assert.match(body, /const\/16 v4, 0x17c\s*\n\s*if-le v3, v4, :chain_append/,
    'a runaway caller cannot flood the prefs (cap check)');
  assert.ok(body.includes('cmp-long v5, v1, v3\n\n    if-nez v5, :chain_have_start'),
    'chainStart == 0 must initialise (polarity: if-nez jumps over the init only when already set)');
  assert.ok(!body.includes('if-eqz v5, :chain_have_start'),
    'the chainStart polarity must not be inverted (this exact bug shipped absolute timestamps)');
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

test('the home renderer marks home-json and home-rendered', () => {
  const body = methodBody(RENDERER(), '.method public static render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V');
  const head = body.slice(0, 400);
  assert.match(head, /const-string v0, "home-json"\n\n    invoke-static \{v0\}, Lcom\/melodix\/music\/NativeCrashGuard;->stage/,
    'the bridge delivery is the first mark of render()');
  assert.match(body, /const-string v2, "home-rendered"\n\n    invoke-static \{v2\}, Lcom\/melodix\/music\/NativeCrashGuard;->stage/,
    'parsed rows reaching the renderer is the content mark');
  const json = body.indexOf('"home-json"');
  const rendered = body.indexOf('"home-rendered"');
  assert.ok(json > -1 && rendered > json, 'home-rendered comes after home-json');
});

test('showNativeUi() replays the stored freeze report (never a crash message)', () => {
  const body = methodBody(MI(), '.method public final showNativeUi()V');
  assert.match(body, /invoke-static \{p0\}, Lcom\/melodix\/music\/StartupDiagnosticOverlay;->maybeShowStored\(Landroid\/app\/Activity;\)V/,
    'the replay runs on the p0-only call, before any register is live');
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
                   'smali/com/melodix/music/DiagnosticDismissListener.smali']) {
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

test('logDiagEvent keeps the JS status line in the prefs for the report', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(bridge, '.method public final logDiagEvent(Ljava/lang/String;)V');
  assert.ok(body.includes('NativeCrashGuard;->diagLine(Ljava/lang/String;)V'),
    'the web-side trail must survive without logcat');
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

test('the shell JS reports the silent hold (missing widget or bridge)', () => {
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes("diagTrace('ready-pending widget='"),
    'the most common freeze must leave a status line');
  assert.ok(js.includes('window.__sfNoWidgetCount % 20 === 0'),
    'the hold trace is throttled');
});


// ---------------------------------------------------------------------------
// Part 6 - CONTENT STUCK fix: deterministic navigation to the web player
// ---------------------------------------------------------------------------

test('the shell opens the web player even without the landing CTA', () => {
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes('function maybeNavigateToPlayer()'),
    'the player must open regardless of the landing DOM');
  assert.ok(js.includes('function navToPlayer(n, href, frameSrc)'),
    'navigation is its own traced step');
  assert.ok(js.includes("diagTrace('player-nav try '"),
    'each navigation attempt is traced for the photo');
  assert.ok(js.includes("location.assign(target)"),
    'navigation is deterministic (synthetic click alone can be ignored)');
  assert.ok(js.includes("'https://open.spotify.com/app'") && js.includes("'https://open.spotify.com/search'"),
    'two player entry URLs are tried in order');
});

test('navigation is bounded across page loads (no loops)', () => {
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes("localStorage.getItem('mel_player_nav')"),
    'the attempt counter survives page navigations');
  assert.ok(js.includes('playerNavCount() >= 2'),
    'at most two attempts per window');
  assert.ok(js.includes('(Date.now() - rec.t) < 60000'),
    'a fresh launch gets a fresh chance');
});

test('runUpdate tries the navigation before waiting for the player DOM', () => {
  const js = read('assets/native_ui_shell.js');
  const body = js.slice(js.indexOf('function runUpdate()'), js.indexOf('function runUpdate()') + 700);
  assert.ok(body.includes('domCensusOnce();') && body.includes('maybeNavigateToPlayer();'));
  assert.ok(body.indexOf('maybeNavigateToPlayer();') < body.indexOf('mainView = findMainView();'),
    'the navigation check runs even when the player root is absent');
});

test('the DOM census names the page for the next photo', () => {
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes("diagTrace('dom census m='"),
    'the photo must show what the page really holds');
  assert.ok(js.includes(" t=' + title + ' h=' + h1 + ' g=' + ids"),
    'title, first heading and a data-testid sample identify the page');
  assert.ok(js.includes("' i=' + ifr"),
    'iframes are counted (the player may be framed)');
});

test('the login-page snippet keeps its side effects and gains the fallback', () => {
  const c91 = read('smali/c91.smali');
  assert.ok(c91.includes('AndBridge.loginDetected();'),
    'loginDetected() must keep firing (existing behavior)');
  assert.ok(c91.includes('l.click();'),
    'the CTA click is still the first attempt');
  assert.ok(c91.includes('player-cta nav'),
    'the deterministic fallback is traced');
  assert.ok(c91.includes('window.location.assign(t);'),
    'the fallback navigates when the click is ignored');
});


// ---------------------------------------------------------------------------
// Part 7 - wrapper page with a framed player: navigate, timers or not
// ---------------------------------------------------------------------------

test('the iframe hosting the player is the preferred navigation target', () => {
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes('function iframePlayerSrc()'),
    'the wrapper page frames the player - its src is the door');
  const nav = js.slice(js.indexOf('function navToPlayer(n, href, frameSrc)'));
  assert.ok(nav.indexOf('frameSrc') < nav.indexOf("'https://open.spotify.com/app'"),
    'the iframe source wins over the guessed entry URLs');
  assert.ok(nav.indexOf('open.spotify.com') >= 0);
});

test('navigation does not depend on JS timers being alive', () => {
  const js = read('assets/native_ui_shell.js');
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

test('the census exposes the framed player sources', () => {
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes("diagTrace('dom iframes '"),
    'the photo must show what the iframes load');
  assert.ok(js.includes("getAttribute('src')"),
    'src attributes are readable even cross-origin');
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
// Part 9 - the native probe: decides and acts without any page script
// ---------------------------------------------------------------------------

test('the probe script accepts consent walls and opens the framed player', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(bridge, '.method public static runProbe(Landroid/webkit/WebView;)V');
  assert.ok(body.includes('probe t='), 'the photo shows title + visible text');
  assert.ok(body.includes('probe f='), 'the photo shows iframe sources');
  assert.ok(body.includes('probe consent '), 'a cookie wall is accepted');
  assert.ok(body.includes('probe nav frame'), 'the framed player is the preferred target');
  assert.ok(body.includes('open.spotify.com/app') && body.includes('open.spotify.com/search'),
    'player entry URLs are tried in order');
  assert.ok(body.includes('mel_player_nav'), 'the same bounded counter prevents loops');
  assert.ok(body.includes('probe url='), 'the visited page is named (no query, no token)');
  assert.ok(body.includes('evaluateJavascript'),
    'evaluateJavascript runs synchronously - no JS timers involved');
});

test('follow-ups run on Android timers, immune to paused JS timers', () => {
  const bridge = read('smali/com/melodix/music/AndBridge.smali');
  const body = methodBody(bridge, '.method public static scheduleProbe(Landroid/webkit/WebView;II)V');
  assert.ok(body.includes('Lcom/melodix/music/AndBridgeProbe;-><init>(Landroid/webkit/WebView;I)V'));
  assert.ok(body.includes('Landroid/webkit/WebView;->postDelayed(Ljava/lang/Runnable;J)Z'),
    'View.postDelayed is an Android timer');
});

test('every finished open.spotify.com page is probed', () => {
  const c91 = read('smali/c91.smali');
  assert.ok(c91.includes('AndBridge;->runProbe(Landroid/webkit/WebView;)V'),
    'the probe runs right after the shell injection');
  assert.ok(c91.includes('AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V'),
    'and again after 3s');
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
  const js = read('assets/native_ui_shell.js');
  assert.ok(js.includes('function sfDeepQuery(sel)'),
    'queries walk into same-origin frames');
  assert.ok(js.includes('function findMainView()'));
  assert.ok(js.includes('mainView = findMainView();'),
    'runUpdate collects from the frame too');
  assert.ok(js.includes("userWidget = sfDeepQuery('button[data-testid=\"user-widget-link\"]"),
    'the takeover gate also looks into frames');
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
  const j = body.indexOf('if-nez v0, :probe_collect');
  const k = body.indexOf('sput-boolean v0, Lcom/melodix/music/AndBridge;->probeStarted:Z');
  assert.ok(i > -1 && j > -1 && k > -1 && j < k && k < i,
    'flag first, then reset, only on the first call');
  assert.ok(!/if-eqz v0, :probe_collect/.test(body),
    'polarity: if-nez = already started -> collect without touching the budget');
});
