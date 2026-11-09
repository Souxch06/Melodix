'use strict';

// Startup instrumentation contract (step 1 of the Home latency work).
//
// These are non-regression tests for the MEASUREMENT, not for the optimisation:
// they fail if a mark disappears, if a mark stops reaching the journal, or if
// the closed grammar that keeps page text out of the diagnostic is widened.
//
// What is asserted is what can be asserted without a device: the marks exist at
// the right places, they are one-shot where repetition would hide a regression,
// and the native allowlist still rejects free text.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');
const method = (src, signature) => {
  const at = src.indexOf(signature);
  assert.ok(at >= 0, signature + ' exists');
  return src.slice(at, src.indexOf('.end method', at));
};

test('every launch milestone the review asked for is emitted by the app itself', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  // The call is a /range invoke (this method is register-tight), so the
  // assertion accepts both spellings and only requires the same register.
  assert.match(activity, /const-string v1, "activity-create"[\s\S]{0,320}invoke-static(?:\/range \{v1 \.\. v1\}| \{v1\}), Lcom\/melodix\/music\/NativeCrashGuard;->perfMark/,
    'activity-create anchors the whole table');
  assert.match(activity, /const-string v1, "content-view"[\s\S]{0,200}perfMark/);
  assert.match(activity, /const-string v1, "webview-created"[\s\S]{0,120}perfMark/);
  assert.match(activity, /"webview-load-start"[\s\S]{0,320}loadUrl/,
    'the load mark sits immediately before the navigation that starts the wait');

  const webClient = read('smali/c91.smali');
  assert.match(webClient, /"page-loaded"[\s\S]{0,160}perfMark/,
    'page-loaded is emitted from onPageFinished, not from the shell');

  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  // `:shelf_done` is both a jump target and the label; anchor on the label at
  // the start of a line so the earlier `goto :shelf_done` cannot match.
  const doneAt = renderer.search(/^    :shelf_done$/m);
  assert.ok(doneAt >= 0, 'the attached-cards exit exists');
  assert.match(renderer.slice(doneAt, doneAt + 900),
    /const-string v0, "home-first-paint"\s*\n\s*invoke-static \{v0\}, Lcom\/melodix\/music\/NativeCrashGuard;->perfMark/,
    'first paint is recorded once the cards are attached');

  const loader = read('smali/com/melodix/music/NativeImageLoader.smali');
  const mark = read('smali/com/melodix/music/NativeImageLoader$FirstImageMark.smali');
  assert.match(loader, /NativeImageLoader\$FirstImageMark;-><init>\(\)V/,
    'the first drawn cover is observed through a Picasso callback');
  assert.match(mark, /"home-first-image"[\s\S]{0,120}perfMark/);
  assert.match(mark, /sget-boolean v0, Lcom\/melodix\/music\/NativeImageLoader\$FirstImageMark;->reported:Z/,
    'it reports exactly once per process: 24 cards must not flood the journal');
  assert.match(mark, /sget-boolean[^\n]*reported:Z\s+if-nez v0, :done/,
    'the initial false flag must allow the first success, not suppress it');
  assert.doesNotMatch(method(mark, '.method public final onError(Ljava/lang/Exception;)V'), /perfMark/,
    'a failed image is never reported as "displayed"');
});

test('page-side timings observe every token attempt without relying on shell installation', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const bridge = read('scripts/spotify_bridge.source.js');
  assert.match(shell, /diagTrace\('perf css-ready=0'\)/);
  assert.match(shell, /if \(window\.__sfNativeUiShellStarted\) return;/,
    'install marks remain one-shot per page');
  assert.match(bridge, /perfMarkBridge\('token-request', 0\);\s+const bearerToken = await fetchWebPlayerToken\(\);/);
  assert.match(bridge, /perfMarkBridge\('token-ready'/);
  assert.match(bridge, /perfMarkBridge\('library-response'/);
  const helper = bridge.slice(bridge.indexOf('function perfMarkBridge('), bridge.indexOf('function notifyMediaLibUiChange'));
  assert.match(helper, /traceLibraryEvent\('perf '/);
  assert.doesNotMatch(helper, /perfSeen|__sfPerfMark/,
    'warm resumes and pre-shell token attempts must still be observed');
  const evaluate = new Function('value', 'return Math.max(0, Math.min(999999, value | 0));');
  assert.match(helper, /Math\.max\(0, Math\.min\(999999, value \| 0\)\)/);
  for (const input of [undefined, null, '', 'abc', -5, 0, 1234, 1e9, NaN, Infinity, 12.7]) {
    assert.match('perf x=' + evaluate(input), /^perf x=[0-9]{1,6}$/);
  }
});

test('the native journal accepts only the closed perf grammar', () => {
  const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
  const perf = method(guard, '.method public static perfMark');
  assert.match(perf, /"\|\S*activity-create\S*\|"/,
    'the label allowlist is a fixed literal');
  assert.match(perf, /String;->contains\(Ljava\/lang\/CharSequence;\)Z[\s\S]{0,80}if-eqz v1, :perf_done/,
    'an unknown label is dropped, never recorded as "unknown"');
  assert.match(perf, /SystemClock;->elapsedRealtime\(\)J/, 'monotonic stamp');
  assert.match(perf, /const-string v1, "t="/, 'the entry starts with a monotonic stamp');
  assert.match(perf, /const-string v4, " perf "\s*\n?\s*invoke-virtual \{v3, v4\}, Ljava\/lang\/StringBuilder;->append/,
    'and is joined to the existing `|`-separated journal, not a new format');

  const bridgeClass = read('smali/com/melodix/music/AndBridge.smali');
  assert.match(bridgeClass,
    /\^perf \(css-ready\|token-request\|token-ready\|library-request\|library-response\|home-payload\|home-first-paint\|home-first-image\|home-cache-hit\|home-cache-miss\)=\[0-9\]\{1,6\}\$/,
    'the page-facing grammar is a closed enum plus digits');
  assert.doesNotMatch(bridgeClass, /\^perf \(\.\*\)/,
    'never a wildcard: the page is not a trusted diagnostics source');
});

test('the instrumentation cannot alter the authentication or proof logic', () => {
  // A timing mark is an observation. If a mark ever appears in a branch that
  // decides session proof, login routing or ad blocking, this test fails.
  const files = {
    'smali/com/melodix/music/NativeCrashGuard.smali': /perfMark/,
    'smali/com/melodix/music/MainActivity.smali': /perfMark/,
    'smali/com/melodix/music/NativeHomeShelfRenderer.smali': /perfMark/,
    'smali/c91.smali': /perfMark/,
  };
  for (const file of Object.keys(files)) {
    const source = read(file);
    for (const match of source.matchAll(/[^\n]*perfMark[^\n]*\n/g)) {
      const line = match[0];
      assert.doesNotMatch(line, /proof|Proof|sp_dc|CookieManager|login|Login/,
        `${file}: a timing mark must not sit in an auth decision (${line.trim()})`);
    }
  }
  const shell = read('scripts/native_ui_shell.source.js');
  const bridge = read('scripts/spotify_bridge.source.js');
  for (const source of [shell, bridge]) {
    for (const match of source.matchAll(/[^\n]*perfMark(?:Once|Bridge)?\([^\n]*\n/g)) {
      assert.doesNotMatch(match[0], /SessionProven\s*=|libraryProvesSession\s*=|sp_dc/,
        'a timing mark must never write proof state');
    }
  }
});

test('the journal reader builds a timeline from real stamps and says NOT MEASURED otherwise', () => {
  const { execFileSync } = require('node:child_process');
  const os = require('node:os');
  const script = path.join(root, 'scripts', 'startup_timing_journal.py');

  // A synthetic journal: stamps are monotonic milliseconds like the app's own
  // `t=` values. No account data, no real device.
  const journal = [
    'sid=ab12 t=1000 perf activity-create',
    'sid=ab12 t=1042 perf content-view',
    'sid=ab12 t=1180 perf webview-created',
    'sid=ab12 t=1205 perf webview-load-start',
    'sid=ab12 t=2410 perf page-loaded',
    'sid=ab12 t=2480 perf css-ready value=0',
    'sid=ab12 t=3950 perf library-request value=1470',
    'sid=ab12 t=4600 perf library-response value=650',
    'sid=ab12 home-data stage=web-to-android result=sent',
    'sid=ab12 t=4700 home-data stage=android-render-start result=started',
    'sid=ab12 t=4800 perf home-first-paint',
    'sid=ab12 home-data stage=web-to-android result=sent',
    'sid=ab12 t=4900 home-data stage=android-render-start result=started',
    'sid=ab12 t=5200 perf home-first-image'
  ].join(' | ');
  const file = path.join(os.tmpdir(), 'melodix-perf-fixture.txt');
  fs.writeFileSync(file, journal);
  const output = execFileSync('python3', [script, file], { encoding: 'utf8' });

  assert.match(output, /activity-create/);
  // 2410 - 1000 = 1410ms to the page load, 4800 - 1000 = 3800ms to first paint.
  assert.match(output, /page chargée \(onPageFinished\)\s+1410 ms/);
  assert.match(output, /premières cartes attachées \(avant draw\)\s+3800 ms/);
  assert.match(output, /première pochette chargée \(Picasso\)\s+4200 ms/);
  // Two payloads produced two renders: the review's repeated-render symptom.
  assert.match(output, /payloads Home envoyés : 2/);
  assert.match(output, /rendus natifs\s+: 2/);
  assert.match(output, /rendus par payload\s+: 1/);

  // A journal without the anchor must fail closed rather than invent a table.
  fs.writeFileSync(file, 'sid=ab12 t=100 perf page-loaded');
  let failed = false;
  try {
    execFileSync('python3', [script, file], { encoding: 'utf8', stdio: 'pipe' });
  } catch (error) {
    failed = true;
    assert.match(String(error.stderr), /NOT MEASURED/);
  }
  assert.ok(failed, 'without activity-create there is nothing to anchor on');
  fs.unlinkSync(file);
});

test('the offline probe measures JavaScript work only and never a Spotify account', () => {
  const { execFileSync } = require('node:child_process');
  const output = execFileSync('node', [path.join(root, 'scripts', 'perf_startup_probe.js')],
    { encoding: 'utf8' });
  const report = JSON.parse(output);
  assert.ok(Array.isArray(report.install_ms) && report.install_ms.length >= 1);
  assert.ok(report.fixture.cards > 0, 'the fixture is synthetic cards, not a real library');
  assert.deepEqual(report.stable_dom.cumulative_home_payloads, [1, 1, 1, 1],
    'three observer callbacks on unchanged DOM do not cause three more payloads');
  assert.match(report.note, /Device wall-clock stages are NOT measured here/,
    'the probe must never claim a device measurement it cannot make');
  assert.doesNotMatch(output, /sp_dc|access_token|refresh_token|Bearer [A-Za-z0-9]/,
    'the probe output carries no credential-like value');
});

test('the complete native log timestamps page events and preserves the bounded phone tail', () => {
  const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
  const diag = method(guard, '.method public static diagLine(');
  assert.match(diag, /SystemClock;->elapsedRealtime\(\)J/);
  assert.match(diag, /const-string v1, "MDXTRACE"[\s\S]*Log;->i/);
  assert.match(diag, /const\/16 v3, 0x400/, 'do not enlarge the phone preference journal');
  assert.match(diag, /if-nez v5, :prefix_diagnostic_id/,
    'a perfMark that already has a native stamp must not be stamped twice');
});

test('the reader isolates the latest launch, rejects unclocked anchors and ignores logcat duplicates', () => {
  const { execFileSync } = require('node:child_process');
  const script = `
import importlib.util, json, sys
spec = importlib.util.spec_from_file_location('startup', sys.argv[1])
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
old = '11-04 12:00:00.000 I MDXTRACE: sid=old t=100 perf activity-create'
new = 'I/MDXTRACE( 1234): sid=new t=1000 perf activity-create'
sent = 'home-data stage=web-to-android result=sent'
log = '\\n'.join([old, 'I MDXTRACE: sid=old t=200 ' + sent, new,
    'I MDXTRACE: sid=new ' + sent, 'I MDXTRACE: sid=new t=1100 ' + sent,
    'I MDXTRACE: sid=new t=1200 home-data stage=android-render-start result=started',
    'I MDXTRACE: sid=new t=1300 perf home-first-image'])
r = m.build_report(m.parse_entries(log))
assert len(m.parse_entries('I/MDXTRACE( 1234): sid=new t=1000 perf activity-create')) == 1
assert r['counters']['home_payloads'] == 1
assert r['counters']['home_renders'] == 1
assert next(x for x in r['milestones'] if x['marker'] == 'home-first-image')['offset_ms'] == 300
assert m.build_report(['sid=x perf activity-create']) is None
assert m.build_report(['sid=x t=100 random activity-create']) is None
print(json.dumps(r['counters']))
`;
  const output = execFileSync('python3', ['-c', script,
    path.join(root, 'scripts/startup_timing_journal.py')], { encoding: 'utf8' });
  assert.equal(JSON.parse(output).home_payloads, 1);
});

test('phone copy has a bounded independent measurement section at both diagnostic entry points', () => {
  const activity = read('smali/com/melodix/music/MainActivity.smali');
  const recorder = read('smali/com/melodix/music/NativeStartupTiming.smali');
  assert.match(method(activity, '.method public final onNativeDiagCopyClick('), /NativeStartupTiming;->appendTo/);
  assert.match(method(activity, '.method public final applyNativeUiData('), /"copy-diagnostic"[\s\S]{0,500}NativeStartupTiming;->appendTo/);
  assert.doesNotMatch(method(activity, '.method private final copyTextToClipboard('), /NativeStartupTiming/,
    'ordinary clipboard operations are not changed');
  assert.match(recorder, /MDXPERF-BEGIN v=1 dropped=/);
  assert.match(recorder, /MDXPERF-END/);
  assert.match(recorder, /const v3, 0x10000/);
  assert.match(recorder, /if-gt v2, v3, :record_drop/);
  assert.doesNotMatch(recorder, /SharedPreferences|CookieManager|WebView;|URL;|HttpURLConnection|setImage|setVisibility/);
  assert.match(method(activity, '.method public final onResume()'), /NativeStartupTiming;->resume/);
  assert.doesNotMatch(method(recorder, '.method public static resume()'), /->reset\(\)V/,
    'SSO resumes must not discard pre-login proof and navigation evidence');
});

test('the phone measurement grammar accepts real events and rejects account content', () => {
  const source = read('smali/com/melodix/music/NativeStartupTiming.smali');
  const literal = source.match(/const-string v0, "(\^sid=[^"\n]+)"/)[1];
  const grammar = new RegExp(JSON.parse('"' + literal + '"'));
  for (const event of ['perf activity-create', 'perf activity-resume', 'perf token-ready=120',
    'perf native-payload', 'perf native-rows', 'perf capture-end',
    'library.request.started attempt=1 request=1 source=shell-update',
    'library.request.response attempt=1 request=1 http=200 mime=json duration=123',
    'home-data stage=android-render-start result=started', 'js-shell-ready']) {
    assert.ok(grammar.test('sid=1234abcd t=1234 ' + event), event);
  }
  for (const event of ['perf access_token=123', 'perf token-ready=secret',
    'library.request.response attempt=1 request=1 http=200 mime=json duration=123 token=secret',
    'title=Personal playlist', 'url=https://example.test/?secret=value', 'cookie=secret']) {
    assert.ok(!grammar.test('sid=1234abcd t=1234 ' + event), event);
  }
});

test('phone resume captures isolate the dedicated section and expose actual recorded durations', () => {
  const { execFileSync } = require('node:child_process');
  const script = `
import importlib.util, sys
s = importlib.util.spec_from_file_location('startup', sys.argv[1])
m = importlib.util.module_from_spec(s); s.loader.exec_module(m)
text = '''legacy header url=private | sid=abcd1234 t=1 perf activity-create
MDXPERF-BEGIN v=1 dropped=0
sid=abcd1234 t=1000 perf activity-resume
sid=abcd1234 t=1100 perf token-ready=72
sid=abcd1234 t=1300 library.request.response attempt=1 request=1 http=403 mime=json duration=180
sid=abcd1234 t=1500 perf capture-end
MDXPERF-END'''
r = m.build_report(m.parse_entries(text))
assert r['anchor'] == 'activity-resume'
assert r['observed_until_ms'] == 500
assert r['durations'] == [dict(event='token-attempt', duration_ms=72), dict(event='library-response', duration_ms=180)]
assert r['counters']['home_payloads'] == 0
assert len(m.parse_entries(text)) == 4
assert m.parse_entries('MDXPERF-BEGIN v=1 dropped=0\\nsid=abcd1234 t=1 perf activity-create') == []
print('ok')
`;
  assert.match(execFileSync('python3', ['-c', script,
    path.join(root, 'scripts/startup_timing_journal.py')], { encoding: 'utf8' }), /ok/);
});

test('measurement CI is opt-in, same-source, artifact-only and never injects a session', () => {
  const workflow = read('.github/workflows/startup-measurement.yml');
  const capture = read('scripts/capture_startup_ci.sh');
  assert.match(workflow, /contains\(github.event.head_commit.message, '\[startup-measure\]'\)/);
  assert.match(workflow, /source_ref: \$\{\{ github.sha \}\}/);
  assert.match(workflow, /build_only: true/);
  assert.match(workflow, /sha256sum -c/);
  assert.match(workflow, /if: always\(\)/);
  assert.doesNotMatch(capture.replace(/^#.*$/gm, ''), /evaluateJavascript|setCookie|removeAllCookies|Bearer |--es .*token|fixture/i);
  for (const scenario of ['cold', 'warm', 'background']) assert.match(capture, new RegExp('capture ' + scenario + ' '));
  assert.match(capture, /--filter-log -/);
  assert.match(capture, /package="com\.melodix\.music\.preview"/);
  assert.match(capture, /activity="com\.melodix\.music\.MainActivity"/);
  assert.match(capture, /--github-notice/);
});


test('from-launch preserves pre-SSO navigation and proof without changing warm anchoring', () => {
  const { execFileSync } = require('node:child_process');
  const script = `
import importlib.util, sys
s = importlib.util.spec_from_file_location('startup', sys.argv[1])
m = importlib.util.module_from_spec(s); s.loader.exec_module(m)
entries = ['sid=abcd1234 t=100 perf activity-create',
 'sid=abcd1234 t=200 navigation source=button route=accounts',
 'sid=abcd1234 t=220 proof clear-accounts=F',
 'sid=abcd1234 t=900 perf activity-resume',
 'sid=abcd1234 t=950 navigation source=finish route=player',
 'sid=abcd1234 t=960 token-http endpoint=api phase=end http=200 duration=25',
 'sid=abcd1234 t=980 token-result status=ok duration=30',
 'sid=abcd1234 t=990 image result=loaded',
 'sid=abcd1234 t=991 token-result status=secret duration=1']
r = m.build_report(entries, from_launch=True)
assert r['anchor'] == 'activity-create'
assert r['observed_until_ms'] == 891
assert len(r['session_events']) == 6
assert r['session_events'][0] == dict(offset_ms=100, event='navigation source=button route=accounts')
assert all('secret' not in x['event'] for x in r['session_events'])
assert m.build_report(entries)['anchor'] == 'activity-resume'
print('ok')
`;
  assert.match(execFileSync('python3', ['-c', script,
    path.join(root, 'scripts/startup_timing_journal.py')], { encoding: 'utf8' }), /ok/);
});


test('GitHub notices keep session batches valid instead of truncating a long timeline', () => {
  const { execFileSync } = require('node:child_process');
  const os = require('node:os');
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-notice-'));
  try {
    const file = path.join(tmp, 'cold.txt');
    fs.writeFileSync(file, ['MDXPERF-BEGIN v=1 dropped=0',
      'sid=abcd1234 t=100 perf activity-create',
      ...Array.from({length: 100}, (_, i) =>
        `sid=abcd1234 t=${200+i} token-http endpoint=fallback phase=end http=403 duration=100`),
      'MDXPERF-END'].join('\n'));
    const out = execFileSync('python3', [path.join(root, 'scripts/startup_timing_journal.py'),
      file, '--github-notice'], {encoding: 'utf8'});
    const lines = out.split('\n').filter(x => x.startsWith('::notice'));
    assert.equal(lines.length, 10);
    let events = 0;
    for (const line of lines) {
      assert.ok(Buffer.byteLength(line) < 3500);
      const payload = JSON.parse(line.slice(line.indexOf('::', 2) + 2));
      if (Array.isArray(payload)) events += payload.length;
      else assert.equal(payload.session_event_count, 100);
    }
    assert.equal(events, 100);
  } finally { fs.rmSync(tmp, {recursive: true, force: true}); }
});
