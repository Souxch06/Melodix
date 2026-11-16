'use strict';
// Fast safety checks for the page jobs used by the native player buttons.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { JSDOM } = require('jsdom');
const mode = fs.readFileSync(path.join(__dirname, 'mode-job.js'), 'utf8');
const queue = fs.readFileSync(path.join(__dirname, 'queue-job.js'), 'utf8');

function page(html) {
  const dom = new JSDOM(`<!doctype html><body>${html}</body>`, { runScripts: 'outside-only', pretendToBeVisual: true });
  return dom;
}
const run = (dom, src, ...args) => JSON.parse(dom.window.eval(`(${src})(${args.map((a) => JSON.stringify(a)).join(',')})`));
const settle = (ms) => new Promise((r) => setTimeout(r, ms));

test('scripts never touch storage, cookies, tokens, network or navigation', () => {
  for (const raw of [mode, queue]) {
    const src = raw.split('\n').filter((l) => !l.trim().startsWith('//')).join('\n');
    for (const bad of ['localStorage', 'sessionStorage', 'cookie', 'fetch(', 'XMLHttpRequest', 'api.spotify.com', 'location.href', 'location.assign', 'history.', 'token', 'Authorization']) {
      assert.equal(src.includes(bad), false, bad);
    }
  }
});

test('like with an unknown displayed state is read, never removed', async () => {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Titre</a>
    <button data-testid="add-button" aria-label="Retirer des titres likés" aria-checked="true">l</button></aside>`);
  let clicks = 0; dom.window.document.querySelector('button').addEventListener('click', () => clicks++);
  assert.equal(run(dom, mode, 'like', 'run', 'unknown', 'Titre').status, 'started');
  await settle(50);
  const out = run(dom, mode, 'like', 'poll');
  assert.equal(out.outcome, 'read'); assert.equal(out.state, 'true'); assert.equal(clicks, 0);
});

test('like is not clicked for another track or a contradictory state', async () => {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Autre</a>
    <button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false">l</button></aside>`);
  let clicks = 0; dom.window.document.querySelector('button').addEventListener('click', () => clicks++);
  run(dom, mode, 'like', 'run', 'false', 'Titre'); await settle(50);
  assert.equal(run(dom, mode, 'like', 'poll').outcome, 'identity'); assert.equal(clicks, 0);
  const conflict = page(`<aside data-testid="now-playing-bar"><button data-testid="add-button" aria-label="Retirer des titres likés" aria-checked="false">l</button></aside>`);
  run(conflict, mode, 'like', 'run', 'false', ''); await settle(50);
  assert.notEqual(run(conflict, mode, 'like', 'poll').outcome, 'confirmed');
});

test('shuffle: direct control is clicked once and the new state is verified', async () => {
  const dom = page(`<button data-testid="control-button-shuffle" aria-label="Activer la lecture aléatoire" aria-checked="false">s</button>`);
  const b = dom.window.document.querySelector('button'); let clicks = 0;
  b.addEventListener('click', () => { clicks++; b.setAttribute('aria-checked', 'true'); b.setAttribute('aria-label', 'Désactiver la lecture aléatoire'); });
  run(dom, mode, 'shuffle', 'run', 'false', ''); await settle(300);
  const out = run(dom, mode, 'shuffle', 'poll');
  assert.equal(out.outcome, 'confirmed'); assert.equal(out.state, 'true'); assert.equal(out.method, 'direct'); assert.equal(clicks, 1);
});

test('shuffle absent from the narrow bar: now-playing view opened, used, then closed', async () => {
  const dom = page(`<button data-testid="control-button-npv" aria-label="Vue « en cours de lecture »" aria-pressed="false">v</button><div id="npv"></div>`);
  const doc = dom.window.document, opener = doc.querySelector('button'); let opened = 0, closed = 0;
  opener.addEventListener('click', () => {
    if (opener.getAttribute('aria-pressed') === 'false') {
      opened++; opener.setAttribute('aria-pressed', 'true');
      const s = doc.createElement('button'); s.setAttribute('data-testid', 'control-button-shuffle'); s.setAttribute('aria-checked', 'false');
      s.addEventListener('click', () => s.setAttribute('aria-checked', 'true')); doc.getElementById('npv').append(s);
    } else { closed++; opener.setAttribute('aria-pressed', 'false'); doc.getElementById('npv').innerHTML = ''; }
  });
  run(dom, mode, 'shuffle', 'run', 'unknown', ''); await settle(900);
  const out = run(dom, mode, 'shuffle', 'poll');
  assert.equal(out.outcome, 'confirmed'); assert.equal(out.method, 'now-playing-view'); assert.equal(opened, 1); assert.equal(closed, 1);
});

test('no control and no view: keyboard for shuffle is unverified; like is never sent blind', async () => {
  const dom = page('<div></div>'); let keys = 0;
  dom.window.document.addEventListener('keydown', (e) => { if (e.altKey) keys++; });
  run(dom, mode, 'shuffle', 'run', 'unknown', ''); await settle(50);
  assert.equal(run(dom, mode, 'shuffle', 'poll').outcome, 'unverified'); assert.equal(keys, 1);
  run(dom, mode, 'like', 'run', 'unknown', ''); await settle(50);
  assert.equal(run(dom, mode, 'like', 'poll').outcome, 'failed'); assert.equal(keys, 1);
});

test('queue: opens the panel, reads rows with duration, closes it again', async () => {
  const dom = page(`<button data-testid="control-button-queue" aria-label="File d’attente" aria-pressed="false">q</button><div id="slot"></div>`);
  const doc = dom.window.document, b = doc.querySelector('button'); let closes = 0;
  b.addEventListener('click', () => {
    if (b.getAttribute('aria-pressed') === 'false') {
      b.setAttribute('aria-pressed', 'true');
      doc.getElementById('slot').innerHTML = `<aside aria-label="File d’attente">
        <div data-testid="tracklist-row"><a href="/track/1">Titre A</a><a href="/artist/1">Artiste A</a><div>3:21</div></div>
        <div data-testid="tracklist-row"><a href="/track/2">Titre B</a><a href="/artist/2">Artiste B</a></div></aside>`;
    } else { closes++; b.setAttribute('aria-pressed', 'false'); doc.getElementById('slot').innerHTML = ''; }
  });
  assert.equal(run(dom, queue, 'run').status, 'started'); await settle(500);
  const out = run(dom, queue, 'poll');
  assert.equal(out.ok, true); assert.equal(out.now, 'Titre A\tArtiste A\t3:21'); assert.equal(out.next, 'Titre B\tArtiste B\t'); assert.equal(closes, 1);
});

test('queue: missing control reports a short reason without opening anything', async () => {
  const dom = page('<div></div>');
  run(dom, queue, 'run'); await settle(50);
  const out = run(dom, queue, 'poll');
  assert.equal(out.ok, false); assert.equal(out.reason, 'absent');
});
