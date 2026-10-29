#!/usr/bin/env node
'use strict';
// Contrat [structurel] : toute référence smali (invoke/sget/iget) d'une méthode
// @JavascriptInterface doit résoudre sur un membre EXISTANT de la classe
// déclarée (classes de l'app) ; pour getBuildLabel, les signatures framework
// doivent aussi être connues. Une référence fantôme (ex. AndBridge
// .getApplicationContext() alors qu'AndBridge étend Object) = VerifyError ART
// = crash AU LANCEMENT de l'app, avant tout code JS.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8');

function classMembers(smaliText) {
  const methods = new Set();
  const fields = new Set();
  for (const m of smaliText.matchAll(/^\.method[^\n]*?([^\s(]+)\(([^)]*)\)(\S+)/gm)) {
    methods.add(`${m[1]}(${m[2]})${m[3]}`);
    methods.add(`${m[1]}(${m[2]})`);
  }
  for (const f of smaliText.matchAll(/^\.field[^\n]*?([^\s:]+):(\S+)/gm)) {
    fields.add(`${f[1]}:${f[2]}`);
  }
  return { methods, fields };
}

function interfaceMethodBodies(smaliText) {
  const bodies = [];
  for (const part of smaliText.split(/^(?=\.method )/m)) {
    if (part.startsWith('.method') && part.includes('Landroid/webkit/JavascriptInterface;')) bodies.push(part);
  }
  return bodies;
}

// Références : "Lcls;->member" (member = name(args)ret pour les méthodes,
// name:type pour les champs). sget/iget n'ont pas d'accolades de registres.
function extractRefs(body) {
  const refs = [];
  for (const m of body.matchAll(/invoke-(?:virtual|direct|static)(?:\/range)?\s+\{[^}]*\},\s*(L[^;]+;)->(\S+)/g)) {
    refs.push({ cls: m[1], member: m[2], kind: 'method' });
  }
  for (const m of body.matchAll(/[si]get-(?:object|boolean|int|wide)\s+\S+,\s*(L[^;]+;)->(\S+)/g)) {
    refs.push({ cls: m[1], member: m[2], kind: 'field' });
  }
  return refs;
}

// Signatures framework utilisées par getBuildLabel, vérifiées comme existantes
// sur l'API Android (Context/PackageManager/PackageInfo/TextUtils).
const FRAMEWORK_METHODS = new Set([
  'Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;',
  'Landroid/content/Context;->getPackageName()Ljava/lang/String;',
  'Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;'
]);
const FRAMEWORK_FIELDS = new Set([
  'Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;'
]);

const APP_CLASSES = {
  'Lcom/melodix/music/AndBridge;': classMembers(read('smali/com/melodix/music/AndBridge.smali')),
  'Lcom/melodix/music/AppSingleton;': classMembers(read('smali/com/melodix/music/AppSingleton.smali')),
  'Lcom/melodix/music/MainActivity;': classMembers(read('smali/com/melodix/music/MainActivity.smali')),
  'Lcom/melodix/music/NativeCrashGuard;': classMembers(read('smali/com/melodix/music/NativeCrashGuard.smali')),
  'Lcom/melodix/music/NativeLogoutRunnable;': classMembers(read('smali/com/melodix/music/NativeLogoutRunnable.smali')),
  'Lcom/melodix/music/WebService;': classMembers(read('smali/com/melodix/music/WebService.smali')),
  'Lcom/melodix/music/NativeAssetRunner;': classMembers(read('smali/com/melodix/music/NativeAssetRunner.smali')),
  'Lcom/melodix/music/NativeUiUpdateRunnable;': classMembers(read('smali/com/melodix/music/NativeUiUpdateRunnable.smali')),
  'Lcom/melodix/music/NativeHomeShelfRenderer;': classMembers(read('smali/com/melodix/music/NativeHomeShelfRenderer.smali'))
};

test('[structurel] références app des méthodes @JavascriptInterface d\'AndBridge : tout résout', () => {
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  const bodies = interfaceMethodBodies(andBridge);
  assert.ok(bodies.length >= 8, `au moins 8 méthodes @JavascriptInterface (trouvées: ${bodies.length})`);
  const dangling = [];
  for (const body of bodies) {
    const name = (body.match(/^\.method[^\n]*?([^\s(]+)\(/) || [])[1] || '?';
    for (const { cls, member, kind } of extractRefs(body)) {
      if (!cls.startsWith('Lcom/melodix/music/')) continue; // framework = autre contrat
      const known = APP_CLASSES[cls];
      if (!known) { dangling.push(`${name}: classe inconnue ${cls}`); continue; }
      const ok = kind === 'field' ? known.fields.has(member) : known.methods.has(member);
      if (!ok) dangling.push(`${name}: ${kind} ${cls}->${member}`);
    }
  }
  assert.deepEqual(dangling, [], `références fantômes = VerifyError au lancement:\n${dangling.join('\n')}`);
});

test('[structurel] getBuildLabel : signatures framework toutes connues', () => {
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  const at = andBridge.indexOf('.method public final getBuildLabel()Ljava/lang/String;');
  assert.ok(at > -1);
  const body = andBridge.slice(at, andBridge.indexOf('.end method', at));
  const dangling = [];
  for (const { cls, member, kind } of extractRefs(body)) {
    if (cls.startsWith('Lcom/melodix/music/')) continue;
    const key = `${cls}->${member}`;
    const ok = kind === 'field' ? FRAMEWORK_FIELDS.has(key) : FRAMEWORK_METHODS.has(key);
    if (!ok) dangling.push(key);
  }
  assert.deepEqual(dangling, [], `signatures framework inconnues:\n${dangling.join('\n')}`);
});

test('[structurel] getBuildLabel : aucun branchement ne sort du try, handler autonome', () => {
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  const at = andBridge.indexOf('.method public final getBuildLabel()Ljava/lang/String;');
  const body = andBridge.slice(at, andBridge.indexOf('.end method', at));
  const tryStart = body.indexOf(':try_start_0');
  const tryEnd = body.indexOf(':try_end_0');
  assert.ok(tryStart > -1 && tryEnd > tryStart);
  const inTry = body.slice(tryStart, tryEnd);
  const afterTry = body.slice(tryEnd);
  for (const br of inTry.matchAll(/if-\w+ \S+, :(\w+)|goto :(\w+)/g)) {
    const target = br[1] || br[2];
    assert.ok(inTry.includes(`:${target}`), `cible :${target} hors du try`);
  }
  // piège connu : indexOf(':catch_0') attrape la directive .catch AVANT le
  // label — ancrer sur le label en début de ligne (leçon du piège :fade_go).
  const handlerAt = afterTry.indexOf('\n    :catch_0');
  assert.ok(handlerAt > -1, 'label :catch_0 présent comme ligne');
  const handler = afterTry.slice(handlerAt);
  assert.match(handler, /return-object/, 'le handler termine par un retour');
  assert.equal((handler.match(/return-object/g) || []).length, 1, 'un seul retour dans le handler');
});

test('[structurel] getBuildLabel lit le contexte via le champ AndBridge.a (idiome prouvé)', () => {
  const andBridge = read('smali/com/melodix/music/AndBridge.smali');
  const at = andBridge.indexOf('.method public final getBuildLabel()Ljava/lang/String;');
  const body = andBridge.slice(at, andBridge.indexOf('.end method', at));
  assert.match(body, /iget-object v0, p0, Lcom\/melodix\/music\/AndBridge;->a:Landroid\/content\/Context;/);
  assert.ok(!body.includes('getApplicationContext'), 'pas de méthode potentiellement inexistante');
  assert.match(body, /\.catch Ljava\/lang\/Throwable;/, 'tout échec retombe sur "?"');
});
