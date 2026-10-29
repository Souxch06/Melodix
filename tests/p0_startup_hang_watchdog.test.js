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
//      after 60s; the report is shown as a dialog on the next launch.
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
const ZK = () => read('smali/zk0.smali');

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

test('watchdog: run() sleeps 60s then reports only if startupDone is still false', () => {
  const body = methodBody(WD(), '.method public final run()V');
  assert.match(body, /const-wide\/32 v0, 0xea60/, '60000 ms - init WebView froide toleree');
  assert.match(body, /Thread;->sleep\(J\)V/);
  assert.ok(body.includes('sget-boolean v0, Lcom/melodix/music/AppSingleton;->startupDone:Z')
    && body.includes('if-nez v0, :content_gate'),
    'startupDone == true must skip the hang report (polarity: if-nez jumps to the content gate)');
  assert.ok(!body.includes('if-eqz v0, :content_gate'),
    'the startupDone polarity must not be inverted');
});

test('watchdog: the content gate reports a shell whose home content never arrived', () => {
  const body = methodBody(WD(), '.method public final run()V');
  const gate = body.slice(body.indexOf(':content_gate'));
  assert.ok(gate.includes('NativeCrashGuard;->stageChain()Ljava/lang/String;'),
    'the gate reads the stage chain');
  assert.ok(gate.includes('const-string v1, "home-rendered"'),
    'the content gate keys on the home-rendered mark');
  assert.ok(gate.includes('String;->contains(Ljava/lang/CharSequence;)Z')
    && gate.includes('if-nez v0, :done'),
    'home-rendered present = healthy: silent (polarity: if-nez jumps to :done)');
  assert.ok(!gate.includes('if-eqz v0, :done'),
    'the contains polarity must not be inverted');
  assert.ok(gate.includes('const-string v0, "content-hang"'), 'the phase is recorded');
  assert.ok(gate.includes('StartupDiagnosticOverlay;->buildReport'), 'the report is built');
  assert.ok(gate.includes('NativeCrashGuard;->write(Ljava/lang/String;)V'), 'the report is stored');
  assert.ok(!/access_token|refresh_token|Bearer /.test(gate), 'no token material in the report');
});

test('watchdog: both branches post the on-screen panel through StartupUnstickRunnable', () => {
  const body = methodBody(WD(), '.method public final run()V');
  assert.match(body, /StartupUnstickRunnable;-><init>\(Lcom\/melodix\/music\/MainActivity;Ljava\/lang\/String;Z\)V/,
    'the runnable receives the report and the unstick flag');
  assert.match(body, /const\/4 v5, 0x1\n\n    goto :post_panel/,
    'the startup hang branch asks for the unstick');
  assert.match(body, /const\/4 v5, 0x0/,
    'the content branch only shows the panel');
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

test('startupDone is set at the web reveal (:fade_go in zk0)', () => {
  const zk = ZK();
  const fade = zk.indexOf('\n    :fade_go');
  assert.ok(fade > 0, 'the :fade_go label definition must exist');
  assert.match(zk.slice(fade, fade + 400), /sput-boolean v0, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);
});

// ---------------------------------------------------------------------------
// Part 5 - behavioural model of the watchdog decision
// ---------------------------------------------------------------------------

test('model: the watchdog reports exactly the unresolved startups', () => {
  // Transcribed from StartupHangWatchdog.run(): after 60s, report iff the
  // startup never resolved OR the shell appeared but home content never
  // arrived (stage chain lacks home-rendered).
  const decide = ({ takeover, fallbackActed, contentArrived, mainThreadStuck }) => {
    const shown = takeover || fallbackActed;
    return {
      report: !shown || !contentArrived,
      phase: shown ? 'content-hang' : 'startup-hang',
      stackShowsBlock: mainThreadStuck,
    };
  };

  assert.equal(decide({ takeover: true, fallbackActed: false, contentArrived: true, mainThreadStuck: false }).report, false,
    'normal takeover with content: silent');
  assert.equal(decide({ takeover: true, fallbackActed: false, contentArrived: false, mainThreadStuck: false }).report, true,
    'shell shown but content never arrived: content report');
  assert.equal(decide({ takeover: true, fallbackActed: false, contentArrived: false, mainThreadStuck: false }).phase, 'content-hang');
  assert.equal(decide({ takeover: false, fallbackActed: true, contentArrived: true, mainThreadStuck: false }).report, false,
    'the 20s fallback acted first: silent');
  assert.equal(decide({ takeover: false, fallbackActed: false, contentArrived: false, mainThreadStuck: true }).report, true,
    'main thread stuck (fallback cannot run): report with the blocking stack');
  assert.equal(decide({ takeover: false, fallbackActed: false, contentArrived: false, mainThreadStuck: true }).phase, 'startup-hang');
  assert.equal(decide({ takeover: false, fallbackActed: false, contentArrived: false, mainThreadStuck: false }).report, true,
    'live main thread but the rescue chain failed: report (stack idles in Looper.loop)');
});
