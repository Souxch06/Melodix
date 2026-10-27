// [contrat][structurel][A TESTER SUR TELEPHONE]
// P0 V30 (2026-10-27) : l'accueil reste entierement vide alors que le shell
// natif s'affiche (rows >= 1). Cause racine DEMONTREE par comparaison
// historique : la base restauree 5986ed6 porte 5 tests de nullite INVERSES
// dans NativeHomeShelfRenderer.render (si-non-nul -> sortie/saut) que les
// versions fonctionnelles (32e9af6, edf887d, 6621b52) portent en if-eqz
// (si-nul -> sortie/saut). Avec un conteneur valide (cas reel), l'ancien
// if-nez sortait immediatement : aucun rendu, ecran vide permanent.
// Meme famille que le 'diag-5 : tests de nullite inverses' du
// docs/native-crash-report-2026-10-20.md.
// STRUCTUREL = ne prouve ni l'execution Android ni l'affichage reel avec un
// compte Spotify ; NE REMPLACE PAS un test sur telephone.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

function shelfSmali() {
  return fs.readFileSync(
    path.join(__dirname, '..', 'smali', 'com', 'melodix', 'music', 'NativeHomeShelfRenderer.smali'),
    'utf8');
}

test('[P0v30] render(): la null-check du conteneur saute si NUL (if-eqz), pas si non-nul', () => {
  const s = shelfSmali();
  assert.ok(s.includes('if-eqz v13, :shelf_done'),
    'le conteneur valide doit passer au rendu ; if-nez v13 (v30) sortait sans jamais peindre');
  assert.ok(!s.includes('if-nez v13, :shelf_done'), 'l\'inversion v30 ne doit pas revenir');
});

test('[P0v30] render(): les objets JSON de row valides ne sont pas sautes', () => {
  const s = shelfSmali();
  assert.ok(s.includes('if-eqz v5, :shelf_next'), 'optJSONObject nul -> row suivante (if-eqz)');
  assert.ok(!s.includes('if-nez v5, :shelf_next'), 'if-nez v5 sautait les rows valides');
  assert.ok(s.includes('if-eqz v3, :shelf_next'), 'null-check de section (accueil) dans le bon sens');
  assert.ok(!s.includes('if-nez v3, :shelf_next'), 'l\'inversion section ne doit pas revenir');
});

test('[P0v30] render(): premiere section et quick-grid dans le bon sens', () => {
  const s = shelfSmali();
  assert.ok(s.includes('if-eqz v3, :shelf_new_section'), 'premiere section creee quand aucune en cours');
  assert.ok(!s.includes('if-nez v3, :shelf_new_section'), 'l\'inversion premiere section ne doit pas revenir');
  assert.ok(s.includes('if-eqz v4, :quick_grid_inc'), 'increment quick-grid si non nul');
  assert.ok(!s.includes('if-nez v4, :quick_grid_inc'), 'l\'inversion quick-grid ne doit pas revenir');
});

test('[P0v30] aucune autre inversion if-nez sur une vue check-caste dans le renderer', () => {
  const s = shelfSmali();
  const lines = s.split('\n');
  for (let i = 0; i < lines.length - 1; i += 1) {
    if (/check-cast v\d+, Landroid\/widget\//.test(lines[i])) {
      const next = (lines[i + 1] || '').trim();
      assert.ok(!/^if-nez v\d+, :/.test(next),
        'check-cast d\'une vue suivi de if-nez = null-check inversee ligne ' + (i + 2));
    }
  }
});
