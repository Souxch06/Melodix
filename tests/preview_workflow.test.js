const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");
const test = require("node:test");

const workflow = fs.readFileSync(
  path.resolve(__dirname, "..", ".github/workflows/preview-apk.yml"),
  "utf8",
);

test("Preview workflow requires an explicit full source SHA instead of defaulting to the old baseline", () => {
  const sourceInput = workflow.match(
    /  workflow_dispatch:\n    inputs:\n([\s\S]*?)(?=\n\npermissions:)/,
  );
  assert.ok(sourceInput, "manual workflow_dispatch inputs should exist");
  const sourceRef = sourceInput[1].match(
    /      source_ref:\n        description: Full source commit SHA to build\n        required: true\n        type: string/,
  );
  assert.ok(
    sourceRef,
    "manual source_ref input should exist without a default",
  );
  assert.doesNotMatch(sourceRef[0], /default:/);
  assert.match(workflow, /source_ref must be a full 40-character commit SHA/);
  assert.match(
    workflow,
    /if: github\.event_name == 'push' \|\| github\.event_name == 'workflow_dispatch' \|\| github\.event_name == 'workflow_call'/,
  );
  assert.match(workflow, /workflow_call:\n    inputs:/);
  assert.match(
    workflow,
    /INPUT_SOURCE_REF: \$\{\{ inputs\.source_ref \|\| github\.sha \}\}/,
  );
});

test("build-only Preview runs can build separate instrumentation and release-candidate APKs without publishing", () => {
  assert.match(workflow, /build_only:[\s\S]*?default: false[\s\S]*?type: boolean/,
    "reusable build callers must explicitly select build-only behavior");
  assert.match(workflow, /target_debuggable:[\s\S]*?default: false[\s\S]*?type: boolean/,
    "debuggability is an explicit reusable-workflow input and defaults to a release-safe manifest");
  assert.match(workflow, /apk_suffix:[\s\S]*?type: string[\s\S]*?version_code_base:[\s\S]*?type: number/,
    "parallel artifact builds have distinct names and can use a release-safe monotonic versionCode base");
  assert.ok(workflow.includes("BUILD_ONLY: ${{ inputs.build_only || github.event_name == 'workflow_dispatch' }}"),
    "manual invocations of the reusable builder are always artifact-only and cannot bypass emulator validation");
  assert.doesNotMatch(workflow, /should_publish='true'|gh release create|action-gh-release/,
    "the reusable builder has no publication branch to bypass the release-candidate test");
  assert.match(workflow, /if \(\( VERSION_CODE_BASE > 0 \)\); then[\s\S]*?version_code=\$\(\(VERSION_CODE_BASE \+ GITHUB_RUN_NUMBER\)\)[\s\S]*?version_code=\$\(\(1020880 \+ GITHUB_RUN_NUMBER\)\)/,
    "release candidates can increment from the previously published APK while instrumentation uses a separate counter");
  assert.ok(workflow.includes("TARGET_DEBUGGABLE: ${{ inputs.target_debuggable || false }}"));
  assert.match(workflow, /if TARGET_DEBUGGABLE and not BUILD_ONLY:[\s\S]*?application\.set\(android \+ "debuggable", "true"\)[\s\S]*?application\.attrib\.pop\(android \+ "debuggable", None\)/,
    "only explicitly requested build-only instrumentation APKs are debuggable; published candidates stay non-debuggable");
  assert.ok(workflow.includes("This workflow is build/artifact-only in every event mode.") &&
    workflow.includes("release can be created only by test-preview-emulator"),
    "all builder event modes defer public release creation until exact-candidate validation");
  assert.match(workflow, /name: Upload APK as workflow artifact[\s\S]*?retention-days: 14/,
    "built APKs are available as short-lived workflow artifacts");
  assert.doesNotMatch(workflow, /gh release create|action-gh-release|Create preview release and attach APK/,
    "the reusable builder is artifact-only; the validated emulator workflow owns all public release creation");
  assert.match(workflow, /permissions:\n  contents: read/);
});

test("the emulator workflow checks the exact APK debuggable flag and captures redacted instrumentation diagnostics", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(
      __dirname,
      "..",
      ".github/workflows/test-preview-emulator.yml",
    ),
    "utf8",
  );
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  assert.match(
    harness,
    /instrumentation_onCreate_entered[\s\S]*?super\.onCreate\(arguments\)[\s\S]*?instrumentation_onCreate_returned[\s\S]*?start\(\);[\s\S]*?instrumentation_runner_thread_started[\s\S]*?instrumentation_onStart_entered[\s\S]*?super\.onStart\(\)[\s\S]*?instrumentation_onStart_super_returned/,
    "start the custom instrumentation runner thread explicitly and capture exact lifecycle checkpoints",
  );
  assert.match(
    emulatorWorkflow,
    /logcat -d -t 1000 -v threadtime -s MelodixHarness:I[\s\S]*?instrumentation_runner_thread_started/,
    "read harness markers using a deterministic logcat format that the safe parser understands",
  );
  assert.match(
    emulatorWorkflow,
    /safe_harness_logs=.*instrumentation_onCreate_entered[\s\S]*?instrumentation_onStart_super_returned/,
  );
  assert.match(
    emulatorWorkflow,
    /aapt" dump xmltree "\$apk" AndroidManifest\.xml/,
    "read debuggable from the exact same-run APK rather than infer it from source files",
  );
  assert.match(
    emulatorWorkflow,
    /target_debuggable="\$\(python3 -[\s\S]*?\[\[ "\$target_debuggable" == "true" \]\]/,
    "refuse to start instrumentation unless the built APK reports debuggable=true",
  );
  assert.match(emulatorWorkflow, /launch_failure_diagnostics\(\)[\s\S]*?host_available_kib[\s\S]*?fatal_or_anr_log_count[\s\S]*?trap launch_failure_diagnostics EXIT/,
    'unexpected Android launch termination leaves only bounded host/device health counters for diagnosis');
  assert.match(emulatorWorkflow, /timeout 15s adb logcat -d -t 2000 -b main -b system -b crash[\s\S]*?grep -cE/,
    'failure reporting stores counts rather than raw logcat or account content');
  assert.match(emulatorWorkflow, /adb shell dumpsys activity > "\$activity_dump"/);
  assert.doesNotMatch(
    emulatorWorkflow,
    /dumpsys activity instrumentation/,
    "Android 16 does not support the instrumentation dumpsys subcommand",
  );
  assert.match(
    emulatorWorkflow,
    /logcat -d -t 2000 -b main -b system -b crash -b events -v threadtime[\s\S]*?ActivityManager:V ActivityTaskManager:V PackageManager:V Instrumentation:V AndroidRuntime:E[\s\S]*?am_proc_start:I am_proc_died:I am_crash:I am_anr:I/,
  );
  assert.match(
    emulatorWorkflow,
    /target_pid="\$\(adb shell pidof -s com\.melodix\.music\.preview[\s\S]*?test_pid="\$\(adb shell pidof -s com\.melodix\.music\.preview\.test/,
  );
  assert.match(
    emulatorWorkflow,
    /token_patterns = \([\s\S]*?<redacted>[\s\S]*?system_logcat=/,
    "system diagnostics are filtered and secret-like values are redacted before entering workflow output",
  );
  assert.match(emulatorWorkflow, /rm -f "\$activity_dump" "\$system_logcat"/);
  assert.match(
    emulatorWorkflow,
    /TARGET_DEBUGGABLE: \$\{\{ steps\.apk\.outputs\.target_debuggable \}\}[\s\S]*?target_debuggable=\$TARGET_DEBUGGABLE/,
  );
  assert.match(
    emulatorWorkflow,
    /APK_DEBUGGABLE: \$\{\{ steps\.apk\.outputs\.target_debuggable \}\}[\s\S]*?Exact target APK debuggable/,
  );
});

test("empty-Home pixels are captured before instrumentation finish and the same app is resumed afterwards", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(
      __dirname,
      "..",
      ".github/workflows/test-preview-emulator.yml",
    ),
    "utf8",
  );
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  const captureCall = harness.indexOf("captureEmptyHomeUiEvidence();");
  const finishCall = harness.indexOf("finish(Activity.RESULT_OK, result);");
  assert.ok(
    captureCall >= 0 && finishCall > captureCall,
    "save the measured empty-Home screen while the instrumented Activity is still alive, before finish() stops it",
  );
  assert.match(harness, /serviceInfo\.flags = AccessibilityServiceInfo\.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS[\s\S]*?FLAG_REPORT_VIEW_IDS[\s\S]*?automation\.setServiceInfo\(serviceInfo\)/);
  assert.match(harness, /automation\.getRootInActiveWindow\(\)/);
  assert.match(harness, /automation\.takeScreenshot\(\)/);
  assert.match(harness, /for \(int attempt = 0; attempt < 3 && root == null; attempt\+\+\)[\s\S]*?phasePrefix \+ "_get_hierarchy"[\s\S]*?for \(int attempt = 0; attempt < 3 && screenshot == null; attempt\+\+\)[\s\S]*?phasePrefix \+ "_take_screenshot"/);
  assert.match(emulatorWorkflow, /safe_harness_logs=.*phase=\[a-z_\]\+/);
  assert.match(harness, /appendXmlAttribute\(xml, "bounds", bounds\.toShortString\(\)\)/);
  assert.doesNotMatch(harness, /bounds\.flattenToString\(\)/);
  assert.match(harness, /captureEmptyHomeUiEvidence\(\)[\s\S]*?captureUiEvidence\("melodix-preview-home-fallback\.xml", "melodix-preview-home-empty\.png"/);
  assert.match(harness, /captureHomeStatusUiEvidence\(\)[\s\S]*?captureUiEvidence\("melodix-preview-home-status\.xml", "melodix-preview-home-status\.png"/);
  assert.match(harness, /captureWebHomeRendererEvidence\(\)[\s\S]*?captureUiEvidence\("melodix-preview-web-home-app\.xml", "melodix-preview-web-home-app\.png"/);
  assert.match(harness, /WEB_HOME_RENDERER_VISIBLE_PROBE[\s\S]*?location\.pathname==='\/app'/,
    "the Android WebView probe requires the packaged renderer to activate on the /app route");
  assert.match(harness, /putBoolean\("home_status_payload_fixture_non_playlist", true\)/);
  assert.match(harness, /dispatchHomeStatusThroughAndBridge\(activity\)[\s\S]*?awaitNativeHomeStatusReady\(activity\)[\s\S]*?inspectHomeStatus\(activity, webView, originalWebViewUrl\)[\s\S]*?captureHomeStatusUiEvidence\(\)/);
  const statusDispatchAt = harness.indexOf("private void dispatchHomeStatusThroughAndBridge");
  const statusDispatchBody = harness.slice(statusDispatchAt, harness.indexOf("private void awaitNativeHomeStatusReady", statusDispatchAt));
  assert.doesNotMatch(statusDispatchBody, /getMethod\("onNativeUiReady"|ready\.invoke\(|nativeHomeContentReady\s*=|nativeHomeStatusAttached\s*=/,
    "status readiness must result from the real renderer/visibility gate, never a forced flag or ready callback");
  assert.match(harness, /login_surface_restored_after_status/);
  assert.match(harness, /result\.putBoolean\("empty_home_evidence_captured", true\)/);
  assert.match(harness, /result\.putBoolean\("home_status_evidence_captured", true\)/);
  assert.match(harness, /BROWSER_COMPATIBILITY_PROBE/);
  assert.match(harness, /configured_ua_chrome_major_matches_runtime/);
  assert.match(harness, /javascript_ua_profile_coherent/);
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: browser_compatibility_warning_visible=false/);
  assert.match(emulatorWorkflow, /Browser compatibility banner:/);
  assert.match(emulatorWorkflow, /installed_webview_chrome_major/);
  assert.match(emulatorWorkflow, /configured_ua_chrome_major/);
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: empty_home_evidence_captured=true/);
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: home_status_evidence_captured=true/);
  assert.match(emulatorWorkflow, /safe_statuses=.*empty_home_evidence_captured.*home_status_evidence_captured/);
  assert.match(emulatorWorkflow, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-home-fallback\.xml/);
  assert.match(emulatorWorkflow, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-home-empty\.png/);
  assert.match(emulatorWorkflow, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-home-status\.xml/);
  assert.match(emulatorWorkflow, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-home-status\.png/);
  assert.match(emulatorWorkflow, /inspect_hierarchy\.py home-status/);
  assert.match(emulatorWorkflow, /inspect_hierarchy\.py web-home/);
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: web_home_app_route_renderer_visible=true/);
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: web_home_renderer_fixture_test_only=true/);
  assert.match(emulatorWorkflow, /web_home_renderer_pixels_verified=true/);
  assert.match(emulatorWorkflow, /login_surface_restored_after_web_home_fixture=true/);
  assert.match(emulatorWorkflow, /home_status_pixels_verified=true/);
  assert.match(emulatorWorkflow, /login_surface_restored_after_status=true/);
  const screenshotRetrieved = emulatorWorkflow.indexOf(
    "adb exec-out run-as com.melodix.music.preview cat files/melodix-preview-home-empty.png",
  );
  const targetRelaunch = emulatorWorkflow.indexOf(
    "adb shell am start -W -n com.melodix.music.preview/com.melodix.music.MainActivity",
  );
  const statusScreenshotRetrieved = emulatorWorkflow.indexOf(
    "adb exec-out run-as com.melodix.music.preview cat files/melodix-preview-home-status.png",
  );
  const webHomeScreenshotRetrieved = emulatorWorkflow.indexOf(
    "adb exec-out run-as com.melodix.music.preview cat files/melodix-preview-web-home-app.png",
  );
  const webHomeInspection = emulatorWorkflow.indexOf(
    "python3 tests/android/inspect_hierarchy.py web-home",
  );
  const statusInspection = emulatorWorkflow.indexOf(
    "python3 tests/android/inspect_hierarchy.py home-status",
  );
  const emptyHomeInspection = emulatorWorkflow.indexOf(
    "python3 tests/android/inspect_hierarchy.py empty-home",
  );
  assert.ok(
    screenshotRetrieved >= 0 && screenshotRetrieved < targetRelaunch && targetRelaunch < webHomeInspection &&
      webHomeScreenshotRetrieved >= 0 && webHomeScreenshotRetrieved < targetRelaunch && webHomeInspection < statusInspection &&
      statusScreenshotRetrieved < targetRelaunch && statusInspection < emptyHomeInspection,
    "retrieve pre-finish renderer/status/fallback screenshots, verify MainActivity resumes, then inspect their visible UI and pixels",
  );
  assert.match(
    emulatorWorkflow,
    /adb shell am start -W -n com\.melodix\.music\.preview\/com\.melodix\.music\.MainActivity/,
    "finish() may stop the instrumented process, so verify activity resumption after relaunching the exact installed target",
  );
  assert.match(emulatorWorkflow, /inspect_hierarchy\.py empty-home/);
  assert.match(emulatorWorkflow, /activity_resumed=true[\s\S]*?preview_relaunched=\$preview_relaunched/);
  assert.match(emulatorWorkflow, /empty_home_pixels_verified=true/);
  assert.match(emulatorWorkflow, /PREVIEW_RELAUNCHED: \$\{\{ steps\.post-instrumentation\.outputs\.preview_relaunched \}\}/);
  assert.match(emulatorWorkflow, /MainActivity was not resumed after instrumentation \(harness=\$INTEGRATION_OUTCOME\); relaunching/);
  assert.match(emulatorWorkflow, /harness_failure_phase/);
  assert.match(emulatorWorkflow, /harness_failure_type/);
});

test("Android verifies the packaged Web Home renderer on /app in an isolated, visible WebView", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github/workflows/test-preview-emulator.yml"),
    "utf8",
  );
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  const inspector = fs.readFileSync(
    path.resolve(__dirname, "android", "inspect_hierarchy.py"),
    "utf8",
  );
  const c91Smali = fs.readFileSync(path.resolve(__dirname, "..", "smali", "c91.smali"), "utf8");
  const o6Smali = fs.readFileSync(path.resolve(__dirname, "..", "smali", "o6.smali"), "utf8");
  const appSingletonSmali = fs.readFileSync(
    path.resolve(__dirname, "..", "smali", "com", "melodix", "music", "AppSingleton.smali"),
    "utf8",
  );
  const fixtureStart = harness.indexOf("private WebView createWebHomeRendererFixture");
  const fixtureEnd = harness.indexOf("private void installPackagedWebHomeRenderer", fixtureStart);
  const fixture = harness.slice(fixtureStart, fixtureEnd);
  assert.ok(fixtureStart >= 0 && fixtureEnd > fixtureStart, "the test uses a separate temporary renderer WebView");
  assert.match(fixture, /new WebView\(activity\)/);
  assert.match(fixture, /loadDataWithBaseURL\([\s\S]*?https:\/\/open\.spotify\.com\/app/);
  assert.match(fixture, /setBlockNetworkLoads\(true\)/);
  assert.match(fixture, /setDomStorageEnabled\(false\)/);
  assert.match(fixture, /Route fixture playlist[\s\S]*?Route fixture album/);
  assert.match(fixture, /__sfMelodixHomeTestMode=true/);
  assert.doesNotMatch(fixture, /CookieManager|setCookie|localStorage|sessionStorage|loadUrl\s*\(/,
    "the offline fixture must not read/write the Spotify session or navigate the production WebView");
  assert.match(harness, /readPackagedAsset\(activity, "melodix_home\.js"\)/);
  assert.match(harness, /readPackagedAsset\(activity, "css_hacks\.css"\)/);
  assert.match(harness, /evaluateJavascriptAndWait\(webView, rendererSource\)[\s\S]*?evaluateJavascriptAndWait\(webView, cssInjection\)/);
  assert.match(harness, /String darkModeCss = "";/);
  assert.match(harness, /String bodyModeCommands =[\s\S]*?sf-video-bg[\s\S]*?sf-fullscreen-disabled/);
  assert.match(harness, /JSONObject\.quote\(cssSource\)[\s\S]*?JSONObject\.quote\(darkModeCss\)[\s\S]*?sf-melodix-home-styles-ready/);
  assert.ok(c91Smali.includes("style.textContent = %s + %s;  %s; try { window.dispatchEvent(new Event(\\'sf-melodix-home-styles-ready\\'))"),
    "the fixture mirrors c91's packaged CSS concatenation, runtime body classes and style-ready event");
  assert.ok(o6Smali.includes("style.textContent = %s + %s;  %s})()"),
    "o6 uses the same CSS/body-class update form for settings changes");
  assert.doesNotMatch(o6Smali, /sf-melodix-home-styles-ready/,
    "o6's CSS reapply omits the event, so the renderer's existing stylesheet observer must cover that path");
  for (const setting of ["E", "Q", "R", "T"]) {
    assert.match(appSingletonSmali, new RegExp(`\\.field public static ${setting}:Z = false`),
      `the isolated fresh-install CSS fixture assumes ${setting}=false, as packaged defaults specify`);
  }
  assert.match(harness, /WEB_HOME_RENDERER_VISIBLE_PROBE[\s\S]*?__sfMelodixHomeInitAttempted===true[\s\S]*?__sfMelodixHomeStylesReady===true[\s\S]*?sf-melodix-home-active[\s\S]*?sf-melodix-home__card[\s\S]*?mainStyle\.display==='none'[\s\S]*?rect\.width>0&&rect\.height>0/);
  assert.match(harness, /inspectWebHomeRenderer\(\s*activity,\s*webHomeFixtureHolder\[0\],\s*originalWebViewUrl,\s*webView\)[\s\S]*?original_login_webview_url_preserved/);
  assert.match(harness, /removeWebHomeRendererFixture\(webHomeFixtureHolder\[0\]\)[\s\S]*?login_surface_restored_after_web_home_fixture/);
  assert.match(harness, /failurePhase = "web_home_fixture_create"[\s\S]*?failurePhase = "web_home_renderer_asset_install"[\s\S]*?failurePhase = "web_home_renderer_visibility_probe"[\s\S]*?failurePhase = "web_home_renderer_native_visibility"[\s\S]*?failurePhase = "web_home_renderer_evidence_capture"/);
  assert.match(harness, /WEB_HOME_RENDERER_DIAGNOSTIC_PROBE[\s\S]*?home_card_count[\s\S]*?source_hidden[\s\S]*?first_card_has_bounds/);
  assert.match(harness, /main_view_present[\s\S]*?raw_anchor_count[\s\S]*?root_resource_count[\s\S]*?source_card_count[\s\S]*?session_proven[\s\S]*?decision_session_unproven[\s\S]*?decision_rendered_status[\s\S]*?decision_styles_not_ready[\s\S]*?style_probe_home_display_flex[\s\S]*?style_probe_main_hidden/);
  assert.match(harness, /web_home_probe_diagnostics_available[\s\S]*?web_home_probe_root_resource_count[\s\S]*?web_home_probe_decision_styles_not_ready[\s\S]*?web_home_probe_style_probe_completed[\s\S]*?web_home_probe_renderer_style_probe_marker_present[\s\S]*?web_home_probe_renderer_style_probe_error[\s\S]*?web_home_probe_style_probe_main_hidden[\s\S]*?web_home_probe_first_card_has_bounds/);
  assert.match(emulatorWorkflow, /safe_statuses=.*web_home_color_probe_\(completed\|error\|error_type\|validation_passed\).*web_home_\(normal\|loading\|empty\|error\|partial\)_\(state_\(visible\|wcag_aa_pass\|partial_data\|card_count\|library_status\)\|contrast_\[A-Za-z0-9_\]\+\|color_\[A-Za-z0-9_\]\+\).*web_home_probe_diagnostics_available.*web_home_probe_root_resource_count.*web_home_probe_style_probe_completed.*web_home_probe_renderer_style_probe_marker_present.*web_home_probe_renderer_style_probe_error.*web_home_probe_style_probe_main_hidden.*web_home_probe_first_card_has_bounds/);
  assert.match(emulatorWorkflow, /web_home_renderer_probe_renderer_style_probe_marker_present[\s\S]*?status_bool\("web_home_probe_renderer_style_probe_marker_present"\)/);
  assert.match(emulatorWorkflow, /harness_overall_passed=false[\s\S]*?INSTRUMENTATION_STATUS: overall=passed[\s\S]*?harness_overall_passed=true[\s\S]*?safe_statuses=/,
    "a runner can return exit zero after a canceled Activity, so fail from the harness result and retain safe phase diagnostics");
  assert.match(harness, /result\.putBoolean\("authenticated_home_test_performed", false\)/);
  assert.match(harness, /inspectLiveSpotifyCssTheme\(webView\)[\s\S]*?live_webview_css_tokens_valid[\s\S]*?live_webview_home_active/,
    "the existing Spotify WebView is observed directly, without replacing its login content or claiming an authenticated Home");
  assert.match(harness, /catch \(org\.json\.JSONException error\)[\s\S]*?javascriptUserAgentProbeFailure/,
    "malformed JavaScript UA diagnostics are recorded as a safe failure instead of escaping the instrumentation harness");
  assert.match(harness, /live_spotify_css_probe_completed[\s\S]*?live_spotify_css_probe_error[\s\S]*?safeExceptionType\(error\)/,
    "live WebView probe parse errors remain visible in the redacted evidence");
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: javascript_ua_profile_probe_error=false[\s\S]*?INSTRUMENTATION_STATUS: live_spotify_css_probe_completed=true[\s\S]*?INSTRUMENTATION_STATUS: live_spotify_css_probe_error=false/,
    "the Android workflow requires successful parsing of live WebView and UA probe evidence");
  for (const profileField of [
    "android_api_level", "android_release", "installed_webview_package_version",
    "configured_ua_chrome_version", "javascript_user_agent_chrome_version", "client_hints_platform"
  ]) assert.ok(harness.includes(profileField), `the sanitized runtime profile reports ${profileField}`);
  for (const liveToken of ["--mel-bg", "--mel-home-status-stroke", "--mel-home-status-error-stroke"]) {
    assert.ok(harness.includes(liveToken), `the live Spotify WebView probe observes ${liveToken}`);
  }
  assert.match(harness, /getHighEntropyValues\(\['fullVersionList','platformVersion','uaFullVersion'\]\)[\s\S]*?client_hints_platform_version[\s\S]*?JAVASCRIPT_UA_RESULT_PROBE/,
    "Client Hints full version and platform version are read from the existing WebView and bounded by a timeout");
  assert.match(harness, /client_hints_high_entropy_error_type[\s\S]*?javascript_user_agent_probe_error_type/);
  assert.match(emulatorWorkflow, /client_hints_full_browser_version[\s\S]*?client_hints_platform_version[\s\S]*?client_hints_high_entropy_error_type/);
  assert.match(harness, /WEB_HOME_COLOR_STATES_PROBE[\s\S]*?record\('normal'\)[\s\S]*?setState\('loading'[\s\S]*?setState\('ready'[\s\S]*?setState\('error'[\s\S]*?record\('partial'\)/,
    "computed contrast is exercised for normal, loading, empty, error and partial-data fixture states");
  assert.match(harness, /ratiosForState\.optDouble[\s\S]*?ratio < 4\.5/,
    "computed WebView text/button contrast must clear WCAG AA");
  assert.match(harness, /webHomeColorState = inspectWebHomeColorStates[\s\S]*?sendStatus\(1, webHomeColorState\)[\s\S]*?web_home_color_probe_validation_passed/,
    "computed colors and failing contrast ratios are emitted safely before the test fails");
  assert.match(harness, /retry_button_fill[\s\S]*?statusBackdrops/,
    "the retry button fill and focus ring are compared to the actual status-card backdrop");
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: live_webview_css_tokens_valid=true[\s\S]*?INSTRUMENTATION_STATUS: web_home_all_states_wcag_aa_pass=true[\s\S]*?INSTRUMENTATION_STATUS: web_home_partial_state_wcag_aa_pass=true/);
  assert.match(emulatorWorkflow, /live_webview_css_tokens_valid[\s\S]*?web_home_color_state_scenarios_complete[\s\S]*?retry_button_fill/);
  assert.match(emulatorWorkflow, /css_source_sha256[\s\S]*?unzip -p "\$apk" assets\/css_hacks\.css[\s\S]*?css_source_matches_apk_asset/,
    "the exact candidate carries the canonical CSS asset hash in the sanitized report");
  assert.match(inspector, /"web-home"[\s\S]*?web_home_fixture_playlist_title_visible[\s\S]*?web_home_fixture_album_title_visible/);
  assert.match(inspector, /test_only_resource_links_present[\s\S]*?authenticated_home_test_performed/);
  assert.match(inspector, /inspect_hierarchy\.py|Packaged Web Home renderer/);
  assert.match(emulatorWorkflow, /files\/melodix-preview-web-home-app\.xml[\s\S]*?files\/melodix-preview-web-home-app\.png/);
  assert.match(emulatorWorkflow, /inspect_hierarchy\.py web-home[\s\S]*?web_home_renderer_pixels_verified=true/);
  assert.match(emulatorWorkflow, /web_home_renderer_hierarchy_pixels_verified/);
  assert.match(emulatorWorkflow, /authenticated_home_test=not_performed/);
  assert.match(emulatorWorkflow, /web-home-app\.png[\s\S]*?web-home-app-hierarchy-redacted\.json/);
  assert.doesNotMatch(emulatorWorkflow.slice(emulatorWorkflow.indexOf("name: Upload verified screenshot and redacted launch summary")),
    /web-home-app-window\.xml/,
    "raw WebView hierarchy XML is inspected in the runner but never uploaded");
});

test("the emulator workflow validates same-run instrumentation and exact release-candidate APKs before optional publication", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(
      __dirname,
      "..",
      ".github/workflows/test-preview-emulator.yml",
    ),
    "utf8",
  );
  assert.match(
    emulatorWorkflow,
    /uses: \.\/\.github\/workflows\/preview-apk\.yml/,
  );
  assert.match(emulatorWorkflow, /build_only: true/);
  assert.match(emulatorWorkflow, /build-preview:[\s\S]*?target_debuggable: true[\s\S]*?apk_suffix: '-instrumentation'/);
  assert.match(emulatorWorkflow, /default: v1\.2\.2-test\.96-preview[\s\S]*?build-release-candidate:[\s\S]*?release_tag: \$\{\{ inputs\.release_tag \|\| 'v1\.2\.2-test\.96-preview' \}\}[\s\S]*?target_debuggable: false[\s\S]*?apk_suffix: '-release-candidate'[\s\S]*?version_code_base: 1021019/);
  assert.doesNotMatch(emulatorWorkflow, /release_tag: \$\{\{ inputs\.release_tag \|\| 'v1\.2\.2-test\.95-preview'/,
    "the next release candidate targets .96 rather than overwriting the published .95 preview tag");
  assert.match(emulatorWorkflow, /install-and-launch:[\s\S]*?needs: \[build-preview, build-release-candidate\]/);
  assert.match(emulatorWorkflow, /Download the debuggable instrumentation APK built by this same run/);
  assert.match(emulatorWorkflow, /Download the non-debuggable release candidate built by this same run/);
  assert.match(emulatorWorkflow, /needs\.build-preview\.outputs\.apk_name/);
  assert.match(emulatorWorkflow, /needs\.build-release-candidate\.outputs\.apk_name/);
  assert.match(emulatorWorkflow, /Verify the exact non-debuggable release candidate[\s\S]*?\[\[ "\$target_debuggable" == "false" \]\][\s\S]*?version_code > 1021019/);
  assert.match(emulatorWorkflow, /Install and cold-launch the exact non-debuggable release candidate[\s\S]*?adb install \"\$RELEASE_APK\"[\s\S]*?activity_resumed=true/);
  assert.match(emulatorWorkflow, /Publish the exact validated Preview release candidate[\s\S]*?steps\.release-candidate-smoke\.outcome == 'success'[\s\S]*?gh release create/);
  assert.match(emulatorWorkflow, /if: \(github\.event_name == 'workflow_dispatch' && inputs\.publish_preview == true \|\| github\.event_name == 'push' && startsWith\(github\.event\.head_commit\.message, '\[preview-release\] v1\.2\.2-test\.96-preview'\)\) && steps\.integration\.outcome == 'success'[\s\S]*?gh release create/);
  assert.match(emulatorWorkflow, /PUBLISH_PREVIEW: \$\{\{ inputs\.publish_preview \|\| \(github\.event_name == 'push' && startsWith\(github\.event\.head_commit\.message, '\[preview-release\] v1\.2\.2-test\.96-preview'\)\) \}\}/,
    'push-based Preview publication requires the explicit tag marker and still waits for every exact-APK validation');
  assert.match(emulatorWorkflow, /sha256sum -c "\$source_name\.sha256"[\s\S]*?cmp -s "\$RELEASE_APK" "\$final_apk"[\s\S]*?gh release create/);
  assert.match(emulatorWorkflow, /--target "\$SOURCE_REF"[\s\S]*?--prerelease/);
  assert.ok(emulatorWorkflow.includes('gh api --include "repos/Souxch06/Melodix/git/ref/tags/$RELEASE_TAG"'));
  assert.ok(emulatorWorkflow.includes("grep -qE '^HTTP/[0-9.]+ 404 Not Found$' <<< \"$tag_ref_response\""),
    'an absent tag is distinguished from API permission or transport failures before publication');
  assert.doesNotMatch(emulatorWorkflow, /existing_ref=.*gh api/,
    'a GitHub 404 JSON body must never be mistaken for an existing tag');
  assert.match(emulatorWorkflow, /inputs\.publish_preview == true/);
  assert.doesNotMatch(
    emulatorWorkflow,
    /gh run list|run-id: \$\{\{ steps\.build/,
    "the test must not fetch a separate build run",
  );
  assert.doesNotMatch(
    workflow.match(
      /  push:\n    branches:\n([\s\S]*?)(?=\n  workflow_call:)/,
    )?.[1] || "",
    /arena\/7142700d-melodix/,
    "the test branch must not auto-build a second APK in a separate run",
  );

  const installTarget = emulatorWorkflow.indexOf(
    "name: Install and launch the verified Preview APK",
  );
  const buildHarness = emulatorWorkflow.indexOf(
    "name: Build signed Android UI integration instrumentation APK",
  );
  const runHarness = emulatorWorkflow.indexOf(
    "name: Run Android login, empty-Home, Home-status and Web Home /app instrumentation",
  );
  const resumedCheck = emulatorWorkflow.indexOf(
    "name: Verify activity resumed after Android instrumentation",
  );
  const coldLaunchInspection = emulatorWorkflow.indexOf(
    "name: Inspect the preserved cold-launch hierarchy and pixels",
  );
  const releaseCandidateSmoke = emulatorWorkflow.indexOf(
    "name: Install and cold-launch the exact non-debuggable release candidate",
  );
  const summary = emulatorWorkflow.indexOf(
    "name: Add verified run details to the summary",
  );
  const evidenceUpload = emulatorWorkflow.indexOf(
    "name: Upload verified screenshot and redacted launch summary",
  );
  const publishCandidate = emulatorWorkflow.indexOf(
    "name: Publish the exact validated Preview release candidate",
  );
  const releaseCandidateSmokeBlock = emulatorWorkflow.slice(releaseCandidateSmoke, summary);
  assert.match(releaseCandidateSmokeBlock, /release_smoke_failure_diagnostics\(\)[\s\S]*?trap release_smoke_failure_diagnostics EXIT/);
  assert.match(releaseCandidateSmokeBlock, /am start -W[\s\S]*?sleep 15[\s\S]*?pidof -s com\.melodix\.music\.preview/,
    'the exact candidate gets a bounded settle interval after Android has confirmed activity launch');
  assert.doesNotMatch(releaseCandidateSmokeBlock, /sleep 60/,
    'the separate final-candidate smoke does not hold the emulator process for an unnecessary extra minute');
  assert.ok(
    installTarget >= 0 &&
      buildHarness > installTarget &&
      runHarness > buildHarness,
    "install the Preview APK as the main app before compiling/running the harness",
  );
  assert.ok(
    resumedCheck > runHarness &&
      coldLaunchInspection > resumedCheck &&
      releaseCandidateSmoke > coldLaunchInspection &&
      summary > releaseCandidateSmoke &&
      evidenceUpload > summary &&
      publishCandidate > evidenceUpload,
    "finish fixture instrumentation, cold-launch the exact release candidate, then publish only after evidence upload succeeds",
  );
  const launchBlock = emulatorWorkflow.slice(installTarget, buildHarness);
  assert.doesNotMatch(
    launchBlock,
    /inspect_hierarchy\.py login/,
    "a cold-launch hierarchy failure must not suppress compilation or execution of the Android harness",
  );
  assert.match(
    emulatorWorkflow,
    /name: Verify activity resumed after Android instrumentation\n        id: post-instrumentation\n        if: always\(\) && steps\.launch\.outcome == 'success'/,
    "activity resumption is checked even when instrumentation fails",
  );
  assert.match(
    emulatorWorkflow,
    /adb install "\$APK_PATH"[\s\S]*?adb shell pm clear com\.melodix\.music\.preview[\s\S]*?permission-prompt-summary\.json[\s\S]*?adb shell input tap "\$allow_center_x" "\$allow_center_y"[\s\S]*?read_bluetooth_permission_state[\s\S]*?adb install -r "\$TEST_APK"/,
    "install and clear the exact APK, accept only the observed Android permission control, then install the test-only harness",
  );
  assert.match(emulatorWorkflow, /read_bluetooth_permission_state\(\)[\s\S]*?dumpsys package com\.melodix\.music\.preview[\s\S]*?BLUETOOTH_CONNECT:[\s\S]*?granted=true/,
    "the test verifies the observed runtime permission through package-manager state rather than an unsupported shell command");
  assert.doesNotMatch(emulatorWorkflow, /pm check-permission/,
    "Android 16 permission verification must not call the unsupported pm subcommand");
  assert.match(emulatorWorkflow, /permission-before-grant\.xml[\s\S]*?permission-prompt-summary\.json[\s\S]*?permission_allow_center_x_px[\s\S]*?adb shell input tap/,
    "the first-launch permission surface is recorded as redacted metadata before tapping its observed Allow control");
  assert.match(emulatorWorkflow, /safe_statuses=.*failure_phase.*failure_type/,
    "Android harness failures surface only whitelisted phase/status diagnostics");
  assert.match(emulatorWorkflow, /safe_harness_logs=.*MelodixHarness:/,
    "Android harness crashes are read from a private safe-diagnostics log tag");
  assert.match(emulatorWorkflow, /harness_markers=\$\{safe_harness_logs/,
    "safe harness phase/type markers are included in the failure annotation");
  assert.match(emulatorWorkflow, /framework_statuses=.*result_keys=.*status_keys=.*failure_category=/,
    "framework-level instrumentation failures expose only field names and an allowlisted error category");
  assert.match(emulatorWorkflow, /aapt\" dump xmltree \"\$test_apk\" AndroidManifest\.xml[\s\S]*?HomeRenderInstrumentation[\s\S]*?target_package_declared/,
    "the instrumentation APK's runner and target are validated in the packaged manifest");
  assert.match(emulatorWorkflow, /pm list instrumentation[\s\S]*?expected_runner_registered/,
    "the Android package manager must register the exact installed harness before it is invoked");
  assert.match(emulatorWorkflow, /pm_instrumentation_entries=[\s\S]*?pm_list_unknown_command=[\s\S]*?package_dump_runner_seen=/,
    "registration failures distinguish an empty PM list from unsupported listing and missing package metadata");
  assert.match(emulatorWorkflow, /timeout --signal=TERM --kill-after=10s 180s adb shell am instrument/,
    "a wedged Android instrumentation runner is bounded so post-run activity and hierarchy checks still execute");
  assert.match(emulatorWorkflow, /login_dom_visible=not_confirmed/,
    "missing instrumentation output is not misreported as a negative login DOM observation");
  assert.match(emulatorWorkflow, /login_dom_probe_observed/,
    "the reference distinguishes an observed login result from an absent probe result");
  assert.match(emulatorWorkflow, /focus_state=.*mCurrentFocus/,
    "an activity-resume failure identifies the safe foreground window instead of stopping at a generic error");
  assert.match(
    emulatorWorkflow,
    /login_ui_visible_in_webview_dom=true/,
    "the clean unauthenticated WebView must expose login UI before the recovery transition",
  );
  assert.match(
    emulatorWorkflow,
    /network_error_transition_recovered=true/,
    "the Android run must exercise recovery from the hidden-WebView network-error state",
  );
  assert.match(
    emulatorWorkflow,
    /phase=empty_home_fallback[\s\S]*?home_payload_empty=true[\s\S]*?playlist_or_card_injected=false[\s\S]*?native_home_content_ready=false/,
    "the Home integration uses only an empty payload and must not invent playlist data",
  );
  assert.match(
    emulatorWorkflow,
    /inspect_hierarchy\.py empty-home[\s\S]*?home-empty-fallback\.png/,
    "the final screenshot inspects the WebView pixels after the empty-Home fallback",
  );
  const uploadStep = emulatorWorkflow.slice(
    emulatorWorkflow.indexOf("name: Upload verified screenshot and redacted launch summary"),
  );
  assert.match(uploadStep, /permission-prompt-summary\.json[\s\S]*?login-hierarchy-redacted\.json[\s\S]*?instrumentation-safe-logcat\.txt[\s\S]*?verification-reference\.json/);
  assert.doesNotMatch(uploadStep, /login-window\.xml|home-fallback-window\.xml|permission-before-grant\.xml/,
    "raw UIAutomator hierarchy text is not uploaded");
  assert.match(emulatorWorkflow, /cold_launch_hierarchy_pixels_verified/);
  assert.match(emulatorWorkflow, /login_ui_visible_in_webview_dom/);
  const harnessSource = fs.readFileSync(
    path.resolve(__dirname, "..", "tests/android/HomeRenderInstrumentation.java"),
    "utf8",
  );
  assert.doesNotMatch(
    harnessSource,
    /spotify:playlist:|FIXTURE_JSON|Controlled Home fixture/,
    "the Android harness must not inject or substitute a fake Spotify playlist",
  );
  assert.match(harnessSource, /failurePhase = "await_webview"[\s\S]*?status\.putString\("failure_phase", failurePhase\)/,
    "a failed Android probe identifies the first safe session/WebView/Home phase without logging content");
  assert.match(harnessSource, /login_dom_probe_completed[\s\S]*?login_ui_visible_in_webview_dom[\s\S]*?sendStatus\(1, probeState\)/,
    "a completed false DOM probe is recorded explicitly before the harness fails");
  assert.match(
    workflow,
    /for asset_path in sorted\(path for path in \(root \/ "assets"\)\.rglob\("\*"\) if path\.is_file\(\)\)/,
    "the build manifest hashes every packaged asset, not only generated bundles",
  );
  assert.match(
    workflow,
    /if packaged != runtime:[\s\S]*?Signed APK asset differs from checkout/,
    "each asset inside the signed APK is byte-compared with the exact checkout",
  );
  assert.match(
    emulatorWorkflow,
    /assets\/native_home_fallback\.js[\s\S]*?assets\/runtime_diagnostic\.js/,
    "the exact APK verification requires the changed fallback and diagnostic assets",
  );
  assert.match(
    emulatorWorkflow,
    /Packaged asset does not match the verified manifest/,
    "the emulator job rechecks the artifact manifest against the same APK",
  );
});
