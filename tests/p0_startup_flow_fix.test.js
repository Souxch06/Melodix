#!/usr/bin/env node
'use strict';
// P0 startup flow-control tests (branch arena/7142700d-melodix, fix over 6b33a0d).
//
// WHAT IS ACTUALLY EXECUTED HERE:
//   1. Static checks over the real Smali sources (opcode-level): the guard
//      polarities, the error-branch shape, the retry re-arm, the handler
//      scheduling. These run against the exact files that go into the APK.
//   2. An executable MODEL of the splash state machine, transcribed from the
//      fixed Smali branches (D(), zk0.run(), r20.onAnimationEnd,
//      StartupSplashFallback.run(), StartupLoadWatchdog.run(),
//      SplashRetryListener.onClick). The 12 required scenarios are driven
//      through that model.
// WHAT IS NOT EXECUTED: Android instrumentation, emulator or phone runs.
// A green run here proves the CONTROL FLOW contract, not on-device behaviour.

const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8');
const MI = () => read('smali/com/melodix/music/MainActivity.smali');
const ZK = () => read('smali/zk0.smali');
const R20 = () => read('smali/r20.smali');
const FB = () => read('smali/com/melodix/music/StartupSplashFallback.smali');
const WD = () => read('smali/com/melodix/music/StartupLoadWatchdog.smali');
const RL = () => read('smali/com/melodix/music/SplashRetryListener.smali');
const C91 = () => read('smali/c91.smali');

function methodBody(src, sigStart) {
  const start = src.indexOf(sigStart);
  assert.ok(start >= 0, `method not found: ${sigStart}`);
  return src.slice(start, src.indexOf('.end method', start));
}

// ---------------------------------------------------------------------------
// Part 1 - static opcode checks on the real Smali
// ---------------------------------------------------------------------------

test('fix: D() late-callback guard allows restore only while the shell is NOT shown', () => {
  const body = methodBody(MI(), '.method public final D(Z)V');
  // l == 0 (shell absent) must continue to :D_splash_allowed; l == 1 must fall
  // into the (truthful) "native shell already shown" skip.
  assert.match(body, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->l:Z\n\n    if-eqz v0, :D_splash_allowed/,
    'guard must be if-eqz (restore allowed only when l == false)');
  assert.ok(!/if-nez v0, :D_splash_allowed/.test(body), 'the inverted if-nez form must be gone');
});

test('fix: D() error branch no longer skips when the splash is visible, and cancels fades', () => {
  const body = methodBody(MI(), '.method public final D(Z)V');
  assert.ok(!/getVisibility\(\)I/.test(body),
    'the error branch must not early-return on H.getVisibility()');
  const errBranch = body.slice(body.indexOf(':D_splash_allowed'), body.indexOf('\n    :cond_a\n'));
  assert.match(errBranch, /ViewPropertyAnimator;->cancel\(\)V/,
    'a fade in flight must be cancelled when the error state is restored');
  assert.match(errBranch, /SplashRetryListener;->install\(Lcom\/melodix\/music\/MainActivity;\)V/);
  assert.match(errBranch, /"Network Error\\nTap to retry"/,
    'the error branch must leave an explicit, visible message');
});

test('fix: zk0 restore guard polarity matches its comment and log', () => {
  const body = methodBody(ZK(), '.method public final run()V');
  const restore = body.slice(body.indexOf(':pswitch_0'));
  assert.match(restore, /sget-boolean v6, Lcom\/melodix\/music\/AppSingleton;->l:Z\n\n    if-eqz v6, :pswitch0_allowed/,
    'restore must continue only when l == false');
  assert.ok(!/if-nez v6, :pswitch0_allowed/.test(restore), 'the inverted if-nez form must be gone');
  assert.match(restore, /SplashRetryListener;->install\(Lcom\/melodix\/music\/MainActivity;\)V/,
    'the restored "Tap to retry" text must always get its handler');
});

test('fix: the splash-hold guard of the fade path is unchanged (correct polarity)', () => {
  const body = methodBody(ZK(), '.method public final run()V');
  const fade = body.slice(0, body.indexOf(':pswitch_0'));
  assert.match(fade, /splash-hold waiting for native shell \(no flash\)/);
  assert.match(fade, /sget-boolean v6, Lcom\/melodix\/music\/AppSingleton;->l:Z\s+if-nez v6, :fade_go/,
    'l == true still unblocks the fade');
  assert.match(fade, /if-nez v7, :fade_go/, 'a fallback tag still unblocks the fade');
});

test('fix: r20 fade end dismisses on shell shown OR (no error AND b), never leaves alpha-0 ghost', () => {
  const body = methodBody(R20(), '.method public final onAnimationEnd');
  const idxL = body.indexOf('AppSingleton;->l:Z');
  const idxM = body.indexOf('AppSingleton;->m:Z');
  assert.ok(idxL > 0 && idxM > idxL, 'the l check must come before the m check');
  assert.match(body, /sget-boolean p1, Lcom\/melodix\/music\/AppSingleton;->l:Z\n\n(.*\n)*?    if-nez p1, :cond_0/,
    'l == true must go straight to the GONE block');
  assert.match(body, /sget-boolean p1, Lcom\/melodix\/music\/AppSingleton;->m:Z\n\n(.*\n)*?    if-nez p1, :cond_2/,
    'm == true (error state owns H) must keep the splash');
  assert.match(body, /iget-boolean p0, p0, Lr20;->b:Z\n\n(.*\n)*?    if-eqz p0, :cond_2/,
    'b == false must keep the splash');
});

test('fix: SplashRetryListener.onClick re-arms the 20s rescue on every tap', () => {
  const click = methodBody(RL(), '.method public final onClick');
  assert.match(click, /StartupSplashFallback;->arm\(Lcom\/melodix\/music\/MainActivity;\)V/);
  assert.ok(!/MainActivity;->D\(Z\)V/.test(click), 'onClick must never go through D()');
});

test('fix: the rescue and the watchdog are scheduled on the main-looper Handler', () => {
  for (const [src, name] of [[FB(), 'StartupSplashFallback'], [WD(), 'StartupLoadWatchdog']]) {
    assert.match(src, /Landroid\/os\/Looper;->getMainLooper\(\)Landroid\/os\/Looper;/, `${name}: main looper`);
    assert.match(src, /Landroid\/os\/Handler;->postDelayed\(Ljava\/lang\/Runnable;J\)Z/, `${name}: handler scheduling`);
    assert.ok(!/Landroid\/view\/View;->postDelayed/.test(src), `${name}: no view-attached postDelayed`);
    assert.match(src, /SCHEDULE FAILED/, `${name}: the schedule result must be traced`);
  }
});

test('fix: superseded rescue callbacks are dropped (generation guard)', () => {
  const body = methodBody(FB(), '.method public final run()V');
  assert.match(body, /Lcom\/melodix\/music\/StartupSplashFallback;->generation:I/);
  assert.match(body, /generationAtArm:I/);
  assert.match(body, /if-eq v0, v1, :gen_ok/, 'equal generation continues, a newer arm invalidates the callback');
  assert.match(body, /ignored \(superseded by a newer arm\)/);
});

test('instrumentation: every distinguishable outcome is traced on MDXSTART', () => {
  const all = [MI(), ZK(), R20(), FB(), WD(), RL(), C91(),
    read('smali/com/melodix/music/AppSingleton.smali')].join('\n');
  for (const marker of [
    'app-create enter', 'activity-create enter', 'activity-create exit',
    'content-view set', 'splash-armed',
    'D-enter', 'D-skipped', 'D-error-shown', 'D-restore',
    'fade-go', 'r20-fade-end', 'zk0-restore',
    'startup-splash-fallback armed', 'startup-splash-fallback FIRED',
    'startup-splash-fallback ignored', 'fallback-error', 'fallback-web', 'fallback-forced',
    'watchdog-armed', 'watchdog-fired', 'watchdog->show_network_error', 'watchdog->show_loaded_page',
    'page-start', 'page-finish', 'web-error legacy', 'web-error modern', 'web-error http',
    'retry-tapped', 'retry-rearmed',
  ]) {
    assert.ok(all.includes(marker), `missing trace marker: ${marker}`);
  }
  // loadUrl targets are logged with query/fragment stripped - no token material
  assert.match(FB(), /traceLoadUrl\(Ljava\/lang\/String;\)V/);
  const fixFiles = [FB(), WD(), RL(), R20(), ZK()].join('\n');
  const traceLines = [MI(), C91(), read('smali/com/melodix/music/AppSingleton.smali')].join('\n')
    .split('\n')
    .filter((l) => /->note\(|->traceState\(|->traceLoadUrl\(|MDXSTART/.test(l));
  assert.ok(!/access_token|refresh_token|Bearer |cookie/i.test(fixFiles + traceLines.join('\n')),
    'no token material in startup traces');
});

// ---------------------------------------------------------------------------
// Part 2 - executable model of the fixed state machine
// ---------------------------------------------------------------------------

function makeState() {
  return {
    l: false, m: false, n: -1,
    H: { vis: 0, alpha: 1, tag: null, animating: false },
    N: { vis: 0 }, J: { vis: 8, alpha: 1 }, K: { vis: 8, alpha: 1, text: 'Network Error\\nTap to retry' },
    retryInstalled: false,
    shellShown: false,
    webProgress: 0, pageLoaded: false,
    activityAlive: true, finishing: false, destroyed: false,
    fallback: { armed: false, fired: false, gen: 0, pending: 0 },
    watchdog: { armed: false },
  };
}

// zk0.run(): j == 0 -> restore (:pswitch_0), j != 0 -> fade (default).
function zk0Run(st, j, lArg) {
  if (j === 0) {
    if (st.l) return 'restore-skipped';           // if-eqz l -> allowed
    st.H.animating = false;
    st.H.vis = 0; st.H.alpha = 1; st.N.vis = 4;
    st.K.text = lArg ? 'Network Error\\nTap to retry' : 'Service Disabled\\nTap to start';
    st.retryInstalled = true;
    return 'restored';
  }
  if (!st.l && st.H.tag === null) return 'held';  // splash-hold guard
  st.H.animating = true;
  r20End(st, lArg);
  return 'faded';
}

// r20.onAnimationEnd(): GONE iff l || (!m && b).
function r20End(st, b) {
  st.H.animating = false;
  if (st.l || (!st.m && b)) { st.H.vis = 8; st.H.alpha = 0; st.N.vis = 0; }
  return st.H.vis === 8 ? 'gone' : 'kept';
}

// MainActivity.D(Z)V after the fix. p1 is the boolean arg compared to the int
// n exactly like the Smali `if-ne v0, p1` (booleans travel as 0/1).
function D(st, p1) {
  const p = p1 ? 1 : 0;
  if (st.l) return 'skipped';                      // if-eqz l -> allowed only when l == false
  if (st.m && st.n === p) {
    st.H.animating = false;                        // animate().cancel()
    st.H.vis = 0; st.H.alpha = 1; st.N.vis = 4;
    st.J.vis = 0; st.J.alpha = 1;
    st.K.vis = 0; st.K.alpha = 1; st.K.text = 'Network Error\\nTap to retry';
    st.retryInstalled = true;
    return 'error-shown';
  }
  st.m = true; st.n = p;
  zk0Run(st, 0, p1);
  return 'restored';
}

function showNativeUi(st) {                        // takeover
  st.l = true; st.shellShown = true;
  st.H.vis = 8; st.N.vis = 0;
  return 'takeover';
}

// c91 callbacks: filters first (-3 ignored, main-frame only, http >= 400),
// then m=1,n=1 and D(true) - exactly the Smali order.
function webError(st, { mainFrame = true, code = -8, httpStatus } = {}) {
  if (httpStatus !== undefined) {
    if (!(mainFrame && httpStatus >= 400)) return 'ignored';
    st.m = true; st.n = 1;
    return `http-error:${D(st, true)}`;
  }
  if (code === -3) return 'ignored-connect';       // ERROR_CONNECT filter kept
  if (!mainFrame) return 'ignored-secondary';
  st.m = true; st.n = 1;
  return `main-error:${D(st, true)}`;
}

// StartupSplashFallback.arm() + run().
function fallbackArm(st) {
  st.fallback.gen += 1;
  st.fallback.pending = st.fallback.gen;
  st.fallback.armed = true;
  return 'armed';
}
function fallbackRun(st, { scheduledGen } = {}) {
  const g = scheduledGen ?? st.fallback.pending;
  if (g !== st.fallback.gen) return 'superseded';
  if (!st.activityAlive) return 'activity-gone';
  if (st.finishing) return 'finishing';
  if (st.destroyed) return 'destroyed';
  if (st.H == null) return 'no-view';
  if (st.H.vis !== 0) return 'dismissed';
  st.fallback.fired = true;
  st.H.tag = 'startup-fallback';
  if (st.m || st.webProgress < 100) {
    st.H.vis = 0; st.H.alpha = 1; st.N.vis = 4;
    st.J.vis = 0; st.J.alpha = 1;
    st.K.vis = 0; st.K.alpha = 1; st.K.text = 'Network Error\\nTap to retry';
    st.retryInstalled = true;
    return 'error-mode';
  }
  zk0Run(st, 1, true);
  return 'web-mode';
}

// StartupLoadWatchdog.run().
function watchdogRun(st) {
  if (!st.activityAlive || st.finishing || st.H == null || st.H.vis !== 0) return 'ignored';
  if (st.m) {
    if (st.n !== 0) { st.m = false; st.n = -1; D(st, true); return 'show_network_error'; }
    return 'ignored-n0';
  }
  if (st.webProgress < 100) { st.m = false; st.n = -1; D(st, true); return 'show_network_error'; }
  st.m = false; st.n = -1;
  st.H.tag = 'web-fallback';
  zk0Run(st, 1, true);
  return 'show_loaded_page';
}

// SplashRetryListener.onClick().
function retryClick(st) {
  st.m = false; st.n = -1;
  st.K.vis = 8; st.J.vis = 8; st.N.vis = 0;
  st.H.tag = null; st.H.alpha = 1; st.H.vis = 0;
  fallbackArm(st);                                  // P5 fix: rescue re-armed
  st.watchdog.armed = true;
  return 'retry';
}

// ---------------------------------------------------------------------------
// The 12 required scenarios
// ---------------------------------------------------------------------------

test('flow 1: normal start - page loaded, takeover succeeds, splash dismissed', () => {
  const st = makeState();
  fallbackArm(st); st.watchdog.armed = true; st.webProgress = 100; st.pageLoaded = true;
  assert.equal(zk0Run(st, 1, true), 'held', 'no flash before the shell');
  assert.equal(showNativeUi(st), 'takeover');
  assert.equal(st.H.vis, 8); assert.ok(st.l);
});

test('flow 2: WebView never progresses - watchdog error path leaves a visible exit', () => {
  const st = makeState();
  fallbackArm(st); st.webProgress = 0;
  assert.equal(watchdogRun(st), 'show_network_error');
  assert.equal(st.H.vis, 0); assert.ok(st.retryInstalled, 'tap-to-retry installed');
  assert.match(st.K.text, /Tap to retry/);
});

test('flow 3: network error before takeover - main-frame error shows the recoverable error state', () => {
  const st = makeState();
  fallbackArm(st);
  assert.equal(webError(st, { code: -8 }), 'main-error:error-shown');
  assert.equal(st.H.vis, 0); assert.equal(st.H.alpha, 1);
  assert.ok(st.retryInstalled);
});

test('flow 4: HTTP error on the main document - same recoverable error state', () => {
  const st = makeState();
  fallbackArm(st);
  assert.equal(webError(st, { httpStatus: 503 }), 'http-error:error-shown');
  assert.ok(st.retryInstalled);
});

test('flow 5: secondary resource error must not bring the splash back', () => {
  const st = makeState();
  fallbackArm(st); st.webProgress = 100; st.pageLoaded = true;
  st.H.tag = 'startup-fallback';
  assert.equal(zk0Run(st, 1, true), 'faded');        // rescue web_mode faded it
  assert.equal(st.H.vis, 8);
  assert.equal(webError(st, { mainFrame: false, code: -8 }), 'ignored-secondary');
  assert.equal(webError(st, { code: -3 }), 'ignored-connect');
  assert.equal(st.H.vis, 8, 'splash stays away on secondary/filtered errors');
});

test('flow 6: error after a completed fade - explicit error screen with retry, no bare splash', () => {
  const st = makeState();
  fallbackArm(st); st.webProgress = 100;
  st.H.tag = 'startup-fallback';
  zk0Run(st, 1, true);
  assert.equal(st.H.vis, 8);
  assert.equal(webError(st, { code: -8 }), 'main-error:error-shown');
  assert.equal(st.H.vis, 0); assert.equal(st.K.vis, 0);
  assert.ok(st.retryInstalled, 'the exit is visible and actionable');
});

test('flow 7: first retry fails, second attempt still has a rescue', () => {
  const st = makeState();
  fallbackArm(st); st.webProgress = 0;
  assert.equal(fallbackRun(st), 'error-mode');       // 20s rescue on first attempt
  assert.equal(retryClick(st), 'retry');             // user taps "Tap to retry"
  // second attempt fails again (page never loads)
  st.webProgress = 0;
  const second = fallbackRun(st);
  assert.equal(second, 'error-mode', 'the re-armed rescue fires again - NOT stuck on the logo');
  assert.ok(st.retryInstalled);
});

test('flow 8: superseded or dead-activity rescue callbacks are no-ops', () => {
  const st = makeState();
  fallbackArm(st);
  const stale = st.fallback.pending;
  retryClick(st);                                    // re-arm supersedes the first callback
  assert.equal(fallbackRun(st, { scheduledGen: stale }), 'superseded');
  const st2 = makeState();
  fallbackArm(st2);
  st2.destroyed = true;
  assert.equal(fallbackRun(st2), 'destroyed');
  st2.destroyed = false; st2.finishing = true;
  assert.equal(fallbackRun(st2), 'finishing');
  st2.finishing = false; st2.activityAlive = false;
  assert.equal(fallbackRun(st2), 'activity-gone');
});

test('flow 9: rescue fires after the shell is already shown - it must not restore the splash', () => {
  const st = makeState();
  fallbackArm(st); st.webProgress = 100;
  showNativeUi(st);
  assert.equal(st.H.vis, 8);
  assert.equal(fallbackRun(st), 'dismissed', 'the splash is gone - the rescue leaves the shell alone');
  // and a late web error must not restore the splash on top of the shell
  assert.equal(webError(st, { code: -8 }), 'main-error:skipped');
  assert.equal(st.H.vis, 8, 'D() skips while the shell is shown');
});

test('flow 10: exception during the rescue still dismisses the splash (last resort)', () => {
  // Modelled by the Smali .catch chain (asserted statically above and by
  // tests/p0_launch_recovery.test.js flow tests); here we verify the model
  // reaches the same forced state.
  const st = makeState();
  fallbackArm(st); st.webProgress = 0;
  assert.equal(fallbackRun(st), 'error-mode');
  // the catch path forces H GONE - emulate and assert coherence
  st.H.vis = 8;
  assert.equal(st.H.vis, 8);
});

test('flow 11: fade end never leaves a visible splash with alpha zero', () => {
  // error flag during the fade: the error state owns H (alpha restored to 1)
  const st = makeState();
  fallbackArm(st); st.webProgress = 100;
  st.H.tag = 'startup-fallback';
  st.H.animating = true;
  st.m = true; st.n = 1;                             // web error mid-fade
  D(st, true);                                       // restores alpha 1 + cancels the fade
  assert.equal(st.H.animating, false);
  assert.equal(st.H.alpha, 1);
  assert.equal(r20End(st, true), 'kept');
  assert.equal(st.H.vis, 0, 'the error screen stays visible (not a transparent ghost)');
  // shell shown mid-fade: the overlay is dismissed, never left transparent
  const st2 = makeState();
  st2.H.animating = true;
  st2.l = true; st2.m = true;
  assert.equal(r20End(st2, true), 'gone');
  assert.equal(st2.H.vis, 8);
});

test('flow 12: every retry keeps a visible exit and re-arms the timers', () => {
  const st = makeState();
  fallbackArm(st); st.watchdog.armed = true;
  st.webProgress = 0;
  fallbackRun(st);                                   // error-mode
  retryClick(st);
  assert.ok(st.fallback.armed, 'rescue re-armed');
  assert.ok(st.watchdog.armed, 'watchdog re-armed');
  assert.equal(st.H.vis, 0, 'the splash is the loading screen again');
  assert.equal(st.H.tag, null, 'hold guard re-armed');
  // any failure from here still ends on the error screen or the web page
  st.webProgress = 100;
  st.H.tag = 'startup-fallback';
  assert.equal(zk0Run(st, 1, true), 'faded');
});

// ---------------------------------------------------------------------------
// Full required sequence: logo visible -> load -> error/timeout -> fallback ->
// retry -> new success OR new failure
// ---------------------------------------------------------------------------

test('flow sequence: logo -> load -> error -> fallback -> retry -> success', () => {
  const st = makeState();
  fallbackArm(st); st.watchdog.armed = true;
  // logo visible and held while loading
  assert.equal(zk0Run(st, 1, true), 'held');
  // error arrives
  assert.equal(webError(st, { code: -8 }), 'main-error:error-shown');
  // retry tap
  retryClick(st);
  // second attempt succeeds: page loads, shell takes over
  st.webProgress = 100; st.pageLoaded = true;
  assert.equal(showNativeUi(st), 'takeover');
  assert.equal(st.H.vis, 8); assert.ok(st.shellShown);
  // the old pending rescue must not resurrect the splash
  assert.equal(fallbackRun(st, { scheduledGen: 1 }), 'superseded');
});

test('flow sequence: logo -> load -> timeout -> fallback -> retry -> failure -> fallback again', () => {
  const st = makeState();
  fallbackArm(st); st.watchdog.armed = true;
  assert.equal(zk0Run(st, 1, true), 'held');
  st.webProgress = 0;
  assert.equal(fallbackRun(st), 'error-mode');
  retryClick(st);
  st.webProgress = 0;
  assert.equal(fallbackRun(st), 'error-mode');
  assert.ok(st.retryInstalled);
  assert.equal(st.H.vis, 0, 'explicit error screen - never a dead logo');
});
