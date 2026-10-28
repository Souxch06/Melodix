// [contrat][structurel][A TESTER SUR TELEPHONE]
// Mission P0 diagnostic sans ADB (2026-10-27) : panneau de diagnostic local
// consultable depuis l'ecran Android (long-press sur le logo Melodix).
// Garanties verifiees ici : rapport sans secret (whitelist), compteurs temps
// reel, distinction chargement/erreur/vide, acces UI sans ecran casse, copie
// presse-papiers. STRUCTUREL + simulation JS = ne prouve pas l'ecran reel.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (f) => fs.readFileSync(path.join(root, f), 'utf8');
const shellSrc = read('assets/native_ui_shell.js');
const bridgeSrc = read('assets/spotify_bridge.js');

function runShell(extraWindow = {}) {
  const mainView = { querySelectorAll: () => [] };
  const document = {
    readyState: 'complete',
    documentElement: {},
    querySelector: (sel) => (sel === '#main-view' ? mainView : sel.includes('user-widget-link') ? {} : null),
    addEventListener: () => {}
  };
  class MO { observe() {} }
  const window = {
    location: { hostname: 'open.spotify.com', pathname: '/', href: 'https://open.spotify.com/', assign: () => {} },
    AndBridge: { onNativeUiReady: () => {}, onNativeUiRoute: () => {}, onNativeUiData: () => {}, logDiagEvent: () => {} },
    MutationObserver: MO,
    addEventListener: () => {},
    setTimeout: () => 1,
    clearTimeout: () => {},
    Date,
    console,
    ...extraWindow
  };
  vm.runInNewContext(shellSrc, { window, document, URL, Date });
  return window;
}

test('[diag] __sfDiagReport expose les champs demandes par la mission', () => {
  const w = runShell();
  assert.equal(typeof w.__sfDiagReport, 'function');
  const r = w.__sfDiagReport();
  for (const key of ['collectedAt', 'bridgeStartedAt', 'shellStarted', 'shellCompleted', 'shellErrors',
    'tokenChecked', 'tokenPresent', 'libStatus', 'libError', 'playlistsReceived',
    'homeCollected', 'homeMerged', 'readyNotified',
    'lastSendScreen', 'lastSendCount', 'lastSendAt']) {
    assert.ok(Object.prototype.hasOwnProperty.call(r, key), 'champ manquant: ' + key);
  }
});

test('[diag] le rapport ne contient aucun secret (token/cookie/headers)', () => {
  const w = runShell({
    spotAuthToken: 'Bearer SECRET-TOKEN-XYZ',
    mediaLib: { playlists: [{ id: 'spotify:playlist:p1', name: 'Privee', image: '' }] }
  });
  const json = JSON.stringify(w.__sfDiagReport());
  assert.ok(!/SECRET-TOKEN|Bearer |sp_dc|cookie|authorization/i.test(json), 'aucun secret dans le rapport');
  // Token is presence-only.
  const r = w.__sfDiagReport();
  assert.equal(typeof r.tokenPresent, 'boolean');
  // The report builder source must never read the token value itself.
  assert.ok(!shellSrc.includes('spotAuthToken'), 'le shell ne lit pas le token');
});

test('[diag] distinction chargement / pret / erreur / non verifie', () => {
  const w = runShell();
  assert.equal(w.__sfDiagReport().libStatus, 'pending', 'avant toute tentative: pending');
  w.__sfMediaLibStatus = 'loading';
  assert.equal(w.__sfDiagReport().libStatus, 'loading');
  w.__sfMediaLibStatus = 'ready';
  w.mediaLib = { playlists: [] };
  const empty = w.__sfDiagReport();
  assert.equal(empty.libStatus, 'ready');
  assert.equal(empty.playlistsReceived, 0, 'vide reel = 0, pas un succes invente');
  w.__sfMediaLibStatus = 'error';
  w.__sfMediaLibError = 'http-403';
  const err = w.__sfDiagReport();
  assert.equal(err.libStatus, 'error');
  assert.equal(err.libError, 'http-403', 'code HTTP disponible dans la derniere erreur');
  // tokenChecked false -> must not claim "present"
  assert.equal(err.tokenChecked, false);
  assert.equal(err.tokenPresent, false);
});

test('[diag] les compteurs sont mis a jour au moment reel des evenements', () => {
  const w = runShell();
  assert.equal(w.__sfDiagReport().shellStarted, true, 'shell demarre');
  w.__sfDiagState.tokenPresent = true;
  w.__sfDiagState.playlistsReceived = 3;
  w.__sfDiagState.homeCollected = 2;
  w.__sfDiagState.homeMerged = 5;
  w.__sfDiagState.lastSendScreen = 'home';
  w.__sfDiagState.lastSendCount = 5;
  const r = w.__sfDiagReport();
  assert.equal(r.tokenPresent, true);
  assert.equal(r.playlistsReceived, 3);
  assert.equal(r.homeCollected, 2);
  assert.equal(r.homeMerged, 5);
  assert.equal(r.lastSendScreen, 'home');
  assert.equal(r.lastSendCount, 5);
});

test('[diag] le bridge alimente le meme etat (status/erreur/playlists)', () => {
  const idx = bridgeSrc.indexOf('function notifyMediaLibSettled(');
  assert.ok(idx > 0, 'notification de settlement');
  const chunk = bridgeSrc.slice(bridgeSrc.indexOf('async function checkMediaLib'), bridgeSrc.indexOf('window.checkMediaLib = checkMediaLib'));
  assert.ok(chunk.includes('__sfDiagState.libStatus'), 'statut mis a jour au moment reel');
  assert.ok(chunk.includes('__sfDiagState.libError'), 'erreur mise a jour au moment reel');
  assert.ok(chunk.includes('__sfDiagState.playlistsReceived'), 'compteur de playlists au moment reel');
  assert.ok(bridgeSrc.includes('__sfDiagState.bridgeStartedAt'), 'heure de demarrage du bridge');
  assert.ok(bridgeSrc.includes('__sfDiagState.tokenPresent = !!window.spotAuthToken'),
    'token: presence booleenne uniquement');
});

test('[diag structurel] panneau local: acces par long-press, pas d ecran casse', () => {
  const act = read('smali/com/melodix/music/MainActivity.smali');
  const cb = read('smali/com/melodix/music/NativeDiagCallback.smali');
  const click = read('smali/com/melodix/music/NativeDiagLongClickListener.smali');
  const refresh = read('smali/com/melodix/music/NativeDiagRefreshListener.smali');
  const rd = read('smali/com/melodix/music/RuntimeDiagnostic.smali');

  // Trigger: long-press on the Melodix logo, wired in showNativeUi.
  assert.ok(click.includes('View$OnLongClickListener'), 'long-press implemente');
  assert.ok(click.includes('openNativeDiagnostics()V'), 'ouvre le panneau');
  assert.ok(act.includes('setOnLongClickListener'), 'cable dans showNativeUi');
  assert.ok(act.includes('.method public final openNativeDiagnostics()V'), 'methode publique');
  assert.ok(act.includes('Lcom/melodix/music/NativeDiagCallback;'), 'callback de collecte JS');
  // Native counters updated in real time at receive/render.
  assert.ok(act.includes('nativeDiagReceiveCount'), 'compteur de receptions');
  assert.ok(act.includes('nativeDiagRenderCount'), 'compteur de rendus');
  assert.ok(act.includes('nativeDiagLastRenderRows'), 'taille du dernier payload rendu');
  // Dialog: local AlertDialog (does not replace home) with Copier + Actualiser + Fermer.
  assert.ok(rd.includes('AlertDialog$Builder'), 'dialog local, pas de remplacement d ecran');
  assert.ok(rd.includes('"Copier"'), 'bouton copier');
  assert.ok(rd.includes('"Actualiser"'), 'bouton actualiser');
  assert.ok(rd.includes('NativeDiagRefreshListener'), 'actualiser relance la collecte');
  assert.ok(refresh.includes('openNativeDiagnostics()V'), 'refresh -> nouvelle collecte');
  // Clipboard copy path (Android).
  const copy = read('smali/com/melodix/music/RuntimeDiagnostic$CopyListener.smali');
  assert.ok(copy.includes('ClipboardManager'), 'copie presse-papiers');
  assert.ok(copy.includes('setPrimaryClip'), 'clip pose');
});

test('[diag structurel] whitelist cote natif: seules les cles connues sont lues', () => {
  const cb = read('smali/com/melodix/music/NativeDiagCallback.smali');
  // The native side reads a fixed key list; unknown JSON keys are dropped.
  for (const key of ['bridgeStartedAt', 'shellStarted', 'shellErrors', 'readyNotified',
    'tokenChecked', 'tokenPresent', 'libStatus', 'libError', 'playlistsReceived',
    'homeCollected', 'homeMerged', 'lastSendScreen', 'lastSendCount', 'lastSendAt', 'collectedAt']) {
    assert.ok(cb.includes('"' + key + '"'), 'cle whitelistee: ' + key);
  }
  // And the fallback states are explicit, never a fake success.
  assert.ok(cb.includes('Rapport JS indisponible'), 'absence de rapport = dit explicitement');
  assert.ok(cb.includes('absent (non verifie)'), 'token non verifie = non verifie');
});
