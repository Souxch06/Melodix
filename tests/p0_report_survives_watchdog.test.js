#!/usr/bin/env node
'use strict';
// Contrat [structurel] : le lancement n'est JAMAIS bloque par un rapport.
// Ancien defaut : showLastReport affichait un dialogue puis onCreate
// retournait - WebView jamais creee, logo fige, session jamais 'ready' ->
// rapport d'interruption suivant -> boucle infinie (demande utilisateur :
// "plus de message de crash quand on lance l'appl").
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const main = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
const watchdog = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/StartupHangWatchdog.smali'), 'utf8');
const diag = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/RuntimeDiagnostic.smali'), 'utf8');
const guard = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/NativeCrashGuard.smali'), 'utf8');

test('[structurel] onCreate n\'affiche plus aucun rapport bloquant', () => {
  // Aucun appel a showLastReport depuis MainActivity.
  assert.ok(!main.includes('Lcom/melodix/music/NativeCrashGuard;->showLastReport'),
    'showLastReport ne doit plus etre appele au lancement');
  // Le bloc de garde ne contient plus de return-void anticipe : le demarrage
  // continue toujours jusqu'au marqueur et aux stages.
  const at = main.indexOf('\n    :native_guard_done\n');
  assert.ok(at > -1, 'label :native_guard_done présent');
  const marker = main.indexOf('showLaunchMarker', at);
  assert.ok(marker > at, 'showLaunchMarker apres le bloc de garde');
  const between = main.slice(at, marker);
  assert.ok(!between.includes('return-void'), 'aucun return-void avant le marqueur');
});

test('[structurel] le rapport reste consultable dans le visualiseur de diagnostic', () => {
  // Corriger, pas masquer : le rapport enregistre est rendu dans le
  // visualiseur (non bloquant), raccourci, jamais en dialogue de lancement.
  assert.match(diag, /NativeCrashGuard;->lastReport\(\)Ljava\/lang\/String;/);
  assert.match(diag, /NativeCrashGuard;->shorten\(Ljava\/lang\/String;\)Ljava\/lang\/String;/);
  assert.match(guard, /\.method public static lastReport\(\)Ljava\/lang\/String;/);
});

test('[structurel] le watchdog lit startupDone avant de tuer', () => {
  assert.match(watchdog, /sget-boolean \S+, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);
  const check = watchdog.indexOf('startupDone:Z');
  const kill = watchdog.search(/killProcess|System;->exit/);
  if (kill > -1) assert.ok(check < kill, 'lecture startupDone avant le kill');
});

test('[structurel] SelfUpdater : aucun reseau avant la fin du demarrage', () => {
  const su = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/SelfUpdater.smali'), 'utf8');
  const runAt = su.search(/\.method[^\n]* run\(\)V/);
  const run = su.slice(runAt, su.indexOf('.end method', runAt));
  // Le worker attend startupDone (boucle bornee) avant tout fetch/download.
  const wait = run.indexOf('startupDone:Z');
  const net = run.indexOf('SelfUpdater;->fetch');
  assert.ok(wait > -1 && net > -1 && wait < net, 'attente startupDone AVANT le premier fetch');
});
