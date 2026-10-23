const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const repoRoot = path.resolve(__dirname, '..');
const readRepoFile = (rel) => fs.readFileSync(path.join(repoRoot, rel), 'utf8');

const workflow = readRepoFile('.github/workflows/preview-apk.yml');
const emulatorWorkflow = readRepoFile('.github/workflows/test-preview-emulator.yml');
const assemblyWorkflow = readRepoFile('.github/workflows/validate-android-assembly.yml');
const releaseWorkflow = readRepoFile('.github/workflows/release-apk.yml');

test('Preview workflow requires an explicit full source SHA instead of defaulting to the old baseline', () => {
    const sourceInput = workflow.match(/      source_ref:\n([\s\S]*?)(?=\n\npermissions:)/);
    assert.ok(sourceInput, 'manual source_ref input should exist');
    assert.match(sourceInput[0], /description: Full source commit SHA to build/);
    assert.match(sourceInput[0], /required: true/);
    assert.doesNotMatch(sourceInput[0], /default:/);
    assert.match(workflow, /source_ref must be a full 40-character commit SHA/);
    assert.match(workflow, /if: github\.event_name == 'push' \|\| github\.event_name == 'workflow_dispatch'/);
    assert.match(workflow, /INPUT_SOURCE_REF: \$\{\{ inputs\.source_ref \|\| github\.sha \}\}/);
});

test('CI workflows auto-trigger on any non-main branch push without self-looping or touching releases', () => {
    for (const [name, content] of [
        ['preview-apk.yml', workflow],
        ['test-preview-emulator.yml', emulatorWorkflow],
    ]) {
        assert.match(
            content,
            /on:\n  push:\n    branches-ignore:\n      - main\n/,
            `${name} must trigger automatically on all non-main development branches`
        );
        assert.doesNotMatch(
            content,
            /branches:\n\s*-\s*arena\//,
            `${name} must not hardcode a single ephemeral Arena branch name`
        );
    }

    for (const [name, content] of [
        ['preview-apk.yml', workflow],
        ['test-preview-emulator.yml', emulatorWorkflow],
        ['validate-android-assembly.yml', assemblyWorkflow],
        ['release-apk.yml', releaseWorkflow],
    ]) {
        assert.match(
            content,
            /\npermissions:\n  contents: read\n/,
            `${name} must enforce top-level least-privilege contents: read`
        );
        assert.doesNotMatch(
            content,
            /\bgit\s+(commit|push)\b/,
            `${name} must never commit or push back to Git (prevents infinite workflow loops)`
        );
    }

    assert.match(workflow, /publish_release:\n[\s\S]*?type: boolean\n\s+default: false/);
    assert.match(
        workflow,
        /publish-preview-release:\n    needs: build-and-release-preview\n    if: github\.event_name == 'workflow_dispatch' && inputs\.publish_release == true\n[\s\S]*?permissions:\n      contents: write/
    );
    assert.doesNotMatch(releaseWorkflow, /\n  push:/);
    assert.doesNotMatch(releaseWorkflow, /\n  pull_request:/);
});

test('CI workflows bind artifacts, TAP reports, and manifests to exact 40-char commit SHA', () => {
    assert.match(workflow, /name: Melodix-Preview-\$\{\{ steps\.release\.outputs\.source_ref \}\}/);
    assert.match(workflow, /build-manifest-\$\{\{ steps\.release\.outputs\.source_ref \}\}\.json/);
    assert.match(workflow, /node-tests-\$\{\{ steps\.release\.outputs\.source_ref \}\}\.tap/);

    assert.match(emulatorWorkflow, /name: Melodix-Emulator-Verification-\$\{\{ steps\.meta\.outputs\.target_sha \}\}/);
    assert.match(emulatorWorkflow, /verification-summary-\$\{TARGET_SHA\}\.json/);
    assert.match(emulatorWorkflow, /node-tests-\$\{TARGET_SHA\}\.tap/);
});

test('Agent automation protocol, changelog, and sync helper are present and guarded', () => {
    const agentsDoc = readRepoFile('AGENTS.md');
    const changelog = readRepoFile('CHANGELOG.md');
    const syncScript = readRepoFile('scripts/verify-and-sync.sh');

    assert.match(agentsDoc, /\.\/scripts\/verify-and-sync\.sh/);
    assert.match(agentsDoc, /main/);
    assert.match(changelog, /arena\/7142700d-melodix/);
    assert.match(syncScript, /Direct commits or pushes to 'main' are strictly forbidden/);
    assert.match(syncScript, /melodix-phone-ui-concept\.png/);
});
