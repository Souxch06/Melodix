# Mesures de référence CI — instrumentation test.120

## Provenance et limites

- Source mesurée : `593af9e69af21168ee37b9680890f23c44b8601d`.
- Instrumentation applicative : commit `25fb722`. Corrections de l'outillage CI
  uniquement : `a2ca384` (cible Preview) et `593af9e` (format logcat brief avec PID).
- [Capture CI réussie](https://github.com/Souxch06/Melodix/actions/runs/42576567943),
  téléphone Android 16, 1080 × 2400, 420 dpi, installation vierge, aucun compte.
- [Construction preview téléphone réussie](https://github.com/Souxch06/Melodix/actions/runs/42576566435).
- Suite complète : **984 tests, 980 réussis, 4 ignorés, 0 échec**. Les tests ciblés
  de lecture du format logcat Android sont également verts après la dernière
  correction d'outillage.

L'APK téléphone et celui de la mesure ont le même source SHA et la même
instrumentation, mais des métadonnées de version distinctes : ne pas les
présenter comme le même fichier binaire. Le fichier à installer est la preview
**sans** suffixe `-startup-measurement`.

## APK téléphone

[Télécharger l'artefact test.120](https://github.com/Souxch06/Melodix/actions/runs/42576566435/artifacts/13655178942)
(ZIP à décompresser pour obtenir l'APK).

- Nom : `Melodix-Preview-v1.3.2-test120.apk`.
- Paquet : `com.melodix.music.preview` (séparé de Melodix production).
- `versionCode` : **1021449** ; `versionName` réel : **1.2.2-593af9e**.
- SHA-256 : `a4a4a9064d032dda1ec1838e8bfd387cbfe6511fb9c3744e50e5649fe70e73f0`.
- Artefact Actions uniquement, aucune release et aucun tag public créés.

## Chiffres CI

Les durées ci-dessous sont des différences d'horodatages natifs monotones.
L'ancre froide est après l'installation du CrashGuard, pas le début du processus.

| Étape froide | Depuis `activity-create` | Intervalle depuis le jalon précédent |
|---|---:|---:|
| Arbre de vues posé | 106 ms | 106 ms |
| WebView obtenue | 1 473 ms | 1 367 ms |
| Premier `onPageFinished` | 5 740 ms | 4 267 ms |
| Entrée du renderer Home | 5 751 ms | 11 ms |
| Cartes attachées | NOT MEASURED | NOT MEASURED |
| Première réussite image | NOT MEASURED | NOT MEASURED |
| Tentative de jeton | NOT MEASURED | NOT MEASURED |
| Requête/réponse bibliothèque | NOT MEASURED | NOT MEASURED |

Quatre `onPageFinished` sont observés dans la capture froide. Le premier peut
être une navigation intermédiaire ; il ne certifie pas que Spotify est prêt.
L'intervalle WebView → premier `onPageFinished` concentre environ **74 %** du
temps jusqu'à l'entrée du renderer. Cela localise une attente observable, pas
une durée CPU exclusive, ni une preuve de lenteur de l'authentification ou des
images. Aucun jalon de fin d'installation JS n'a été capturé.

| Capture | Manipulation / observation après ouverture | Payloads Home émis observés | Entrées renderer Home | Requêtes bibliothèque observées |
|---|---|---:|---:|---:|
| Froide | Arrêt forcé, ouverture, attente de 35 s | 0 | 1 | 0 |
| Chaude | Retour Android, 3 s, réouverture, attente de 20 s | 0 | 0 | 0 |
| Arrière-plan | Accueil Android, 30 s, retour, attente de 20 s | 0 | 0 | 0 |

Le processus reste vivant avec le même PID (**2222**) dans les trois captures.
Les deux retours sont ancrés sur `activity-resume` : ils ne recréent pas
l'activité dans cette exécution. Aucun autre jalon de la grammaire de mesure
n'est capturé pendant leurs 20 s d'observation. La valeur JSON
`observed_until_ms=0` y désigne le dernier événement, **pas** un temps de
réaffichage nul et **pas** la durée de la capture.

Le rendu froid sans payload Home web observé peut provenir d'un chemin natif
indépendant ; ce relevé ne permet pas d'affirmer qu'une bibliothèque réelle a
été rendue. Le ratio rendus/payloads est indéfini (pas un ratio égal à zéro).
Les cycles répétés signalés sur téléphone ne sont pas reproduits ici.

## Conclusion avant optimisation

**Attente dominante mesurée en CI :** l'intervalle de 4 267 ms après l'obtention
de la WebView, avant le premier `onPageFinished`. Ce n'est pas encore le goulot
prouvé de l'accueil authentifié et de ses pochettes.

**Goulot téléphone : en attente des trois blocs `MDXPERF`.** Il faudra comparer
le temps des tentatives de jeton, les requêtes réelles, l'arrivée des données,
les répétitions de payloads/rendus et le premier succès Picasso, en tenant
compte des caches et des écrans déjà conservés. Aucun temps absent ne sera
remplacé par une estimation ou un zéro. Une observation visuelle utilisateur
complète le callback image, qui ne mesure pas la présentation des pixels.

Aucune optimisation ni modification de logique d'authentification, de spoof ou
de publicité n'a été appliquée. Le placeholder statique proposé reste une
suggestion d'amélioration de l'attente perçue, non appliquée et sans gain de
performance revendiqué.

Voir le [protocole téléphone court](perf-startup-phone-protocol.md).
