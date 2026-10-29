#!/usr/bin/env node
'use strict';
// Contrat [structurel] : un rapport de crash affiché doit SURVIVRE au watchdog.
// showLastReport bloque le démarrage (onCreate retourne sans startupDone) : si
// le watchdog n'est pas parqué, il force-quit l'app 25 s plus tard et le
// dialogue disparaît — l'utilisateur ne voit « aucun message ».
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const main = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
const watchdog = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/StartupHangWatchdog.smali'), 'utf8');

test('[structurel] rapport affiché => startupDone posé avant return-void', () => {
  // piège de famille : indexOf(':native_guard_done') attrape le goto AVANT le
  // label — ancrer sur la ligne-label.
  const at = main.indexOf('\n    :native_guard_done\n');
  assert.ok(at > -1, 'label :native_guard_done présent');
  const block = main.slice(at, at + 600);
  const ret = block.indexOf('return-void');
  assert.ok(ret > -1, 'return-void après le label');
  const before = block.slice(0, ret);
  assert.match(before, /sput-boolean \S+, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/, 'watchdog parqué');
});

test('[structurel] le watchdog lit startupDone avant de tuer', () => {
  assert.match(watchdog, /sget-boolean \S+, Lcom\/melodix\/music\/AppSingleton;->startupDone:Z/);
  // le kill ne doit intervenir qu'après cette lecture (garde de hang réel)
  const check = watchdog.indexOf('startupDone:Z');
  const kill = watchdog.search(/killProcess|System;->exit/);
  if (kill > -1) assert.ok(check < kill, 'lecture startupDone avant le kill');
});
