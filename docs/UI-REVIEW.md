# Revue UI — session de test 2026-10-24 (honnêteté de vérification)

Cette note mappe les axes de finition visuelle (mission 4.1–4.6) à ce qui a
été **réellement vérifié** dans cette session, et à ce qui reste à **contrôler
sur les captures d'écran** produites par la CI (`Melodix-Emulator-Verification-*`,
fichiers `*.png` des écrans principaux). L'environnement de développement
sandbox ne rend **aucun écran Android** : aucune évaluation visuelle n'y est
possible. Rien ci-dessous n'est donc déclaré « terminé » sur la seule foi de
tests unitaires.

## Vérifié statiquement (code + tests unitaires)

| Axe | État | Preuve |
| --- | --- | --- |
| Clavier : mode d'ajustement | `android:windowSoftInputMode="adjustResize"` déclaré sur MainActivity | `AndroidManifest.xml`, test `keyboard_input.test.js` 1 |
| Clavier : ordre du bouton Retour | Ferme l'IME d'abord (et consomme), navigue ensuite | `MainActivity.handleNativeBack` + `NativeSearchWatcher.dismissKeyboard`, tests 2–3 |
| Clavier : sortie d'écran | L'IME ne reste jamais ouvert sur un autre écran ; il reste disponible en entrant dans Recherche | `MainActivity.setNativeScreen`, test 4 |
| Clavier : saisie conservée | `inputType="text"` (toutes langues), `imeOptions="actionSearch"`, debounce 280 ms, requête en cours conservée (`nativeExpectedSearch`) | `res/layout/activity_main.xml`, `NativeSearchWatcher.smali`, tests 5–7 |
| Lecteur : seek réel | `NativeSeekHandler.smali` (drag, multi-touch désactivé), barres seek du mini et plein lecteur | `tests/player_seek_queue.test.js` (13 tests), CI E2E |
| Lecteur : file réelle | `__sfRequestQueue` + `readNowPlayingUri` alimentent le vrai moteur ; écran file dédié | idem |
| États vide/erreur/chargement | Trois états distincts rendus (chargement borné, vide honnête, erreur avec cause) ; « erreur ≠ vide » | `tests/playlist_lifecycle.test.js` (15 scénarios), `library_home_states.test.js` |
| Accueil : playlists réelles | Cartes ouvrant la bonne playlist, titres/couvertures issus des données réelles uniquement | `playlist_lifecycle.test.js` 12, `library_fetch_diagnostics.test.js` |
| Thème et zones système | Fond noir cohérent (`Theme.Spotifuck` : window/status/nav bar), pas de flash blanc au lancement | `res/values/styles.xml` |
| Web (css_hacks.css) | Ellipsis des titres, pouce de seek, `safe-area-inset`, `object-fit` des couvertures | revue statique du fichier (1 955 lignes) |

## À contrôler visuellement sur les captures CI

La Phase 2 du workflow capture désormais (`screencap`) et téléverse dans
l'artefact `Melodix-Emulator-Verification-<sha>` :

- `20_kb_open.png` — recherche avec clavier ouvert (le champ doit rester
  **au-dessus** du clavier, pas masqué, pas de décalage) ;
- `21_kb_closed_still_search.png` — après Retour : clavier fermé, écran
  recherche intact, texte conservé ;
- `23_kb_no_linger.png` — clavier jamais ouvert au-dessus d'un autre écran ;
- `30_home.png`, `31_library.png` — accueil et bibliothèque.

Points visuels à juger sur ces images (hiérarchie, espacements, contraste,
couvertures manquantes, cibles tactiles ≥ 40 dp) : la CI publie aussi un
« Touch-target audit » en annotations. Les corrections visuelles à venir
devront être faites sur la base de ces captures, pas d'impressions.

## Limites déclarées (non réimplémentées dans cette session)

- Réorganisation et suppression dans la file d'attente : **non implémentées** —
  ne sont jamais présentées comme fonctionnelles.
- Spécificités Premium (écoute à la demande d'une piste précise en shuffle,
  qualité très haute, téléchargements) : dépendent du compte Spotify réel, non
  contournées. Voir le rapport de session.
