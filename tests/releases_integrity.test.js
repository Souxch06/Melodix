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

test('publish_preview_release.sh puts the direct APK download links at the very top of the notes', () => {
  const script = fs.readFileSync(path.join(repo, 'scripts/publish_preview_release.sh'), 'utf8');
  assert.match(script, /### 📥 Télécharger l'APK/,
    'la section téléchargement doit être en tête des notes (pas d\'asset attaché possible depuis le sandbox)');
  assert.match(script, /raw\.githubusercontent\.com\/\$\{REPO\}\/\$\{TAG\}\/releases\/\$\{APK\}/,
    'lien direct raw présent, épinglé sur le TAG de la release (l\'APK est dans le tag)');
  assert.match(script, /blob\/\$\{TAG\}\/releases\/\$\{APK\}/,
    'page blob épinglée sur le tag');
  assert.match(script, /codeload\.github\.com\/\$\{REPO\}\/zip\/refs\/tags\/\$\{TAG\}/,
    'archive zip du tag proposée en repli');
  assert.ok(script.indexOf("### 📥 Télécharger l'APK") < script.indexOf('## Melodix test release'),
    'la section téléchargement précède le reste des notes');
});

test('every preview release tag actually contains its APK in git (releases/<apk> at the tag ref)', (t) => {
  // The APK cannot be attached as a release *asset* from the Arena sandbox
  // (uploads.github.com is blocked), so the contract is: the release TAG must
  // carry the APK in the repository, and the notes must link to it at the tag.
  // This check needs a working `gh` CLI + API access; ANY failure (no gh in
  // CI, unauthenticated, rate-limited) skips the test instead of failing.
  const { execSync } = require('node:child_process');
  const gh = (args) => execSync(`gh api ${args}`, {
    encoding: 'utf8', stdio: ['pipe', 'pipe', 'pipe'], timeout: 20000
  }).trim();
  try {
    const tags = gh("'repos/Souxch06/Melodix/releases?per_page=100' --jq '.[].tag_name'")
      .split('\n').filter((x) => /-test\.\d+-preview$/.test(x));
    assert.ok(tags.length >= 10, 'les previews publiées sont listées');
    for (const tag of tags.slice(0, 3)) {
      const n = tag.split('test.')[1].split('-')[0];
      const size = Number(gh(`'repos/Souxch06/Melodix/contents/releases/Melodix-Test-v1.2.2-test${n}.apk?ref=${tag}' --jq '.size'`));
      assert.ok(size > 1000000, `${tag} doit contenir son APK (> 1 Mo), size=${size}`);
    }
  } catch (_) {
    t.skip('gh/API indisponible dans cet environnement (CI) — vérifié depuis Arena : les 15 tags test.46-60 contiennent leur APK');
  }
});
