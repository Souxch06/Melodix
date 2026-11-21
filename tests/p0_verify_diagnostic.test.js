'use strict';

// Regression tests for the temporary Android VerifyError capture. These
// fixtures are synthetic bytecode diagnostics, not device or Spotify data.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
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

function runSanitizer({ prefs = prefsXml(), logcat, runId = RUN_ID, armLogSeenAtLaunch = 'unknown', activityDump, windowDump, earlyAndroidRuntimeReport } = {}) {
    const input = {
        prefs_xml: prefs,
        logcat: logcat ?? [
            `I/MDXVERIFY: verify-capture state=armed run_id=${RUN_ID}`,
            `I/MDXVERIFY: verify-capture state=recorded run_id=${RUN_ID} source=main-content-view`
        ].join(String.fromCharCode(10)),
        activity_dump: activityDump ?? 'mResumedActivity: ActivityRecord{cafe com.melodix.music.preview/com.melodix.music.MainActivity}',
        window_dump: windowDump ?? 'mCurrentFocus=Window{beef u0 com.melodix.music.preview/com.melodix.music.MainActivity}',
        pid: '4321',
        sdk: '36'
    };
    const tempDir = earlyAndroidRuntimeReport ? fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-verify-test-')) : null;
    try {
        const args = [SCRIPT, '--stdin-json', '--run-id', runId, '--source-ref', SOURCE_REF, '--source-root', ROOT, '--arm-log-seen-at-launch', armLogSeenAtLaunch];
        if (earlyAndroidRuntimeReport && tempDir) {
            const sidecar = path.join(tempDir, 'androidruntime-redacted.json');
            fs.writeFileSync(sidecar, JSON.stringify(earlyAndroidRuntimeReport));
            args.push('--early-androidruntime-report', sidecar);
        }
        const result = spawnSync('python3', args, {
            cwd: ROOT,
            encoding: 'utf8',
            input: JSON.stringify(input),
            maxBuffer: 1024 * 1024
        });
        assert.equal(result.status, 0, result.stderr || 'sanitizer should exit successfully');
        return JSON.parse(result.stdout);
    } finally {
        if (tempDir) fs.rmSync(tempDir, { recursive: true, force: true });
    }
}

function runAndroidRuntimeCapture(logcat, runId = RUN_ID, sourceRef = SOURCE_REF) {
    const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-androidruntime-test-'));
    try {
        const output = path.join(tempDir, 'androidruntime-redacted.json');
        const result = spawnSync('python3', [
            SCRIPT, '--androidruntime-stdin', '--run-id', runId, '--source-ref', sourceRef,
            '--source-root', ROOT, '--output', output
        ], {
            cwd: ROOT,
            encoding: 'utf8',
            input: logcat,
            maxBuffer: 1024 * 1024
        });
        assert.equal(result.status, 0, result.stderr || 'AndroidRuntime sanitizer should exit successfully');
        return { report: JSON.parse(fs.readFileSync(output, 'utf8')), summary: result.stdout };
    } finally {
        fs.rmSync(tempDir, { recursive: true, force: true });
    }
}

test('VerifyError report correlates by matching nonce and recorded state; logcat markers remain telemetry', () => {
    const report = runSanitizer();
    assert.equal(report.schema_version, 2);
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


test('immediate AndroidRuntime snapshot extracts only allowlisted verifier fields and drops ART install paths', () => {
    const raw = [
        'FATAL EXCEPTION: main',
        'Process: com.melodix.music.preview, PID: 4321',
        "java.lang.VerifyError: Verifier rejected class Lcom/melodix/music/MainActivity;: void com.melodix.music.MainActivity.markNativeSettingsPayloadApplied(java.lang.String) failed to verify: register v3 has type Reference: java.lang.String but expected type Reference: java.lang.StringBuilder at code offset 0x23 (declaration of 'com.melodix.music.MainActivity' appears in /data/app/~~private/com.melodix.music.preview-1/base.apk!classes.dex)"
    ].join(String.fromCharCode(10));
    const { report, summary } = runAndroidRuntimeCapture(raw);
    assert.equal(report.androidruntime_verify_error_seen, true);
    assert.equal(report.verify_error_detected, true);
    assert.equal(report.target_class, 'com.melodix.music.MainActivity');
    assert.equal(report.target_method, 'markNativeSettingsPayloadApplied');
    assert.equal(report.target_method_signature, '(Ljava/lang/String;)V');
    assert.equal(report.register, 'v3');
    assert.equal(report.actual_type, 'Reference: java.lang.String');
    assert.equal(report.expected_type, 'Reference: java.lang.StringBuilder');
    assert.equal(report.instruction_offset, 0x23);
    assert.equal(report.message_status, 'structured-message-available');
    assert.match(summary, /androidruntime_verify_error_seen=true/);
    assert.doesNotMatch(JSON.stringify(report), /[/]data[/]app|classes[.]dex|private/);
    assert.doesNotMatch(summary, /Verifier rejected|Reference:|[/]data/);
});

test('AndroidRuntime capture ignores unrelated processes and suppresses secret-like text without exporting it', () => {
    const unrelated = [
        'FATAL EXCEPTION: main',
        'Process: com.other.player, PID: 7',
        'java.lang.VerifyError: Verifier rejected class Lcom/other/player/MainActivity; register v1 has type String but expected Integer'
    ].join(String.fromCharCode(10));
    assert.equal(runAndroidRuntimeCapture(unrelated).report.androidruntime_verify_error_seen, false);

    const marker = 'authorization';
    const sensitive = [
        'FATAL EXCEPTION: main',
        'Process: com.melodix.music.preview, PID: 4321',
        `java.lang.VerifyError: Verifier rejected class Lcom/melodix/music/MainActivity; void com.melodix.music.MainActivity.markNativeSettingsPayloadApplied(java.lang.String) failed: register v3 has type String but expected StringBuilder ${marker}`
    ].join(String.fromCharCode(10));
    const report = runAndroidRuntimeCapture(sensitive).report;
    assert.equal(report.androidruntime_verify_error_seen, true);
    assert.equal(report.message_status, 'sensitive-content-suppressed');
    assert.equal(report.register, null);
    assert.equal(report.target_method, null);
    assert.doesNotMatch(JSON.stringify(report), /authorization/i);
});

test('AndroidRuntime capture fails closed with a privacy-safe report if parsing raises', () => {
    // The runner must never crash on an unexpected verifier message: the
    // --androidruntime-stdin path wraps parsing and falls back to a detection-
    // only report. Guard the wiring statically, then exercise the fallback.
    const source = fs.readFileSync(SCRIPT, 'utf8');
    assert.match(source, /except Exception as exc:[\s\S]*?sanitize_verify_diagnostic_parse_error=\{type\(exc\)\.__name__\}[\s\S]*?_fail_closed_early_report\(/);

    const raw = [
        'FATAL EXCEPTION: main',
        'Process: com.melodix.music.preview, PID: 4321',
        'java.lang.VerifyError: Verifier rejected class Lcom/melodix/music/MainActivity; register v3 has type String but expected StringBuilder'
    ].join(String.fromCharCode(10));
    const script = [
        'import importlib.util, json, sys',
        `spec = importlib.util.spec_from_file_location('svd', ${JSON.stringify(SCRIPT)})`,
        'm = importlib.util.module_from_spec(spec); spec.loader.exec_module(m)',
        `rep = m._fail_closed_early_report(logcat=${JSON.stringify(raw)}, run_id=${JSON.stringify(RUN_ID)}, source_ref=${JSON.stringify(SOURCE_REF)})`,
        'print(json.dumps(rep))'
    ].join('\n');
    const result = spawnSync('python3', ['-c', script], { cwd: ROOT, encoding: 'utf8' });
    assert.equal(result.status, 0, result.stderr);
    const report = JSON.parse(result.stdout);
    assert.equal(report.verify_error_detected, true);
    assert.equal(report.androidruntime_verify_error_seen, true);
    assert.equal(report.failure_kind, 'unparsed-verify-error');
    assert.equal(report.message_status, 'message-present-unparsed-omitted');
    // No free-form verifier text, class, method, register, or type leaks.
    assert.equal(report.target_class, null);
    assert.equal(report.target_method, null);
    assert.equal(report.register, null);
    assert.equal(report.technical_message, null);
    assert.deepEqual(report.method_references, []);
    assert.doesNotMatch(JSON.stringify(report), /Verifier rejected|StringBuilder|MainActivity/);

    // The same fallback with no VerifyError present must report a clean launch.
    const cleanScript = script.replace(JSON.stringify(raw), JSON.stringify('FATAL EXCEPTION: main\nProcess: com.other.player, PID: 7\njava.lang.VerifyError: unrelated'));
    const cleanResult = spawnSync('python3', ['-c', cleanScript], { cwd: ROOT, encoding: 'utf8' });
    assert.equal(cleanResult.status, 0, cleanResult.stderr);
    const cleanReport = JSON.parse(cleanResult.stdout);
    assert.equal(cleanReport.verify_error_detected, false);
    assert.equal(cleanReport.failure_kind, 'none');
    assert.equal(cleanReport.message_status, 'not-applicable');
});

test('early runner capture supplements legacy app prefs but does not claim app nonce correlation', () => {
    const raw = [
        'FATAL EXCEPTION: main',
        'Process: com.melodix.music.preview, PID: 4321',
        'java.lang.VerifyError: Verifier rejected class Lcom/melodix/music/MainActivity;: void com.melodix.music.MainActivity.markNativeSettingsPayloadApplied(java.lang.String) failed to verify: register v3 has type Reference: java.lang.String but expected type Reference: java.lang.StringBuilder at code offset 0x23'
    ].join(String.fromCharCode(10));
    const early = runAndroidRuntimeCapture(raw).report;
    const report = runSanitizer({
        prefs: `<map><string name="last_verify_run_id">${RUN_ID}</string><string name="last_verify_state">arm-pending</string></map>`,
        logcat: '',
        earlyAndroidRuntimeReport: early
    });
    assert.equal(report.androidruntime_verify_error_seen, true);
    assert.equal(report.verify_error_detected, true);
    assert.equal(report.target_method, 'markNativeSettingsPayloadApplied');
    assert.equal(report.register, 'v3');
    assert.equal(report.current_launch_correlated, false);
    assert.equal(report.diagnostic_state, 'pending-not-consumed');
});

test('early runner snapshots are ignored when the launch nonce or source SHA differs', () => {
    const raw = [
        'FATAL EXCEPTION: main',
        'Process: com.melodix.music.preview, PID: 4321',
        'java.lang.VerifyError: Verifier rejected class Lcom/melodix/music/MainActivity;'
    ].join(String.fromCharCode(10));
    const early = runAndroidRuntimeCapture(raw).report;
    const prefs = `<map><string name="last_verify_run_id">${RUN_ID}</string><string name="last_verify_state">arm-pending</string></map>`;
    const nonceMismatch = runSanitizer({
        prefs,
        logcat: '',
        earlyAndroidRuntimeReport: { ...early, run_id: 'fedcba9876543210' }
    });
    assert.equal(nonceMismatch.androidruntime_verify_error_seen, false);
    assert.equal(nonceMismatch.verify_error_detected, false);
    assert.equal(nonceMismatch.target_method, null);

    const sourceMismatch = runSanitizer({
        prefs,
        logcat: '',
        earlyAndroidRuntimeReport: { ...early, source_commit: 'b'.repeat(40) }
    });
    assert.equal(sourceMismatch.androidruntime_verify_error_seen, false);
    assert.equal(sourceMismatch.verify_error_detected, false);
});
