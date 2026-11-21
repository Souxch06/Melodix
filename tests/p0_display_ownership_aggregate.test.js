'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const { spawnSync } = require('node:child_process');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const SCRIPT = path.join(ROOT, 'scripts/aggregate_p0_display_ownership.py');
const SOURCE_REF = 'a'.repeat(40);
const RUN_ID = '41796437131';
const APK_SHA256 = 'b'.repeat(64);
const CHECKPOINTS = ['200ms', '1s', '3s', '8s', '20s'];
const SETTLED = ['1s', '3s', '8s', '20s'];
const TARGET_MS = { '200ms': 200, '1s': 1000, '3s': 3000, '8s': 8000, '20s': 20000 };

function checkpoint(label, overrides = {}) {
  return {
    target_elapsed_ms: TARGET_MS[label],
    observed_elapsed_ms: TARGET_MS[label] + 20,
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
    web_center_probe_elapsed_ms: TARGET_MS[label] + 30,
    ...overrides,
  };
}

// The normal cold-launch state at 200 ms: the splash still owns the centre, so
// the native owner is not verified yet, but Spotify Web provably does not own
// the centre. This must NOT defeat the criterion.
function splashCheckpoint(overrides = {}) {
  return checkpoint('200ms', {
    native_root_visible: false,
    native_root_bounds_px: null,
    display_owner: 'unknown',
    native_owner_verified: false,
    center_surface_owner: 'splash',
    splash_transient: true,
    web_center_category: 'unavailable',
    web_center_takeover_state: 'not_observed',
    ...overrides,
  });
}

function profileReport(profile, overrides = {}) {
  const isTablet = profile === 'tablet';
  const checkpoints = {};
  for (const label of CHECKPOINTS) checkpoints[label] = checkpoint(label);
  return {
    schema_version: 2,
    profile,
    source_commit: SOURCE_REF,
    run_id: RUN_ID,
    apk_sha256: APK_SHA256,
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
    ...overrides,
  };
}

function writeReport(directory, name, value) {
  const file = path.join(directory, name);
  fs.writeFileSync(file, JSON.stringify(value));
  return file;
}

function runAggregator(directory, phonePath, tabletPath, output, opts = {}) {
  return spawnSync('python3', [
    SCRIPT,
    '--source-ref', opts.sourceRef || SOURCE_REF,
    '--run-id', opts.runId || RUN_ID,
    '--apk-sha256', opts.apkSha256 || APK_SHA256,
    '--phone-report', phonePath,
    '--tablet-report', tabletPath,
    '--output', output,
  ], { cwd: ROOT, encoding: 'utf8' });
}

test('display-ownership aggregation combines both profiles and keeps the P0 unclaimed', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-'));
  try {
    const phonePath = writeReport(directory, 'phone.json', profileReport('phone'));
    const tabletPath = writeReport(directory, 'tablet.json', profileReport('tablet'));
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, phonePath, tabletPath, outputPath);
    assert.equal(result.status, 0, result.stderr);
    const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
    assert.equal(combined.apk_sha256, APK_SHA256);
    assert.equal(combined.source_commit, SOURCE_REF);
    assert.equal(combined.authenticated_spotify_test, 'not_performed');
    assert.equal(combined.session_state, 'unauthenticated');
    assert.equal(combined.profiles.phone.profile, 'phone');
    assert.equal(combined.profiles.tablet.profile, 'tablet');
    assert.equal(combined.comparison.same_apk_sha256, true);
    assert.equal(combined.comparison.five_launch_checkpoints_per_profile, true);
    assert.equal(combined.comparison.phone.native_owner_observed_at_all_checkpoints, true);
    assert.equal(combined.comparison.tablet.native_owner_observed_at_all_checkpoints, true);
    assert.equal(combined.comparison.p0_display_ownership_satisfied, true);
    assert.equal(combined.comparison.p0_resolution_claimed, false,
      'a validated comparison is evidence, never an automatic P0 resolution claim');
    assert.deepEqual(combined.comparison.native_owner_required_checkpoints, SETTLED,
      'native ownership is required at the four settled checkpoints, not during the launch transition');
    assert.equal(combined.comparison.phone.all_checkpoints_determinate, true);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('a phone Web center takeover is surfaced and defeats the ownership criterion', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-takeover-'));
  try {
    const phone = profileReport('phone');
    phone.checkpoints['8s'] = checkpoint('8s', {
      display_owner: 'web',
      native_owner_verified: false,
      center_surface_owner: 'web',
      splash_transient: false,
      web_center_category: 'spotify_web',
      web_center_takeover_state: 'observed',
    });
    const phonePath = writeReport(directory, 'phone.json', phone);
    const tabletPath = writeReport(directory, 'tablet.json', profileReport('tablet'));
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, phonePath, tabletPath, outputPath);
    assert.equal(result.status, 0, result.stderr);
    const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
    assert.equal(combined.comparison.phone.web_takeover_observed, true);
    assert.equal(combined.comparison.phone.native_owner_observed_at_all_checkpoints, false);
    assert.equal(combined.comparison.p0_display_ownership_satisfied, false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('a normal splash transition at 200 ms does not defeat the ownership criterion', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-splash-'));
  try {
    const phone = profileReport('phone');
    const tablet = profileReport('tablet');
    phone.checkpoints['200ms'] = splashCheckpoint();
    tablet.checkpoints['200ms'] = splashCheckpoint();
    const phonePath = writeReport(directory, 'phone.json', phone);
    const tabletPath = writeReport(directory, 'tablet.json', tablet);
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, phonePath, tabletPath, outputPath);
    assert.equal(result.status, 0, result.stderr);
    const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
    assert.equal(combined.comparison.phone.launch_checkpoint_splash_transient, true);
    assert.equal(combined.comparison.phone.launch_checkpoint_center_surface, 'splash');
    assert.equal(combined.comparison.phone.launch_checkpoint_web_center_takeover_state, 'not_observed');
    assert.equal(combined.comparison.phone.web_takeover_observed, false);
    assert.equal(combined.comparison.p0_display_ownership_satisfied, true,
      'the splash transition is a normal boot state, not a Spotify Web takeover');
    assert.equal(combined.comparison.p0_resolution_claimed, false);
    // The timeline must still start at the real launch, never after the splash.
    assert.equal(combined.profiles.phone.checkpoints['200ms'].target_elapsed_ms, 200);
    assert.equal(combined.profiles.phone.timeline_origin, 'app_launch');
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('Spotify Web owning the centre at 200 ms is a takeover even during boot', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-launch-takeover-'));
  try {
    const phone = profileReport('phone');
    phone.checkpoints['200ms'] = checkpoint('200ms', {
      display_owner: 'web',
      native_owner_verified: false,
      native_root_visible: false,
      native_root_bounds_px: null,
      center_surface_owner: 'web',
      splash_transient: false,
      web_center_category: 'spotify_web',
      web_center_takeover_state: 'observed',
    });
    const phonePath = writeReport(directory, 'phone.json', phone);
    const tabletPath = writeReport(directory, 'tablet.json', profileReport('tablet'));
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, phonePath, tabletPath, outputPath);
    assert.equal(result.status, 0, result.stderr);
    const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
    assert.equal(combined.comparison.phone.launch_checkpoint_web_center_takeover_state, 'observed');
    assert.equal(combined.comparison.phone.web_takeover_observed, true);
    assert.equal(combined.comparison.p0_display_ownership_satisfied, false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('an undetermined centre at any checkpoint can never yield success', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-undetermined-'));
  try {
    for (const label of CHECKPOINTS) {
      const phone = profileReport('phone');
      // The WebView owns the centre but its DOM could not be classified: this is
      // absence of data, and must never be read as absence of takeover.
      phone.checkpoints[label] = checkpoint(label, {
        display_owner: 'web',
        native_owner_verified: false,
        center_surface_owner: 'web',
        splash_transient: false,
        web_center_category: 'unavailable',
        web_center_takeover_state: 'undetermined',
      });
      const phonePath = writeReport(directory, `phone-${label}.json`, phone);
      const tabletPath = writeReport(directory, `tablet-${label}.json`, profileReport('tablet'));
      const outputPath = path.join(directory, `combined-${label}.json`);
      const result = runAggregator(directory, phonePath, tabletPath, outputPath);
      assert.equal(result.status, 0, result.stderr);
      const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
      assert.deepEqual(combined.comparison.phone.undetermined_checkpoints, [label]);
      assert.equal(combined.comparison.phone.all_checkpoints_determinate, false);
      assert.equal(combined.comparison.p0_display_ownership_satisfied, false,
        `an undetermined ${label} must defeat the criterion, not silently pass`);
    }
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

// The decisive case for "no success from absence of data": at 200 ms native
// ownership is not required and no Web takeover was positively observed, so the
// ONLY thing standing between this report and a false success is the
// determinacy requirement. Deleting that clause must fail this test.
test('an unattributable centre at 200 ms cannot yield success even with no observed takeover', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-unknown-launch-'));
  try {
    const phone = profileReport('phone');
    const tablet = profileReport('tablet');
    const unknownLaunch = checkpoint('200ms', {
      display_owner: 'unknown',
      native_root_visible: false,
      native_root_bounds_px: null,
      native_owner_verified: false,
      center_surface_owner: 'unknown',
      splash_transient: false,
      web_center_category: 'unavailable',
      web_center_takeover_state: 'undetermined',
    });
    phone.checkpoints['200ms'] = unknownLaunch;
    tablet.checkpoints['200ms'] = unknownLaunch;
    const phonePath = writeReport(directory, 'phone.json', phone);
    const tabletPath = writeReport(directory, 'tablet.json', tablet);
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, phonePath, tabletPath, outputPath);
    assert.equal(result.status, 0, result.stderr);
    const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
    // Nothing was positively observed as a takeover, and every settled
    // checkpoint has a verified native owner...
    assert.equal(combined.comparison.phone.web_takeover_observed, false);
    assert.equal(combined.comparison.phone.native_owner_observed_at_all_checkpoints, true);
    assert.equal(combined.comparison.tablet.native_owner_observed_at_all_checkpoints, true);
    // ...yet the launch checkpoint is unattributable, so this must NOT pass.
    assert.deepEqual(combined.comparison.phone.undetermined_checkpoints, ['200ms']);
    assert.equal(combined.comparison.phone.all_checkpoints_determinate, false);
    assert.equal(combined.comparison.p0_display_ownership_satisfied, false,
      'absence of data must never be turned into a satisfied criterion');
    assert.equal(combined.comparison.p0_resolution_claimed, false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('the native owner is still required at all four settled checkpoints', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-settled-'));
  try {
    for (const label of SETTLED) {
      const phone = profileReport('phone');
      phone.checkpoints['200ms'] = splashCheckpoint();
      phone.checkpoints[label] = checkpoint(label, { native_owner_verified: false });
      const phonePath = writeReport(directory, `phone-${label}.json`, phone);
      const tabletPath = writeReport(directory, `tablet-${label}.json`, profileReport('tablet'));
      const outputPath = path.join(directory, `combined-${label}.json`);
      const result = runAggregator(directory, phonePath, tabletPath, outputPath);
      assert.equal(result.status, 0, result.stderr);
      const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
      assert.equal(combined.comparison.phone.native_owner_observed_at_all_checkpoints, false,
        `an unverified native owner at ${label} must defeat the criterion`);
      assert.equal(combined.comparison.p0_display_ownership_satisfied, false);
    }
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('self-inconsistent centre measurements are rejected, not trusted', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-inconsistent-'));
  try {
    const cases = [
      // Claims "no takeover" while the DOM says Spotify Web owns the centre.
      checkpoint('1s', { center_surface_owner: 'web', web_center_category: 'spotify_web',
        web_center_takeover_state: 'not_observed', display_owner: 'web', native_owner_verified: false }),
      // Claims a takeover while the native shell owns the centre.
      checkpoint('1s', { web_center_takeover_state: 'observed' }),
      // Splash flag contradicting the measured surface.
      checkpoint('1s', { splash_transient: true }),
      // Native owner "verified" while the WebView owns the centre.
      checkpoint('1s', { center_surface_owner: 'web', web_center_category: 'spotify_web',
        web_center_takeover_state: 'observed', native_owner_verified: true }),
      // Unknown surface cannot produce a determinate answer.
      checkpoint('1s', { center_surface_owner: 'unknown', web_center_takeover_state: 'not_observed' }),
      // Enum escape attempts.
      checkpoint('1s', { center_surface_owner: 'probably_native' }),
      checkpoint('1s', { web_center_category: 'spotify-main' }),
      checkpoint('1s', { web_center_takeover_state: 'probably_not' }),
      // Probe completion outside the launch-relative window.
      checkpoint('1s', { web_center_probe_elapsed_ms: 9000 }),
      checkpoint('1s', { web_center_probe_elapsed_ms: 10 }),
    ];
    for (const [index, invalid] of cases.entries()) {
      const phone = profileReport('phone');
      phone.checkpoints['1s'] = invalid;
      const phonePath = writeReport(directory, `phone-${index}.json`, phone);
      const tabletPath = writeReport(directory, `tablet-${index}.json`, profileReport('tablet'));
      const outputPath = path.join(directory, `combined-${index}.json`);
      const result = runAggregator(directory, phonePath, tabletPath, outputPath);
      assert.notEqual(result.status, 0, `inconsistent case ${index} must be rejected`);
      assert.equal(fs.existsSync(outputPath), false, `inconsistent case ${index} must not leave a report`);
    }
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('the schema-v1 sidecar is rejected rather than silently reinterpreted', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-v1-'));
  try {
    const phone = profileReport('phone', { schema_version: 1 });
    const phonePath = writeReport(directory, 'phone.json', phone);
    const tabletPath = writeReport(directory, 'tablet.json', profileReport('tablet'));
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, phonePath, tabletPath, outputPath);
    assert.notEqual(result.status, 0, 'a v1 sidecar must not be accepted by the v2 aggregator');
    assert.equal(fs.existsSync(outputPath), false);

    // Dropping one of the new centre fields must fail closed too.
    const stripped = profileReport('phone');
    delete stripped.checkpoints['200ms'].web_center_takeover_state;
    const strippedPath = writeReport(directory, 'phone-stripped.json', stripped);
    const strippedOutput = path.join(directory, 'combined-stripped.json');
    const strippedResult = runAggregator(directory, strippedPath, tabletPath, strippedOutput);
    assert.notEqual(strippedResult.status, 0, 'a missing centre field must fail closed');
    assert.equal(fs.existsSync(strippedOutput), false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('display-ownership aggregation fails closed on provenance, schema, profile, and privacy violations', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-invalid-'));
  try {
    const validPhone = profileReport('phone');
    const validTablet = profileReport('tablet');
    const cases = [
      { ...validPhone, source_commit: 'c'.repeat(40) },
      { ...validPhone, run_id: '99999999999' },
      { ...validPhone, apk_sha256: 'd'.repeat(64) },
      { ...validPhone, unexpected_raw_hierarchy: '<node text="private"/>' },
      { ...validPhone, authenticated_spotify_test: 'performed' },
      { ...validPhone, session_state: 'authenticated' },
      { ...validPhone, timeline_origin: 'post_stabilization' },
      { ...validPhone, profile: 'tablet' },
      { ...validPhone, device: { ...validPhone.device, smallest_screen_width_dp: 800 } },
      { ...validPhone, sf_config_gui_mode: 'injected-mode' },
      { ...validPhone, body_class_flags: { melodix: true, mobile: true, spotify: true } },
    ];
    for (const [index, invalid] of cases.entries()) {
      const phonePath = writeReport(directory, `phone-${index}.json`, invalid);
      const tabletPath = writeReport(directory, `tablet-${index}.json`, validTablet);
      const outputPath = path.join(directory, `combined-${index}.json`);
      const result = runAggregator(directory, phonePath, tabletPath, outputPath);
      assert.notEqual(result.status, 0, `case ${index} should be rejected`);
      assert.equal(fs.existsSync(outputPath), false, `case ${index} must not leave a report`);
    }

    // Missing a checkpoint must fail closed.
    const missingCheckpoint = profileReport('phone');
    delete missingCheckpoint.checkpoints['20s'];
    const missingPath = writeReport(directory, 'phone-missing.json', missingCheckpoint);
    const tabletPath = writeReport(directory, 'tablet-ok.json', validTablet);
    const missingOutput = path.join(directory, 'combined-missing.json');
    const missingResult = runAggregator(directory, missingPath, tabletPath, missingOutput);
    assert.notEqual(missingResult.status, 0, 'a missing checkpoint must be rejected');
    assert.equal(fs.existsSync(missingOutput), false);

    // A tablet profile reported with phone metrics must fail closed.
    const wrongTablet = profileReport('tablet');
    wrongTablet.device.smallest_screen_width_dp = 411;
    const wrongTabletPath = writeReport(directory, 'tablet-wrong.json', wrongTablet);
    const phonePath = writeReport(directory, 'phone-ok.json', validPhone);
    const wrongOutput = path.join(directory, 'combined-wrong-tablet.json');
    const wrongResult = runAggregator(directory, phonePath, wrongTabletPath, wrongOutput);
    assert.notEqual(wrongResult.status, 0, 'a tablet with phone smallestScreenWidthDp must be rejected');
    assert.equal(fs.existsSync(wrongOutput), false);

    // A credential-like value anywhere must fail the privacy scan.
    const leaky = profileReport('phone');
    leaky.owner_transitions = [{ elapsed_ms: 100, from_owner: 'native', to_owner: 'web', route_category: 'home' }];
    leaky.sf_config_gui_mode = 'csshack';
    const leakyPath = writeReport(directory, 'phone-leaky.json', { ...leaky, session_state: 'unauthenticated', cookie: 'secret' });
    const leakyOutput = path.join(directory, 'combined-leaky.json');
    const leakyResult = runAggregator(directory, leakyPath, tabletPath, leakyOutput);
    assert.notEqual(leakyResult.status, 0, 'an unexpected credential field must be rejected');
    assert.equal(fs.existsSync(leakyOutput), false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('a non-monotonic or late checkpoint observation is rejected as not launch-relative', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-timing-'));
  try {
    const late = profileReport('phone');
    late.checkpoints['1s'] = checkpoint('1s', { observed_elapsed_ms: 9000 });
    const latePath = writeReport(directory, 'phone-late.json', late);
    const tabletPath = writeReport(directory, 'tablet.json', profileReport('tablet'));
    const lateOutput = path.join(directory, 'combined-late.json');
    const lateResult = runAggregator(directory, latePath, tabletPath, lateOutput);
    assert.notEqual(lateResult.status, 0, 'a checkpoint far beyond its target must be rejected');
    assert.equal(fs.existsSync(lateOutput), false);

    const nonMonotonic = profileReport('phone');
    nonMonotonic.checkpoints['3s'] = checkpoint('3s', { observed_elapsed_ms: 500 });
    const nonMonoPath = writeReport(directory, 'phone-nonmono.json', nonMonotonic);
    const nonMonoOutput = path.join(directory, 'combined-nonmono.json');
    const nonMonoResult = runAggregator(directory, nonMonoPath, tabletPath, nonMonoOutput);
    assert.notEqual(nonMonoResult.status, 0, 'non-monotonic observations must be rejected');
    assert.equal(fs.existsSync(nonMonoOutput), false);

    // The 200 ms checkpoint must stay at 200 ms: the timeline is never rebased
    // onto "after the splash disappeared".
    const rebased = profileReport('phone');
    rebased.checkpoints['200ms'] = splashCheckpoint({ target_elapsed_ms: 200, observed_elapsed_ms: 2600 });
    const rebasedPath = writeReport(directory, 'phone-rebased.json', rebased);
    const rebasedOutput = path.join(directory, 'combined-rebased.json');
    const rebasedResult = runAggregator(directory, rebasedPath, tabletPath, rebasedOutput);
    assert.notEqual(rebasedResult.status, 0, 'a 200 ms sample taken at 2.6 s is not launch-relative');
    assert.equal(fs.existsSync(rebasedOutput), false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

// Privacy canaries. The sidecar schema is a strict allowlist and every field is
// typed or enumerated, so an injected canary must be refused by the schema gate
// before it can ever be copied into the combined artifact. These cases prove
// that end to end at four different injection depths, and prove the canary never
// reaches stdout, stderr or the output file: a rejection that echoes the secret
// would still leak it into the CI log.
const PRIVACY_CANARIES = [
  ['access-token', 'access_token=CANARY01'],
  ['refresh-token', 'refresh_token=CANARY02'],
  ['bearer-header', 'Authorization: Bearer CANARY03'],
  ['cookie', 'set-cookie: sp_dc=CANARY04'],
  ['email', 'CANARY05@example.com'],
  ['private-uri', 'https://accounts.spotify.com/authorize?state=CANARY06'],
  ['spotify-uri', 'spotify:track:CANARY07'],
  ['user-path', '/home/CANARY08/Melodix/notes.txt'],
  ['app-private-path', '/data/data/com.melodix.music.preview/shared_prefs/CANARY09.xml'],
  ['external-path', '/storage/emulated/0/Download/CANARY10.mp3'],
  ['account-id', 'spotify:user:CANARY11'],
  ['music-title', 'CANARY12 Bohemian Rhapsody Remastered'],
  ['password', 'password=CANARY13'],
  ['client-secret', 'client_secret=CANARY14'],
  ['opaque-blob', `CANARY15${'x'.repeat(56)}`],
];

test('privacy canaries injected at four depths are refused and never echoed anywhere', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-canary-'));
  try {
    const tabletPath = writeReport(directory, 'tablet.json', profileReport('tablet'));
    let checked = 0;
    for (const [label, canary] of PRIVACY_CANARIES) {
      const injections = [
        // Unexpected top-level field: the allowlist must refuse it outright.
        ['top-level', () => profileReport('phone', { canary_field: canary })],
        // Unexpected nested field inside an otherwise valid object.
        ['device', () => {
          const report = profileReport('phone');
          report.device.canary_field = canary;
          return report;
        }],
        // Unexpected field inside a checkpoint, the densest part of the sidecar.
        ['checkpoint', () => {
          const report = profileReport('phone');
          report.checkpoints['200ms'].canary_field = canary;
          return report;
        }],
        // Canary smuggled into an allowed field that happens to be enumerated.
        ['enum-value', () => profileReport('phone', { session_state: canary })],
      ];
      for (const [depth, build] of injections) {
        const phonePath = writeReport(directory, `phone-${label}-${depth}.json`, build());
        const output = path.join(directory, `out-${label}-${depth}.json`);
        const result = runAggregator(directory, phonePath, tabletPath, output);
        const tag = `${label}/${depth}`;
        assert.notEqual(result.status, 0, `${tag} must be refused`);
        assert.equal(fs.existsSync(output), false, `${tag} must not produce a combined artifact`);
        const echoed = `${result.stdout}\n${result.stderr}`;
        assert.equal(echoed.includes('CANARY'), false,
          `${tag} must not echo the canary into the CI log: ${echoed.slice(0, 300)}`);
        checked += 1;
      }
    }
    assert.equal(checked, PRIVACY_CANARIES.length * 4);

    // Control: the same reports without any canary still aggregate, so the
    // refusals above come from the canary and not from a broken fixture.
    const cleanPhone = writeReport(directory, 'phone-clean.json', profileReport('phone'));
    const cleanOut = path.join(directory, 'clean.json');
    const clean = runAggregator(directory, cleanPhone, tabletPath, cleanOut);
    assert.equal(clean.status, 0, clean.stderr);
    assert.equal(fs.readFileSync(cleanOut, 'utf8').includes('CANARY'), false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

// Defence in depth: the pattern scan sits behind the allowlist. This exercises it
// directly so it cannot rot into dead code, and it records honestly which of the
// 15 categories the pattern layer itself recognises. Categories it does not
// recognise are still unreachable because the schema gate refuses every field
// that could carry them; that division of responsibility is documented, not
// papered over with a broader regex that could redact legitimate evidence.
test('the privacy pattern layer recognises credential, URI, path, query, email and opaque canaries', () => {
  const probe = `
import importlib.util, json, sys
spec = importlib.util.spec_from_file_location("agg", sys.argv[1])
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
out = {}
for label, canary in json.loads(sys.argv[2]):
    try:
        mod._privacy_scan({"note": canary})
        out[label] = None
    except ValueError as exc:
        out[label] = str(exc)
print(json.dumps(out))
`;
  const result = spawnSync('python3', ['-c', probe, SCRIPT, JSON.stringify(PRIVACY_CANARIES)], {
    cwd: ROOT, encoding: 'utf8',
  });
  assert.equal(result.status, 0, result.stderr);
  const verdicts = JSON.parse(result.stdout);
  const recognised = Object.entries(verdicts).filter(([, hit]) => hit !== null).map(([label]) => label);
  const missed = Object.entries(verdicts).filter(([, hit]) => hit === null).map(([label]) => label);

  for (const label of ['access-token', 'refresh-token', 'bearer-header', 'cookie', 'email',
    'private-uri', 'spotify-uri', 'app-private-path', 'external-path', 'account-id',
    'password', 'client-secret', 'opaque-blob']) {
    assert.ok(recognised.includes(label), `the pattern layer must recognise ${label}`);
  }
  // A bare user path and a plain song title carry no credential syntax. They are
  // refused by the allowlist, not by this scan; assert that boundary explicitly
  // so a future widening of the schema is forced to revisit it.
  assert.deepEqual(missed.sort(), ['music-title', 'user-path']);
  for (const hit of Object.values(verdicts)) {
    if (hit !== null) assert.equal(hit.includes('CANARY'), false, 'the scan must name categories, not values');
  }
});
