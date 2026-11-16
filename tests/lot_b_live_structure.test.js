'use strict';
// Lot B / B1: behaviour and read-only checks for the live structural probe.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');
const { JSDOM } = require('jsdom');

const NATIVE = path.join(__dirname, '..', 'docs', 'audits', '2026-11-04-preview-historique-glass', 'native-candidat');
const PROBE_FILE = path.join(NATIVE, 'lot_b_live_structure.js');
const PATCH = path.join(NATIVE, 'apply_lot_b_live_structure.py');
const PROBE = fs.readFileSync(PROBE_FILE, 'utf8');

function pageWith(body) {
  const dom = new JSDOM(`<!doctype html><html><body>${body}</body></html>`, { runScripts: 'outside-only' });
  dom.window.eval(PROBE);
  return dom;
}

const PLAYER_PAGE = `
  <aside data-testid="now-playing-bar" data-spotify-uri="spotify:track:SECRET123">
    <span>SECRET TITRE</span><span>SECRET ARTISTE</span>
    <button aria-label="Lecture aléatoire activée" aria-pressed="true" data-testid="control-button-shuffle">x</button>
    <button aria-label="Répéter" aria-pressed="false" data-testid="control-button-repeat">x</button>
    <button aria-label="Pause" data-testid="control-button-playpause">x</button>
    <button aria-label="Retirer des titres likés" aria-pressed="true" disabled>like SECRET TITRE</button>
    <button aria-label="Nom privé: SECRET ARTISTE">autre</button>
  </aside>
  <div data-testid="volume-bar" aria-valuenow="42" role="slider">v</div>
`;

test('probe source has no event, click, network, storage, cookie or text-reading calls', () => {
  const forbidden = [
    'dispatchEvent', '.click(', 'fetch(', 'XMLHttpRequest', 'localStorage', 'sessionStorage',
    'document.cookie', 'textContent', 'innerText', 'innerHTML', '.focus(', '.submit(', '.value', 'eval(',
    'MutationObserver', 'setTimeout', 'setInterval'
  ];
  for (const token of forbidden) {
    assert.equal(PROBE.includes(token), false, `probe must not contain ${token}`);
  }
});

test('probe reports structure and never leaks titles, artists or identifiers', () => {
  const dom = pageWith(PLAYER_PAGE);
  const out = dom.window.__melodixLiveStructure();
  const json = JSON.stringify(out);
  for (const secret of ['SECRET', 'spotify:', '123', 'track']) {
    assert.equal(json.includes(secret), false, `output must not contain ${secret}`);
  }
  assert.equal(out.nowPlayingBarPresent, true);
  assert.equal(out.volumeBarPresent, true);
  assert.equal(out.controls['control-button-shuffle'].ariaPressed, 'true');
  assert.equal(out.controls['control-button-shuffle'].ariaLabel, 'Lecture aléatoire activée');
  assert.equal(out.controls['control-button-repeat'].ariaPressed, 'false');
  assert.equal(out.controls['control-button-playpause'].ariaLabel, 'Pause');
  assert.equal(out.controls['volume-bar'].ariaValueNow, '42');
  const like = out.nowPlayingBarButtons.find((b) => b.ariaLabel === 'Retirer des titres likés');
  assert.ok(like, 'like button state is reported');
  assert.equal(like.disabled, true);
  assert.equal(like.ariaPressed, 'true');
  const unknownLabel = out.nowPlayingBarButtons.find((b) => b.ariaLabel === 'other');
  assert.ok(unknownLabel, 'free-text aria-label is reduced to "other"');
});

test('probe does not mutate the DOM it reads', () => {
  const dom = pageWith(PLAYER_PAGE);
  const before = dom.window.document.body.innerHTML;
  dom.window.__melodixLiveStructure();
  dom.window.__melodixLiveStructure();
  assert.equal(dom.window.document.body.innerHTML, before);
});

test('probe fails closed when the page throws', () => {
  const dom = pageWith(PLAYER_PAGE);
  dom.window.document.querySelector = () => { throw new Error('boom'); };
  const out = dom.window.__melodixLiveStructure();
  assert.equal(JSON.stringify(out), JSON.stringify({ error: 'probe-failed' }));
});

test('patch applies once, refuses a second run, and fails closed on a missing anchor', () => {
  const work = fs.mkdtempSync(path.join(os.tmpdir(), 'lotb-'));
  fs.mkdirSync(path.join(work, 'assets'), { recursive: true });
  const fetchDir = path.join(work, 'smali/com/melodix/music');
  fs.mkdirSync(fetchDir, { recursive: true });
  const repo = path.join(__dirname, '..');
  fs.copyFileSync(path.join(repo, 'assets/runtime_diagnostic.js'), path.join(work, 'assets/runtime_diagnostic.js'));
  fs.copyFileSync(path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali'),
    path.join(fetchDir, 'RuntimeDiagnostic$FetchRunnable.smali'));

  execFileSync('python3', [PATCH, work], { stdio: 'pipe' });
  const js = fs.readFileSync(path.join(work, 'assets/runtime_diagnostic.js'), 'utf8');
  assert.equal(js.split('__melodixLiveStructure = function').length - 1, 1);
  assert.throws(() => execFileSync('python3', [PATCH, work], { stdio: 'pipe' }), /already patched/);

  const work2 = fs.mkdtempSync(path.join(os.tmpdir(), 'lotb2-'));
  fs.mkdirSync(path.join(work2, 'assets'), { recursive: true });
  fs.writeFileSync(path.join(work2, 'assets/runtime_diagnostic.js'), 'no anchor here\n');
  fs.mkdirSync(path.join(work2, 'smali/com/melodix/music'), { recursive: true });
  assert.throws(() => execFileSync('python3', [PATCH, work2], { stdio: 'pipe' }), /expected exactly one anchor/);
});

test('patched copy expression parses, returns {live, samples} and tolerates a missing probe', () => {
  const work = fs.mkdtempSync(path.join(os.tmpdir(), 'lotb3-'));
  fs.mkdirSync(path.join(work, 'assets'), { recursive: true });
  const fetchDir = path.join(work, 'smali/com/melodix/music');
  fs.mkdirSync(fetchDir, { recursive: true });
  const repo = path.join(__dirname, '..');
  fs.copyFileSync(path.join(repo, 'assets/runtime_diagnostic.js'), path.join(work, 'assets/runtime_diagnostic.js'));
  fs.copyFileSync(path.join(repo, 'smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali'),
    path.join(fetchDir, 'RuntimeDiagnostic$FetchRunnable.smali'));
  execFileSync('python3', [PATCH, work], { stdio: 'pipe' });
  const smali = fs.readFileSync(path.join(fetchDir, 'RuntimeDiagnostic$FetchRunnable.smali'), 'utf8');
  const line = smali.split('\n').find((l) => l.includes('__melodixRuntimeDiagnosticV2'));
  const expr = line.slice(line.indexOf('"') + 1, line.lastIndexOf('"'));

  const dom = new JSDOM('<!doctype html><html><body></body></html>', { url: 'https://open.spotify.com/', runScripts: 'outside-only' });
  const noProbe = dom.window.eval(expr);
  assert.equal(JSON.stringify(noProbe), JSON.stringify({ live: null, samples: null }));

  dom.window.eval(PROBE);
  const withProbe = dom.window.eval(expr);
  assert.equal(withProbe.live.version, 'lot-b-b1-2');
  assert.equal(withProbe.samples, null);

  const other = new JSDOM('<!doctype html><html><body></body></html>', { url: 'https://example.com/', runScripts: 'outside-only' });
  assert.equal(other.window.eval(expr), null);
});

test('open trace exposes counts, codes and durations only', () => {
  const dom = pageWith(PLAYER_PAGE);
  dom.window.__melodixOpenTrace = {kind: 'liked', phase: 'classified-empty', nav: 1, ready: 1, dom: 12, classified: 0, rendered: 0, tap: 1, first: -1, full: -1, updates: 0, secret: 'SECRET TITRE'};
  const out = dom.window.__melodixLiveStructure();
  assert.equal(out.openTrace.phase, 'classified-empty'); assert.equal(out.openTrace.domRows, 12); assert.equal(out.openTrace.classifiedRows, 0);
  assert.equal(JSON.stringify(out).includes('SECRET'), false);
});
