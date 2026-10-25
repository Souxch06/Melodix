// ---------------------------------------------------------------------------
// P0 — AndBridge.pollCommands : la boucle de drain ne vidait jamais la file.
//
// Défaut démontré sur les instructions réelles (registres + flot) :
//
//     const/4 v4, 0x0                 # v4 = compteur traité = 0
//     :drain
//     invoke-virtual {v2}, size()I
//     move-result v5
//     if-eqz v5, :cmds_done           # file vide -> sortie (correct)
//     const/4 v5, 0x4                 # v5 = 4 (max par appel)
//     if-lt v4, v5, :cmds_done        # v4 < 4 -> SORTIE IMMÉDIATE (défaut)
//     ...remove(0)...                 # jamais atteint
//     add-int/lit8 v4, v4, 0x1        # v4 n'atteint 4 que via les retraits
//
// `if-lt vA,vB` saute quand vA < vB : avec v4=0 < v5=4 le saut est toujours
// pris, `cmds` est toujours "[]" et la file gonfle jusqu'à la capacité (32)
// où les commandes sont perdues. Correctif : `if-ge` (sortie quand le
// compteur atteint la borne ; la sortie file-vide reste `if-eqz v5`).
//
// IMPORTANT — nature des tests de ce fichier :
//   • Section A = tests STRUCTURELS sur le Smali réel. Ils lisent le fichier
//     assemblé à la main et vérifient instructions et flot. Ils n'exécutent
//     PAS le bytecode Dalvik.
//   • Section B = SIMULATION de la sémantique de la boucle, d'après les
//     instructions vérifiées en section A. Un modèle fidèle, pas un
//     exécuteur : il ne prouve pas le comportement du bytecode produit.
//   Aucun émulateur ni harness d'exécution Dalvik n'existe dans ce dépôt
//   (scripts/ = vérification CFG statique uniquement).
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const bridge = read('smali/com/melodix/music/AndBridge.smali');

function pollCommandsMethod() {
    const at = bridge.indexOf('.method public final declared-synchronized pollCommands');
    assert.ok(at !== -1, 'pollCommands entry point exists');
    return bridge.slice(at, bridge.indexOf('.end method', at));
}

// ---------------------------------------------------------------------------
// Section A — tests structurels sur le Smali réel (aucune exécution).
// ---------------------------------------------------------------------------

test('[structurel smali] A1. la condition de sortie de boucle est if-ge (la borne 4 ne peut plus sortir immédiatement)', () => {
    const pm = pollCommandsMethod();
    assert.ok(pm.includes('if-ge v4, v5, :cmds_done'),
        'the loop exits when the processed counter reaches 4 (if-ge)');
    assert.ok(!pm.includes('if-lt v4, v5, :cmds_done'),
        'the inverted if-lt condition (immediate exit) is gone');
    // The comparison happens against the bound 4, after the empty-queue test.
    const boundAt = pm.indexOf('const/4 v5, 0x4');
    assert.ok(boundAt !== -1, 'max 4 commands per call');
    assert.ok(pm.indexOf('if-ge v4, v5, :cmds_done') === boundAt + '\n    if-ge v4, v5, :cmds_done'.length - 1
        || pm.slice(boundAt, boundAt + 80).includes('if-ge v4, v5, :cmds_done'),
        'the bound check immediately follows the const 4');
});

test('[structurel smali] A2. un chemin de contrôle retire une commande AVANT la sortie, borné à 4', () => {
    const pm = pollCommandsMethod();
    // Real control path: drain label -> empty test -> bound test -> remove ->
    // counter increment -> goto drain; exit only through :cmds_done.
    const drainAt = pm.indexOf('\n    :drain\n');
    assert.ok(drainAt !== -1, ':drain label exists');
    const emptyTest = pm.indexOf('if-eqz v5, :cmds_done', drainAt);
    const boundTest = pm.indexOf('if-ge v4, v5, :cmds_done', drainAt);
    const removeAt = pm.indexOf('remove(I)', drainAt);
    const incrAt = pm.indexOf('add-int/lit8 v4, v4, 0x1', drainAt);
    const loopBack = pm.indexOf('goto :drain', drainAt);
    const exitAt = pm.indexOf('\n    :cmds_done\n', drainAt);
    assert.ok(emptyTest !== -1 && boundTest !== -1 && removeAt !== -1, 'loop body instructions present');
    assert.ok(incrAt !== -1 && loopBack !== -1 && exitAt !== -1, 'loop increment/back-edge/exit present');
    assert.ok(emptyTest < boundTest && boundTest < removeAt,
        'both exits are BEFORE the removal: the removal path is reachable before any exit');
    assert.ok(removeAt < incrAt && incrAt < loopBack && loopBack < exitAt,
        'removal happens, then the counter increments, then the loop repeats; :cmds_done is after');
});

test('[structurel smali] A3. FIFO et file vide : remove(0) synchronisés sur les deux listes, sortie vide sur size()==0', () => {
    const pm = pollCommandsMethod();
    // The two queues are held in v2 (cmdFns) and v3 (cmdArgs) for the loop.
    assert.ok(/sget-object v2, Lcom\/melodix\/music\/AndBridge;->cmdFns:Ljava\/util\/ArrayList;/.test(pm),
        'cmdFns is the first queue (v2)');
    assert.ok(/sget-object v3, Lcom\/melodix\/music\/AndBridge;->cmdArgs:Ljava\/util\/ArrayList;/.test(pm),
        'cmdArgs is the second queue (v3)');
    // FIFO: both queues are drained at index 0 in the same iteration, so
    // fn/arg pairs can never get out of sync.
    const body = pm.slice(pm.indexOf('\n    :drain\n'));
    assert.ok(/const\/4 v5, 0x0\n\s+invoke-virtual \{v2, v5\}, Ljava\/util\/ArrayList;->remove\(I\)/.test(body),
        'cmdFns.remove(0)');
    assert.ok(/const\/4 v6, 0x0\n\s+invoke-virtual \{v3, v6\}, Ljava\/util\/ArrayList;->remove\(I\)/.test(body),
        'cmdArgs.remove(0) — both queues advance together (FIFO pairs)');
    // Empty queue exits before any removal.
    const sizeAt = body.indexOf('Ljava/util/ArrayList;->size()I');
    assert.ok(sizeAt !== -1 && body.slice(sizeAt, sizeAt + 120).includes('if-eqz v5, :cmds_done'),
        'an empty queue exits immediately with zero commands emitted');
});

test('[structurel smali] A4. isSafeFn et capacité sont conservés (queueCommand inchangé)', () => {
    const q = bridge.indexOf('.method public static declared-synchronized queueCommand');
    assert.ok(q !== -1, 'queueCommand entry point exists');
    const qm = bridge.slice(q, bridge.indexOf('.end method', q));
    const checkAt = qm.indexOf('AndBridge;->isSafeFn');
    const addAt = qm.indexOf('Ljava/util/ArrayList;->add');
    assert.ok(checkAt !== -1 && addAt !== -1 && checkAt < addAt,
        'isSafeFn runs BEFORE anything is queued');
    assert.ok(qm.includes('0x20'), 'bounded queue (32 pending max) preserved');
    assert.ok(bridge.includes('[A-Za-z_][A-Za-z0-9_]{0,48}'), 'strict name charset preserved');
});

test('[structurel smali] A5. le format JSON de la réponse et la sécurité des noms sont inchangés', () => {
    const pm = pollCommandsMethod();
    for (const key of ['\\"ui\\"', '\\"cmds\\"', '\\"fn\\"', '\\"arg\\"']) {
        assert.ok(pm.includes(key), `response still carries ${key.replace('\\', '')}`);
    }
    assert.ok(pm.includes('JavascriptInterface'), 'synchronous JS-callable poll preserved');
    assert.ok(pm.includes('JSONObject;->quote'), 'names and args are JSON-quoted, never raw');
    assert.ok(pm.includes('Ljava/lang/Throwable;'), 'a thrown poll degrades to {"ui":"","cmds":[]}');
});

// ---------------------------------------------------------------------------
// Section B — simulation de la sémantique de la boucle (modèle fidèle des
// instructions vérifiées en section A). Ceci n'exécute PAS le bytecode : en
// l'absence d'émulateur Dalvik dans le dépôt, la simulation vérifie
// uniquement que l'algorithme des instructions se comporte comme attendu.
// ---------------------------------------------------------------------------

function simulatePoll(queue, { maxPerCall = 4 } = {}) {
    // Faithful model of the corrected drain loop:
    //   v4 = 0
    // :drain
    //   if (queue.size() == 0) goto :cmds_done
    //   if (v4 >= 4) goto :cmds_done
    //   emit(queue.fns.remove(0), queue.args.remove(0))
    //   v4 += 1
    //   goto :drain
    // :cmds_done -> close the JSON array
    const emitted = [];
    let processed = 0;
    for (;;) {
        if (queue.fns.length === 0) break;
        if (processed >= maxPerCall) break;
        emitted.push({ fn: queue.fns.shift(), arg: queue.args.shift() });
        processed += 1;
    }
    return emitted;
}

test('[simulation] B1. FIFO : les commandes sortent dans l\'ordre d\'insertion', () => {
    const queue = {
        fns: ['__sfOpenLibrary', '__sfOpenCollection', '__sfOpenLibraryCategory'],
        args: ['', '', 'albums']
    };
    const out = simulatePoll(queue);
    assert.deepEqual(out.map((c) => c.fn), ['__sfOpenLibrary', '__sfOpenCollection', '__sfOpenLibraryCategory']);
    assert.deepEqual(out.map((c) => c.arg), ['', '', 'albums'], 'fn/arg pairs stay aligned');
});

test('[simulation] B2. limite de 4 par appel : les suivantes restent en file pour le prochain poll', () => {
    const queue = { fns: ['a1', 'a2', 'a3', 'a4', 'a5', 'a6'], args: ['', '', '', '', '', ''] };
    const first = simulatePoll(queue);
    assert.equal(first.length, 4, 'exactly 4 commands per call');
    assert.deepEqual(first.map((c) => c.fn), ['a1', 'a2', 'a3', 'a4'], 'the oldest 4 go first');
    assert.deepEqual(queue.fns, ['a5', 'a6'], 'the rest stays queued (no loss)');
    const second = simulatePoll(queue);
    assert.deepEqual(second.map((c) => c.fn), ['a5', 'a6'], 'the next call drains the remainder');
});

test('[simulation] B3. file vide : sortie immédiate, aucune commande fabriquée', () => {
    const out = simulatePoll({ fns: [], args: [] });
    assert.deepEqual(out, [], 'an empty queue exits with zero commands');
});

test('[simulation] B4. l\'ancienne condition (if-lt) aurait toujours renvoyé 0 commande — régression couverte', () => {
    // The defective semantics: "if (processed < 4) goto exit" checked before
    // each removal — the first check always exits. Model it to prove the
    // regression test would have caught the original behavior.
    const defective = (queue) => {
        const emitted = [];
        let processed = 0;
        for (;;) {
            if (queue.fns.length === 0) break;
            if (processed < 4) break; // inverted condition
            emitted.push({ fn: queue.fns.shift(), arg: queue.args.shift() });
            processed += 1;
        }
        return emitted;
    };
    const queue = { fns: ['a1', 'a2'], args: ['', ''] };
    assert.deepEqual(defective(queue), [], 'the if-lt defect drains nothing');
    assert.equal(simulatePoll({ fns: ['a1', 'a2'], args: ['', ''] }).length, 2,
        'the corrected semantics drains them');
});
