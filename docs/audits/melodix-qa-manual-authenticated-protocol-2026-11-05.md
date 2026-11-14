# Protocole de contrôle qualité manuel — session Spotify authentifiée

**Date :** 5 novembre 2026 · **Base :** `cc29b6c` · **Complète :** `melodix-authenticated-session-runbook-2026-11-04.md`

---

## Pourquoi ce protocole existe

Le contrôle qualité automatisé marche sans compte. Il atteint donc l'accueil, la
bibliothèque vide, la recherche, les paramètres, la navigation et le retour — mais
**pas** les surfaces qui n'existent qu'avec une session réelle : lecteur en
lecture, mini-lecteur, étagères peuplées, bannière de playlist, pochettes.

Ces surfaces sont rapportées `blocked_no_session` dans la trace, **jamais
« validé »**. Aucun compte n'a été créé, aucune session simulée.

**Ce protocole ne demande jamais votre mot de passe.** La seule saisie se fait
sur l'écran de votre appareil, dans la page de connexion Spotify. Ne me transmettez
ni identifiant, ni cookie, ni jeton, ni capture de l'écran de connexion.

## Préparation

1. Récupérez l'APK du dernier run **UI QA** réussi (artefact `melodix-qa-apk-<run>`).
   C'est un build de contrôle qualité, signé avec une clé jetable : **il ne
   remplacera pas** une installation existante signée différemment. Désinstallez
   l'ancienne version d'abord, ou utilisez un appareil de test.
2. Installez-le : `adb install -r melodix-qa.apk`.
3. Récupérez `scripts/ui_qa_walk.sh`, `scripts/ui_layout_audit.py`,
   `scripts/ui_qa_trace.py` depuis le dépôt.

## Exécution, en deux passes

### Passe 1 — à froid, avant connexion

```bash
adb shell am force-stop com.melodix.music
adb shell am start -n com.melodix.music/.MainActivity
bash scripts/ui_qa_walk.sh <serial> phone 2.625 qa-avant
```

### Passe 2 — après connexion manuelle

Connectez-vous **sur l'appareil**, lancez une playlist, puis :

```bash
bash scripts/ui_qa_walk.sh <serial> phone 2.625 qa-apres
```

Densité : `2.625` pour un téléphone 1080×2400 @420 dpi ; `2.0` pour une tablette
1600×2560 @320 dpi. Adaptez à votre appareil (`adb shell wm density` / 160).

Pour la variante tablette, ajoutez `res/layout-sw600dp` en utilisant un appareil
dont la largeur utile est ≥ 600 dp, sinon Android choisit la disposition téléphone
et vous ne testez pas la variante.

## Ce qu'il faut vérifier, surface par surface

Pour chaque case : **OK**, **défaut**, ou **non testé**. Un défaut doit être
accompagné de la capture correspondante.

| # | Surface | Vérifications |
|---|---|---|
| 1 | Accueil | Les étagères portent vos vrais titres et vos vraies pochettes. Aucune image cassée, aucun bloc vide. Cartes de largeur identique, gouttières régulières. |
| 2 | Bibliothèque | Vos playlists réelles apparaissent. Les quatre filtres (Playlists, Albums, Artistes, Téléchargés) changent bien la liste. |
| 3 | Playlists | Ouvrir une playlist affiche sa bannière, son titre et ses morceaux. Nombre de morceaux cohérent. |
| 4 | Albums / artistes | Pochettes carrées non déformées. Noms non tronqués au point d'être illisibles. |
| 5 | Lecteur principal | Pochette, titre, artiste, position/durée, barre de progression qui avance. Sur tablette : **deux colonnes**, pochette à gauche, commandes à droite. |
| 6 | Mini-lecteur | Apparaît quand on quitte le lecteur en lecture. Pochette + titre + lecture/pause. Ne masque ni la barre d'onglets ni le dernier élément de liste. |
| 7 | Navigation | Les trois onglets répondent. L'onglet actif est visuellement distingué. Aucun onglet ne reste bloqué. |
| 8 | Recherche | Une requête réelle renvoie des résultats. Les huit tuiles de genres ouvrent une recherche. Sur tablette : **grille 4×2**. |
| 9 | Profil / paramètres | Les interrupteurs reflètent l'état réel de Spotify et le modifient. Retour sans perte d'état. |
| 10 | Connexion / chargement | L'écran d'attente n'est pas figé ; le bouton Réessayer fonctionne ; aucune superposition avec l'interface native. |

### Synchronisation inter-écrans — le point le plus important

C'est ici que se cachent les défauts que les captures seules ne montrent pas :

1. Lancez un morceau depuis une playlist. Le **mini-lecteur** affiche-t-il le bon
   titre et la bonne pochette ?
2. Ouvrez le **lecteur principal** : même morceau, même position ?
3. Mettez en pause depuis le lecteur, revenez à l'accueil : le mini-lecteur
   affiche-t-il **pause** et non lecture ?
4. Sautez au morceau suivant depuis le mini-lecteur : le lecteur principal,
   rouvert, affiche-t-il le nouveau morceau ?
5. Changez de morceau depuis Spotify sur un **autre appareil** : Melodix se
   met-il à jour ?

### Commandes — classement attendu

L'audit statique (`scripts/ui_wiring_audit.py`) établit que les 15 commandes sont
raccordées. Ce protocole vérifie qu'elles **agissent** :

| Commande | Attendu |
|---|---|
| Accueil, Bibliothèque, Recherche | Changent d'écran et chargent les vraies données |
| Tuile de genre | Ouvre une recherche réelle |
| Filtre de bibliothèque | Filtre la liste |
| Ligne de playlist / album | Ouvre la collection |
| Agrandir le lecteur | Passe au lecteur principal |
| Retour | Revient à l'écran précédent sans perdre l'état |
| Lecture / pause | Agit sur la lecture, et l'état reste cohérent partout |
| Suivant / précédent | Change de piste |
| Aléatoire / répétition | Bascule et l'icône reflète l'état réel |
| Interrupteur de paramètre | Modifie le réglage côté Spotify |
| Réessayer | Relance le chargement |

## Ce que vous me renvoyez

Les répertoires `qa-avant/` et `qa-apres/` (captures + `trace.json` + `layout.json`),
et le tableau ci-dessus rempli.

**Ne renvoyez jamais** : mot de passe, cookie, jeton, capture de la page de
connexion, export de données de compte. Si une capture contient des informations
personnelles que vous ne souhaitez pas partager, dites-le : les surfaces peuvent
être validées sans elles.

## Limites

- Ce protocole exige un appareil que vous contrôlez. La CI ne peut pas offrir de
  saisie interactive, et il serait contraire aux règles de sécurité d'y faire
  transiter vos identifiants.
- Une réussite ici valide l'interface et le raccordement, **pas** la publication :
  la signature de production, la politique de confidentialité et les exigences
  du store restent à traiter séparément.
