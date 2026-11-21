# Diagnostic connexion — APK v1.3.1-glass (tablette)

Analyse demandée en deux temps : d'abord la question d'authentification (aucune
ligne de code applicatif modifiée pour l'instant), ensuite les corrections
visuelles. Ce document consigne les preuves pour que la conclusion soit
vérifiable, pas une intuition.

## 1. Les deux `cookie` ne parlent pas du même cookie

| Valeur observée | Où elle est calculée | Ce qu'elle mesure |
|---|---|---|
| `cookie_sp_dc=true` (en-tête) | `smali/com/melodix/music/MainActivity.smali:8116` → `CookieManager.getInstance().getCookie("https://open.spotify.com/")` puis `contains("sp_dc=")` (lignes 8122-8143) | **présence** du cookie `sp_dc` dans le magasin du WebView, lu côté natif |
| `cookie=non` (carte) | `scripts/native_ui_shell.source.js:1399` → `diag.cookieSession` | le même cookie, mais lu **depuis la page** par `scripts/spotify_bridge.source.js:3033` |

```js
// scripts/spotify_bridge.source.js:3033
function hasSpotifySessionCookie() {
    try { return /(?:^|;\s*)sp_dc=/.test(String(document.cookie || '')); }
    catch (_) { return false; }
}
```

### Pourquoi les deux divergent — et c'est normal

`sp_dc` est un cookie `HttpOnly` (c'est le porteur de la session Spotify, il ne
doit jamais être lisible en JavaScript). Or `document.cookie` **ne voit jamais
un cookie `HttpOnly`**. `cookieSession` ne peut donc valoir `true` que si
Spotify retire un jour `HttpOnly`, c'est-à-dire pratiquement jamais.

Les deux champs ne sont pas deux mesures du même fait :

- `cookie_sp_dc=true` : « le WebView possède bien un cookie de session » ;
- `cookie=non` : « la page n'a pas pu lire ce cookie » — attendu, sans
  information sur l'état réel de la session.

**Conclusion partielle : `cookie=non` n'est pas un symptôme**, c'est le
comportement normal d'un cookie `HttpOnly`. Le champ est trompeur (il suggère
une absence de session) ; il est exploitable, au mieux, comme indicateur
inverse. À remplacer à terme par un fait observable côté page
(`__NEXT_DATA__`, `session` dans le bootstrap, ou code HTTP de l'appel de
vérification).

## 2. `clear-oncreate` et `clear-accounts`

Ce ne sont pas des fonctions : ce sont des **étiquettes de journal** produites
par `AppSingleton.proofTraceValue(String, boolean)`
(`smali/com/melodix/music/AppSingleton.smali:2245` et `:2218`). Elles
enregistrent, à chaque écriture, **la valeur réellement stockée** dans
`AppSingleton.B` (le drapeau de session confirmée, uniquement en mémoire).

| Étiquette | Site d'appel | Efface quoi | Quand |
|---|---|---|---|
| `clear-oncreate=T` | `AppSingleton.smali:666` (constructeur statique) | `B = 0` : le **drapeau mémoire** de session repart à « non confirmée ». **Aucun cookie, aucun storage, aucun `LoggedIn`.** | une fois par démarrage de process |
| `clear-accounts=T` | `smali/c91.smali:698` (`onPageFinished`) | `B = 0` **et** supprime la clé `LoggedIn` des SharedPreferences. **Pas de cookie.** | à chaque chargement de page sur `accounts.spotify.com` |
| `clear-left-player` | `smali/c91.smali:737` | idem, quand `onPageFinished` a quitté `open.spotify.com` avec `B` encore vrai | à chaque page hors du lecteur |

Le commentaire du code est explicite (`AppSingleton.smali:655`) : « Startup
never trusts a persisted login marker: auth always starts unconfirmed ».

- Effet d'un démarrage : la session **Spotify** (cookies) survit, seule la
  *confirmation* est oubliée puis re-prouvée par l'UI du lecteur.
- Une ligne `clear-accounts=T` signifie qu'une page `accounts.spotify.com` a
  été chargée — c'est-à-dire que l'app **a demandé la connexion**. C'est
  cohérent avec `loginN=6`.
- Rien dans ces sites ne supprime de cookie ni de données de session : ils ne
  peuvent pas « déconnecter » l'utilisateur.

## 3. Régression ? Non — comparaison binaire

Comparaison des assets réellement embarqués (même liste de fichiers, contenu
haché) : `releases/Melodix-Test-v1.2.2-test118.apk` (dernière build avant la
refonte) vs `releases/Melodix-Test-v1.3.1-glass.apk` :

| Asset | test.118 → v1.3.1 |
|---|---|
| `classic_login.js`, `desktop_spoof.js`, `google_spoof.js`, `facebook_consent.js`, `playlist_sort.js`, `spotify_sw_compat.js` | **identiques octet pour octet** |
| `native_ui_shell.js` (source de la carte et du diagnostic) | **identique** |
| `runtime_state.js`, `runtime_diagnostic.js`, `melodix_home.js`, `native_home_fallback.js` | **identiques** |
| `spotify_bridge.js` | modifié — **uniquement** barre d'onglets, clavier, historique |
| `css_hacks.css` | modifié — thème |

Côté code, le diff complet de `scripts/spotify_bridge.source.js` depuis la base
(`7cd79bd`) ne contient **aucune** ligne touchant `fetch`, `credentials`,
`Authorization`, `sp_dc`, `/api/token`, `get_access_token`, `loginDetected` ou
l'état d'authentification. Recherche exhaustive :

```
git diff 7cd79bd..HEAD -- smali/     → MelColors.smali uniquement (couleurs)
git diff 7cd79bd..HEAD -- assets/*.js scripts/*.js
    filtré sur sp_dc|credentials|Authorization|bearer|api/token|authState|loginDetected
    → aucune ligne
```

Côté CSS, une seule règle `display:none` a été **ajoutée** par nos commits
(`assets/css_hacks.css:1743`) et elle est confinée :

```css
@media screen and (max-width: 820px) {
    body.sf-keyboard-open #sf-mobile-nav { display: none !important; }
}
```

Elle ne cible que la barre d'onglets et seulement quand un champ éditable a le
focus. Aucune règle de masquage n'a été supprimée (`0` suppression de
`display: none` sur toute la refonte). Les variables `--background-*` /
`--text-*` d'Encore ne sont **plus redéfinies** par la feuille (les anciennes
redéfinitions ont disparu) ; `.encore-dark-theme` n'est touché que par le mode
AMOLED optionnel du bridge, inchangé depuis test.118.

**Conclusion : ce n'est pas une régression de la refonte.** Les composants qui
décident de la connexion sont byte-identiques à la dernière version connue
comme fonctionnelle.

## 4. Ce que les codes HTTP disent vraiment

| Code | Origine | Signification |
|---|---|---|
| `http-401` (carte, `erreur=`) | requête de bibliothèque `libraryV3` | le jeton présenté a été refusé |
| `token=ko-http403` | `fetchWebPlayerToken` (`spotify_bridge.source.js:3041`) | `GET /api/token` **et** le repli `GET /get_access_token?reason=transport&productType=web_player` ont tous deux répondu 403 |

Un 403 sur `get_access_token` n'est pas un jeton expiré : c'est Spotify qui
refuse de délivrer un jeton à ce client. Les causes plausibles, dans l'ordre :

1. **empreinte client** : l'app envoie un `spotify-app-version: 1.2.40.0` figé
   avec un couple `User-Agent`/`app-platform` qui ne correspond plus à la
   version réelle du web player. Spotify refuse alors la délivrance de jeton
   aux clients qu'il ne reconnaît pas.
2. **session réellement expirée/révoquée** côté compte (le cookie `sp_dc`
   existe encore, mais ne donne plus droit à un jeton).
3. **test A/B ou restriction** sur le compte/la région.

Le point 1 est le plus probable : rien dans le code ne lit la version réelle du
player, la valeur est figée à `1.2.40.0`. C'est un problème **antérieur** à la
refonte (le même littéral existe dans test.118).

## 5. Ce qu'il me manque pour trancher

Je ne modifie pas la logique d'authentification, de spoof ni de blocage sans
preuve. Pour départager « client refusé » de « session morte », il me faut
**une** de ces trois choses :

1. **Le journal complet** de la carte, déplié : il contient déjà les lignes
   `library-fetch phase=… http=… bearer=…` et `token-endpoint status=…`. Un
   `bearer=1 token=ko-http403` prouve le point 1 (jeton délivré par le player
   mais refusé à l'usage) ; `token=ko-http403` **seul**, avec un player
   connecté à l'écran, prouve aussi le point 1.
2. **La version réelle du web player** que Spotify sert à cet appareil : ouvrir
   `open.spotify.com`, puis dans le diagnostic copié chercher la ligne
   `web-player_<date>_<…>` (elle est déjà générée par le bridge et journalisée).
3. **Un test de contrôle** : se déconnecter dans l'app (Réglages → session),
   se reconnecter sur `accounts.spotify.com`, et renvoyer la carte. Si le 403
   persiste **après** une connexion fraîche, la session est hors de cause et
   c'est bien l'empreinte client.

## 6. Correction proposée (à valider avant application)

Le champ `cookie=non` est trompeur et coûte un aller-retour de diagnostic à
chaque rapport. Correction minimale, sans toucher à l'authentification :
renommer le champ en `sp_dc_http_only=oui|non` côté
`native_ui_shell.source.js:1399`… **impossible** : `native_ui_shell.js` doit
rester byte-identique pour garantir l'absence de régression. La correction
correcte est donc de faire dire au natif ce qu'il sait déjà
(`cookie_sp_dc=true`) et de **retirer** `cookie=` de la carte, en laissant
l'en-tête natif comme seule source. C'est un changement de la carte, pas de la
logique — je le propose, je ne l'applique pas sans accord.
