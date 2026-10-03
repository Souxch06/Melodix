# Audit SpotiDuck → moteur Melodix

Date : 2026-10-03

## Portée et sources réellement disponibles

L'audit distingue les affirmations publiées du code effectivement inspectable.

Sources disponibles :

- dépôt officiel de distribution : <https://github.com/23fpsz/SpotiDuck-Releases> ;
- README, captures, workflows de statut/adblock et APK de release ;
- licence affichée par ce dépôt : GNU GPL v3 ;
- documentation Melodix existante : `docs/ANALYSE-CONNEXION.md` ;
- code source Melodix au commit `938106c`.

Le dépôt officiel SpotiDuck est un dépôt de **releases**. Son arbre public ne
contient pas le code Kotlin du player v1.2.1 : seulement README, LICENSE,
workflows, captures et liste de blocage. La release courante dit être produite
à partir d'un dépôt privé. Aucun tag/source v1.2.1 vérifiable n'est présent dans
l'arbre public observé. Une licence GPL-3.0 dans un dépôt de distribution ne
permet donc pas de prétendre avoir audité ou réutilisé un fichier source absent.

Conséquence : **aucun code SpotiDuck n'est copié dans Melodix**. Les concepts
ci-dessous viennent des fonctions publiquement annoncées ; leur implémentation
interne exacte reste non vérifiable sans source correspondante.

## Ce que fait réellement l'architecture publiée de SpotiDuck

SpotiDuck est présenté par son auteur comme un wrapper Android du Spotify Web
Player :

```text
WebView Android
  └── open.spotify.com
        ├── catalogue / bibliothèque / queue Spotify
        ├── player Web Spotify
        └── audio Spotify protégé (Widevine requis)

état/commandes Web observés ou injectés
  └── service Android / MediaSession / notification / lock screen
```

### Répartition fonctionnelle

| Fonction                           | Responsable dans le modèle SpotiDuck         | Preuve disponible                 | Transposition Melodix                                             |
| ---------------------------------- | -------------------------------------------- | --------------------------------- | ----------------------------------------------------------------- |
| Métadonnées, catalogue, recherche  | page `open.spotify.com`                      | README public                     | Non : Melodix utilise son OAuth/API et ses modèles                |
| Source audio                       | Spotify Web Player dans la WebView           | README public, avertissement DRM  | Non : Widevine et contrôle Web non validés                        |
| Matching Spotify → autre audio     | Aucun mécanisme publié                       | aucune source ni description      | Non applicable à SpotiDuck ; Melodix conserve son matcher         |
| Queue, next/previous, seek, repeat | player Web Spotify                           | fonctions annoncées, code absent  | Non réutilisable ; Melodix les possède dans `services/player.ts`  |
| État et métadonnées natifs         | projection Web → Android annoncée            | notification/lock screen annoncés | Concept seulement ; Melodix projette son propre état audio réel   |
| Background                         | service Android annoncé autour de la WebView | README public                     | Concept seulement ; le moteur audio Melodix reste `expo-av`       |
| Session                            | cookies normaux de WebView                   | comportement WebView annoncé      | Prototype uniquement ; aucun cookie ne sort vers RN               |
| Erreurs/retry/réseau               | compatibilité et retry annoncés              | README, avertissements de panne   | Concept générique ; aucune implémentation réutilisable vérifiable |
| Cache                              | cache WebView/service worker éventuel        | non démontré pour v1.2.1          | Non repris                                                        |
| Fallback audio                     | aucun Audius/YouTube publié                  | aucune preuve                     | Architecture propre à Melodix                                     |

SpotiDuck ne démontre donc pas une architecture « interface native indépendante

- Spotify comme moteur pilotable ». Il conserve le lecteur, la queue et l'audio
  dans la page Spotify, puis annonce des intégrations Android autour de cette
  page. C'est structurellement différent de Melodix.

## Éléments intéressants et décision

### Concepts transposables sans copier de code

1. **Une source de vérité unique** pour état, métadonnées et commandes.
   - Melodix : `services/player.ts`.
   - Projection : `services/mediaBridge.ts`, sans logique de queue dupliquée.
2. **Foreground service + MediaSession + notification** comme projections du
   player réel, jamais comme preuve de lecture.
3. **Commandes système renvoyées vers les mêmes méthodes que l'UI**.
4. **Persistance explicite et lifecycle robuste**, sans autoplay au démarrage.
5. **Diagnostic séparant page chargée, source résolue, Sound chargé, buffering
   et lecture réellement confirmée**.

Ces idées sont des principes d'architecture généraux ; aucun code SpotiDuck
n'est nécessaire pour les appliquer.

### Éléments non transposables

- user-agent usurpé pour obtenir un comportement Spotify différent ;
- bloqueur visant les publicités ou endpoints Spotify ;
- scraping/injection DOM comme contrat de production ;
- extraction, sauvegarde ou transfert de cookies/tokens Web ;
- endpoint Spotify privé ;
- interception réseau, DRM, licence ou flux protégé ;
- commandes supposées à partir de `navigator.mediaSession` ;
- code décompilé ou source dont la provenance/licence ne peut pas être établie.

## Audit du moteur Melodix au HEAD 938106c

### Chaîne audio réelle

```text
Spotify/API ou Audius metadata
  → PlayerTrack (ID logique, titre, artistes, album, durée, ISRC)
  → TrackResolver
      1. Audius
      2. YouTube fallback
      3. indisponible si aucun match fiable
  → URL provider
  → expo-av Audio.Sound
  → PlayerState
  → PlayerContext + UI
  → mediaBridge
  → Media3 MediaSessionService / notification
```

### Capacités déjà présentes

- score partagé Audius/YouTube ;
- ISRC exact, titre normalisé, artiste principal/secondaires, album, durée ;
- classification explicit/clean conservée de Spotify au matcher et à la reprise ;
- portes dures contre remix/live/acoustic/instrumental/karaoke incorrects ;
- refus sous seuil, jamais « premier résultat » ;
- distinction `no-match` / panne provider pour ne pas mettre une panne réseau
  en cache négatif ;
- fallback Audius → YouTube sur matching et sur flux Audius mort ;
- queue, ajout, « lire ensuite », suppression, réorganisation ;
- shuffle avec ordre séparé et index logique conservé ;
- repeat off/all/one ;
- pause, reprise, seek, volume, fin automatique et skip des indisponibles ;
- protection contre résolutions/Sounds/commandes asynchrones obsolètes ;
- session locale versionnée et fenêtrée, sans autoplay au boot ;
- état loading et buffering séparés ;
- UI mini/full player avec progression, durée, commandes, volume et provider ;
- projection MediaSession de l'état du moteur et commandes Android vers les
  méthodes publiques du même moteur.

### Point corrigé dans cette étape

Avant cette étape, le player publiait `playing` immédiatement après le retour
de `Audio.Sound.createAsync({ shouldPlay: true })`. Un Sound construit n'est pas
une preuve que l'audio joue réellement.

La règle retenue est désormais :

- `loading` tant que le runtime est en buffering ;
- `paused` si expo-av confirme chargé mais `isPlaying=false` ;
- `playing` uniquement après un statut expo-av `isPlaying=true` ;
- historique et diagnostic `PLAYBACK_STARTED` seulement après cette même
  confirmation.

## Architecture retenue

Le prototype Spotify Web reste isolé et diagnostique. Le backend de production
reste :

```text
Melodix UI
  → PlayerContext
  → services/player.ts
  → Audius
  → YouTube fallback
  → expo-av
  → mediaBridge
  → Android MediaSession / notification
```

Spotify reste une source d'identité et de métadonnées, pas une source audio
implicite. `SpotifyWebBackend` n'est pas raccordé au `PlayerContext` et ses
commandes non démontrées ne deviennent pas des commandes de production.

## Limites de validation

Les tests unitaires peuvent valider les décisions, transitions et commandes.
Ils ne prouvent pas qu'un haut-parleur physique émet du son, qu'un constructeur
Android conserve le processus, ni que les boutons Bluetooth/lock screen sont
fonctionnels sur un téléphone donné. Ces points exigent un test physique.
