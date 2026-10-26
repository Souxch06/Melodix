// ---------------------------------------------------------------------------
// Améliorations d'interface mobile (valeurs de layout uniquement) :
//   - Bibliothèque : chips de catégories à 44.0dip (zones tactiles >= 44px) ;
//   - Mini-lecteur : boutons précédent/suivant à 44.0dip ;
//   - Accueil : texte d'état (chargement/vidé) 15.0sp / #ffcccccc.
// NATURE : [structurel] — ces contrats vérifient les VALEURS présentes dans le
// layout. Ils NE PROUVENT PAS le rendu (aucune validation visuelle possible
// dans cet environnement). Rendu non vérifié visuellement.
// ---------------------------------------------------------------------------
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const layout = fs.readFileSync(path.join(root, 'res/layout/activity_main.xml'), 'utf8');

test('[structurel] Bibliothèque : les 4 chips de catégories ont une hauteur de 44.0dip', () => {
    const chips = layout.match(/native_category_chip"[\s\S]*?layout_height="([\d.]+)dip"/g) || [];
    assert.equal(chips.length, 4, 'four category chips (Playlists/Albums/Artistes/Podcasts)');
    for (const chip of chips) {
        assert.ok(chip.includes('layout_height="44.0dip"'), `chip >= 44px touch target (got ${chip.slice(-30)})`);
    }
    assert.ok(!layout.includes('38.0dip'), 'old 38.0dip chip height is gone');
});

test('[structurel] Mini-lecteur : précédent/suivant à 44x44.0dip ; Accueil : état 15.0sp #ffcccccc', () => {
    // Mini-player buttons only (the big player buttons stay at 54dip):
    // match the multi-line mini-player blocks, not the inline big-player ones.
    assert.ok(/onNativePlayerPreviousClick"\s+android:layout_width="44\.0dip"\s+android:layout_height="44\.0dip"/.test(layout),
        'previous button 44x44');
    assert.ok(/onNativePlayerNextClick"\s+android:layout_width="44\.0dip"\s+android:layout_height="44\.0dip"/.test(layout),
        'next button 44x44');
    // Empty/loading status text: size and contrast values.
    const status = layout.split('android:id="@id/frameStatusText"')[0];
    assert.ok(status.includes('android:textSize="15.0sp"'), 'status text 15.0sp');
    assert.ok(status.includes('android:textColor="#ffcccccc"'), 'status text contrast #ffcccccc');
});
