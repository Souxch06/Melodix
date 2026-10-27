// [contrat][structurel][A TESTER SUR TELEPHONE]
// Mega-mission (2026-10-27) : regressions pour la file de commandes du bridge,
// le parcours des playlists de bout en bout et la navigation native.
// STRUCTUREL = ne prouve ni l'execution Android ni l'affichage reel avec un
// compte Spotify ; NE REMPLACE PAS un test sur telephone.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

function read(rel) {
  return fs.readFileSync(path.join(__dirname, '..', rel), 'utf8');
}

test('[bridge] pollCommands n\'existe pas dans le HEAD (bug signale absent)', () => {
  // Un audit anterieur decrivait un bug dans AndBridge.pollCommands (sortie
  // immediate de boucle, liste de commandes vide). Le composant n'existe pas
  // dans le HEAD actuel : ni methode smali, ni symbole JS. Rien a corriger,
  // le contrat empeche qu'il revienne dans un etat casse.
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  const shell = read('assets/native_ui_shell.js');
  const bridge = read('assets/spotify_bridge.js');
  assert.ok(!andBridge.includes('pollCommands'), 'pas de pollCommands smali');
  assert.ok(!shell.includes('pollCommands'), 'pas de pollCommands dans le shell');
  assert.ok(!bridge.includes('pollCommands'), 'pas de pollCommands dans le bridge');
});

test('[bridge] les symboles reels de la file de commandes sont presents et lies', () => {
  const shell = read('assets/native_ui_shell.js');
  const bridge = read('assets/spotify_bridge.js');
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  // executeBridgeSource = la file de commandes reelle (sources JS executees)
  assert.ok(shell.includes('function executeBridgeSource('), 'executeBridgeSource existe');
  assert.ok(shell.includes('notifyNativeUiReady'), 'signal de prete du shell');
  assert.ok(shell.includes('bridge.onNativeUiReady()'), 'appel du bridge natif');
  assert.ok(andBridge.includes('.method public final onNativeUiReady()V'), 'callback natif');
  assert.ok(bridge.includes('window.checkMediaLib = checkMediaLib'), 'checkMediaLib expose');
  assert.ok(shell.includes('window.__sfNativeRequestHome'), 'demande d\'accueil exposee');
  assert.ok(shell.includes('window.__sfOpenCollection'), 'ouverture de collection exposee');
});

test('[playlists] la chaine collecte -> bridge -> natif -> renderer est coherente', () => {
  const shell = read('assets/native_ui_shell.js');
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  const act = read('smali/com/melodix/music/MainActivity.smali');
  const renderer = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
  // collecte
  assert.ok(shell.includes('function collectHomeRows('), 'collecte des rows accueil');
  assert.ok(shell.includes('function supplementHomeRowsWithLibrary('), 'completion par la bibliotheque');
  // envoi bridge
  assert.ok(shell.includes("sendNativeUiData('home', rows)"), 'envoi des rows accueil');
  assert.ok(shell.includes('bridge.onNativeUiData(screen, JSON.stringify(rows))'), 'transmission JSON');
  // reception native
  assert.ok(andBridge.includes('.method public final onNativeUiData('), 'reception AndBridge');
  assert.ok(act.includes('.method public final applyNativeUiData('), 'application MainActivity');
  // routage accueil : rows appliquees si ecran courant null ou home
  assert.ok(act.includes(':apply_home'), 'chemin d\'application des rows accueil');
  // rendu
  assert.ok(act.includes('.method public final renderNativeRows('), 'renderNativeRows');
  assert.ok(renderer.includes('.method public static render('), 'renderer natif');
});

test('[playlists] les donnees ne sont pas remplacees par du contenu fictif', () => {
  const shell = read('assets/native_ui_shell.js');
  // Les rows viennent du DOM reel ou de mediaLib ; aucune playlist factice.
  assert.ok(!/fake|mock|dummy|sample_playlist|playlist_test/i.test(shell),
    'le shell ne fabrique pas de playlists');
  assert.ok(shell.includes('Real library entries only'), 'filtre sur les entrees reelles');
});

test('[navigation] retour Accueil redemande les rows au shell', () => {
  const act = read('smali/com/melodix/music/MainActivity.smali');
  const homeClick = act.slice(act.indexOf('.method public final onNativeHomeClick'),
    act.indexOf('.method public final onNativeSearchClick'));
  assert.ok(homeClick.includes('setNativeScreen'), 'change d\'ecran');
  assert.ok(homeClick.includes('runNativeJavascript'), 'redemande les donnees au shell');
  assert.ok(homeClick.includes('__sfNativeRequestHome'), 'via __sfNativeRequestHome');
});

test('[navigation] une commande inconnue ne crash pas le bridge', () => {
  const shell = read('assets/native_ui_shell.js');
  const act = read('smali/com/melodix/music/MainActivity.smali');
  // Les routes natives passent par des equals chaines : une cle inconnue
  // tombe dans le chemin par defaut, sans exception.
  assert.ok(act.includes(':check_home'), 'routage par etapes');
  assert.ok(act.includes(':check_media'), 'chemin par defaut du routage data');
  assert.ok(shell.includes('try {'), 'erreurs JS capturees dans le shell');
  assert.ok(shell.includes('runUpdate error'), 'erreur de mise a jour tracee, pas crashante');
});
