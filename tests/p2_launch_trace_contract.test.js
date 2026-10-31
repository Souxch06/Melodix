// The preview trace is the only source of real execution evidence we have:
// it installs the APK on an emulator, launches it and reads back what the
// device actually shows. Two properties matter, and both used to be missing:
//
//   1. the capture must distinguish "slow startup" from "stuck for ever", so
//      it samples the same launch several times instead of twice;
//   2. it must report the stage chain and the on-screen text, because an
//      empty logcat alone says nothing.
//
// Treating these as contracts keeps a future edit from silently removing the
// only proof the project can produce without a physical phone.

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const scriptPath = path.join(root, 'scripts', 'preview-launch-trace.sh');

function readScript() {
  return fs.readFileSync(scriptPath, 'utf8');
}

test('the launch trace is a timeline, not two isolated snapshots', () => {
  const script = readScript();
  assert.match(script, /: > "\$state\/timeline\.txt"/, 'la chronologie est remise a zero a chaque capture');
  assert.match(script, /sample\(\) \{/, 'un echantillonneur unique est utilise');
  const loop = script.match(/for wait_s in ([0-9 ]+); do/);
  assert.ok(loop, 'une boucle d echantillons existe');
  const delays = loop[1].trim().split(/\s+/).map(Number);
  assert.ok(delays.length >= 5, 'au moins cinq points de mesure');
  assert.deepEqual(delays, [...delays].sort((a, b) => a - b), 'les points sont croissants');
  assert.ok(delays[delays.length - 1] >= 60,
    'la derniere mesure depasse 60 s: un demarrage lent doit avoir le temps de se terminer');
});

test('each sample reports the stage chain, the focus and the real on-screen text', () => {
  const script = readScript();
  const body = script.slice(script.indexOf('sample() {'), script.indexOf('for wait_s in'));
  assert.match(body, /stage_chain/, 'la chaine d etapes native est relue');
  assert.match(body, /mCurrentFocus/, 'la fenetre reellement au premier plan est relevee');
  assert.match(body, /uiautomator dump/, 'le texte visible est releve par uiautomator');
  assert.match(body, /text="\[\^"\]\*"/, 'seul le texte des vues est conserve');
  assert.match(body, /aucun texte/, 'une capture vide est explicite, jamais un champ blanc');
});

test('the timeline reaches the commit report', () => {
  const script = readScript();
  assert.match(script, /chronologie du 2e lancement/);
  assert.match(script, /head -c \d+ "\$state\/timeline\.txt"/);
});

test('the trace still captures the native startup chain and any fatal error', () => {
  const script = readScript();
  // These two greps are what turn a logcat into an answer about the shell.
  assert.match(script, /grep -E 'MDXTRACE\|chromium\.\*\[Cc\]onsole\|Web Console'/);
  assert.match(script, /grep -n -A 60 'FATAL EXCEPTION'/);
});

test('the script stays valid bash', () => {
  const { execFileSync } = require('node:child_process');
  // `bash -n` parses without running: a broken trace script would cost a whole
  // emulator run to discover.
  execFileSync('bash', ['-n', scriptPath], { stdio: 'pipe' });
});

test('the trace proves why the process hangs, not only that it hangs', () => {
  const script = readScript();
  // The previous run ended on "Application Not Responding" with no stack: the
  // report could say the app froze but not where. The device keeps the answer
  // in /data/anr; the app's own watchdog stores the main-thread stack too.
  assert.match(script, /\/data\/anr\/traces\.txt/, 'la pile ANR du systeme est lue');
  assert.match(script, /adb shell ls \/data\/anr\//, 'les fichiers anr_* recents sont lus');
  assert.match(script, /grep -n -A 60 'ANR in'/, 'le bloc ANR de logcat est extrait');
  assert.match(script, /last-crash\.txt/, 'la pile du chien de garde est conservee');
  assert.match(script, /--- ANR: pile du thread principal ---/, 'la pile apparait dans le rapport');
});
