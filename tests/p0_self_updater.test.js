'use strict';
// Tests structurels de l'auto-mise a jour (SelfUpdater) + du diagnostic natif.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

test('[self-update] manifeste : REQUEST_INSTALL_PACKAGES declare', () => {
  const m = read('AndroidManifest.xml');
  assert.ok(m.includes('android.permission.REQUEST_INSTALL_PACKAGES'));
});

test('[self-update] SelfUpdater : entree check + worker Runnable + installation', () => {
  const s = read('smali/com/melodix/music/SelfUpdater.smali');
  assert.ok(s.includes('.method public static check(Landroid/content/Context;)V'));
  assert.ok(s.includes('.implements Ljava/lang/Runnable;'));
  assert.ok(s.includes('.method public static install(Landroid/content/Context;Ljava/io/File;)V'));
  // Canal public, aucune credential.
  assert.ok(s.includes('https://api.github.com/repos/Souxch06/Melodix/releases'));
  const code = s.split('\n').filter((l) => !l.trim().startsWith('#')).join('\n');
  assert.ok(!/token|Authorization|password/i.test(code.replace(/User-Agent/g, '')));
});

test('[self-update] SelfUpdater : verification SHA-256 + refus de downgrade + meme paquet', () => {
  const s = read('smali/com/melodix/music/SelfUpdater.smali');
  assert.ok(s.includes('Ljava/security/MessageDigest;->getInstance'));
  assert.ok(s.includes('"SHA-256"'));
  assert.ok(s.includes('Landroid/content/pm/PackageManager;->getPackageArchiveInfo'));
  assert.ok(s.includes('Landroid/content/pm/PackageInstaller;->createSession'));
  // Le paquet archive doit correspondre au paquet installe.
  assert.ok(s.includes('Landroid/content/pm/PackageInfo;->versionCode:I'));
});

test('[self-update] polarites cles verrouillees (anti-recidive)', () => {
  const s = read('smali/com/melodix/music/SelfUpdater.smali');
  // canRequestPackageInstalls vrai -> installer.
  assert.match(s, /canRequestPackageInstalls\(\)Z\n\n    move-result v1\n\n    if-nez v1, :do_install/);
  // verifySum vrai -> continuer l'archive.
  assert.match(s, /verifySum\(Ljava\/lang\/String;Ljava\/io\/File;\)Z\n\n    move-result v5\n\n    if-nez v5, :archive/);
  // versionCode archive strictement superieur seulement.
  assert.match(s, /if-le v3, v0, :bad_apk/);
  const prompt = read('smali/com/melodix/music/SelfUpdater$Prompt.smali');
  // isFinishing vrai -> abandonner.
  assert.match(prompt, /isFinishing\(\)Z\n\n    move-result v1\n\n    if-nez v1, :done/);
});

test('[self-update] dialogue + bouton presents', () => {
  const prompt = read('smali/com/melodix/music/SelfUpdater$Prompt.smali');
  assert.ok(prompt.includes('Landroid/app/AlertDialog$Builder;'));
  assert.ok(prompt.includes('Mettre a jour'));
  assert.ok(prompt.includes('Lcom/melodix/music/SelfUpdater$OnInstall;'));
  const on = read('smali/com/melodix/music/SelfUpdater$OnInstall.smali');
  assert.ok(on.includes('Lcom/melodix/music/SelfUpdater;->install'));
});

test('[self-update] AppSingleton : branche SelfUpdater.check + noteDiag natif', () => {
  const s = read('smali/com/melodix/music/AppSingleton.smali');
  assert.ok(s.includes('Lcom/melodix/music/SelfUpdater;->check(Landroid/content/Context;)V'));
  assert.ok(s.includes('.method public static noteDiag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V'));
  assert.ok(s.includes('.field public static diagNative:Ljava/lang/String;'));
});

test('[diag natif] MainActivity : data/render/route instrumentes', () => {
  const s = read('smali/com/melodix/music/MainActivity.smali');
  const n = (s.match(/Lcom\/melodix\/music\/AppSingleton;->noteDiag/g) || []).length;
  assert.ok(n >= 3, `au moins 3 appels noteDiag, trouve ${n}`);
  assert.ok(s.includes('const-string v8, "render"'));
  assert.ok(s.includes('const-string v8, "data"'));
  assert.ok(s.includes('const-string v0, "route"'));
});

test('[diag natif] visualiseur : etat NATIF prefixe au JSON', () => {
  const s = read('smali/com/melodix/music/RuntimeDiagnostic.smali');
  const at = s.indexOf('method public static showDialog');
  const body = s.slice(at, s.indexOf('.end method', at));
  assert.ok(body.includes('Lcom/melodix/music/AppSingleton;->diagNative:Ljava/lang/String;'));
  assert.ok(body.includes('"NATIF "'));
  assert.ok(body.indexOf('diagNative') < body.indexOf('setText'));
});

test('[self-update] assembleur dex : aucune invocation sans /range au-dessus de 5 registres', () => {
  // La forme invoke-xxx {..} (format 35c) ne code que 5 registres ; au dela il
  // faut invoke-xxx/range. Erreur d'assemblage = build casse, anti-recidive.
  const walk = (dir, out) => {
    for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
      const p = path.join(dir, e.name);
      if (e.isDirectory()) walk(p, out);
      else if (e.name.endsWith('.smali')) out.push(p);
    }
    return out;
  };
  const files = walk(path.join(root, 'smali'), []);
  const bad = [];
  for (const f of files) {
    const lines = fs.readFileSync(f, 'utf8').split('\n');
    lines.forEach((line, i) => {
      const m = line.match(/^\s*invoke-[\w/]+?\s+\{([^}]*)\}/);
      if (m && !line.includes('/range')) {
        const regs = m[1].split(',').map((s) => s.trim()).filter(Boolean);
        if (regs.length > 5) bad.push(`${path.basename(f)}:${i + 1}`);
      }
    });
  }
  assert.deepEqual(bad, [], `invocations > 5 registres sans /range: ${bad.join(', ')}`);
});

test('[self-update] installation silencieuse : Android 12+ sans aucune confirmation', () => {
  const s = read('smali/com/melodix/music/SelfUpdater.smali');
  // setRequireUserAction(USER_ACTION_NOT_REQUIRED = 2) pose et gate sur SDK 31.
  assert.match(s, /SessionParams;->setRequireUserAction\(I\)V/);
  assert.match(s, /const\/16 v4, 0x1f\n\n    if-lt v3, v4, :ura_done\n\n    const\/4 v3, 0x2\n\n    invoke-virtual \{v1, v3\}, Landroid\/content\/pm\/PackageInstaller\$SessionParams;->setRequireUserAction\(I\)V/);
});

test('[self-update] filets de securite du dispatch automatique', () => {
  const s = read('smali/com/melodix/music/SelfUpdater.smali');
  // Autorisation manquante -> dialogue (jamais d'installation silencieuse).
  assert.match(s, /canRequestPackageInstalls\(\)Z\n\n    move-result v4\n\n    if-nez v4, :auto_ready/);
  // stoppedFlag vrai -> installation immediate.
  assert.match(s, /sget-boolean v3, Lcom\/melodix\/music\/SelfUpdater;->stoppedFlag:Z\n\n    if-eqz v3, :wait_background/);
  // La boucle d'attente s'arrete si un commit a deja demarre.
  assert.match(s, /isCommitStarted\(\)Z\n\n    move-result v4\n\n    if-nez v4, :wait_done/);
  // installPending : double commit impossible (synchronise + drapeau).
  assert.match(s, /declared-synchronized installPending/);
  assert.match(s, /commitStarted:Z\n\n    if-nez v1, :done/);
});

test('[self-update] onStop installe la mise a jour en arriere-plan', () => {
  const s = read('smali/com/melodix/music/MainActivity.smali');
  const at = s.indexOf('.method public final onStop()V');
  const body = s.slice(at, s.indexOf('.end method', at));
  assert.ok(body.includes('Lcom/melodix/music/SelfUpdater;->noteStopped()V'));
  assert.ok(body.includes('Lcom/melodix/music/SelfUpdater;->installPending(Landroid/content/Context;)V'));
  const inst = read('smali/com/melodix/music/SelfUpdater$Installer.smali');
  assert.ok(inst.includes('Lcom/melodix/music/SelfUpdater;->install'));
});
