'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const { spawnSync } = require('node:child_process');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const SCRIPT = path.join(ROOT, 'scripts/aggregate_p0_verify_replay.py');
const SOURCE_REF = 'ec6ef63f9d6638a70bb8e7877d7b798598c250a2';
const RUN_ID = '0123456789abcdef';
const APK_SHA256 = 'ce756a4beead4d0bb3128b339034d70fafab620ac89a189e5042d484f8348375';

function report(overrides = {}) {
  return {
    schema_version: 1,
    source_commit: SOURCE_REF,
    run_id: RUN_ID,
    androidruntime_verify_error_seen: true,
    verify_error_detected: true,
    target_class: 'com.melodix.music.MainActivity',
    target_method: 'markNativeSettingsPayloadApplied',
    target_method_signature: '(Ljava/lang/String;)V',
    method_references: [{
      class: 'com.melodix.music.MainActivity',
      method: 'markNativeSettingsPayloadApplied',
      signature: '(Ljava/lang/String;)V',
    }],
    instruction_offset: 35,
    failure_kind: 'register-type-mismatch',
    register: 'v3',
    actual_type: 'Reference: java.lang.String',
    expected_type: 'Reference: java.lang.StringBuilder',
    technical_message: 'VerifyError diagnostic: register v3 has actual type Reference: java.lang.String but expected type Reference: java.lang.StringBuilder; instruction offset 0x23.',
    message_status: 'structured-message-available',
    ...overrides,
  };
}

function writeReport(directory, name, value) {
  const file = path.join(directory, name);
  fs.writeFileSync(file, JSON.stringify(value));
  return file;
}

function runAggregator(directory, initialReport, relaunchReport, output, apkSha256 = APK_SHA256) {
  return spawnSync('python3', [
    SCRIPT,
    '--source-ref', SOURCE_REF,
    '--run-id', RUN_ID,
    '--artifact-run-id', '41653545783',
    '--artifact-name', 'Melodix-Preview-v1.2.2-test96-instrumentation.apk',
    '--apk-sha256', apkSha256,
    '--initial-report', initialReport,
    '--relaunch-report', relaunchReport,
    '--initial-start-status', '0',
    '--relaunch-start-status', '0',
    '--bluetooth-connect-granted', 'true',
    '--output', output,
  ], { cwd: ROOT, encoding: 'utf8' });
}

test('P0 replay aggregation preserves both isolated launch phases and exact APK provenance', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-p0-replay-'));
  try {
    const initialPath = writeReport(directory, 'initial.json', report());
    const relaunchPath = writeReport(directory, 'relaunch.json', report({
      androidruntime_verify_error_seen: false,
      verify_error_detected: false,
      target_class: null,
      target_method: null,
      target_method_signature: null,
      method_references: [],
      instruction_offset: null,
      failure_kind: 'none',
      register: null,
      actual_type: null,
      expected_type: null,
      technical_message: null,
      message_status: 'not-applicable',
    }));
    const outputPath = path.join(directory, 'combined.json');
    const result = runAggregator(directory, initialPath, relaunchPath, outputPath);
    assert.equal(result.status, 0, result.stderr);
    const combined = JSON.parse(fs.readFileSync(outputPath, 'utf8'));
    assert.equal(combined.apk_source_run_id, '41653545783');
    assert.equal(combined.apk_artifact_name, 'Melodix-Preview-v1.2.2-test96-instrumentation.apk');
    assert.equal(combined.apk_version_code, 1021015);
    assert.equal(combined.apk_version_name, '1.2.2-ec6ef63');
    assert.equal(combined.apk_debuggable, true);
    assert.equal(combined.apk_sha256, APK_SHA256);
    assert.equal(combined.launches.initial.androidruntime.target_method, 'markNativeSettingsPayloadApplied');
    assert.equal(combined.launches.initial.androidruntime.instruction_offset, 35);
    assert.equal(combined.launches.initial.androidruntime.expected_type, 'Reference: java.lang.StringBuilder');
    assert.equal(combined.launches.post_permission_force_stop_relaunch.androidruntime.verify_error_detected, false);
    assert.equal(combined.launches.post_permission_force_stop_relaunch.bluetooth_connect_granted, true);
    assert.equal(combined.authenticated_spotify_test, 'not_performed');
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

test('P0 replay aggregation rejects mismatched source, nonce, schema, and unredacted content', () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-p0-replay-invalid-'));
  try {
    const valid = report();
    const cases = [
      { ...valid, source_commit: 'b'.repeat(40) },
      { ...valid, run_id: 'fedcba9876543210' },
      { ...valid, unexpected_raw_log: 'raw device output' },
      { ...valid, technical_message: 'VerifyError at https://private.invalid/path' },
    ];
    for (const [index, invalid] of cases.entries()) {
      const initialPath = writeReport(directory, `initial-${index}.json`, invalid);
      const relaunchPath = writeReport(directory, `relaunch-${index}.json`, report());
      const outputPath = path.join(directory, `combined-${index}.json`);
      const result = runAggregator(directory, initialPath, relaunchPath, outputPath);
      assert.notEqual(result.status, 0, `case ${index} should be rejected`);
      assert.equal(fs.existsSync(outputPath), false, `case ${index} must not leave a report`);
    }
    const validInitialPath = writeReport(directory, 'initial-wrong-apk.json', report());
    const validRelaunchPath = writeReport(directory, 'relaunch-wrong-apk.json', report());
    const wrongApkOutput = path.join(directory, 'combined-wrong-apk.json');
    const wrongApk = runAggregator(directory, validInitialPath, validRelaunchPath, wrongApkOutput, 'd'.repeat(64));
    assert.notEqual(wrongApk.status, 0, 'a non-historical APK digest must be rejected');
    assert.equal(fs.existsSync(wrongApkOutput), false);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});
