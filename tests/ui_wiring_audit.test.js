// Every native control must reach a real implementation. This is the guard that
// stops a future UI change from leaving a button pointing at nothing.
//
// It is a STATIC audit: it proves the chain layout -> smali -> injected JS ->
// source definition exists. It does not prove Spotify honours it at runtime,
// which needs an authenticated session and is tracked separately.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

const root = path.join(__dirname, '..');
const script = path.join(root, 'scripts', 'ui_wiring_audit.py');

function audit() {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'mel-wiring-'));
  const out = path.join(dir, 'wiring.json');
  let status = 0;
  try {
    execFileSync('python3', [script, out], { encoding: 'utf8' });
  } catch (error) { status = error.status; }
  const report = JSON.parse(fs.readFileSync(out, 'utf8'));
  fs.rmSync(dir, { recursive: true, force: true });
  return { status, report };
}

test('no native control is left unwired or half-wired', () => {
  const { status, report } = audit();
  assert.equal(status, 0, 'a missing or partial handler must fail');
  assert.equal(report.counts.missing || 0, 0, 'every onClick must have a handler');
  assert.equal(report.counts.partial || 0, 0, 'every referenced JS function must be defined');
  const broken = report.handlers.filter((h) => h.status === 'missing' || h.status === 'partial');
  assert.deepEqual(broken.map((h) => h.handler), []);
});

test('every layout control is audited on both form factors', () => {
  const { report } = audit();
  assert.ok(report.handler_count >= 15, `expected the full control set, got ${report.handler_count}`);
  for (const entry of report.handlers) {
    if (entry.handler.startsWith('NativeRowClickListener')) continue;
    assert.ok(entry.layouts.includes('res/layout/activity_main.xml'),
      `${entry.handler} must exist on the phone`);
    assert.ok(entry.layouts.includes('res/layout-sw600dp/activity_main.xml'),
      `${entry.handler} must exist on the tablet too`);
  }
});

test('the transport controls reach the real playback functions', () => {
  const { report } = audit();
  const by = (name) => report.handlers.find((h) => h.handler === name);
  assert.ok(by('onNativePlayPauseClick').js_references.includes('__sfTogglePlayback'));
  assert.ok(by('onNativePlayerNextClick').js_references.includes('__sfSkip'));
  assert.ok(by('onNativePlayerPreviousClick').js_references.includes('__sfSkip'));
  assert.ok(by('onNativePlayerShuffleClick').js_references.includes('actShuffle'));
  assert.ok(by('onNativePlayerRepeatClick').js_references.includes('actRepeat'));
});

test('the library-to-playlist path is wired through the row listener', () => {
  const { report } = audit();
  const row = report.handlers.find((h) => h.handler.includes('openNativeRow'));
  assert.ok(row, 'row taps must be audited');
  assert.equal(row.status, 'wired');
  assert.ok(row.js_references.includes('__sfOpenCollection'),
    'a row opens a real Spotify collection');
});

test('navigation-only handlers are classified honestly, not as wired', () => {
  const { report } = audit();
  const back = report.handlers.find((h) => h.handler === 'onNativeBackClick');
  assert.equal(back.status, 'navigation', 'back changes screen, it does not call Spotify');
  const expand = report.handlers.find((h) => h.handler === 'onNativePlayerExpandClick');
  assert.equal(expand.status, 'navigation');
});

test('the audit states its own limit', () => {
  const { report } = audit();
  assert.match(report.scope, /authenticated session/,
    'a static audit must not be presented as runtime proof');
});
