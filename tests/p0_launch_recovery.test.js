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

// ---------------------------------------------------------------------------
// Smali flow-control tests for StartupSplashFallback.run() (P0 logic fix).
// A real instruction-level interpreter walks the guard chain under simulated
// state instead of matching strings, so an inverted opcode cannot pass.
// ---------------------------------------------------------------------------

function parseSmaliMethod(src, signature) {
  const start = src.indexOf(`.method ${signature}`);
  assert.ok(start >= 0, `method not found: ${signature}`);
  const body = src.slice(start, src.indexOf('.end method', start));
  const instrs = [];
  const labels = {};
  for (const raw of body.split('\n')) {
    const line = raw.split('#')[0].trim();
    if (!line || line.startsWith('.') && !line.startsWith('.line')) continue;
    if (line.startsWith('.method') || line.startsWith('.locals')) continue;
    if (/^:[\w/.]+$/.test(line)) { labels[line.slice(1)] = instrs.length; continue; }
    instrs.push(line);
  }
  return { instrs, labels };
}

// Minimal Dalvik evaluator: only the instructions used by run() before and
// inside the rescue. Branches are followed for real.
function runFlow(method, env) {
  const regs = {};
  let pendingResult = undefined;
  const reached = [];
  let pc = 0;
  for (let steps = 0; steps < 300; steps++) {
    if (pc >= method.instrs.length) return { reached, ended: 'fallthrough' };
    const ins = method.instrs[pc];
    let m;
    if ((m = ins.match(/^iget-object (\w+), (\w+), .*->(\w+):/))) {
      const field = m[3];
      if (field === 'activity') regs[m[1]] = env.activityAlive ? 'activity' : null;
      else if (field === 'H') regs[m[1]] = env.HPresent ? 'splash' : null;
      else regs[m[1]] = `field:${field}`;
      pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+)\}, Ljava\/lang\/ref\/Reference;->get\(\)/))) {
      pendingResult = env.activityAlive ? 'activity' : null; pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+)\}, Landroid\/app\/Activity;->isFinishing\(\)Z/))) {
      pendingResult = env.finishing ? 1 : 0; pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+)\}, Landroid\/view\/View;->getVisibility\(\)I/))) {
      pendingResult = env.splashVisible ? 0 : 8; pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+), (\w+)\}, .*->setTag\(/))) {
      reached.push(`setTag:${regs[m[2]]}`); pc++;
    } else if ((m = ins.match(/^invoke-static \{(\w+)\}, Lcom\/melodix\/music\/NativeCrashGuard;->stage/))) {
      reached.push(`stage:${regs[m[1]]}`); pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+), (\w+)\}, Lcom\/melodix\/music\/MainActivity;->D\(Z\)V/))) {
      reached.push(`D:${regs[m[2]]}`); pc++;
    } else if (/^invoke-virtual .*runOnUiThread/.test(ins)) {
      reached.push('runOnUiThread:zk0'); pc++;
    } else if ((m = ins.match(/^const-string (\w+), "(.*)"/))) {
      regs[m[1]] = m[2]; pc++;
    } else if ((m = ins.match(/^const\/4 (\w+), (-?\w+)/))) {
      regs[m[1]] = { '0x0': 0, '0x1': 1, '0x0': 0, '0': 0, '0x1': 1, '1': 1 }[m[2]] ?? parseInt(m[2]);
      pc++;
    } else if ((m = ins.match(/^move-result-object (\w+)/))) {
      regs[m[1]] = pendingResult; pc++;
    } else if ((m = ins.match(/^move-result (\w+)/))) {
      regs[m[1]] = pendingResult; pc++;
    } else if ((m = ins.match(/^sget-boolean (\w+), .*->(\w+):Z/))) {
      regs[m[1]] = m[2] === 'm' ? (env.networkError ? 1 : 0) : 0; pc++;
    } else if ((m = ins.match(/^check-cast (\w+), /))) {
      pc++;
    } else if ((m = ins.match(/^if-eqz (\w+), :(\w+)/))) {
      pc = !regs[m[1]] ? method.labels[m[2]] : pc + 1;
    } else if ((m = ins.match(/^if-nez (\w+), :(\w+)/))) {
      pc = regs[m[1]] ? method.labels[m[2]] : pc + 1;
    } else if ((m = ins.match(/^goto :(\w+)/))) {
      pc = method.labels[m[1]];
    } else if (/^return-void/.test(ins)) {
      reached.push('return'); return { reached, ended: 'return' };
    } else if ((m = ins.match(/^new-instance (\w+), /)) || (m = ins.match(/^invoke-direct /)) ||
               (m = ins.match(/^invoke-static .*Log;/)) || (m = ins.match(/^invoke-virtual .*getResources/))) {
      pc++;
    } else {
      // Unknown instruction: stop interpreting but keep the trace so far.
      return { reached, ended: `unknown:${ins}` };
    }
  }
  return { reached, ended: 'loop' };
}

function loadRunMethod() {
  return parseSmaliMethod(
    read('smali/com/melodix/music/StartupSplashFallback.smali'),
    'public final run()V');
}

test('P0 flow: finishing activity exits early (no rescue)', () => {
  const r = runFlow(loadRunMethod(), {
    activityAlive: true, finishing: true, splashVisible: true, HPresent: true, networkError: false,
  });
  assert.deepEqual(r.reached, ['return'], `unexpected trace: ${r.reached}`);
});

test('P0 flow: non-visible splash exits early (no rescue)', () => {
  const r = runFlow(loadRunMethod(), {
    activityAlive: true, finishing: false, splashVisible: false, HPresent: true, networkError: false,
  });
  assert.deepEqual(r.reached, ['return'], `unexpected trace: ${r.reached}`);
});

test('P0 flow: active activity + visible splash reaches tag, stage and the rescue', () => {
  const method = loadRunMethod();
  const base = { activityAlive: true, finishing: false, splashVisible: true, HPresent: true };
  const withError = runFlow(method, { ...base, networkError: true });
  assert.ok(withError.reached.includes('stage:splash-fallback'), withError.reached.join(','));
  assert.ok(withError.reached.includes('setTag:startup-fallback'), withError.reached.join(','));
  assert.ok(withError.reached.includes('stage:fallback-error'), withError.reached.join(','));
  assert.ok(withError.reached.includes('D:1'), withError.reached.join(','));
  assert.ok(withError.reached.includes('return'), withError.reached.join(','));
  const noError = runFlow(method, { ...base, networkError: false });
  assert.ok(noError.reached.includes('stage:splash-fallback'), noError.reached.join(','));
  assert.ok(noError.reached.includes('setTag:startup-fallback'), noError.reached.join(','));
  assert.ok(noError.reached.includes('stage:fallback-web'), noError.reached.join(','));
  assert.ok(noError.reached.includes('runOnUiThread:zk0'), noError.reached.join(','));
  assert.ok(noError.reached.includes('return'), noError.reached.join(','));
});

test('P0 flow: the two early-exit guards are if-nez on the right values', () => {
  const method = loadRunMethod();
  const idxFinishing = method.instrs.findIndex((i) => i.includes('Activity;->isFinishing()Z'));
  const idxVisibility = method.instrs.findIndex((i) => i.includes('View;->getVisibility()I'));
  assert.ok(idxFinishing > 0 && idxVisibility > idxFinishing);
  // after isFinishing: move-result v1 then the guard
  assert.match(method.instrs[idxFinishing + 1], /^move-result /);
  assert.match(method.instrs[idxFinishing + 2], /^if-nez \w+, :return$/,
    'finishing guard must be if-nez :return (leave only when finishing == true)');
  // after getVisibility: move-result v1 then the guard
  assert.match(method.instrs[idxVisibility + 1], /^move-result /);
  assert.match(method.instrs[idxVisibility + 2], /^if-nez \w+, :return$/,
    'visibility guard must be if-nez :return (leave only when visibility != VISIBLE)');
  // between the two: the splash-view guard must stay if-eqz (leave when null)
  const idxH = method.instrs.findIndex((i) => i.includes('MainActivity;->H:'));
  assert.ok(idxH > idxFinishing && idxH < idxVisibility);
  assert.match(method.instrs[idxH + 1], /^if-eqz \w+, :return$/,
    'H-null guard must stay if-eqz :return (leave only when the splash view is null)');
});

test('P0 flow: null activity and null splash view still exit early', () => {
  const method = loadRunMethod();
  const dead = runFlow(method, {
    activityAlive: false, finishing: false, splashVisible: true, HPresent: true, networkError: false,
  });
  assert.deepEqual(dead.reached, ['return']);
  const noView = runFlow(method, {
    activityAlive: true, finishing: false, splashVisible: true, HPresent: false, networkError: false,
  });
  assert.deepEqual(noView.reached, ['return']);
});
