# Architecture audio Melodix : métadonnées Spotify (via backend), audio Audius

> **Historique (Melodix 2.0) → Melodix 3.0.** Ce document date de la période où
> le client parlait directement à l'API Spotify (« Spotify = données »). Depuis
> Melodix 3.0, **aucune authentification ni aucun appel Spotify n'existe plus
> dans l'application** : les métadonnées viennent du backend Melodix
> (voir `docs/ETAPES-BACKEND.md`) en JSON normalisé. Le pipeline audio ci-dessous
> (abstraction `AudioProvider`, AudiusAudioProvider, matching fiable, cache
> métadonnées → audius:id) est **inchangé** : le matching ne dépendait que des
> métadonnées, pas de leur canal.


Ce document décrit comment Melodix sépare **compte/données** (Spotify) et
**audio** (fournisseur, Audius par défaut), comment la correspondance entre
morceaux est garantie fiable, et comment tout cela est testé.

```
                 MELODIX
                    │
        ┌───────────┴───────────┐
        │                       │
    SPOTIFY                   AUDIUS
        │                       │
  Authentification        AudioProvider (abstraction)
  Profil                  └─ AudiusAudioProvider
  Playlists               Recherche + matching fiable
  Bibliothèque            Streaming /v1/tracks/{id}/stream
  Métadonnées             Cache spotify:id → audius:id
        │                       │
        └───────────┬───────────┘
                    │
               Lecteur Melodix
            (services/player.ts)
```

## 1. Connexion obligatoire

Un utilisateur non connecté n'a accès à rien : la route racine
(`app/index.tsx`) redirige vers `/login` tant qu'aucune session valide
(`getSessionToken()`, renouvelée automatiquement) n'existe. La connexion est
le **flux officiel Spotify OAuth 2.0 Authorization Code + PKCE** — la page de
Spotify propose à l'utilisateur ses méthodes (identifiants, Google, Apple,
Facebook…) ; Melodix n'a pas besoin de les gérer et casse donc rarement quand
Spotify fait évoluer sa page. Aucun Client ID n'est demandé à l'utilisateur :
l'identifiant est **intégré au build** (`SPOTIFY_CLIENT_ID` →
`app.config.js → extra.clientID` ; variable de dépôt dans le workflow de
l'APK). Sans Client ID intégré, l'écran affiche « Connexion non configurée »
avec un lien vers la documentation mainteneur — jamais de formulaire.

Contraintes Spotify à respecter (impossible de distribution publique sans
elles) :

- le compte propriétaire de l'application Spotify doit être **Premium** ;
- l'application en mode développement est limitée à **5 utilisateurs** listés
  dans *User Management* ;
- pour ouvrir au public, il faut demander à Spotify l'*extended quota mode*.
  Ces règles n'autorisent **aucun contournement** ; la solution est côté
  maintien (Client ID intégré + éventuelle demande de quota).

Cycle de session : stockage chiffré local (AsyncStorage) → renouvellement
automatique à l'expiration (requête unique partagée) → message propre sur
l'écran de connexion si le token est définitivement refusé → déconnexion =
stop du lecteur + purge + retour `/login`. Le retour `melodix://callback` est
intercepté (`app/+native-intent.tsx`) : pas de page blanche.

## 2. L'abstraction audio

`services/audio/types.ts` définit `AudioProvider` :

| Méthode | Rôle |
| :-- | :-- |
| `matches(query)` | candidats scorés (transparence / tests) |
| `resolveMatch(query)` | **meilleur** match fiable ou `null` |
| `resolveSource(id)` | URL de stream d'une piste native du provider |

`services/audio/index.ts` est le registre (`getAudioProvider`, id par défaut
`'audius'`). Le lecteur ne connaît que l'interface ; ajouter un provider =
implémenter l'interface + s'enregistrer.

## 3. Le lecteur (services/player.ts)

- La file d'attente mélange des sources : `{ provider: null, id }` (métadonnées
  Spotify, à matcher) et `{ provider: 'audius', id }` (joué directement).
- Contrôles : lecture/pause, précédent (reprend le titre après 3 s, sinon
  recule), suivant, **aléatoire** (ordre mélangé, titre courant en tête),
  **répétition** off → toute la file → un titre, **seek** (barre +
  clamp), **volume** (appliqué au son courant), fond en arrière-plan
  (mode audio expo).
- Indisponibilité : si aucun match fiable n'existe ou si le stream tombe, le
  lecteur émet un *notice* (« Ce titre n'est pas disponible sur Audius. »),
  marque la piste comme échouée pour la session et **passe à la suivante
  jouable** ; quand plus rien n'est jouable, la session s'arrête. **Jamais
  de substitution** par un morceau au titre vaguement ressemblant.
- Mini-lecteur au-dessus des onglets (toutes les vues) + lecteur plein écran
  `/player` (œuvre, seek, contrôles, volume, file d'attente tactile, badge du
  provider).

## 4. Matching Spotify → Audius

`services/audio/audiusTrackMatcher.ts` :

1. **Normalisation** (`normalizeTitleText`) : casse, accents, tirets
   typographiques, ellipses, espaces, ponctuation terminale ; variantes de
   titre « canonique » (parenthèses, suffixes « feat./ft./featuring/with »,
   queues « - remix/live/radio edit/remastered 2013… ») ;
   `normalizeAlbumText` retire les désignations d'édition (Deluxe, Expanded,
   Remastered + année…) ; `normalizeArtistText` retire articles et points
   finaux. Les artistes présents dans « feat. » sont extraits du titre et
   ajoutés à la liste comparée.
2. **Recherche** : jusqu'à 3 requêtes (`titre+artiste principal`, puis
   variantes) sur Audius (`/search`, repli `/tracks/search`).
3. **Score** : titre (exact 35+5 / préfixe 18 / sinon rejet), artistes
   (recouvrement borné 25, **rejet si aucun artiste commun**), album
   (15/7), durée (tolérances ±3 s/±8 s/±15 s → 20/12/5, inconnue = neutre).
   Seuil d'acceptation **55/100** + accord de titre obligatoire. En dessous :
   `null` = « non disponible ».
4. **Cache** `@melodix/match-cache` (JSON versionné) : `clé source`
   (`spotify:<trackId>`) → `{ matchId (audius ou null = négatif), score,
   matchedAt }`. TTL 30 jours au chargement, 500 entrées max à l'écriture
   (les plus anciennes purgées), invalidation immédiate quand un stream mis
   en cache ne répond plus (+ **une** nouvelle recherche en ligne).

Recherche d'image de couverture/podcasts : inchangée (Spotify). Les morceaux
« récemment joués » Spotify : l'endpoint historique n'existe plus depuis
février 2026 ; cette donnée personnelle reste indisponible et l'écran d'accueil
reste identique à la 1.2.x.

## 5. Ce que Melodix ne fait pas

- Aucun téléchargement, extraction, réhébergement ou proxy de l'audio Spotify.
- Aucun contournement des limitations ou publicités du lecteur Spotify (il
  n'est tout simplement pas utilisé). Melodix n'est pas « du Premium
  gratuit » : c'est une app indépendante, les morceaux que le catalogue
  Audius n'héberge pas ne se jouent pas.
- Aucun mot de passe ni Client Secret stocké.

## 6. Couverture des tests (checklist §16)

| Test demandé | Couverture |
| :-- | :-- |
| 1–2 App sans session → écran de connexion | Garde `app/index.tsx` (règle testée par `resolveInitialSource` → remplacée par session gate ; à vérifier manuellement sur appareil : lancer sans session → `/login`) |
| 3–6 Connexion OAuth + méthodes Spotify + retour + profil | Rectangle de test manuel (page officielle Spotify = non pilotable en unitaire) ; `LoginScreen` vérifie le token (`verifySpotifyToken`) avant de charger le profil (`reloadUserData`) |
| 7–8 Persistance | `api/config/__tests__/session.unit.test.ts` (stockage, refresh, mode) |
| 9–10 Expiration + reconnexion | `sessionGuard.unit.test.ts` (refus /me → reconnexion propre) |
| 11 Déconnexion | session tests + `signOut` arrête le lecteur (context) ; vérif. manuelle |
| 12–15 Playlist Spotify → recherche Audius → bon morceau | `audiusTrackMatcher.unit.test.ts`, `audiusAudioProvider.unit.test.ts`, `player.unit.test.ts` (file d'attente Spotify-source) |
| 16–17 lecture/pause/précédent/suivant | `player.unit.test.ts` (toggle, prev >3 s reprend, recule sinon) |
| 18 seek | `player.unit.test.ts` (clamp + setPositionAsync) |
| 19 shuffle/repeat | `player.unit.test.ts` (ordre, wrap, single) |
| 20 passage auto au suivant | `player.unit.test.ts` (didJustFinish) |
| 21–22 morceau absent → notice + skip, **jamais** de substitution | `matchSongs` (rejet titre proche / artiste étranger), player (notice + skip + arrêt fin de file), provider (null propre) |
| 23 plusieurs morceaux d'affilée | `player.unit.test.ts` (file de 2/3/4 pistes) |
| 24 cache des correspondances | `matchCache.unit.test.ts` + player (hit → pas de recherche, négatif, TTL) |

Tests unitaires : `yarn test:unit`. Les tests manuels de bout en bout restent
à effectuer sur appareil/émulateur (Expo Go ou APK) : leurs résultats sont
consignés dans la table ci-dessus et dans le journal des versions.
