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
