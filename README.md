<p align="center">
  <img src="docs/melodix-banner.svg" alt="Melodix — Ton univers musical, dans ta poche." width="100%">
</p>

<p align="center">
  <a href="https://github.com/Souxch06/Melodix/releases/latest"><img alt="Dernière version" src="https://img.shields.io/github/v/release/Souxch06/Melodix?label=version&color=1ed760"></a>
  <a href="https://github.com/Souxch06/Melodix/releases/latest"><img alt="APK Android" src="https://img.shields.io/badge/Android-APK-3ddc84?logo=android&logoColor=white"></a>
  <img alt="Expo SDK 51" src="https://img.shields.io/badge/Expo-SDK%2051-000020?logo=expo&logoColor=white">
  <img alt="React Native 0.74" src="https://img.shields.io/badge/React%20Native-0.74-087ea4?logo=react&logoColor=white">
  <img alt="TypeScript 5.3" src="https://img.shields.io/badge/TypeScript-5.3-3178c6?logo=typescript&logoColor=white">
  <a href="LICENSE"><img alt="Licence MIT" src="https://img.shields.io/badge/licence-MIT-blue"></a>
</p>

<p align="center">
  <strong>Melodix</strong> transforme ton compte Spotify en tableau de bord musical de poche :<br>
  écoutes récentes, favoris du moment, recherche et toute ta bibliothèque, dans une interface sombre et animée.
</p>

<p align="center">
  <a href="#installer-lapk-android">Installer l'APK</a> •
  <a href="#fonctionnalités">Fonctionnalités</a> •
  <a href="#développement">Développement</a> •
  <a href="#état-du-projet">État du projet</a> •
  <a href="https://github.com/Souxch06/Melodix/releases">Téléchargements</a>
</p>

## Installer l'APK (Android)

1. Sur ton téléphone, ouvre la [dernière version](https://github.com/Souxch06/Melodix/releases/latest) et télécharge le fichier **`Melodix-v….apk`** (section *Assets*).
2. Ouvre le fichier téléchargé. Android te demande d'autoriser l'installation d'applications depuis ton navigateur ou ton gestionnaire de fichiers : accepte, puis appuie sur **Installer**.
3. Lance Melodix et suis la [configuration Spotify](#configurer-spotify) : elle ne se fait qu'une fois.

> [!NOTE]
> Compatible Android 6.0 et plus (processeurs ARM, soit la quasi-totalité des téléphones). Comme l'app ne vient pas du Play Store, Android peut afficher un avertissement Play Protect : c'est normal pour une application installée manuellement.

## Configurer Spotify

Spotify n'autorise la connexion qu'aux applications déclarées sur son portail développeur : Melodix utilise donc **ta propre application Spotify**. C'est gratuit, mais le compte qui crée l'application doit avoir un abonnement **Spotify Premium** (règle Spotify depuis février 2026).

1. Ouvre le [tableau de bord Spotify for Developers](https://developer.spotify.com/dashboard), connecte-toi et clique sur **Create app**.
2. Donne-lui un nom (par exemple « Melodix »), coche **Web API**, et dans **Redirect URIs** ajoute exactement :

   ```text
   melodix://callback
   ```

3. Enregistre, puis copie le **Client ID** affiché dans les paramètres de l'application.
4. Dans **User Management**, ajoute le nom et l'e-mail du compte Spotify de chaque personne qui utilisera l'app (5 au maximum).
5. Dans Melodix, colle le Client ID, appuie sur **Continue**, puis sur **Sign in with Spotify**.

Aucun mot de passe ni *Client Secret* n'est demandé : la connexion se fait sur la page officielle de Spotify (flux OAuth *Authorization Code + PKCE*).

## Fonctionnalités

| Écran | Ce que tu y trouves |
| :-- | :-- |
| **Connexion** | Connexion sur la page officielle de Spotify, configuration du Client ID au premier lancement. |
| **Accueil** | Écoutes récentes, albums et artistes du moment, tes playlists. |
| **Recherche** | Recherche d'artistes, de titres, d'albums et de playlists dans tout le catalogue Spotify. |
| **Bibliothèque** | Playlists, podcasts, albums et artistes suivis, filtrables par catégorie avec transitions animées. |
| **Album** | Pochette sur fond dégradé, artistes, liste des titres, autres albums de l'artiste et mentions de copyright. |
| **Playlist** | Couverture, description, créateur, nombre d'abonnés et liste des titres. |

Ta bibliothèque et ton profil sont mis en cache sur l'appareil pour que l'app s'ouvre plus vite.

> [!NOTE]
> Melodix sert à **explorer** ta musique : l'application ne lit pas les morceaux.

## Stack technique

- **Expo SDK 51** et **React Native 0.74** (React 18), entièrement en **TypeScript**
- **Expo Router** : navigation par fichiers, avec onglets et piles d'écrans
- **Reanimated** et **Gesture Handler** pour les animations et les gestes
- **expo-auth-session** (OAuth PKCE), **Axios** (API Web Spotify) et **AsyncStorage** (session)
- **Jest** et **Testing Library**, **ESLint**, **Prettier** et **Husky**
- **GitHub Actions** pour construire l'APK

## Développement

### Prérequis

- **Node.js 20** (voir `.nvmrc`) et **Yarn 1.22** ou plus récent
- Un **émulateur Android** ou le **simulateur iOS** (sur Mac) : la CLI Expo y installe automatiquement la version d'Expo Go adaptée au SDK 51. Les versions d'Expo Go des stores ne prennent plus en charge ce SDK : sur un vrai téléphone, cherche une version compatible sur [expo.dev/go](https://expo.dev/go) (Android) ou utilise un build de développement (`npx expo run:android` / `npx expo run:ios`).
- Une application Spotify (voir [Configurer Spotify](#configurer-spotify))

### Installer et lancer

```bash
git clone https://github.com/Souxch06/Melodix.git
cd Melodix
nvm use        # facultatif : bascule sur Node 20
yarn install
yarn dev       # démarre Expo (appuie sur « a » pour Android, « i » pour iOS)
```

Au premier lancement, l'écran de connexion demande le Client ID et affiche l'**URI de redirection à déclarer** dans ton application Spotify. Avec Expo Go, elle ressemble à `exp://192.168.1.20:8080/--/callback` ; dans l'app installée, c'est `melodix://callback`.

Pour ne pas avoir à saisir le Client ID, tu peux le fournir dans un fichier `.env` à la racine (déjà ignoré par Git) :

```dotenv
SPOTIFY_CLIENT_ID=ton_client_id
```

### Construire l'APK

Le workflow [`.github/workflows/android-apk.yml`](.github/workflows/android-apk.yml) construit l'APK sur les serveurs de GitHub :

- à chaque **pull request** (APK disponible dans les *artifacts* du workflow) ;
- à la demande, depuis l'onglet **Actions → APK Android → Run workflow** ;
- à chaque **release publiée** : l'APK est automatiquement joint à la release.

Pour intégrer ton Client ID à l'APK, crée la variable de dépôt `SPOTIFY_CLIENT_ID` (*Settings → Secrets and variables → Actions → Variables*). Sans elle, l'app le demande au premier lancement.

En local (Android Studio et JDK 17 requis) :

```bash
npx expo prebuild --platform android
cd android && ./gradlew assembleRelease
# → android/app/build/outputs/apk/release/app-release.apk
```

### Scripts utiles

| Commande | Rôle |
| :-- | :-- |
| `yarn dev` | Démarre le serveur Expo (port 8080) |
| `yarn dev:android` / `yarn dev:ios` | Démarre Expo et ouvre l'app sur Android / iOS |
| `yarn test` | Lance les tests Jest (`test:watch` et `test:coverage` disponibles) |
| `yarn lint` | Analyse le code avec ESLint |
| `yarn prettier:check` / `yarn prettier:write` | Vérifie / applique le formatage Prettier |
| `yarn bump-to-support` | Aligne les dépendances sur les versions prises en charge par le SDK Expo |

### Structure du projet

```text
Melodix/
├── app/          # Routes Expo Router : connexion, onglets (accueil, recherche, bibliothèque), pages de détail
├── screens/      # Écrans : connexion, album, playlist…
├── components/   # Composants d'interface : sections de l'accueil, recherche, bibliothèque, aperçus, cartes…
├── navigators/   # Barre d'onglets personnalisée
├── api/          # Appels à l'API Web Spotify, session et Client ID
├── models/       # Types des données affichées
├── utils/        # Conversion des réponses de l'API en modèles, fonctions utilitaires
├── context/      # États partagés : utilisateur, catégorie de bibliothèque
├── config/       # Couleurs, constantes, types, valeurs de repli
├── data/         # Textes de l'interface
├── hooks/        # Hooks React personnalisés
└── assets/       # Polices, icônes et images
```

Les imports utilisent des alias TypeScript (`@api`, `@components`, `@config`…) définis dans `tsconfig.json`.

## État du projet

Spotify a fortement restreint son API ces dernières années. Voici où en est Melodix :

| Sujet | État | Détail |
| :-- | :-: | :-- |
| Connexion Spotify | ✅ | Flux *Authorization Code + PKCE*, qui remplace l'*Implicit Grant* [supprimé par Spotify le 27 novembre 2025](https://developer.spotify.com/blog/2025-10-14-reminder-oauth-migration-27-nov-2025). Aucun secret dans l'app. |
| API Spotify 2026 | ✅ | Adaptée aux [changements de février 2026](https://developer.spotify.com/documentation/web-api/references/changes/february-2026) : nouveaux endpoints de bibliothèque et de playlists. |
| Recherche | ✅ | Catalogue complet, 10 résultats maximum par type (limite imposée par Spotify). |
| Playlists populaires | ⚠️ | Fermées aux nouvelles applications depuis le [27 novembre 2024](https://developer.spotify.com/blog/2024-11-27-changes-to-the-web-api) : la section est masquée. |
| Titres des playlists | ℹ️ | Spotify ne fournit plus la liste des titres que pour les playlists que tu as créées ou que tu co-édites. |
| Mode développement | ℹ️ | [Depuis février 2026](https://developer.spotify.com/blog/2026-02-06-update-on-developer-access-and-platform-security) : compte Premium obligatoire pour le propriétaire de l'application Spotify, 5 utilisateurs autorisés. |
| Pages Artiste, Podcast, Épisode | 🚧 | Pas encore réalisées : elles n'affichent que l'identifiant de l'élément. |
| Langue | ℹ️ | L'interface est en anglais (textes dans `data/en-gb.ts`). |
| Signature de l'APK | ℹ️ | Clé de débogage standard : parfait pour l'installer toi-même, à remplacer par ta propre clé pour publier sur le Play Store. |

<sub>✅ fonctionnel · ⚠️ limité par Spotify · 🚧 à faire · ℹ️ à savoir</sub>

## Feuille de route

- [x] Connexion *Authorization Code + PKCE*
- [x] Adaptation à l'API Spotify de février 2026
- [x] Recherche dans le catalogue
- [x] Identité visuelle Melodix : nom, icône, écran de démarrage
- [x] APK Android construit automatiquement
- [ ] Pages Artiste, Podcast et Épisode
- [ ] Interface en français
- [ ] Signature de l'APK avec une clé dédiée

## Crédits et licence

- Melodix est basé sur le projet open source [spotify-clone](https://github.com/dhunanyan/spotify-clone) de [@dhunanyan](https://github.com/dhunanyan). Le code est distribué sous [licence MIT](LICENSE).
- L'icône, l'écran de démarrage et les visuels de Melodix sont des créations originales.
- Les données musicales proviennent de l'[API Web Spotify](https://developer.spotify.com/documentation/web-api). Melodix est un projet indépendant, ni affilié à Spotify AB ni approuvé par Spotify ; « Spotify » est une marque déposée de Spotify AB.
- Les polices SF Pro Display incluses sont la propriété d'Apple Inc. et relèvent de leur propre licence.

<p align="center">
  <sub>Maintenu par <a href="https://github.com/Souxch06">@Souxch06</a></sub>
</p>
