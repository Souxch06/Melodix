# Lot 1 — diagnostic préalable de la référence Preview 9016

## Référence

- Preview 9016 confirmée par l'utilisateur : livraison `f5f32ffe61dea424486639468b1729cbbeea6c9f`, base historique `d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6`.
- `Melodix-Preview-historique-glass.apk`, [artefact ZIP](https://github.com/Souxch06/Melodix/actions/runs/43701210947/artifacts/14156257401), [run de construction](https://github.com/Souxch06/Melodix/actions/runs/43701210947). SHA-256 du ZIP : `c7739009ddcd737c4c10537da1375e9f1c4ff4d0cb1c23df91d981d4c36feecf`.
- La référence est celle du fonctionnement rapporté par l'utilisateur ; aucun nouveau parcours Android réel n'a été exécuté ici. Ne pas modifier le package, la signature, la connexion ou les mécanismes de données pour obtenir une CI verte.

## Suite complète

Sur une copie complète de l'arbre `f5f32ffe` : `npm ci --no-audit --no-fund`, puis `npm test` avec accès aux commits historiques référencés par les tests : **1 310 réussites, 30 échecs, 5 ignorés sur 1 345 résultats**. Le fichier `tests/token_refusal_debug.test.js` échoue au chargement : ses cas individuels ne sont pas comptés. Le total ne prouve donc pas que tous les cas ont été exécutés. Résultat antérieur, avec historique incomplet : 1 309 réussites, 31 échecs et 5 ignorés ; il est remplacé par le résultat ci-dessus.

La suite racine teste les fichiers de l'arbre de livraison, pas directement l'APK Preview historique. Le commit antérieur `dc323a959b5754edd088096950e6104ce8daadf9` a modifié la logique d'accès du bridge racine ; sa [note de travail](../2026-11-04-parcours-session/restauration-lecteur-partielle.md) indiquait déjà que la suite était rouge et que la restauration n'était pas validée. Il n'a pas été créé dans ce lot.

Contradiction vérifiable, parmi les causes d'échec : `tests/p0_library_fetch.test.js`, test MEL-BUG-036, exige l'envoi d'un en-tête `Authorization` avec son jeton synthétique ; `tests/no_private_player_token_flow.test.js` et `tests/mel_bug_036_webplayer_bearer.test.js` exigent au contraire l'absence de bearer injecté dans le bridge racine. Les deux exigences visent le même bridge racine. D'autres échecs concernent les diagnostics, la synchronisation et les comparaisons d'historique : leur portée doit être examinée individuellement, et ils ne peuvent pas tous être déclarés obsolètes par association. Les tests ne doivent être ni supprimés ni rendus inoffensifs pour maquiller le résultat.

La Preview 9016 est construite depuis une autre base et une chaîne de transformations. Son `assets/spotify_bridge.js` a un SHA-256 différent de celui de l'arbre racine (`cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7` contre `821030c519d8db1b7fb6b9b21e9e1ab5df9dfd1a12d1538ec49a84999b364772`). Il serait trompeur d'affirmer que les tests racine valident automatiquement le bridge effectif de la 9016. Les empreintes caractérisent les copies inspectées, pas la sécurité ni un parcours Spotify réussi.

## CI de mesure

[Run de référence 43702861282](https://github.com/Souxch06/Melodix/actions/runs/43702861282) : construction réussie ; tablette réussie ; téléphone échoué. Les annotations officielles donnent sur téléphone une barre de `64.0 dp`, mais des onglets de `55.62 dp` pour une attente `mel_tab_height = 58.0 dp`. Sur tablette : `76.0 dp` et onglets `68.0 dp`, conformes. Dans le layout racine, la barre de 64 dp a un `mel_liquid_inset` de 4 dp à chaque extrémité verticale et les onglets remplissent l'espace restant : cela explique la mesure proche de 56 dp, à l'arrondi Android près. La racine tablette utilise la barre de 76 dp, compatible avec 68 dp après les mêmes insets.

L'action utilise une clé jetable et construit l'arbre Android **racine**, sous `com.melodix.music`. La Preview 9016 est produite séparément à partir de la base historique, sous `com.melodix.music.preview`, avec les patches Preview et la clé CI épinglée. Les layouts et les activités diffèrent. Un résultat vert pour l'arbre racine ne prouverait donc pas le rendu de la Preview 9016, et inversement. La CI actuelle mesure le shell non connecté ; elle ne mesure ni les pochettes ni les playlists réelles ni le lecteur actif. Aucun compte ni jeu de données Spotify réel n'y est injecté.

- [Artefact téléphone](https://github.com/Souxch06/Melodix/actions/runs/43702861282/artifacts/14156429247) ; [artefact tablette](https://github.com/Souxch06/Melodix/actions/runs/43702861282/artifacts/14157451290). Les téléchargements des ZIP et des logs complets sont bloqués depuis cet environnement ; les annotations de mesure ont été lues par l'API GitHub. Il n'y a pas de capture « après » du lot 1.
- Corriger le layout racine pour changer la mesure modifierait l'interface de l'app normale, explicitement hors périmètre. Changer seulement le seuil ou remplacer le job existant par un contrôle moins exigeant masquerait l'écart. Une mesure supplémentaire dédiée à la Preview devrait construire exactement la chaîne historique puis vérifier ses propres dimensions et captures ; elle ne doit pas être présentée comme un test de playlists Spotify réelles.

## Lecture et sécurité : points à préserver

Le shell natif de la 9016 recueille position et durée en **secondes** dans son payload ; la méthode native `formatNativeTime` les divise par 1 000 et sa branche de remplissage est inversée. Une correction devra tester le contrat complet du payload jusqu'aux étiquettes, y compris les heures, sans changer la lecture. Les durées de listes et le temps restant doivent être recherchés et vérifiés séparément ; leur comportement réel n'a pas encore été démontré.

La fabrique WebView de la base historique utilisée par la Preview active le débogage ; celle de l'arbre racine de livraison le désactive. L'application normale n'a pas été modifiée par ce diagnostic. Cela ne démontre pas l'état de tous les autres APK ou variantes existants.

## Conclusion

Aucun correctif visuel ni APK du lot 1 n'est livré. Les critères « `npm test` vert » et « `verify-ui-metrics.yml` vert » ne sont pas satisfaits sur la référence, et la mesure existante ne cible pas l'APK à livrer. La résolution nécessite de distinguer les contrats contradictoires et les deux bases, sans toucher aux fichiers d'authentification ni affaiblir les garanties. Aucun résultat synthétique ne remplacera les tests sur téléphone demandés.
