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
  'Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;',
  'Ljava/lang/String;->length()I',
  'Ljava/lang/String;->substring(II)Ljava/lang/String;',
  'Ljava/lang/String;->equals(Ljava/lang/Object;)Z',
  'Ljava/lang/StringBuilder;-><init>()V',
  'Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;',
  'Ljava/lang/StringBuilder;->toString()Ljava/lang/String;',
  'Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V',
  'Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;',
  'Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;',
  'Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;',
  'Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;'
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
  'Lcom/melodix/music/NativeWebPlayerNavigationRunnable;': classMembers(read('smali/com/melodix/music/NativeWebPlayerNavigationRunnable.smali')),
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

test('[structurel] NativeCrashGuard.showLastReport + buildLabel : toutes les références résolvent', () => {
  const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
  const dangling = [];
  for (const methodName of ['showLastReport', 'buildLabel']) {
    const at = guard.indexOf(`.method`);
    const mAt = guard.search(new RegExp(`\\.method[^\\n]* ${methodName}\\(`));
    assert.ok(mAt > -1, `méthode ${methodName} présente`);
    const body = guard.slice(mAt, guard.indexOf('.end method', mAt));
    const name = methodName;
    for (const { cls, member, kind } of extractRefs(body)) {
      if (cls.startsWith('Lcom/melodix/music/')) {
        const known = APP_CLASSES[cls];
        if (!known) { dangling.push(`${name}: classe inconnue ${cls}`); continue; }
        const ok = kind === 'field' ? known.fields.has(member) : known.methods.has(member);
        if (!ok) dangling.push(`${name}: ${kind} ${cls}->${member}`);
      } else {
        const key = `${cls}->${member}`;
        const ok = kind === 'field' ? FRAMEWORK_FIELDS.has(key) : FRAMEWORK_METHODS.has(key);
        if (!ok) dangling.push(`${name}: framework ${key}`);
      }
    }
  }
  assert.deepEqual(dangling, [], `références fantômes:\n${dangling.join('\n')}`);
});

test('[structurel] showLastReport : sans rapport de crash, le fil de stages produit un rapport d\'interruption', () => {
  const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
  const at = guard.search(/\.method[^\n]* showLastReport\(/);
  const body = guard.slice(at, guard.indexOf('.end method', at));
  // gardes d'entrée : rapport absent/vidé -> chemin stage (pas le silence)
  assert.match(body, /if-eqz v1, :try_stage/);
  assert.match(body, /if-eqz v2, :try_stage/);
  // le chemin stage n'affiche que si le stage existe et n'est PAS "ready"
  const stage = body.slice(body.indexOf(':try_stage'));
  assert.match(stage, /const-string v3, "ready"/);
  assert.match(stage, /if-nez v3, :done/);
  assert.match(stage, /Demarrage interrompu/);
  assert.match(stage, /buildLabel/);
  // le message rejoint le dialogue commun (:no_stage) et le retour 1
  assert.match(stage, /goto :no_stage/);
});

test('[structurel] MainActivity.C() : getLayoutParams().width est garde contre null (NPE du onResume)', () => {
  const main = read('smali/com/melodix/music/MainActivity.smali');
  const at = main.search(/\.method public final C\(\)V/);
  assert.ok(at > -1, 'méthode C() présente');
  const body = main.slice(at, main.indexOf('.end method', at));
  const lp = body.indexOf('ViewGroup$LayoutParams;->width:I');
  assert.ok(lp > -1, 'lecture width présente');
  const before = body.slice(0, lp);
  // Entre le getLayoutParams et la lecture width, un garde if-eqz sur v1 doit
  // exister (polarité droite : null -> :cond_9), directives .line tolérées.
  const lpCall = before.lastIndexOf('getLayoutParams()');
  assert.ok(lpCall > -1);
  const between = before.slice(lpCall);
  assert.match(between, /move-result-object v1[\s\S]*if-eqz v1, :cond_9/,
    'garde if-eqz entre getLayoutParams et la lecture width');
});

test('[structurel] executeBridgeSource : injection native evaluateJavascript AVANT le blob optimiste', () => {
  const shell = read('assets/native_ui_shell.js');
  const at = shell.indexOf('function executeBridgeSource');
  assert.ok(at > -1);
  const body = shell.slice(at, shell.indexOf('function ', at + 10));
  const native = body.indexOf("injectBundledAsset('spotify_bridge.js')");
  const blob = body.indexOf("createObjectURL(new Blob");
  assert.ok(native > -1, 'stratégie native présente');
  assert.ok(blob > -1 && native < blob, 'native AVANT blob (blob = retour optimiste bloqué par la CSP)');
  assert.match(body, /__sfBridgeExecMode = 'native-inject'/);
});
