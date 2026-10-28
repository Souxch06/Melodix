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
  // Recoverable exit branches: direct error screen OR web page fallback
  assert.match(run, /StartupSplashFallback;->showErrorScreen\(Lcom\/melodix\/music\/MainActivity;\)V/);
  assert.match(run, /Lzk0;-><init>\(Lcom\/melodix\/music\/MainActivity;ZI\)V/);
  // Never leaves the splash in place: both branches end the blocked state
  assert.ok(run.includes('fallback-error') && run.includes('fallback-web'));
  // A rescue that throws must still dismiss the splash (last-resort catch)
  assert.match(run, /\.catch Ljava\/lang\/Throwable;/);
  assert.match(run, /fallback-forced/);
  assert.match(run, /setVisibility\(I\)V/);
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
  // Resets the visuals DIRECTLY (never through D(), whose restore path
  // re-arms the error state machine)
  assert.ok(!/MainActivity;->D\(Z\)V/.test(click), 'onClick must not call D()');
  assert.match(click, /MainActivity;->K:Landroid\/widget\/TextView;/);
  assert.match(click, /MainActivity;->J:Landroid\/widget\/ImageView;/);
  assert.match(click, /MainActivity;->N:Landroid\/widget\/FrameLayout;/);
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
  const catches = [];
  for (const raw of body.split('\n')) {
    const line = raw.split('#')[0].trim();
    if (!line) continue;
    const cm = line.match(/^\.catch \S+; \{:(\w+) \.\. :(\w+)\} :(\w+)/);
    if (cm) { catches.push({ from: cm[1], to: cm[2], handler: cm[3] }); continue; }
    if (line.startsWith('.') && !line.startsWith('.line')) continue;
    if (line.startsWith('.method') || line.startsWith('.locals')) continue;
    if (/^:[\w/.]+$/.test(line)) { labels[line.slice(1)] = instrs.length; continue; }
    instrs.push(line);
  }
  return { instrs, labels, catches };
}

// Minimal Dalvik evaluator: only the instructions used by run() before and
// inside the rescue. Branches are followed for real.
function runFlow(method, env) {
  const regs = {};
  let pendingResult = undefined;
  const reached = [];
  let pc = 0;
  const throwPc = env.throwAt ? method.instrs.findIndex((i) => i.includes(env.throwAt)) : -1;
  // Map every pc to its catch handler (if any).
  const handlerFor = (idx) => {
    for (const c of method.catches) {
      const a = method.labels[c.from], b = method.labels[c.to];
      if (idx >= a && idx < b) return method.labels[c.handler];
    }
    return undefined;
  };
  for (let steps = 0; steps < 300; steps++) {
    if (pc >= method.instrs.length) return { reached, ended: 'fallthrough' };
    if (pc === throwPc) {
      reached.push('throw');
      const h = handlerFor(pc);
      if (h === undefined) return { reached, ended: 'uncaught' };
      pc = h;
      continue;
    }
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
    } else if ((m = ins.match(/^const(?:\/4|\/16|\/high16)? (\w+), (-?\w+)/))) {
      regs[m[1]] = { '0x0': 0, '0x1': 1, '0x0': 0, '0': 0, '0x1': 1, '1': 1 }[m[2]] ?? parseInt(m[2], m[2].startsWith('0x') ? 16 : 10);
      pc++;
    } else if ((m = ins.match(/^move-result-object (\w+)/))) {
      regs[m[1]] = pendingResult; pc++;
    } else if ((m = ins.match(/^move-result (\w+)/))) {
      regs[m[1]] = pendingResult; pc++;
    } else if ((m = ins.match(/^sget-boolean (\w+), .*->(\w+):Z/))) {
      regs[m[1]] = m[2] === 'm' ? (env.networkError ? 1 : 0) : 0; pc++;
    } else if ((m = ins.match(/^sput-boolean (\w+), .*->(\w+):Z/))) {
      reached.push(`sput:${m[2]}`); pc++;
    } else if ((m = ins.match(/^sput (\w+), .*->(\w+)/))) {
      pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+)\}, Landroid\/webkit\/WebView;->getProgress\(\)I/))) {
      pendingResult = env.pageProgress !== undefined ? env.pageProgress : 100; pc++;
    } else if ((m = ins.match(/^if-ge (\w+), (\w+), :(\w+)/))) {
      pc = (regs[m[1]] >= regs[m[2]]) ? method.labels[m[3]] : pc + 1;
    } else if ((m = ins.match(/^if-lt (\w+), (\w+), :(\w+)/))) {
      pc = (regs[m[1]] < regs[m[2]]) ? method.labels[m[3]] : pc + 1;

    } else if ((m = ins.match(/^check-cast (\w+), /))) {
      pc++;
    } else if ((m = ins.match(/^invoke-static \{(\w+)\}, Lcom\/melodix\/music\/StartupSplashFallback;->showErrorScreen/))) {
      reached.push('showErrorScreen'); pc++;
    } else if ((m = ins.match(/^invoke-static \{(\w+)\}, Lcom\/melodix\/music\/StartupSplashFallback;->showDiag/))) {
      reached.push('showDiag'); pc++;
    } else if ((m = ins.match(/^invoke-static \{(\w+)\}, Lcom\/melodix\/music\/SplashRetryListener;->install/))) {
      reached.push('installRetry'); pc++;
    } else if ((m = ins.match(/^invoke-virtual \{(\w+), (\w+)\}, .*->setVisibility\(I\)V/))) {
      reached.push(`setVisibility:${regs[m[2]]}`); pc++;
    } else if ((m = ins.match(/^move-exception (\w+)/))) {
      regs[m[1]] = 'exception'; pc++;
    } else if ((m = ins.match(/^if-eqz (\w+), :(\w+)/))) {
      pc = !regs[m[1]] ? method.labels[m[2]] : pc + 1;
    } else if ((m = ins.match(/^if-nez (\w+), :(\w+)/))) {
      pc = regs[m[1]] ? method.labels[m[2]] : pc + 1;
    } else if ((m = ins.match(/^goto :(\w+)/))) {
      pc = method.labels[m[1]];
    } else if (/^return-void/.test(ins)) {
      reached.push('return'); return { reached, ended: 'return' };
    } else if ((m = ins.match(/^new-instance (\w+), /))) {
      pc++;
    } else if (/^iput-|^sget |^invoke-(virtual|static|direct|interface) /.test(ins)) {
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
  assert.ok(withError.reached.includes('showErrorScreen'), withError.reached.join(','));
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

test('P0 flow: an exception inside the rescue still dismisses the splash (last resort)', () => {
  const method = loadRunMethod();
  // Throw at the error-screen call: the catch must force the splash away.
  const r = runFlow(method, {
    activityAlive: true, finishing: false, splashVisible: true, HPresent: true,
    networkError: true, throwAt: 'StartupSplashFallback;->showErrorScreen',
  });
  assert.ok(r.reached.includes('throw'), r.reached.join(','));
  assert.ok(r.reached.includes('stage:fallback-forced'), r.reached.join(','));
  assert.ok(r.reached.includes('setVisibility:8'), `splash must be forced GONE: ${r.reached.join(',')}`);
  assert.ok(r.reached.includes('return'), r.reached.join(','));
  // Same guarantee if the web fallback path throws (zk0 construction)
  const r2 = runFlow(method, {
    activityAlive: true, finishing: false, splashVisible: true, HPresent: true,
    networkError: false, throwAt: 'Lzk0;-><init>',
  });
  assert.ok(r2.reached.includes('stage:fallback-forced'), r2.reached.join(','));
  assert.ok(r2.reached.includes('setVisibility:8'), `splash must be forced GONE: ${r2.reached.join(',')}`);
});

test('P0 flow: the error screen shows the visible tap-to-retry and the diag line', () => {
  const src = read('smali/com/melodix/music/StartupSplashFallback.smali');
  const show = parseSmaliMethod(src, 'public static showErrorScreen(Lcom/melodix/music/MainActivity;)V');
  const r = runFlow(show, {
    activityAlive: true, finishing: false, splashVisible: true, HPresent: true, networkError: true,
  });
  // Error text and icon are actually made VISIBLE (the layout ships them gone)
  assert.ok(r.reached.includes('setVisibility:0'), r.reached.join(','));
  // Tap-to-retry is installed and the diag line is shown
  assert.ok(r.reached.includes('installRetry'), r.reached.join(','));
  assert.ok(r.reached.includes('showDiag'), r.reached.join(','));
  assert.ok(r.reached.includes('return'), r.reached.join(','));
});

test('P0: SplashRetryListener.onClick resets directly, never through D()', () => {
  const src = read('smali/com/melodix/music/SplashRetryListener.smali');
  const click = parseSmaliMethod(src, 'public final onClick(Landroid/view/View;)V');
  const r = runFlow(click, {
    activityAlive: true, finishing: false, splashVisible: true, HPresent: true, networkError: true,
  });
  // K and J are hidden again, the web container is shown again
  assert.ok(r.reached.includes('setVisibility:8'), r.reached.join(','));
  assert.ok(r.reached.includes('setVisibility:0'), r.reached.join(','));
  // The error state machine is cleared and the page is reloaded
  assert.ok(r.reached.includes('return'), r.reached.join(','));
  const body = src.slice(src.indexOf('.method public final onClick'));
  assert.match(body, /WebView;->reload\(\)V/);
  assert.match(body, /StartupLoadWatchdog;->arm\(Landroid\/webkit\/WebView;\)V/);
  assert.ok(!/MainActivity;->D\(Z\)V/.test(body));
});

test('P0: rescue diagnostics expose armed/fired/watchdog/network state without tokens', () => {
  const src = read('smali/com/melodix/music/StartupSplashFallback.smali');
  const diag = src.slice(src.indexOf('.method public static showDiag'));
  assert.match(diag, /StartupSplashFallback;->armed:Z/);
  assert.match(diag, /StartupSplashFallback;->fired:Z/);
  assert.match(diag, /StartupLoadWatchdog;->armed:Z/);
  assert.match(diag, /AppSingleton;->m:Z/);
  assert.match(diag, /last_stage/);
  // Never expose tokens or private data on screen
  assert.ok(!/access_token|refresh_token|Bearer |cookie/i.test(diag));
});
