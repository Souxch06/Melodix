#!/usr/bin/env node
'use strict';
// P0 startup hang watchdog tests (branch arena/7142700d-melodix, on top of
// 8151250). Device evidence: the phone stays on the launch logo forever with
// a freshly installed artifact and NO diag toast. Two demonstrated defects
// are covered here:
//   1. NativeCrashGuard.install() had BOTH entry guards inverted (a recurring
//      polarity bug): with a valid context the method returned immediately,
//      so no crash handler, no toast, no stored context - and stage()/write()/
//      lastReport() silently stayed dead. This matches the missing toast.
//   2. A startup blocked on the main thread can never be rescued by any
//      main-looper callback (the 20s splash fallback cannot run either). A
//      plain watchdog THREAD records the main-thread stack and the last stage
//      after 25s; the report is shown as a dialog on the next launch.
//
// WHAT IS ACTUALLY EXECUTED: static opcode checks on the real Smali (guard
// polarities both ways, wiring order, watchdog instructions) plus a small
// behavioural model of the watchdog decision. NOT executed: Android, device.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8');
const GUARD = () => read('smali/com/melodix/music/NativeCrashGuard.smali');
const APP = () => read('smali/com/melodix/music/AppSingleton.smali');
const WD = () => read('smali/com/melodix/music/StartupHangWatchdog.smali');
const MI = () => read('smali/com/melodix/music/MainActivity.smali');
const FB = () => read('smali/com/melodix/music/StartupSplashFallback.smali');

function methodBody(src, sigStart) {
  const start = src.indexOf(sigStart);
  assert.ok(start >= 0, `method not found: ${sigStart}`);
  return src.slice(start, src.indexOf('.end method', start));
}

// ---------------------------------------------------------------------------
// Part 1 - NativeCrashGuard.install() guard polarity (the demonstrated bug)
// ---------------------------------------------------------------------------

test('install() skips only on a NULL context (if-eqz, not if-nez)', () => {
  const body = methodBody(GUARD(), '.method public static install(Landroid/content/Context;)V');
  assert.match(body, /if-eqz p0, :done/,
    'a null context must skip; a valid context must fall through');
  assert.ok(!/if-nez p0, :done/.test(body),
    'the inverted form (skip on a VALID context) must be gone');
});

test('install() skips only when ALREADY installed (if-nez, not if-eqz)', () => {
  const body = methodBody(GUARD(), '.method public static install(Landroid/content/Context;)V');
  assert.match(body, /sget-boolean v0, Lcom\/melodix\/music\/NativeCrashGuard;->installed:Z\n\n    if-nez v0, :done/);
  assert.ok(!/installed:Z\n\n    if-eqz v0, :done/.test(body),
    'the inverted form (skip when NOT yet installed) must be gone');
});

test('install() still installs the handler, stores the context and announces itself', () => {
  const body = methodBody(GUARD(), '.method public static install(Landroid/content/Context;)V');
  assert.match(body, /Thread;->setDefaultUncaughtExceptionHandler/);
  assert.match(body, /sput-object v0, Lcom\/melodix\/music\/NativeCrashGuard;->context:Landroid\/content\/Context;/);
  assert.match(body, /Toast;->makeText/);
  assert.match(body, /installed:Z/);
});

test('lastStage() is public (the watchdog appends it to the report)', () => {
  assert.match(GUARD(), /\.method public static lastStage\(\)Ljava\/lang\/String;/);
});

// ---------------------------------------------------------------------------
// Part 2 - earliest install + watchdog arming (AppSingleton.attachBaseContext)
// ---------------------------------------------------------------------------

test('attachBaseContext installs the crash recorder before any provider runs', () => {
  const body = methodBody(APP(), '.method protected attachBaseContext(Landroid/content/Context;)V');
  assert.match(body, /invoke-super \{p0, p1\}, Landroid\/app\/Application;->attachBaseContext/);
  assert.match(body, /NativeCrashGuard;->install\(Landroid\/content\/Context;\)V/);
  assert.match(body, /NativeCrashGuard;->stage\(Ljava\/lang\/String;\)V/);
  assert.match(body, /StartupHangWatchdog;->arm\(\)V/);
  assert.match(body, /\.catch Ljava\/lang\/Throwable;/,
    'a broken diagnostic must never abort the startup');
});

test('AppSingleton exposes the volatile startupDone flag', () => {
  assert.match(APP(), /\.field public static volatile startupDone:Z = false/);
});

// ---------------------------------------------------------------------------
// Part 3 - the watchdog thread itself
// ---------------------------------------------------------------------------

test('watchdog: arm() starts exactly one named thread', () => {
  const wd = WD();
  assert.match(wd, /\.implements Ljava\/lang\/Runnable;/);
  const body = methodBody(wd, '.method public static arm()V');
  assert.match(body, /sget-boolean v0, Lcom\/melodix\/music\/StartupHangWatchdog;->started:Z\n\n    if-nez v0, :done/,
    'the started guard must skip only when already armed');
  assert.match(body, /new-instance v1, Ljava\/lang\/Thread;/);
  assert.match(body, /Thread;-><init>\(Ljava\/lang\/Runnable;\)V/);
  assert.match(body, /const-string v0, "melodix-startup-watchdog"/);
  assert.match(body, /Thread;->start\(\)V/);
});

test('watchdog: run() sleeps 25s then reports only if startupDone is still false', () => {
  const body = methodBody(WD(), '.method public final run()V');
  assert.match(body, /const-wide\/16 v0, 0x61a8/, '25000 ms');
  assert.match(body, /Thread;->sleep\(J\)V/);
  assert.match(body, /sget-boolean v0, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z\n\n    if-nez v0, :done/,
    'startupDone == true must skip the report (polarity: if-nez jumps to :done)');
});

test('watchdog: the report contains the main-thread stack and the last stage', () => {
  const body = methodBody(WD(), '.method public final run()V');
  assert.match(body, /NativeCrashGuard;->lastStage\(\)Ljava\/lang\/String;/);
  assert.match(body, /Looper;->getMainLooper\(\)Landroid\/os\/Looper;/);
  assert.match(body, /Looper;->getThread\(\)Ljava\/lang\/Thread;/);
  assert.match(body, /Thread;->getStackTrace\(\)\[Ljava\/lang\/StackTraceElement;/);
  assert.match(body, /StackTraceElement;->toString\(\)Ljava\/lang\/String;/);
  assert.match(body, /NativeCrashGuard;->write\(Ljava\/lang\/String;\)V/);
  assert.match(body, /const-string v0, "startup-hang"/);
  assert.match(body, /Log;->e\(Ljava\/lang\/String;Ljava\/lang\/String;\)I/);
  assert.ok(!/access_token|refresh_token|Bearer /.test(body), 'no token material in the report');
});

// ---------------------------------------------------------------------------
// Part 4 - the flag is set at the real resolution points
// ---------------------------------------------------------------------------

test('startupDone is set on the native-shell takeover', () => {
  const body = methodBody(MI(), '.method public final showNativeUi()V');
  assert.match(body, /sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);
});

test('startupDone is set when the splash fallback acts', () => {
  const body = methodBody(FB(), '.method public final run()V');
  const fired = body.indexOf('startup-splash-fallback FIRED');
  assert.ok(fired > 0, 'the FIRED trace must exist');
  assert.match(body.slice(fired, fired + 800), /sput-boolean v1, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);
});

// ---------------------------------------------------------------------------
// Part 5 - behavioural model of the watchdog decision
// ---------------------------------------------------------------------------

test('model: the watchdog reports exactly the unresolved startups', () => {
  // Transcribed from StartupHangWatchdog.run(): after 25s, report iff
  // startupDone is false. startupDone flips true only on showNativeUi() or a
  // fallback action.
  const decide = ({ takeover, fallbackActed, mainThreadStuck }) => ({
    report: !(takeover || fallbackActed),
    stackShowsBlock: mainThreadStuck,
  });

  assert.equal(decide({ takeover: true, fallbackActed: false, mainThreadStuck: false }).report, false,
    'normal takeover: silent');
  assert.equal(decide({ takeover: false, fallbackActed: true, mainThreadStuck: false }).report, false,
    'the 20s fallback acted first: silent');
  assert.equal(decide({ takeover: false, fallbackActed: false, mainThreadStuck: true }).report, true,
    'main thread stuck (fallback cannot run): report with the blocking stack');
  assert.equal(decide({ takeover: false, fallbackActed: false, mainThreadStuck: false }).report, true,
    'live main thread but the rescue chain failed: report (stack idles in Looper.loop)');
});
