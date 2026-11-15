# Candidat 9009 — affichage des playlists publiques

## Retour de l'appareil

La Preview 9008 affiche les playlists personnelles à l'apparition de l'écran. Les playlists publiques de l'accueil arrivent encore plus tard. La bibliothèque vide 9007 n'a pas été signalée comme toujours vide, mais aucun parcours de clic ou de lecture n'a été confirmé.

## Correctif candidat

- Le retour immédiat des données personnelles et la pagination progressive 9008 sont conservés. La surveillance par temporisation ne s'arrête plus simplement parce qu'une playlist personnelle possède une pochette : elle continue, pour une durée plafonnée à 20 s, en attendant des données de l'accueil hors bibliothèque. Un observateur ciblé sur l'accueil réagit aussi aux changements de texte, de liens et de sources d'images, pas seulement aux ajouts d'éléments.
- Le scrape de l'accueil et celui de la barre latérale sont strictement séparés afin d'éviter de classer un résultat public comme playlist personnelle ou l'inverse.
- La copie Home Web historique est désactivée *uniquement lorsque le shell natif est actif*. Cette copie cachait le vrai `#main-view` via `display:none` alors que la collecte native dépend de cette page. Le vrai contenu Spotify reste monté sous le shell natif opaque ; le mode historique sans shell natif garde son renderer. Cela peut aider les éléments Spotify chargés à la demande, mais son effet sur le serveur ou sur un appareil n'est pas établi.
- Aucun cache persistant supplémentaire, aucune requête privée inventée, aucune playlist fictive. Il est impossible d'afficher une recommandation que Spotify n'a pas encore fournie : la première réponse et les contenus dépendent encore de Spotify, de son DOM et du réseau.

## Vérifications

- Deux tests Python de base et d'intégrité des entrées épinglées. APK compilée puis redécodée, ZIP et ressources validés ; ne pas distribuer la version locale non signée.
- 33/33 tests synthétiques (10 accueil public, 14 récupération progressive, 9 précédent correctif) sur l'APK redécodée : surveillance après playlist personnelle immédiate, attributs différés, fin bornée, changement de route, séparation DOM, source non masquée et conservation du mode Web historique. Pas d'Android ni Spotify réel.
- Chargement complet des deux scripts redécodés en JSDOM : 3/3 tests ciblés. 40/40 tests de routage/Smali/session et 3/3 + 1/1 + 3/3 chaînes historiques ciblées. Un essai de la suite de caractérisation complète avec le nouveau bridge a donné 3 échecs et 26 annulations : ses tests attendent notamment les anciennes courses de la bibliothèque et bloquent avec la promesse partagée 9008 ; elle ne constitue pas une validation complète de ce candidat.
- Pas de mesure sur appareil et pas de garantie que l'affichage public sera plus rapide en conditions réelles. Les clics natifs, lecture, risques historiques et caches entre comptes ne sont pas modifiés ni validés.

## Preview signée 9009

- [Build réussi](https://github.com/Souxch06/Melodix/actions/runs/43684627560), source `82559fbe933d6f95d0413b59e72d65d2b172e132`, run 616, versionCode calculé `1022103`.
- [ZIP Preview](https://github.com/Souxch06/Melodix/actions/runs/43684627560/artifacts/14149872475), expire le 29 novembre 2026 à 06:16 UTC ; SHA-256 ZIP selon l'API GitHub `6cfa580c54161789f4c049739ba960871c0854fbe9dc3e73163fd496aaab94b3`.
- Package séparé `com.melodix.music.preview`, signature Preview épinglée, aucune release publique. Pas de test Android réel.
