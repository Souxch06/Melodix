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
