// [contrat][structurel][A TESTER SUR ANDROID]
// Le shell natif peut montrer un état de connexion sans preuve libraryV3, mais
// aucune donnée privée n'est envoyée avant cette preuve. L'instrumentation
// Android vérifie séparément les vraies vues et leur visibilité.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

test('[P0] unproven Home sends a status-only row and activates the shell without granting session proof', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const start = shell.indexOf('function notifyNativeUiReady(');
  assert.ok(start >= 0, 'notifyNativeUiReady exists');
  const ready = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  assert.match(ready, /homeContentProven = isSpotifyHome\(\) && sessionProven/,
    'native cards still require private libraryV3 proof');
  assert.match(ready, /homeShellStateReady = nativeHomeRoute[\s\S]*?HomeStateSent === true[\s\S]*?HomeSessionUnproven === true/,
    'a sent explicit connection state can activate the shell without changing session proof');
  assert.match(ready, /takeoverProven = sessionProven/,
    'UI readiness and private-session proof remain separate signals');
  assert.match(ready, /shellActivationAllowed = takeoverProven \|\| homeShellStateReady/);
  assert.match(ready, /if \(isSpotifyHome\(\) && sessionProven && !homeContentProven && !homeStateProven\)/,
    'a valid session still cannot activate Home from an empty or failed payload');
  assert.ok(shell.includes('function libraryProvesSession()'), 'libraryV3 remains the only private-data proof');

  const unproven = shell.slice(shell.indexOf('function unprovenHomeStateRow()'),
    shell.indexOf('function homePartialErrorRow()'));
  assert.match(unproven, /kind: 'state'/);
  assert.match(unproven, /sessionUnproven: true/);
  assert.match(unproven, /primaryUri = 'melodix:action:open-login'/);
  assert.match(unproven, /secondaryUri = 'melodix:action:retry-library'/);
  assert.doesNotMatch(unproven, /spotify:(?:playlist|album|artist|track):/,
    'the unproven state contains no fabricated playlist or resource URI');

  const updateStart = shell.indexOf('function updateHomeRows(');
  const update = shell.slice(updateStart, shell.indexOf('\n    function ', updateStart + 10));
  assert.match(update, /rows = sessionProven && actualHomeRoute \? collectedRows : \[\]/,
    'Home/Search/Library/detail DOM rows remain private until the library response proves the session');
  assert.match(update, /statePayload = sessionProven \? homeStatePayload\(\) : unprovenHomeStatePayload\(\)/);
  assert.match(update, /sendNativeUiData\('home', statePayload\)[\s\S]*?HomeStateSent = true/);
  assert.match(update, /HomeSessionUnproven = statePayload\[0\]\.sessionUnproven === true/);
});

test('[P0] runUpdate envoie route, rows, puis readiness dans cet ordre', () => {
  const shell = read('scripts/native_ui_shell.source.js');
  const start = shell.indexOf('function runUpdate(');
  assert.ok(start >= 0, 'runUpdate existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  const routeIdx = body.indexOf('sendNativeUiRoute(nativeRoute)');
  const rowsIdx = body.indexOf('updateHomeRows(mainView)');
  const readyIdx = body.indexOf('notifyNativeUiReady(mainView)');
  assert.ok(routeIdx >= 0 && rowsIdx > routeIdx && readyIdx > rowsIdx,
    'route native Home sûre, données status-only, puis readiness; jamais un payload privé sous une route obsolète');
  assert.match(body, /nativeRoute = sessionBit === '1' \? route : 'home'/,
    'sans libraryV3, la route native reste Home sans présumer de la session');
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
  assert.ok(shell.includes("home-rows sent"), 'transfert Home marqué sans publier de compteurs');
  assert.ok(shell.includes("home-state sent"), 'état de connexion natif marqué sans divulguer de preuve de session');
  assert.ok(shell.includes("home-data stage=web-to-android result="), 'résultat du handoff réduit à un enum');
  assert.ok(!shell.includes("home-rows sent n="), 'aucun compteur de playlists n’est exporté');
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
