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
    ...overrides,
  };
}

function profileReport(profile, overrides = {}) {
  const isTablet = profile === 'tablet';
  const checkpoints = {};
  for (const label of CHECKPOINTS) checkpoints[label] = checkpoint(label);
  return {
    schema_version: 1,
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
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('a phone Web center takeover is surfaced and defeats the ownership criterion', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-display-takeover-'));
  try {
    const phone = profileReport('phone');
    phone.checkpoints['8s'] = checkpoint('8s', { display_owner: 'web', native_owner_verified: false });
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
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});
