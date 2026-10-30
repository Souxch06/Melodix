// [contrat][structurel][A TESTER SUR TELEPHONE]
// Mission P0 playlists (2026-10-27) : la bibliotheque mediaLib arrive en
// general APRES le premier scrape de l'accueil. Avant ce correctif, rien ne
// re-declenchait la fusion quand mediaLib arrivait (checkMediaLib remplissait
// window.mediaLib sans prevenir le shell), et le warmup etait one-shot : un
// token absent au premier appel et c'etait fini pour toujours. Les playlists
// reelles ne parvenaient jamais a l'accueil.
// Ces tests simulent la chaine JS (DOM + bridge stub) avec node:vm ; ils ne
// prouvent pas l'execution Android ni l'affichage reel sur telephone.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const shellSrc = fs.readFileSync(path.join(root, 'assets', 'native_ui_shell.js'), 'utf8');
const bridgeSrc = fs.readFileSync(path.join(root, 'assets', 'spotify_bridge.js'), 'utf8');

function makeAnchor(href, text, imgSrc) {
  const img = imgSrc ? { src: imgSrc, getAttribute: (n) => (n === 'src' ? imgSrc : null) } : null;
  return {
    href,
    innerText: text,
    textContent: text,
    matches: (sel) => sel === 'a[href]',
    getAttribute: (n) => (n === 'href' ? href : null),
    querySelector: (sel) => (sel === 'img' ? img : null),
    closest: () => null
  };
}

// Harness: runs the real native_ui_shell.js against a stub DOM + bridge.
function runShell(opts = {}) {
  const calls = [];
  const anchors = (opts.cards || []).map((c) => makeAnchor(c.href, c.text, c.img));
  const mainView = {
    querySelectorAll: (selector) => (selector === 'a[href]' ? anchors : [])
  };
  const document = {
    readyState: 'complete',
    documentElement: {},
    querySelector: (selector) => {
      if (selector === '#main-view') return mainView;
      if (selector.indexOf('user-widget-link') >= 0) return opts.noUserWidget ? null : {};
      return null;
    },
    addEventListener: () => {}
  };
  class TestMutationObserver {
    observe() {}
  }
  const checkMediaLibCalls = { count: 0 };
  const window = {
    location: {
      hostname: 'open.spotify.com',
      pathname: '/',
      href: 'https://open.spotify.com/',
      assign: () => {}
    },
    AndBridge: {
      onNativeUiReady: () => {},
      onNativeUiRoute: () => {},
      onNativeUiData: (screen, data) => calls.push({ screen, data }),
      logDiagEvent: () => {}
    },
    MutationObserver: TestMutationObserver,
    addEventListener: () => {},
    setTimeout: () => 1,
    clearTimeout: () => {},
    Date,
    console
  };
  if (opts.mediaLib !== undefined) window.mediaLib = opts.mediaLib;
  if (opts.libStatus !== undefined) window.__sfMediaLibStatus = opts.libStatus;
  if (opts.libError !== undefined) window.__sfMediaLibError = opts.libError;
  if (opts.withCheckMediaLib) {
    window.checkMediaLib = () => {
      checkMediaLibCalls.count += 1;
      if (opts.onCheckMediaLib) opts.onCheckMediaLib(window);
    };
  }
  vm.runInNewContext(shellSrc, { window, document, URL, Date });
  return { window, calls, checkMediaLibCalls };
}

const PLAYLIST_ROW = {
  id: 'spotify:playlist:user1',
  name: 'Ma vraie playlist',
  image: 'https://i.scdn.co/image/p1',
  type: 'Playlist'
};
const DOM_CARD = {
  href: 'https://open.spotify.com/playlist/dom99',
  text: 'Recommandation Spotify\nSous-titre',
  img: 'https://i.scdn.co/image/dom'
};

// 1. Library available BEFORE the first render.
test('[P0 playlists] 1. la bibliotheque dispo avant le 1er rendu est fusionnee', () => {
  const { calls } = runShell({
    cards: [DOM_CARD],
    mediaLib: { playlists: [PLAYLIST_ROW] }
  });
  const home = calls.filter((c) => c.screen === 'home');
  assert.ok(home.length >= 1, 'un envoi home a lieu');
  const rows = JSON.parse(home[home.length - 1].data);
  const titles = rows.map((r) => r.title);
  assert.ok(titles.includes('Ma vraie playlist'), 'la playlist mediaLib est presente');
});

// 2. Library arrives AFTER the first render -> settle notification must re-merge.
test('[P0 playlists] 2. la bibliotheque tardive declenche une refusion et un renvoi', () => {
  const { window, calls } = runShell({ cards: [DOM_CARD] });
  const first = calls.filter((c) => c.screen === 'home');
  assert.ok(first.length >= 1, 'premier envoi sans mediaLib');
  assert.ok(!JSON.parse(first[first.length - 1].data).some((r) => r.title === 'Ma vraie playlist'),
    'avant mediaLib: pas de playlist utilisateur');

  // The bridge settles: it fills mediaLib then notifies the shell (the fix).
  window.mediaLib = { playlists: [PLAYLIST_ROW] };
  window.__sfMediaLibStatus = 'ready';
  assert.equal(typeof window.__sfNativeUiRefresh, 'function', 'le shell expose un hook de refresh');
  window.__sfNativeUiRefresh();

  const home = calls.filter((c) => c.screen === 'home');
  assert.ok(home.length >= 2, 'un deuxieme envoi home a lieu apres la refusion');
  const rows = JSON.parse(home[home.length - 1].data);
  assert.ok(rows.some((r) => r.title === 'Ma vraie playlist'),
    'les playlists tardives atteignent enfin l accueil');
});

// 3. First scrape has rows but no playlist -> late library fills the gap.
test('[P0 playlists] 3. des rows sans playlist ne bloquent pas l arrivee tardive', () => {
  const { window, calls } = runShell({ cards: [DOM_CARD] });
  assert.ok(JSON.parse(calls[calls.length - 1].data).length > 0, 'le scrape initial a des rows');
  window.mediaLib = { playlists: [PLAYLIST_ROW] };
  window.__sfNativeUiRefresh();
  const rows = JSON.parse(calls.filter((c) => c.screen === 'home').pop().data);
  assert.ok(rows.some((r) => r.title === 'Ma vraie playlist'), 'fusion tardive OK');
});

// 4. Playlists after several attempts -> warmup must be retryable.
test('[P0 playlists] 4. le chargement de la bibliotheque est retentable (plusieurs essais)', () => {
  const { window, calls, checkMediaLibCalls } = runShell({
    cards: [],
    noUserWidget: true, // keep readiness blocked so only data calls matter
    withCheckMediaLib: true,
    onCheckMediaLib: (w) => {
      // simulate a failing fetch (token not ready yet)
      w.__sfMediaLibStatus = 'error';
      w.__sfMediaLibError = 'token-missing';
    }
  });
  assert.equal(checkMediaLibCalls.count, 1, 'premier essai de chargement');
  // Backoff in the future: no immediate retry spam.
  window.__sfNativeUiRefresh();
  assert.equal(checkMediaLibCalls.count, 1, 'pas de spam pendant le backoff');
  // Backoff elapsed: the next update retries (the one-shot bug is gone).
  window.__sfMediaLibRetryAt = 0;
  window.__sfNativeUiRefresh();
  assert.equal(checkMediaLibCalls.count, 2, 'nouvel essai apres le backoff');
});

// 5. Library genuinely empty -> honest empty state, no fabricated rows.
test('[P0 playlists] 5. une bibliotheque vide n invente aucune playlist', () => {
  const { calls } = runShell({
    cards: [DOM_CARD],
    mediaLib: { playlists: [], albums: [], artists: [], podcasts: [] },
    libStatus: 'ready'
  });
  const rows = JSON.parse(calls.filter((c) => c.screen === 'home').pop().data);
  assert.ok(rows.every((r) => r.uri && r.title), 'chaque row reste une vraie entree');
  assert.ok(!rows.some((r) => /fake|demo|example/i.test(r.title)), 'aucune playlist factice');
});

// 6. Fetch fails with an explicit error -> traced state, retry allowed, no fake data.
test('[P0 playlists] 6. un echec HTTP explicite reste visible et retentable', () => {
  const { window, calls, checkMediaLibCalls } = runShell({
    cards: [],
    withCheckMediaLib: true,
    libStatus: 'error',
    libError: 'http-403',
    onCheckMediaLib: (w) => {
      w.__sfMediaLibStatus = 'error';
      w.__sfMediaLibError = 'http-403';
    }
  });
  // An error state (never 'loading'/'ready') allows the retry path.
  window.__sfMediaLibRetryAt = 0;
  window.__sfNativeUiRefresh();
  assert.equal(checkMediaLibCalls.count, 2, 'un echec autorise un nouvel essai');
  const homeRows = calls.filter((c) => c.screen === 'home');
  const rows = homeRows.length ? JSON.parse(homeRows[homeRows.length - 1].data) : [];
  assert.ok(!rows.some((r) => /fake|demo|example/i.test(r.title)), 'pas de donnees fabriquees');
});

// 7. Repeated updates must not duplicate rows.
test('[P0 playlists] 7. mises a jour repetees sans doublons', () => {
  const { window, calls } = runShell({
    cards: [
      DOM_CARD,
      { href: 'https://open.spotify.com/playlist/user1', text: 'Ma vraie playlist\nX', img: 'https://i.scdn.co/image/dup' }
    ],
    mediaLib: { playlists: [PLAYLIST_ROW] },
    libStatus: 'ready'
  });
  window.__sfNativeUiRefresh();
  window.__sfNativeUiRefresh();
  const rows = JSON.parse(calls.filter((c) => c.screen === 'home').pop().data);
  const matches = rows.filter((r) => r.uri === 'spotify:playlist:user1');
  assert.equal(matches.length, 1, 'mediaLib et DOM pour la meme URI = une seule row');
  const seen = new Set(rows.map((r) => r.uri));
  assert.equal(seen.size, rows.length, 'aucune URI dupliquee dans un envoi');
});

// 8. Revisiting Home refreshes and re-sends data.
test('[P0 playlists] 8. une nouvelle visite de Home renvoie les donnees', () => {
  const { window, calls } = runShell({
    cards: [DOM_CARD],
    mediaLib: { playlists: [PLAYLIST_ROW] },
    libStatus: 'ready'
  });
  const before = calls.filter((c) => c.screen === 'home').length;
  assert.equal(typeof window.__sfNativeRequestHome, 'function');
  window.__sfNativeRequestHome();
  const home = calls.filter((c) => c.screen === 'home');
  assert.ok(home.length > before, 'Home renvoie les rows a chaque visite');
  assert.ok(JSON.parse(home[home.length - 1].data).some((r) => r.title === 'Ma vraie playlist'));
});

// 9. Late callbacks do not block the render path.
test('[P0 playlists] 9. les callbacks tardifs n bloquent pas le rendu', () => {
  const { window, calls } = runShell({ cards: [DOM_CARD] });
  // Shell already ready (rows >= 1), a late library settle must still render.
  window.mediaLib = { playlists: [PLAYLIST_ROW] };
  window.__sfNativeUiRefresh();
  const home = calls.filter((c) => c.screen === 'home');
  assert.ok(home.length >= 2, 'le flux de rendu reste ouvert apres le ready');
  // And a late empty settle does not wipe existing rows with a crash.
  window.mediaLib = { playlists: [] };
  window.__sfNativeUiRefresh();
  const rows = JSON.parse(calls.filter((c) => c.screen === 'home').pop().data);
  assert.ok(Array.isArray(rows), 'renvoi JSON valide');
});

// 10. Native payload == what JS actually sent.
test('[P0 playlists] 10. le payload recu correspond aux donnees JS emises', () => {
  const { calls } = runShell({
    cards: [DOM_CARD],
    mediaLib: { playlists: [PLAYLIST_ROW] },
    libStatus: 'ready'
  });
  const sent = calls.filter((c) => c.screen === 'home').pop();
  const rows = JSON.parse(sent.data);
  for (const r of rows) {
    assert.equal(typeof r.title, 'string');
    assert.equal(typeof r.uri, 'string');
    assert.ok(r.uri.startsWith('spotify:'), 'URI Spotify valide');
  }
  const mine = rows.find((r) => r.title === 'Ma vraie playlist');
  assert.equal(mine.uri, 'spotify:playlist:user1');
  assert.equal(mine.image, 'https://i.scdn.co/image/p1');
  assert.equal(mine.section, 'Vos playlists');
});

// Structural: the bridge really notifies the shell when the library settles.
test('[P0 playlists] le bridge notifie le shell quand mediaLib est settle (pas de silence)', () => {
  assert.ok(bridgeSrc.includes('function notifyMediaLibSettled('), 'notification de fin de chargement');
  assert.ok(bridgeSrc.includes("window.__sfNativeUiRefresh === 'function'"), 'le hook du shell est appele');
  // The settle path must still publish an honest final status. The stronger
  // form below keeps the ready state AND refuses to publish an empty library
  // when nothing usable arrived (see tests/p0_library_fetch.test.js for the
  // behavioural proof of each error code).
  assert.ok(bridgeSrc.includes("window.__sfMediaLibStatus = failed ? 'error' : 'ready'"),
    'statut final ready, ou error quand rien d exploitable n est arrive');
  assert.ok(bridgeSrc.includes('const failed = Boolean(window.__sfMediaLibError);'),
    'echec enregistre par fetchAllLibrary pris en compte');
  assert.ok(bridgeSrc.includes('const usable = Array.isArray(allItems) && allItems.length > 0;'),
    'donnees partielles conservees, echec total non publie comme bibliotheque vide');
  assert.ok(bridgeSrc.includes("window.__sfMediaLibError = 'token-missing'"), 'erreur token explicite');
  assert.ok(bridgeSrc.includes("window.__sfMediaLibError = 'http-' + resp.status"), 'erreur HTTP explicite');
  assert.ok(bridgeSrc.includes('fetch-parse-error'), 'erreur de parsing explicite');
  // The warmup is retryable and the merge is traced.
  assert.ok(shellSrc.includes('window.__sfMediaLibRetryAt'), 'backoff de retry du warmup');
  assert.ok(shellSrc.includes('home-merge lib='), 'trace de fusion avant/apres');
  assert.ok(!shellSrc.includes('mediaLibWarmupRequested'), 'plus de warmup one-shot');
});

// ---------------------------------------------------------------------------
// P0-E: a failed library must stay recoverable on the screen itself.
// ---------------------------------------------------------------------------

test('a session error points at Settings instead of promising a retry', () => {
    const shell = fs.readFileSync(path.join(root, 'assets', 'native_ui_shell.js'), 'utf8');
    // Definitive errors cannot be fixed by retrying: the row opens Settings.
    assert.match(shell, /err === 'token-missing'\)[\s\S]{0,200}paramètres/);
    assert.match(shell, /err === 'http-401'\)[\s\S]{0,200}paramètres/);
    assert.match(shell, /err === 'http-403'\)[\s\S]{0,200}paramètres/);
    assert.match(shell, /function homeStateAction\(err\) \{[\s\S]{0,200}melodix:action:retry-library[\s\S]{0,120}melodix:action:open-settings/);
    assert.match(shell, /uri: homeStateAction\(/, 'the state row carries a real action');
});

test('a transient error only promises a retry while the retry loop is alive', () => {
    const shell = fs.readFileSync(path.join(root, 'assets', 'native_ui_shell.js'), 'utf8');
    assert.match(shell, /function homeRetryLoopAlive\(\)/);
    assert.match(shell, /homeRetryLoopAlive\(\)[\s\S]{0,120}nouvel essai automatique en cours/);
    assert.match(shell, /touchez pour réessayer/);
    // The manual retry is exposed for the native row and restarts the loop.
    assert.match(shell, /window\.__sfNativeRetryLibrary = function/);
    assert.match(shell, /__sfNativeRetryLibrary[\s\S]{0,400}checkMediaLib\(true\)/);
});

test('the native side dispatches the state-row actions without a new bridge method', () => {
    const activity = fs.readFileSync(path.join(root, 'smali', 'com', 'melodix', 'music', 'MainActivity.smali'), 'utf8');
    const start = activity.indexOf('.method public final openNativeRow');
    assert.ok(start > 0, 'openNativeRow existe');
    const body = activity.slice(start, activity.indexOf('.end method', start));
    assert.match(body, /const-string v2, "melodix:action:open-settings"[\s\S]{0,220}openNativeSettings\(\)V/);
    assert.match(body, /const-string v2, "melodix:action:retry-library"[\s\S]{0,220}__sfNativeRetryLibrary/);
    assert.doesNotMatch(body, /JavascriptInterface/, 'no new JavaScript bridge surface');
});
