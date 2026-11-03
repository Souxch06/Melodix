'use strict';

// Regression tests for the temporary Android VerifyError capture. These
// fixtures are synthetic bytecode diagnostics, not device or Spotify data.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const { spawnSync } = require('node:child_process');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const SCRIPT = path.join(ROOT, 'scripts/sanitize_verify_diagnostic.py');
const RUN_ID = '0123456789abcdef';
const SOURCE_REF = 'a'.repeat(40);

function xmlEscape(value) {
    return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

function prefsXml(overrides = {}) {
    const values = {
        last_verify_exception: 'VerifyError',
        last_verify_class: 'com.melodix.music.MainActivity',
        last_verify_method: 'markNativeSettingsPayloadApplied',
        last_verify_source: 'main-content-view',
        last_verify_run_id: RUN_ID,
        last_verify_state: 'recorded',
        last_verify_message: 'Verifier rejected class Lcom/melodix/music/MainActivity;: void com.melodix.music.MainActivity.markNativeSettingsPayloadApplied(java.lang.String) failed to verify: register v5 has type Reference: java.lang.String but expected Integer at code offset 0x14',
        last_verify_elapsed_ms: '123456'
    };
    Object.assign(values, overrides);
    return `<map>${Object.entries(values).map(([key, value]) => {
        if (key === 'last_verify_elapsed_ms') return `<long name="${key}" value="${xmlEscape(String(value))}" />`;
        return `<string name="${key}">${xmlEscape(String(value))}</string>`;
    }).join('')}</map>`;
}

function runSanitizer({ prefs = prefsXml(), logcat, runId = RUN_ID, armLogSeenAtLaunch = 'unknown', activityDump, windowDump } = {}) {
    const input = {
        prefs_xml: prefs,
        logcat: logcat ?? `I/MDXVERIFY: verify-capture state=armed run_id=${RUN_ID}\nI/MDXVERIFY: verify-capture state=recorded run_id=${RUN_ID} source=main-content-view`,
        activity_dump: activityDump ?? 'mResumedActivity: ActivityRecord{cafe com.melodix.music.preview/com.melodix.music.MainActivity}',
        window_dump: windowDump ?? 'mCurrentFocus=Window{beef u0 com.melodix.music.preview/com.melodix.music.MainActivity}',
        pid: '4321',
        sdk: '36'
    };
    const result = spawnSync('python3', [SCRIPT, '--stdin-json', '--run-id', runId, '--source-ref', SOURCE_REF, '--source-root', ROOT, '--arm-log-seen-at-launch', armLogSeenAtLaunch], {
        cwd: ROOT,
        encoding: 'utf8',
        input: JSON.stringify(input),
        maxBuffer: 1024 * 1024
    });
    assert.equal(result.status, 0, result.stderr || 'sanitizer should exit successfully');
    return JSON.parse(result.stdout);
}

test('VerifyError report correlates by matching nonce and recorded state; logcat markers remain telemetry', () => {
    const report = runSanitizer();
    assert.equal(report.verify_error_detected, true);
    assert.equal(report.preference_run_id_matches, true);
    assert.equal(report.capture_armed_log_seen, true);
    assert.equal(report.verify_record_log_seen, true);
    assert.equal(report.arm_log_seen_at_launch, null);
    assert.equal(report.current_launch_correlated, true);
    assert.equal(report.record_source, 'main-content-view');
    assert.equal(report.target_class, 'com.melodix.music.MainActivity');
    assert.equal(report.target_method, 'markNativeSettingsPayloadApplied');
    assert.equal(report.target_method_signature, '(Ljava/lang/String;)V');
    assert.equal(report.register, 'v5');
    assert.equal(report.actual_type, 'Reference: java.lang.String');
    assert.equal(report.expected_type, 'Integer');
    assert.equal(report.instruction_offset, 0x14);
    assert.deepEqual(report.method_references, [{
        class: 'com.melodix.music.MainActivity',
        method: 'markNativeSettingsPayloadApplied',
        signature: '(Ljava/lang/String;)V'
    }]);
    assert.equal(report.android_api, 36);
    assert.equal(report.main_activity_resumed, true);
    assert.match(report.technical_message, /register v5 has actual type Reference: java\.lang\.String but expected type Integer/);
});

test('armed nonce and state correlate this launch even when the arm log marker is absent', () => {
    const report = runSanitizer({
        prefs: `<map><string name="last_verify_run_id">${RUN_ID}</string><string name="last_verify_state">armed</string><string name="last_stage">home-rendered</string></map>`,
        logcat: '',
        armLogSeenAtLaunch: 'false'
    });
    assert.equal(report.verify_error_detected, false);
    assert.equal(report.preference_run_id_matches, true);
    assert.equal(report.capture_armed_log_seen, false);
    assert.equal(report.arm_log_seen_at_launch, false);
    assert.equal(report.current_launch_correlated, true);
    assert.equal(report.diagnostic_state, 'armed-current-launch');
    assert.equal(report.last_stage, 'home-rendered');
    assert.equal(report.process_alive, true);
    assert.equal(report.main_activity_resumed, true);
});

test('recorded VerifyError nonce remains correlated if its log marker has left the ring buffer', () => {
    const report = runSanitizer({ prefs: prefsXml(), logcat: '', armLogSeenAtLaunch: 'true' });
    assert.equal(report.verify_error_detected, true);
    assert.equal(report.preference_run_id_matches, true);
    assert.equal(report.capture_armed_log_seen, false);
    assert.equal(report.verify_record_log_seen, false);
    assert.equal(report.arm_log_seen_at_launch, true);
    assert.equal(report.current_launch_correlated, true);
    assert.equal(report.diagnostic_state, 'recorded-current-launch');
});

test('unmatched launch IDs cannot be reported as a current-run VerifyError', () => {
    const report = runSanitizer({
        prefs: prefsXml({ last_verify_run_id: 'fedcba9876543210' }),
        logcat: `I/MDXVERIFY: verify-capture state=armed run_id=${RUN_ID}\nI/MDXVERIFY: verify-capture state=recorded run_id=${RUN_ID} source=main-content-view`
    });
    assert.equal(report.verify_error_detected, true);
    assert.equal(report.preference_run_id_matches, false);
    assert.equal(report.current_launch_correlated, false);
    assert.equal(report.diagnostic_state, 'recorded-uncorrelated');
});

test('an unconsumed pre-seeded nonce explicitly reports that diagnostic capture did not arm', () => {
    const report = runSanitizer({
        prefs: `<map><string name="last_verify_run_id">${RUN_ID}</string><string name="last_verify_state">arm-pending</string></map>`,
        logcat: ''
    });
    assert.equal(report.verify_error_detected, false);
    assert.equal(report.preference_run_id_matches, true);
    assert.equal(report.current_launch_correlated, false);
    assert.equal(report.diagnostic_state, 'pending-not-consumed');
});

test('credential-like markers suppress the message and never reach the report', () => {
    const syntheticMarker = 'access_token=synthetic-not-a-credential';
    const report = runSanitizer({
        prefs: prefsXml({ last_verify_message: `Verifier rejected class MainActivity register v2 has type Object but expected String ${syntheticMarker}` })
    });
    assert.equal(report.message_status, 'sensitive-content-suppressed');
    assert.doesNotMatch(JSON.stringify(report), /synthetic-not-a-credential|access_token=/i);
    assert.equal(report.target_method_signature, '(Ljava/lang/String;)V');
});

test('unrecognized verifier wording reports extraction failure and never exports free-form text', () => {
    const privateText = 'opaque verifier failure for playlist Summer Roadtrip owned by Alice';
    const report = runSanitizer({ prefs: prefsXml({ last_verify_message: privateText }) });
    assert.equal(report.failure_kind, 'unparsed-verify-error');
    assert.equal(report.register, null);
    assert.equal(report.expected_type, null);
    assert.equal(report.actual_type, null);
    assert.match(report.technical_message, /no whitelisted register, type, or instruction-offset fields could be extracted; raw text omitted/);
    assert.equal(report.message_status, 'message-present-unparsed-omitted');
    assert.doesNotMatch(JSON.stringify(report), /Summer Roadtrip|Alice|opaque verifier failure/);
});

test('missing VerifyError message yields an explicit unavailable status', () => {
    const report = runSanitizer({
        prefs: prefsXml({ last_verify_message: '__VERIFY_ERROR_MESSAGE_UNAVAILABLE__' })
    });
    assert.equal(report.message_status, 'message-unavailable');
    assert.match(report.technical_message, /no exception message was available/);
});

test('email addresses suppress free-form diagnostic text and cannot reach the artifact', () => {
    const report = runSanitizer({
        prefs: prefsXml({ last_verify_message: 'Verifier rejected class MainActivity near user.name@example.invalid' })
    });
    assert.equal(report.message_status, 'sensitive-content-suppressed');
    assert.doesNotMatch(JSON.stringify(report), /user\.name@example\.invalid|user\.name\?example\.invalid/);
    assert.match(report.technical_message, /withheld because it did not pass the diagnostic privacy checks/);
    assert.equal(report.method_references.length, 0);
});

test('URI, private path, query and long opaque values are redacted from the artifact', () => {
    const longValue = 'A'.repeat(64);
    const message = `Verifier rejected class Lcom/melodix/music/MainActivity; at /data/app/private/build/base.apk?query=value ${longValue} https://example.invalid/path?x=y spotify:track:synthetic-id`;
    const report = runSanitizer({ prefs: prefsXml({ last_verify_message: message }) });
    assert.equal(report.message_status, 'sensitive-content-suppressed');
    assert.doesNotMatch(JSON.stringify(report), /\/data\/app\/private|query=value|A{48}|https?:\/\/|spotify:/);
    assert.match(report.technical_message, /withheld because it did not pass the diagnostic privacy checks/);
});
