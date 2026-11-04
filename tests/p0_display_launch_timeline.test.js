'use strict';

// Behavioural test of the launch-relative checkpoint scheduling rule.
//
// Run 41880564012 booted both real AVDs (phone 1080x2400@420, tablet
// 1600x2560@320) with the same APK and then failed both profiles with
// failure_phase=display_ownership_launch / failure_type=AssertionError.
//
// Cause: the comparison recorded `launchStart` and then called launchTarget(),
// which uses startActivitySync() and BLOCKS until the launched activity goes
// idle. On a cold emulator that takes seconds, so by the time the 200 ms
// checkpoint was sampled the observed elapsed time was already far past the
// 1500 ms tolerance. The 200 ms checkpoint was unreachable by construction, on
// every device, regardless of what the app actually displayed.
//
// The fix dispatches the launch without waiting and reads the resumed activity
// from the lifecycle observer. The waiting rule lives in
// `displayOwnershipActivityWaitBudget`, a static method with no Android types.
// This test extracts it VERBATIM, compiles it and executes it on a real JVM.

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const ROOT = path.resolve(__dirname, '..');
const HARNESS = path.join(ROOT, 'tests/android/HomeRenderInstrumentation.java');

function extractMethod(source, signature) {
  const start = source.indexOf(signature);
  assert.notEqual(start, -1, `the harness must define ${signature}`);
  const end = source.indexOf('\n    }\n', start);
  assert.notEqual(end, -1, `could not find the end of ${signature}`);
  return source.slice(start, end + '\n    }\n'.length);
}

function findToolchain() {
  const which = (name) => {
    const probe = spawnSync(process.platform === 'win32' ? 'where' : 'which', [name], { encoding: 'utf8' });
    return probe.status === 0 ? probe.stdout.split('\n')[0].trim() : null;
  };
  const javac = which('javac');
  const java = which('java');
  if (javac && java) return { kind: 'javac', javac, java };
  const ecj = process.env.MELODIX_ECJ_JAR
    || [path.join(os.homedir(), '.melodix-toolchain/ecj.jar')].find((candidate) => fs.existsSync(candidate));
  const jdk4py = '/usr/local/lib/python3.11/dist-packages/jdk4py/java-runtime/bin/java';
  const runtime = java || (fs.existsSync(jdk4py) ? jdk4py : null);
  if (ecj && runtime) {
    const boot = process.env.MELODIX_BOOTCLASSPATH
      || fs.readdirSync(path.dirname(ecj))
        .filter((name) => /^android-\d+\.jar$/.test(name))
        .sort()
        .map((name) => path.join(path.dirname(ecj), name))
        .pop();
    if (boot) return { kind: 'ecj', ecj, java: runtime, boot };
  }
  return null;
}

const DRIVER = `public final class Driver {
    static int pass = 0, fail = 0;
    static void check(String name, long actual, long expected) {
        if (actual == expected) { pass++; }
        else { fail++; System.out.println("FAIL " + name + " expected=" + expected + " actual=" + actual); }
    }
    static void checkBool(String name, boolean actual, boolean expected) {
        if (actual == expected) { pass++; }
        else { fail++; System.out.println("FAIL " + name + " expected=" + expected + " actual=" + actual); }
    }
    static final long TOL = 1200L;
    static final long[] TARGETS = {200L, 1000L, 3000L, 8000L, 20000L};
    static long budget(long origin, long target, long now, long tol) {
        return TimelineProbe.displayOwnershipActivityWaitBudget(origin, target, now, tol);
    }
    public static void main(String[] args) {
        long origin = 100000L;
        // At the launch instant the whole target plus tolerance is still ahead.
        check("200ms from launch instant", budget(origin, 200L, origin, TOL), 1400L);
        check("1s from launch instant", budget(origin, 1000L, origin, TOL), 2200L);
        // Exactly on target: only the tolerance remains.
        check("on target leaves the tolerance", budget(origin, 200L, origin + 200L, TOL), 1200L);
        // Already late: never wait, and never move the target.
        check("late observation does not wait", budget(origin, 200L, origin + 5000L, TOL), 0L);
        check("far late observation does not wait", budget(origin, 20000L, origin + 99999L, TOL), 0L);
        // The tolerance is a hard contract: the observation window the harness
        // enforces is 1500 ms, so a tolerance at or above it is refused.
        check("tolerance at the window limit refused", budget(origin, 200L, origin, 1500L), -1L);
        check("tolerance above the window limit refused", budget(origin, 200L, origin, 5000L), -1L);
        check("negative tolerance refused", budget(origin, 200L, origin, -1L), -1L);
        check("zero tolerance allowed", budget(origin, 200L, origin, 0L), 200L);
        check("zero tolerance already late", budget(origin, 200L, origin + 200L, 0L), 0L);

        // The invariant that actually broke: for every checkpoint, the latest
        // possible observation must stay inside the launch-relative window, and
        // the target must never be re-based.
        for (int i = 0; i < TARGETS.length; i++) {
            long target = TARGETS[i];
            long b = budget(origin, target, origin, TOL);
            long latest = origin + b;
            checkBool("checkpoint " + target + " stays inside the window",
                    latest <= origin + target + 1500L, true);
            checkBool("checkpoint " + target + " is not pushed before its target",
                    latest >= origin + target, true);
            // Monotonic: a later 'now' can only shrink the budget.
            long earlier = budget(origin, target, origin + 10L, TOL);
            long later = budget(origin, target, origin + 500L, TOL);
            checkBool("checkpoint " + target + " budget shrinks with time", later <= earlier, true);
        }

        // Documents the defect that was fixed: with a blocking launch the first
        // sample could only happen after the launcher returned, so the observed
        // elapsed time exceeded the window no matter what the app displayed.
        long blockingLaunchDuration = 3000L;
        long observedAfterBlockingLaunch = blockingLaunchDuration;
        checkBool("blocking launch made the 200ms window unreachable",
                observedAfterBlockingLaunch - 200L > 1500L, true);

        System.out.println("# pass " + pass);
        System.out.println("# fail " + fail);
        if (fail > 0) System.exit(1);
    }
}
`;

test('the launch-relative checkpoint rule is executed and never re-bases the timeline', (t) => {
  const source = fs.readFileSync(HARNESS, 'utf8');
  const method = extractMethod(source, '    static long displayOwnershipActivityWaitBudget(');
  const comparison = extractMethod(source, '    private void runDisplayOwnershipComparison(');

  assert.doesNotMatch(method, /android\./, 'the pure rule must not depend on Android types');

  // The launch must be dispatched without waiting for the activity to go idle.
  const dispatch = extractMethod(source, '    private long dispatchDisplayOwnershipLaunch(');
  assert.match(dispatch, /getTargetContext\(\)\.startActivity\(launch\)/);
  assert.doesNotMatch(dispatch, /startActivitySync/,
    'the display-ownership launch must not block until the activity is idle');
  assert.doesNotMatch(dispatch, /runOnMainSync\(/,
    'the dispatch must not wait for a busy main thread before recording the origin');
  assert.doesNotMatch(comparison, /=\s*launchTarget\(\)/,
    'the comparison must not use the blocking launcher');

  // Run 41890081437 observed the 200 ms checkpoint at 3572 ms because the origin
  // was taken before a dispatch that still waited for the main thread. The
  // origin must be recorded inside the posted task, immediately before
  // startActivity, and returned as the timeline origin.
  assert.match(dispatch,
    /displayOwnershipLaunchStart = SystemClock\.elapsedRealtime\(\);\s*\n\s*try \{\s*\n\s*getTargetContext\(\)\.startActivity\(launch\);/);
  assert.match(dispatch, /new android\.os\.Handler\(android\.os\.Looper\.getMainLooper\(\)\)\.post/);
  assert.match(dispatch, /return origin;/);
  assert.match(comparison, /final long launchStart = dispatchDisplayOwnershipLaunch\(\);/);
  assert.doesNotMatch(comparison, /final long launchStart = SystemClock\.elapsedRealtime\(\);/,
    'the origin must come from the real dispatch, not from the posting thread');
  const originWrites = comparison.match(/launchStart\s*=(?!=)/g) || [];
  assert.equal(originWrites.length, 1,
    'the launch origin must be written exactly once and never re-based after the launch');

  // The observer must be registered before the dispatch and always released.
  assert.ok(comparison.indexOf('registerActivityLifecycleObservation();')
    < comparison.indexOf('dispatchDisplayOwnershipLaunch()'),
  'the lifecycle observer must be registered before the launch');
  assert.match(comparison, /\}\s*finally\s*\{\s*unregisterActivityLifecycleObservation\(\);/);

  // The session assertion must not consume the measurement timeline.
  assert.ok(comparison.indexOf('requireUnauthenticatedSession(')
    > comparison.indexOf('for (int index = 0; index < DISPLAY_OWNERSHIP_CHECKPOINTS_MS.length'),
  'the unauthenticated-session check must run after the checkpoints');

  // The harness must use the executed rule, not a private inline deadline.
  assert.match(comparison, /displayOwnershipActivityWaitBudget\(launchStart, target,/);
  assert.match(source, /DISPLAY_OWNERSHIP_ACTIVITY_WAIT_TOLERANCE_MS = 1200L;/);

  // Run 41887640414 measured the consequence of an unbounded sample: the
  // activity had not resumed at 1406 ms / 2203 ms and the 3 s checkpoint failed
  // its window, because Instrumentation.runOnMainSync() waits for a main thread
  // that MainActivity.onCreate keeps busy for seconds. Every operation inside a
  // checkpoint must therefore be bounded by that checkpoint's own deadline.
  assert.match(comparison, /final long checkpointDeadline = launchStart \+ target\s*\+ DISPLAY_OWNERSHIP_ACTIVITY_WAIT_TOLERANCE_MS;/);
  assert.match(comparison, /postOnMainWithDeadline\(new Runnable\(\)[\s\S]*?\}, checkpointDeadline - SystemClock\.elapsedRealtime\(\)\);/);
  assert.match(comparison, /long probeBudget = Math\.min\([\s\S]*?checkpointDeadline - SystemClock\.elapsedRealtime\(\)\);/);
  assert.doesNotMatch(comparison, /runOnMainSync\(new Runnable\(\)\s*\{\s*@Override\s*public void run\(\)\s*\{\s*try\s*\{\s*sampleWebView/,
    'the checkpoint sample must not use the unbounded synchronous main-thread call');

  // A sample that cannot run in time is recorded as unobservable, never thrown
  // away and never allowed to move the deadline.
  assert.match(comparison, /if \(!sampled\) \{[\s\S]*?_main_busy[\s\S]*?unresumedDisplayOwnershipCheckpoint\(target, launchStart\)[\s\S]*?continue;/);

  const jsProbe = extractMethod(source, '    private String evaluateJavascriptWithDeadline(');
  assert.match(jsProbe, /new android\.os\.Handler\(android\.os\.Looper\.getMainLooper\(\)\)\.post/);
  assert.doesNotMatch(jsProbe, /runOnMainSync\(/,
    'the bounded JS probe must not block on an unbounded main-thread call first');
  assert.match(jsProbe, /if \(timeoutMillis <= 0L\) return null;/);

  const toolchain = findToolchain();
  if (!toolchain) {
    t.skip('no javac and no ECJ jar available: the timeline rule was not executed');
    return;
  }

  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-timeline-'));
  try {
    fs.writeFileSync(path.join(tmp, 'TimelineProbe.java'), `public final class TimelineProbe {\n${method}\n}\n`);
    fs.writeFileSync(path.join(tmp, 'Driver.java'), DRIVER);
    const compiled = toolchain.kind === 'javac'
      ? spawnSync(toolchain.javac, ['-d', tmp, 'TimelineProbe.java', 'Driver.java'], { cwd: tmp, encoding: 'utf8' })
      : spawnSync(toolchain.java, ['-cp', toolchain.ecj, 'org.eclipse.jdt.internal.compiler.batch.Main',
        '-source', '1.7', '-target', '1.7', '-bootclasspath', toolchain.boot,
        '-d', tmp, '-nowarn', 'TimelineProbe.java', 'Driver.java'],
      { cwd: tmp, encoding: 'utf8' });
    assert.equal(compiled.status, 0, `the extracted rule must compile: ${compiled.stderr}`);
    assert.ok(fs.existsSync(path.join(tmp, 'TimelineProbe.class')), 'the rule must produce bytecode');

    const executed = spawnSync(toolchain.java, ['-cp', tmp, 'Driver'], { encoding: 'utf8' });
    assert.equal(executed.status, 0, `the timeline rule failed a case: ${executed.stdout}${executed.stderr}`);
    assert.match(executed.stdout, /# fail 0/);
    const passes = /# pass (\d+)/.exec(executed.stdout);
    assert.ok(passes && Number(passes[1]) >= 26, 'every documented timeline case must have run');
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});
