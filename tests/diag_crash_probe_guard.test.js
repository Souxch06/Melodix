// ---------------------------------------------------------------------------
// Correctif régression E2E « Message du diagnostic » (introduite par 43e1188) :
// NativeCrashGuard.lastCrashLine() contenait deux gardes INVERSÉES :
//   (1) if-nez v0, :none → sautait au return null quand le rapport existait,
//       et appelait indexOf(null) sinon → NPE qui tuait readReport() →
//       buildDiagReport() → les lignes « Message du diagnostic » n'étaient
//       jamais peintes (assertion E2E test-preview-emulator.yml:540).
//   (2) if-gez v2, :clip → substring(0, -1) sans '\n' (exception), ou
//       fuite de la stack multi-lignes avec '\n' (contrat « jamais la stack »).
// NATURE : [structurel] uniquement — direction et ordre des instructions Smali.
// Ces contrats NE PROUVENT PAS l'exécution Android (ni Dalvik, ni émulateur).
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const lastCrashLineBody = () => {
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const method = guard.split('.method public static lastCrashLine()Ljava/lang/String;')[1];
    assert.ok(method, 'NativeCrashGuard.lastCrashLine() exists');
    return method.split('.end method')[0];
};

test('[structurel] garde null AVANT indexOf : if-eqz v0, :none (jamais if-nez) — sans quoi NPE sur rapport absent', () => {
    const body = lastCrashLineBody();
    // The guard must skip the whole extraction when lastReport() is null…
    const guardIdx = body.indexOf('if-eqz v0, :none');
    assert.ok(guardIdx >= 0, 'null guard if-eqz v0, :none is present');
    // …and it must come BEFORE the first use of the value (indexOf).
    const useIdx = body.indexOf('indexOf(I)I');
    assert.ok(useIdx >= 0, 'indexOf is present');
    assert.ok(guardIdx < useIdx, 'null guard runs before indexOf');
    // The inverted form must be gone (it threw NPE on the fresh-install path).
    assert.ok(!body.includes('if-nez v0, :none'), 'inverted guard if-nez v0, :none is gone');
});

test('[structurel] coupe à la 1ʳᵉ ligne : if-ltz v2, :clip AVANT substring(0, v2) (jamais substring(0,-1))', () => {
    const body = lastCrashLineBody();
    // indexOf('\\n') result is -1 when no newline exists: skip substring then.
    const guardIdx = body.indexOf('if-ltz v2, :clip');
    assert.ok(guardIdx >= 0, 'newline guard if-ltz v2, :clip is present');
    const cutIdx = body.indexOf('substring(II)Ljava/lang/String;');
    assert.ok(cutIdx >= 0, 'first-line substring is present');
    assert.ok(guardIdx < cutIdx, 'newline guard runs before the substring cut');
    // The inverted form threw StringIndexOutOfBoundsException on single lines.
    assert.ok(!body.includes('if-gez v2, :clip'), 'inverted guard if-gez v2, :clip is gone');
});

// ---------------------------------------------------------------------------
// lastReport() (source de lastCrashLine()/showLastReport()/install()) portait
// la même garde INVERSÉE sur le contexte :
//   if-nez v1, :done → sautait au return null quand le contexte EXISTAIT
//       (lecture de « last_crash » jamais atteinte), et tombait dans le try
//       avec v1=null sinon → NPE → :catch_0 → null. Toujours null.
//   Correctif attendu : if-eqz v1, :done (contexte nul -> null ; sinon lire).
// NATURE : [structurel] uniquement — ne prouve pas l'exécution Android.
// ---------------------------------------------------------------------------
test('[structurel] lastReport() : garde contexte AVANT getSharedPreferences — if-eqz v1, :done (jamais if-nez)', () => {
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const method = guard.split('.method private static lastReport()Ljava/lang/String;')[1];
    assert.ok(method, 'NativeCrashGuard.lastReport() exists');
    const body = method.split('.end method')[0];
    // The null-context guard must point towards :done when the context IS null…
    const guardIdx = body.indexOf('if-eqz v1, :done');
    assert.ok(guardIdx >= 0, 'null-context guard if-eqz v1, :done is present');
    // …and it must run BEFORE the first use of the context (the prefs read).
    const useIdx = body.indexOf('getSharedPreferences');
    assert.ok(useIdx >= 0, 'getSharedPreferences is present');
    assert.ok(guardIdx < useIdx, 'null-context guard runs before the prefs read');
    // The inverted form skipped the read exactly when the context existed,
    // making lastReport() return null on every path.
    assert.ok(!body.includes('if-nez v1, :done'), 'inverted guard if-nez v1, :done is gone');
});

// ---------------------------------------------------------------------------
// install() contenait DEUX gardes inversées (constat mission + arbitrage
// « corriger les 2 lignes ») :
//   if-nez p0, :done  -> sautait au return quand le contexte était NON nul
//       (les 2 appelants passent `this`) -> corps jamais exécuté ;
//   if-eqz v0, :done  -> sautait au return quand installed=false (1ᵉʳ appel)
//       -> corps jamais exécuté.
// Attendu : if-eqz p0, :done (abort si contexte NUL) + if-nez v0, :done
// (skip si DÉJÀ installé). La convention du fichier est prouvée par
// if-nez v0, :store (L151) qui saute le fallback quand getApplicationContext
// est non-nul.
// NATURE : [structurel] uniquement — ne prouve pas l'exécution Android.
// ---------------------------------------------------------------------------
test('[structurel] install() : if-eqz p0, :done (contexte nul) + if-nez v0, :done après sget-boolean installed (jamais l\'inverse)', () => {
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const method = guard.split('.method public static install(Landroid/content/Context;)V')[1];
    assert.ok(method, 'NativeCrashGuard.install(Context) exists');
    const body = method.split('.end method')[0];
    // (1) Context guard: abort only when the context IS null.
    assert.ok(body.includes('if-eqz p0, :done'), 'null-context guard if-eqz p0, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted context guard if-nez p0, :done is gone');
    // (2) Already-installed guard: skip the body only when installed is TRUE,
    // and it must follow the installed read (no other re-test before init).
    const sgetIdx = body.indexOf('sget-boolean v0, Lcom/melodix/music/NativeCrashGuard;->installed:Z');
    assert.ok(sgetIdx >= 0, 'installed read is present');
    const instIdx = body.indexOf('if-nez v0, :done', sgetIdx);
    assert.ok(instIdx >= 0, 'installed guard if-nez v0, :done is present');
    assert.ok(instIdx > sgetIdx && instIdx - sgetIdx < 80, 'installed guard follows the sget-boolean read');
    assert.ok(!body.includes('if-eqz v0, :done'), 'inverted installed guard if-eqz v0, :done is gone');
});
