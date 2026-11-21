# Trace de démarrage de session après Preview130

## Constat

Le retour téléphone montrait `proof clear-oncreate=T`. Dans Preview130 et avant, l'appel de trace utilisait `v0` immédiatement après la lecture de la préférence `ServiceOn`, mais avant l'affectation de `false` à `AppSingleton.B`. Ainsi, lorsque `ServiceOn=true`, la trace annonçait `T` alors que la valeur effectivement écrite dans le drapeau de preuve était `false`. Cette trace ne prouve pas l'effacement d'un cookie. Le bug est distinct de la disparition de la tentative de relance, dont la cause précise reste inconnue.

## Modification

L'appel existant de trace est déplacé immédiatement après l'affectation existante de `false` à `AppSingleton.B`, avec le même registre. Aucun registre supplémentaire, aucune autre instruction de démarrage, aucune règle de session, aucun cookie, aucune preuve de refus ni aucune requête Spotify ne sont modifiés. Le helper de trace capture ses exceptions comme auparavant.

## Vérifications et limites

- Test de régression sur le fragment smali : les quatre combinaisons synthétiques `ServiceOn`/preuve initiale aboutissent à la même valeur écrite `false` et une trace `F` ; le test échouait avant correction avec `ServiceOn=true`.
- Suite Node : 1076 tests, 1072 réussis, 0 échec, 4 ignorés. Test ciblé des protections de registres et des sites de trace : 16/16.
- Vérificateur de registres sur la méthode `onCreate` avant/après : 0 problème. Sur le fichier complet, le vérificateur signale le même avertissement préexistant dans `onTrimMemory` avant et après le changement ; ce signal ne démontre pas une régression ici.
- Les tests JS et les analyses statiques ne constituent pas une validation ART, WebView, authentification, ni un test téléphone. Aucun build de livraison, aucune capture portrait/tablette et aucun test réel dans cette étape. Le diagnostic de relance Preview130 reste à vérifier sur appareil lorsque possible.
