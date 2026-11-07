# Protocole de session Spotify authentifiée — prêt à exécuter

**Pourquoi ce document existe.** Toutes les mesures P0 obtenues jusqu'ici l'ont été sur une session **non authentifiée**, démarrée à froid. Le défaut décrit (« Melodix perd son interface native au profit de Spotify Web ») est rapporté dans un contexte **connecté**. Ce contexte n'a pas pu être testé : aucun identifiant n'a été fabriqué et aucun ne doit l'être.

Ce protocole lève cette dernière inconnue. **Il ne demande jamais votre mot de passe.** La seule saisie se fait sur l'écran de l'appareil, dans la page de connexion Spotify.

---

## Ce dont vous avez besoin

| Élément | Détail |
|---|---|
| Un appareil Android | téléphone **ou** tablette, connecté en USB, débogage USB activé |
| `adb` | Android platform-tools installés sur votre machine |
| Votre compte Spotify | celui avec lequel vous observez le défaut |
| Deux APK du **même run CI** | ils partagent le même certificat de signature |
| ~15 minutes | fenêtre d'observation maximale |

Les deux APK sont produits sans secret par le workflow P0 et téléchargeables depuis GitHub :

1. `Melodix-Preview-v1.2.2-test96-display-ownership.apk` — l'application.
2. `melodix-display-tooling-<run_id>.zip` → contient `melodix-display-harness.apk` — l'observateur passif.

> **Important :** prenez les deux dans le **même run**. Un couple issu de runs différents n'est pas signé par le même certificat et le script le refusera.

Les artefacts de sidecar expirent après **1 jour** ; les APK après **14 jours**. Téléchargez-les sans attendre.

---

## Exécution

```bash
# 1. Vérifier qu'un seul appareil est connecté
adb devices

# 2. Dézipper l'outillage du même run
unzip melodix-display-tooling-<run_id>.zip -d ./tooling

# 3. Lancer l'observation (15 min par défaut)
bash scripts/p0_authenticated_session.sh \
  ./Melodix-Preview-v1.2.2-test96-display-ownership.apk \
  ./tooling/melodix-display-harness.apk \
  ./resultats

# Variante : fenêtre plus courte (2 min minimum, 15 min maximum)
bash scripts/p0_authenticated_session.sh app.apk tooling/melodix-display-harness.apk ./resultats 300000
```

Le script :
- vérifie qu'**exactement un** appareil est connecté (il ne devine jamais) ;
- vérifie que les deux APK sont signés par le **même certificat** (si `apksigner` est disponible) ;
- affiche les SHA-256 des deux APK ;
- installe les deux APK **sans effacer vos données** ni votre session existante ;
- démarre l'observateur passif et affiche `sign in on the device now`.

## Ce que vous faites sur l'appareil

1. L'application s'ouvre. **Connectez-vous à Spotify sur l'écran de l'appareil**, exactement comme d'habitude.
2. Une fois connecté, allez sur **Accueil**.
3. Puis **Rechercher**, puis retour **Accueil**.
4. Puis **Bibliothèque**, puis retour **Accueil**.
5. Ouvrez une **vraie playlist**.
6. Lancez une **vraie lecture** si votre compte le permet.
7. Appuyez une fois sur la touche **Retour** d'Android.
8. Passez l'application en arrière-plan quelques secondes, puis revenez.

Ces gestes sont les vôtres : **rien n'est automatisé**, ni la connexion ni la navigation.

## Ce que le script ne fait jamais

- il ne saisit, ne lit, ne stocke et ne transmet **aucun identifiant** ;
- il n'injecte **ni cookie, ni jeton, ni réponse serveur** ;
- il n'efface pas vos données d'application ;
- il ne capture **ni logcat, ni capture d'écran, ni hiérarchie UI** ;
- il ne contourne aucune protection Premium et n'appelle aucune API Spotify.

Le fichier produit, `resultats/authenticated-observation.json`, ne contient que des **booléens, des compteurs et des noms de catégorie**. Un test dédié exécute ce filtre contre des canaris `password`, `cookie`, `access_token`, URL et nom de playlist, et vérifie qu'aucun n'est retenu.

---

## Résultat attendu

À la fin, le script affiche :

```
authenticated test performed : true|false
real library playlist        : true|false
home -> search / search -> home : true|false / true|false
home -> library / library -> home : true|false / true|false
android back returns home    : true|false
resumed after background     : true|false
navigation coverage complete : true|false
last route category          : home|search|library|...
first defective condition    : <catégorie ou not_observed>
credentials captured         : false (by construction)
```

**Interprétation.**
- `authenticated test performed = true` **et** `real library playlist = true` : une session réellement connectée a été observée, avec du contenu réel. C'est la condition minimale pour parler de validation authentifiée.
- L'un des deux à `false` : la session n'était pas réellement active pendant la fenêtre. **Ce n'est pas un échec du P0**, c'est une observation incomplète — relancez avec une fenêtre plus longue.
- `first defective condition` différent de `not_observed` : le harness a relevé une condition anormale sur l'accueil connecté. C'est le point de départ d'un diagnostic ciblé.

## Ce qu'il faut me renvoyer

Uniquement le fichier `resultats/authenticated-observation.json` et la sortie texte du script. **Ne renvoyez jamais** de mot de passe, cookie, jeton, capture d'écran de la page de connexion, ni export de données de compte.

---

## Reproduire la comparaison téléphone / tablette

Exécutez le protocole **deux fois**, une fois sur un téléphone, une fois sur une tablette ≥ 600 dp de largeur, **avec les deux APK du même run**. Notez pour chaque exécution :

- le SHA-256 des APK (affiché par le script) ;
- le modèle, la version d'Android, la densité et la résolution (`adb shell wm size`, `adb shell wm density`) ;
- l'orientation ;
- l'heure de lancement.

La comparaison des catégories de route et des conditions défectueuses entre les deux appareils est ce qui permettra de dire si le délai du téléphone persiste **une fois connecté**, ou s'il est propre au parcours de connexion.

---

## Limites assumées

- Ce protocole exige un **appareil réel ou un émulateur local** que vous contrôlez. La CI ne peut pas offrir de saisie interactive : ses émulateurs ne vous sont pas accessibles, et il serait contraire aux règles de sécurité d'y faire transiter vos identifiants.
- Le lecteur, `MediaSessionCompat` et les notifications ne sont pas encore vérifiés automatiquement dans ce mode ; la lecture réelle est observée mais pas mesurée échantillon par échantillon.
- Aucune session authentifiée n'a été testée à ce jour. **Tant que ce protocole n'aura pas été exécuté, le P0 ne peut pas être déclaré résolu.**
