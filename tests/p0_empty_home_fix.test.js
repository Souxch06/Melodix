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

test('[P0] notifyNativeUiReady n\'annonce pas le shell avec un accueil vide (gating rows >= 1)', () => {
  const shell = read('assets/native_ui_shell.js');
  const start = shell.indexOf('function notifyNativeUiReady(');
  assert.ok(start >= 0, 'notifyNativeUiReady existe');
  const body = shell.slice(start, shell.indexOf('\n    function ', start + 10));
  assert.ok(body.includes('__sfNativeUiHomeRowsCount'), 'le gate lit le nombre de rows');
  assert.ok(body.includes('ready-blocked'), 'le refus est trace');
  assert.ok(body.includes('isSpotifyHome()'), 'le gate ne vise que la route accueil');
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

test('[P0] le fade du splash attend le shell (anti-flash, hold sans delai)', () => {
  const zk = read('smali/zk0.smali');
  assert.ok(zk.includes('AppSingleton;->l:Z'), 'verifie si le shell est montre');
  assert.ok(zk.includes(':fade_go'), 'chemin de fade garde');
  const guard = zk.slice(zk.indexOf('packed-switch'), zk.indexOf(':pswitch_0'));
  // Nouveau contrat (mega-mission) : pas de delai arbitraire. Tant que le
  // shell n'est pas montre et qu'aucun tag de fallback explicite n'est pose,
  // le splash reste opaque (hold) - showNativeUi le masquera.
  assert.ok(guard.includes('MDXSTART'), 'le hold est trace');
  assert.ok(guard.includes('splash-hold'), 'trace de hold identifiable');
  assert.ok(!guard.includes('postDelayed'), 'plus aucun report temporel du fade');
  assert.ok(!guard.includes('setTag'), 'le tag n\'est plus auto-pose par le fade');
});

test('[P0] le fallback web est explicite et trace (login + watchdog)', () => {
  const c91 = read('smali/c91.smali');
  const wd = read('smali/com/melodix/music/StartupLoadWatchdog.smali');
  // La page du player web ne doit jamais dismiss le splash elle-meme.
  assert.ok(c91.includes('splash-hold player page loaded'), 'player = hold du splash');
  // Seules les pages login/auth revelent la WebView, avec tag de fallback.
  assert.ok(c91.includes('web-login-fallback'), 'login pose le tag de fallback');
  assert.ok(c91.includes('splash-fallback login page loaded'), 'fallback login trace');
  // Le watchdog est le filet : tag de fallback + trace avant de reveler la page.
  assert.ok(wd.includes('web-fallback'), 'watchdog pose le tag de fallback');
  assert.ok(wd.includes('splash-fallback watchdog timeout'), 'fallback watchdog trace');
});

test('[P0] aucun callback tardif ne restaure le splash au-dessus du shell', () => {
  const zk = read('smali/zk0.smali');
  const act = read('smali/com/melodix/music/MainActivity.smali');
  assert.ok(zk.includes('pswitch0_allowed'), 'garde anti-tardif sur la restauration zk0');
  assert.ok(zk.includes('splash-restore skipped'), 'restauration tardive bloquee et tracee');
  assert.ok(act.includes(':D_splash_allowed'), 'garde anti-tardif sur D(Z)');
});
