// [contrat][structurel][A TESTER SUR TELEPHONE]
// P0 empty home + startup WebView flash (2026-10-27, version test.29 = arbre
// 5986ed6 restaure). Symptomes telephone : ecran d'accueil vide, flash de la
// page Web Spotify au lancement puis ecran vide, playlists invisibles.
//
// Cause racine demontree par le code :
//   showNativeUi() rend nativeRoot (opaque, elevation 15) visible des que le
//   compte est connecte, SANS attendre le feed ; si les rows de playlists
//   n'arrivent jamais (libraryV3 KO sur l'appareil + sidebar desktop absent
//   en mobile), l'utilisateur reste sur un ecran vide pendant que la page
//   Spotify (qui affiche les vraies playlists) est couverte.
//   Le flash = le fade du splash (zk0) des le chargement de la page, avant que
//   le shell natif ne soit pret.
//
// Ces contrats verifient la presence des corrections structurelles. Ils ne
// prouvent ni l'execution Android ni l'affichage reel avec un compte Spotify ;
// NE REMPLACENT PAS un test sur telephone avec un vrai compte.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

test('[P0] notifyNativeUiReady prend la main tot et garantit un etat (plus de blanc, plus d invisibilite)', () => {
  const shell = read('assets/native_ui_shell.js');
  const start = shell.indexOf('function notifyNativeUiReady(');
  assert.ok(start >= 0, 'notifyNativeUiReady existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  assert.ok(body.includes('__sfNativeUiHomeRowsCount'), 'le nombre de rows est observe');
  assert.ok(body.includes('ready-early'), 'le takeover precoce est trace');
  assert.ok(body.includes('isSpotifyHome()'), 'seule la route accueil est concernee');
  // L ancien refus rows>=1 laissait l UI invisible quand Spotify etait lent;
  // la protection contre un ecran blanc est desormais assuree par le payload
  // d etat (voir tests/p0_shell_takeover.test.js, test comportemental).
  assert.ok(!/__sfNativeUiHomeRowsCount \|\| 0\) < 1\) \{[\s\S]{0,200}return false;/.test(body),
    'aucun refus bloquant sur un accueil vide');
  assert.ok(shell.includes('function homeStatePayload('), 'un etat honnete est toujours disponible');
});

test('[P0] runUpdate envoie les rows AVANT la readiness (le feed precede le couvrement)', () => {
  const shell = read('assets/native_ui_shell.js');
  const start = shell.indexOf('function runUpdate(');
  assert.ok(start >= 0, 'runUpdate existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  const rowsIdx = body.indexOf('updateHomeRows(mainView)');
  const readyIdx = body.indexOf('notifyNativeUiReady(mainView)');
  assert.ok(rowsIdx >= 0 && readyIdx >= 0 && rowsIdx < readyIdx,
    'updateHomeRows doit s\'executer avant notifyNativeUiReady');
});

test('[P0] les playlists du compte viennent du drawer reel (mobile + desktop), jamais inventees', () => {
  const shell = read('assets/native_ui_shell.js');
  assert.ok(shell.includes('function collectLibraryDrawerRows('), 'collectLibraryDrawerRows existe');
  const supp = shell.indexOf('function supplementHomeRowsWithLibrary(');
  assert.ok(supp >= 0, 'supplementHomeRowsWithLibrary existe');
  const body = shell.slice(supp, shell.indexOf('\n    function ', supp + 10));
  assert.ok(body.includes('collectLibraryDrawerRows()'), 'le drawer est utilise dans le supplement');
  assert.ok(shell.includes('spotify:playlist:'), 'liens playlist reels uniquement');
  assert.ok(!/Math\.random/.test(shell.slice(shell.indexOf('function collectLibraryDrawerRows('),
    shell.indexOf('function supplementHomeRowsWithLibrary('))),
    'aucune playlist generee aleatoirement');
});

test('[P0] traces de diagnostic presentes (bridge, shell, rows, erreurs JS)', () => {
  const shell = read('assets/native_ui_shell.js');
  const bridge = read('assets/spotify_bridge.js');
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
