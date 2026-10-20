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
