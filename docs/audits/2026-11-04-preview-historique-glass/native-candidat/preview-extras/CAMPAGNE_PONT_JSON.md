# Test intégré simulé du pont JavaScript → JSON → vues JVM

Candidat applicatif testé : `a5cde753a8a72e257e29015bfe1cf460677437e8` (APK signé 1022250). Aucune modification applicative ni nouvel APK dans cette campagne.

## Méthode et résultats

`bridge-fixtures.cjs` exécute les vrais scripts `queue-job.js`, `panel-job.js` et `volume-control.js` dans des pages JSDOM synthétiques. Pour File, Paroles et Appareils, les boutons, minuteries, ouvertures et fermetures sont simulés ; le test exige une fermeture vérifiée. Les chaînes JSON retournées sont ensuite elles-mêmes encodées en JSON, comme une valeur chaîne renvoyée par `WebView.evaluateJavascript`.

`test_bridge_integration.py` transmet ces valeurs à `PreviewPlayerTiles` et `PreviewPlayerVolume` réels, compilés pour la JVM, avec les vues Android et les callbacks WebView remplacés par des stubs. Vérifications : lignes, ordre, caractères accentués, guillemets et emoji ; appareil actif ; pourcentage de volume ; absence des données privées dans les diagnostics ; refus d'un démarrage `null` et d'un résultat de file ayant un identifiant de travail différent. Pour le transfert incertain simulé, un seul transfert suit une confirmation explicite, puis le natif relit automatiquement la liste sans renvoyer une commande de transfert. Le message actuel « Transfert non vérifié, Réessayer » pourrait toutefois encourager une répétition humaine alors que l'issue est inconnue : comportement caractérisé, pas corrigé ici.

Passage obtenu avec chacun des deux parseurs :

- sources `org.json` de libcore dans le miroir GrapheneOS `platform_libcore`, branche 17, commit `2804897a14425d5e045ff8bc13a14ba7bef5b9bb` : **passé** (7 avertissements de compilation, 0 erreur) ; les annotations Android nécessaires à la compilation sont des stubs. Cette version n'est pas nécessairement celle du téléphone de l'utilisateur ;
- JSON-java `2cd0a8c2112a3bc17d33ba8546c54ecb613613f1` : **passé** (14 avertissements et 8 informations, 0 erreur).

La simulation de transfert incertain forge sa réponse JSON : elle ne prouve pas qu'un appareil Spotify l'émette ni qu'un transfert ait été effectué. L'action volume est simulée ; les diagnostics indiquent « son non vérifié ». Le pont est simulé et non une véritable WebView Android, et le DOM est artificiel, non une capture Spotify authentifiée. Aucun de ces tests ne démontre la fraîcheur de données immédiatement non vides, ni le bon fonctionnement sur téléphone, ni la sortie sonore. Les trois limites de fraîcheur documentées dans `CAMPAGNE_LECTURE_FRAICHEUR.md` et le risque indépendant Like subsistent.

## Reproduction indicative

Installer Node avec `jsdom` 26.1.0, Python 3 et JDK. Exemple pour récupérer le parseur libcore, sans l'ajouter au dépôt (nécessite `gh` et `base64`) :

```sh
mkdir -p /tmp/melodix-android-json/src/main/java/org/json /tmp/melodix-jsdom
for n in JSON JSONArray JSONException JSONObject JSONStringer JSONTokener; do
  gh api "repos/GrapheneOS/platform_libcore/contents/json/src/main/java/org/json/$n.java?ref=2804897a14425d5e045ff8bc13a14ba7bef5b9bb" --jq .content | base64 -d > "/tmp/melodix-android-json/src/main/java/org/json/$n.java"
done
npm install --prefix /tmp/melodix-jsdom jsdom@26.1.0
cd docs/audits/2026-11-04-preview-historique-glass/native-candidat/preview-extras
NODE_PATH=/tmp/melodix-jsdom/node_modules ORG_JSON_SOURCE_ROOT=/tmp/melodix-android-json python3 test_bridge_integration.py
```

Le test choisit par défaut `javac` et `java`. Les variables `PREVIEW_TEST_JAVA` et `PREVIEW_TEST_ECJ` permettent d'utiliser ECJ comme compilateur JVM, comme lors de cette campagne. Les sources externes ne font pas partie du livrable applicatif.

**Suite de la campagne :** les tests de réponses tardives et les deux vérifications strictes en échec sur le volume sont détaillés dans `CAMPAGNE_REPONSES_TARDIVES.md`. Le test par défaut caractérise ces limites et ne les considère pas comme corrigées.
