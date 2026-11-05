// The layout audit runs on a remote emulator where it cannot be debugged, so
// its detection rules are tested here against constructed dumps.
//
// These are fixtures for the auditing tool, not app data. Each case is a defect
// that must be found, plus clean cases that must NOT be reported - a detector
// that cries wolf on every surface is worse than none.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

const root = path.join(__dirname, '..');
const script = path.join(root, 'scripts', 'ui_layout_audit.py');
const DPI = 320; // scale 2, so 48dp = 96px

function node({ id, box, clickable = false, cls = 'android.view.View', children = '' }) {
  const rid = id ? ` resource-id="com.melodix.music:id/${id}"` : '';
  const [x1, y1, x2, y2] = box;
  return `<node class="${cls}"${rid} clickable="${clickable}" text="" `
    + `bounds="[${x1},${y1}][${x2},${y2}]">${children}</node>`;
}

function dump(inner, screen = [0, 0, 1600, 2560]) {
  return '<?xml version="1.0" encoding="UTF-8"?>\n<hierarchy rotation="0">'
    + node({ box: screen, children: inner }) + '</hierarchy>';
}

function run(xml, surface = 'home') {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-layout-'));
  const file = path.join(dir, 'dump.xml');
  const out = path.join(dir, 'report.json');
  if (xml !== null) fs.writeFileSync(file, xml);
  let status = 0;
  let stdout = '';
  try {
    stdout = execFileSync('python3', [script, surface, 'tablet', String(DPI), file, out],
      { encoding: 'utf8' });
  } catch (error) {
    status = error.status;
    stdout = error.stdout || '';
  }
  const report = fs.existsSync(out) ? JSON.parse(fs.readFileSync(out, 'utf8')) : null;
  fs.rmSync(dir, { recursive: true, force: true });
  return { status, stdout, report };
}

test('a clean surface reports no defect', () => {
  const xml = dump(
    node({ id: 'nativeHeader', box: [0, 0, 1600, 200] })
    + node({ id: 'nativeSettingsButton', box: [1400, 40, 1504, 144], clickable: true })
    + node({ id: 'nativeTabBar', box: [0, 2400, 1600, 2552] })
  );
  const { status, report } = run(xml);
  assert.equal(status, 0, JSON.stringify(report.defects));
  assert.equal(report.readable, true);
  for (const kind of ['collapsed', 'offscreen', 'small_target', 'overlap']) {
    assert.deepEqual(report.defects[kind], [], kind);
  }
});

test('a collapsed view is reported', () => {
  const xml = dump(node({ id: 'nativeContent', box: [0, 300, 1600, 300] }));
  const { status, report } = run(xml);
  assert.equal(status, 1);
  assert.equal(report.defects.collapsed.length, 1);
  assert.equal(report.defects.collapsed[0].view, 'nativeContent');
});

test('a view leaving the display is reported as clipped', () => {
  const xml = dump(node({ id: 'nativePlayerLargeTitle', box: [40, 300, 1700, 380] }));
  const { status, report } = run(xml);
  assert.equal(status, 1);
  assert.equal(report.defects.offscreen[0].view, 'nativePlayerLargeTitle');
});

test('one pixel of rounding is tolerated at the display edge', () => {
  const xml = dump(node({ id: 'nativeTabBar', box: [0, 2400, 1601, 2560] }));
  const { status } = run(xml);
  assert.equal(status, 0, 'a 1px overflow is rounding, not clipping');
});

test('an undersized touch target is reported in dp', () => {
  // 60px at 320dpi is 30dp: too small for a thumb.
  const xml = dump(node({ id: 'nativePlayPauseButton', box: [0, 0, 60, 60], clickable: true }));
  const { status, report } = run(xml);
  assert.equal(status, 1);
  const defect = report.defects.small_target[0];
  assert.equal(defect.view, 'nativePlayPauseButton');
  assert.equal(defect.width_dp, 30);
});

test('a 48dp target is accepted', () => {
  const xml = dump(node({ id: 'nativeBackButton', box: [0, 0, 96, 96], clickable: true }));
  const { status } = run(xml);
  assert.equal(status, 0);
});

test('two overlapping buttons are reported as an ambiguous tap', () => {
  const xml = dump(
    node({ id: 'nativeHomeTab', box: [0, 2400, 600, 2552], clickable: true })
    + node({ id: 'nativeSearchTab', box: [500, 2400, 1100, 2552], clickable: true })
  );
  const { status, report } = run(xml);
  assert.equal(status, 1);
  assert.equal(report.defects.overlap.length, 1);
  assert.deepEqual(report.defects.overlap[0].views.sort(), ['nativeHomeTab', 'nativeSearchTab']);
});

test('a button nested in a clickable row is NOT an overlap', () => {
  // The mini player row opens the player and contains its own play/pause button.
  // That nesting is intentional and must not be flagged.
  const row = node({
    id: 'nativeMiniPlayer', box: [0, 2200, 1600, 2352], clickable: true,
    children: node({ id: 'nativePlayPauseButton', box: [1450, 2220, 1560, 2330], clickable: true }),
  });
  const { status, report } = run(dump(row));
  assert.equal(status, 0, JSON.stringify(report.defects));
  assert.deepEqual(report.defects.overlap, []);
});

test('views without a Melodix id are not attributed to us', () => {
  // The WebView hosts Spotify markup; its internals are not our layout defects.
  const xml = dump('<node class="android.webkit.WebView" resource-id="" clickable="true" '
    + 'bounds="[0,0][40,40]"/>');
  const { status } = run(xml);
  assert.equal(status, 0);
});

test('an absent or unparseable dump fails instead of reporting a clean surface', () => {
  const absent = run(null);
  assert.equal(absent.status, 1);
  assert.equal(absent.report.readable, false);
  assert.equal(absent.report.reason, 'dump_absent');

  const broken = run('ERROR: could not get idle state.');
  assert.equal(broken.status, 1);
  assert.equal(broken.report.reason, 'dump_unparseable');
});

test('the audit never echoes screen text', () => {
  const xml = '<?xml version="1.0"?><hierarchy>'
    + node({ box: [0, 0, 1600, 2560], children: '<node class="android.widget.TextView" '
      + 'resource-id="com.melodix.music:id/nativePlayerTitle" text="secret@example.com" '
      + 'clickable="false" bounds="[0,0][1700,40]"/>' })
    + '</hierarchy>';
  const { stdout } = run(xml);
  assert.doesNotMatch(stdout, /secret@example\.com/);
  assert.match(stdout, /nativePlayerTitle/);
});

// ---------------------------------------------------------------------------
// Navigation trace: the boundary between "works without an account" and
// "needs a real session" must be explicit, never silently skipped.
// ---------------------------------------------------------------------------

const traceScript = path.join(root, 'scripts', 'ui_qa_trace.py');

function trace(steps) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-qa-trace-'));
  const file = path.join(dir, 'dump.xml');
  const out = path.join(dir, 'trace.json');
  const results = [];
  try {
    for (const [step, ids] of steps) {
      fs.writeFileSync(file, dump(ids.map((id, i) =>
        node({ id, box: [0, i * 200, 1600, i * 200 + 152] }))));
      let status = 0;
      try {
        execFileSync('python3', [traceScript, step, 'tablet', file, out], { encoding: 'utf8' });
      } catch (error) { status = error.status; }
      results.push({ step, status });
    }
    return { results, entries: JSON.parse(fs.readFileSync(out, 'utf8')) };
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test('a navigation step whose screen appeared is reached', () => {
  const { results, entries } = trace([['search',
    ['nativeRoot', 'nativeSearchPanel', 'nativeSearchInput', 'nativeGenreScroll']]]);
  assert.equal(results[0].status, 0);
  assert.equal(entries[0].verdict, 'reached');
  assert.deepEqual(entries[0].optional_present, ['nativeGenreScroll']);
});

test('a navigation step whose screen did not appear is a real failure', () => {
  const { results, entries } = trace([['library', ['nativeRoot', 'nativeHomeTab']]]);
  assert.equal(results[0].status, 1);
  assert.equal(entries[0].verdict, 'not_reached');
  assert.deepEqual(entries[0].required_missing, ['nativeLibraryTab', 'nativeLibraryCategories']);
});

test('the player without a session is blocked, not failed and not faked', () => {
  const { results, entries } = trace([['player', ['nativeRoot', 'nativeTabBar']]]);
  assert.equal(results[0].status, 0, 'a missing session is not a navigation defect');
  assert.equal(entries[0].verdict, 'blocked_no_session');
  assert.deepEqual(entries[0].required_missing, ['nativePlayerPanel']);
});

test('the trace accumulates every step in order', () => {
  const { entries } = trace([
    ['home', ['nativeRoot', 'nativeTabBar', 'nativeHomeTab', 'nativeScreenTitle']],
    ['search', ['nativeRoot', 'nativeSearchPanel', 'nativeSearchInput']],
  ]);
  assert.deepEqual(entries.map((e) => e.step), ['home', 'search']);
});

test('the QA workflow keeps a literal on: key and cannot re-trigger itself', () => {
  const file = path.join(root, '.github', 'workflows', 'ui-qa.yml');
  const yaml = fs.readFileSync(file, 'utf8');
  // YAML 1.1 turns a bare `on` into the boolean true; GitHub then sees no
  // trigger at all. The serialised form must be corrected back to `on:`.
  assert.match(yaml, /^on:/m, 'the trigger key must be the literal on:');
  assert.doesNotMatch(yaml, /^true:/m, 'a boolean trigger key would disable the workflow');
  assert.match(yaml, /\[skip ci\]/, 'publishing captures must not re-trigger the walk');
  const paths = yaml.slice(yaml.indexOf('paths:'), yaml.indexOf('permissions:'));
  assert.doesNotMatch(paths, /docs\//, 'the published capture path must not be watched');
  assert.doesNotMatch(yaml, /secrets\./, 'no signing secret');
  assert.match(yaml, /profile:\s*(?:\[phone,\s*tablet\]|\n\s*- phone\n\s*- tablet)/,
    'both form factors are walked');
});

// --- resource probe -------------------------------------------------------
// The tablet captures showed runtime-resolved tokens landing on their phone
// fallback while XML-resolved tokens were correct. The probe separates a
// packaging cause from a lookup cause, so the fix is not a guess.

test('the resource probe reports honestly when it cannot run', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-probe-'));
  const out = path.join(dir, 'nested', 'resource-table.txt');
  execFileSync('bash', [path.join(root, 'scripts', 'ui_resource_probe.sh'),
    path.join(dir, 'absent.apk'), out], { encoding: 'utf8' });
  const text = fs.readFileSync(out, 'utf8');
  assert.match(text, /status=apk_missing/, 'a missing APK must be stated, not guessed around');
  assert.ok(!/ABSENT_FROM_RESOURCE_TABLE/.test(text), 'no claim about resources without a dump');
  fs.rmSync(dir, { recursive: true, force: true });
});

test('the probe covers the tokens that disagreed on the tablet', () => {
  const text = fs.readFileSync(path.join(root, 'scripts', 'ui_resource_probe.sh'), 'utf8');
  for (const token of ['mel_settings_row_height', 'mel_status_max_width', 'mel_tab_bar_height']) {
    assert.ok(text.includes(token), `${token} must be probed`);
  }
  assert.ok(text.includes('mel_tab_bar_height'),
    'a token known to resolve correctly is needed as the control');
});

test('the QA workflow runs the probe before walking, and keeps its trigger', () => {
  const raw = fs.readFileSync(path.join(root, '.github', 'workflows', 'ui-qa.yml'), 'utf8');
  // YAML 1.1 parsers turn the bare key `on` into a boolean; assert on the text.
  assert.match(raw, /^on:/m, 'GitHub must see a trigger block');
  assert.ok(!/^true:/m.test(raw), 'a dumped boolean key would disable every trigger');
  assert.ok(raw.includes('ui_resource_probe.sh'), 'the probe must actually run in CI');
  const probeAt = raw.indexOf('Probe the resource table');
  const walkAt = raw.indexOf('Walk the navigation graph');
  assert.ok(probeAt > 0 && probeAt < walkAt, 'the probe must run before the walk');
});

// --- the trace must not report a false green -------------------------------
// Real defect found while reviewing run 41986397958: `back-from-settings` and
// `settings` produced byte-identical screenshots, yet both steps were reported
// "reached", because the tab bar and the home tab are visible on EVERY native
// screen. These tests reproduce that exact situation.

function traceDump(nodes) {
  const body = nodes.map(([id, text]) =>
    `<node resource-id="com.melodix.music:id/${id}" text="${text || ''}" bounds="[0,0][100,100]" />`
  ).join('');
  return `<?xml version="1.0"?><hierarchy>${body}</hierarchy>`;
}

function traceStep(step, xml) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-trace-'));
  const dumpPath = path.join(dir, 'dump.xml');
  const tracePath = path.join(dir, 'trace.json');
  fs.writeFileSync(dumpPath, xml);
  let status = 0;
  try {
    execFileSync('python3', [path.join(root, 'scripts', 'ui_qa_trace.py'),
      step, 'phone', dumpPath, tracePath], { encoding: 'utf8' });
  } catch (error) { status = error.status; }
  const entry = JSON.parse(fs.readFileSync(tracePath, 'utf8'))[0];
  fs.rmSync(dir, { recursive: true, force: true });
  return { status, entry };
}

const SETTINGS_NODES = [['nativeRoot', ''], ['nativeTabBar', ''], ['nativeHomeTab', ''],
  ['nativeContent', ''], ['nativeBackButton', ''], ['nativeScreenTitle', 'Paramètres']];
const HOME_NODES = [['nativeRoot', ''], ['nativeTabBar', ''], ['nativeHomeTab', ''],
  ['nativeContent', ''], ['nativeScreenTitle', 'Accueil']];

test('staying on Settings is NOT a successful back step', () => {
  const { status, entry } = traceStep('back-from-settings', traceDump(SETTINGS_NODES));
  assert.equal(entry.verdict, 'wrong_screen');
  assert.equal(status, 1);
  assert.ok(entry.forbidden_present.includes('nativeBackButton'));
  assert.equal(entry.title_matched, false);
});

test('actually landing on Home is a successful back step', () => {
  const { status, entry } = traceStep('back-from-settings', traceDump(HOME_NODES));
  assert.equal(entry.verdict, 'reached');
  assert.equal(status, 0);
});

test('Settings content surviving onto Home is reported, not ignored', () => {
  const nodes = HOME_NODES.concat([['nativeSettingsLeak', 'Paramètres indisponibles']]);
  const { status, entry } = traceStep('home-again', traceDump(nodes));
  assert.equal(entry.verdict, 'wrong_screen');
  assert.equal(status, 1);
  assert.equal(entry.unexpected_chrome_present, true);
});

test('the trace never echoes screen text into the log', () => {
  const secret = 'Jean Dupont Premium';
  const nodes = HOME_NODES.concat([['nativeRow', secret]]);
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-trace-priv-'));
  const dumpPath = path.join(dir, 'd.xml');
  const tracePath = path.join(dir, 't.json');
  fs.writeFileSync(dumpPath, traceDump(nodes));
  let out = '';
  try {
    out = execFileSync('python3', [path.join(root, 'scripts', 'ui_qa_trace.py'),
      'home-again', 'phone', dumpPath, tracePath], { encoding: 'utf8' });
  } catch (error) { out = (error.stdout || '') + (error.stderr || ''); }
  assert.ok(!out.includes(secret), 'account data must not reach the log');
  assert.ok(!fs.readFileSync(tracePath, 'utf8').includes(secret),
    'account data must not reach the published trace either');
  fs.rmSync(dir, { recursive: true, force: true });
});

test('a missing dump is unreadable, not a crash', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-trace-missing-'));
  const tracePath = path.join(dir, 't.json');
  let status = 0;
  try {
    execFileSync('python3', [path.join(root, 'scripts', 'ui_qa_trace.py'),
      'home-again', 'phone', path.join(dir, 'absent.xml'), tracePath], { encoding: 'utf8' });
  } catch (error) { status = error.status; }
  assert.equal(status, 1);
  assert.equal(JSON.parse(fs.readFileSync(tracePath, 'utf8'))[0].verdict, 'unreadable');
  fs.rmSync(dir, { recursive: true, force: true });
});

test('every workflow step using $PROFILE declares it, and a probe never blocks the walk', () => {
  const raw = fs.readFileSync(path.join(root, '.github', 'workflows', 'ui-qa.yml'), 'utf8');
  // A per-step env is easy to forget: `set -u` then kills the step before it
  // creates its output directory, which is exactly how the first probe run died.
  const blocks = raw.split(/\n\s*- name: /).slice(1);
  for (const block of blocks) {
    const name = block.split('\n')[0].trim();
    if (!/\$PROFILE|\$\{PROFILE\}/.test(block)) continue;
    assert.ok(/PROFILE:\s*\$\{\{\s*matrix\.profile\s*\}\}/.test(block),
      `step "${name}" reads $PROFILE so it must declare it`);
  }
  const probe = blocks.find((b) => b.startsWith('Probe the resource table'));
  assert.ok(probe, 'the probe step must exist');
  assert.match(probe, /continue-on-error: true/,
    'a diagnostic must not prevent the QA walk from running');
});

test('the walk waits for the defining view instead of a fixed sleep', () => {
  const walk = fs.readFileSync(path.join(root, 'scripts', 'ui_qa_walk.sh'), 'utf8');
  assert.match(walk, /^settle\(\)/m, 'a bounded wait must exist');
  for (const [step, view] of [['library', 'nativeLibraryCategories'],
    ['search', 'nativeSearchInput'], ['settings', 'nativeBackButton']]) {
    assert.ok(walk.includes(`settle ${view}`),
      `${step} must wait for ${view}: the tablet dumped mid-transition`);
  }
  assert.match(walk, /settle\(\)[\s\S]*?return 1[\s\S]*?\}/,
    'the wait must give up and say so, never hang');
});

test('an expected navigation failure is given time to happen', () => {
  const walk = fs.readFileSync(path.join(root, 'scripts', 'ui_qa_walk.sh'), 'utf8');
  const back = walk.slice(walk.indexOf('KEYCODE_BACK'), walk.indexOf('capture back-from-settings'));
  const secs = Number((back.match(/sleep (\d+)/) || [])[1]);
  assert.ok(secs >= 8,
    'claiming the Back key fails requires more than a transition delay');
  // It must NOT wait for the Home screen: that would mask the very defect.
  assert.ok(!/settle nativeHomeTab/.test(back), 'do not wait away a real failure');
});

test('the resource probe output is published with the captures', () => {
  const raw = fs.readFileSync(path.join(root, '.github', 'workflows', 'ui-qa.yml'), 'utf8');
  assert.ok(raw.includes('resource-table.txt'),
    'a diagnostic nobody can read is not evidence');
});

test('a genre tap without a session does not claim results appeared', () => {
  const { entry } = traceStep('browse-tile', traceDump(HOME_NODES));
  assert.equal(entry.verdict, 'reached');
  assert.match(entry.scope_note, /authenticated session/,
    'the published trace itself must carry the limit, not just the report');
});

test('the suite runs in CI with a compiler, and skips are treated as failures there', () => {
  const raw = fs.readFileSync(path.join(root, '.github', 'workflows', 'ui-qa.yml'), 'utf8');
  assert.ok(raw.includes('unit-tests:'), 'the suite must run automatically, not only on dispatch');
  const job = raw.slice(raw.indexOf('unit-tests:'));
  assert.match(job, /setup-java/, 'the three JVM rules only execute when javac exists');
  assert.match(job, /npm test/);
  assert.match(job, /pass \+ fail \+ skip/, 'discovered tests must all be accounted for');
  assert.match(job, /skipped although a Java compiler is installed/,
    'a skip in CI means the environment regressed, never that the rule passed');
});

test('anonymous rows and cards are measured, not guessed from pixels', () => {
  const src = fs.readFileSync(path.join(root, 'scripts', 'ui_layout_audit.py'), 'utf8');
  assert.match(src, /container_items/, 'items without an id must still be measured');
  for (const c of ['nativeContent', 'nativeGenreScroll', 'nativeLibraryCategories']) {
    assert.ok(src.includes(c), `${c} holds anonymous items`);
  }
  assert.ok(!/"text"/.test(src.slice(src.indexOf('containers = ('), src.indexOf('report.update'))),
    'geometry only: no text may be published');
});

test('every trace step definition is usable, not just the ones with all keys', () => {
  // A new step omitted "optional" and main() indexed it directly: the walk
  // reported 4 failures that were tooling crashes, not app defects. Every step
  // must run, and a missing dump must yield "unreadable" rather than a KeyError.
  const src = fs.readFileSync(path.join(root, 'scripts', 'ui_qa_trace.py'), 'utf8');
  const steps = [...src.matchAll(/^    "([a-z-]+)": \{/gm)].map((m) => m[1]);
  assert.ok(steps.length >= 15, `expected the full step set, got ${steps.length}`);
  assert.ok(!/spec\["optional"\]|spec\["required"\]/.test(src),
    'optional keys must be read with a default');
  for (const step of steps) {
    const { entry } = traceStep(step, traceDump(HOME_NODES));
    assert.ok(entry.verdict, `${step} must produce a verdict`);
  }
});
