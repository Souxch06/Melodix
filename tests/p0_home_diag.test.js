#!/usr/bin/env node
'use strict';
// Contrats structurels du statut Home explicite et des diagnostics de démarrage.
// Un statut non-Spotify est distinct d’une carte, mais ne peut prendre le relais
// que lorsqu’une preuve de session et l’envoi du payload sont confirmés.
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

test('[structurel] homeStateRow is typed non-playlist content with only local actions', () => {
  const at = shell.indexOf('function homeStateRow()');
  assert.ok(at > -1, 'homeStateRow exists');
  const end = shell.indexOf('\n    // Manual retry', at);
  const body = shell.slice(at, end);
  assert.match(body, /kind: 'state'/);
  assert.match(body, /state: 'error'/);
  assert.match(body, /state: 'empty'/);
  assert.match(body, /state: 'unavailable'/);
  assert.match(body, /state: 'loading'/);
  assert.match(body, /image: ''/);
  assert.match(body, /uri: rawError \? homeStateAction\(rawError\) : 'melodix:action:retry-library'/,
    'raw response parse failures get a real retry action, while classified errors use their specific action');
  const actionAt = shell.indexOf('function homeStateAction(err)');
  const actionBody = shell.slice(actionAt, shell.indexOf('\n    function homeStateRow', actionAt));
  assert.match(actionBody, /melodix:action:retry-library/);
  assert.match(actionBody, /melodix:action:open-settings/);
  assert.doesNotMatch(body, /spotifyRoutePath\(\)|spotify:[a-z]+:/,
    'the status never includes a private route or a fabricated Spotify resource URI');
});

test('[structurel] le comptage diagnostique compare les cartes Web aux rows natives réellement scrappées', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  assert.match(body, /scrapedRows = collectHomeRows\(mainView\)/);
  assert.match(body, /__sfNativeUiHomeDomRowsCount = scrapedRows\.length/);
  assert.match(body, /collectedRows = supplementHomeRowsWithLibrary\(scrapedRows, mainView\)/);
  assert.match(body, /sessionProven = libraryProvesSession\(\)/);
  assert.match(body, /rows = sessionProven \? collectedRows : \[\]/,
    'the native card count includes no public Home rows before private API proof');
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

test('[structurel] an empty Home sends status only with session evidence and falls back to empty data otherwise', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  const readyAt = shell.indexOf('function notifyNativeUiReady(');
  const readyBody = shell.slice(readyAt, shell.indexOf('\n    function ', readyAt + 10));
  assert.match(body, /else if \(pageHasSessionEvidence\(\)\)/);
  assert.match(body, /statePayload = homeStatePayload\(\)/);
  assert.match(body, /window\.__sfNativeUiHomeStateSent = true/);
  assert.match(body, /sendNativeUiData\('home', \[\]\)/,
    'a logged-out empty page clears native content without creating a status row');
  assert.match(readyBody, /sessionProven &&[\s\S]*?__sfNativeUiHomeStateSent === true[\s\S]*?__sfNativeUiHomeDataSent === true/);
  const stateAt = shell.indexOf('function homeStateRow()');
  const stateBody = shell.slice(stateAt, shell.indexOf('\n    // Manual retry', stateAt));
  assert.match(stateBody, /homeRetries >= MAX_HOME_RETRIES && !homeRetryLoopAlive\(\)/);
  assert.match(stateBody, /state: 'unavailable'/,
    'retry exhaustion is communicated through the distinct status panel, not a diagnostic playlist row');
  assert.doesNotMatch(body, /sendNativeUiData\('home', \[homeDiagRow/);
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
