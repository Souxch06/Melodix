const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const repo = path.resolve(__dirname, '..');
const releasesDir = path.join(repo, 'releases');

// Integrity guard for the Arena preview channel: every published APK in
// releases/ must have a matching .sha256 file whose content matches the real
// digest, and the README must keep the uninstall-first procedure on top.
test('every releases/*.apk has a valid matching .sha256 sidecar', () => {
  const apks = fs.readdirSync(releasesDir).filter((f) => f.endsWith('.apk'));
  assert.ok(apks.length >= 10, `expected the published preview APKs, got ${apks.length}`);
  for (const apk of apks) {
    const sidecar = path.join(releasesDir, apk + '.sha256');
    assert.ok(fs.existsSync(sidecar), `${apk}.sha256 must exist`);
    const actual = crypto.createHash('sha256')
      .update(fs.readFileSync(path.join(releasesDir, apk))).digest('hex');
    const declared = fs.readFileSync(sidecar, 'utf8').trim().split(/\s+/)[0];
    assert.equal(declared, actual, `${apk}.sha256 must match the real sha256`);
  }
});

test('releases/README.md keeps the anti-conflict procedure and points at the latest preview', () => {
  const readme = fs.readFileSync(path.join(releasesDir, 'README.md'), 'utf8');
  assert.match(readme, /adb uninstall com\.melodix\.music/);
  const apks = fs.readdirSync(releasesDir).filter((f) => f.endsWith('.apk'))
    .map((f) => Number((f.match(/test(\d+)\.apk$/) || [])[1]));
  const latest = Math.max(...apks);
  assert.ok(readme.includes(`test.${latest}`), `README must reference the latest preview test.${latest}`);
});
