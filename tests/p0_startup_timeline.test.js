'use strict';

// The startup-timeline mode answers why the first display checkpoints are
// undetermined. Its central claim is an attribution: how much of the cold-start
// main-thread time is spent building the programmatic login form versus
// inflating XML, initialising the WebView provider, or doing something else.
//
// That attribution is only trustworthy if the classifier is correct, so the
// rule is extracted VERBATIM from the harness, compiled and executed on a real
// JVM here. The export surface is tested by executing the real filter and the
// real sidecar validator against privacy canaries.

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const ROOT = path.resolve(__dirname, '..');
const HARNESS = path.join(ROOT, 'tests/android/HomeRenderInstrumentation.java');
const RUNNER = path.join(ROOT, 'scripts/p0_startup_run_profile.sh');
const WORKFLOW = path.join(ROOT, '.github/workflows/p0-display-ownership.yml');

const read = (file) => fs.readFileSync(file, 'utf8');

function extractMethod(source, signature) {
  const start = source.indexOf(signature);
  assert.notEqual(start, -1, `the harness must define ${signature}`);
  const end = source.indexOf('\n    }\n', start);
  assert.notEqual(end, -1, `could not find the end of ${signature}`);
  return source.slice(start, end + '\n    }\n'.length);
}

function extractHeredoc(source, marker) {
  const start = source.indexOf(marker);
  assert.notEqual(start, -1, `missing heredoc ${marker}`);
  const bodyStart = start + marker.length;
  const terminator = `\n${marker.split("<<'")[1].split("'")[0]}\n`;
  const end = source.indexOf(terminator, bodyStart);
  assert.notEqual(end, -1, `unterminated heredoc ${marker}`);
  return source.slice(bodyStart, end);
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
    static void check(String name, String[] stack, String expected) {
        String actual = StartupProbe.classifyStartupFrame(stack);
        if (expected.equals(actual)) { pass++; }
        else { fail++; System.out.println("FAIL " + name + " expected=" + expected + " actual=" + actual); }
    }
    public static void main(String[] args) {
        // The hypothesis under test: widget constructors reached from onCreate
        // with no XML inflation on the stack are the programmatic login form.
        check("programmatic widget in onCreate",
            new String[]{"android.widget.TextView.<init>", "android.widget.LinearLayout.<init>",
                         "com.melodix.music.MainActivity.onCreate", "android.app.Activity.performCreate"},
            "form_widgets_in_oncreate");
        // The same widget constructor reached through inflation is NOT the form.
        check("inflated widget is not the form",
            new String[]{"android.widget.TextView.<init>", "android.view.LayoutInflater.inflate",
                         "com.melodix.music.MainActivity.onCreate"},
            "xml_inflate");
        check("inflation without onCreate",
            new String[]{"android.view.LayoutInflater.inflate", "android.app.Activity.setContentView"},
            "xml_inflate");
        check("chromium provider init",
            new String[]{"org.chromium.android_webview.AwBrowserProcess.f",
                         "android.webkit.WebView.<init>", "com.melodix.music.MainActivity.onCreate"},
            "webview_provider_init");
        check("webview factory init",
            new String[]{"android.webkit.WebViewFactory.getProvider", "com.melodix.music.MainActivity.onCreate"},
            "webview_provider_init");
        check("webview constructor alone",
            new String[]{"android.webkit.WebView.<init>", "com.melodix.music.MainActivity.onCreate"},
            "webview_ctor");
        check("onCreate doing other work",
            new String[]{"java.lang.String.indexOf", "com.melodix.music.MainActivity.onCreate"},
            "melodix_oncreate_other");
        check("other melodix work",
            new String[]{"com.melodix.music.NativeHomeShelfRenderer.render", "android.os.Handler.dispatchMessage"},
            "melodix_other");
        check("resources",
            new String[]{"android.content.res.AssetManager.nativeOpenAsset", "android.os.Handler.dispatchMessage"},
            "resources_assets");
        check("graphics",
            new String[]{"android.graphics.Canvas.drawText", "android.os.Handler.dispatchMessage"},
            "graphics_render");
        check("binder",
            new String[]{"android.os.BinderProxy.transact", "android.os.Handler.dispatchMessage"},
            "binder_ipc");
        check("idle main thread",
            new String[]{"android.os.MessageQueue.nativePollOnce", "android.os.Looper.loop"},
            "main_idle");
        check("unclassified",
            new String[]{"java.util.HashMap.put", "android.os.Handler.dispatchMessage"},
            "other");
        check("empty stack", new String[]{}, "other");
        check("null stack", null, "other");
        check("null frame tolerated",
            new String[]{null, "com.melodix.music.MainActivity.onCreate"}, "melodix_oncreate_other");
        // Priority: the WebView provider dominates even when widgets are built.
        check("provider beats form widgets",
            new String[]{"android.widget.FrameLayout.<init>", "org.chromium.base.PathUtils.g",
                         "com.melodix.music.MainActivity.onCreate"},
            "webview_provider_init");
        // A view constructor outside onCreate is not attributed to the form.
        check("widget outside onCreate",
            new String[]{"android.widget.TextView.<init>", "com.melodix.music.Other.build"},
            "melodix_other");
        System.out.println("# pass " + pass);
        System.out.println("# fail " + fail);
        if (fail > 0) System.exit(1);
    }
}
`;

test('the startup frame classifier is executed and separates the programmatic form from XML inflation', (t) => {
  const source = read(HARNESS);
  const method = extractMethod(source, '    static String classifyStartupFrame(');
  // Android names appear as string literals to match against; what must not
  // appear is an Android TYPE. Standalone compilation below is the real proof.
  assert.match(method, /static String classifyStartupFrame\(String\[\] stack\)/);
  assert.doesNotMatch(method, /\bandroid\.[a-z]+\.[A-Z]\w*\s+\w+\s*[=;)]/,
    'the pure rule must not declare an Android type');
  assert.doesNotMatch(method, /\.set[A-Z]|\.remove|\.add[A-Z]|invalidate\(/,
    'classification must be strictly read-only');

  const toolchain = findToolchain();
  if (!toolchain) {
    t.skip('no javac and no ECJ jar available: the classifier was not executed');
    return;
  }
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-startup-'));
  try {
    fs.writeFileSync(path.join(tmp, 'StartupProbe.java'), `public final class StartupProbe {\n${method}\n}\n`);
    fs.writeFileSync(path.join(tmp, 'Driver.java'), DRIVER);
    const compiled = toolchain.kind === 'javac'
      ? spawnSync(toolchain.javac, ['-d', tmp, 'StartupProbe.java', 'Driver.java'], { cwd: tmp, encoding: 'utf8' })
      : spawnSync(toolchain.java, ['-cp', toolchain.ecj, 'org.eclipse.jdt.internal.compiler.batch.Main',
        '-source', '1.8', '-target', '1.8', '-bootclasspath', toolchain.boot,
        '-d', tmp, '-nowarn', 'StartupProbe.java', 'Driver.java'], { cwd: tmp, encoding: 'utf8' });
    assert.equal(compiled.status, 0, `the extracted rule must compile: ${compiled.stderr}${compiled.stdout}`);
    const executed = spawnSync(toolchain.java, ['-cp', tmp, 'Driver'], { encoding: 'utf8' });
    assert.equal(executed.status, 0, `the classifier failed a case: ${executed.stdout}${executed.stderr}`);
    assert.match(executed.stdout, /# fail 0/);
    const passes = /# pass (\d+)/.exec(executed.stdout);
    assert.ok(passes && Number(passes[1]) >= 18, 'every documented classification case must have run');
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the startup mode observes the lifecycle passively and never rebases its origin', () => {
  const source = read(HARNESS);
  const mode = extractMethod(source, '    private void runStartupTimeline(');

  // Real durations require the pre/post callback pairs, not just the post ones.
  for (const pair of ['onActivityPreCreated', 'onActivityPostCreated', 'onActivityPreStarted',
    'onActivityPostStarted', 'onActivityPreResumed', 'onActivityPostResumed']) {
    assert.match(source, new RegExp(`public void ${pair}\\(`), `missing ${pair}`);
  }
  // First paint and focus come from passive ViewTreeObserver listeners, never
  // from replacing the window callback.
  assert.match(source, /addOnGlobalLayoutListener\(startupLayoutListener\)/);
  assert.match(source, /addOnDrawListener\(startupDrawListener\)/);
  assert.match(source, /addOnWindowFocusChangeListener\(startupFocusListener\)/);
  assert.match(source, /removeOnGlobalLayoutListener\(startupLayoutListener\)/);
  assert.match(source, /removeOnDrawListener\(startupDrawListener\)/);
  assert.match(source, /removeOnWindowFocusChangeListener\(startupFocusListener\)/);

  // Same origin contract as the validated ownership comparison.
  assert.match(mode, /final long origin = dispatchDisplayOwnershipLaunch\(\);/);
  assert.equal((mode.match(/origin\s*=(?!=)/g) || []).length, 1);
  // launch_command is asserted below to be written as the literal origin.

  // The five original checkpoints are preserved, and an unmeasurable one keeps
  // an explicit reason instead of being turned into a fake observation.
  assert.match(mode, /DISPLAY_OWNERSHIP_CHECKPOINTS_MS\.length/);
  assert.match(mode, /reason = "no_activity";/);
  assert.match(mode, /reason = "main_busy";/);
  assert.match(mode, /reason = "measured";/);
  assert.match(mode, /checkpoint\.put\("undetermined_reason", reason\);/);
  assert.doesNotMatch(mode, /reason = "not_observed"/,
    'this mode must never relabel an unmeasured checkpoint as not_observed');
  assert.equal((mode.match(/reason = "/g) || []).length, 3,
    'exactly three checkpoint reasons are allowed');

  // The sampler only ever exports bucket counts, never a frame.
  const sampler = mode.slice(mode.indexOf('Thread sampler'), mode.indexOf('sampler.setDaemon'));
  assert.match(sampler, /classifyStartupFrame\(frames\)/);
  assert.doesNotMatch(sampler, /sendStatus|putString\("st_/, 'the sampler must not export raw frames');
  assert.match(source, /private String startupHistogram\(/);
  assert.match(source, /STARTUP_BUCKET_NAMES/);

  // Nothing in this mode may mutate the app under measurement.
  assert.doesNotMatch(mode, /setVisibility\(|loadUrl\(|evaluateJavascript\(|CookieManager|clearData|startActivitySync/);

  // Sampling suspends the main thread, so the observer effect must be measured
  // and bounded, not hidden. The coarse settled interval and the onCreate cap
  // keep the perturbation small, and the cost is exported.
  assert.match(source, /STARTUP_SAMPLE_INTERVAL_MS = 50L;/);
  assert.match(source, /STARTUP_SETTLED_SAMPLE_INTERVAL_MS = 250L;/);
  assert.match(source, /STARTUP_MAX_ONCREATE_SAMPLES = 120;/);
  assert.match(mode, /startupSamplerCostMs \+= SystemClock\.elapsedRealtime\(\) - before;/);
  assert.match(mode, /sidecar\.put\("sampler_suspend_ms", startupSamplerCostMs\);/);
  assert.match(mode, /alreadyCounted/);
  // The launch command is the origin by definition, not a measured offset.
  assert.match(mode, /startupEvents\.put\("launch_command", Long\.valueOf\(0L\)\);/);
});

test('the startup status filter accepts measurements and rejects every privacy canary', () => {
  const runner = read(RUNNER);
  const filter = extractHeredoc(runner, 'cat >"$tmp/status-filter.py" <<\'FILTER\'\n');
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-startup-filter-'));
  try {
    const filterPath = path.join(tmp, 'filter.py');
    fs.writeFileSync(filterPath, filter);
    const base = [
      'INSTRUMENTATION_STATUS: overall=passed',
      'INSTRUMENTATION_STATUS: profile=phone',
      'INSTRUMENTATION_STATUS: startup_timeline_report_saved=true',
      'INSTRUMENTATION_STATUS_CODE: 1',
      'INSTRUMENTATION_CODE: -1',
    ];
    const run = (extra) => {
      const out = path.join(tmp, `out-${Math.random().toString(36).slice(2)}.json`);
      const proc = spawnSync('python3', [filterPath, out, 'phone'],
        { encoding: 'utf8', input: `${base.concat(extra).join('\n')}\n` });
      assert.equal(proc.status, 0, proc.stderr);
      const text = fs.readFileSync(out, 'utf8');
      return { text, statuses: JSON.parse(text).statuses };
    };

    const valid = run([
      'INSTRUMENTATION_STATUS: st_oncreate=3120',
      'INSTRUMENTATION_STATUS: st_oncreate_top=form_widgets_in_oncreate:180,xml_inflate:60',
      'INSTRUMENTATION_STATUS: st_200ms=unknown;unknown;no_activity;1410',
      'INSTRUMENTATION_STATUS: st_form=built',
    ]);
    assert.equal(valid.statuses.st_oncreate, '3120');
    assert.equal(valid.statuses.st_oncreate_top, 'form_widgets_in_oncreate:180,xml_inflate:60');
    assert.equal(valid.statuses.st_200ms, 'unknown;unknown;no_activity;1410');

    const canaries = [
      'INSTRUMENTATION_STATUS: st_oncreate_top=com.melodix.music.Secret.method:12',
      'INSTRUMENTATION_STATUS: st_oncreate_top=form_widgets_in_oncreate:1;token=SECRET_TOKEN',
      'INSTRUMENTATION_STATUS: st_all_top=https://private.invalid/?t=SECRET:1',
      'INSTRUMENTATION_STATUS: st_oncreate=SECRET',
      'INSTRUMENTATION_STATUS: st_200ms=native;native_shell;not_observed;200',
      'INSTRUMENTATION_STATUS: st_200ms=unknown;unknown;no_activity;99999999',
      'INSTRUMENTATION_STATUS: st_form=SECRET_PASSWORD',
      'INSTRUMENTATION_STATUS: cookie=SECRET_COOKIE',
      'INSTRUMENTATION_STATUS: url=https://accounts.spotify.com/login?token=SECRET',
    ];
    for (const canary of canaries) {
      const result = run([canary]);
      assert.equal(result.text.includes('SECRET'), false, `a canary must never be retained: ${canary}`);
      assert.equal(result.text.includes('https://'), false);
      assert.equal(result.text.includes('spotify.com'), false);
    }

    // Missing success statuses must fail closed.
    const out = path.join(tmp, 'missing.json');
    const missing = spawnSync('python3', [filterPath, out, 'phone'],
      { encoding: 'utf8', input: 'INSTRUMENTATION_STATUS: overall=passed\nINSTRUMENTATION_CODE: -1\n' });
    assert.notEqual(missing.status, 0);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

function startupSidecar(overrides = {}) {
  const checkpoints = {};
  const targets = { '200ms': 200, '1s': 1000, '3s': 3000, '8s': 8000, '20s': 20000 };
  for (const [label, target] of Object.entries(targets)) {
    const measured = target >= 8000;
    checkpoints[label] = {
      target_elapsed_ms: target,
      observed_elapsed_ms: target + (measured ? 20 : 1200),
      display_owner: measured ? 'native' : 'unknown',
      center_surface_owner: measured ? 'native_shell' : 'unknown',
      native_root_visible: measured,
      webview_container_visible: measured,
      native_owner_verified: measured,
      undetermined_reason: measured ? 'measured' : 'no_activity',
    };
  }
  // The 200 ms sample consumed its window, so the 1 s one follows it.
  checkpoints['1s'].observed_elapsed_ms = 2210;
  checkpoints['3s'].observed_elapsed_ms = 4205;
  return {
    schema_version: 1,
    profile: 'phone',
    source_commit: 'a'.repeat(40),
    run_id: '41891575697',
    apk_sha256: 'b'.repeat(64),
    timeline_origin: 'app_launch',
    session_state: 'unauthenticated',
    sample_interval_ms: 50,
    settled_sample_interval_ms: 250,
    sample_count: 240,
    sampler_suspend_ms: 410,
    view_count_at_first_observation: 412,
    login_form_probe: 'built',
    events: {
      process_start: -820, launch_command: 0, activity_pre_created: 90,
      activity_post_created: 3300, activity_pre_started: 3305, activity_post_started: 3320,
      activity_pre_resumed: 3325, activity_post_resumed: 3400, first_layout: 3450,
      first_draw: 3520, window_focused: 3600, native_root_present: 3460,
      native_root_visible: 15200, splash_present: 3460, webview_present: 3480,
      login_form_built: 3290,
    },
    durations: {
      oncreate_ms: 3210, onstart_ms: 15, onresume_ms: 75, launch_to_created_ms: 3300,
      launch_to_resumed_ms: 3400, launch_to_first_draw_ms: 3520,
      launch_to_first_focus_ms: 3600, launch_to_native_visible_ms: 15200,
    },
    main_thread_samples: 'form_widgets_in_oncreate:180,xml_inflate:60,main_idle:40',
    oncreate_main_thread_samples: 'form_widgets_in_oncreate:180,xml_inflate:60',
    checkpoints,
    ...overrides,
  };
}

test('the startup sidecar validator accepts a coherent timeline and rejects forged or leaking ones', () => {
  const runner = read(RUNNER);
  const validator = extractHeredoc(runner, 'python3 - "$tmp/sidecar.json" "$profile" "$source_ref" "$run_id" "$apk_sha256" <<\'VALIDATE\'\n');
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-startup-validate-'));
  try {
    const validatorPath = path.join(tmp, 'validate.py');
    fs.writeFileSync(validatorPath, validator);
    const check = (sidecar, expected) => {
      const file = path.join(tmp, `s-${Math.random().toString(36).slice(2)}.json`);
      fs.writeFileSync(file, JSON.stringify(sidecar));
      const proc = spawnSync('python3', [validatorPath, file, 'phone', 'a'.repeat(40), '41891575697', 'b'.repeat(64)],
        { encoding: 'utf8' });
      assert.equal(proc.status === 0, expected,
        `unexpected validator outcome: ${proc.stdout}${proc.stderr}`);
      return proc;
    };

    check(startupSidecar(), true);

    // An unmeasured checkpoint may never claim an observation.
    const forged = startupSidecar();
    forged.checkpoints['200ms'].display_owner = 'native';
    forged.checkpoints['200ms'].center_surface_owner = 'native_shell';
    check(forged, false);

    // A relabelled reason is rejected: "not_observed" is not a reason here.
    const relabelled = startupSidecar();
    relabelled.checkpoints['200ms'].undetermined_reason = 'not_observed';
    check(relabelled, false);

    // Out-of-window and non-monotonic observations are rejected.
    const late = startupSidecar();
    late.checkpoints['200ms'].observed_elapsed_ms = 3572;
    check(late, false);
    const backwards = startupSidecar();
    backwards.checkpoints['20s'].observed_elapsed_ms = 100;
    check(backwards, false);

    // Provenance and session claims are fixed.
    check(startupSidecar({ apk_sha256: 'c'.repeat(64) }), false);
    check(startupSidecar({ session_state: 'authenticated' }), false);
    check(startupSidecar({ timeline_origin: 'first_draw' }), false);

    // Unknown bucket, unknown event and leaking strings are rejected.
    check(startupSidecar({ oncreate_main_thread_samples: 'com.melodix.Secret:12' }), false);
    const badEvent = startupSidecar();
    badEvent.events.accounts_spotify_com = 10;
    check(badEvent, false);
    check(startupSidecar({ login_form_probe: 'https://private.invalid' }), false);

    // A missing checkpoint set is rejected.
    const partial = startupSidecar();
    delete partial.checkpoints['3s'];
    check(partial, false);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the workflow really executes the suite on a JDK and captures both startup profiles', () => {
  const workflow = read(WORKFLOW);
  assert.match(workflow, /verify-tooling-tests:/);
  assert.match(workflow, /command -v javac/);
  assert.match(workflow, /npm ci/);
  assert.match(workflow, /npm test 2>&1 \| tee/);
  assert.match(workflow, /grep -qE '\^# skipped 0\$'/);
  assert.match(workflow, /grep -qE '\^# fail 0\$'/);
  assert.match(workflow, /capture-startup-profile:/);
  assert.match(workflow, /scripts\/p0_startup_run_profile\.sh/);
  assert.match(workflow, /melodix-startup-timeline-\$\{\{ matrix\.profile \}\}-\$\{\{ github\.run_id \}\}/);
  // The startup capture must not weaken the validated ownership capture.
  assert.match(workflow, /scripts\/p0_display_run_profile\.sh/);
  assert.match(workflow, /aggregate-display-comparison:/);

  // GitHub keeps only ten annotations per step. Run 41903375677 emitted one
  // notice per metric and silently lost the attribution and the checkpoints,
  // so the publisher must consolidate them.
  const runner = read(RUNNER);
  const publisher = runner.slice(runner.indexOf('report_measurements() {'), runner.indexOf('report_failure() {'));
  const notices = publisher.match(/::notice title=/g) || [];
  assert.equal(notices.length, 3, 'the startup publisher must emit exactly three consolidated notices');
  assert.match(publisher, /P0 startup timing::/);
  assert.match(publisher, /P0 startup attribution::/);
  assert.match(publisher, /P0 startup checkpoints::/);
});

test('the authenticated runner waits for a real manual sign-in and can never capture a credential', () => {
  const script = read(path.join(ROOT, 'scripts/p0_authenticated_session.sh'));
  const syntax = spawnSync('bash', ['-n', path.join(ROOT, 'scripts/p0_authenticated_session.sh')], { encoding: 'utf8' });
  assert.equal(syntax.status, 0, syntax.stderr);

  // It drives the existing passive observer; it never automates the sign-in.
  assert.match(script, /-e mode authenticated-home/);
  // Match real commands, not the prose that promises not to use them.
  assert.doesNotMatch(script, /adb[^\n]*\b(input |logcat|screencap|uiautomator)/);
  assert.doesNotMatch(script, /am broadcast[^\n]*login/);
  // It must not destroy an existing session or inject any authentication state.
  assert.doesNotMatch(script, /adb[^\n]*pm clear|CookieManager|setCookie|localStorage/);
  assert.match(script, /does not clear your app data/);
  assert.match(script, /NEVER type your password/);
  // Exactly one device, never a guess.
  assert.match(script, /exactly one connected device is required/);
  // Both APKs must share a signer when the tool is available.
  assert.match(script, /not signed by the same certificate/);

  // The filter is the real export surface: execute it against canaries.
  const filter = extractHeredoc(script, 'cat >"$tmp/filter.py" <<\'FILTER\'\n');
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-auth-filter-'));
  try {
    const filterPath = path.join(tmp, 'filter.py');
    fs.writeFileSync(filterPath, filter);
    const out = path.join(tmp, 'out.json');
    const raw = [
      'INSTRUMENTATION_STATUS: phase=authenticated_home_wait',
      'INSTRUMENTATION_STATUS: authenticated_home_test_performed=true',
      'INSTRUMENTATION_STATUS: real_library_playlist_observed=true',
      'INSTRUMENTATION_STATUS: last_route_category=home',
      'INSTRUMENTATION_STATUS: target_activity_resume_count=3',
      'INSTRUMENTATION_STATUS: password=SECRET_PASSWORD',
      'INSTRUMENTATION_STATUS: cookie=SECRET_COOKIE',
      'INSTRUMENTATION_STATUS: access_token=SECRET_TOKEN',
      'INSTRUMENTATION_STATUS: url=https://accounts.spotify.com/?t=SECRET',
      'INSTRUMENTATION_STATUS: last_route_category=https://private.invalid/SECRET',
      'INSTRUMENTATION_STATUS: playlist_name=My SECRET playlist',
      'INSTRUMENTATION_CODE: -1',
    ].join('\n');
    const proc = spawnSync('python3', [filterPath, out], { encoding: 'utf8', input: `${raw}\n` });
    assert.equal(proc.status, 0, proc.stderr);
    const text = fs.readFileSync(out, 'utf8');
    assert.equal(text.includes('SECRET'), false, 'no credential, cookie, token or playlist name may be retained');
    assert.equal(text.includes('https://'), false);
    const parsed = JSON.parse(text).statuses;
    assert.equal(parsed.authenticated_home_test_performed, 'true');
    assert.equal(parsed.real_library_playlist_observed, 'true');
    assert.equal(parsed.last_route_category, 'home');
    assert.equal(Object.prototype.hasOwnProperty.call(parsed, 'playlist_name'), false);
    assert.match(proc.stdout, /a REAL authenticated home was observed/);
    assert.match(proc.stdout, /a REAL library playlist was observed/);

    // A run that never reached the observer's success code fails closed.
    const failing = spawnSync('python3', [filterPath, path.join(tmp, 'f.json')],
      { encoding: 'utf8', input: 'INSTRUMENTATION_STATUS: phase=authenticated_home_wait\nINSTRUMENTATION_CODE: 0\n' });
    assert.notEqual(failing.status, 0);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});
