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

// ---------------------------------------------------------------------------
// Audit complet : NativeCrashGuard contenait 20 gardes INVERSÉES sur les
// chemins d'enregistrement et d'affichage du crash (record, write, stage,
// excerpt, toast de install(), showLastReport, shorten, lastStage, clip 160
// de lastCrashLine, clearReport, showLaunchMarker). Sans elles : le crash ne
// s'enregistre JAMAIS (record/write), ne s'affiche jamais (toast/dialogue),
// ou jette (substring sur chaîne courte). La convention du fichier est prouvée
// par les gardes correctes : dispatch if-eqz v0 :kill, install if-nez v0 :store,
// accountsHostHides if-eqz p0/v1 :done.
// NATURE : [structurel] uniquement — ne prouve pas l'exécution Android.
// ---------------------------------------------------------------------------
const methodBody = (sig, file = 'smali/com/melodix/music/NativeCrashGuard.smali') => {
    const guard = read(file);
    const method = guard.split(sig)[1];
    assert.ok(method, `method exists: ${sig}`);
    return method.split('.end method')[0];
};

test('[structurel] record() : if-eqz p0, :done AVANT tout (jamais if-nez) — sinon le crash réel n\'est jamais écrit', () => {
    const body = methodBody('.method public static record(Ljava/lang/Throwable;)V');
    assert.ok(body.includes('if-eqz p0, :done'), 'null guard if-eqz p0, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted guard if-nez p0, :done is gone');
});

test('[structurel] write() : if-eqz p0, :done + if-eqz v0, :done (jamais if-nez) — sinon last_crash jamais persisté', () => {
    const body = methodBody('.method public static write(Ljava/lang/String;)V');
    assert.ok(body.includes('if-eqz p0, :done'), 'null-text guard if-eqz p0, :done is present');
    assert.ok(body.includes('if-eqz v0, :done'), 'null-context guard if-eqz v0, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted text guard is gone');
    assert.ok(!body.includes('if-nez v0, :done'), 'inverted context guard is gone');
});

test('[structurel] stage() : if-eqz p0, :done + if-eqz v0, :done (jamais if-nez) — sinon last_stage jamais persisté', () => {
    const body = methodBody('.method public static stage(Ljava/lang/String;)V');
    assert.ok(body.includes('if-eqz p0, :done'), 'null-stage guard if-eqz p0, :done is present');
    assert.ok(body.includes('if-eqz v0, :done'), 'null-context guard if-eqz v0, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted stage guard is gone');
    assert.ok(!body.includes('if-nez v0, :done'), 'inverted context guard is gone');
});

test('[structurel] clearReport() : if-eqz v0, :done (jamais if-nez) — sinon le rapport n\'est jamais purgé', () => {
    const body = methodBody('.method private static clearReport()V');
    assert.ok(body.includes('if-eqz v0, :done'), 'null-context guard if-eqz v0, :done is present');
    assert.ok(!body.includes('if-nez v0, :done'), 'inverted guard is gone');
});

test('[structurel] excerpt() : if-eqz p0, :done + if-le v1, v2, :done AVANT substring (jamais substring(0,1200) sur chaîne courte)', () => {
    const body = methodBody('.method public static excerpt(Ljava/lang/Throwable;)Ljava/lang/String;');
    assert.ok(body.includes('if-eqz p0, :done'), 'null guard if-eqz p0, :done is present');
    assert.ok(body.includes('if-le v1, v2, :done'), 'cap guard if-le v1, v2, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted null guard is gone');
    assert.ok(!body.includes('if-gt v1, v2, :done'), 'inverted cap guard is gone');
});

test('[structurel] lastStage() : if-eqz v1, :done (jamais if-nez) — sinon toujours null', () => {
    const body = methodBody('.method private static lastStage()Ljava/lang/String;');
    assert.ok(body.includes('if-eqz v1, :done'), 'null-context guard if-eqz v1, :done is present');
    assert.ok(!body.includes('if-nez v1, :done'), 'inverted guard is gone');
});

test('[structurel] lastCrashLine() clip 160 : if-le v1, v2, :ok AVANT substring(0, v2) (jamais if-gt)', () => {
    const body = lastCrashLineBody();
    assert.ok(body.includes('if-le v1, v2, :ok'), 'cap guard if-le v1, v2, :ok is present');
    assert.ok(!body.includes('if-gt v1, v2, :ok'), 'inverted cap guard is gone');
});

test('[structurel] toast install() : if-eqz v1, :toast_stage (rapport -> "a plante") + if-nez v1, :toast_alive ("ready" -> actif)', () => {
    const body = methodBody('.method public static install(Landroid/content/Context;)V');
    assert.ok(body.includes('if-eqz v1, :toast_stage'), 'report guard if-eqz v1, :toast_stage is present');
    assert.ok(!body.includes('if-nez v1, :toast_stage'), 'inverted report guard is gone');
    assert.ok(body.includes('if-nez v1, :toast_alive'), 'ready guard if-nez v1, :toast_alive is present');
    assert.ok(!body.includes('if-eqz v1, :toast_alive'), 'inverted ready guard is gone');
});

test('[structurel] showLastReport() : 5 gardes droites — if-eqz p0/v1/v2, if-le v2,v3, if-eqz v2,:no_stage', () => {
    const body = methodBody('.method public static showLastReport(Landroid/app/Activity;)Z');
    assert.ok(body.includes('if-eqz p0, :done'), 'activity guard is present');
    assert.ok(body.includes('if-eqz v1, :done'), 'report guard is present');
    assert.ok(body.includes('if-eqz v2, :done'), 'empty guard is present');
    assert.ok(body.includes('if-le v2, v3, :short_enough'), 'cap guard is present');
    assert.ok(body.includes('if-eqz v2, :no_stage'), 'stage guard is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted activity guard is gone');
    assert.ok(!body.includes('if-nez v1, :done'), 'inverted report guard is gone');
    assert.ok(!body.includes('if-nez v2, :done'), 'inverted empty guard is gone');
    assert.ok(!body.includes('if-gt v2, v3, :short_enough'), 'inverted cap guard is gone');
    assert.ok(!body.includes('if-nez v2, :no_stage'), 'inverted stage guard is gone');
});

test('[structurel] shorten() : if-eqz p0, :done + if-le v0, v1, :done AVANT substring(0, v1) (jamais if-gt)', () => {
    const body = methodBody('.method private static shorten(Ljava/lang/String;)Ljava/lang/String;');
    assert.ok(body.includes('if-eqz p0, :done'), 'null guard if-eqz p0, :done is present');
    assert.ok(body.includes('if-le v0, v1, :done'), 'cap guard if-le v0, v1, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted null guard is gone');
    assert.ok(!body.includes('if-gt v0, v1, :done'), 'inverted cap guard is gone');
});

test('[structurel] showLaunchMarker() : if-eqz p0, :done (jamais if-nez) — sinon le marqueur ne s\'affiche jamais', () => {
    const body = methodBody('.method public static showLaunchMarker(Landroid/app/Activity;)V');
    assert.ok(body.includes('if-eqz p0, :done'), 'activity guard if-eqz p0, :done is present');
    assert.ok(!body.includes('if-nez p0, :done'), 'inverted guard is gone');
});

test('[structurel] onCreate continue apres showLastReport : pas de return-void entre le dialogue et la suite (MainActivity)', () => {
    // Quand record()/write() ont persiste last_crash, showLastReport() affiche le
    // dialogue ; onCreate ne doit PAS s\'arreter la (l\'app restait a moitie
    // initialisee -> processus mort/respawn vu en CI sur cold_launch_2).
    // Avant la correction : `if-eqz v1, :native_no_crash_report` + `return-void`
    // entre showLastReport et showLaunchMarker.
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const from = main.indexOf('showLastReport');
    assert.ok(from > 0, 'onCreate appelle showLastReport');
    const to = main.indexOf('showLaunchMarker', from);
    assert.ok(to > from, 'showLaunchMarker suit showLastReport');
    const slice = main.slice(from, to);
    assert.ok(!slice.includes('return-void'),
        'onCreate ne doit plus retourner entre le dialogue et la suite du demarrage');
});

test('[structurel] DiagJsProbeCallback.onReceiveValue() : clip 0x50 seulement si longueur > 80 (if-le pour sauter le clip) — sinon substring(0,80) explose sur la valeur courte de la sonde', () => {
    // Crash prouvé par la CI (dialogue « Dernier plantage ») :
    // StringIndexOutOfBoundsException: begin 0, end 80, length 1
    //   at java.lang.String.substring → DiagJsProbeCallback.onReceiveValue.
    // La garde `if-gt v2, v3, :cb_append` (v2=longueur, v3=80) sautait AU-DESSUS du
    // clip quand la valeur depassait 80 et clipait les valeurs COURTES (<= 80).
    const body = methodBody('.method public final onReceiveValue(Ljava/lang/Object;)V', 'smali/com/melodix/music/DiagJsProbeCallback.smali');
    assert.ok(body.includes('if-le v2, v3, :cb_append'),
        'if-le v2, v3, :cb_append is present (court -> append direct, long -> clip)');
    assert.ok(!body.includes('if-gt v2, v3, :cb_append'), 'inverted guard is gone');
});

test('[structurel] DiagCounters libState store : if-le v2, v3, :ls_store (jamais if-gt) — sinon substring(negatif) sur texte < 1600', () => {
    // Garde bornee 0x7d0 : <= 2000 -> stocker entier (:ls_store), > 2000 -> queue 0x640.
    const body = methodBody('.method public static libState(Ljava/lang/String;)V', 'smali/com/melodix/music/DiagCounters.smali');
    assert.ok(body.includes('if-le v2, v3, :ls_store'),
        'if-le v2, v3, :ls_store is present (cap -> queue seulement au-dela)');
    assert.ok(!body.includes('if-gt v2, v3, :ls_store'), 'inverted guard is gone');
});

test('[structurel] DiagCounters.readLibStateLast() : if-ltz v1, :rll_whole (jamais if-gez) — sinon le dernier etat n\'est jamais lu', () => {
    // lastIndexOf(\'\\n\') >= 0 -> prendre ce qui suit ; absent (< 0) -> entier.
    const body = methodBody('.method public static readLibStateLast()Ljava/lang/String;', 'smali/com/melodix/music/DiagCounters.smali');
    assert.ok(body.includes('if-ltz v1, :rll_whole'), 'if-ltz v1, :rll_whole is present');
    assert.ok(!body.includes('if-gez v1, :rll_whole'), 'inverted guard is gone');
});

test('[structurel] DiagCounters.readLibStateBridge() : if-ltz v2, :rlb_none (jamais if-gez) — sinon null meme quand la ligne existe', () => {
    // lastIndexOf("{\\"stage\\"") < 0 -> null ; trouve (>= 0) -> extraire la ligne.
    const body = methodBody('.method public static readLibStateBridge()Ljava/lang/String;', 'smali/com/melodix/music/DiagCounters.smali');
    assert.ok(body.includes('if-ltz v2, :rlb_none'), 'if-ltz v2, :rlb_none is present');
    assert.ok(!body.includes('if-gez v2, :rlb_none'), 'inverted guard is gone');
});
