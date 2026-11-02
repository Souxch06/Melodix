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
    'unexpected Android launch termination reports allowlisted component, owner-transition, and crash-stage metadata without raw logs or account content');
  assert.match(emulatorWorkflow, /timeout 15s adb logcat -d -t 2000 -b main -b system -b crash[\s\S]*?grep -cE/,
    'failure reporting stores counts rather than raw logcat or account content');
  assert.match(emulatorWorkflow, /resumed_component=.*dumpsys activity activities[\s\S]*?re\.search\(r"mResumedActivity\|topResumedActivity\|ResumedActivity"/,
    'foreground diagnostics reduce the ActivityManager dump to an allowlisted component name');
  assert.match(emulatorWorkflow, /native_owner_events=.*MDXTRACE:I[\s\S]*?pattern = re\.compile[\s\S]*?native-owner previous=/,
    'native-owner startup traces retain only enumerated owner and route labels');
  assert.match(emulatorWorkflow, /crash_guard_state=.*shared_prefs\/melodix_native\.xml[\s\S]*?last_stage=\%s; crash_class=\%s; verify_error_target=\%s/,
    'crash-guard diagnostics expose only a constrained stage, exception class, and verifier identifiers');
  assert.match(emulatorWorkflow, /target_class = values\.get\("last_verify_class"\)[\s\S]*?target_method = values\.get\("last_verify_method"\)[\s\S]*?re\.fullmatch[\s\S]*?target = "class=%s; method=%s"/,
    'runtime verifier metadata is accepted only when class and method match the strict identifier allowlist');
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

test("Android 16 emulator keeps a bounded userdata partition so CI can boot within runner disk limits", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github/workflows/test-preview-emulator.yml"),
    "utf8",
  );
  const createAt = emulatorWorkflow.indexOf("avdmanager create avd");
  const bootAt = emulatorWorkflow.indexOf("name: Boot a clean Android 16 emulator");
  assert.ok(createAt >= 0 && bootAt > createAt, "create and configure the Android 16 AVD before booting it");
  const avdSetup = emulatorWorkflow.slice(createAt, bootAt);
  assert.match(avdSetup, /avd_config="\$HOME\/\.android\/avd\/MelodixApi36\.avd\/config\.ini"/);
  assert.match(avdSetup, /disk\.dataPartition\.size=4G/);
  assert.match(avdSetup, /grep -qx 'disk\.dataPartition\.size=4G' "\$avd_config"/);
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
  assert.match(harness, /awaitNativeHomeErrorReady\(activity\)[\s\S]*?fallbackState\[0\] = inspectEmptyHomeNativeError[\s\S]*?sendStatus\(1, fallbackState\[0\]\)[\s\S]*?captureEmptyHomeUiEvidence\(\)/,
    "the measured native empty-Home error state is emitted explicitly for the workflow's required-status check");
  assert.match(harness, /serviceInfo\.flags = AccessibilityServiceInfo\.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS[\s\S]*?FLAG_REPORT_VIEW_IDS[\s\S]*?automation\.setServiceInfo\(serviceInfo\)/);
  assert.match(harness, /automation\.getRootInActiveWindow\(\)/);
  assert.match(harness, /automation\.takeScreenshot\(\)/);
  assert.match(harness, /for \(int attempt = 0; attempt < 3 && root == null; attempt\+\+\)[\s\S]*?phasePrefix \+ "_get_hierarchy"[\s\S]*?for \(int attempt = 0; attempt < 3 && screenshot == null; attempt\+\+\)[\s\S]*?phasePrefix \+ "_take_screenshot"/);
  assert.match(emulatorWorkflow, /safe_harness_logs=.*phase=\[a-z_\]\+/);
  assert.match(harness, /appendXmlAttribute\(xml, "bounds", bounds\.toShortString\(\)\)/);
  assert.doesNotMatch(harness, /bounds\.flattenToString\(\)/);
  assert.match(harness, /captureEmptyHomeUiEvidence\(\)[\s\S]*?captureUiEvidence\("melodix-preview-home-empty\.xml", "melodix-preview-home-native-error\.png"/);
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
  assert.match(harness, /cold_start_native_home_visibility[\s\S]*?cold_start_native_owner_verified/);
  assert.match(harness, /revealLoginWebUi[\s\S]*?nativeLoginWebRequested[\s\S]*?verifyLoginSpaExitBeforeHomeFixture/);
  assert.match(harness, /login_spa_exit_probe_performed[\s\S]*?login_spa_exit_observed[\s\S]*?login_route_still_login_only/);
  assert.match(harness, /captureNativeHomeTimeline[\s\S]*?200L, 1000L, 3000L, 8000L, 20000L[\s\S]*?captureUiEvidence\(hierarchyName, screenshotName/);
  assert.match(emulatorWorkflow, /for timeline_phase in cold_home empty_home[\s\S]*?for checkpoint in 200ms 1s 3s 8s 20s[\s\S]*?inspect_hierarchy\.py/);
  assert.match(emulatorWorkflow, /cold-home-timeline-\*\.png[\s\S]*?empty-home-timeline-\*-hierarchy-redacted\.json/);
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
  assert.match(emulatorWorkflow, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-home-empty\.xml/);
  assert.match(emulatorWorkflow, /adb exec-out run-as com\.melodix\.music\.preview cat files\/melodix-preview-home-native-error\.png/);
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
    "adb exec-out run-as com.melodix.music.preview cat files/melodix-preview-home-native-error.png",
  );
  const targetRelaunch = emulatorWorkflow.indexOf(
    "adb shell am start -W -n com.melodix.music.preview/com.melodix.music.MainActivity",
    screenshotRetrieved,
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

test("Android verifies native ownership across route callbacks, returns, late callbacks, and delayed visibility watchers", () => {
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  const inspector = fs.readFileSync(
    path.resolve(__dirname, "android", "inspect_hierarchy.py"),
    "utf8",
  );
  const workflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github/workflows/test-preview-emulator.yml"),
    "utf8",
  );
  const matrix = harness.split("private Bundle verifyNativeRouteOwnerMatrix")[1]
    .split("private void captureNativeHomeTimeline")[0];
  for (const route of ["home", "search", "library", "detail", "player", "detail_return", "player_return", "late_callback_watchdog"]) {
    assert.ok(matrix.includes('"' + route + '"'), "the bounded owner matrix includes " + route);
  }
  assert.match(workflow, /for route_snapshot in home search library detail detail_return player player_return late_callback_watchdog[\s\S]*?native_route_\$\{route_snapshot\}_owner_verified/,
    "the workflow requires a measured owner result for each named route snapshot");
  assert.match(workflow, /native_route_\$\{route_snapshot\}_webview_parent_is_container=true/,
    "every route snapshot requires a runtime assertion that the primary WebView is a direct child of webViewContainer");
  assert.match(harness, /webView\.getParent\(\) == webContainer/,
    "native route ownership checks use the exact parent, not merely a non-null ViewParent");
  assert.match(workflow, /INSTRUMENTATION_STATUS: login_surface_restored_after_native_route_matrix=true/);
  assert.match(workflow, /safe_statuses=.*login_surface_restored_after_native_route_matrix/);
  assert.match(workflow, /"login_surface_restored": status_bool\("login_surface_restored_after_native_route_matrix"\)/,
    "the redacted CI summary records the explicit login restoration after the native-only route matrix");
  assert.match(matrix, /onNativeUiRoute[\s\S]*?onNativeBackClick[\s\S]*?showNativeUiFrom/,
    "the matrix exercises real bridge route callbacks, native back actions, and the actual visibility callback entry point");
  assert.match(matrix, /clearLoginOwnerForNativeFixture\(activity\)[\s\S]*?runNativeRouteOwnerMatrix\(activity, webView, originalUrl\)[\s\S]*?restoreExplicitLoginSurfaceAfterNativeRouteMatrix\(activity, webView, originalUrl\)[\s\S]*?login_surface_restored_after_native_route_matrix/,
    "the route-only fixture temporarily clears the explicit login gate and then verifies the original login surface is restored");
  assert.match(matrix, /dispatchEmptyHomeThroughAndBridgeOnMain\(activity\)/,
    "empty Home route payload callbacks are dispatched from Android's UI thread");
  assert.match(matrix, /Thread\.sleep\(1250L\)[\s\S]*?awaitLoginUiVisible\(webView\)/,
    "delayed callbacks and visibility watchers must leave the explicitly restored login surface visible too");
  const emptyHomeMainDispatchStart = harness.indexOf("private void dispatchEmptyHomeThroughAndBridgeOnMain(");
  const emptyHomeMainDispatchEnd = harness.indexOf("private void dispatchEmptyHomeThroughAndBridge(", emptyHomeMainDispatchStart);
  const emptyHomeMainDispatch = harness.slice(emptyHomeMainDispatchStart, emptyHomeMainDispatchEnd);
  assert.match(emptyHomeMainDispatch, /runOnMainSync\(new Runnable\(\)[\s\S]*?dispatchEmptyHomeThroughAndBridge\(activity\)/,
    "bridge dispatch cannot call the primary WebView's login-path gate from the instrumentation thread");
  assert.match(matrix, /latePageFinished\.invoke[\s\S]*?routeCallback\.invoke[\s\S]*?Thread\.sleep\("late_callback_watchdog"\.equals\(snapshot\) \? 800L/,
    "a late page-finished request is followed by a route change and the delayed visibility watcher is allowed to fire");
  assert.match(matrix, /rootCoversCenter[\s\S]*?rootCoversDock[\s\S]*?frontmostFullscreenSurface[\s\S]*?requireUnauthenticatedSession/,
    "each snapshot measures the native root above the center and dock while retaining the same mounted, unauthenticated WebView");
  assert.match(matrix, /snapshot\.replace\('_', '-'\)[\s\S]*?captureUiEvidence/);
  assert.match(matrix, /native_route_" \+ snapshot \+ "_owner_verified/);
  assert.doesNotMatch(matrix, /safeSpotifyUrl|putString\("[^"]*(?:url|uri)|spotify:playlist:|Bearer\s+[A-Za-z0-9._-]+/i,
    "route telemetry never serializes a URL, token, or playlist payload");
  assert.match(inspector, /"native-route"[\s\S]*?native_route_root_bounds_have_no_rendered_screenshot_pixels/,
    "native-route screenshots require a visible shell root and rendered pixels rather than a synthetic fixture");
  assert.match(workflow, /for route_snapshot in home search library detail detail_return player player_return late_callback_watchdog[\s\S]*?inspect_hierarchy\.py native-route[\s\S]*?native_route_matrix_pixels_verified/,
    "all native route transitions are copied, inspected, and aggregated before the artifact is accepted");
  const upload = workflow.slice(workflow.indexOf("name: Upload verified screenshot and redacted launch summary"));
  assert.match(upload, /native-route-\*\.png[\s\S]*?native-route-\*-hierarchy-redacted\.json/);
  assert.doesNotMatch(upload, /native-route-\*-window\.xml/,
    "raw route hierarchy XML is not published as an artifact");
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
  assert.match(fixture, /card-subtitle[\s\S]*?Fixture-only playlist subtitle[\s\S]*?card-subtitle[\s\S]*?Fixture-only album subtitle/,
    "the test-only renderer fixture supplies subtitle text so its computed colors are measured too");
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
  const rendererProbeStart = harness.indexOf("private static final String WEB_HOME_RENDERER_DIAGNOSTIC_PROBE");
  const rendererProbeEnd = harness.indexOf("@Override", rendererProbeStart);
  const rendererProbe = harness.slice(rendererProbeStart, rendererProbeEnd);
  assert.ok(rendererProbeStart >= 0 && rendererProbeEnd > rendererProbeStart,
    "the synthetic renderer probe is isolated from the live authenticated-home probe");
  assert.match(rendererProbe, /main_view_present[\s\S]*?raw_anchor_count[\s\S]*?root_resource_count[\s\S]*?source_card_count[\s\S]*?decision_rendered_status[\s\S]*?decision_styles_not_ready[\s\S]*?style_probe_home_display_flex[\s\S]*?style_probe_main_hidden/);
  assert.doesNotMatch(rendererProbe, /session_proven|session_proof|decision_session_unproven|profile_control|library_status/,
    "the synthetic fixture probe does not export proof/profile labels or account-state indicators");
  assert.match(harness, /state\.putBoolean\("web_home_probe_fixture_test_only", true\)/,
    "synthetic renderer diagnostic values are explicitly marked fixture-only");
  assert.match(harness, /web_home_probe_diagnostics_available[\s\S]*?web_home_probe_fixture_test_only[\s\S]*?web_home_probe_root_resource_count[\s\S]*?web_home_probe_decision_styles_not_ready[\s\S]*?web_home_probe_style_probe_completed[\s\S]*?web_home_probe_renderer_style_probe_marker_present[\s\S]*?web_home_probe_renderer_style_probe_error[\s\S]*?web_home_probe_style_probe_main_hidden[\s\S]*?web_home_probe_first_card_has_bounds/);
  assert.match(emulatorWorkflow, /safe_statuses=.*web_home_color_probe_\(completed\|error\|error_type\|validation_passed\|validation_summary\).*web_home_\(normal\|loading\|empty\|error\|partial\)_\(state_\(visible\|wcag_aa_pass\|partial_data\|card_count\|library_status\)\|contrast_\[A-Za-z0-9_\]\+\|color_\[A-Za-z0-9_\]\+\).*web_home_probe_diagnostics_available.*web_home_probe_fixture_test_only.*web_home_probe_root_resource_count.*web_home_probe_decision_rendered_status.*web_home_probe_style_probe_completed.*web_home_probe_renderer_style_probe_marker_present.*web_home_probe_renderer_style_probe_error.*web_home_probe_style_probe_main_hidden.*web_home_probe_first_card_has_bounds/);
  assert.match(emulatorWorkflow, /web_home_renderer_probe_renderer_style_probe_marker_present[\s\S]*?status_bool\("web_home_probe_renderer_style_probe_marker_present"\)/);
  assert.match(emulatorWorkflow, /harness_overall_passed=false[\s\S]*?INSTRUMENTATION_STATUS: overall=passed[\s\S]*?harness_overall_passed=true[\s\S]*?safe_statuses=/,
    "a runner can return exit zero after a canceled Activity, so fail from the harness result and retain safe phase diagnostics");
  assert.match(harness, /result\.putBoolean\("authenticated_home_test_performed", false\)/);
  assert.match(harness, /inspectLiveSpotifyCssTheme\(webView\)[\s\S]*?live_webview_css_tokens_valid[\s\S]*?live_webview_home_active/,
    "the existing Spotify WebView is observed directly, without replacing its login content or claiming an authenticated Home");
  assert.match(harness, /cssThemeApplicable = liveCssState\.getBoolean\("live_webview_css_theme_applicable"\)[\s\S]*?live_spotify_host_confirmed[\s\S]*?cssThemeApplicable && !liveCssState\.getBoolean\("live_webview_css_tokens_valid"\)/,
    "player CSS is required on open.spotify.com, but not expected on the separate accounts login origin");
  assert.match(harness, /if \(!highEntropyError\) highEntropyErrorType = "none"/,
    "a successful high-entropy Client Hints request is not mislabeled as an error");
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
  assert.match(harness, /summarizeWebHomeColorProbe[\s\S]*?minRatioName[\s\S]*?state_wcag_aa_pass/,
    "an anonymized per-state status/count/contrast summary remains visible if the WebView fixture fails");
  assert.match(emulatorWorkflow, /safe_home_color_summary[\s\S]*?home_color_summary=\$\{safe_home_color_summary:-none\}/,
    "failure annotations prioritize the compact color diagnostics before large status transcripts");
  assert.match(harness, /retry_button_fill[\s\S]*?statusBackdrops/,
    "the retry button fill and focus ring are compared to the actual status-card backdrop");
  assert.match(emulatorWorkflow, /live_spotify_origin_category=open\.spotify\.com[\s\S]*?live_webview_css_theme_applicable=true[\s\S]*?live_webview_stylesheet_marker_present=true[\s\S]*?live_webview_css_tokens_valid=true[\s\S]*?live_spotify_origin_category=accounts\.spotify\.com[\s\S]*?live_webview_css_theme_applicable=false[\s\S]*?live_webview_css_tokens_valid=false/,
    "player CSS is required on open.spotify.com but correctly marked inapplicable on the separate Spotify accounts origin");
  assert.match(emulatorWorkflow, /INSTRUMENTATION_STATUS: web_home_all_states_wcag_aa_pass=true[\s\S]*?INSTRUMENTATION_STATUS: web_home_partial_state_wcag_aa_pass=true/);
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

test("Android records measured mobile viewport geometry and native system-bar insets in the redacted CI reference", () => {
  const workflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github", "workflows", "test-preview-emulator.yml"),
    "utf8",
  );
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  assert.match(harness, /MOBILE_VIEWPORT_MATRIX_WIDTHS = \{360, 384, 393, 412\}/);
  assert.match(harness, /measureAndroidWindowInsets[\s\S]*?WindowInsets\.Type\.statusBars\(\)[\s\S]*?WindowInsets\.Type\.navigationBars\(\)/,
    "the matrix captures Android system bars independently of CSS safe-area inference");
  assert.match(workflow, /mobile_viewport_\[A-Za-z0-9_\-\]\+\|android_window_insets_available/);
  assert.match(workflow, /C=%s,L=%s,E=%s,inner=%s\/%s\/%s/,
    "the bounded matrix failure annotation should retain per-width failure categories and actual CSS widths");
  for (const field of [
    "mobile_viewport_matrix_fixture_test_only", "mobile_viewport_matrix_measurements_complete",
    "mobile_viewport_layout_contract_passed", "mobile_viewport_width_cases", "android_system_insets",
    "safe_mobile_viewport_statuses", "safe_mobile_viewport_logs", "safe_mobile_viewport_width_summary",
    "status_metric", "status_codes", "mobile_matrix_failure_phase"
  ]) {
    assert.ok(workflow.includes(field), `the safe run summary should retain ${field}`);
  }
  assert.match(workflow, /for width in \(360, 384, 393, 412\)/,
    "the machine-readable verification reference must retain every requested width");
  assert.match(workflow, /Android WebView viewport matrix \(fixture-only, no Spotify account data\)/,
    "the human run summary must separate layout measurements from an authenticated Spotify Home test");
  assert.match(workflow, /mobile_viewport_layout_contract_passed.*?status_bool\("mobile_viewport_layout_contract_passed"\)/s);
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
  assert.match(emulatorWorkflow, /sdk_package_paths=\([\s\S]*?for package_index in "\$\{!sdk_packages\[@\]\}"[\s\S]*?if \[\[ -s "\$sdk_path" \]\][\s\S]*?for attempt in 1 2 3[\s\S]*?timeout 120s sdkmanager --install "\$sdk_package" >"\$sdk_log" 2>&1[\s\S]*?sdk_failure_class[\s\S]*?Android SDK package unavailable/,
    "Android SDK installs are package-scoped, skip verified installed files, retry transient failures, and report only safe error classes");
  assert.doesNotMatch(emulatorWorkflow, /cat "\$sdk_log"|tail .*"\$sdk_log"/,
    "SDK-manager logs containing repository URLs or runner details are never printed raw");
  assert.match(
    emulatorWorkflow,
    /adb install "\$APK_PATH"[\s\S]*?adb shell pm clear com\.melodix\.music\.preview[\s\S]*?permission-prompt-summary\.json[\s\S]*?adb shell input tap "\$allow_center_x" "\$allow_center_y"[\s\S]*?read_bluetooth_permission_state[\s\S]*?adb install -r "\$TEST_APK"/,
    "install and clear the exact APK, prefer only the observed Android permission control, then install the test-only harness",
  );
  assert.match(launchBlock, /explicit_adb_grant_without_observed_allow_control[\s\S]*?adb shell pm grant com\.melodix\.music\.preview android\.permission\.BLUETOOTH_CONNECT[\s\S]*?only the declared Bluetooth permission granted/,
    "when the emulator exposes no usable Allow control, only the declared BLUETOOTH_CONNECT permission is granted explicitly and reported truthfully");
  assert.equal(
    (launchBlock.match(/adb shell am start -W -n com\.melodix\.music\.preview\/com\.melodix\.music\.MainActivity/g) || []).length,
    2,
    "the permission observation and cold launch use deterministic explicit Activity starts instead of random monkey input",
  );
  assert.match(emulatorWorkflow, /read_bluetooth_permission_state\(\)[\s\S]*?dumpsys package com\.melodix\.music\.preview[\s\S]*?BLUETOOTH_CONNECT:[\s\S]*?granted=true/,
    "the test verifies the observed runtime permission through package-manager state rather than an unsupported shell command");
  assert.doesNotMatch(emulatorWorkflow, /pm check-permission/,
    "Android 16 permission verification must not call the unsupported pm subcommand");
  assert.match(emulatorWorkflow, /permission-before-grant\.xml[\s\S]*?permission-prompt-summary\.json[\s\S]*?permission_allow_center_x_px[\s\S]*?adb shell input tap/,
    "the first-launch permission surface is recorded as redacted metadata before tapping its observed Allow control");
  assert.match(emulatorWorkflow, /safe_statuses=.*failure_phase.*failure_type/,
    "Android harness failures surface only whitelisted phase/status diagnostics");
  assert.match(emulatorWorkflow, /allowed = \{"phase", "failure_phase", "failure_type", "overall"\}[\s\S]*?completion_statuses=\$\{safe_completion_statuses:-none\}[\s\S]*?instrumentation_code=\$\{instrumentation_code:-none\}[\s\S]*?status_codes=\$\{instrumentation_status_codes:-none\}/,
    "failed instrumentation includes only allowlisted terminal state, numeric result codes, and phase/type values");
  assert.match(emulatorWorkflow, /safe_harness_logs=.*MelodixHarness:/,
    "Android harness crashes are read from a private safe-diagnostics log tag");
  assert.match(emulatorWorkflow, /harness_markers=\$\{safe_harness_logs/,
    "safe harness phase/type markers are included in the failure annotation");
  assert.match(emulatorWorkflow, /framework_statuses=.*result_keys=.*status_keys=.*failure_category=/,
    "framework-level instrumentation failures expose only field names and an allowlisted error category");
  assert.match(emulatorWorkflow, /aapt\" dump xmltree \"\$test_apk\" AndroidManifest\.xml[\s\S]*?HomeRenderInstrumentation[\s\S]*?target_package_declared/,
    "the instrumentation APK's runner and target are validated in the packaged manifest");
  assert.match(emulatorWorkflow, /test_apk_sha256=\"\$\(sha256sum \"\$test_apk\"[\s\S]*?::notice title=Android test-only instrumentation APK::source=\$SOURCE_REF; package=com\.melodix\.music\.preview\.test; target=com\.melodix\.music\.preview; sha256=\$test_apk_sha256[\s\S]*?GITHUB_STEP_SUMMARY/,
    "the separately signed harness APK hash is surfaced in the run annotation and summary");
  assert.match(emulatorWorkflow, /pm list instrumentation[\s\S]*?expected_runner_registered/,
    "the Android package manager must register the exact installed harness before it is invoked");
  assert.match(emulatorWorkflow, /pm_instrumentation_entries=[\s\S]*?pm_list_unknown_command=[\s\S]*?package_dump_runner_seen=/,
    "registration failures distinguish an empty PM list from unsupported listing and missing package metadata");
  assert.match(emulatorWorkflow, /timeout --signal=TERM --kill-after=10s 300s adb shell am instrument/,
    "a wedged Android instrumentation runner is bounded while allowing both timed native-owner evidence series");
  assert.match(emulatorWorkflow, /login_dom_visible=not_confirmed/,
    "missing instrumentation output is not misreported as a negative login DOM observation");
  assert.match(emulatorWorkflow, /login_dom_probe_observed/,
    "the reference distinguishes an observed login result from an absent probe result");
  assert.match(emulatorWorkflow, /focus_state=.*mCurrentFocus/,
    "an activity-resume failure identifies the safe foreground window instead of stopping at a generic error");
  assert.match(
    emulatorWorkflow,
    /phase=cold_start_native_home_status[\s\S]*?cold_start_native_owner_verified=true[\s\S]*?phase=login_without_session[\s\S]*?explicit_login_owner_requested=true[\s\S]*?login_spa_exit_probe_performed=true/,
    "the cold Home owner is verified before the explicit login-route probe runs",
  );
  assert.match(emulatorWorkflow, /login_spa_exit_observed" == "true" && "\$login_route_still_login_only" == "false"[\s\S]*?login_spa_exit_observed" == "false" && "\$login_route_still_login_only" == "true"/,
    "CI accepts either a confirmed SPA exit or an explicitly preserved login-only route, without assuming either path" );
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
    /phase=empty_home_native_error_state[\s\S]*?home_payload_empty=true[\s\S]*?playlist_or_card_injected=false[\s\S]*?native_home_error_message_visible=true[\s\S]*?native_home_retry_action_clickable=true[\s\S]*?native_root_is_foremost_surface=true[\s\S]*?webview_mounted_under_native_root=true[\s\S]*?webview_parent_is_container=true/,
    "the Home integration uses only an empty payload and verifies a measured native error/retry surface over the mounted WebView",
  );
  assert.match(
    emulatorWorkflow,
    /inspect_hierarchy\.py empty-home[\s\S]*?home-empty-native-error\.png[\s\S]*?home-empty-native-error-hierarchy-redacted\.json/,
    "the final screenshot inspects native error/retry pixels and the safe hierarchy after empty Home",
  );
  const uploadStep = emulatorWorkflow.slice(
    emulatorWorkflow.indexOf("name: Upload verified screenshot and redacted launch summary"),
  );
  assert.match(uploadStep, /permission-prompt-summary\.json[\s\S]*?cold-home-hierarchy-redacted\.json[\s\S]*?instrumentation-safe-logcat\.txt[\s\S]*?verification-reference\.json/);
  assert.doesNotMatch(uploadStep, /cold-home-window\.xml|home-empty-native-error-window\.xml|permission-before-grant\.xml/,
    "raw UIAutomator hierarchy text is not uploaded");
  assert.match(emulatorWorkflow, /inspect_hierarchy\.py home-status[\s\S]*?cold-home-window\.xml[\s\S]*?cold-home-hierarchy-redacted\.json/,
    "the preserved cold-launch screenshot is verified as the native Home status surface");
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

test("summary-generation failures report safe phases and discard raw Python diagnostics", () => {
  const workflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github", "workflows", "test-preview-emulator.yml"),
    "utf8",
  );
  const summaryStart = workflow.indexOf("name: Add verified run details to the summary");
  const summaryEnd = workflow.indexOf(
    "name: Upload verified screenshot and redacted launch summary",
    summaryStart,
  );
  assert.ok(summaryStart >= 0 && summaryEnd > summaryStart);
  const summary = workflow.slice(summaryStart, summaryEnd);

  assert.match(summary, /set -euo pipefail[\s\S]*?trap summary_failure ERR[\s\S]*?exec 2>\/dev\/null/);
  for (const phase of [
    "collect_status",
    "write_step_markdown",
    "write_reference_json",
    "append_hierarchy_summary",
    "append_css_summary",
    "emit_safe_outcomes",
  ]) {
    assert.ok(summary.includes(`summary_phase=${phase}`), `summary step marks ${phase}`);
  }
  assert.equal((summary.match(/if python3 - /g) || []).length, 3);
  assert.equal((summary.match(/2>\/dev\/null/g) || []).length, 4);
  const hierarchySummaryStart = summary.indexOf("summary_phase=append_hierarchy_summary");
  const hierarchySummaryEnd = summary.indexOf("summary_phase=append_css_summary", hierarchySummaryStart);
  const hierarchySummary = summary.slice(hierarchySummaryStart, hierarchySummaryEnd);
  assert.match(hierarchySummary, /timeline_hierarchies = \[[\s\S]*?is_file\(\)[\s\S]*?\]/);
  assert.match(hierarchySummary, /for filename, title in \[[\s\S]*?\] \+ \[/);
  assert.equal((summary.match(/python_stderr=discarded/g) || []).length, 3);
  assert.match(summary, /raw_diagnostics=discarded/);
  assert.doesNotMatch(summary, /summary_python_stderr|cat .*stderr|tail .*stderr|traceback/);
});

test("login-surface reflection failures expose only the bounded target exception class", () => {
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  assert.ok(harness.includes("private static Throwable unwrapInvocationTarget(Throwable failure) {"));
  assert.ok(harness.includes("for (int depth = 0; depth < 4 && current instanceof InvocationTargetException; depth++)"),
    "only a bounded chain of reflection wrappers is unwrapped");
  assert.ok(harness.includes("loginFailure[0] = unwrapInvocationTarget(error);"),
    "the login surface probe reports the target exception class instead of the generic reflection wrapper");
  const shellFixture = harness.indexOf("shellFixtureHolder[0] = createNativeUiShellHandoffFixture(activity);");
  const shellGateClear = harness.indexOf("clearLoginOwnerForNativeFixture(activity);", shellFixture);
  const shellInstall = harness.indexOf("installPackagedNativeUiShell(shellFixtureHolder[0], activity);", shellGateClear);
  const shellLoginRestore = harness.indexOf("requestExplicitLoginWebUi(activity);", shellInstall);
  assert.ok(shellFixture >= 0 && shellGateClear > shellFixture && shellInstall > shellGateClear && shellLoginRestore > shellInstall,
    "the isolated status-only shell fixture temporarily clears, then restores, only the explicit login UI gate");
  const gateHelperStart = harness.indexOf("private void clearLoginOwnerForNativeFixture(");
  const gateHelperEnd = harness.indexOf("private boolean verifyLoginSpaExitBeforeHomeFixture(", gateHelperStart);
  const gateHelper = harness.slice(gateHelperStart, gateHelperEnd);
  assert.ok(gateHelper.includes("runOnMainSync(new Runnable()") &&
    gateHelper.includes('getDeclaredField("nativeLoginWebRequested")') &&
    gateHelper.includes("getBoolean(activity)") &&
    gateHelper.includes("setBoolean(activity, false)"),
    "the test-only login gate change is performed on Android's main thread without navigating the WebView and requires explicit login ownership");
  assert.ok(harness.includes("Throwable reportableFailure = unwrapInvocationTarget(failure);"),
    "the top-level result also unwraps bounded reflection wrappers from the main-thread dispatcher");
  const spaProbeStart = harness.indexOf("private boolean verifyLoginSpaExitBeforeHomeFixture(");
  const spaProbeEnd = harness.indexOf("private void dispatchHomeStatusThroughAndBridge(", spaProbeStart);
  const spaProbe = harness.slice(spaProbeStart, spaProbeEnd);
  const mainThreadDispatch = spaProbe.indexOf("runOnMainSync(new Runnable()");
  assert.ok(mainThreadDispatch >= 0 &&
    spaProbe.indexOf("pathProbe.invoke(activity)") > mainThreadDispatch &&
    spaProbe.indexOf('routeCallback.invoke(activity, "home")') > mainThreadDispatch,
    "WebView route and login-path reflection run on Android's main thread");
  assert.ok(harness.includes('status.putString("failure_type", reportableFailure.getClass().getSimpleName());'),
    "the instrumentation result contains only a safe Java exception class");
  assert.equal(harness.includes(".getMessage("), false, "failure messages are never persisted or shown");
  assert.equal(harness.includes(".printStackTrace("), false, "failure stacks are never persisted or shown");
  assert.equal(harness.includes(".getStackTrace("), false, "failure stacks are never persisted or shown");
});

test("the authenticated-home bundle contains the exact debuggable target, matching signed runner, command, manifest, and long retention", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github/workflows/test-preview-emulator.yml"),
    "utf8",
  );
  const buildRunner = emulatorWorkflow.indexOf("name: Build signed Android UI integration instrumentation APK");
  const assemble = emulatorWorkflow.indexOf("name: Assemble exact authenticated-home manual test bundle");
  const upload = emulatorWorkflow.indexOf("name: Upload exact authenticated-home manual test bundle");
  const exercise = emulatorWorkflow.indexOf("name: Exercise authenticated-home observer to normal timeout without a session");
  assert.ok(buildRunner >= 0 && assemble > buildRunner && upload > assemble && exercise > upload,
    "build and package the same-run target and runner before publishing/running the observer bundle");
  const runnerBuildBlock = emulatorWorkflow.slice(buildRunner, assemble);
  const bundleBlock = emulatorWorkflow.slice(assemble, exercise);
  assert.match(runnerBuildBlock, /--version-code "\$PREVIEW_VERSION_CODE"[\s\S]*?--version-name "\$PREVIEW_VERSION_NAME"/,
    "the runner is versioned to match the exact Preview APK it instruments");
  assert.match(bundleBlock, /cp "\$PREVIEW_APK" "\$bundle_dir\/\$preview_name"/);
  assert.match(bundleBlock, /runner_name="Melodix-Preview-AuthenticatedHome-Runner-\$\{PREVIEW_VERSION_NAME\}\.apk"/);
  assert.match(bundleBlock, /cp "\$RUNNER_APK" "\$bundle_dir\/\$runner_name"/);
  assert.match(bundleBlock, /apksigner" verify --print-certs "\$PREVIEW_APK"[\s\S]*?apksigner" verify --print-certs "\$RUNNER_APK"[\s\S]*?preview_signer_sha256.*?runner_signer_sha256/,
    "the uploaded pair must have the same verified signing certificate");
  assert.match(bundleBlock, /def apk_info\(name\)[\s\S]*?"sha256": hashlib\.sha256[\s\S]*?"source_commit": source_commit[\s\S]*?"preview_apk"[\s\S]*?"runner_apk"/,
    "the bundle manifest records both packages, versions, hashes, and source commit");
  assert.ok(bundleBlock.includes("adb shell am instrument -w -r -e mode authenticated-home -e timeout_ms 900000 com.melodix.music.preview.test/com.melodix.test.HomeRenderInstrumentation"),
    "the bundle carries the exact Windows-compatible observer command");
  assert.match(bundleBlock, /retention-days: 90/,
    "the manual test bundle remains downloadable long enough for a human session");
  assert.match(emulatorWorkflow, /Publish the exact validated Preview release candidate[\s\S]*?steps\.authenticated-home-ci\.outcome == 'success'/,
    "a public Preview release cannot pass if the observer self-test fails");
  assert.match(emulatorWorkflow, /build-release-candidate:[\s\S]*?target_debuggable: false[\s\S]*?apk_suffix: '-release-candidate'/,
    "the manual debug target does not replace the separate non-debuggable release candidate");
  assert.match(emulatorWorkflow, /authenticated-home-bundle-upload\.outcome == 'success'[\s\S]*?timeout_ms 30000/,
    "CI exercises the observer only after the downloadable bundle has been published");
});

test("Windows manual procedure preserves app data and requires a manually verified real Spotify Home", () => {
  const docs = fs.readFileSync(
    path.resolve(__dirname, "..", "docs", "authenticated-home-observer.md"),
    "utf8",
  );
  const command = "adb shell am instrument -w -r -e mode authenticated-home -e timeout_ms 900000 com.melodix.music.preview.test/com.melodix.test.HomeRenderInstrumentation";
  assert.ok(docs.includes(command), "the exact manual command is documented verbatim");
  assert.match(docs, /Get-FileHash[\s\S]*?manifest\.preview_apk\.sha256[\s\S]*?manifest\.runner_apk\.sha256/);
  assert.match(docs, /adb install -r "\$previewApk"[\s\S]*?adb shell monkey[\s\S]*?se connecter elle-même[\s\S]*?adb install -r "\$runnerApk"/,
    "the exact debug Preview is installed first, the user signs in manually, and only then is the separate runner installed");
  assert.match(docs, /N'exécute pas[\s\S]*?adb uninstall[\s\S]*?pm clear[\s\S]*?Effacer les données/,
    "the procedure explicitly forbids clearing or uninstalling the app");
  assert.match(docs, /version supérieure non débogable[\s\S]*?N'essaie pas de désinstaller[\s\S]*?émulateur Android dédié/,
    "a version downgrade/incompatibility is handled by using a dedicated emulator, not by erasing a user's session");
  assert.match(docs, /authenticated_home_test_performed=true[\s\S]*?real_library_playlist_observed=true[\s\S]*?home_route=true/,
    "the document requires a real playlist result and Home route without exporting a session-proof flag");
  assert.match(docs, /library_fetch_http_status[\s\S]*?library_fetch_mime[\s\S]*?library_fetch_phase[\s\S]*?library_fetch_duration_ms[\s\S]*?library_fetch_error/,
    "the manual procedure limits private-library diagnostics to allowlisted response metadata");
  assert.doesNotMatch(docs, /session_proof_source|authenticated_session=true|library_fetch_received_count|library_fetch_transformed_count|library_fetch_proof|library_fetch_page_signal|safe_url|playlist_count/,
    "the procedure does not instruct users to export proof indicators, URLs, or private-content counts");
});

test("the authenticated-home observer preserves the primary WebView, observes callbacks, restores Window.Callback, and redacts diagnostics", () => {
  const emulatorWorkflow = fs.readFileSync(
    path.resolve(__dirname, "..", ".github", "workflows", "test-preview-emulator.yml"),
    "utf8",
  );
  const harness = fs.readFileSync(
    path.resolve(__dirname, "android", "HomeRenderInstrumentation.java"),
    "utf8",
  );
  const observerStart = harness.indexOf("private void runAuthenticatedHomeObservation(");
  const observerEnd = harness.indexOf("private String joinSafeRoutes(", observerStart);
  assert.ok(observerStart >= 0 && observerEnd > observerStart, "the opt-in passive observer implementation exists");
  const observer = harness.slice(observerStart, observerEnd);
  assert.match(observer, /awaitStableWebView\(activity\)[\s\S]*?findWebView\(sampleActivity\)[\s\S]*?evaluateJavascriptAndWait\([\s\S]*?currentWebView\[0\]/,
    "the observer samples the existing primary WebView rather than substituting a fixture");
  assert.doesNotMatch(observer, /new WebView\s*\(|\.loadUrl\s*\(|CookieManager|removeAllCookies|setCookie\s*\(|clearCache|clearHistory|clearFormData|\.click\s*\(/,
    "the authenticated observer cannot create or navigate a WebView, click controls, or manipulate cookies/storage");
  const preservingLaunchStart = harness.indexOf("private Activity launchTargetPreservingTask(");
  const preservingLaunchEnd = harness.indexOf("private long authenticatedHomeTimeoutMs(", preservingLaunchStart);
  const preservingLaunch = harness.slice(preservingLaunchStart, preservingLaunchEnd);
  assert.match(preservingLaunch, /FLAG_ACTIVITY_NEW_TASK \| Intent\.FLAG_ACTIVITY_SINGLE_TOP/);
  assert.doesNotMatch(preservingLaunch, /FLAG_ACTIVITY_CLEAR_TASK/,
    "bringing the existing MainActivity forward does not clear its task or session");
  assert.match(harness, /registerActivityLifecycleObservation\(\)[\s\S]*?registerActivityLifecycleCallbacks\(activityLifecycleObserver\)/);
  assert.match(harness, /unregisterActivityLifecycleObservation\(\)[\s\S]*?unregisterActivityLifecycleCallbacks\(activityLifecycleObserver\)/);
  assert.match(harness, /method\.invoke\(original, args\)[\s\S]*?restoreBackKeyObservationOnMain\(\)[\s\S]*?window\.setCallback\(original\)/,
    "the observer delegates key events and restores the original Window.Callback");
  assert.match(observer, /activity_lifecycle_observer_unregistered[\s\S]*?window_callback_observer_installed[\s\S]*?window_callback_observer_restored/);
  assert.match(observer, /observation_deadline_reached[\s\S]*?observation_timeout_ms_capped/);
  assert.doesNotMatch(observer, /safeSpotifyUrl|safe_url|initial_safe_url|url_query_and_fragment_redacted|putString\([^\n]*url/i,
    "the observer never serializes even a normalized WebView URL");
  const probeStart = harness.indexOf("private static final String AUTHENTICATED_HOME_PROBE");
  const probeEnd = harness.indexOf("private static final String MOBILE_VIEWPORT_LAYOUT_", probeStart);
  const authProbe = harness.slice(probeStart, probeEnd);
  assert.ok(probeStart >= 0 && probeEnd > probeStart, "the real-session probe is defined");
  assert.match(authProbe, /__sfMediaLibLastDiagnostic[\s\S]*?library_fetch_http_status[\s\S]*?library_fetch_mime[\s\S]*?library_fetch_duration_ms[\s\S]*?library_fetch_error/,
    "the passive observer returns only allowlisted HTTP status, response type, phase, duration, and sanitized error data");
  assert.match(authProbe, /real_library_playlist_observed:libraryPlaylistObserved/,
    "a real playlist is represented only by a presence boolean rather than private content or counts");
  assert.doesNotMatch(authProbe, /session_proven|session_proof_source|profile_control|safe_url|library_fetch_received_count|library_fetch_transformed_count|library_fetch_proof|library_fetch_page_signal|raw_library_item|playlist_count|fetch\s*\(|CookieManager|cookie|authorization|access_token|refresh_token/,
    "the serialized probe excludes session/profile flags, routes/URLs, private counts, bodies, and credentials");
  const inspectionStart = harness.indexOf("private Bundle inspectAuthenticatedHome(");
  const inspectionEnd = harness.indexOf("private boolean readBooleanSafely(", inspectionStart);
  const inspection = harness.slice(inspectionStart, inspectionEnd);
  assert.doesNotMatch(inspection, /session_proven|session_proof_source|profile_control|safe_url|initial_safe_url|library_fetch_received_count|library_fetch_transformed_count|library_fetch_proof|library_fetch_page_signal|real_library_.*count_capped|raw_library_item_count|real_home_.*count_capped|native_home_rows_count/,
    "the Android status Bundle excludes proof/profile fields, URLs, and private-content counters");
  assert.match(harness, /safeLibraryFetchError\(probe\.optString\("library_fetch_error", "unavailable"\),[\s\S]*?fetchDiagnosticAvailable, fetchPhase, fetchHttpStatus\)/,
    "the Android Bundle revalidates HTTP error categories against diagnostic availability, response phase, and status");
  assert.match(harness, /safeLibraryErrorWithFetchEvidence[\s\S]*?httpStatus != 401[\s\S]*?httpStatus != 403/,
    "401/403 UI error labels are emitted only when phase and response status agree");
  const rendererDecisionStart = harness.indexOf("private String safeRendererDecision(");
  const rendererDecisionEnd = harness.indexOf("private void runAuthenticatedHomeObservation(", rendererDecisionStart);
  const rendererDecisionFilter = harness.slice(rendererDecisionStart, rendererDecisionEnd);
  assert.match(rendererDecisionFilter, /renderer-inactive/);
  assert.doesNotMatch(rendererDecisionFilter, /session-unproven|session-rejected|profile-control/,
    "Android CI diagnostic decision allowlisting accepts only neutral Home outcomes");
  const handoffStart = harness.indexOf("private Bundle inspectJavascriptHomeHandoff(");
  const handoffEnd = harness.indexOf("private WebView createMobileViewportFixture", handoffStart);
  const handoff = harness.slice(handoffStart, handoffEnd);
  assert.match(harness, /final String shellStateJson = evaluateJavascriptAndWait\(shellFixtureHolder\[0\][\s\S]*?runOnMainSync\(new Runnable\(\)[\s\S]*?inspectJavascriptHomeHandoff\([\s\S]*?shellStateJson/,
    "the fixture evaluates its JavaScript state before entering Android UI-thread inspection");
  assert.match(handoff, /String shellStateJson[\s\S]*?new JSONObject\(shellStateJson\)/);
  assert.doesNotMatch(handoff, /evaluateJavascriptAndWait/,
    "the view inspection never performs a nested instrumentation-thread handoff from the UI thread");
  const handoffOutput = handoff.slice(handoff.indexOf("Bundle state = new Bundle();"));
  assert.match(handoffOutput, /phase", "javascript_home_handoff[\s\S]*?native_shell_handoff_from_packaged_javascript", true[\s\S]*?native_ready_callback_sent", true[\s\S]*?home_status_payload_sent", true[\s\S]*?native_home_status_login_action_clickable", statusLoginActionClickable/,
    "the Android fixture reports status-only shell handoff and a measured clickable child login action");
  assert.match(handoff, /containsClickableText\(statusView, "Se connecter"\)/,
    "the shell-handoff instrumentation inspects the child button rather than the status-card root");
  const actionStart = harness.indexOf("private Bundle exerciseHomeStatusActions(");
  const actionEnd = harness.indexOf("private boolean containsText(", actionStart);
  const actionDispatch = harness.slice(actionStart, actionEnd);
  assert.match(actionDispatch, /performClickOnText\(status, "Réessayer"\)[\s\S]*?__melodixTestRetryActionCount===1/,
    "the manual-retry child button dispatches one isolated retry callback");
  assert.match(actionDispatch, /performClickOnText\(status, "Se connecter"\)[\s\S]*?officialLoginRoute/,
    "the login child button opens the official login route");
  assert.match(actionDispatch, /webView\.getParent\(\) == container[\s\S]*?webView\.loadUrl\(originalUrl\)/,
    "the action test preserves and restores the same mounted WebView");
  assert.doesNotMatch(actionDispatch, /putString\("[^"]*(?:url|uri)[^"]*"/i,
    "the action-test result contains no URL or URI value");
  assert.doesNotMatch(handoffOutput, /put(?:Boolean|Int|Long|String)\("[^"]*(?:session|proof|profile|unproven)[^"]*"/i,
    "handoff output omits proof/session/profile indicators and exposes only measured UI results");
  assert.match(emulatorWorkflow, /phase=javascript_home_handoff[\s\S]*?home_status_payload_sent=true[\s\S]*?native_shell_handoff_from_packaged_javascript=true[\s\S]*?javascript_native_shell_handoff_tested=true[\s\S]*?login_surface_restored_after_javascript_shell_handoff=true/,
    "CI requires the packaged JavaScript handoff and the restored login surface");
  assert.doesNotMatch(emulatorWorkflow, /INSTRUMENTATION_STATUS: (?:authenticated_session|session_proven|session_proof_source|profile_control_(?:present|visible)|web_home_probe_session_proven|web_home_probe_decision_session_unproven)=/,
    "CI does not depend on or publish proof/profile flags in instrumentation statuses");
  assert.match(emulatorWorkflow, /timeout_ms 30000[\s\S]*?overall=blocked_no_home_content_observed[\s\S]*?authenticated_home_test_performed=false[\s\S]*?authenticated_home_test=not_performed/,
    "CI proves the sanitized observer completes normally without claiming a real Home");
  assert.match(emulatorWorkflow, /forbidden session, URL, profile, or private-content diagnostic/,
    "the CI self-test fails closed if a forbidden session, URL, profile, or content-count key reappears");
  assert.match(emulatorWorkflow, /activity_lifecycle_observer_unregistered=true[\s\S]*?window_callback_observer_restored=true[\s\S]*?fatal_or_anr_count/,
    "the emulator self-test checks lifecycle cleanup, callback restoration, and crash/ANR absence");
  assert.match(emulatorWorkflow, /authenticated-home-observer-ci\.txt/,
    "the bounded observer status transcript is retained with the Android diagnostics");
});
