# Harness de stubs (phase 5C) — HORS build Gradle

`MelodixNotificationProviderTest.kt` a été écrit pour un harness de **stubs
faits main** (TestContext, NotificationManager simulés, `definitionBuilders`…)
et ne compile **pas** avec les vraies classes Android/Robolectric. Il n'a
jamais été câblé dans un build Gradle.

Conservé ici (hors `src/test`) pour mémoire le temps d'un **portage
Robolectric** dédié — hors scope du correctif 4.4.8 qui ne touche qu'aux
invariants d'état du VirtualMediaPlayer.
