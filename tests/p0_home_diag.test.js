#!/usr/bin/env node
'use strict';
// Contrats structurels du diagnostic « accueil vide ». Les états restent
// disponibles pour le diagnostic interne, mais ne sont jamais présentés comme
// un remplacement natif tant qu’aucune vraie carte Spotify n’est rendue.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const ROOT = path.resolve(__dirname, '..');
const shell = fs.readFileSync(path.join(ROOT, 'scripts/native_ui_shell.source.js'), 'utf8');
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
  assert.match(body, /web cards/);
  assert.match(body, /__sfMelodixHomeSourceCardCount/);
  assert.match(body, /__sfNativeUiHomeDomRowsCount/);
  assert.match(body, /__sfNativeUiHomeRowsCount/);
});

test('[structurel] le comptage diagnostique compare les cartes Web aux rows natives réellement scrappées', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  assert.match(body, /scrapedRows = collectHomeRows\(mainView\)/);
  assert.match(body, /__sfNativeUiHomeDomRowsCount = scrapedRows\.length/);
  assert.match(body, /rows = supplementHomeRowsWithLibrary\(scrapedRows\)/);
  assert.match(body, /home-card-counts web=' \+ webCards \+ ' native-dom=' \+ scrapedRows\.length \+\s*' native-total=' \+ rows\.length/);
  assert.match(body, /__sfNativeUiHomeCountTraceSignature/,
    'les diagnostics du compteur sont plafonnés aux changements de compte');
});

test('[structurel] les rows vides/actions ne satisfont pas le gate de readiness', () => {
  const at = shell.indexOf('function notifyNativeUiReady(');
  const body = shell.slice(at, shell.indexOf('\n    function ', at + 10));
  const gate = body.indexOf('if (isSpotifyHome()');
  const ready = body.indexOf('bridge.onNativeUiReady();');
  assert.ok(gate >= 0 && ready > gate, 'le gate précède le callback qui couvre la page');
  assert.match(body.slice(gate, ready), /__sfNativeUiHomeRowsCount/);
  assert.match(body.slice(gate, ready), /__sfNativeUiHomeDataSent/);
  assert.match(body.slice(gate, ready), /action=keep-spotify-visible/);
  assert.match(body.slice(gate, ready), /return false;/);
  assert.doesNotMatch(body.slice(ready), /onNativeUiData\('home', JSON\.stringify\(homeStatePayload\(\)\)/,
    'aucun état de chargement n’est envoyé après un takeover vide');
});

test('[structurel] un scrape vide explique l etat (3/15) puis livre le diag complet (MAX)', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  assert.match(body, /rows\.length === 0 && \(homeRetries === 3 \|\| homeRetries === 15\)/);
  assert.match(body, /sendNativeUiData\('home', homeStatePayload\(\)\)/);
  assert.match(body, /rows\.length === 0 && homeRetries === MAX_HOME_RETRIES/);
  assert.match(body, /sendNativeUiData\('home', \[homeDiagRow/);
  // Jamais de row d etat quand de vraies rows existent.
  assert.ok(body.indexOf('homeStatePayload()') > -1);
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
