# Accueil / playlists : état de la mesure avant optimisation

## Périmètre et statut

Instrumentation de mesure seulement. Aucun cache, regroupement de payloads ou
changement du rendu de l'accueil n'est introduit. Aucune cause du délai sur
appareil n'est encore démontrée, et aucun gain sur appareil n'est revendiqué.

Publication de l’instrumentation seule autorisée. Les changements ne sont pas
présents dans l’ancienne preview issue de `3f3704c`. La preview test.120 et la
capture CI sont construites depuis le commit d’instrumentation, sans changement
d’authentification, de spoof ou de publicité.

## Résultats réellement obtenus dans cet environnement

Commande : `node scripts/perf_startup_probe.js`.

Fixture : 24 cartes synthétiques, session simulée comme prouvée, sans requête
réseau. Les trois installations utilisent **trois contextes JS indépendants** ;
ce ne sont pas trois phases d'hydratation d'une même page.

| Mesure hors ligne | Résultat d'une exécution locale |
|---|---:|
| Installation JS, contexte 1 | 10,84 ms |
| Installation JS, contexte 2 | 4,25 ms |
| Installation JS, contexte 3 | 3,23 ms |
| Payloads Home par installation | 1 / 1 / 1 |
| Taille du payload Home | 3 907 octets |
| Payloads cumulés dans un seul contexte, après installation puis trois notifications MutationObserver espacées de 200 ms simulées | 1 / 1 / 1 / 1 |

Ce dernier essai exerce réellement le callback de l'observateur et franchit le
seuil du scheduler de 150 ms. Sur **cette fixture inchangée**, le shell ne réémet
pas de payload. Cela ne reproduit ni une hydratation Spotify réelle, ni le rendu
Android, ni les téléchargements d'images. Cela ne suffit donc pas à attribuer les
cycles répétés à l'hydratation, au réseau ou à une reconstruction native.

## Tableau appareil — non mesuré à ce stade

| Étape | Depuis l'ancre native | Durée / compteur |
|---|---|---|
| `activity-create` après installation du CrashGuard et marqueur de lancement | Ancre instrumentée, pas encore capturée | NOT MEASURED |
| Arbre de vues posé | NOT MEASURED | NOT MEASURED |
| WebView obtenue / attachée à l'activité | NOT MEASURED | NOT MEASURED |
| Navigation WebView demandée | NOT MEASURED | NOT MEASURED |
| `onPageFinished` | NOT MEASURED | NOT MEASURED |
| Fin d'installation du shell JS | NOT MEASURED | NOT MEASURED |
| Fin de tentative d'obtention du token | NOT MEASURED | NOT MEASURED |
| Requête / réponse bibliothèque | NOT MEASURED | NOT MEASURED |
| Payload Home envoyé / reçu | NOT MEASURED | NOT MEASURED |
| Entrée du renderer Home | NOT MEASURED | NOT MEASURED |
| Premières cartes attachées | NOT MEASURED | NOT MEASURED |
| Première réussite Picasso | NOT MEASURED | NOT MEASURED |
| Nombre de payloads Home | — | NOT MEASURED |
| Nombre de rendus Home / ratio rendus par payload | — | NOT MEASURED |

L'ancre ne mesure pas le temps du lancement du processus jusqu'à l'entrée de
`onCreate`. `webview-created` observe le retour de la factory, qui peut réutiliser
une WebView existante. `page-loaded` observe le premier `onPageFinished` de la
capture : une navigation intermédiaire n'est pas une preuve que Spotify est prêt.
`token-ready` observe la fin de la tentative, **pas** la validité du token.

`home-first-paint` est un nom interne historique de cette instrumentation : le
point observé est l'attachement des cartes, **avant** le prochain draw Android.
Le callback Picasso observe l'image chargée dans l'ImageView, pas sa visibilité
physique à l'écran. Ce callback est partagé entre les consommateurs du loader ;
il indique la première réussite de la fenêtre, pas nécessairement une pochette
Home visible. Une mesure de pixels réellement présentés nécessitera une capture
ou une observation de draw dédiée. Ne pas assimiler ces jalons à des mesures de
frame time ou de première image visible.

## Capture et lecture

Le protocole téléphone court est dans [perf-startup-phone-protocol.md](perf-startup-phone-protocol.md).
Le bouton de copie ajoute désormais une section `MDXPERF-BEGIN` / `MDXPERF-END`
indépendante du journal historique. Elle conserve en mémoire jusqu’à 64 Kio de
jalons et événements strictement autorisés, sans écrire de préférences.
`dropped=0` certifie l’absence de débordement de cette section ; sinon le
parseur refuse de calculer une référence complète. Une copie ne vide pas le
buffer. L’activité recréée démarre une nouvelle capture ; les reprises suivantes
réinitialisent la capture sur `activity-resume`, sans perdre les jalons de
création lors du premier `onResume`. Une demande de permission ou une autre
activité peut également provoquer une reprise : terminer la configuration avant
les essais. Le premier succès image est observé à nouveau dans chaque fenêtre ;
les tentatives de jeton sont observées à chaque appel, même avant le shell JS.

La piste complète est maintenant émise par `NativeCrashGuard.diagLine` dans
`MDXTRACE`, sous la forme `sid=<session> t=<elapsedRealtime_ms> <événement>`.
Les événements JS autorisés reçoivent cette même horloge **à leur réception
native**, pas à leur émission dans le moteur JS.

Le journal de préférences du téléphone reste limité à 1 Kio. Il peut perdre
l'ancre pendant le démarrage : un diagnostic copié en fin de session n'est donc
pas toujours suffisant. Le parseur échoue explicitement si l'ancre horodatée est
absente. Pour la mesure de référence, utiliser le logcat complet d'un lancement
avec l'APK instrumenté, pas la preview actuellement publiée.

Sur un poste disposant d'ADB, avec l'APK instrumenté déjà installé :

1. Démarrer `adb logcat -v brief -s MDXTRACE:I > startup.log` **avant** le lancement.
2. Relancer l'application, attendre les cartes et pochettes, puis terminer la
   capture. Aucun cookie ou token ne doit être demandé ou ajouté au rapport.
3. Exécuter `python3 scripts/startup_timing_journal.py startup.log --json startup.json`.
4. Répéter à conditions identiques pour distinguer démarrage froid / chaud,
   session prouvée / non prouvée et réseau. Mesurer l'ouverture d'une playlist
   séparément ; le compteur Home ne décrit pas les rendus d'une fiche playlist.

Le parseur accepte aussi le journal brut et un dump XML des préférences. Il
sélectionne le dernier lancement ancré, isole sa session et ignore les anciennes
copies logcat non horodatées des événements JS. Les deltas affichés sont entre
jalons observés dans l'ordre temporel ; ils ne représentent pas une durée CPU
exclusive de chaque fonction.

## Vérifications avant publication

- Contrat de mesure : 12 tests ciblés (grammaire fermée, copie téléphone,
  isolation des captures, démarrage/reprise, aucune injection de session).
- Sanité smali et assemblage local vérifiés ; résultats finaux dans le compte
  rendu de livraison et la CI.
- Shell généré : **108 618 octets**, plafond inchangé de **108 867 octets**.
- Le workflow `startup-measurement.yml` construit le SHA exact, vérifie le
  SHA-256 de l’APK, puis observe trois scénarios sur un téléphone Android 16
  vierge. Les journaux publiés sont filtrés par la même grammaire fermée que
  la section téléphone. Aucun compte, payload, cookie ou token n’est injecté.
- La preview téléphone est produite séparément par `preview-apk.yml`, avec la
  clé preview habituelle ; aucune release ni aucun tag public n’est créé.

## Analyse à venir — pas de verdict anticipé

La CI vierge peut mesurer la création de l’activité, du shell, de la WebView,
et les requêtes réellement tentées sans compte. Elle ne peut pas prouver les
temps de votre bibliothèque authentifiée ou de ses pochettes. Les valeurs
absentes restent **NOT MEASURED** et les captures téléphone seront analysées
séparément, sans mélanger leurs horloges avec celles de la CI.

Après réception des trois captures téléphone : désigner le goulot avec les
chiffres, corriger une seule cause, puis répéter exactement la même mesure. La
reconstruction native complète reste une hypothèse de travail, pas un verdict.

**Proposition non appliquée :** remplacer le carré gris par un placeholder
statique (icône musicale + dégradé déjà disponible), sans flou, animation ni
nouvelle requête réseau. Cela pourrait améliorer l’attente perçue, sans accélérer
l’arrivée des pochettes ; à évaluer séparément après le diagnostic.
