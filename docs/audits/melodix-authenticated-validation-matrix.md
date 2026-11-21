# Matrice de validation authentifiée — Melodix

**À exécuter par vous, sur votre appareil.** Complète `melodix-qa-manual-authenticated-protocol-2026-11-05.md`.

> **Aucun identifiant, mot de passe, cookie, jeton ou export de compte ne doit m'être transmis.** La connexion se fait uniquement sur l'écran de votre appareil, dans la page Spotify. Si une capture contient des données personnelles, dites-le : les surfaces peuvent être validées sans elles.

## Comment remplir

Pour chaque ligne, notez **un** statut et joignez la capture correspondante.

| Code | Signification |
|---|---|
| **OK** | Résultat attendu observé sur l'appareil |
| **KO** | Défaut reproduit — joindre la capture et décrire l'écart |
| **PART** | Fonctionne partiellement — préciser ce qui manque |
| **NT** | Non testé |

Une ligne ne passe jamais en OK « parce que l'écran s'affiche » : le critère de réussite est explicite.

## Préparation

```bash
adb install -r melodix-qa.apk          # build de contrôle qualité, clé jetable
adb shell wm density                   # noter la densité
```

Densité à passer aux scripts : `densité / 160`. Téléphone 420 dpi → `2.625`. Tablette 320 dpi → `2.0`.

Pour la variante tablette, l'appareil doit avoir **≥ 600 dp de largeur utile**, sinon Android choisit la disposition téléphone et vous ne testez pas la variante.

Deux passes, avant et après connexion :

```bash
bash scripts/ui_qa_walk.sh <serial> phone 2.625 qa-avant
# connectez-vous sur l'appareil, lancez une playlist, puis :
bash scripts/ui_qa_walk.sh <serial> phone 2.625 qa-apres
```

---

## A — Session et connexion

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| A1 | Écran de connexion | La page Spotify s'affiche, saisie possible | Page blanche, blocage, boucle | |
| A2 | Après connexion | La bannière « Connexion à Spotify… » disparaît | Elle persiste au-delà de 30 s | |
| A3 | Aucune fuite visuelle | Aucun jeton, cookie ou identifiant affiché dans l'interface | Une valeur technique apparaît | |
| A4 | Fermer puis relancer l'app | La session est conservée, pas de reconnexion demandée | Reconnexion imposée | |
| A5 | Bouton Réessayer (si erreur) | Relance réellement le chargement | Aucun effet | |

## B — Bibliothèque réelle

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| B1 | Onglet Bibliothèque | Vos **vraies** playlists apparaissent, avec leurs vrais noms | Liste vide, noms génériques, données inventées | |
| B2 | Filtre Playlists | Ne montre que des playlists | Mélange ou liste inchangée | |
| B3 | Filtre Albums | Ne montre que des albums | Mélange | |
| B4 | Filtre Artistes | Ne montre que des artistes | Mélange | |
| B5 | Filtre Podcasts | Ne montre que des podcasts | Mélange | |
| B6 | Pochettes | Chaque vignette correspond au bon élément | Pochettes manquantes, déformées ou interchangeées | |
| B7 | Noms longs | Tronqués proprement avec ellipse, lisibles | Coupés net, superposés, débordants | |
| B8 | Défilement | Fluide, pas de saut, pas de ligne vide en fin de liste | Sauts, doublons | |

## C — Ouverture d'une playlist et d'un album

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| C1 | Appui sur une playlist | Ouvre **cette** playlist : bon titre, bonne bannière | Ouvre un autre élément, ou rien | |
| C2 | Morceaux de la playlist | Liste réelle, dans le bon ordre | Liste vide ou ordre incohérent | |
| C3 | Nombre de morceaux | Cohérent avec Spotify | Compte faux | |
| C4 | Appui sur un album | Ouvre cet album, pochette carrée non déformée | Déformation, mauvais album | |
| C5 | Retour depuis le détail | Revient à la bibliothèque, **position de défilement conservée** | Revient en haut, ou écran vide | |
| C6 | Retour système depuis le détail | Même résultat que la flèche interne | Touche inopérante ou double navigation | |

## D — Lecteur principal

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| D1 | Appui sur un morceau | La lecture démarre réellement (son audible) | Aucun son, ou lecture d'un autre titre | |
| D2 | Lecteur agrandi | Pochette, titre, artiste corrects | Informations vides ou erronées | |
| D3 | Barre de progression | Avance en temps réel | Figée, ou saute | |
| D4 | Position / durée | Cohérentes avec le morceau | Valeurs nulles ou absurdes | |
| D5 | **Tablette : 2 colonnes** | Pochette à gauche, commandes à droite | Disposition téléphone simplement agrandie | |
| D6 | Pause depuis le lecteur | Le son s'arrête, l'icône passe en lecture | Le son continue, ou icône incohérente | |
| D7 | Reprise | Reprend à la bonne position | Repart du début | |

## E — Mini-lecteur et synchronisation inter-écrans

**C'est ici que se cachent les défauts que les captures seules ne montrent pas.**

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| E1 | Quitter le lecteur en lecture | Le mini-lecteur apparaît | Absent | |
| E2 | Contenu du mini-lecteur | Bon titre, bonne pochette | Vide ou erroné | |
| E3 | Pause depuis le mini-lecteur | Le son s'arrête **et** le lecteur principal, rouvert, affiche pause | États désynchronisés | |
| E4 | Suivant depuis le mini-lecteur | Le lecteur principal affiche le nouveau morceau | Ancien morceau affiché | |
| E5 | Le mini-lecteur ne masque rien | Ni la barre d'onglets, ni le dernier élément de liste | Superposition | |
| E6 | Navigation pendant la lecture | Accueil, Bibliothèque, Recherche : la lecture continue et le mini-lecteur reste correct | Lecture interrompue, mini-lecteur faux | |
| E7 | Contrôle depuis un **autre appareil** Spotify | Melodix se met à jour | Reste sur l'ancien état | |

## F — Commandes de lecture

| # | Commande | Critère de réussite | Statut |
|---|---|---|---|
| F1 | Lecture / pause | Bascule réelle, état cohérent partout | |
| F2 | Suivant | Passe au morceau suivant de la file | |
| F3 | Précédent | Revient au morceau précédent (ou début selon l'usage Spotify) | |
| F4 | Aléatoire | Bascule **et** l'icône reflète l'état réel | |
| F5 | Répétition | Bascule entre les modes, icône correcte | |
| F6 | Appui sur une tuile de genre | Ouvre une recherche avec de **vrais** résultats | |
| F7 | Recherche saisie | Résultats réels ; requête vide → état vide propre ; faute de frappe → aucun plantage | |

## G — Arrière-plan et commandes multimédias Android

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| G1 | Touche Accueil pendant la lecture | La lecture **continue** | Elle s'arrête | |
| G2 | Notification multimédia | Titre, artiste, pochette corrects | Absente ou erronée | |
| G3 | Pause depuis la notification | Le son s'arrête, l'app reflète l'état | Désynchronisation | |
| G4 | Suivant depuis la notification | Change de piste, l'app suit | Désynchronisation | |
| G5 | Écran de verrouillage | Contrôles présents et fonctionnels | Absents | |
| G6 | Casque / Bluetooth (si disponible) | Lecture/pause et saut fonctionnent | Sans effet | |
| G7 | Retour au premier plan | Lecteur et mini-lecteur à jour, pas de contenu d'un autre écran | État incohérent | |
| G8 | Rotation (si prise en charge) | Pas de perte d'état ni de plantage | Écran vide, lecture perdue | |

## H — Paramètres réels

| # | Contrôle | Critère de réussite | Critère d'échec | Statut |
|---|---|---|---|---|
| H1 | Ouverture | Les réglages **réels** de Spotify s'affichent, plus « Paramètres indisponibles » | Message d'erreur persistant | |
| H2 | Interrupteur | Bascule le réglage côté Spotify, et l'état persiste après réouverture | Aucun effet, ou état non persisté | |
| H3 | Retour système | Revient à l'écran précédent | Inopérant ou double navigation | |
| H4 | Retour interne | Même résultat | Incohérence entre les deux | |

---

## Ce que vous me renvoyez

Les répertoires `qa-avant/` et `qa-apres/` (captures, `navigation-*.json`, `layout-*.json`, `foreground.txt`), et cette matrice remplie.

**Ne renvoyez jamais** : mot de passe, cookie, jeton, capture de la page de connexion, export de données de compte.

## Après réception

Je comparerai les bornes publiées (`layout-*.json` contient désormais la géométrie des lignes et des cartes, sans texte) aux jetons de design, je vérifierai la synchronisation inter-écrans à partir de vos observations, et je mettrai à jour le registre : chaque ligne passera de « en attente de validation authentifiée » à **résolu avec preuve** ou à une nouvelle anomalie identifiée.

**Aucune de ces fonctionnalités n'est aujourd'hui déclarée validée.** MEL-BUG-006 reste ouvert tant que cette matrice n'est pas remplie sur appareil.
