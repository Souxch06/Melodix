#!/usr/bin/env node
'use strict';
// Contrats [structurels] - polarité de la garde de contexte de NativeCrashGuard.
//
// Ces contrats ne prouvent PAS l'exécution Android : ils lisent le Smali et
// vérifient statiquement l'instruction de garde qui suit le chargement du
// champ statique `context`. Aucun appareil, aucun émulateur, aucun DEX exécuté.
//
// Défaut couvert (préexistant depuis 5d38b1f, constaté sur 0d90f4c) : les
// méthodes write/stage/clearReport/lastReport/lastStage testaient le contexte
// avec `if-nez <reg>, :done` - saut à :done quand le contexte est PRESENT
// (non nul), donc aucune écriture/lecture SharedPreferences dans le cas
// normal : le crash recorder était muet. La polarité correcte est
// `if-eqz <reg>, :done` (sauter seulement quand le contexte est nul).
//
// Seul le contexte est couvert ici. Les gardes d'ARGUMENT (p0) de write/stage
// et les méthodes record/excerpt/shorten/showLastReport/install ne sont pas
// l'objet de ces contrats.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const SRC = path.join(ROOT, 'smali/com/melodix/music/NativeCrashGuard.smali');
const src = fs.readFileSync(SRC, 'utf8');

function methodBody(sigStart) {
  const start = src.indexOf(sigStart);
  assert.ok(start >= 0, `méthode introuvable: ${sigStart}`);
  return src.slice(start, src.indexOf('.end method', start));
}

// Retourne la première instruction réelle (non vide, non commentaire) qui
// suit le chargement du champ `context` dans le registre `reg`.
function guardAfterContextLoad(body, reg) {
  const load = new RegExp(
    `sget-object ${reg}, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;`
  );
  const m = body.match(load);
  assert.ok(m, `sget-object ${reg} ...->context absent`);
  const after = body.slice(body.indexOf(m[0]) + m[0].length).split('\n');
  for (const raw of after) {
    const line = raw.trim();
    if (line === '' || line.startsWith('#')) continue;
    return line;
  }
  return null;
}

const CONTRACTS = [
  {
    name: 'write(String)',
    sig: '.method public static write(Ljava/lang/String;)V',
    reg: 'v0',
  },
  {
    name: 'stage(String)',
    sig: '.method public static stage(Ljava/lang/String;)V',
    reg: 'v0',
  },
  {
    name: 'clearReport()',
    sig: '.method private static clearReport()V',
    reg: 'v0',
  },
  {
    name: 'lastReport()',
    sig: '.method private static lastReport()Ljava/lang/String;',
    reg: 'v1',
  },
  {
    name: 'lastStage()',
    sig: '.method public static lastStage()Ljava/lang/String;',
    reg: 'v1',
  },
];

for (const c of CONTRACTS) {
  test(`[structurel] ${c.name} : la garde de contexte est if-eqz ${c.reg}, :done (saut seulement si contexte nul)`, () => {
    const body = methodBody(c.sig);
    const guard = guardAfterContextLoad(body, c.reg);
    assert.strictEqual(
      guard,
      `if-eqz ${c.reg}, :done`,
      `${c.name}: attendu \`if-eqz ${c.reg}, :done\` juste après le chargement du contexte, trouvé \`${guard}\``
    );
    assert.ok(
      !new RegExp(`if-nez ${c.reg}, :done`).test(body),
      `${c.name}: la forme inversée \`if-nez ${c.reg}, :done\` ne doit plus figurer dans la méthode`
    );
  });
}
