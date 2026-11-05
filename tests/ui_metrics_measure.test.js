// The emulator measurement script is the only check that proves Android really
// selected the sw600dp resources and inflated the shell at those sizes. It runs
// on a remote runner where it cannot be debugged interactively, so its own
// behaviour is tested here against synthetic uiautomator dumps.
//
// These dumps are test fixtures for the measuring tool. They are not app data
// and nothing here is shipped or presented as a device result.
//
// The important case is the second one: a tablet that renders phone-sized
// metrics MUST fail. Otherwise the whole check would be decorative.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

const root = path.join(__dirname, '..');
const script = path.join(root, 'scripts', 'ui_metrics_measure.py');

const PHONE_DPI = 420;
const TABLET_DPI = 320;

function dump(views) {
  const nodes = Object.entries(views).map(([id, [x, y, w, h]]) =>
    `<node resource-id="com.melodix.music:id/${id}" text="" bounds="[${x},${y}][${x + w},${y + h}]" />`
  ).join('');
  return `<?xml version="1.0" encoding="UTF-8"?>\n<hierarchy rotation="0">${nodes}</hierarchy>`;
}

// px = dp * density / 160, rounded the way getDimensionPixelSize does.
function px(dp, dpi) {
  return Math.round(dp * dpi / 160);
}

function phoneViews() {
  return {
    nativeRoot: [0, 0, px(411, PHONE_DPI), px(914, PHONE_DPI)],
    nativeTabBar: [0, px(850, PHONE_DPI), px(411, PHONE_DPI), px(64, PHONE_DPI)],
    nativeHomeTab: [0, px(853, PHONE_DPI), px(137, PHONE_DPI), px(58, PHONE_DPI)],
    nativeSearchTab: [px(137, PHONE_DPI), px(853, PHONE_DPI), px(137, PHONE_DPI), px(58, PHONE_DPI)],
    nativeLibraryTab: [px(274, PHONE_DPI), px(853, PHONE_DPI), px(137, PHONE_DPI), px(58, PHONE_DPI)],
    nativeSettingsButton: [px(355, PHONE_DPI), px(10, PHONE_DPI), px(48, PHONE_DPI), px(48, PHONE_DPI)],
  };
}

function tabletViews() {
  return {
    nativeRoot: [0, 0, px(800, TABLET_DPI), px(1280, TABLET_DPI)],
    nativeTabBar: [0, px(1200, TABLET_DPI), px(800, TABLET_DPI), px(76, TABLET_DPI)],
    nativeHomeTab: [0, px(1206, TABLET_DPI), px(266, TABLET_DPI), px(68, TABLET_DPI)],
    nativeSearchTab: [px(266, TABLET_DPI), px(1206, TABLET_DPI), px(267, TABLET_DPI), px(68, TABLET_DPI)],
    nativeLibraryTab: [px(533, TABLET_DPI), px(1206, TABLET_DPI), px(267, TABLET_DPI), px(68, TABLET_DPI)],
    nativeSettingsButton: [px(736, TABLET_DPI), px(16, TABLET_DPI), px(52, TABLET_DPI), px(52, TABLET_DPI)],
  };
}

function run(profile, dpi, views) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-ui-metrics-'));
  const dumpFile = path.join(dir, 'dump.xml');
  const outFile = path.join(dir, 'report.json');
  fs.writeFileSync(dumpFile, dump(views));
  let status = 0;
  let stdout = '';
  try {
    stdout = execFileSync('python3', [script, profile, String(dpi), dumpFile, outFile],
      { encoding: 'utf8' });
  } catch (error) {
    status = error.status;
    stdout = error.stdout || '';
  }
  const report = fs.existsSync(outFile) ? JSON.parse(fs.readFileSync(outFile, 'utf8')) : null;
  fs.rmSync(dir, { recursive: true, force: true });
  return { status, stdout, report };
}

test('a correctly inflated phone shell passes and reports dp, not px', () => {
  const { status, report, stdout } = run('phone', PHONE_DPI, phoneViews());
  assert.equal(status, 0, `expected success, got ${status}: ${stdout}`);
  assert.equal(report.profile, 'phone');
  assert.equal(report.shell_present, true);
  assert.deepEqual(report.problems, []);
  const bar = report.measurements.find((m) => m.view === 'nativeTabBar');
  assert.equal(bar.expected_dp, 64);
  assert.ok(Math.abs(bar.dp - 64) <= 1, `measured ${bar.dp}dp`);
  assert.match(stdout, /::notice title=UI metrics phone::/);
});

test('a correctly inflated tablet shell passes with the tablet tokens', () => {
  const { status, report } = run('tablet', TABLET_DPI, tabletViews());
  assert.equal(status, 0, `expected success: ${JSON.stringify(report.problems)}`);
  const bar = report.measurements.find((m) => m.view === 'nativeTabBar');
  assert.equal(bar.expected_dp, 76, 'the tablet must be held to the tablet token');
  const settings = report.measurements.find((m) => m.view === 'nativeSettingsButton');
  assert.equal(settings.expected_dp, 52);
});

test('a tablet rendering phone metrics FAILS - the check is not decorative', () => {
  // Same pixel sizes as the phone, but reported at tablet density: this is
  // exactly what a stretched phone looks like to the measuring tool.
  const views = phoneViews();
  const { status, report, stdout } = run('tablet', TABLET_DPI, views);
  assert.equal(status, 1, 'a non-adapted tablet must fail');
  assert.ok(report.problems.length > 0);
  assert.match(stdout, /::error title=UI metrics tablet::/);
  const bar = report.measurements.find((m) => m.view === 'nativeTabBar');
  assert.equal(bar.ok, false);
});

test('a missing native shell fails instead of reporting a silent pass', () => {
  const { status, report } = run('phone', PHONE_DPI, { webViewContainer: [0, 0, 100, 100] });
  assert.equal(status, 1);
  assert.equal(report.shell_present, false);
  assert.ok(report.problems.some((p) => /native shell never appeared/.test(p)));
});

test('optional views are reported as not measured, never invented', () => {
  const { status, report } = run('phone', PHONE_DPI, phoneViews());
  assert.equal(status, 0);
  const mini = report.measurements.find((m) => m.view === 'nativeMiniPlayer');
  assert.equal(mini.measured, false, 'the mini player is absent without playback');
  assert.ok(report.not_measured.some((entry) => /signed-in Spotify session/.test(entry)),
    'the report states what it could not measure');
});

test('one dp of rounding slack is allowed but two is not', () => {
  const views = phoneViews();
  const scale = PHONE_DPI / 160;
  views.nativeTabBar = [0, 100, px(411, PHONE_DPI), Math.round(66 * scale)];
  const { status, report } = run('phone', PHONE_DPI, views);
  assert.equal(status, 1, 'a 2dp drift must fail');
  const bar = report.measurements.find((m) => m.view === 'nativeTabBar');
  assert.equal(bar.ok, false);
});

// ---------------------------------------------------------------------------
// The tap helper must use real bounds, never a guessed coordinate: a hardcoded
// phone coordinate would tap the wrong place on the tablet profile.
// ---------------------------------------------------------------------------

const centreScript = path.join(root, 'scripts', 'ui_view_center.py');

function centre(views, id) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-ui-centre-'));
  const file = path.join(dir, 'dump.xml');
  fs.writeFileSync(file, dump(views));
  let out = '';
  try {
    out = execFileSync('python3', [centreScript, file, id], { encoding: 'utf8' }).trim();
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
  return out;
}

test('the tap helper returns the real centre of the requested view', () => {
  const views = tabletViews();
  const [x, y, w, h] = views.nativeSearchTab;
  assert.equal(centre(views, 'nativeSearchTab'), `${x + Math.floor(w / 2)} ${y + Math.floor(h / 2)}`);
});

test('the tap helper prints nothing for an absent view instead of guessing', () => {
  assert.equal(centre(phoneViews(), 'nativeMiniPlayer'), '');
  assert.equal(centre({}, 'nativeSearchTab'), '');
});

test('the phone and tablet tap points differ, so no coordinate is hardcoded', () => {
  const phone = centre(phoneViews(), 'nativeSearchTab');
  const tablet = centre(tabletViews(), 'nativeSearchTab');
  assert.notEqual(phone, tablet);
  assert.ok(phone && tablet);
});

// ---------------------------------------------------------------------------
// Workflow YAML must parse. An inline heredoc at column 0 silently breaks the
// block scalar around it, which is exactly the mistake this guards.
// ---------------------------------------------------------------------------

test('every GitHub workflow is valid YAML', (t) => {
  const probe = require('node:child_process').spawnSync('python3', ['-c', 'import yaml'],
    { encoding: 'utf8' });
  if (probe.status !== 0) {
    // Honest skip, matching the repository's JVM checks: without a YAML parser
    // the file was not validated, and that is not reported as a pass.
    t.skip('pyyaml is unavailable: workflow YAML was not parsed');
    return;
  }
  const dir = path.join(root, '.github', 'workflows');
  const files = fs.readdirSync(dir).filter((f) => f.endsWith('.yml') || f.endsWith('.yaml'));
  assert.ok(files.length > 0);
  for (const file of files) {
    const result = require('node:child_process').spawnSync('python3', ['-c',
      'import sys, yaml; yaml.safe_load(open(sys.argv[1], encoding="utf-8"))',
      path.join(dir, file)], { encoding: 'utf8' });
    assert.equal(result.status, 0, `${file} must parse as YAML: ${result.stderr}`);
  }
});

test('the UI metrics workflow stays build-only and measures both profiles', () => {
  const yaml = fs.readFileSync(path.join(root, '.github', 'workflows', 'verify-ui-metrics.yml'), 'utf8');
  assert.match(yaml, /profile: \[phone, tablet\]/, 'both form factors are measured');
  assert.match(yaml, /scripts\/ui_metrics_measure\.py/, 'the rendered bounds are compared to the tokens');
  assert.match(yaml, /scripts\/p0_display_boot_avd\.sh/, 'it reuses the proven AVD profiles');
  assert.doesNotMatch(yaml, /secrets\./, 'no signing secret is used');
  assert.doesNotMatch(yaml, /softprops\/action-gh-release|gh release create/,
    'this workflow must never publish a release');
  assert.match(yaml, /throwaway debug key/, 'the APK is signed with a disposable build-only key');
  // workflow_dispatch alone cannot run from a feature branch: GitHub only
  // registers it from the default branch, which this work must not touch.
  assert.match(yaml, /push:\n    branches:\n      - arena\/6b935c3e-melodix/,
    'a path-scoped push trigger drives the run from the working branch');
  assert.match(yaml, /paths:/, 'the emulator jobs must not run on unrelated pushes');
});

// ---------------------------------------------------------------------------
// The diagnosis must distinguish "the UI was never readable" from "the shell
// had not taken over". They need different fixes, and conflating them would
// send the next attempt down the wrong path.
// ---------------------------------------------------------------------------

const diagnoseScript = path.join(root, 'scripts', 'ui_metrics_diagnose.py');

function diagnose(content) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-ui-diag-'));
  const file = path.join(dir, 'dump.xml');
  if (content !== null) fs.writeFileSync(file, content);
  let out = '';
  try {
    out = execFileSync('python3', [diagnoseScript, 'tablet', file], { encoding: 'utf8' });
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
  return out;
}

test('an absent dump is reported as never read, not as a missing shell', () => {
  const out = diagnose(null);
  assert.match(out, /dump=absent/);
  assert.match(out, /idle state/);
  assert.doesNotMatch(out, /nativeRoot=false/);
});

test('an unparseable dump is reported as never read', () => {
  const out = diagnose('ERROR: could not get idle state.');
  assert.match(out, /dump=unparseable/);
  assert.match(out, /uiautomator_error=true/);
});

test('a readable dump without the shell says so explicitly', () => {
  const out = diagnose(dump({ webViewContainer: [0, 0, 100, 100], splashOverlay: [0, 0, 100, 100] }));
  assert.match(out, /dump=ok/);
  assert.match(out, /nativeRoot=false/);
  assert.match(out, /ids=splashOverlay,webViewContainer/);
});

test('a readable dump with the shell is recognised', () => {
  const out = diagnose(dump(tabletViews()));
  assert.match(out, /nativeRoot=true/);
  assert.match(out, /nodes=6/);
});

test('the diagnosis never echoes screen text', () => {
  const xml = '<?xml version="1.0" encoding="UTF-8"?>\n<hierarchy>'
    + '<node resource-id="com.melodix.music:id/nativeRoot" text="secret@example.com" '
    + 'content-desc="Bearer abc123" bounds="[0,0][10,10]" package="com.melodix.music" />'
    + '</hierarchy>';
  const out = diagnose(xml);
  assert.doesNotMatch(out, /secret@example\.com/);
  assert.doesNotMatch(out, /Bearer abc123/);
  assert.match(out, /nativeRoot=true/);
});

test('the build writes its own signing fingerprint before assembling', () => {
  // The app verifies its signing certificate against
  // res/values/strings.xml expected_signature_sha256. The first device runs
  // failed exactly here: a re-signed APK whose fingerprint was not written back
  // exits at startup, so the shell never appears and nothing can be measured.
  const yaml = fs.readFileSync(path.join(root, '.github', 'workflows', 'verify-ui-metrics.yml'), 'utf8');
  const key = yaml.indexOf('keytool -genkeypair');
  const exportCert = yaml.indexOf('keytool -exportcert');
  const patch = yaml.indexOf('p.write_text(re.sub');
  const build = yaml.indexOf('apktool.jar" b');
  const sign = yaml.indexOf('apksigner" sign');
  for (const [label, at] of [['genkeypair', key], ['exportcert', exportCert],
    ['fingerprint patch', patch], ['apktool b', build], ['apksigner', sign]]) {
    assert.ok(at > 0, `${label} must be present`);
  }
  assert.ok(key < exportCert, 'the certificate must come from the generated key');
  assert.ok(exportCert < patch, 'the fingerprint must be derived before it is written');
  assert.ok(patch < build, 'the fingerprint must be in the project BEFORE assembly');
  assert.ok(build < sign, 'the APK is assembled then signed');
  assert.match(yaml, /expected_signature_sha256/, 'the signature resource is the one patched');
  assert.match(yaml, /repository_unchanged=true/,
    'only the temporary build copy is patched, never the repository');
});

test('the failure diagnostics survive a dead process and an empty grep', () => {
  // pidof exits 1 when the process is gone and grep exits 1 on no match; under
  // set -e either would abort the step before the notice is printed, which is
  // precisely what hid the crash on the first run.
  const yaml = fs.readFileSync(path.join(root, '.github', 'workflows', 'verify-ui-metrics.yml'), 'utf8');
  assert.match(yaml, /pidof com\.melodix\.music 2>\/dev\/null \| tr -d '\\r' \|\| true/,
    'a missing process must not abort the diagnostics');
  assert.match(yaml, /mCurrentFocus[\s\S]*?\|\| true/,
    'an unfocused window must not abort the diagnostics');
  assert.match(yaml, /ui_metrics_diagnose\.py/, 'the dump is diagnosed, not just reported missing');
  assert.match(yaml, /pid_after_5s=/, 'the process state right after launch is reported');
});
