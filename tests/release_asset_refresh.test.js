'use strict';

// Contract tests for the manual release-asset refresh tool. Its whole purpose
// is to replace the APK of an EXISTING release with the bytes of a fully
// verified pipeline run of the exact requested commit — it must never be able
// to create a tag, create a release, or publish an unverified build.

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

const wf = read('.github/workflows/release-asset-refresh.yml');

test('release-asset-refresh.yml is manual-only and can never create a tag or a release', () => {
    const triggers = wf.slice(wf.indexOf('\non:'), wf.indexOf('\npermissions:'));
    assert.match(triggers, /workflow_dispatch:/);
    assert.ok(!/\bpush:|\bpull_request:|\bschedule:|\bworkflow_call:/.test(triggers),
        'the asset refresh must never run automatically');
    for (const forbidden of ['gh release create', 'action-gh-release', 'softprops', 'git tag', 'git push', 'gh release delete']) {
        assert.ok(!wf.includes(forbidden), `must never contain ${forbidden}`);
    }
    // The only write verbs are a clobber upload onto the existing release and
    // a metadata patch of that same release.
    assert.match(wf, /gh release upload "\$RELEASE_TAG"[\s\S]*?--clobber/);
    assert.match(wf, /gh api -X PATCH "repos\/\$\{GITHUB_REPOSITORY\}\/releases\//);
});

test('release-asset-refresh.yml only publishes a fully verified run of the exact requested commit', () => {
    assert.match(wf, /head_sha is \{run\.get\('head_sha'\)\}, not \{expected\}/);
    assert.match(wf, /run conclusion is \{run\.get\('conclusion'\)\!r}, not 'success'/);
    assert.match(wf, /Verify tests, build integrity, and Android 15 E2E before release/);
    assert.match(wf, /Build and sign verified preview package/);
    assert.match(wf, /Melodix-Preview-\{expected\}/);
    assert.match(wf, /manifest\.get\("commit_sha"\) != expected/);
    assert.match(wf, /manifest\.get\("apk_sha256"\) != calc/);
    assert.match(wf, /independent sha256 \{calc\} != bundled \.sha256 \{bundled\}/);
});

test('retired test tags can never be refreshed or recreated', () => {
    assert.match(wf, /v1\.2\.2-test\.1-preview\|v1\.2\.2-test\.2-preview\|v1\.2\.2-test\.3-preview/);
    assert.match(wf, /retired and must never be recreated or overwritten/);
});

test('the refresh keeps the existing asset names and verifies digests end-to-end', () => {
    // The released bytes keep the release's own file names.
    assert.match(wf, /apk_asset="\$\(python3 -c 'import json,sys; rel=json\.load/);
    assert.match(wf, /sha256sum "\$apk_asset" > "\$apk_asset\.sha256"/);
    // The final control reads the GitHub digest back and compares it to the
    // locally computed SHA-256 before declaring success.
    assert.match(wf, /asset digest \{a\['digest'\]\} != sha256:\{calc\}/);
    assert.match(wf, /asset list mismatch/);
    assert.match(wf, /release body does not mention the published sha256/);
});
