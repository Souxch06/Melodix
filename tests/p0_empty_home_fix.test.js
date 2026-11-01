// [contrat][structurel][A TESTER SUR ANDROID]
// Home peut afficher des cartes Spotify réelles, ou un état non-playlist après
// preuve de session; une charge vide brute ne peut jamais masquer le WebView.
// Ces assertions suivent les gates sources, tandis que l'instrumentation Android
// vérifie séparément la hiérarchie et les pixels des chemins WebView et état natif.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

test('[P0] zero Home cards may render only an explicit state after session proof', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const start = shell.indexOf('function notifyNativeUiReady(');
  assert.ok(start >= 0, 'notifyNativeUiReady existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  assert.match(body, /homeContentProven = isSpotifyHome\(\)[\s\S]*?HomeRowsCount[\s\S]*?HomeDataSent/,
    'les cartes restent fondées sur des lignes réellement envoyées');
  assert.match(body, /homeStateProven = isSpotifyHome\(\) && sessionProven[\s\S]*?HomeStateSent/,
    'un état ne prouve Home que si la session et son payload explicite sont confirmés');
  assert.match(body, /if \(isSpotifyHome\(\) && !homeContentProven && !homeStateProven\)/,
    'un payload vide ou échoué ne satisfait aucun des deux chemins');
  assert.match(body, /action=keep-spotify-visible/, 'le refus conserve Spotify visible');
  assert.ok(shell.includes("function pageHasSessionEvidence()"), 'le même signal profil/bibliothèque est utilisé au moment de l’envoi');
  const state = shell.slice(shell.indexOf('function homeStateRow()'), shell.indexOf('function homeStatePayload()'));
  assert.match(state, /kind: 'state'/);
  assert.doesNotMatch(state, /spotify:(?:playlist|album|artist|track):/,
    'un état n’invente ni URI ni contenu musical');
  const updateStart = shell.indexOf('function updateHomeRows(');
  const update = shell.slice(updateStart, shell.indexOf('\n    function ', updateStart + 10));
  assert.match(update, /pageHasSessionEvidence\(\)[\s\S]*?sendNativeUiData\('home', statePayload\)[\s\S]*?HomeStateSent = true/);
  assert.match(update, /Empty data is a clear\/fallback signal[\s\S]*?sendNativeUiData\('home', \[\]\)/,
    'without session evidence, only an empty clear/fallback payload is sent');
});

test('[P0] runUpdate envoie route, rows, puis readiness dans cet ordre', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const start = shell.indexOf('function runUpdate(');
  assert.ok(start >= 0, 'runUpdate existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  const routeIdx = body.indexOf('sendNativeUiRoute(route)');
  const rowsIdx = body.indexOf('updateHomeRows(mainView)');
  const readyIdx = body.indexOf('notifyNativeUiReady(mainView)');
  assert.ok(routeIdx >= 0 && rowsIdx > routeIdx && readyIdx > rowsIdx,
    'route native puis données Home puis readiness; jamais le payload sous une route obsolète');
});

test('[P0] les playlists du compte viennent du drawer reel (mobile + desktop), jamais inventees', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  assert.ok(shell.includes('function collectLibraryDrawerRows('), 'collectLibraryDrawerRows existe');
  const supp = shell.indexOf('function supplementHomeRowsWithLibrary(');
  assert.ok(supp >= 0, 'supplementHomeRowsWithLibrary existe');
  const body = shell.slice(supp, shell.indexOf('\n    function ', supp + 10));
  assert.ok(body.includes('collectLibraryDrawerRows(mainView)'), 'le drawer reel est utilise sans rescanner une autre racine');
  assert.ok(shell.includes('spotify:playlist:'), 'liens playlist reels uniquement');
  assert.ok(!/Math\.random/.test(shell.slice(shell.indexOf('function collectLibraryDrawerRows('),
    shell.indexOf('function supplementHomeRowsWithLibrary('))),
    'aucune playlist generee aleatoirement');
});

test('[P0] traces de diagnostic presentes (bridge, shell, rows, erreurs JS)', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const bridge = read('scripts/spotify_bridge.source.js');
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  assert.ok(shell.includes('function diagTrace('), 'diagTrace existe dans le shell');
  assert.ok(shell.includes("js-shell begin"), 'trace de demarrage du shell');
  assert.ok(shell.includes("home-rows sent n="), 'trace du nombre de rows');
  assert.ok(shell.includes("main-view found"), 'trace de l\'element d\'accueil');
  assert.ok(bridge.includes("bridge start"), 'trace de demarrage du bridge');
  assert.ok(bridge.includes("bridge done"), 'trace de fin du bridge');
  assert.ok(andBridge.includes('logDiagEvent'), 'canal logcat cote natif');
  assert.ok(andBridge.includes('MDXTRACE'), 'tag logcat unique');
  assert.ok(shell.includes("addEventListener('error'"), 'erreurs JS capturees');
});

test('[P0] le fade du splash attend le shell (anti-flash, un seul report borne)', () => {
  const zk = read('smali/zk0.smali');
  assert.ok(zk.includes('AppSingleton;->l:Z'), 'verifie si le shell est montre');
  assert.ok(zk.includes('postDelayed'), 'reporte le fade');
  assert.ok(zk.includes(':fade_go'), 'chemin de fade garde');
  const guard = zk.slice(zk.indexOf('packed-switch'), zk.indexOf(':pswitch_0'));
  assert.ok(guard.includes('setTag'), 'le report est borne (une seule fois)');
});
