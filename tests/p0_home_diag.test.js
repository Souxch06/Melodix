#!/usr/bin/env node
'use strict';
// Contrats [structurels] du diagnostic « accueil vide ». Quand l'accueil ne
// collecte aucune row, l'état complet (build, page, bridge, mediaLib,
// compteurs) doit s'afficher à l'écran : un screenshot devient un diagnostic.
// Ces contrats ne prouvent pas l'exécution Android.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const ROOT = path.resolve(__dirname, '..');
const shell = fs.readFileSync(path.join(ROOT, 'assets/native_ui_shell.js'), 'utf8');
const smali = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/AndBridge.smali'), 'utf8');

test('[structurel] AndBridge.getBuildLabel expose le versionName (1.2.2-<sha7>) via JavascriptInterface', () => {
  const at = smali.indexOf('.method public final getBuildLabel()Ljava/lang/String;');
  assert.ok(at > -1, 'getBuildLabel existe');
  const body = smali.slice(at, smali.indexOf('.end method', at));
  assert.match(body, /Landroid\/webkit\/JavascriptInterface;/);
  assert.match(body, /Landroid\/content\/pm\/PackageInfo;->versionName:Ljava\/lang\/String;/);
  assert.match(body, /\.catch Ljava\/lang\/Throwable;/, 'jamais de crash pour un diagnostic');
});

test('[structurel] homeDiagRow porte build/page/bridge/mediaLib/rows', () => {
  const at = shell.indexOf('function homeDiagRow(reason)');
  assert.ok(at > -1, 'homeDiagRow existe');
  const body = shell.slice(at, at + 1200);
  assert.match(body, /getBuildLabel/);
  assert.match(body, /spotifyRoutePath\(\)/);
  assert.match(body, /bridgeHasStarted\(\)/);
  assert.match(body, /__sfMediaLibStatus/);
  assert.match(body, /__sfNativeUiHomeRowsCount/);
});

test('[structurel] un takeover sans rows affiche la ligne diagnostic', () => {
  const at = shell.indexOf('bridge.onNativeUiReady();');
  const after = shell.slice(at, at + 1400);
  const diagAt = after.indexOf('homeDiagRow(');
  assert.ok(diagAt > -1, 'envoi du diag après le takeover');
  assert.match(after, /__sfNativeUiHomeRowsCount \|\| 0\) < 1/);
  assert.match(after, /onNativeUiData\('home', JSON\.stringify\(\[homeDiagRow/);
});

test('[structurel] un scrape vide répété envoie le diag (3/15/MAX essais), jamais avec des rows', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  assert.match(body, /rows\.length === 0 && \(homeRetries === 3 \|\| homeRetries === 15 \|\| homeRetries === MAX_HOME_RETRIES\)/);
  assert.match(body, /sendNativeUiData\('home', \[homeDiagRow/);
});

test('[vm] le shell reste exécutable avec les ajouts diag', () => {
  const document = {
    readyState: 'complete',
    documentElement: {},
    querySelector: () => null,
    querySelectorAll: () => [],
    addEventListener: () => {}
  };
  const window = {
    location: {
      hostname: 'open.spotify.com',
      pathname: '/',
      href: 'https://open.spotify.com/',
      assign: () => {}
    },
    AndBridge: { onNativeUiReady: () => {}, onNativeUiData: () => {}, getBuildLabel: () => '1.2.2-test' },
    addEventListener: () => {},
    setTimeout: () => 1,
    clearTimeout: () => {}
  };
  assert.doesNotThrow(() => vm.runInNewContext(shell, { window, document, URL, console }));
});
