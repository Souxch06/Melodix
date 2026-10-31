# Audit PR #6 — diagnostic DOM runtime dans la Preview

- **Date :** 18 octobre 2026
- **Dépôt / branche :** `Souxch06/Melodix`, `arena/dbf2d44f-melodix`
- **HEAD de départ :** `291d199`
- **PR :** [#6](https://github.com/Souxch06/Melodix/pull/6), ouverte.
- **État :** instrumentation ajoutée au worktree; aucun commit, push, build APK ou test sur appareil effectué.

## Objectif et périmètre

Ajouter un moyen de recueillir les mêmes champs JSON que le script de diagnostic précédent, sans ADB ni DevTools, uniquement dans la Preview dont le package est `com.melodix.music.preview`. À la fin du chargement WebView admissible, le JSON est renvoyé par `evaluateJavascript`, présenté dans une boîte de dialogue défilable et sélectionnable, puis copiable par un bouton natif.

Aucun correctif d’interface, de tiroir, d’UA, d’authentification, de lecture, de navigation, de proxy ou d’interception réseau n’est inclus.

## Changements

| Fichier | Changement |
|---|---|
| `smali/c91.smali` | Appelle le helper après les injections de scripts/styles déjà présentes dans le chemin `onPageFinished`. Le helper applique les gardes Preview et origine Spotify. |
| `assets/runtime_diagnostic.js` | Contient le script demandé et retourne l’objet contenant les mêmes champs : hôte, UA, largeurs, sélecteurs, configuration, classes/état du tiroir et visibilité calculée. |
| `smali/com/melodix/music/RuntimeDiagnostic.smali` | Refuse tout package autre que `com.melodix.music.preview`, limite l’exécution à HTTPS `open.spotify.com` (port absent ou 443), charge l’asset local et lance `evaluateJavascript`. |
| `smali/com/melodix/music/RuntimeDiagnostic$Callback.smali` | Reçoit le résultat JSON de WebView avec une référence faible vers l’activité. |
| `smali/com/melodix/music/RuntimeDiagnostic$ShowRunnable.smali` | Poste l’affichage sur le thread UI et ignore une activité en fermeture. |
| `smali/com/melodix/music/RuntimeDiagnostic$CopyListener.smali` | Le bouton **Copier** place uniquement le résultat JSON dans le presse-papiers puis affiche un toast. |
| `tests/runtime_diagnostic.test.js` | Vérifie les champs retournés, les deux IDs de dock, la restriction Preview/origine et l’absence de lecture de credentials/appels réseau dans le script. |
| `tests/smali_sanity.test.js` | Inclut les nouveaux fichiers Smali dans le contrôle structurel existant. |

La vérification du package est faite avant le chargement de `runtime_diagnostic.js`. Dans `com.melodix.music`, le helper retourne donc sans évaluer le script ni afficher de dialogue. Le workflow Preview existant réécrit le package au build en `com.melodix.music.preview`.

## Données et confidentialité

- Le script lit uniquement les champs présents dans le diagnostic demandé; `window.location.hostname` fournit le nom d’hôte, jamais `location.href`.
- Il ne lit pas les cookies, jetons, stockage local/de session, en-têtes ou corps réseau, et n’effectue aucun appel réseau.
- Le callback `onPageFinished` fournit déjà une URL à WebView. Le nouveau helper ne consulte que le schéma, l’hôte et le port pour l’allowlist; le chemin et la query ne sont ni sérialisés, conservés, journalisés, affichés ni copiés.
- Le presse-papiers ne reçoit que la chaîne JSON retournée par le script, sur action explicite du bouton **Copier**.
- Le code préexistant de `c91.onPageFinished` n’a pas été modifié; cette note décrit les accès ajoutés par le diagnostic, pas l’ensemble des traitements déjà présents dans l’application.
- Aucun code touchant `assets/runtime_state.js`, la bannière de session, les fichiers chiffrés de profil ou les secrets de signature n’a été modifié ou consulté.

## Tests et limites

| Vérification | Résultat |
|---|---|
| `node --check assets/runtime_diagnostic.js` | Réussi |
| `node --check tests/runtime_diagnostic.test.js` | Réussi |
| `node --check tests/smali_sanity.test.js` | Réussi |
| `node --test tests/runtime_diagnostic.test.js tests/smali_sanity.test.js` | Réussi : 5 tests, 0 échec |
| `node --test tests/*.test.js` | **31 tests au total : 15 réussis, 16 en échec.** Les échecs concernent des assertions existantes d’authentification/WebView/profils; elles n’ont pas été corrigées dans cette tâche. Les sources `assets/spotify_bridge.js` et `assets/runtime_state.js` n’ont pas été modifiées. Aucun run de référence avant changement n’a été effectué; ces échecs ne sont donc pas qualifiés de « préexistants » sur preuve comparative. |
| Contrôle structurel des fichiers Smali modifiés | Réussi : méthodes équilibrées et cibles de branches directes résolues. Ce contrôle ne valide pas l’assemblage DEX. |
| Assemblage Apktool / build APK | **Non effectué**, conformément à la demande. |
| Test de dialogue, presse-papiers, package Preview/normal sur appareil ou émulateur | **Non effectué**; aucun appareil ou émulateur n’est disponible dans cet environnement. |

L’assemblage Smali n’a donc pas été validé par Apktool et le comportement de la boîte de dialogue/presse-papiers reste à confirmer après installation de la Preview.

## Utilisation et compilation de l’APK de test

Après installation de la Preview compilée avec ces changements : ouvrir Melodix Preview et laisser la WebView finir de charger `https://open.spotify.com`. Une boîte **Diagnostic runtime Melodix (Preview)** doit apparaître. Le texte peut être sélectionné; **Copier** place le JSON complet dans le presse-papiers. Le dialogue peut réapparaître après un nouveau chargement admissible.

Les changements sont actuellement non commités. Le workflow GitHub Actions compile un `source_ref` (un commit), pas le worktree local; l’APK ne peut donc pas encore inclure ces changements. **Aucun commit, push ou dispatch de workflow n’a été fait.** Après autorisation explicite :

1. inclure les changements dans un commit sur `arena/dbf2d44f-melodix`, puis le pousser sur cette même branche;
2. dans GitHub **Actions → Build Melodix Preview APK → Run workflow**, choisir cette branche;
3. fournir un tag Preview inédit (par exemple `v1.2.2-test.4-preview`, après vérification de disponibilité) et `source_ref` égal au commit contenant le diagnostic;
4. après réussite du workflow, télécharger l’APK Preview et son `.sha256`, puis installer la Preview à côté de l’application normale — package distinct `com.melodix.music.preview` et données séparées.

Le workflow manuel publie une release Preview; il ne doit être déclenché qu’après l’autorisation requise. Aucun APK n’a été produit ou publié par cette passe.
