// ---------------------------------------------------------------------------
// Sondes nocturnes (observabilité uniquement) :
//   (1b) dernier crash NativeCrashGuard affiché à l'écran Diagnostic
//        (1ère ligne = classe+message, 160 car., jamais la stack) ;
//   (1c) longueur du shell injecté journalisée par c91 + marqueurs
//        js-shell begin/end écrits par le shell via AndBridge.logDiagEvent ;
//   (1d) le callback du probe JS ne fait ni cast ni toString non gardé
//        (décision : aucun correctif, voir rapport).
// NATURE : [structurel] uniquement — présence de texte dans les fichiers.
// Ces contrats NE PROUVENT PAS l'exécution (ni WebView, ni Dalvik).
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('[structurel] sonde 1b : le Diagnostic affiche la 1ère ligne du dernier crash (160 car.), jamais la stack', () => {
    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    // Accessor + first-line-only extraction + 160-char clip (0xa0).
    const accessor = guard.split('.method public static lastCrashLine()Ljava/lang/String;')[1];
    assert.ok(accessor, 'NativeCrashGuard.lastCrashLine() exists');
    const body = accessor.split('.end method')[0];
    assert.ok(body.includes('lastReport()Ljava/lang/String;'), 'reads the stored report');
    assert.ok(body.includes('indexOf(I)I'), 'cuts at the first newline');
    assert.ok(body.includes('0xa0'), 'truncates to 160 chars');
    // Screen section, fallback "non reçu", wired into readReport().
    const section = counters.split('.method public static buildCrashSection()Ljava/lang/String;')[1].split('.end method')[0];
    assert.ok(section.includes('non reçu'), 'absent crash shows "non reçu"');
    assert.ok(!section.includes('getStackTraceString'), 'never renders the full stack');
    const report = counters.split('.method public static declared-synchronized readReport()Ljava/lang/String;')[1];
    assert.ok(report.includes('buildCrashSection()Ljava/lang/String;'), 'readReport shows the crash section');
});

test('[structurel] sonde 1c : c91 journalise la longueur du shell injecté, le shell écrit begin/end via logDiagEvent', () => {
    const c91 = read('smali/c91.smali');
    const shell = read('assets/native_ui_shell.js');
    const counters = read('smali/com/melodix/music/DiagCounters.smali');
    // c91 logs the injected length BEFORE handing it to evaluateJavascript.
    const inject = c91.indexOf('const-string v5, "native_ui_shell.js"');
    const log = c91.indexOf('DiagCounters;->logShellInject', inject);
    const evalJs = c91.indexOf('evaluateJavascript', log);
    assert.ok(inject >= 0 && log > inject && evalJs > log, 'logShellInject runs before evaluateJavascript');
    assert.ok(counters.includes('js-shell inject len='), 'probe message format present');
    // The shell itself journals begin and end on the existing channel.
    assert.ok(shell.includes("window.AndBridge.logDiagEvent('js-shell begin')"), 'begin marker present');
    assert.ok(shell.includes("window.AndBridge.logDiagEvent('js-shell end')"), 'end marker present');
    assert.ok(shell.includes("'js-shell begin'") && shell.includes("'js-shell end'"), 'markers use the existing logDiagEvent channel');
});

test('[structurel] sonde 1d : DiagJsProbeCallback reste sans cast et avec toString null-guarded (aucun correctif)', () => {
    // Decision recorded in the report: no cast/null-toString defect was found,
    // so the callback is untouched. This contract pins that safety property.
    const cb = read('smali/com/melodix/music/DiagJsProbeCallback.smali');
    const body = cb.split('.method public final onReceiveValue(Ljava/lang/Object;)V')[1].split('.end method')[0];
    assert.ok(body, 'onReceiveValue exists');
    assert.ok(!body.includes('check-cast'), 'never casts the WebView result');
    assert.ok(body.includes('if-eqz v1, :cb_val_done'), 'toString() result is null-guarded');
    assert.ok(body.includes('if-eqz p1, :cb_null'), 'null result is guarded before use');
});
