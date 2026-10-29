#!/usr/bin/env node
'use strict';
// Contrats [structurels] — polarité des gardes d'ARGUMENT, de VALEUR et de
// LONGUEUR de NativeCrashGuard (write/stage/record/excerpt/shorten/
// showLastReport/showLaunchMarker).
//
// Ces contrats ne prouvent PAS l'exécution Android : ils lisent le Smali.
//
// Défaut couvert (préexistant depuis 5d38b1f, démontré sur 8b45a93) : ces
// méthodes testaient leurs arguments avec `if-nez p0, :done` — saut quand
// l'argument EST présent (non nul) — donc write()/stage()/record() jetaient
// tout contenu réel, excerpt()/shorten() retournaient "" via l'exception de
// substring bornée à l'envers, et showLastReport() retournait false sans
// jamais afficher le dialogue pour une activité valide. Le même motif que le
// défaut des gardes de contexte, sur les arguments et les valeurs internes.
// dispatch() est correct (if-eqz previous -> :kill) et verrouillé ici.
const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const ROOT = path.resolve(__dirname, '..');
const src = fs.readFileSync(path.join(ROOT, 'smali/com/melodix/music/NativeCrashGuard.smali'), 'utf8');

function methodBody(sigStart) {
  const start = src.indexOf(sigStart);
  assert.ok(start >= 0, `méthode introuvable: ${sigStart}`);
  return src.slice(start, src.indexOf('.end method', start));
}

function firstInstruction(body) {
  for (const raw of body.split('\n').slice(1)) {
    const line = raw.trim();
    if (line === '' || line.startsWith('#') || line.startsWith('.locals')) continue;
    return line;
  }
  return null;
}

// --- gardes d'argument : saut seulement si l'argument est NUL -----------
const ARG_METHODS = [
  ['write(String)', '.method public static write(Ljava/lang/String;)V'],
  ['stage(String)', '.method public static stage(Ljava/lang/String;)V'],
  ['record(Throwable)', '.method public static record(Ljava/lang/Throwable;)V'],
  ['showLaunchMarker(Activity)', '.method public static showLaunchMarker(Landroid/app/Activity;)V'],
];

for (const [name, sig] of ARG_METHODS) {
  test(`[structurel] ${name} : la garde d'argument est if-eqz p0, :done (saut seulement si argument nul)`, () => {
    const body = methodBody(sig);
    assert.strictEqual(firstInstruction(body), 'if-eqz p0, :done',
      `${name}: première instruction attendue \`if-eqz p0, :done\`, trouvée \`${firstInstruction(body)}\``);
    assert.ok(!/if-nez p0, :done/.test(body), `${name}: la forme inversée if-nez p0 ne doit plus figurer`);
  });
}

test("[structurel] excerpt(Throwable) : garde d'argument if-eqz + garde de longueur if-le (tronque au-delà de 1200)", () => {
  const body = methodBody('.method public static excerpt(Ljava/lang/Throwable;)Ljava/lang/String;');
  assert.match(body, /const-string v0, ""\n\n    if-eqz p0, :done/,
    "après la valeur par défaut: saut seulement si l'argument est nul");
  assert.match(body, /if-le v1, v2, :done/,
    'longueur <= 1200 : retour tel quel ; longueur > 1200 : substring(0, 1200)');
  assert.ok(!/if-nez p0|if-gt v1, v2/.test(body), 'les formes inversées doivent disparaître');
});

test('[structurel] shorten(String) : garde d\'argument if-eqz + garde de longueur if-le (tronque au-delà de 240)', () => {
  const body = methodBody('.method private static shorten(Ljava/lang/String;)Ljava/lang/String;');
  assert.strictEqual(firstInstruction(body), 'if-eqz p0, :done');
  assert.match(body, /if-le v0, v1, :done/,
    'longueur <= 240 : retour tel quel ; longueur > 240 : substring(0, 240)');
  assert.ok(!/if-nez p0|if-gt v0, v1/.test(body), 'les formes inversées doivent disparaître');
});

test('[structurel] showLastReport(Activity) : les 5 gardes internes sont droites (activité, rapport, longueur, stage)', () => {
  const body = methodBody('.method public static showLastReport(Landroid/app/Activity;)Z');
  assert.match(body, /if-eqz p0, :done/, 'activité nulle → sortir ; activité valide → afficher');
  assert.match(body, /if-eqz v1, :try_stage/, 'rapport absent → rapport d\'interruption depuis le fil de stages');
  assert.match(body, /if-eqz v2, :try_stage/, 'rapport vide → idem');
  assert.match(body, /if-le v2, v3, :short_enough/, 'longueur <= 1200 : tel quel ; sinon tronquer');
  assert.match(body, /if-eqz v2, :no_stage/, 'stage absent → pas de ligne stage');
  assert.ok(!/if-nez (p0|v1|v2), :done|if-nez v2, :no_stage|if-gt v2, v3/.test(body),
    'les formes inversées doivent disparaître');
});

test("[structurel] dispatch() reste correct : previous absent -> kill, présent -> délégation", () => {
  const body = methodBody('.method private dispatch(Ljava/lang/Thread;Ljava/lang/Throwable;)V');
  assert.match(body, /sget-object v0, Lcom\/melodix\/music\/NativeCrashGuard;->previous:Ljava\/lang\/Thread\$UncaughtExceptionHandler;\n\n    if-eqz v0, :kill/);
});
