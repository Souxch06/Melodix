// [contrat][structurel][A TESTER SUR ANDROID]
// Ces contrôles suivent les gates actuels entre les lignes Spotify collectées,
// le bridge et la demande d'affichage native. Ils ne démontrent pas la cause
// de l'écran signalé et ne prouvent pas qu'un compte Spotify a été authentifié.
//
// Le renderer ne marque que nativeHomeCardsAttached après addView. Le flag
// distinct nativeHomeContentReady n'est fixé qu'après la mesure de la carte,
// sa visibilité globale, l'ordre/élévation du root, puis le retrait du splash.
// Les tests Smali restent structurels; l'instrumentation Android vérifie la
// hiérarchie et les pixels de la surface WebView de repli, sans playlist fictive.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

test('[P0] notifyNativeUiReady refuses Home without collected real rows sent to the bridge', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const start = shell.indexOf('function notifyNativeUiReady(');
  assert.ok(start >= 0, 'notifyNativeUiReady existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  assert.ok(body.includes('__sfNativeUiHomeRowsCount'), 'le nombre de rows est observe');
  assert.ok(body.includes('__sfNativeUiHomeDataSent'), 'la livraison du feed au bridge est confirmee');
  assert.ok(body.includes('isSpotifyHome()'), 'seule la route Home exige des lignes collectées');
  assert.match(body, /ready-pending home rows=/, 'le refus est diagnostique et borné');
  assert.match(body, /action=keep-spotify-visible/, 'l’action de repli est explicite');
  assert.match(body, /return false;/, 'aucun signal ready n’est emis avec zero carte');
  assert.ok(!body.includes('ready-early'), 'plus de takeover precoce sur un feed vide');
  assert.ok(shell.includes('function homeStatePayload('), 'les états de bibliothèque restent diagnostiquables');
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
