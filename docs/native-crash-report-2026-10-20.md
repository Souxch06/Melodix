# Démarrage : garde anti-plantage et rapport lisible — 20/10/2026

## Symptôme

La preview `v1.2.2-test.1-preview` (`source_ref 780b9d0…`) se ferme au lancement.
Aucun logcat disponible côté testeur : le plantage était donc invisible.

## Ce qui a été fait

1. **Drawables du shell natif résolus par nom.**
   `NativeUiRowFactory` et `NativeHomeShelfRenderer` n'utilisent plus d'ids
   binaires en dur (`0x7f08013d`, `0x7f08013e`, `0x7f080140`, `0x7f080141`).
   Deux helpers (`applyDrawableBackground`, `applyDrawableImage`) résolvent le
   nom via `Resources.getIdentifier` et ne font rien si l'id vaut 0. Un rebuild
   apktool qui renumérote un drawable ne peut donc plus produire de
   `Resources$NotFoundException` au premier rendu.

2. **Rapport de plantage lisible dans l'application.**
   `NativeCrashGuard` installe un `Thread.UncaughtExceptionHandler` dès
   `AppSingleton.onCreate` puis dans `MainActivity.onCreate`, et écrit la pile
   d'exception dans les `SharedPreferences` (`melodix_native` / `last_crash`).
   Au lancement suivant, `showLastReport` affiche un dialogue
   « Dernier plantage Melodix » avec le texte, puis efface l'entrée. L'activité
   s'arrête là pour que le dialogue reste visible même si le plantage survient
   pendant l'inflation du layout.

3. **Refus de signature enregistré.**
   La porte `u()` fermait l'application sans aucune trace quand
   `expected_signature_sha256` ne correspondait pas. Ce cas écrit maintenant un
   message explicite (« Signature preview refusée … ») dans le même rapport, ce
   qui distingue une fermeture silencieuse d'un vrai plantage.

4. **Rendu natif non fatal.**
   `NativeUiUpdateRunnable.run()` encapsule `showNativeUi` / `setNativeScreen` /
   `applyNativeUiData` dans un `try/catch (Throwable)`. Un échec du shell natif
   laisse la WebView utilisable et enregistre la trace pour le lancement
   suivant, au lieu de tuer le processus.

## Comment lire le diagnostic

1. Installer la preview et lancer l'application.
2. Si elle se ferme, la relancer : le dialogue affiche la pile d'exception
   (premiers 1200 caractères) — c'est ce texte qu'il faut transmettre.
3. Si l'application démarre normalement, le dialogue n'apparaît pas.

Le rapport est effacé dès qu'il est affiché : un plantage répété réécrit
l'entrée, donc le dialogue revient au lancement suivant.

## Vérifications faites ici

- Analyseur maison registres / étiquettes / `.catch` sur les 35 classes
  `com.melodix.*` : 0 problème.
- Aucun id `0x7f…` en dur du smali absent de `res/values/public.xml`.
- `android:onClick` de `activity_main.xml` : les 14 méthodes existent avec la
  signature `(Landroid/view/View;)V`.
- `node --test tests/*.test.js` : 86 réussites / 16 échecs, identiques à la
  base (`runtime_state`).

## Mise à jour : le diagnostic doit sortir au tout premier écran

Le premier essai ne suffisait pas : le rapport n'était affiché qu'après la porte
de signature et après `showLastReport`, donc un plantage plus tôt restait muet.

Trois canaux, du plus précoce au plus tardif :

1. **Toast à `Application.onCreate`** — dès que le drapeau est installé, si la
   session précédente a laissé une trace, un toast long affiche
   « Melodix a plante : <exception + message> » (240 caractères) ou, si aucune
   exception Java n'a été écrite (crash natif), « Melodix s est arrete a l etape :
   <étape> ». Visible avant même que l'activité n'existe.
2. **Écran d'erreur immédiat** — `setContentView` est entouré d'un
   `try/catch (Throwable)`. Si le layout ne s'inflate pas, l'application affiche
   la pile d'exception dans un `TextView` plein écran au lieu de mourir : une
   seule photo suffit, pas besoin de relancer.
3. **Dialogue au lancement suivant** — déplacé juste après `install`, donc avant
   la porte de signature (`u()`), qui fermait l'application sans rien afficher.

Étapes enregistrées (`last_stage`) : `application` → `activity-create` →
`signature-ok` → `content-view` → `ready`. Une étape `ready` signifie que le
shell natif s'est affiché : les lancements suivants ne montrent plus de toast.

## Ce qu'il faut m'envoyer

- Une photo de l'écran si un texte d'exception apparaît (noir, texte blanc).
- Sinon, une photo du toast « Melodix a plante : … » au lancement.
- Sinon, une photo du dialogue « Dernier plantage Melodix ».

Aucun de ces trois écrans ne demande d'ordinateur ni de logcat.

## diag-3 : marqueur inconditionnel

Nouvelle build : un toast court « Melodix preview diag-3 : demarrage »
s'affiche à **chaque** lancement, avant toute autre chose.

- toast visible → l'APK installé est bien celui-ci et le processus atteint
  `Application.onCreate` : le plantage est plus tardif, et le message du toast
  (plantage ou étape) donne la position ;
- aucun toast → soit l'APK n'est pas celui installé, soit le processus meurt
  avant `Application.onCreate`, ce qui exclut tout le code Java applicatif et
  pointe vers l'APK lui-même (dex, manifeste, bibliothèques natives).

L'appel au garde est aussi entouré d'un `catch (Throwable)` dans
`AppSingleton.onCreate` et `MainActivity.onCreate` : si la classe de diagnostic
était elle-même invalide, elle ne peut plus faire échouer le démarrage.

## diag-4 : la porte de signature, seule fermeture silencieuse connue

Constat de depart : sur la build diag-2, l application revient a l accueil
immediatement, sans toast et sans dialogue « Dernier plantage Melodix ». Or le
garde installe un `Thread.UncaughtExceptionHandler` des `onCreate` de
`AppSingleton` et de `MainActivity`. Une exception non rattrapee aurait donc
ecrit un rapport et affiche un dialogue au lancement suivant. L absence de ce
dialogue designe une **fermeture volontaire**, pas un plantage.

Une seule voie de ce type existe dans le code d origine : `MainActivity.u()`.

    boolean u() {
        if (new AndBridge(this).isSignatureValid()) return true;
        try {
            startActivity(Intent(ACTION_VIEW, Uri.parse("https://github.com/Souxch06/Melodix")));
        } catch (Exception e) {
            finishAffinity();      // aucune trace, aucun message
        }
        return false;              // onCreate fait return-void juste apres
    }

Deux consequences, toutes deux invisibles pour l utilisateur :

1. si l empreinte du certificat ne correspond pas a `expected_signature_sha256`,
   `onCreate` s arrete avant `setContentView` : l ecran de l application n est
   jamais dessine et le lanceur reapparait ;
2. si `startActivity` echoue (aucun navigateur), `finishAffinity()` ferme la
   tache sans le moindre message.

La CI derive pourtant l empreinte du keystore de preview et l injecte dans la
build (`.github/workflows/preview-apk.yml`, etape « Set the preview signing
fingerprint »). Un decalage d une seule ligne suffit donc a rendre l APK
inutilisable, en silence.

### Corrections livrees

- `u()` : les builds `.preview` **ne passent plus par la porte**. L application
  signee garde la verification. Un marqueur `gate-preview-skip` est emis.
- refus de signature : la build de test **reste ouverte** et affiche l empreinte
  attendue a l ecran au lieu de se fermer.
- `NativeCrashGuard.stage()` : chaque etape emet un toast, uniquement pour
  `.preview`. Un toast deja remis au systeme s affiche meme si le processus
  meurt juste apres ; le **dernier toast visible** nomme donc la derniere etape
  atteinte.
- le marqueur de demarrage de `install()` est lui aussi reserve a `.preview` :
  l application de production reste muette.

### Lecture du resultat sur le telephone

Toasts attendus, dans l ordre :

    Melodix diag-4 : demarrage
    application
    activity-create
    gate-preview-skip
    signature-ok
    content-view
    ready

- la suite complete puis l interface : demarrage retabli ;
- arret apres un toast : l etape suivante est la fautive, elle est nommee ;
- aucun toast du tout : le processus meurt avant `Application.onCreate`, ou
  l APK installe n est pas celui-ci (comparer le numero de version dans
  Parametres > Applications > Melodix).

## diag-5 : le garde etait du code mort (tests de nullite inverses)

Relecture ligne par ligne de `NativeCrashGuard` apres le constat « aucun toast,
aucun dialogue ». En smali, `if-eqz vA, label` saute si vA vaut **zero** (nul),
et `if-nez vA, label` saute si vA est **non nul**. Seize instructions ecrites
avec `if-nez` alors qu elles testaient une nullite :

| methode | effet reel |
| --- | --- |
| `install(Context)` | sautait des que le contexte etait non nul : **le garde n a jamais ete installe** |
| `stage(String)` | n ecrivait jamais `last_stage` : **aucun jalon enregistre** |
| `write(String)` | n ecrivait jamais `last_crash` : **aucun rapport enregistre** |
| `lastReport`, `lastStage` | renvoyaient toujours `null` |
| `showLastReport` | renvoyait toujours `false` : **aucun dialogue possible** |
| `excerpt`, `shorten`, `clearReport` | no-op |

Conclusion : tous les diagnostics annonces dans les sections precedentes
(toasts « demarrage », dialogue « Dernier plantage », etapes `last_stage`)
etaient **inoperants**. Les reponses « aucun toast / aucun dialogue » ne
disaient donc rien du plantage, et les hypotheses baties dessus sont annulees.
Le crash n a jamais ete observe.

`MainActivity.u()` portait deux inversions du meme type : le contournement
`.preview` envoyait la preview dans la porte de signature et la production dans
le contournement, et `finishAffinity()` fermait la preview au lieu de la
production.

### Corrections

- Les 16 conditions sont passees en `if-eqz` (saut uniquement si nul) et le
  fichier a ete relu methode par methode.
- `u()` : le contournement `.preview` est **supprime**. La verification de
  signature s applique a toutes les builds. Une preview qui echoue revient
  simplement de `u()` (pas de navigateur, pas de fermeture) et affiche
  l empreinte attendue ; la production garde son comportement d origine
  (navigateur puis `finishAffinity()`).
- `stage("activity-create")` etait ecrit **avant** `showLastReport`, donc le
  rapport affichait l etape du lancement en cours au lieu de celle du plantage.
  Il est deplace apres la lecture du rapport.

### Verification de l empreinte

La CI injecte `expected_signature_sha256` a partir du certificat du keystore,
mais rien ne prouvait que l APK publie etait bien signe par ce certificat. Deux
verifications bloquantes sont ajoutees apres la signature :

1. `apksigner verify --print-certs` : le SHA-256 du certificat signataire doit
   egaler l empreinte injectee ;
2. l empreinte doit etre presente dans `resources.arsc` (donc reellement
   compilee, pas seulement ecrite dans le XML source).

Si l une echoue, la CI echoue au lieu de publier un APK condamne a se fermer.

Le nom de version affiche desormais le prefixe du commit
(`1.2.2-<7 caracteres>`), ce qui permet de verifier sur le telephone quelle
build est installee.

## diag-6 : cause reelle, trace FATAL EXCEPTION obtenue sur emulateur

Le telephone ne peut pas donner de logcat et la CI ne publiait aucun journal
lisible. Un workflow dedie installe desormais l APK publie sur un emulateur
Android 15 (API 35), le lance et rapporte ce qui se passe : activite au premier
plan, texte affiche, etapes enregistrees et tampon de plantage. Le rapport est
ecrit dans les annotations du job et dans un commentaire de commit, donc
lisible sans telecharger d artefact.

Premiere execution :

    FATAL EXCEPTION: main
    Process: com.melodix.music.preview, PID: 2469
    java.lang.LinkageError: Method void com.melodix.music.MainActivity.onBackPressed()
    overrides final method in class Landroidx/activity/a;
        at bh.<clinit>
        at com.google.firebase.provider.FirebaseInitProvider.attachInfo
        at android.app.ActivityThread.installProvider
        at android.app.ActivityThread.installContentProviders
        at android.app.ActivityThread.handleBindApplication

### Pourquoi aucun diagnostic ne pouvait fonctionner

La pile s arrete dans `installContentProviders`. Les `ContentProvider` sont
installes **avant** `Application.onCreate()`. Le processus mourait donc avant
la premiere ligne de code applicatif : ni garde installe, ni jalon ecrit, ni
toast, ni dialogue. Ce n etait pas un defaut du diagnostic mais un plantage
situe en amont de tout ce que l application controle.

Le declencheur est `FirebaseInitProvider.attachInfo`, dont le `<clinit>` charge
`MainActivity`, ce qui force la verification de la classe.

### Cause exacte

`androidx.activity.a` (ComponentActivity) declare :

    .method public final onBackPressed()V

`MainActivity` redefinissait cette methode. Un `LinkageError` est leve des que
la classe est verifiee : l application ne peut pas demarrer, quelle que soit la
suite du code. L historique montre que cette redefinition a ete ajoutee par le
commit `c925fd5` (« Repare les boutons morts et pilote le lecteur sans le
bridge ») et n existe pas dans le commit de base `81ef774`. La regression vient
donc de ce travail, pas du depot d origine.

La classe du callback androidx (`Lr70;`) est `final` et obfusquee, donc il est
impossible d en heriter pour reintroduire le comportement par le dispatcher.
La redefinition est supprimee : la classe se charge a nouveau.

### Consequences

- L application redemarre. C est desormais verifie par execution reelle sur
  emulateur, plus par deduction.
- Le retour systeme ne ramene plus a l accueil depuis un ecran natif ; il
  reprend le comportement d origine. Le bouton retour de l interface
  (`onNativeBackClick`, identifiant `0x7f090231`) reste fonctionnel.
- Les corrections precedentes (conditions de nullite du garde, verification
  d empreinte en CI, versionCode croissant) restent en place : elles etaient
  necessaires mais ne pouvaient rien afficher tant que la classe ne se chargeait
  pas.

### diag-7 : deuxieme erreur, puis lancement confirme

Apres suppression de la redefinition, la classe se charge mais le verificateur
refuse `onCreate` :

    java.lang.VerifyError: Verifier rejected class com.melodix.music.MainActivity:
    void onCreate(android.os.Bundle) failed to verify:
    [0x108] args to 'if' (Conflict, Imprecise Constant: 127) must be integral

Cause : le marqueur de demarrage avait ete ecrit directement dans `onCreate`,
en reutilisant `v2`, qui contient `SDK_INT` et sert plus loin a un `if-lt`.
Le registre devenait ambigu sur ce chemin, donc la methode entiere etait
rejetee. Le dessin du marqueur est deplace dans
`NativeCrashGuard.showLaunchMarker(Activity)`, qui possede ses propres
registres ; `onCreate` ne fait plus qu un `invoke-static/range {p0 .. p0}`.

### Resultat du lancement reel

Execution sur emulateur Android 15 (API 35), APK publie :

    installed: versionCode=1020376  versionName=1.2.2-74b77a5
    release advertises: 74b77a5e3fb4fe44e3e7bc71f24732ab96ad807f
    resumed: com.android.permissioncontroller/.GrantPermissionsActivity
    fatal: (aucune ligne)

- plus aucune `FATAL EXCEPTION` pour `com.melodix.music.preview` ;
- l activite au premier plan est la demande de permission declenchee par
  l application elle-meme (`BLUETOOTH_CONNECT`), ce qui prouve que `onCreate`
  s execute jusqu a la demande de permission ;
- le tampon de plantage ne contient plus qu un abandon de la pile Bluetooth de
  l emulateur (`droid.bluetooth`, SIGABRT), sans rapport avec Melodix.

### Limites connues

- `last_stage` n a pas pu etre relu pendant cette execution (`adb root` n a pas
  pris effet a temps sur l image `google_apis`). Le marqueur et le dialogue de
  plantage restent les canaux utilisables depuis le telephone.
- Le retour systeme ne ramene plus a l accueil depuis un ecran natif : le
  dispatcher androidx est obfusque et sa classe de callback est `final`, donc
  non heritable. Le bouton retour de l interface reste fonctionnel.

## diag-8 : l application demarre, mais l accueil reste vide

Premiere capture reelle apres la correction : l ecran natif s affiche (en-tete,
barre d onglets) mais la zone de contenu est nue.

### Ce que le code permet de conclure

- `nativeRoot` est `visibility="gone"` dans le layout : s il est visible, c est
  que `showNativeUi()` a tourne, donc que `onNativeUiReady()` a ete appele.
- Cette notification exige la presence du controle de compte Spotify
  (`[data-testid="user-widget-link"]`) : **la session est bien connectee**.
- La zone de contenu est remplie par `renderNativeRows`, appele uniquement a la
  reception d un lot de lignes. Aucun lot recu ⇒ conteneur vide ⇒ ecran nu.
- `updateHomeRows` sort immediatement si `isSpotifyHome()` est faux. Une WebView
  parquee sur une autre route Spotify pendant que l ecran natif affiche
  l accueil produit donc exactement ce symptome, sans aucune erreur.

Autrement dit : ce n est pas un plantage, c est un ecran qui n a rien recu et
qui ne dit rien.

### Corrections livrees

1. **Etat vide explicite.** `NativeEmptyState.fill` ecrit dans le conteneur
   `nativeContent` uniquement s il est vide : titre « Chargement de ton
   accueil… », puis une ligne de detail, puis « Toucher pour réessayer ».
   `MainActivity.refreshNativePlaceholder` l appelle a chaque changement
   d ecran et a chaque diagnostic recu.
2. **Nouveau canal de diagnostic.** `AndBridge.onNativeDiag` →
   `NativeUiUpdateRunnable` (action 3) → `MainActivity.setNativeDiag`. Le shell
   JS y envoie, a chaque changement : route courante, si la route est reconnue
   comme l accueil, nombre de cartes, de liens et d images trouves, presence du
   controle de compte, et les cinq `data-testid` les plus frequents. La ligne
   s affiche sous le titre, donc une simple capture d ecran suffit a expliquer
   le vide.
3. **Nouvelle tentative depuis le telephone.** `window.__sfNativeUiRecheck`
   vide la signature memorisee puis relance la collecte ; le bloc vide est
   cliquable via `NativeRecheckClickListener`.
4. **Verification forcee au demarrage.** Les deux classes ajoutees sont
   resolues tot, derriere un `catch`, avec un log `MelodixVerify` : un probleme
   de verificateur apparait a l endroit ou il est lisible, pas sur le chemin
   cense expliquer l ecran vide.

### Ce que la prochaine capture donnera

- `accueil oui` et `cartes 0` : le DOM Spotify a change, il faut adapter les
  selecteurs de `collectHomeRows` aux `data-testid` listes.
- `accueil non` : la WebView est sur une autre route ; l accueil natif doit
  demander la navigation plutot que d attendre.
- une ligne `MelodixVerify` : le verificateur refuse une des nouvelles classes.
