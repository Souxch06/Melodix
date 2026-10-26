// P0 bridge-startup — zones 4 (callbacks) et 5 (callback sans reponse).
//
// Correction : DiagJsProbe.min() n'envoie plus "1" nu, mais un snippet qui
// journalise "js-cb exec <tag>" avant de retourner 1. Semantique des reponses :
//   js-cb ok + ans 1       -> execute ET resultat livre
//   js-cb exec + tmo ans 0 -> execute mais resultat jamais livre
//   ni l'un ni l'autre     -> jamais execute (ou canal deja mort)
// "ans 0" = ABSENCE DE REPONSE (le ValueCallback n'a jamais ete invoque) ;
// une reponse vide / erreur JS serait "ans 1" avec le resultat "null".
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

function rebuildMinSnippet(smali, tag) {
    // Mirrors min()'s StringBuilder: prefix + JSONObject.quote("js-cb exec "+tag)
    // + ")}catch(e){}return " + "1" (probe value, contract) + "})()".
    const q = (s) => JSON.stringify(String(s)); // JSONObject.quote equivalence for these inputs
    const prefix = smali.match(/const-string v2, "(\(function\(\)\{try\{window\.AndBridge&&window\.AndBridge\.logDiagEvent\()"/);
    const tagPart = smali.match(/const-string v3, "(js-cb exec )"/);
    const mid = smali.match(/const-string v2, "(\)\}catch\(e\)\{\}return )"/);
    const value = smali.match(/const-string v0, "1"/);
    const suffix = smali.match(/const-string v2, "(\}\)\(\))"/);
    assert.ok(prefix && tagPart && mid && value && suffix, 'les fragments du snippet sont dans min()');
    return prefix[1] + q(tagPart[1] + (tag || '')) + mid[1] + '1' + suffix[1];
}

test('[structurel] min() construit "js-cb exec <tag>" via JSONObject.quote et retourne 1', () => {
    const probe = read('smali/com/melodix/music/DiagJsProbe.smali');
    const body = probe.split('.method public static min(')[1].split('.end method')[0];
    assert.ok(body.includes('js-cb exec '), 'marqueur d\'execution');
    assert.ok(body.includes('Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;'),
        'tag protege contre l\'injection JS');
    assert.ok(body.includes('const-string v0, "1"'), 'la valeur du probe reste exactement 1');
    assert.ok(body.includes('DiagJsProbe;->send('), 'le callback/timeout existants restent branches');
});

test('execution reelle : le snippet journalise "js-cb exec <tag>" puis retourne 1', () => {
    const probe = read('smali/com/melodix/music/DiagJsProbe.smali');
    const js = rebuildMinSnippet(probe, 'post-page');
    const calls = [];
    const window = { AndBridge: { logDiagEvent: (m) => calls.push(String(m)) } };
    const result = new Function('window', 'return ' + js)(window);
    assert.strictEqual(result, 1, 'valeur inchangee pour le callback');
    assert.deepStrictEqual(calls, ['js-cb exec post-page'], 'preuve d\'execution sur le canal natif');
});

test('execution reelle : un tag hostile reste une chaine (aucune injection)', () => {
    const probe = read('smali/com/melodix/music/DiagJsProbe.smali');
    const evil = "x');window.PWNED=1;//";
    const js = rebuildMinSnippet(probe, evil);
    const calls = [];
    const window = { AndBridge: { logDiagEvent: (m) => calls.push(String(m)) }, PWNED: 0 };
    const result = new Function('window', 'return ' + js)(window);
    assert.strictEqual(result, 1);
    assert.strictEqual(window.PWNED, 0, 'aucune injection');
    assert.deepStrictEqual(calls, ['js-cb exec ' + evil], 'le tag reste litteral');
});

test('execution reelle : sans AndBridge, le snippet s\'execute quand meme et retourne 1 (pas de throw)', () => {
    const probe = read('smali/com/melodix/music/DiagJsProbe.smali');
    const js = rebuildMinSnippet(probe, 'post-nav');
    const window = {};
    assert.strictEqual(new Function('window', 'return ' + js)(window), 1, 'robuste au canal muet');
});

test('[structurel] semantique "ans" : 0 = absence de reponse, "null" = execute sans valeur', () => {
    const timeout = read('smali/com/melodix/music/DiagJsProbeTimeout.smali');
    const body = timeout.split('.method public final run()V')[1].split('.end method')[0];
    assert.ok(body.includes('probeAnswered:Z'), 'statut du callback lu au timeout');
    assert.ok(body.includes('" ans "'), 'journal "js-cb tmo <id> <tag> ans <0|1>"');
    assert.ok(timeout.includes('DiagCounters;->probeAnswered:Z'), 'le timeout lit le drapeau du callback');
    // ans 1 is only possible when onReceiveValue ran answerProbe(): the flag
    // can never be true without the callback having fired.
    const cb = read('smali/com/melodix/music/DiagJsProbeCallback.smali');
    const cbBody = cb.split('.method public final onReceiveValue(Ljava/lang/Object;)V')[1].split('.end method')[0];
    assert.ok(cbBody.includes('DiagCounters;->answerProbe()V'), 'le callback pose le drapeau');
    assert.ok(cb.includes('-> JS ran and returned nothing'), 'documente : "null" = execute sans valeur');
});

test('[securite] probeJsChannel ne remonte jamais d\'URL (jetons/cookies exclus)', () => {
    const main = read('smali/com/melodix/music/MainActivity.smali');
    const at = main.indexOf('.method public final probeJsChannel()V');
    assert.ok(at >= 0, 'probeJsChannel existe');
    const body = main.slice(at, main.indexOf('.end method', at));
    assert.ok(!body.includes('document.URL'), 'aucune URL dans la sonde');
    assert.ok(!body.includes('getCookie') && !body.includes('Authorization'), 'aucun secret');
});
