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
