// P0 bridge-startup — zone 7 (moteur de tests + delai).
//
// Les requetes du moteur ne doivent JAMAIS rester bloquées indefiniment :
// pollUntil() doit se resoudre {timedOut:true} au bout de son delai, et
// sendScreen() doit rendre compte d'un canal absent au lieu de pretendre avoir
// parle. Execution reelle des fonctions du moteur embarque.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

function fnBody(src, name) {
    const start = src.indexOf('function ' + name + '(');
    assert.ok(start >= 0, 'function ' + name + ' exists');
    let depth = 0, j = src.indexOf('{', start);
    for (let i = j; i < src.length; i += 1) {
        if (src[i] === '{') depth += 1;
        else if (src[i] === '}') { depth -= 1; if (!depth) { j = i + 1; break; } }
    }
    return src.slice(start, j);
}

test('execution reelle : pollUntil se resout au delai (jamais bloque)', async () => {
    const engine = read('assets/diag_engine.js');
    const window = {};
    const pollUntil = new Function('window',
        'var nowMs = function () { return Date.now(); };\n'
        + fnBody(engine, 'pollUntil') + '\n'
        + 'return pollUntil;')(window);
    const t0 = Date.now();
    const out = await pollUntil(() => null, 120, 30);
    const elapsed = Date.now() - t0;
    assert.strictEqual(out.timedOut, true, 'delai expire constate');
    assert.strictEqual(out.value, null);
    assert.ok(elapsed >= 110 && elapsed < 1500, 'resolu pres du delai (120 ms), pas bloque');
});

test('execution reelle : pollUntil resout la valeur des que le check passe', async () => {
    const engine = read('assets/diag_engine.js');
    const pollUntil = new Function('window',
        'var nowMs = function () { return Date.now(); };\n'
        + fnBody(engine, 'pollUntil') + '\n'
        + 'return pollUntil;')({});
    let n = 0;
    const out = await pollUntil(() => (++n >= 2 ? 'ready' : null), 5000, 10);
    assert.strictEqual(out.timedOut, false);
    assert.strictEqual(out.value, 'ready');
});

test('execution reelle : pollUntil capture une exception du check sans boucler', async () => {
    const engine = read('assets/diag_engine.js');
    const pollUntil = new Function('window',
        'var nowMs = function () { return Date.now(); };\n'
        + fnBody(engine, 'pollUntil') + '\n'
        + 'return pollUntil;')({});
    const out = await pollUntil(() => { throw new Error('boom'); }, 5000, 10);
    assert.strictEqual(out.timedOut, true, 'termine sur erreur');
    assert.strictEqual(out.error, 'boom');
});

test('execution reelle : sendScreen rend false sans canal (pas de faux succes)', () => {
    const engine = read('assets/diag_engine.js');
    const window = {};
    const state = {};
    const sendScreen = new Function('window', 'state',
        'function sanitizeDetail(v) { return String(v == null ? "" : v); }\n'
        + fnBody(engine, 'sendScreen') + '\n'
        + 'return sendScreen;')(window, state);
    assert.strictEqual(sendScreen([{ k: 'v' }]), false, 'canal absent -> false');
    const calls = [];
    window.AndBridge = {
        onNativeUiData: (topic, json) => { calls.push([topic, json]); },
        logDiagEvent: () => {}
    };
    assert.strictEqual(sendScreen([{ k: 'v' }]), true, 'canal present -> true + emission');
    assert.strictEqual(calls[0][0], 'diag:report');
    // And when the call itself throws, sendScreen reports false and records
    // the error instead of pretending the report went through.
    window.AndBridge = {
        onNativeUiData: () => { throw new Error('java.lang.IllegalStateException'); }
    };
    assert.strictEqual(sendScreen([{ k: 'v' }]), false, 'exception -> false');
    assert.ok(state.lastError.includes('IllegalStateException'), 'erreur tracee');
});

test('[structurel] les attentes du moteur sont bornees par un delai explicite', () => {
    const engine = read('assets/diag_engine.js');
    const poll = fnBody(engine, 'pollUntil');
    assert.ok(poll.includes('nowMs() - start >= timeoutMs'), 'garde de delai dans la boucle');
    assert.ok(poll.includes('timedOut: true'), 'issue "delai depasse" rendue au resolve');
    assert.ok(engine.includes('waitForMediaLibState([\'ready\', \'empty\', \'error\'], timeoutMs || 15000)'),
        'attente des etats terminaux bornee a 15 s');
    assert.ok(engine.includes('runFetchProbe(\'playlists\', 18000)'), 'sonde playlists bornee a 18 s');
});
