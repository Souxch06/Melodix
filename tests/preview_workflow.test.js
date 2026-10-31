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

test("build-only Preview APK can update test.93 without publishing a tag or release", () => {
  assert.match(
    workflow,
    /build_only:[\s\S]*?default: false[\s\S]*?type: boolean/,
    "reusable build callers must explicitly select build-only behavior",
  );
  assert.match(
    workflow,
    /BUILD_ONLY: \$\{\{ inputs\.build_only \|\| false \}\}[\s\S]*?should_publish='false'[\s\S]*?tag=\"\$INPUT_TAG\"/,
    "same-run emulator builds cannot create a public tag or release",
  );
  assert.match(
    workflow,
    /if \[\[ \"\$BUILD_ONLY\" == \"true\" \]\][\s\S]*?version_code=\$\(\(1020880 \+ GITHUB_RUN_NUMBER\)\)/,
    "the build-only caller counter still yields an installable versionCode above the published baseline",
  );
  assert.match(
    workflow,
    /should_publish='false'[\s\S]*?tag='v1\.2\.2-test\.92-preview'/,
    "push-only build verification keeps the Preview versionCode above the last published APK",
  );
  assert.match(
    workflow,
    /name: Upload APK as workflow artifact[\s\S]*?retention-days: 14/,
    "the APK is available only as a short-lived action artifact",
  );
  assert.match(
    workflow,
    /name: Create preview release and attach APK[\s\S]*?if: steps\.release\.outputs\.should_publish == 'true'/,
    "release creation stays conditional and skipped for build-only runs",
  );
});

test("the emulator workflow builds and tests one Preview APK in the same CI run", () => {
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
  assert.match(
    emulatorWorkflow,
    /install-and-launch:[\s\S]*?needs: build-preview/,
  );
  assert.match(
    emulatorWorkflow,
    /Download the Preview APK built by this same run/,
  );
  assert.match(emulatorWorkflow, /name: Melodix-Preview-v1\.2\.2-test93\.apk/);
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
    "name: Run Android login and empty-Home fallback instrumentation",
  );
  const resumedCheck = emulatorWorkflow.indexOf(
    "name: Verify activity resumed after Android instrumentation",
  );
  const coldLaunchInspection = emulatorWorkflow.indexOf(
    "name: Inspect the preserved cold-launch hierarchy and pixels",
  );
  const summary = emulatorWorkflow.indexOf(
    "name: Add verified run details to the summary",
  );
  assert.ok(
    installTarget >= 0 &&
      buildHarness > installTarget &&
      runHarness > buildHarness,
    "install the Preview APK as the main app before compiling/running the harness",
  );
  assert.ok(
    resumedCheck > runHarness &&
      coldLaunchInspection > resumedCheck &&
      summary > coldLaunchInspection,
    "verify MainActivity resumed after instrumentation, inspect the preserved cold launch, then write the run summary",
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
    /adb install "\$APK_PATH"[\s\S]*?adb install -r "\$TEST_APK"/,
    "the exact same-run APK is installed first, then the test-only harness",
  );
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
  assert.match(uploadStep, /login-hierarchy-redacted\.json[\s\S]*?verification-reference\.json/);
  assert.doesNotMatch(uploadStep, /login-window\.xml|home-fallback-window\.xml/,
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
