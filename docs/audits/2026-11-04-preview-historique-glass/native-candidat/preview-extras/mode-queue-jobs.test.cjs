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
  assert.equal(run(dom, mode, 'like', 'run', 'unknown', 'Titre', 'track:x').status, 'started');
  await settle(50);
  const out = run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x');
  assert.equal(out.outcome, 'read'); assert.equal(out.state, 'true'); assert.equal(clicks, 0);
});

test('like is not clicked for another track or a contradictory state', async () => {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Autre</a>
    <button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false">l</button></aside>`);
  let clicks = 0; dom.window.document.querySelector('button').addEventListener('click', () => clicks++);
  run(dom, mode, 'like', 'run', 'false', 'Titre', 'track:x'); await settle(50);
  assert.equal(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'identity'); assert.equal(clicks, 0);
  const conflict = page(`<aside data-testid="now-playing-bar"><button data-testid="add-button" aria-label="Retirer des titres likés" aria-checked="false">l</button></aside>`);
  run(conflict, mode, 'like', 'run', 'false', ''); await settle(50);
  assert.notEqual(run(conflict, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'confirmed');
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
  dom.window.document.addEventListener('keydown', (e) => { if (e.altKey || e.ctrlKey) keys++; });
  run(dom, mode, 'shuffle', 'run', 'unknown', ''); await settle(50);
  assert.equal(run(dom, mode, 'shuffle', 'poll').outcome, 'unverified'); assert.equal(keys, 1);
  run(dom, mode, 'like', 'run', 'unknown', ''); await settle(50);
  assert.equal(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'failed'); assert.equal(keys, 1);
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

function likePage(title, checked, label) {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">${title}</a>
    <button data-testid="add-button" aria-label="${label}" aria-checked="${checked}">l</button></aside>`);
  const b = dom.window.document.querySelector('button'); const counter = { clicks: 0 };
  b.addEventListener('click', () => { counter.clicks++; const now = b.getAttribute('aria-checked') === 'true'; b.setAttribute('aria-checked', String(!now)); b.setAttribute('aria-label', now ? 'Ajouter aux titres likés' : 'Retirer des titres likés'); });
  return { dom, counter };
}

test('like guarantee: an existing like is never clicked, whatever the native state shows', async () => {
  for (const shown of ['unknown', 'true', 'false']) {
    const { dom, counter } = likePage('Titre', 'true', 'Retirer des titres likés');
    run(dom, mode, 'like', 'run', shown, 'Titre', 'track:x'); await settle(60);
    const out = run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x');
    assert.equal(counter.clicks, 0, 'shown=' + shown); assert.equal(out.outcome, 'read'); assert.equal(out.state, 'true');
  }
});

test('like: a click that would invert the native view (shown not liked, page liked) is refused', async () => {
  const { dom, counter } = likePage('Titre', 'true', 'Retirer des titres likés');
  run(dom, mode, 'like', 'run', 'false', 'Titre', 'track:x'); await settle(60);
  assert.equal(counter.clicks, 0); assert.equal(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').state, 'true');
});

test('like: a verified not-liked title is added once and the new state is verified', async () => {
  const { dom, counter } = likePage('Titre', 'false', 'Ajouter aux titres likés');
  run(dom, mode, 'like', 'run', 'false', 'Titre', 'track:x'); await settle(300);
  const out = run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x');
  assert.equal(counter.clicks, 1); assert.equal(out.outcome, 'confirmed'); assert.equal(out.state, 'true');
});

test('like: an unconfirmed add is never retried (no second click)', async () => {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Titre</a>
    <button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false">l</button></aside>`);
  let clicks = 0; dom.window.document.querySelector('button').addEventListener('click', () => clicks++);
  run(dom, mode, 'like', 'run', 'unknown', 'Titre', 'track:x'); await settle(2600);
  assert.equal(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'unconfirmed'); assert.equal(clicks, 1);
});

test('keyboard: one combination per tap, Ctrl family then Alt on the next tap', async () => {
  const dom = page('<div></div>'); const seen = [];
  dom.window.document.addEventListener('keydown', (e) => seen.push((e.ctrlKey ? 'ctrl-' : '') + (e.altKey ? 'alt-' : '') + e.key));
  run(dom, mode, 'repeat', 'run', 'unknown', ''); await settle(40);
  run(dom, mode, 'repeat', 'run', 'unknown', ''); await settle(40);
  assert.deepEqual(seen, ['ctrl-r', 'alt-r']);
});

const panel = fs.readFileSync(path.join(__dirname, 'panel-job.js'), 'utf8');
test('lyrics: panel opened, lines read, active line only when synchronised, panel closed', async () => {
  const dom = page(`<button data-testid="lyrics-button" aria-label="Paroles" aria-pressed="false">p</button><main id="m"></main>`);
  const doc = dom.window.document, b = doc.querySelector('button'); let closes = 0;
  b.addEventListener('click', () => {
    if (b.getAttribute('aria-pressed') === 'false') { b.setAttribute('aria-pressed', 'true');
      doc.getElementById('m').innerHTML = '<div data-testid="lyrics-container"><div data-testid="fullscreen-lyric">Un</div><div data-testid="fullscreen-lyric" aria-current="true">Deux</div></div>'; }
    else { closes++; b.setAttribute('aria-pressed', 'false'); doc.getElementById('m').innerHTML = ''; }
  });
  run(dom, panel, 'lyrics', 'run', ''); await settle(500);
  const out = run(dom, panel, 'lyrics', 'poll');
  assert.equal(out.ok, true); assert.equal(out.body, 'Un\nDeux'); assert.equal(out.active, 1); assert.equal(closes, 1);
  for (const raw of [panel]) { const src = raw.split('\n').filter((l) => !l.trim().startsWith('//')).join('\n');
    for (const bad of ['localStorage', 'cookie', 'fetch(', 'XMLHttpRequest', 'token', 'location.href']) assert.equal(src.includes(bad), false, bad); }
});

test('devices: transfer clicks only the named device, verifies it, never clicks the active one', async () => {
  const html = `<button data-testid="control-button-connect" aria-label="Se connecter à un appareil" aria-expanded="false">c</button><div id="slot"></div>`;
  const dom = page(html), doc = dom.window.document, b = doc.querySelector('button'); let picks = 0;
  const render = (active) => `<div data-testid="device-picker"><div data-testid="device-list-item" aria-selected="${active === 'Salon'}"><span data-testid="device-name">Salon</span></div><div data-testid="device-list-item" aria-selected="${active === 'Web'}"><span data-testid="device-name">Web</span></div></div>`;
  let active = 'Web';
  b.addEventListener('click', () => {
    if (b.getAttribute('aria-expanded') === 'false') { b.setAttribute('aria-expanded', 'true'); doc.getElementById('slot').innerHTML = render(active);
      doc.querySelectorAll('[data-testid="device-list-item"]').forEach((row) => row.addEventListener('click', () => { picks++; active = row.textContent; doc.getElementById('slot').innerHTML = render(active); })); }
    else { b.setAttribute('aria-expanded', 'false'); doc.getElementById('slot').innerHTML = ''; }
  });
  run(dom, panel, 'devices', 'transfer', 'Web'); await settle(500);
  assert.equal(run(dom, panel, 'devices', 'poll').ok, true); assert.equal(picks, 0);
  run(dom, panel, 'devices', 'transfer', 'Salon'); await settle(900);
  const out = run(dom, panel, 'devices', 'poll');
  assert.equal(out.transferred, true); assert.equal(picks, 1);
});

test('duplicate controls: the player-bar copy is used; two copies outside it are refused, untouched', async () => {
  const panelSrc = fs.readFileSync(path.join(__dirname, 'panel-job.js'), 'utf8');
  const dom = page(`<div data-testid="now-playing-bar"><button data-testid="lyrics-button" aria-label="Paroles" aria-pressed="false">p</button></div>
    <section><button data-testid="lyrics-button" aria-label="Paroles">copy</button></section><main id="m"></main>`);
  const doc = dom.window.document, [inBar, copy] = doc.querySelectorAll('button'); let copyClicks = 0;
  copy.addEventListener('click', () => copyClicks++);
  inBar.addEventListener('click', () => {
    if (inBar.getAttribute('aria-pressed') === 'false') { inBar.setAttribute('aria-pressed', 'true'); doc.getElementById('m').innerHTML = '<div data-testid="lyrics-container"><div data-testid="fullscreen-lyric">Un</div></div>'; }
    else { inBar.setAttribute('aria-pressed', 'false'); doc.getElementById('m').innerHTML = ''; }
  });
  run(dom, panelSrc, 'lyrics', 'run', ''); await settle(500);
  const out = run(dom, panelSrc, 'lyrics', 'poll');
  assert.equal(out.ok, true); assert.equal(copyClicks, 0);
  const two = page(`<button data-testid="control-button-queue" aria-label="File d’attente">a</button><button data-testid="queue-button" aria-label="File d’attente">b</button>`);
  let clicks = 0; two.window.document.querySelectorAll('button').forEach((b) => b.addEventListener('click', () => clicks++));
  run(two, queue, 'run'); await settle(50);
  const q = run(two, queue, 'poll');
  assert.equal(q.ok, false); assert.equal(q.reason, 'ambiguous'); assert.equal(clicks, 0);
  assert.ok(q.journal.some((c) => /^button:ambiguous:2$/.test(c)));
});

test('desktop layout: queue in a labelled side panel without row markers is read from its track links', async () => {
  const dom = page(`<button data-testid="control-button-queue" aria-label="File d'attente" aria-pressed="false">q</button><div id="side"></div>`);
  const doc = dom.window.document, b = doc.querySelector('button');
  b.addEventListener('click', () => {
    if (b.getAttribute('aria-pressed') === 'false') { b.setAttribute('aria-pressed', 'true');
      doc.getElementById('side').innerHTML = `<aside aria-label="File d'attente"><ul><li><a href="/track/1">Un</a><a href="/artist/a">A</a><span>3:01</span></li><li><a href="/track/2">Deux</a><a href="/artist/b">B</a></li></ul></aside>`; }
    else { b.setAttribute('aria-pressed', 'false'); doc.getElementById('side').innerHTML = ''; }
  });
  run(dom, queue, 'run'); await settle(500);
  const out = run(dom, queue, 'poll');
  assert.equal(out.ok, true); assert.ok(out.now.startsWith('Un\tA\t3:01')); assert.ok(out.next.startsWith('Deux\tB'));
});

test('lyrics: a disabled lyrics button is reported, never clicked', async () => {
  const panelSrc = fs.readFileSync(path.join(__dirname, 'panel-job.js'), 'utf8');
  const dom = page(`<button data-testid="lyrics-button" aria-label="Paroles" disabled>p</button>`);
  let clicks = 0; dom.window.document.querySelector('button').addEventListener('click', () => clicks++);
  run(dom, panelSrc, 'lyrics', 'run', ''); await settle(50);
  const out = run(dom, panelSrc, 'lyrics', 'poll');
  assert.equal(out.ok, false); assert.equal(out.reason, 'disabled'); assert.equal(clicks, 0);
});

test('desktop layout: lyrics shown in the main view are read', async () => {
  const panelSrc = fs.readFileSync(path.join(__dirname, 'panel-job.js'), 'utf8');
  const dom = page(`<button data-testid="lyrics-button" aria-label="Paroles" aria-pressed="false">p</button><main id="main-view"></main>`);
  const doc = dom.window.document, b = doc.querySelector('button');
  b.addEventListener('click', () => {
    if (b.getAttribute('aria-pressed') === 'false') { b.setAttribute('aria-pressed', 'true'); doc.getElementById('main-view').innerHTML = '<div data-testid="lyrics-line-a">Ligne un</div><div data-testid="lyrics-line-b">Ligne deux</div>'; }
    else { b.setAttribute('aria-pressed', 'false'); doc.getElementById('main-view').innerHTML = ''; }
  });
  run(dom, panelSrc, 'lyrics', 'run', ''); await settle(500);
  const out = run(dom, panelSrc, 'lyrics', 'poll');
  assert.equal(out.ok, true); assert.equal(out.body, 'Ligne un\nLigne deux');
});

test('narrow page: the queue opened as its own /queue page is read from the main view', async () => {
  const dom = new JSDOM(`<!doctype html><body><button data-testid="control-button-queue" aria-label="File d'attente" aria-pressed="false">q</button><main id="main-view"></main></body>`, { url: 'https://open.spotify.com/', runScripts: 'outside-only', pretendToBeVisual: true });
  const doc = dom.window.document, b = doc.querySelector('button');
  b.addEventListener('click', () => {
    dom.reconfigure({ url: 'https://open.spotify.com/queue' });
    doc.getElementById('main-view').innerHTML = '<div data-testid="tracklist-row"><a href="/track/1">Un</a><a href="/artist/a">A</a></div><div data-testid="tracklist-row"><a href="/track/2">Deux</a><a href="/artist/b">B</a></div>';
  });
  run(dom, queue, 'run'); await settle(500);
  const out = run(dom, queue, 'poll');
  assert.equal(out.ok, true); assert.ok(out.now.startsWith('Un\tA')); assert.ok(out.next.startsWith('Deux\tB'));
});

test('hidden page: a 0-px queue panel is given a size while read, then restored exactly', async () => {
  const dom = page(`<button data-testid="control-button-queue" aria-label="File d'attente" aria-pressed="false">q</button><aside aria-label="File d'attente" style="color: red;"></aside>`);
  const doc = dom.window.document, b = doc.querySelector('button'), panel = doc.querySelector('aside');
  b.addEventListener('click', () => b.setAttribute('aria-pressed', b.getAttribute('aria-pressed') === 'false' ? 'true' : 'false'));
  // Like a virtualised list: rows exist only once the panel has a height.
  const timer = dom.window.setInterval(() => {
    if (panel.style.getPropertyValue('min-height') && !panel.querySelector('li')) panel.innerHTML = '<ul><li><a href="/track/1">Un</a><a href="/artist/a">A</a></li></ul>';
  }, 50);
  run(dom, queue, 'run'); await settle(1800); dom.window.clearInterval(timer);
  const out = run(dom, queue, 'poll');
  assert.equal(out.ok, true); assert.ok(out.now.startsWith('Un\tA'));
  assert.equal(panel.getAttribute('style'), 'color: red;');
  assert.ok(out.journal.some((c) => /^sized:1,h:0$/.test(c)));
});


test('like: refuse removal IDs, picker menus, generic or conflicting states', async () => {
  for (const attrs of [
    'data-testid="remove-button" aria-checked="false"',
    'data-testid="remove-from-library-button" aria-label="Ajouter aux titres likés" aria-checked="false"',
    'data-testid="add-button" aria-checked="false"',
    'data-testid="add-to-library-button" aria-checked="false" aria-pressed="true"',
    'data-testid="add-to-library-button" aria-checked="mixed" aria-label="Ajouter aux titres likés"',
  ]) {
    const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Titre</a><button ${attrs}>l</button></aside>`);
    let clicks = 0; dom.window.document.querySelector('button').onclick = () => clicks++;
    run(dom, mode, 'like', 'run', 'false', 'Titre', 'track:x');
    assert.equal(clicks, 0, attrs); assert.notEqual(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'confirmed'); dom.window.close();
  }
});

test('like: identity is required and must match both title and unique track', () => {
  for (const [expectedTitle, expectedTrack, href, title] of [
    ['', 'track:x', '/track/x', 'Titre'], ['Titre', '', '/track/x', 'Titre'],
    ['Titre', 'track:x', '/track/y', 'Titre'], ['Titre', 'track:x', '', 'Titre'],
    ['Titre', 'track:x', '/track/x', 'Autre'],
  ]) {
    const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="${href}">${title}</a><button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false">l</button></aside>`);
    let clicks = 0; dom.window.document.querySelector('button').onclick = () => clicks++;
    run(dom, mode, 'like', 'run', 'false', expectedTitle, expectedTrack);
    assert.equal(clicks, 0); assert.equal(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'identity'); dom.window.close();
  }
});

test('like: a track switch during confirmation cannot confirm the wrong item', async () => {
  const { dom, counter } = likePage('Titre', 'false', 'Ajouter aux titres likés');
  const button = dom.window.document.querySelector('button');
  // Defer the state change while Spotify changes to a same-name track.
  button.replaceWith(button.cloneNode(true));
  let clicks = 0; dom.window.document.querySelector('button').onclick = () => { clicks++; dom.window.document.querySelector('a').setAttribute('href', '/track/y'); dom.window.document.querySelector('button').setAttribute('aria-checked', 'true'); };
  run(dom, mode, 'like', 'run', 'false', 'Titre', 'track:x'); await settle(60);
  assert.equal(clicks, 1); assert.equal(run(dom, mode, 'like', 'poll', 'unknown', 'Titre', 'track:x').outcome, 'identity'); dom.window.close();
});


test('hidden like: opens the explicit now-playing view and adds only a verified matching track', async () => {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Titre</a></aside><button data-testid="control-button-npv" aria-pressed="false">v</button><div id="npv"></div>`);
  const d=dom.window.document, opener=d.querySelector('button'); let added=0, opened=0, closed=0;
  opener.onclick=()=>{if(opener.getAttribute('aria-pressed')==='false') {opened++;opener.setAttribute('aria-pressed','true');d.querySelector('#npv').innerHTML='<aside data-testid="now-playing-view"><button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false">l</button></aside>';let b=d.querySelector('#npv button');b.onclick=()=>{added++;b.setAttribute('aria-checked','true');b.setAttribute('aria-label','Retirer des titres likés')};}else{closed++;opener.setAttribute('aria-pressed','false');d.querySelector('#npv').innerHTML=''}};
  run(dom,mode,'like','run','unknown','Titre','track:x');await settle(400);
  assert.equal(added,1);assert.equal(opened,1);assert.equal(closed,1);assert.equal(run(dom,mode,'like','poll','unknown','Titre','track:x').outcome,'confirmed');dom.window.close();
});


test('like: a track switch after completion but before native polling invalidates success', () => {
  const {dom, counter}=likePage('Titre','false','Ajouter aux titres likés');
  run(dom,mode,'like','run','false','Titre','track:x');assert.equal(counter.clicks,1);
  dom.window.document.querySelector('a').setAttribute('href','/track/y');
  assert.equal(run(dom,mode,'like','poll','unknown','Titre','track:x').outcome,'identity');dom.window.close();
});


function pickerPage(items) {
  const dom = page(`<aside data-testid="now-playing-bar"><a data-testid="context-item-link" href="/track/x">Titre</a><button data-testid="add-button" aria-haspopup="menu" aria-expanded="false" aria-controls="picker">+</button></aside><div id="slot"></div>`);
  const d=dom.window.document, b=d.querySelector('button'), counts={open:0,selected:0,other:0,closed:0};
  b.onclick=()=>{counts.open++;b.setAttribute('aria-expanded','true');d.querySelector('#slot').innerHTML=`<div id="picker" role="menu">${items}</div>`;let r=d.querySelector('#picker');r.addEventListener('keydown',e=>{if(e.key==='Escape'){counts.closed++;b.setAttribute('aria-expanded','false');r.remove()}});r.querySelectorAll('[role=menuitemcheckbox]').forEach(n=>n.addEventListener('click',()=>{if(n.textContent.trim()==='Titres likés')counts.selected++;else counts.other++;n.setAttribute('aria-checked',n.getAttribute('aria-checked')==='true'?'false':'true')}));};
  return {dom,d,b,counts};
}

test('picker: adds only the explicitly unchecked Liked Songs item once and confirms',async()=>{
  const x=pickerPage('<div role="menuitemcheckbox" aria-checked="false">Titres likés</div><div role="menuitemcheckbox" aria-checked="false">Ma playlist</div>');
  run(x.dom,mode,'like','run','unknown','Titre','track:x');await settle(40);
  const out=run(x.dom,mode,'like','poll','unknown','Titre','track:x');
  assert.deepEqual(x.counts,{open:1,selected:1,other:0,closed:1});assert.equal(out.outcome,'confirmed');assert.equal(out.state,'true');x.dom.window.close();
});

test('picker: an already checked Liked Songs item is read, never removed',async()=>{
  const x=pickerPage('<div role="menuitemcheckbox" aria-checked="true">Titres likés</div>');
  run(x.dom,mode,'like','run','unknown','Titre','track:x');await settle(40);
  assert.equal(x.counts.selected,0);assert.equal(run(x.dom,mode,'like','poll','unknown','Titre','track:x').outcome,'read');x.dom.window.close();
});

test('picker: missing, ambiguous, or unreadable Liked Songs never picks a playlist',async()=>{
  for(const items of ['<div role="menuitemcheckbox" aria-checked="false">Ma playlist</div>', '<div role="menuitemcheckbox" aria-checked="false">Titres likés</div><div role="menuitemcheckbox" aria-checked="false">Titres likés</div>', '<div role="menuitemcheckbox">Titres likés</div>', '<div role="menuitemcheckbox" aria-checked="mixed">Titres likés</div>']){
    const x=pickerPage(items);run(x.dom,mode,'like','run','unknown','Titre','track:x');await settle(30);let out=run(x.dom,mode,'like','poll','unknown','Titre','track:x');
    assert.equal(x.counts.selected,0);assert.equal(x.counts.other,0);assert.match(out.outcome,/^menu-(absent|ambiguous|state)$/);x.dom.window.close();
  }
});

test('picker: missing or changed identity and unsafe triggers never open or select',async()=>{
  for(const [title,id,remove,checked,shown] of [['','track:x',false,'false','unknown'],['Titre','track:y',false,'false','unknown'],['Titre','track:x',true,'false','unknown'],['Titre','track:x',false,'true','unknown'],['Titre','track:x',false,'false','true']]){
    const x=pickerPage('<div role="menuitemcheckbox" aria-checked="false">Titres likés</div>');if(remove)x.b.setAttribute('data-testid','remove-button');x.b.setAttribute('aria-checked',checked);
    run(x.dom,mode,'like','run',shown,title,id);await settle(30);assert.equal(x.counts.open,0);assert.equal(x.counts.selected,0);x.dom.window.close();
  }
});

test('picker: a track change on open cannot add even a homonymous track',async()=>{
  const x=pickerPage('<div role="menuitemcheckbox" aria-checked="false">Titres likés</div>');const open=x.b.onclick;x.b.onclick=()=>{open();x.d.querySelector('a').setAttribute('href','/track/y')};
  run(x.dom,mode,'like','run','unknown','Titre','track:x');await settle(30);assert.equal(x.counts.selected,0);assert.equal(run(x.dom,mode,'like','poll','unknown','Titre','track:x').outcome,'identity');x.dom.window.close();
});

test('picker: an unrelated already-open menu cannot be selected',async()=>{
  const x=pickerPage('<div role="menuitemcheckbox" aria-checked="false">Titres likés</div>');x.b.setAttribute('aria-expanded','true');x.b.removeAttribute('aria-controls');x.d.querySelector('#slot').innerHTML='<div role="menu"><div role="menuitemcheckbox" aria-checked="false">Titres likés</div></div>';
  run(x.dom,mode,'like','run','unknown','Titre','track:x');await settle(2000);assert.equal(x.counts.open,0);assert.equal(x.counts.selected,0);assert.equal(run(x.dom,mode,'like','poll','unknown','Titre','track:x').outcome,'menu-absent');x.dom.window.close();
});


test('picker: an exception during the add is unconfirmed, not claimed unsent',async()=>{
  const x=pickerPage('<div role="menuitemcheckbox" aria-checked="false">Titres likés</div>');const open=x.b.onclick;
  x.b.onclick=()=>{open();x.d.querySelector('[role=menuitemcheckbox]').click=()=>{throw Error('uncertain command')}};
  run(x.dom,mode,'like','run','unknown','Titre','track:x');await settle(30);
  assert.equal(run(x.dom,mode,'like','poll','unknown','Titre','track:x').outcome,'unconfirmed');x.dom.window.close();
});


test('generic bar track link allows only the known now-playing view and matching add',async()=>{
 const dom=page(`<aside data-testid="now-playing-bar"><a href="/track/x">Titre</a></aside><button data-testid="control-button-npv" aria-pressed="false">v</button><div id="npv"></div>`);
 const d=dom.window.document,b=d.querySelector('button');let added=0,opened=0,closed=0;
 b.onclick=()=>{if(b.getAttribute('aria-pressed')==='false'){opened++;b.setAttribute('aria-pressed','true');d.querySelector('#npv').innerHTML='<aside data-testid="now-playing-view"><button data-testid="add-button" aria-label="Ajouter aux titres likés" aria-checked="false"></button></aside>';const like=d.querySelector('#npv button');like.onclick=()=>{added++;like.setAttribute('aria-checked','true');like.setAttribute('aria-label','Retirer des titres likés')}}else{closed++;b.setAttribute('aria-pressed','false');d.querySelector('#npv').innerHTML=''}};
 run(dom,mode,'like','run','unknown','Titre','track:x');await settle(400);assert.equal(added,1);assert.equal(opened,1);assert.equal(closed,1);assert.equal(run(dom,mode,'like','poll','unknown','Titre','track:x').outcome,'confirmed');dom.window.close();
});
