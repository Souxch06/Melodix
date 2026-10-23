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

test('Verification workflow is cleanly separated from publication and gates test pre-releases', () => {
    assert.match(
        workflow,
        /on:\n  push:\n    branches-ignore:\n      - main\n    tags-ignore:\n      - '\*\*'\n/,
        'preview-apk.yml must auto-trigger on non-main pushes while ignoring all tag pushes to prevent loops'
    );
    assert.doesNotMatch(
        workflow,
        /branches:\n\s*-\s*arena\//,
        'preview-apk.yml must not hardcode a single ephemeral Arena branch name'
    );
    assert.match(
        emulatorWorkflow,
        /on:\n  workflow_call:/,
        'test-preview-emulator.yml must act as reusable verification workflow'
    );
    assert.doesNotMatch(
        emulatorWorkflow,
        /contents:\s*write/,
        'Verification workflow must never hold write permissions'
    );

    assert.match(
        workflow,
        /  verify:\n[\s\S]*?permissions:\n      contents: read\n    uses: \.\/\.github\/workflows\/test-preview-emulator\.yml/,
        'preview-apk.yml must execute full emulator/Node verification before building release package'
    );
    assert.match(
        workflow,
        /  build-and-release-preview:\n    needs: verify\n[\s\S]*?permissions:\n      contents: read/,
        'Package build job must wait for verify and run with contents: read only'
    );
    assert.match(
        workflow,
        /  publish-preview-release:\n    needs:\n      - verify\n      - build-and-release-preview\n[\s\S]*?permissions:\n      contents: write/,
        'Only publish-preview-release may hold contents: write and must depend on both verify and build'
    );

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
});

test('Test release publication uses unique non-overwriting pre-release tags, deduplicates commits, and verifies SHA-256 after upload', () => {
    assert.match(workflow, /Deduplication Guard::Commit/);
    assert.match(workflow, /Refusing to overwrite protected baseline tag v1\.2\.2-test\.1-preview/);
    assert.match(workflow, /prerelease: true/);
    assert.match(workflow, /overwrite_files: false/);
    assert.match(workflow, /Verify published GitHub Release, download links, and SHA-256 end-to-end/);
});

test('CI workflows bind artifacts, TAP reports, and manifests to exact 40-char commit SHA', () => {
    assert.match(workflow, /name: Melodix-Preview-\$\{\{ steps\.release\.outputs\.source_ref \}\}/);
    assert.match(workflow, /manifest_name="build-manifest-\$\{TAG\}\.json"/);
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
