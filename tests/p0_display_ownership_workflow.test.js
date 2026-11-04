'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const ROOT = path.resolve(__dirname, '..');
const HARNESS = path.join(ROOT, 'tests/android/HomeRenderInstrumentation.java');
const SCRIPTS = [
  'scripts/p0_display_verify_apk.sh',
  'scripts/p0_display_build_harness.sh',
  'scripts/p0_display_boot_avd.sh',
  'scripts/p0_display_run_profile.sh',
  'scripts/p0_display_stop_avd.sh',
];
const JOBS = [
  'compile-display-harness',
  'build-display-apk',
  'prepare-display-comparison',
  'capture-display-profile',
  'aggregate-display-comparison',
];

function read(relative) {
  return fs.readFileSync(path.join(ROOT, relative), 'utf8');
}

function jobBlock(workflow, name) {
  const start = workflow.indexOf(`  ${name}:`);
  assert.ok(start >= 0, `job ${name} must exist`);
  const next = workflow.slice(start + 1).search(/\n  [a-z0-9-]+:\n/);
  return next < 0 ? workflow.slice(start) : workflow.slice(start, start + 1 + next);
}

// ---------------------------------------------------------------------------
// Realistic APK/checkout fixture: the three generated assets, their readable
// sources with truthful derivation headers, plus one plain asset.
// ---------------------------------------------------------------------------
const GENERATED = ['spotify_bridge', 'native_ui_shell', 'melodix_home'];

const BUILDER = `
import hashlib, json, pathlib, sys, zipfile
spec = json.loads(pathlib.Path(sys.argv[1]).read_text())
root = pathlib.Path(spec['source_root']); apk_dir = pathlib.Path(spec['apk_dir'])
apk_name = spec['apk_name']
overrides = spec.get('asset_overrides', {})
omit = set(spec.get('omit_source_for', []))
drop = set(spec.get('drop_entries', []))
header_override = spec.get('header_override', {})
generated = {'spotify_bridge', 'native_ui_shell', 'melodix_home'}
names = sorted(p.relative_to(root).as_posix() for p in (root / 'assets').rglob('*') if p.is_file())
entries = []
with zipfile.ZipFile(apk_dir / apk_name, 'w') as z:
    for name in names:
        data = (root / name).read_bytes()
        if name in header_override:
            rest = data.split(b'\\n', 1)[1] if b'\\n' in data else b''
            data = header_override[name].encode() + b'\\n' + rest
        if name in overrides:
            data = overrides[name].encode()
        z.writestr(name, data)
        if name in drop:
            continue
        entry = {'name': name, 'asset_sha256': hashlib.sha256(data).hexdigest(), 'bytes': len(data)}
        stem = pathlib.PurePosixPath(name).stem
        if stem in generated and name not in omit:
            source = f'scripts/{stem}.source.js'
            entry['source'] = source
            entry['source_sha256'] = hashlib.sha256((root / source).read_bytes()).hexdigest()
        entries.append(entry)
entries.extend(spec.get('extra_entries', []))
digest = hashlib.sha256((apk_dir / apk_name).read_bytes()).hexdigest()
(apk_dir / (apk_name + '.sha256')).write_text(f'{digest}  {apk_name}\\n')
manifest = {'source_commit': spec['source_ref'], 'assets': entries}
(apk_dir / 'assets-manifest.json').write_text(json.dumps(manifest))
`;

function buildFixture(tmp, overrides = {}) {
  const sourceRef = overrides.sourceRef || 'a'.repeat(40);
  const versionName = `1.2.2-${sourceRef.slice(0, 7)}`;
  const apkName = 'Melodix-Preview-v1.2.2-test96-display-ownership.apk';
  const apkDir = path.join(tmp, 'apk');
  const sourceRoot = path.join(tmp, 'source');
  const sdk = path.join(tmp, 'sdk');
  const buildTools = path.join(sdk, 'build-tools', '35.0.0');
  for (const dir of [apkDir, path.join(sourceRoot, 'assets'), path.join(sourceRoot, 'scripts'), buildTools]) {
    fs.mkdirSync(dir, { recursive: true });
  }
  for (const stem of GENERATED) {
    const source = `// readable ${stem}\nvar ${stem} = 1;\n`;
    fs.writeFileSync(path.join(sourceRoot, 'scripts', `${stem}.source.js`), source);
    const digest = require('node:crypto').createHash('sha256').update(source).digest('hex');
    fs.writeFileSync(
      path.join(sourceRoot, 'assets', `${stem}.js`),
      `/* generated from scripts/${stem}.source.js; sha256=${digest}; terser=5.51.2; no-compress,no-mangle */\nvar ${stem}=1;\n`,
    );
  }
  fs.writeFileSync(path.join(sourceRoot, 'assets', 'probe.txt'), 'test-only asset\n');

  const signerSha = 'b'.repeat(64);
  const signerFingerprint = signerSha.toUpperCase().match(/.{2}/g).join(':');
  fs.writeFileSync(path.join(buildTools, 'aapt'), `#!/usr/bin/env bash
set -euo pipefail
case "$*" in
  *"dump badging"*) printf "package: name='com.melodix.music.preview' versionCode='123' versionName='${versionName}'\\n" ;;
  *"dump xmltree"*) printf 'android:debuggable=true\\n' ;;
  *"dump --values resources"*) printf '${sourceRef}\\n${signerFingerprint}\\n' ;;
  *) exit 2 ;;
esac
`);
  fs.writeFileSync(path.join(buildTools, 'apksigner'), `#!/usr/bin/env bash
set -euo pipefail
if [[ "$*" == *"--print-certs"* ]]; then
  printf 'Signer #1 certificate SHA-256 digest: ${signerSha}\\n'
fi
exit 0
`);
  fs.chmodSync(path.join(buildTools, 'aapt'), 0o755);
  fs.chmodSync(path.join(buildTools, 'apksigner'), 0o755);

  const builderPath = path.join(tmp, 'builder.py');
  fs.writeFileSync(builderPath, BUILDER);
  const fixture = { tmp, sourceRef, versionName, apkName, apkDir, sourceRoot, sdk, buildTools, signerSha, builderPath };
  rebuildApk(fixture, overrides.spec || {});
  return fixture;
}

function rebuildApk(fixture, spec = {}) {
  const specPath = path.join(fixture.tmp, 'spec.json');
  fs.writeFileSync(specPath, JSON.stringify({
    source_root: fixture.sourceRoot,
    apk_dir: fixture.apkDir,
    apk_name: fixture.apkName,
    source_ref: fixture.sourceRef,
    ...spec,
  }));
  const built = spawnSync('python3', [fixture.builderPath, specPath], { encoding: 'utf8' });
  assert.equal(built.status, 0, built.stderr);
}

function runVerifier(fixture, out, env = {}) {
  return spawnSync('bash', [
    path.join(ROOT, 'scripts/p0_display_verify_apk.sh'),
    fixture.apkDir, fixture.apkName, fixture.sourceRef, '123', fixture.versionName, out,
  ], {
    encoding: 'utf8',
    env: { ...process.env, ANDROID_HOME: fixture.sdk, SOURCE_ROOT: fixture.sourceRoot, ...env },
  });
}

test('the display-ownership workflow is manual, opt-in, read-only, and cannot publish a preview', () => {
  const workflow = read('.github/workflows/p0-display-ownership.yml');
  assert.match(workflow, /^on:\n  workflow_dispatch:\n/m);
  assert.doesNotMatch(workflow, /^  push:\n|^  pull_request:\n|^  schedule:\n|^  workflow_call:\n/m);
  assert.match(workflow, /enabled:[\s\S]*?required: true[\s\S]*?type: boolean[\s\S]*?default: false/);
  assert.match(workflow, /source_ref:[\s\S]*?required: true[\s\S]*?type: string/);
  assert.doesNotMatch(workflow, /source_ref:[\s\S]*?default:/);
  assert.match(workflow, /permissions:\n  actions: read\n  contents: read/);
  assert.doesNotMatch(workflow, /contents: write|actions: write|pages: write|id-token: write|deployments: write/);
  assert.doesNotMatch(workflow, /gh release|publish_preview|actions\/upload-pages-artifact|actions\/deploy-pages|release-apk\.yml/);
  for (const job of JOBS) {
    const block = jobBlock(workflow, job);
    assert.match(block, /if: github\.event_name == 'workflow_dispatch' && inputs\.enabled == true/,
      `${job} must remain disabled unless the manual enabled input is true`);
  }
});

test('a dedicated CI job really compiles the harness with javac against the Android SDK', () => {
  const workflow = read('.github/workflows/p0-display-ownership.yml');
  const compile = jobBlock(workflow, 'compile-display-harness');
  assert.match(compile, /actions\/setup-java@/);
  assert.match(compile, /java-version: "17"/);
  assert.match(compile, /android-actions\/setup-android@/);
  assert.match(compile, /sdkmanager --install "build-tools;35\.0\.0" "platforms;android-36"/);
  assert.match(compile, /javac --release 8 -Xlint:all/);
  assert.match(compile, /-classpath "\$android_jar"/);
  assert.match(compile, /tests\/android\/HomeRenderInstrumentation\.java/);
  assert.match(compile, /javap -p -classpath/);
  assert.match(compile, /d8" --lib "\$android_jar" --min-api 24/);
  assert.match(compile, /real_android_compilation=true/);
  // A syntax parse must never be presented as a compilation.
  assert.doesNotMatch(compile, /javalang/);
  // No signing secret is needed to compile.
  assert.doesNotMatch(compile, /MELODIX_PREVIEW_KEYSTORE_B64|MELODIX_PREVIEW_KEY_PASSWORD/);
  const prepare = jobBlock(workflow, 'prepare-display-comparison');
  assert.match(prepare, /needs: \[build-display-apk, compile-display-harness\]/,
    'the signed harness build must be gated on a real compilation');
});

test('one build-only debuggable APK is verified and reused by both profile captures', () => {
  const workflow = read('.github/workflows/p0-display-ownership.yml');
  const build = jobBlock(workflow, 'build-display-apk');
  assert.match(build, /uses: \.\/\.github\/workflows\/preview-apk\.yml/);
  assert.match(build, /build_only: true/);
  assert.match(build, /target_debuggable: true/);
  assert.match(build, /apk_suffix: -display-ownership/);
  assert.match(build, /secrets: inherit/);

  const prepare = jobBlock(workflow, 'prepare-display-comparison');
  assert.match(prepare, /p0_display_verify_apk\.sh/);
  assert.match(prepare, /p0_display_build_harness\.sh/);
  assert.match(prepare, /apk_sha256: \$\{\{ steps\.provenance\.outputs\.apk_sha256 \}\}/);
  assert.match(prepare, /harness_sha256: \$\{\{ steps\.harness\.outputs\.harness_sha256 \}\}/);
  assert.match(prepare, /retention-days: 1[\s\S]*?if-no-files-found: error/);

  const capture = jobBlock(workflow, 'capture-display-profile');
  assert.match(capture, /needs: \[build-display-apk, prepare-display-comparison\]/);
  assert.match(capture, /fail-fast: false/);
  assert.match(capture, /profile: \[phone, tablet\]/);
  assert.match(capture, /name: \$\{\{ needs\.build-display-apk\.outputs\.apk_name \}\}/);
  assert.match(capture, /p0_display_verify_apk\.sh/);
  assert.match(capture, /profile APK provenance does not match the prepared provenance/);
  assert.match(capture, /harness SHA-256 mismatch/);
  assert.match(capture, /p0_display_boot_avd\.sh/);
  assert.match(capture, /p0_display_run_profile\.sh/);
  const bootIndex = capture.indexOf('p0_display_boot_avd.sh');
  const captureIndex = capture.indexOf('p0_display_run_profile.sh');
  assert.ok(bootIndex >= 0 && captureIndex > bootIndex);
  assert.doesNotMatch(capture.slice(bootIndex, captureIndex), /^      - name:/m,
    'boot and capture must stay in the same runner step so the emulator is not reaped between steps');
  assert.match(capture, /P0_DISPLAY_AVD_STATE_DIR="\$avd_state"/,
    'the instrumentation must receive the persisted emulator state directory');
  assert.match(capture, /p0_display_stop_avd\.sh/);
  assert.doesNotMatch(capture, /adb emu kill(?!.*-s)/, 'cleanup must not use an untargeted emulator kill');
  // Match real command usage, not the word appearing in an explanatory comment.
  assert.doesNotMatch(capture, /^\s*(pkill|killall)\b/m);
  assert.match(capture, /boot-diagnostic\.json/);
  assert.match(capture, /melodix-display-ownership-\$\{\{ matrix\.profile \}\}-\$\{\{ github\.run_id \}\}/);
  assert.match(capture, /retention-days: 1[\s\S]*?if-no-files-found: error/);
  assert.doesNotMatch(capture, /MELODIX_PREVIEW_KEYSTORE_B64|MELODIX_PREVIEW_KEYSTORE_PASSWORD|MELODIX_PREVIEW_KEY_PASSWORD/);

  const boot = read('scripts/p0_display_boot_avd.sh');
  assert.match(boot, /nohup "\$ANDROID_HOME\/emulator\/emulator"/);
  assert.match(boot, /emulator_exited_before_boot_completed/);
  assert.match(boot, /BOOT_BUDGET_SECONDS=900/);
  assert.match(boot, /CAPTURE_BUDGET_SECONDS=1500/);
  assert.match(boot, /"\$state_dir\/emulator\.pid"/);
  assert.match(boot, /"\$state_dir\/emulator\.device"/);
  assert.match(boot, /capture-deadline_epoch/);
  assert.match(boot, /raw_log_retained": False/);
});

test('aggregation consumes only the two strict sidecars and never claims P0 resolution', () => {
  const workflow = read('.github/workflows/p0-display-ownership.yml');
  const aggregate = jobBlock(workflow, 'aggregate-display-comparison');
  assert.match(aggregate, /needs: \[prepare-display-comparison, capture-display-profile\]/);
  assert.match(aggregate, /melodix-display-ownership-phone-\$\{\{ github\.run_id \}\}/);
  assert.match(aggregate, /melodix-display-ownership-tablet-\$\{\{ github\.run_id \}\}/);
  assert.match(aggregate, /aggregate_p0_display_ownership\.py/);
  assert.match(aggregate, /--source-ref "\$SOURCE_REF"/);
  assert.match(aggregate, /--run-id "\$\{\{ github\.run_id \}\}"/);
  assert.match(aggregate, /--apk-sha256 "\$APK_SHA256"/);
  assert.match(aggregate, /--phone-report/);
  assert.match(aggregate, /--tablet-report/);
  assert.match(aggregate, /p0_resolution_claimed"\] is not False/);
  assert.match(aggregate, /p0_display_ownership_satisfied/);
  assert.match(aggregate, /The P0 remains open/);
  assert.match(aggregate, /retention-days: 1[\s\S]*?if-no-files-found: error/);
  assert.doesNotMatch(aggregate, /logcat|screencap|uiautomator|\.png|\.xml/);
});

test('the shell helpers are syntactically valid and reject invalid arguments before touching Android', () => {
  for (const script of SCRIPTS) {
    const result = spawnSync('bash', ['-n', path.join(ROOT, script)], { encoding: 'utf8' });
    assert.equal(result.status, 0, `${script} must pass bash -n: ${result.stderr}`);
  }

  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-shell-'));
  try {
    const apk = path.join(tmp, 'target.apk');
    const harness = path.join(tmp, 'harness.apk');
    fs.writeFileSync(apk, 'placeholder');
    fs.writeFileSync(harness, 'placeholder');
    const cases = [
      ['scripts/p0_display_verify_apk.sh', [tmp, 'Melodix-Preview-test.apk', 'not-a-sha', '1', '1.2.2-abcdefg', path.join(tmp, 'provenance.json')]],
      ['scripts/p0_display_build_harness.sh', [ROOT, apk, '1', '1.2.2-abcdefg', 'not-a-sha', tmp]],
      ['scripts/p0_display_boot_avd.sh', ['desktop', 'MelodixDisplayPhone', 'system-images;android-36;google_apis;x86_64', tmp]],
      ['scripts/p0_display_boot_avd.sh', ['phone', 'MelodixDisplayPhone', 'system-images;android-36;google_apis;x86_64']],
      ['scripts/p0_display_run_profile.sh', ['desktop', apk, harness, 'a'.repeat(40), '1', 'b'.repeat(64), tmp]],
      ['scripts/p0_display_run_profile.sh', ['phone', apk, harness, 'a'.repeat(40), 'not-numeric', 'b'.repeat(64), tmp]],
      ['scripts/p0_display_run_profile.sh', ['phone', apk, harness, 'a'.repeat(40), '1', 'not-a-sha', tmp]],
      ['scripts/p0_display_stop_avd.sh', []],
      ['scripts/p0_display_stop_avd.sh', [path.join(tmp, 'absent-state-dir')]],
    ];
    for (const [script, args] of cases) {
      const result = spawnSync('bash', [path.join(ROOT, script), ...args], { encoding: 'utf8' });
      assert.notEqual(result.status, 0, `${script} should reject invalid arguments`);
      assert.match(result.stderr, /::error title=P0 display/);
    }
    assert.equal(fs.existsSync(path.join(tmp, 'provenance.json')), false);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the instrumentation mode is launch-relative, read-only, and emits only the strict sidecar', () => {
  const harness = read('tests/android/HomeRenderInstrumentation.java');
  assert.match(harness, /"display-ownership"\.equals\(runnerArguments\.getString\("mode"\)\)/);
  assert.match(harness, /DISPLAY_OWNERSHIP_CHECKPOINTS_MS = \{200L, 1000L, 3000L, 8000L, 20000L\}/);
  assert.match(harness, /DISPLAY_OWNERSHIP_CHECKPOINT_LABELS = \{"200ms", "1s", "3s", "8s", "20s"\}/);
  const start = harness.indexOf('private void runDisplayOwnershipComparison');
  const end = harness.indexOf('private JSONObject inspectDisplayOwnershipCheckpoint', start);
  assert.ok(start >= 0 && end > start);
  const mode = harness.slice(start, end);
  // Run 41880564012 booted both real AVDs and failed both profiles because the
  // origin was recorded before launchTarget(), whose startActivitySync() blocks
  // until the activity is idle: the 200 ms checkpoint was unreachable by
  // construction. The corrected contract is a non-blocking dispatch with the
  // origin recorded immediately before it and never re-based afterwards.
  assert.match(mode, /final long launchStart = dispatchDisplayOwnershipLaunch\(\);/);
  assert.doesNotMatch(mode, /=\s*launchTarget\(\)/);
  assert.equal((mode.match(/launchStart\s*=(?!=)/g) || []).length, 1);
  // The origin must be the instant startActivity really ran, not the instant a
  // task was posted: run 41890081437 observed the 200 ms checkpoint at 3572 ms
  // because the dispatch still waited for a busy main thread.
  const dispatcher = harness.slice(harness.indexOf('private long dispatchDisplayOwnershipLaunch('));
  assert.match(dispatcher, /displayOwnershipLaunchStart = SystemClock\.elapsedRealtime\(\);\s*\n\s*try \{\s*\n\s*getTargetContext\(\)\.startActivity\(launch\);/);
  assert.match(mode, /displayOwnershipActivityWaitBudget\(launchStart, target,/);
  // The session assertion must not consume the launch-relative timeline.
  assert.match(mode, /requireUnauthenticatedSession\(settledActivity\)/);
  assert.ok(mode.indexOf('requireUnauthenticatedSession(')
    > mode.indexOf('for (int index = 0; index < DISPLAY_OWNERSHIP_CHECKPOINTS_MS.length'));
  assert.match(mode, /\}\s*finally\s*\{\s*unregisterActivityLifecycleObservation\(\);/);
  assert.match(mode, /"phone"\.equals\(profile\) && smallest >= 600/);
  assert.match(mode, /"tablet"\.equals\(profile\) && smallest < 600/);
  assert.match(mode, /openFileOutput\(DISPLAY_OWNERSHIP_REPORT_FILE, Context\.MODE_PRIVATE\)/);
  assert.match(mode, /sidecar\.put\("schema_version", 2\)/);
  assert.match(mode, /sidecar\.put\("timeline_origin", "app_launch"\)/);
  assert.match(mode, /sidecar\.put\("authenticated_spotify_test", "not_performed"\)/);
  assert.match(mode, /sidecar\.put\("session_state", "unauthenticated"\)/);
  assert.match(mode, /sendStatus\(1, result\)/);
  assert.match(mode, /completeDisplayOwnershipWebCenter\(checkpoint, sampleWebView\[0\], launchStart/);
  assert.match(mode, /probeElapsed - target > 1500L/);
  assert.doesNotMatch(mode, /logcat|screencap|uiautomator|captureUiEvidence|takeScreenshot|Bitmap|loadUrl|CookieManager|localStorage|sessionStorage/);

  const checkpointStart = harness.indexOf('private JSONObject inspectDisplayOwnershipCheckpoint');
  const checkpointEnd = harness.indexOf('private void completeDisplayOwnershipWebCenter', checkpointStart);
  const checkpoint = harness.slice(checkpointStart, checkpointEnd);
  assert.match(checkpoint, /frontmostFullscreenSurface\(hScroll, nativeRoot, splash, mainRoot, width, height\)/);
  assert.match(checkpoint, /getMethod\("isLoginWebPath"\)/);
  assert.match(checkpoint, /webView\.getParent\(\) == webContainer/);
  // The dock check must be the occlusion-aware measurement, never the ancestor
  // containment tautology: nativeHomeTab is a descendant of nativeRoot, so
  // getGlobalVisibleRect() already clips it to rootBounds and contains() could
  // not fail even with the WebView drawn over the dock.
  assert.match(checkpoint, /rootCoversDock = rootBounds != null\s*&& nativeDockActuallyVisible\(dockBounds, mainRoot, nativeRoot, hScroll, splash\)/);
  assert.doesNotMatch(checkpoint, /rootCoversDock = rootBounds != null && dockBounds != null && rootBounds\.contains\(dockBounds\)/);
  assert.match(checkpoint, /nativeVerified = "native"\.equals\(owner\) && rootVisible && rootCoversCenter && rootCoversDock && splashHidden/);
  assert.match(checkpoint, /checkpoint\.put\("observed_elapsed_ms", SystemClock\.elapsedRealtime\(\) - launchStart\)/);
  // The centre surface is derived from runtime geometry, never from a fixture.
  assert.match(checkpoint, /webCoversCenter = webBounds != null && webBounds\.contains\(centerX, centerY\)/);
  assert.match(checkpoint, /centerSurface = "native_shell"/);
  assert.match(checkpoint, /centerSurface = "splash"/);
  assert.match(checkpoint, /centerSurface = "web"/);
  assert.match(checkpoint, /checkpoint\.put\("splash_transient", "splash"\.equals\(centerSurface\)\)/);

  const webStart = harness.indexOf('private void completeDisplayOwnershipWebCenter');
  const webEnd = harness.indexOf('private Object jsonBounds', webStart);
  const web = harness.slice(webStart, webEnd);
  // Splash / native centre is a positive "not_observed"; an unclassifiable
  // WebView centre must stay "undetermined" rather than become a pass.
  assert.match(web, /if \("native_shell"\.equals\(centerSurface\) \|\| "splash"\.equals\(centerSurface\)\) \{\s*state = "not_observed";/);
  assert.match(web, /if \("spotify_web"\.equals\(category\)\) \{\s*state = "observed";/);
  assert.match(web, /state = "undetermined";/);
  assert.match(web, /if \(raw == null\) return "unavailable";/);
  assert.match(web, /if \(!received\.await\(timeoutMillis, TimeUnit\.MILLISECONDS\)\) return null;/);

  const probeStart = harness.indexOf('private static final String DISPLAY_OWNERSHIP_PROBE');
  const probeEnd = harness.indexOf('private static final String AUTHENTICATED_HOME_PROBE', probeStart);
  const probe = harness.slice(probeStart, probeEnd);
  assert.match(probe, /elementFromPoint/);
  assert.match(probe, /SF_CONFIG/);
  assert.doesNotMatch(probe, /className\s*=|classList\.add|classList\.remove|createElement|appendChild|loadUrl|document\.cookie|localStorage|sessionStorage/);
});

test('the APK verifier fails closed on a different APK, wrong provenance, signer, debuggable flag, or asset manifest', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-apk-'));
  try {
    const fixture = buildFixture(tmp);
    const { apkDir, apkName, sourceRef, versionName, buildTools, signerSha } = fixture;
    const provenance = path.join(tmp, 'provenance.json');
    const valid = runVerifier(fixture, provenance);
    assert.equal(valid.status, 0, valid.stderr);
    const report = JSON.parse(fs.readFileSync(provenance, 'utf8'));
    assert.equal(report.source_commit, sourceRef);
    assert.equal(report.version_name, versionName);
    assert.equal(report.signer_sha256, signerSha);
    assert.equal(report.debuggable, true);
    assert.equal(report.assets_source_root_verified, true);
    assert.equal(report.assets_verified_count, 4);
    assert.equal(report.generated_assets_source_verified_count, 3);

    const manifestPath = path.join(apkDir, 'assets-manifest.json');
    const originalManifest = fs.readFileSync(manifestPath, 'utf8');
    const baseManifest = JSON.parse(originalManifest);
    const manifestCases = [
      ['duplicate', (manifest) => manifest.assets.push({ ...manifest.assets[0] })],
      ['unsafe-path', (manifest) => { manifest.assets[0].name = '../evil.txt'; }],
      ['non-asset-path', (manifest) => { manifest.assets[0].name = 'res/probe.txt'; }],
      ['bad-bytes', (manifest) => { manifest.assets[0].bytes = 999; }],
      ['bad-digest', (manifest) => { manifest.assets[0].asset_sha256 = 'c'.repeat(64); }],
      ['bad-source-hash', (manifest) => {
        const entry = manifest.assets.find((item) => item.name === 'assets/melodix_home.js');
        entry.source_sha256 = 'd'.repeat(64);
      }],
    ];
    for (const [label, mutate] of manifestCases) {
      const manifest = JSON.parse(JSON.stringify(baseManifest));
      mutate(manifest);
      fs.writeFileSync(manifestPath, JSON.stringify(manifest));
      const out = path.join(tmp, `manifest-${label}.json`);
      const result = runVerifier(fixture, out);
      assert.notEqual(result.status, 0, `asset manifest ${label} must be rejected`);
      assert.equal(fs.existsSync(out), false, `asset manifest ${label} must not leave provenance`);
    }
    fs.writeFileSync(manifestPath, originalManifest);

    const wrongSource = 'c'.repeat(40);
    const cases = [
      { args: [apkDir, apkName, wrongSource, '123', `1.2.2-${wrongSource.slice(0, 7)}`, path.join(tmp, 'wrong-source.json')], env: {} },
      { args: [apkDir, apkName, sourceRef, '999', versionName, path.join(tmp, 'wrong-version.json')], env: {} },
      { args: [apkDir, apkName, sourceRef, '123', '1.2.2-wrong', path.join(tmp, 'wrong-name.json')], env: {} },
      { args: [apkDir, apkName, sourceRef, '123', versionName, path.join(tmp, 'wrong-signer.json')], env: { FAKE_SIGNER: 'c'.repeat(64) } },
    ];
    for (const item of cases) {
      if (item.env.FAKE_SIGNER) {
        fs.writeFileSync(path.join(buildTools, 'apksigner'), `#!/usr/bin/env bash
printf 'Signer #1 certificate SHA-256 digest: ${item.env.FAKE_SIGNER}\\n'
exit 0
`);
        fs.chmodSync(path.join(buildTools, 'apksigner'), 0o755);
      }
      const result = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_verify_apk.sh'), ...item.args], {
        encoding: 'utf8',
        env: { ...process.env, ANDROID_HOME: fixture.sdk, SOURCE_ROOT: fixture.sourceRoot },
      });
      assert.notEqual(result.status, 0, 'invalid APK provenance must be rejected');
      assert.equal(fs.existsSync(item.args[5]), false, 'invalid APK provenance must not leave a sidecar');
    }

    fs.writeFileSync(path.join(buildTools, 'apksigner'), `#!/usr/bin/env bash
set -euo pipefail
if [[ "$*" == *"--print-certs"* ]]; then
  printf 'Signer #1 certificate SHA-256 digest: ${signerSha}\\n'
fi
exit 0
`);
    fs.chmodSync(path.join(buildTools, 'apksigner'), 0o755);
    fs.writeFileSync(path.join(buildTools, 'aapt'), `#!/usr/bin/env bash
set -euo pipefail
case "$*" in
  *"dump badging"*) printf "package: name='com.melodix.music.preview' versionCode='123' versionName='${versionName}'\\n" ;;
  *"dump xmltree"*) printf 'android:debuggable=false\\n' ;;
  *"dump --values resources"*) printf '${sourceRef}\\n' ;;
  *) exit 2 ;;
esac
`);
    fs.chmodSync(path.join(buildTools, 'aapt'), 0o755);
    const nonDebuggable = runVerifier(fixture, path.join(tmp, 'non-debuggable.json'));
    assert.notEqual(nonDebuggable.status, 0, 'a non-debuggable APK must be rejected');
    assert.equal(fs.existsSync(path.join(tmp, 'non-debuggable.json')), false);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// M7 regression: this is the check that actually binds the APK to the checkout.
// It is behavioural, not a regex over the script: the packaged bytes differ,
// the manifest is internally coherent, and the verifier must still refuse.
test('a packaged asset that differs from the checkout is rejected even with a coherent manifest', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-m7-'));
  try {
    const fixture = buildFixture(tmp);
    const good = runVerifier(fixture, path.join(tmp, 'good.json'));
    assert.equal(good.status, 0, good.stderr);

    // Rebuild the APK with an injected asset. The manifest digests and byte
    // counts are recomputed from the packaged bytes, so everything the manifest
    // says about itself is true; only the checkout comparison can catch it.
    const checkoutBytes = fs.readFileSync(path.join(fixture.sourceRoot, 'assets', 'melodix_home.js'), 'utf8');
    rebuildApk(fixture, { asset_overrides: { 'assets/melodix_home.js': `${checkoutBytes}// injected payload\n` } });
    const manifest = JSON.parse(fs.readFileSync(path.join(fixture.apkDir, 'assets-manifest.json'), 'utf8'));
    const entry = manifest.assets.find((item) => item.name === 'assets/melodix_home.js');
    const packaged = `${checkoutBytes}// injected payload\n`;
    assert.equal(entry.asset_sha256, require('node:crypto').createHash('sha256').update(packaged).digest('hex'),
      'the manifest must remain self-coherent for this test to be meaningful');
    assert.equal(entry.source_sha256.length, 64, 'the declared source binding is still present and valid');

    const out = path.join(tmp, 'tampered.json');
    const result = runVerifier(fixture, out);
    assert.notEqual(result.status, 0, 'an APK whose asset differs from the checkout must be rejected');
    assert.match(result.stderr, /packaged asset differs from source checkout/);
    assert.equal(fs.existsSync(out), false, 'a rejected APK must not leave provenance');

    // A plain (non-generated) asset must be covered by the same comparison.
    rebuildApk(fixture, { asset_overrides: { 'assets/probe.txt': 'tampered plain asset\n' } });
    const plainOut = path.join(tmp, 'tampered-plain.json');
    const plainResult = runVerifier(fixture, plainOut);
    assert.notEqual(plainResult.status, 0, 'a non-generated asset must also be compared with the checkout');
    assert.match(plainResult.stderr, /packaged asset differs from source checkout/);
    assert.equal(fs.existsSync(plainOut), false);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the manifest can never lower its own verification level', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-level-'));
  try {
    const fixture = buildFixture(tmp);
    const cases = [
      ['omitted-source-binding', { omit_source_for: ['assets/melodix_home.js'] }, /must declare its readable source/],
      ['missing-entry', { drop_entries: ['assets/probe.txt'] }, /missing checkout assets/],
      ['extra-entry', {
        extra_entries: [{ name: 'assets/ghost.js', asset_sha256: 'e'.repeat(64), bytes: 1 }],
      }, /absent from the checkout/],
      ['forged-derivation-header', {
        header_override: {
          'assets/melodix_home.js':
            '/* generated from scripts/melodix_home.source.js; sha256=' + '0'.repeat(64) + '; terser=5.51.2; no-compress,no-mangle */',
        },
      }, /header digest disagrees|packaged asset differs from source checkout/],
    ];
    for (const [label, spec, expected] of cases) {
      rebuildApk(fixture, spec);
      const out = path.join(tmp, `${label}.json`);
      const result = runVerifier(fixture, out);
      assert.notEqual(result.status, 0, `${label} must be rejected`);
      assert.match(result.stderr, expected, `${label} must fail for the documented reason`);
      assert.equal(fs.existsSync(out), false, `${label} must not leave provenance`);
    }

    // SOURCE_ROOT is mandatory: without it the checkout comparison cannot run.
    rebuildApk(fixture, {});
    const out = path.join(tmp, 'no-source-root.json');
    const result = spawnSync('bash', [
      path.join(ROOT, 'scripts/p0_display_verify_apk.sh'),
      fixture.apkDir, fixture.apkName, fixture.sourceRef, '123', fixture.versionName, out,
    ], { encoding: 'utf8', env: { ...process.env, ANDROID_HOME: fixture.sdk, SOURCE_ROOT: '' } });
    assert.notEqual(result.status, 0, 'a missing SOURCE_ROOT must be refused, not silently skipped');
    assert.match(result.stderr, /SOURCE_ROOT/);
    assert.equal(fs.existsSync(out), false);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// Format guards are a different control from value comparison. Every case above
// supplies a *well-formed but wrong* value, so the type/shape validators are never
// reached: deleting HEX64.fullmatch or the bool/float byte-count guard would leave
// the whole suite green. These cases attack the validators themselves, then the
// APK identity controls (package, signature, checksum, artifact name).
test('the APK verifier rejects malformed manifest fields, a wrong package, an unsigned APK and a stale checksum', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-format-'));
  try {
    const fixture = buildFixture(tmp);
    const { apkDir, apkName, buildTools, sourceRef, versionName } = fixture;
    const manifestPath = path.join(apkDir, 'assets-manifest.json');
    const originalManifest = fs.readFileSync(manifestPath, 'utf8');
    const baseManifest = JSON.parse(originalManifest);
    const generatedEntry = (manifest) => manifest.assets.find((item) => item.name === 'assets/melodix_home.js');
    const plainEntry = (manifest) => manifest.assets.find((item) => item.name === 'assets/probe.txt');

    const malformed = [
      ['digest-not-hex', (m) => { m.assets[0].asset_sha256 = 'z'.repeat(64); }, /digest is invalid/],
      ['digest-too-short', (m) => { m.assets[0].asset_sha256 = 'a'.repeat(63); }, /digest is invalid/],
      ['digest-uppercase', (m) => { m.assets[0].asset_sha256 = 'A'.repeat(64); }, /digest is invalid/],
      ['digest-not-a-string', (m) => { m.assets[0].asset_sha256 = 12345; }, /digest is invalid/],
      ['bytes-as-string', (m) => { m.assets[0].bytes = '15'; }, /byte count is invalid/],
      // isinstance(True, int) is true in Python: only an explicit bool guard catches this.
      ['bytes-as-bool', (m) => { m.assets[0].bytes = true; }, /byte count is invalid/],
      ['bytes-negative', (m) => { m.assets[0].bytes = -1; }, /byte count is invalid/],
      ['bytes-fractional', (m) => { m.assets[0].bytes = 15.5; }, /byte count is invalid/],
      ['entry-not-an-object', (m) => { m.assets[0] = 'assets/probe.txt'; }, /entry is not an object/],
      ['source-digest-malformed', (m) => { generatedEntry(m).source_sha256 = 'not-a-digest'; }, /source digest is invalid/],
      ['source-digest-absent', (m) => { delete generatedEntry(m).source_sha256; }, /source provenance is missing|source digest is invalid/],
      // A non-generated asset may declare a source; that path must still be traversal-safe.
      ['source-path-traversal', (m) => {
        const entry = plainEntry(m);
        entry.source = 'scripts/../secret.source.js';
        entry.source_sha256 = 'f'.repeat(64);
      }, /unsafe provenance path/],
      ['source-path-absolute', (m) => {
        const entry = plainEntry(m);
        entry.source = '/etc/passwd';
        entry.source_sha256 = 'f'.repeat(64);
      }, /unsafe provenance path/],
    ];
    for (const [label, mutate, expected] of malformed) {
      const manifest = JSON.parse(JSON.stringify(baseManifest));
      mutate(manifest);
      fs.writeFileSync(manifestPath, JSON.stringify(manifest));
      const out = path.join(tmp, `format-${label}.json`);
      const result = runVerifier(fixture, out);
      assert.notEqual(result.status, 0, `${label} must be rejected`);
      assert.match(result.stderr, expected, `${label} must fail for the documented reason`);
      assert.equal(fs.existsSync(out), false, `${label} must not leave provenance`);
    }
    fs.writeFileSync(manifestPath, originalManifest);

    // A manifest that is not even an object must fail closed, not be coerced.
    fs.writeFileSync(manifestPath, '[]');
    const notObject = runVerifier(fixture, path.join(tmp, 'manifest-array.json'));
    assert.notEqual(notObject.status, 0, 'a non-object manifest must be rejected');
    assert.match(notObject.stderr, /manifest is not an object/);
    fs.writeFileSync(manifestPath, originalManifest);

    const originalAapt = fs.readFileSync(path.join(buildTools, 'aapt'), 'utf8');
    const originalApksigner = fs.readFileSync(path.join(buildTools, 'apksigner'), 'utf8');
    const writeTool = (name, body) => {
      fs.writeFileSync(path.join(buildTools, name), body);
      fs.chmodSync(path.join(buildTools, name), 0o755);
    };

    // A different application must never be accepted as the Preview APK.
    writeTool('aapt', originalAapt.replace('com.melodix.music.preview', 'com.attacker.music'));
    const wrongPackage = runVerifier(fixture, path.join(tmp, 'wrong-package.json'));
    assert.notEqual(wrongPackage.status, 0, 'an unexpected package id must be rejected');
    assert.match(wrongPackage.stderr, /package id mismatch/);
    assert.equal(fs.existsSync(path.join(tmp, 'wrong-package.json')), false);
    writeTool('aapt', originalAapt);

    // An unsigned APK: apksigner verify itself fails.
    writeTool('apksigner', '#!/usr/bin/env bash\necho "DOES NOT VERIFY" >&2\nexit 1\n');
    const unsigned = runVerifier(fixture, path.join(tmp, 'unsigned.json'));
    assert.notEqual(unsigned.status, 0, 'an unsigned APK must be rejected');
    assert.match(unsigned.stderr, /signature verification failed/);
    assert.equal(fs.existsSync(path.join(tmp, 'unsigned.json')), false);
    writeTool('apksigner', originalApksigner);

    // A signer block that verifies but publishes no certificate digest.
    writeTool('apksigner', '#!/usr/bin/env bash\nexit 0\n');
    const noCert = runVerifier(fixture, path.join(tmp, 'no-cert.json'));
    assert.notEqual(noCert.status, 0, 'a missing signer fingerprint must be rejected');
    assert.match(noCert.stderr, /signer fingerprint/);
    writeTool('apksigner', originalApksigner);

    // The APK bytes changed but the published checksum did not: the artifact is
    // not the one that was built, whatever the manifest claims.
    const apkPath = path.join(apkDir, apkName);
    const originalApk = fs.readFileSync(apkPath);
    fs.writeFileSync(apkPath, Buffer.concat([originalApk, Buffer.from('tampered\n')]));
    const stale = runVerifier(fixture, path.join(tmp, 'stale-checksum.json'));
    assert.notEqual(stale.status, 0, 'a stale APK checksum must be rejected');
    assert.match(stale.stderr, /checksum verification failed/);
    assert.equal(fs.existsSync(path.join(tmp, 'stale-checksum.json')), false);
    fs.writeFileSync(apkPath, originalApk);

    // Artifact name and source SHA shapes are validated before any tool runs.
    const badArgs = [
      [[apkDir, 'Melodix-Release.apk', sourceRef, '123', versionName, path.join(tmp, 'bad-name.json')], /unexpected APK artifact name/],
      [[apkDir, apkName, 'a'.repeat(39), '123', `1.2.2-${'a'.repeat(7)}`, path.join(tmp, 'short-sha.json')], /full lowercase commit SHA/],
      [[apkDir, apkName, 'A'.repeat(40), '123', `1.2.2-${'a'.repeat(7)}`, path.join(tmp, 'upper-sha.json')], /full lowercase commit SHA/],
      [[apkDir, apkName, sourceRef, '12x', versionName, path.join(tmp, 'bad-code.json')], /versionCode must be numeric/],
    ];
    for (const [args, expected] of badArgs) {
      const result = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_verify_apk.sh'), ...args], {
        encoding: 'utf8',
        env: { ...process.env, ANDROID_HOME: fixture.sdk, SOURCE_ROOT: fixture.sourceRoot },
      });
      assert.notEqual(result.status, 0, 'malformed APK identity arguments must be rejected');
      assert.match(result.stderr, expected);
      assert.equal(fs.existsSync(args[5]), false, 'no provenance may be written');
    }

    // Everything restored: the untouched fixture must still verify, so the
    // rejections above are caused by the mutations and not by a broken fixture.
    const clean = runVerifier(fixture, path.join(tmp, 'clean.json'));
    assert.equal(clean.status, 0, clean.stderr);
    const report = JSON.parse(fs.readFileSync(path.join(tmp, 'clean.json'), 'utf8'));
    assert.equal(report.assets_verified_count, baseManifest.assets.length);
    assert.equal(report.generated_assets_source_verified_count, 3);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// Differential test for the derivation header: the forged header is written to
// BOTH the checkout and the APK, so the byte-for-byte comparison passes and only
// the header/source binding can catch it. Without this, the header check could
// be deleted and every other test would still pass.
test('a forged derivation header is rejected even when the packaged bytes match the checkout', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-header-'));
  try {
    const fixture = buildFixture(tmp);
    const assetPath = path.join(fixture.sourceRoot, 'assets', 'melodix_home.js');
    const original = fs.readFileSync(assetPath, 'utf8');
    const body = original.split('\n').slice(1).join('\n');
    const forged = `/* generated from scripts/melodix_home.source.js; sha256=${'0'.repeat(64)}; terser=5.51.2; no-compress,no-mangle */\n${body}`;
    fs.writeFileSync(assetPath, forged);
    rebuildApk(fixture, {});

    // Precondition: the packaged asset really does equal the checkout now, and
    // the manifest still declares the true source digest.
    const manifest = JSON.parse(fs.readFileSync(path.join(fixture.apkDir, 'assets-manifest.json'), 'utf8'));
    const entry = manifest.assets.find((item) => item.name === 'assets/melodix_home.js');
    const realSource = fs.readFileSync(path.join(fixture.sourceRoot, 'scripts', 'melodix_home.source.js'));
    assert.equal(entry.source_sha256, require('node:crypto').createHash('sha256').update(realSource).digest('hex'));
    assert.equal(entry.asset_sha256, require('node:crypto').createHash('sha256').update(forged).digest('hex'));

    const out = path.join(tmp, 'forged-header.json');
    const result = runVerifier(fixture, out);
    assert.notEqual(result.status, 0, 'a forged derivation header must be rejected');
    assert.match(result.stderr, /header digest disagrees with the manifest/,
      'the header check itself must fire, not the byte comparison');
    assert.equal(fs.existsSync(out), false);

    // A generated asset with no derivation header at all must also be refused.
    fs.writeFileSync(assetPath, body);
    rebuildApk(fixture, {});
    const noHeaderOut = path.join(tmp, 'no-header.json');
    const noHeader = runVerifier(fixture, noHeaderOut);
    assert.notEqual(noHeader.status, 0, 'a generated asset without a derivation header must be rejected');
    assert.match(noHeader.stderr, /has no derivation header/);
    assert.equal(fs.existsSync(noHeaderOut), false);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the boot diagnostic keeps only allowlisted categories, never raw emulator output', () => {
  const boot = read('scripts/p0_display_boot_avd.sh');
  const marker = "<<'PY' || true\n";
  const start = boot.indexOf(marker);
  const end = boot.indexOf('\nPY\n', start);
  assert.ok(start >= 0 && end > start, 'the sanitized boot diagnostic writer must exist');
  const writer = boot.slice(start + marker.length, end);
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-bootdiag-'));
  try {
    const log = path.join(tmp, 'emulator.log');
    fs.writeFileSync(log, [
      'emulator: ERROR: /dev/kvm permission denied',
      'host=secret-runner.internal user=ci-admin',
      'Authorization: Bearer SUPER_SECRET_TOKEN',
      'cookie=sessionid=SECRET_SESSION',
      'https://accounts.spotify.com/login?token=SECRET',
      'swiftshader indirect enabled',
    ].join('\n'));
    const out = path.join(tmp, 'boot-diagnostic.json');
    const result = spawnSync('python3', ['-', log, out, 'emulator_exited_before_boot_completed', 'phone', 'false'], {
      encoding: 'utf8', input: writer,
    });
    assert.equal(result.status, 0, result.stderr);
    const text = fs.readFileSync(out, 'utf8');
    for (const secret of ['SECRET', 'Bearer', 'sessionid', 'accounts.spotify.com', 'secret-runner', 'ci-admin']) {
      assert.equal(text.includes(secret), false, `the boot diagnostic must not retain ${secret}`);
    }
    const parsed = JSON.parse(text);
    assert.equal(parsed.raw_log_retained, false);
    assert.equal(parsed.failure_reason_category, 'emulator_exited_before_boot_completed');
    assert.equal(parsed.boot_completed, false);
    assert.ok(parsed.diagnostic_markers.includes('kvm_permission'));
    assert.ok(parsed.diagnostic_markers.includes('gpu'));
    assert.equal(typeof parsed.emulator_log_line_count, 'number');
    assert.deepEqual(Object.keys(parsed).sort(), [
      'boot_completed', 'diagnostic_markers', 'emulator_log_byte_count', 'emulator_log_line_count',
      'emulator_log_present', 'failure_reason_category', 'profile', 'raw_log_retained', 'schema_version',
    ]);

    // An attacker-controlled reason slug must not smuggle text into the report.
    const injected = path.join(tmp, 'injected.json');
    const bad = spawnSync('python3', ['-', log, injected, 'SECRET_TOKEN_LEAK', 'phone', 'false'], {
      encoding: 'utf8', input: writer,
    });
    assert.equal(bad.status, 0, bad.stderr);
    assert.equal(JSON.parse(fs.readFileSync(injected, 'utf8')).failure_reason_category, 'unspecified');
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the stop script kills only its own emulator and never a neighbouring one', () => {
  const stop = read('scripts/p0_display_stop_avd.sh');
  assert.doesNotMatch(stop, /pkill|killall/, 'cleanup must never use a blanket process kill');
  assert.match(stop, /\/proc\/\$pid\/cmdline/);
  assert.match(stop, /"-avd \$avd_name"/);

  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-stop-'));
  const pids = [];
  try {
    const spawnFake = (avd) => {
      const started = spawnSync('bash', ['-c', `exec -a 'emulator -avd ${avd}' sleep 300 >/dev/null 2>&1 & echo $!`], { encoding: 'utf8' });
      assert.equal(started.status, 0, started.stderr);
      const pid = Number(started.stdout.trim());
      assert.ok(Number.isInteger(pid) && pid > 1);
      pids.push(pid);
      return pid;
    };
    const ours = spawnFake('MelodixDisplayPhone');
    const neighbour = spawnFake('MelodixDisplayTablet');

    fs.writeFileSync(path.join(tmp, 'emulator.pid'), `${ours}\n`);
    fs.writeFileSync(path.join(tmp, 'emulator.avd'), 'MelodixDisplayPhone\n');
    const result = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_stop_avd.sh'), tmp], { encoding: 'utf8' });
    assert.equal(result.status, 0, result.stderr);

    const alive = (pid) => { try { process.kill(pid, 0); return true; } catch { return false; } };
    assert.equal(alive(ours), false, 'the recorded emulator must be stopped');
    assert.equal(alive(neighbour), true, 'a neighbouring emulator must never be signalled');
  } finally {
    for (const pid of pids) { try { process.kill(pid, 'SIGKILL'); } catch { /* already gone */ } }
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the stop script refuses a recycled PID that no longer belongs to the AVD', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-recycled-'));
  let pid = null;
  try {
    const started = spawnSync('bash', ['-c', 'exec -a "totally-unrelated-worker" sleep 300 >/dev/null 2>&1 & echo $!'], { encoding: 'utf8' });
    pid = Number(started.stdout.trim());
    fs.writeFileSync(path.join(tmp, 'emulator.pid'), `${pid}\n`);
    fs.writeFileSync(path.join(tmp, 'emulator.avd'), 'MelodixDisplayPhone\n');
    const result = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_stop_avd.sh'), tmp], { encoding: 'utf8' });
    assert.equal(result.status, 0, result.stderr);
    assert.match(result.stdout + result.stderr, /no longer belongs to this AVD/);
    let alive = true;
    try { process.kill(pid, 0); } catch { alive = false; }
    assert.equal(alive, true, 'an unrelated process must never be killed');
  } finally {
    if (pid) { try { process.kill(pid, 'SIGKILL'); } catch { /* already gone */ } }
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the instrumentation status filter discards unallowlisted raw output and requires the exact success contract', () => {
  const runner = read('scripts/p0_display_run_profile.sh');
  const start = runner.indexOf('cat >"$tmp/status-filter.py" <<\'PY\'\n');
  const end = runner.indexOf('\nPY\n', start);
  assert.ok(start >= 0 && end > start);
  const filter = runner.slice(start + 'cat >"$tmp/status-filter.py" <<\'PY\'\n'.length, end);
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-filter-'));
  try {
    const filterPath = path.join(tmp, 'filter.py');
    const outPath = path.join(tmp, 'safe.json');
    fs.writeFileSync(filterPath, filter);
    const raw = [
      'INSTRUMENTATION_STATUS: cookie=SECRET_COOKIE',
      'INSTRUMENTATION_STATUS: url=https://private.invalid/path?token=SECRET',
      'INSTRUMENTATION_STATUS: overall=passed',
      'INSTRUMENTATION_STATUS: profile=phone',
      'INSTRUMENTATION_STATUS: display_ownership_report_saved=true',
      'INSTRUMENTATION_STATUS: authenticated_home_test_performed=false',
      'INSTRUMENTATION_STATUS_CODE: 1',
      'INSTRUMENTATION_CODE: -1',
      'raw logcat line with Bearer SECRET_TOKEN',
    ].join('\n');
    const ok = spawnSync('python3', [filterPath, outPath, 'phone'], { encoding: 'utf8', input: raw });
    assert.equal(ok.status, 0, ok.stderr);
    const safe = fs.readFileSync(outPath, 'utf8');
    assert.equal(safe.includes('SECRET'), false);
    assert.equal(safe.includes('https://'), false);
    assert.equal(safe.includes('Bearer'), false);
    const parsed = JSON.parse(safe);
    assert.deepEqual(parsed.statuses, {
      overall: 'passed',
      profile: 'phone',
      display_ownership_report_saved: 'true',
      authenticated_home_test_performed: 'false',
    });
    assert.equal(parsed.result_code, -1);

    const missing = spawnSync('python3', [filterPath, path.join(tmp, 'missing.json'), 'phone'], {
      encoding: 'utf8',
      input: 'INSTRUMENTATION_STATUS: overall=passed\nINSTRUMENTATION_CODE: -1\n',
    });
    assert.notEqual(missing.status, 0, 'missing required success statuses must fail closed');
    const wrongProfile = spawnSync('python3', [filterPath, path.join(tmp, 'wrong-profile.json'), 'tablet'], {
      encoding: 'utf8',
      input: raw,
    });
    assert.notEqual(wrongProfile.status, 0, 'a phone status stream must not satisfy the tablet profile');
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the profile runner keeps only allowlisted statuses, validates the sidecar, and checks emulator liveness', () => {
  const runner = read('scripts/p0_display_run_profile.sh');
  assert.match(runner, /set -euo pipefail/);
  assert.match(runner, /timeout --signal=TERM --kill-after=10s "\$\{instrument_budget\}s"/);
  assert.match(runner, /-e mode display-ownership/);
  assert.match(runner, /INSTRUMENTATION_STATUS: /);
  assert.match(runner, /allowed = \{/);
  assert.match(runner, /display_ownership_report_saved/);
  assert.match(runner, /authenticated_home_test_performed/);
  assert.match(runner, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-display-ownership\.json/);
  assert.match(runner, /module\._validate_profile/);
  assert.match(runner, /mv "\$tmp\/sidecar\.json" "\$state_dir\/display-ownership-\$profile\.json"/);
  assert.doesNotMatch(runner, /adb logcat|screencap|uiautomator|cat "\$tmp\/install|cat "\$tmp\/safe-status/);
  // Liveness before, during and after the instrumentation.
  assert.match(runner, /P0_DISPLAY_AVD_STATE_DIR:\?/);
  assert.match(runner, /emulator_alive \|\| die "the recorded emulator process is not alive before instrumentation"/);
  assert.match(runner, /while :; do[\s\S]*?kill -0 "\$emulator_pid"[\s\S]*?emulator-died/);
  assert.match(runner, /the emulator process died during instrumentation/);
  assert.match(runner, /emulator_alive \|\| die "the recorded emulator process died after instrumentation"/);
  // The global capture deadline caps the instrumentation budget.
  assert.match(runner, /capture-deadline_epoch/);
  assert.match(runner, /the global capture deadline has already expired/);
  // Failure detail is surfaced from the allowlisted statuses only.
  assert.match(runner, /failure_phase=\{phase\}; failure_type=\{kind\}/);
});

// The AVD diagnostics are the second export surface, next to the sidecars. The
// boot writer reduces the emulator log to allowlisted category names and counts,
// so no log content can reach the artifact by construction. This proves it with
// the full canary set, in the log AND in the parameters the writer copies through.
test('the AVD boot diagnostic survives every privacy canary in the log and in its parameters', () => {
  const boot = read('scripts/p0_display_boot_avd.sh');
  const marker = "<<'PY' || true\n";
  const start = boot.indexOf(marker);
  const end = boot.indexOf('\nPY\n', start);
  assert.ok(start >= 0 && end > start, 'the sanitized boot diagnostic writer must exist');
  const writer = boot.slice(start + marker.length, end);

  const canaries = [
    'access_token=CANARY01', 'refresh_token=CANARY02', 'Authorization: Bearer CANARY03',
    'set-cookie: sp_dc=CANARY04', 'CANARY05@example.com',
    'https://accounts.spotify.com/authorize?state=CANARY06', 'spotify:track:CANARY07',
    '/home/CANARY08/Melodix/notes.txt',
    '/data/data/com.melodix.music.preview/shared_prefs/CANARY09.xml',
    '/storage/emulated/0/Download/CANARY10.mp3', 'spotify:user:CANARY11',
    'CANARY12 Bohemian Rhapsody Remastered', 'password=CANARY13', 'client_secret=CANARY14',
    `CANARY15${'x'.repeat(56)}`,
  ];
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-bootcanary-'));
  try {
    const log = path.join(tmp, 'emulator.log');
    // Mix the canaries with real failure markers so the categoriser still works:
    // a writer that simply dropped everything would pass a weaker test.
    fs.writeFileSync(log, `${[
      'emulator: ERROR: /dev/kvm permission denied',
      'swiftshader indirect enabled',
      ...canaries,
    ].join('\n')}\n`);

    const out = path.join(tmp, 'boot-diagnostic.json');
    const result = spawnSync('python3', ['-', log, out, 'emulator_exited_before_boot_completed', 'phone', 'false'], {
      encoding: 'utf8', input: writer,
    });
    assert.equal(result.status, 0, result.stderr);
    const text = fs.readFileSync(out, 'utf8');
    assert.equal(text.includes('CANARY'), false, 'no canary may reach the boot diagnostic');
    assert.equal(`${result.stdout}${result.stderr}`.includes('CANARY'), false,
      'no canary may reach the CI log either');
    const parsed = JSON.parse(text);
    assert.equal(parsed.raw_log_retained, false);
    assert.ok(parsed.diagnostic_markers.includes('kvm_permission'), 'real failures must still be categorised');
    assert.ok(parsed.diagnostic_markers.includes('gpu'), 'real failures must still be categorised');
    assert.equal(parsed.emulator_log_line_count, canaries.length + 2);

    // Parameters are copied into the artifact, so they are an injection surface
    // of their own. Neither may carry free text.
    for (const [reason, profile] of [[`CANARY${'y'.repeat(60)}`, 'phone'], ['boot_ok', 'CANARY16-profile']]) {
      const injectedOut = path.join(tmp, `injected-${profile.slice(0, 8)}.json`);
      const injected = spawnSync('python3', ['-', log, injectedOut, reason, profile, 'false'], {
        encoding: 'utf8', input: writer,
      });
      assert.equal(injected.status, 0, injected.stderr);
      const injectedText = fs.readFileSync(injectedOut, 'utf8');
      assert.equal(injectedText.includes('CANARY'), false,
        'a canary in reason/profile must be normalised, not exported');
      const injectedParsed = JSON.parse(injectedText);
      assert.ok(['unspecified', 'boot_ok'].includes(injectedParsed.failure_reason_category));
      assert.ok(['phone', 'tablet', 'unknown'].includes(injectedParsed.profile));
    }
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// ---------------------------------------------------------------------------
// AVD lifecycle, exercised behaviourally.
//
// The assertions above about liveness and deadlines are textual: they prove the
// controls are written, not that they fire. These cases run the real runner
// against a fake `adb` and a real live process standing in for the emulator, and
// assert on the exit code, the error category and the absence of a sidecar.
// ---------------------------------------------------------------------------

const { spawn } = require('node:child_process');

function sidecarFor(profile, sourceRef, runId, apkSha256) {
  const isTablet = profile === 'tablet';
  const targets = { '200ms': 200, '1s': 1000, '3s': 3000, '8s': 8000, '20s': 20000 };
  const checkpoints = {};
  for (const [label, target] of Object.entries(targets)) {
    checkpoints[label] = {
      target_elapsed_ms: target,
      observed_elapsed_ms: target + 20,
      native_root_visible: true,
      webview_container_visible: true,
      native_root_bounds_px: [0, 0, 1080, 2000],
      webview_container_bounds_px: [0, 0, 1080, 2000],
      display_owner: 'native',
      route_category: 'home',
      native_owner_verified: true,
      webview_mounted_under_native_root: true,
      center_surface_owner: 'native_shell',
      splash_transient: false,
      web_center_category: 'unavailable',
      web_center_takeover_state: 'not_observed',
      web_center_probe_elapsed_ms: target + 30,
    };
  }
  return {
    schema_version: 2,
    profile,
    source_commit: sourceRef,
    run_id: runId,
    apk_sha256: apkSha256,
    authenticated_spotify_test: 'not_performed',
    session_state: 'unauthenticated',
    timeline_origin: 'app_launch',
    device: {
      physical_width_px: isTablet ? 1600 : 1080,
      physical_height_px: isTablet ? 2560 : 2400,
      density_dpi: isTablet ? 320 : 420,
      width_dp: isTablet ? 800 : 411,
      height_dp: isTablet ? 1280 : 914,
      smallest_screen_width_dp: isTablet ? 800 : 411,
      orientation: 'portrait',
    },
    webview_viewport: {
      inner_width_css_px: isTablet ? 800 : 411,
      inner_height_css_px: isTablet ? 1200 : 800,
      screen_width_css_px: isTablet ? 800 : 411,
      screen_height_css_px: isTablet ? 1280 : 914,
      device_pixel_ratio: isTablet ? 2 : 2.625,
    },
    sf_config_gui_mode: 'csshack',
    body_class_flags: { melodix: true, mobile: true },
    checkpoints,
    owner_transitions: [],
  };
}

// A fake adb whose behaviour is driven by a mode file, plus a real process whose
// PID is recorded as the emulator. Nothing here touches a real device.
function runnerFixture(tmp, options = {}) {
  const profile = options.profile || 'phone';
  const sourceRef = 'a'.repeat(40);
  const runId = '41796437131';
  const apkSha256 = 'b'.repeat(64);
  const bin = path.join(tmp, 'bin');
  const avdState = path.join(tmp, 'avd-state');
  const outState = path.join(tmp, 'out-state');
  for (const dir of [bin, avdState, outState]) fs.mkdirSync(dir, { recursive: true });

  const apk = path.join(tmp, 'target.apk');
  const testApk = path.join(tmp, 'harness.apk');
  fs.writeFileSync(apk, 'not-a-real-apk-but-non-empty\n');
  fs.writeFileSync(testApk, 'not-a-real-apk-but-non-empty\n');
  const sidecarPath = path.join(tmp, 'sidecar.json');
  // 'empty' means a genuinely 0-byte transfer, which is a different control from
  // a structurally invalid JSON document: only the former reaches the -s test.
  fs.writeFileSync(sidecarPath, options.sidecar === 'empty' ? '' : JSON.stringify(
    options.sidecar === null ? {} : sidecarFor(profile, sourceRef, runId, apkSha256)));

  // Double-fork through setsid so the stand-in emulator is reparented to init.
  // A direct child of this test process would linger as a zombie after SIGKILL,
  // and kill -0 succeeds on a zombie: the liveness checks would look alive and
  // the failure paths could never be exercised.
  const spawned = spawnSync('bash', ['-c', 'setsid sleep 120 >/dev/null 2>&1 & echo $!'],
    { encoding: 'utf8' });
  assert.equal(spawned.status, 0, spawned.stderr);
  const emulator = { pid: Number(spawned.stdout.trim()) };
  assert.ok(Number.isInteger(emulator.pid) && emulator.pid > 1, 'a live stand-in PID is required');
  fs.writeFileSync(path.join(avdState, 'emulator.pid'), String(emulator.pid));
  if (options.deadline !== null) {
    fs.writeFileSync(path.join(avdState, 'capture-deadline_epoch'),
      String(options.deadline === undefined ? Math.floor(Date.now() / 1000) + 1200 : options.deadline));
  }

  const mode = options.mode || 'ok';
  fs.writeFileSync(path.join(bin, 'adb'), `#!/usr/bin/env bash
mode='${mode}'
pid='${emulator.pid}'
case "$1" in
  get-state)
    [[ "$mode" == adb-lost ]] && exit 1
    echo device ;;
  install)
    [[ "$mode" == install-fails ]] && exit 1
    echo Success ;;
  exec-out)
    cat '${sidecarPath}' ;;
  shell)
    shift
    case "$1" in
      pm)
        case "$2" in
          clear) exit 0 ;;
          grant) exit 0 ;;
        esac ;;
      dumpsys)
        echo '      android.permission.BLUETOOTH_CONNECT: granted=true' ;;
      run-as)
        exit 0 ;;
      am)
        case "$mode" in
          dies-during)
            # The emulator disappears mid-instrumentation: the watchdog must
            # notice and fail the run instead of waiting for the full timeout.
            kill -9 "$pid" 2>/dev/null || true
            sleep 8
            exit 0 ;;
          wrong-result-code)
            # Every allowlisted status is correct; only the final result code is
            # wrong. This is the only case that reaches the result_code contract.
            echo 'INSTRUMENTATION_STATUS: overall=passed'
            echo 'INSTRUMENTATION_STATUS: profile=${profile}'
            echo 'INSTRUMENTATION_STATUS: display_ownership_report_saved=true'
            echo 'INSTRUMENTATION_STATUS: authenticated_home_test_performed=false'
            echo 'INSTRUMENTATION_CODE: 0'
            exit 0 ;;
          instrumentation-failed)
            echo 'INSTRUMENTATION_STATUS: overall=failed'
            echo 'INSTRUMENTATION_STATUS: profile=${profile}'
            echo 'INSTRUMENTATION_STATUS: display_ownership_report_saved=false'
            echo 'INSTRUMENTATION_STATUS: failure_phase=await_webview'
            echo 'INSTRUMENTATION_STATUS: failure_type=TimeoutException'
            echo 'INSTRUMENTATION_STATUS: cookie=SECRET_CANARY'
            echo 'INSTRUMENTATION_CODE: 0'
            exit 0 ;;
        esac
        echo 'INSTRUMENTATION_STATUS: overall=passed'
        echo 'INSTRUMENTATION_STATUS: profile=${profile}'
        echo 'INSTRUMENTATION_STATUS: display_ownership_report_saved=true'
        echo 'INSTRUMENTATION_STATUS: authenticated_home_test_performed=false'
        echo 'INSTRUMENTATION_STATUS: authorization=Bearer SECRET_CANARY'
        echo 'INSTRUMENTATION_CODE: -1'
        exit 0 ;;
    esac ;;
esac
exit 0
`);
  fs.chmodSync(path.join(bin, 'adb'), 0o755);
  return { profile, sourceRef, runId, apkSha256, bin, avdState, outState, apk, testApk, emulator };
}

function runProfile(fixture, env = {}) {
  return spawnSync('bash', [
    path.join(ROOT, 'scripts/p0_display_run_profile.sh'),
    fixture.profile, fixture.apk, fixture.testApk, fixture.sourceRef,
    fixture.runId, fixture.apkSha256, fixture.outState,
  ], {
    encoding: 'utf8',
    timeout: 120000,
    env: {
      ...process.env,
      PATH: `${fixture.bin}:${process.env.PATH}`,
      P0_DISPLAY_AVD_STATE_DIR: fixture.avdState,
      ...env,
    },
  });
}

test('the profile runner fails closed on every AVD lifecycle failure and never leaves a partial sidecar', () => {
  const cases = [
    ['dead-emulator', {}, /not alive before instrumentation/, 'kill-before'],
    ['adb-lost', { mode: 'adb-lost' }, /no Android device is connected/],
    ['install-fails', { mode: 'install-fails' }, /target APK installation failed/],
    ['deadline-expired', { deadline: Math.floor(Date.now() / 1000) - 10 }, /global capture deadline has already expired/],
    ['deadline-invalid', { deadline: 'not-a-number' }, /recorded capture deadline is invalid/],
    ['instrumentation-failed', { mode: 'instrumentation-failed' }, /did not emit the required allowlisted success statuses/],
    ['invalid-sidecar', { sidecar: null }, /does not match the exact sidecar schema|unreadable/],
    ['empty-sidecar', { sidecar: 'empty' }, /sidecar is empty/],
    ['wrong-result-code', { mode: 'wrong-result-code' }, /did not emit the required allowlisted success statuses/],
  ];
  for (const [label, options, expected, action] of cases) {
    const tmp = fs.mkdtempSync(path.join(os.tmpdir(), `melodix-avd-${label}-`));
    let fixture;
    try {
      fixture = runnerFixture(tmp, options);
      if (action === 'kill-before') {
        try { process.kill(fixture.emulator.pid, 'SIGKILL'); } catch { /* already gone */ }
        // init reaps the orphan; wait until kill -0 really fails.
        const reaped = spawnSync('bash',
          ['-c', `for i in $(seq 1 100); do kill -0 ${fixture.emulator.pid} 2>/dev/null || exit 0; sleep 0.1; done; exit 1`],
          { timeout: 20000 });
        assert.equal(reaped.status, 0, 'the stand-in emulator must be gone before the runner starts');
      }
      if (label === 'deadline-invalid') {
        fs.writeFileSync(path.join(fixture.avdState, 'capture-deadline_epoch'), 'not-a-number');
      }
      const result = runProfile(fixture);
      assert.notEqual(result.status, 0, `${label} must fail`);
      assert.match(result.stderr, expected, `${label} must fail for the documented reason`);
      assert.equal(
        fs.existsSync(path.join(fixture.outState, `display-ownership-${fixture.profile}.json`)), false,
        `${label} must not leave a sidecar`);
      assert.equal(`${result.stdout}${result.stderr}`.includes('SECRET_CANARY'), false,
        `${label} must never echo raw instrumentation payloads`);
    } finally {
      if (fixture) { try { process.kill(fixture.emulator.pid, 'SIGKILL'); } catch { /* gone */ } }
      fs.rmSync(tmp, { recursive: true, force: true });
    }
  }
});

test('the profile runner refuses a missing or invalid recorded emulator identity', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-avd-identity-'));
  let fixture;
  try {
    fixture = runnerFixture(tmp, {});
    const pidFile = path.join(fixture.avdState, 'emulator.pid');
    const original = fs.readFileSync(pidFile, 'utf8');
    for (const [label, value, expected] of [
      ['absent', '', /recorded emulator PID is missing/],
      ['pid-one', '1', /recorded emulator PID is invalid/],
      ['not-numeric', 'abc', /recorded emulator PID is invalid/],
      ['negative', '-5', /recorded emulator PID is invalid/],
    ]) {
      if (value === '') fs.rmSync(pidFile); else fs.writeFileSync(pidFile, value);
      const result = runProfile(fixture);
      assert.notEqual(result.status, 0, `${label} must fail`);
      assert.match(result.stderr, expected, `${label} must fail for the documented reason`);
      assert.equal(fs.existsSync(path.join(fixture.outState, 'display-ownership-phone.json')), false);
      fs.writeFileSync(pidFile, original);
    }
    // Missing state directory is refused before anything is installed.
    const missing = runProfile(fixture, { P0_DISPLAY_AVD_STATE_DIR: path.join(tmp, 'nope') });
    assert.notEqual(missing.status, 0);
    assert.match(missing.stderr, /AVD state directory is missing/);
  } finally {
    if (fixture) { try { process.kill(fixture.emulator.pid, 'SIGKILL'); } catch { /* gone */ } }
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

test('the profile runner watchdog fails the run when the emulator dies mid-instrumentation', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-avd-watchdog-'));
  let fixture;
  try {
    fixture = runnerFixture(tmp, { mode: 'dies-during' });
    const started = Date.now();
    const result = runProfile(fixture);
    const elapsed = Date.now() - started;
    assert.notEqual(result.status, 0, 'a dead emulator must fail the capture');
    assert.match(result.stderr, /the emulator process died during instrumentation/);
    assert.equal(fs.existsSync(path.join(fixture.outState, 'display-ownership-phone.json')), false);
    // The watchdog polls every 2 s; it must not wait for the 180 s budget.
    assert.ok(elapsed < 60000, `the watchdog must fail fast, took ${elapsed} ms`);
  } finally {
    if (fixture) { try { process.kill(fixture.emulator.pid, 'SIGKILL'); } catch { /* gone */ } }
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// Positive control: with a live emulator, a reachable adb and a valid sidecar the
// same runner succeeds. Without this, every rejection above could be explained by
// a broken fixture rather than by the control under test.
test('the profile runner succeeds on a healthy lifecycle and keeps only the validated sidecar', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-avd-ok-'));
  let fixture;
  try {
    fixture = runnerFixture(tmp, {});
    const result = runProfile(fixture);
    assert.equal(result.status, 0, result.stderr);
    const written = path.join(fixture.outState, 'display-ownership-phone.json');
    assert.equal(fs.existsSync(written), true, 'a healthy run must produce the sidecar');
    const parsed = JSON.parse(fs.readFileSync(written, 'utf8'));
    assert.equal(parsed.profile, 'phone');
    assert.equal(parsed.apk_sha256, fixture.apkSha256);
    assert.equal(Object.keys(parsed.checkpoints).length, 5);
    assert.equal(`${result.stdout}${result.stderr}`.includes('SECRET_CANARY'), false,
      'even a successful run must discard unallowlisted instrumentation payloads');
    assert.deepEqual(fs.readdirSync(fixture.outState), ['display-ownership-phone.json'],
      'no unexpected file may be left in the artifact directory');
  } finally {
    if (fixture) { try { process.kill(fixture.emulator.pid, 'SIGKILL'); } catch { /* gone */ } }
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// The stop script must distinguish four states that `kill -0` alone cannot:
// a live process, a zombie, a recycled PID, and an absent PID. A zombie still
// answers kill -0 but has an empty /proc/<pid>/cmdline, so the identity check
// must refuse to signal it rather than assume it is still our emulator.
test('the stop script refuses a zombie and validates the recorded identity before signalling', () => {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-stopzombie-'));
  let parent = null;
  try {
    // A parent that never reaps: its exited child stays a zombie, which is the
    // only way to observe the zombie state deterministically. The PID is passed
    // through a file so no asynchronous stream reading is needed.
    const pidFile = path.join(tmp, 'zombie.pid');
    const code = [
      'import os, sys, time',
      'pid = os.fork()',
      'if pid == 0:',
      '    os._exit(0)',
      'open(sys.argv[1], "w").write(str(pid))',
      'time.sleep(45)',
    ].join('\n');
    parent = spawn('python3', ['-c', code, pidFile], { detached: true, stdio: 'ignore' });
    parent.unref();

    let zpid = null;
    for (let attempt = 0; attempt < 100 && zpid === null; attempt += 1) {
      if (fs.existsSync(pidFile)) {
        const raw = fs.readFileSync(pidFile, 'utf8').trim();
        if (/^[0-9]+$/.test(raw)) zpid = Number(raw);
      }
      if (zpid === null) spawnSync('bash', ['-c', 'sleep 0.05']);
    }
    assert.ok(zpid && zpid > 1, 'the fixture must produce a zombie PID');

    const stat = fs.readFileSync(`/proc/${zpid}/stat`, 'utf8');
    assert.match(stat.split(') ')[1], /^Z/, 'the fixture must really be a zombie');
    assert.equal(fs.readFileSync(`/proc/${zpid}/cmdline`).length, 0, 'a zombie has an empty cmdline');

    const state = path.join(tmp, 'avd');
    fs.mkdirSync(state, { recursive: true });
    fs.writeFileSync(path.join(state, 'emulator.pid'), `${zpid}\n`);
    fs.writeFileSync(path.join(state, 'emulator.avd'), 'MelodixDisplayPhone\n');
    const result = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_stop_avd.sh'), state], { encoding: 'utf8' });
    const output = `${result.stdout}${result.stderr}`;
    assert.equal(result.status, 0, result.stderr);
    assert.match(output, /no longer belongs to this AVD; no signal sent/,
      'a zombie must not be signalled: its identity cannot be confirmed');
    assert.match(output, /runner teardown will reclaim it/,
      'the script must report honestly that the PID is still present');

    // Identity validation happens before any signal, for every malformed record.
    const recorded = path.join(state, 'emulator.pid');
    for (const [label, value, expected] of [
      ['absent', null, /recorded emulator PID is missing/],
      ['not-numeric', 'abc', /recorded emulator PID is invalid/],
      ['negative', '-3', /recorded emulator PID is invalid/],
      ['pid-one', '1', /refusing to signal PID 1/],
    ]) {
      if (value === null) fs.rmSync(recorded, { force: true });
      else fs.writeFileSync(recorded, value);
      const refused = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_stop_avd.sh'), state], { encoding: 'utf8' });
      assert.notEqual(refused.status, 0, `${label} must be refused`);
      assert.match(`${refused.stdout}${refused.stderr}`, expected, `${label} must fail for the documented reason`);
    }

    // A missing state directory is refused outright.
    const missing = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_stop_avd.sh'), path.join(tmp, 'nope')],
      { encoding: 'utf8' });
    assert.notEqual(missing.status, 0);
    assert.match(`${missing.stdout}${missing.stderr}`, /AVD state directory is missing/);

    // An unrelated process whose command line merely MENTIONS the AVD name must
    // not be killed. Matching "-avd <name>" alone is not enough: the command line
    // must also be an emulator. This is what the *emulator* guard is for, and
    // without this case that guard could be deleted unnoticed.
    const impostor = spawnSync('bash',
      ['-c', "exec -a 'batch-worker -avd MelodixDisplayPhone' sleep 300 >/dev/null 2>&1 & echo $!"],
      { encoding: 'utf8' });
    const impostorPid = Number(impostor.stdout.trim());
    assert.ok(Number.isInteger(impostorPid) && impostorPid > 1, 'an impostor PID is required');
    try {
      fs.writeFileSync(recorded, `${impostorPid}\n`);
      const refused = spawnSync('bash', [path.join(ROOT, 'scripts/p0_display_stop_avd.sh'), state], { encoding: 'utf8' });
      assert.equal(refused.status, 0, refused.stderr);
      assert.match(`${refused.stdout}${refused.stderr}`, /no longer belongs to this AVD; no signal sent/,
        'a non-emulator mentioning the AVD name must not be signalled');
      let alive = true;
      try { process.kill(impostorPid, 0); } catch { alive = false; }
      assert.equal(alive, true, 'the impostor process must still be alive');
    } finally {
      try { process.kill(impostorPid, 'SIGKILL'); } catch { /* gone */ }
    }
  } finally {
    if (parent && parent.pid) { try { process.kill(-parent.pid, 'SIGKILL'); } catch { try { parent.kill('SIGKILL'); } catch { /* gone */ } } }
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// ---------------------------------------------------------------------------
// Regression: the tooling artifact must publish the exact flat names the
// capture job reads. upload-artifact@v4 roots an artifact at the LEAST COMMON
// ANCESTOR of its search paths, so uploading the harness and the provenance
// from two different build directories silently published them under
// melodix-display-harness/ and melodix-display-provenance/. Both capture jobs
// then failed at "Re-verify the exact APK and harness before installing
// anything" because melodix-display-tooling/provenance.json did not exist.
// This test computes the published layout instead of matching a string.
// ---------------------------------------------------------------------------
function toolingUploadPaths(workflow) {
  const prepare = jobBlock(workflow, 'prepare-display-comparison');
  const step = prepare.slice(prepare.indexOf('- name: Upload the verified harness and provenance'));
  const block = step.slice(0, step.indexOf('\n      - name:') >= 0 ? step.indexOf('\n      - name:') : undefined);
  assert.match(block, /uses: actions\/upload-artifact@/);
  assert.match(block, /name: melodix-display-tooling-/);
  const multi = block.match(/\n\s+path: \|\n([\s\S]*?)\n\s+[a-z-]+:/);
  if (multi) {
    return multi[1].split('\n').map((l) => l.trim()).filter(Boolean);
  }
  const single = block.match(/\n\s+path: (.+)/);
  assert.ok(single, 'the tooling upload must declare a path');
  return [single[1].trim()];
}

// Model upload-artifact@v4: one directory input publishes its contents at the
// artifact root; several inputs are rooted at their least common ancestor.
function publishedNames(paths, stagedFiles) {
  const norm = paths.map((p) => p.replace(/\$\{\{\s*runner\.temp\s*\}\}/g, '/runner-temp'));
  const isDirectory = (p) => !path.posix.basename(p).includes('.');
  if (norm.length === 1 && isDirectory(norm[0])) {
    return stagedFiles.slice().sort();
  }
  const parents = norm.map((p) => (isDirectory(p) ? p : path.posix.dirname(p)));
  const split = parents.map((p) => p.split('/').filter(Boolean));
  const common = [];
  for (let i = 0; i < split[0].length; i += 1) {
    const part = split[0][i];
    if (split.every((s) => s[i] === part)) common.push(part);
    else break;
  }
  const root = `/${common.join('/')}`;
  return norm.map((p) => path.posix.relative(root, p)).sort();
}

test('the tooling artifact publishes the flat names every capture consumer reads', () => {
  const workflow = read('.github/workflows/p0-display-ownership.yml');
  const prepare = jobBlock(workflow, 'prepare-display-comparison');
  const capture = jobBlock(workflow, 'capture-display-profile');

  // What the prepare job actually stages into the uploaded directory.
  const staged = [...prepare.matchAll(/\$stage\/([A-Za-z0-9._-]+)"/g)].map((m) => m[1]);
  const stagedFiles = [...new Set(staged)].filter((n) => n.includes('.'));
  assert.ok(stagedFiles.length >= 2, 'prepare must stage both the harness and the provenance');

  // What the capture job actually reads out of the download directory.
  const consumed = [...new Set(
    [...capture.matchAll(/melodix-display-tooling\/([A-Za-z0-9._-]+)/g)].map((m) => m[1]),
  )];
  assert.ok(consumed.includes('provenance.json'), 'capture must read the prepared provenance');
  assert.ok(consumed.includes('melodix-display-harness.apk'), 'capture must read the prepared harness');

  const published = publishedNames(toolingUploadPaths(workflow), stagedFiles);
  for (const name of consumed) {
    assert.ok(published.includes(name),
      `capture reads melodix-display-tooling/${name} but the artifact publishes [${published.join(', ')}]`);
  }

  // Discriminance: the historical two-directory layout must NOT satisfy the
  // same consumers. Without this the assertion above could pass vacuously.
  const broken = publishedNames([
    '${{ runner.temp }}/melodix-display-harness/melodix-display-harness.apk',
    '${{ runner.temp }}/melodix-display-provenance/provenance.json',
  ], stagedFiles);
  assert.ok(!broken.includes('provenance.json'),
    'the two-directory layout must be recognised as broken by this model');
  assert.ok(broken.includes('melodix-display-provenance/provenance.json'));
});

// The measurement channel is the only readable export when artifacts cannot be
// downloaded. It must stay a closed vocabulary: these canaries prove a URL, a
// token, an over-long integer or an out-of-range bit can never be surfaced.
test('the per-checkpoint measurement channel accepts measurements and rejects every privacy canary', () => {
  const runner = read('scripts/p0_display_run_profile.sh');
  const marker = 'cat >"$tmp/status-filter.py" <<\'PY\'\n';
  const start = runner.indexOf(marker);
  const end = runner.indexOf('\nPY\n', start);
  assert.ok(start >= 0 && end > start);
  const filter = runner.slice(start + marker.length, end);
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-measure-'));
  try {
    const filterPath = path.join(tmp, 'filter.py');
    fs.writeFileSync(filterPath, filter);
    const base = [
      'INSTRUMENTATION_STATUS: overall=passed',
      'INSTRUMENTATION_STATUS: profile=phone',
      'INSTRUMENTATION_STATUS: display_ownership_report_saved=true',
      'INSTRUMENTATION_STATUS: authenticated_home_test_performed=false',
      'INSTRUMENTATION_STATUS_CODE: 1',
      'INSTRUMENTATION_CODE: -1',
    ];
    const run = (extra) => {
      const out = path.join(tmp, `out-${Math.random().toString(36).slice(2)}.json`);
      const proc = spawnSync('python3', [filterPath, out, 'phone'],
        { encoding: 'utf8', input: `${base.concat(extra).join('\n')}\n` });
      assert.equal(proc.status, 0, proc.stderr);
      return { text: fs.readFileSync(out, 'utf8'), statuses: JSON.parse(fs.readFileSync(out, 'utf8')).statuses };
    };

    const valid = run(['INSTRUMENTATION_STATUS: m200ms=native;native_shell;not_observed;214;1;1']);
    assert.equal(valid.statuses.m200ms, 'native;native_shell;not_observed;214;1;1');

    const canaries = [
      'INSTRUMENTATION_STATUS: m200ms=native;native_shell;not_observed;214;1;1;token=SECRET_TOKEN',
      'INSTRUMENTATION_STATUS: m200ms=https://private.invalid/?t=SECRET;web;observed;1;1;1',
      'INSTRUMENTATION_STATUS: m200ms=native;native_shell;not_observed;99999999;1;1',
      'INSTRUMENTATION_STATUS: m200ms=SECRET;native_shell;not_observed;214;1;1',
      'INSTRUMENTATION_STATUS: m200ms=native;native_shell;SECRET_STATE;214;1;1',
      'INSTRUMENTATION_STATUS: m1s=native;native_shell;not_observed;214;1;2',
      'INSTRUMENTATION_STATUS: m1s=native;native_shell;not_observed;-5;1;1',
    ];
    for (const canary of canaries) {
      const result = run([canary]);
      const key = canary.slice('INSTRUMENTATION_STATUS: '.length).split('=')[0];
      assert.equal(result.text.includes('SECRET'), false, `a canary must never be retained: ${canary}`);
      assert.equal(result.text.includes('https://'), false);
      assert.equal(Object.prototype.hasOwnProperty.call(result.statuses, key), false,
        `an out-of-vocabulary measurement must be discarded: ${canary}`);
    }

    // The publisher must read only the allowlisted statuses, and must run even
    // when the capture failed, otherwise a failed run yields no timeline.
    assert.match(runner, /report_measurements\(\) \{/);
    assert.match(runner, /report_measurements "\$profile"\n\[\[ ! -e "\$tmp\/emulator-died" \]\]/);
    assert.match(runner, /title=P0 display measurement::/);
    assert.match(runner, /=not_measured/);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});

// Recording an honest "nothing was observable" checkpoint instead of aborting
// must not buy a pass. This executes the real aggregator on the exact field
// values the harness writes for an unresumed activity.
test('an unresumed launch checkpoint is recorded honestly and still fails the aggregator closed', () => {
  const harness = read('tests/android/HomeRenderInstrumentation.java');
  const start = harness.indexOf('private JSONObject unresumedDisplayOwnershipCheckpoint(');
  assert.ok(start >= 0, 'the harness must define the unresumed checkpoint builder');
  const end = harness.indexOf('\n    }\n', start);
  const body = harness.slice(start, end);

  // Build the checkpoint from the harness source itself so the fixture cannot
  // drift away from what the instrumentation actually writes.
  const target = 200;
  const checkpoint = {};
  const puts = body.matchAll(/checkpoint\.put\("([a-z_]+)", ([^;]+)\);/g);
  for (const [, key, raw] of puts) {
    const value = raw.trim();
    if (value === 'false') checkpoint[key] = false;
    else if (value === 'true') checkpoint[key] = true;
    else if (value === 'JSONObject.NULL') checkpoint[key] = null;
    else if (value === 'target') checkpoint[key] = target;
    else if (value === 'SystemClock.elapsedRealtime() - launchStart') checkpoint[key] = target + 1200;
    else if (/^"[a-z_]+"$/.test(value)) checkpoint[key] = value.slice(1, -1);
    else throw new Error(`unexpected unresumed checkpoint value: ${key}=${value}`);
  }
  // Fields added by completeDisplayOwnershipWebCenter for an unknown centre.
  checkpoint.web_center_category = 'unavailable';
  checkpoint.web_center_takeover_state = 'undetermined';
  checkpoint.web_center_probe_elapsed_ms = target + 1200;
  assert.equal(checkpoint.display_owner, 'unknown');
  assert.equal(checkpoint.center_surface_owner, 'unknown');
  assert.equal(checkpoint.native_owner_verified, false);

  const sourceRef = 'a'.repeat(40);
  const runId = '41883130651';
  const apkSha256 = 'b'.repeat(64);
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-unresumed-'));
  try {
    const aggregate = (mutate) => {
      const paths = {};
      for (const profile of ['phone', 'tablet']) {
        const sidecar = sidecarFor(profile, sourceRef, runId, apkSha256);
        if (mutate) {
          sidecar.checkpoints['200ms'] = { ...checkpoint };
          // The 200 ms sample consumed its 1200 ms wait, so the 1 s checkpoint
          // is necessarily observed after it. Observations stay monotonic.
          sidecar.checkpoints['1s'].observed_elapsed_ms = 1450;
          sidecar.checkpoints['1s'].web_center_probe_elapsed_ms = 1460;
        }
        const file = path.join(tmp, `${profile}-${mutate ? 'unresumed' : 'native'}.json`);
        fs.writeFileSync(file, JSON.stringify(sidecar));
        paths[profile] = file;
      }
      const output = path.join(tmp, `report-${mutate ? 'unresumed' : 'native'}.json`);
      const proc = spawnSync('python3', [
        path.join(ROOT, 'scripts/aggregate_p0_display_ownership.py'),
        '--source-ref', sourceRef, '--run-id', runId, '--apk-sha256', apkSha256,
        '--phone-report', paths.phone, '--tablet-report', paths.tablet, '--output', output,
      ], { encoding: 'utf8' });
      assert.equal(proc.status, 0, `the aggregator must run: ${proc.stderr}`);
      return JSON.parse(fs.readFileSync(output, 'utf8')).comparison;
    };

    // Control: a fully native timeline satisfies the gate, so the test can fail.
    const control = aggregate(false);
    assert.equal(control.p0_display_ownership_satisfied, true);

    const unresumed = aggregate(true);
    assert.equal(unresumed.p0_display_ownership_satisfied, false,
      'an unobservable launch checkpoint must never satisfy the P0 gate');
    assert.equal(unresumed.p0_resolution_claimed, false);
    for (const profile of ['phone', 'tablet']) {
      assert.deepEqual(unresumed[profile].undetermined_checkpoints, ['200ms']);
      assert.equal(unresumed[profile].all_checkpoints_determinate, false);
      assert.equal(unresumed[profile].launch_checkpoint_web_center_takeover_state, 'undetermined');
      // The four settled measurements are preserved: that is the whole point of
      // recording the absence instead of aborting the timeline.
      assert.equal(unresumed[profile].native_owner_observed_at_all_checkpoints, true);
    }
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
});
