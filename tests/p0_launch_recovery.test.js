#!/usr/bin/env node
'use strict';
// P0 launch recovery contract tests (branch arena/7142700d-melodix).
//
// Mission: "Melodix v40 bloquee sur le logo au lancement". The demonstrated
// blocking mechanism: the splash overlay can only be dismissed through the
// zk0 fade, which is held while AppSingleton.l is false (no native shell
// takeover) and the splash has no fallback tag. When the takeover chain AND
// the page watchdog both fail to fire, nothing ever removes the splash and
// the app stays blocked on the logo.
//
// Fix contract (real fix, no arbitrary splash masking):
//  1. StartupSplashFallback - an independent rescue timer armed on the splash
//     view itself; if the splash is still visible after the rescue window it
//     exits recoverably (network error screen with tap-to-retry, or the web
//     page fallback) and traces each step.
//  2. StartupLoadWatchdog.arm/armAfterResume - must not depend on
//     AppSingleton.t alone (context unwrap) so the watchdog is always armable.
//  3. SplashRetryListener - the error screen must be recoverable: tap
//     relaunches the startup (clear flags, clear fallback tag, reload, rearm).
//  4. Instrumentation: stages for every critical launch step.
//  5. The splash-hold guard and the late-callback guard must remain intact:
//     the splash is dismissed when the app is ready, never masked by delay.

const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8');

test('P0: StartupSplashFallback exists and arms an independent rescue on the splash view', () => {
  const src = read('smali/com/melodix/music/StartupSplashFallback.smali');
  assert.match(src, /\.class public final Lcom\/melodix\/music\/StartupSplashFallback;/);
  assert.match(src, /\.implements Ljava\/lang\/Runnable;/);
  // arm is static and takes the activity
  assert.match(src, /\.method public static arm\(Lcom\/melodix\/music\/MainActivity;\)V/);
  // The rescue is posted on the splash view itself (independent of the WebView
  // load callbacks and of AppSingleton.t being set).
  assert.match(src, /MainActivity;->H:Landroidx\/constraintlayout\/widget\/ConstraintLayout;/);
  assert.match(src, /postDelayed\(Ljava\/lang\/Runnable;J\)Z/);
  // Bounded rescue window (20s), documented as a rescue, not a mask.
  assert.match(src, /0x4e20/);
});

test('P0: StartupSplashFallback.run exits recoverably and traces the step', () => {
  const src = read('smali/com/melodix/music/StartupSplashFallback.smali');
  const run = src.slice(src.indexOf('.method public final run()V'));
  // No-op when the splash is already gone (rescue superseded by the normal path)
  assert.match(run, /getVisibility\(\)I/);
  // Traces the exact step before taking the exit
  assert.match(run, /startup-splash-fallback FIRED/);
  assert.match(run, /NativeCrashGuard;->stage\(Ljava\/lang\/String;\)V/);
  // Explicit fallback tag so the zk0 splash-hold guard allows the fade
  assert.match(run, /setTag\(Ljava\/lang\/Object;\)V/);
  assert.match(run, /startup-fallback/);
  // Recoverable exit branches: network error screen OR web page fallback
  assert.match(run, /MainActivity;->D\(Z\)V/);
  assert.match(run, /Lzk0;-><init>\(Lcom\/melodix\/music\/MainActivity;ZI\)V/);
  // Never leaves the splash in place: both branches end the blocked state
  assert.ok(run.includes('fallback-error') && run.includes('fallback-web'));
});

test('P0: StartupLoadWatchdog arm/armAfterResume no longer depend on AppSingleton.t alone', () => {
  const src = read('smali/com/melodix/music/StartupLoadWatchdog.smali');
  for (const name of ['arm(Landroid/webkit/WebView;)V', 'armAfterResume(Landroid/webkit/WebView;)V']) {
    const start = src.indexOf(`.method public static ${name}`);
    assert.ok(start >= 0, `missing ${name}`);
    const body = src.slice(start, src.indexOf('.end method', start));
    // Resolves the activity from the WebView context (unwrap ContextWrapper)
    assert.match(body, /getContext\(\)Landroid\/content\/Context;/);
    assert.match(body, /ContextWrapper/);
    // Singleton weakref is only a fallback, not the sole path
    assert.ok(body.indexOf('getContext()') < body.indexOf('AppSingleton;->t'));
    // Watchdog still armed with postDelayed when an activity is resolved
    assert.match(body, /postDelayed\(Ljava\/lang\/Runnable;J\)Z/);
  }
});

test('P0: StartupLoadWatchdog.run traces the watchdog step (instrumentation)', () => {
  const src = read('smali/com/melodix/music/StartupLoadWatchdog.smali');
  const run = src.slice(src.indexOf('.method public final run()V'));
  assert.match(run, /watchdog-fired/);
  assert.match(run, /NativeCrashGuard;->stage\(Ljava\/lang\/String;\)V/);
});

test('P0: SplashRetryListener installs tap-to-retry on the error screen', () => {
  const src = read('smali/com/melodix/music/SplashRetryListener.smali');
  assert.match(src, /\.implements Landroid\/view\/View\$OnClickListener;/);
  assert.match(src, /\.method public static install\(Lcom\/melodix\/music\/MainActivity;\)V/);
  // Installed on the splash surface and the error texts
  assert.match(src, /MainActivity;->H:Landroidx\/constraintlayout\/widget\/ConstraintLayout;/);
  assert.match(src, /MainActivity;->J:Landroid\/widget\/ImageView;/);
  assert.match(src, /MainActivity;->K:Landroid\/widget\/TextView;/);
  assert.match(src, /setOnClickListener\(Landroid\/view\/View\$OnClickListener;\)V/);
});

test('P0: SplashRetryListener.onClick relaunches the startup (recoverable)', () => {
  const src = read('smali/com/melodix/music/SplashRetryListener.smali');
  const click = src.slice(src.indexOf('.method public final onClick(Landroid/view/View;)V'));
  // Traces the retry
  assert.match(click, /retry-tapped/);
  // Clears the network-error flags
  assert.match(click, /Lcom\/melodix\/music\/AppSingleton;->m:Z/);
  assert.match(click, /Lcom\/melodix\/music\/AppSingleton;->n:I/);
  // Removes the explicit fallback tag so the hold guard is armed again
  assert.match(click, /setTag\(Ljava\/lang\/Object;\)V/);
  // Clears the error visuals through the splash state machine
  assert.match(click, /MainActivity;->D\(Z\)V/);
  // Reloads the page and re-arms the watchdog
  assert.match(click, /Landroid\/webkit\/WebView;->reload\(\)V/);
  assert.match(click, /StartupLoadWatchdog;->arm\(Landroid\/webkit\/WebView;\)V/);
});

test('P0: MainActivity arms the rescue right after the splash view exists', () => {
  const src = read('smali/com/melodix/music/MainActivity.smali');
  const idx = src.indexOf('iput-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;');
  assert.ok(idx > 0);
  const after = src.slice(idx, idx + 700);
  assert.match(after, /StartupSplashFallback;->arm\(Lcom\/melodix\/music\/MainActivity;\)V/);
});

test('P0: MainActivity installs tap-to-retry in the error branch of D()', () => {
  const src = read('smali/com/melodix/music/MainActivity.smali');
  const start = src.indexOf('.method public final D(Z)V');
  assert.ok(start > 0);
  const body = src.slice(start, src.indexOf('.end method', start));
  assert.match(body, /SplashRetryListener;->install\(Lcom\/melodix\/music\/MainActivity;\)V/);
  // Late-callback guard preserved: no splash restore on top of the shell
  assert.match(body, /splash-restore skipped \(native shell already shown\)/);
});

test('P0: splash-hold guard in zk0 preserved (no flash, no arbitrary mask)', () => {
  const src = read('smali/zk0.smali');
  // The hold stays: while no shell and no fallback tag, the fade does nothing
  assert.match(src, /splash-hold waiting for native shell \(no flash\)/);
  // The fade is only allowed with a takeover or an explicit fallback tag
  assert.match(src, /Lcom\/melodix\/music\/AppSingleton;->l:Z/);
  assert.match(src, /getTag\(\)Ljava\/lang\/Object;/);
});

test('P0: launch instrumentation covers every critical step', () => {
  const mi = read('smali/com/melodix/music/MainActivity.smali');
  const wd = read('smali/com/melodix/music/StartupLoadWatchdog.smali');
  const fb = read('smali/com/melodix/music/StartupSplashFallback.smali');
  const rl = read('smali/com/melodix/music/SplashRetryListener.smali');
  // Native shell takeover is traced and persisted
  assert.match(mi, /native-shell-shown/);
  assert.match(mi, /NativeCrashGuard;->stage\(Ljava\/lang\/String;\)V/);
  // Each rescue/fallback/retry step is traced
  assert.match(fb, /splash-fallback/);
  assert.match(wd, /watchdog-fired/);
  assert.match(rl, /retry-tapped/);
  // No OAuth tokens are logged anywhere in the fix
  for (const src of [mi, wd, fb, rl]) {
    assert.ok(!/access_token|refresh_token|Bearer /.test(src), 'no token material in logs');
  }
});
