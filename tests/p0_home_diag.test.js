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

test('[structurel] le shell garde tous les rows privés derrière libraryV3 sans publier de compteurs', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  assert.match(body, /scrapedRows = mainView \? collectHomeRows\(mainView\) : \[\]/);
  assert.match(body, /collectedRows = supplementHomeRowsWithLibrary\(scrapedRows, mainView\)/);
  assert.match(body, /sessionProven = libraryProvesSession\(\)/);
  assert.match(body, /rows = sessionProven && actualHomeRoute \? collectedRows : \[\]/,
    'aucune ligne Home/Search/Library/detail privée ne passe avant libraryV3');
  assert.match(body, /statePayload = sessionProven \? homeStatePayload\(\) : unprovenHomeStatePayload\(\)/,
    'le shell utilise un état distinct lorsque la session n’est pas prouvée');
  assert.match(body, /sendNativeUiData\('home', statePayload\)/);
  assert.doesNotMatch(body, /home-card-counts|native-total|webCards|librows|domrows/,
    'les diagnostics n’exportent ni volumes de playlists ni métriques dérivées du compte');
});

test('[structurel] la readiness est autorisée par un état explicite, jamais par une charge vide', () => {
  const at = shell.indexOf('function notifyNativeUiReady(');
  const body = shell.slice(at, shell.indexOf('\n    function ', at + 10));
  const ready = body.indexOf('bridge.onNativeUiReady();');
  assert.ok(ready > -1, 'le callback natif existe');
  assert.match(body, /homeShellStateReady = nativeHomeRoute[\s\S]*?HomeStateSent === true[\s\S]*?HomeDataSent === true/);
  assert.match(body, /sessionProven \|\| window\.__sfNativeUiHomeSessionUnproven === true/,
    'un état sans preuve ouvre l’interface mais ne modifie pas takeoverProven');
  assert.match(body, /takeoverProven = sessionProven/);
  assert.match(body, /shellActivationAllowed = takeoverProven \|\| homeShellStateReady/);
  assert.match(body, /if \(isSpotifyHome\(\) && sessionProven && !homeContentProven && !homeStateProven\)[\s\S]*?return false/,
    'avec preuve, une charge vide ou échouée ne satisfait pas le gate');
  assert.doesNotMatch(body, /action=keep-spotify-visible|sendNativeUiData\('home', JSON\.stringify/);
});

test('[structurel] Home envoie une ligne de statut non prouvée mais jamais de données privées', () => {
  const at = shell.indexOf('function updateHomeRows(mainView)');
  const body = shell.slice(at, shell.indexOf('function currentSearchQuery', at));
  const readyAt = shell.indexOf('function notifyNativeUiReady(');
  const readyBody = shell.slice(readyAt, shell.indexOf('\n    function ', readyAt + 10));
  assert.match(body, /statePayload = sessionProven \? homeStatePayload\(\) : unprovenHomeStatePayload\(\)/);
  assert.match(body, /window\.__sfNativeUiHomeStateSent = true/);
  assert.match(body, /sendNativeUiData\('home', statePayload\)/);
  assert.match(body, /HomeSessionUnproven = statePayload\[0\]\.sessionUnproven === true/);
  assert.match(readyBody, /homeShellStateReady = nativeHomeRoute[\s\S]*?HomeStateSent === true[\s\S]*?HomeDataSent === true[\s\S]*?sessionProven \|\| window\.__sfNativeUiHomeSessionUnproven === true/);
  const stateAt = shell.indexOf('function unprovenHomeStateRow()');
  const stateBody = shell.slice(stateAt, shell.indexOf('function homePartialErrorRow()', stateAt));
  assert.match(stateBody, /state: state/);
  assert.match(stateBody, /sessionUnproven: true/);
  assert.match(stateBody, /uri: 'melodix:action:open-login'/);
  assert.doesNotMatch(stateBody, /spotify:(?:playlist|album|artist|track):/);
  assert.doesNotMatch(body, /sendNativeUiData\('home', \[\]\)|sendNativeUiData\('home', \[homeDiagRow/);
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
