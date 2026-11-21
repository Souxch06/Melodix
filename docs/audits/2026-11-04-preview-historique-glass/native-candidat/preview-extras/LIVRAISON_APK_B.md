# APK B — panneaux natifs sans exposition Web

| Point | État | Cause et comportement |
|---|---|---|
| File | BLOQUÉ | DOM réel, sélection des éléments, durées et fermeture non caractérisés ; pas de risque de sélectionner un élément erroné. La tuile ouvre un tiroir natif « Indisponible dans cette version ». |
| Paroles | BLOQUÉ | DOM réel et synchronisation non caractérisés ; pas de paroles fabriquées. Même état natif indisponible. |
| Appareils | BLOQUÉ | DOM réel et contrôle de transfert non caractérisés ; aucun appareil n'est choisi ou transféré. Même état natif indisponible. |
| Confidentialité / visibilité | FAIT dans le code et PARTIEL en validation | Le composant des tuiles ne contient aucun accès WebView, clic DOM, appel réseau, modification de visibilité de la racine ni commande Android audio. Il ne peut donc plus ouvrir les anciens panneaux Web via ces trois tuiles. Aucun appareil réel n'a été testé ; d'autres surfaces générales de l'app ne sont pas couvertes par cette affirmation. |
| Tiroirs indisponibles | PARTIEL | Panneau natif en bas, couleur #170B33 92 %, bord blanc 12 %, coins supérieurs 28 dp, poignée glissable, titre et Fermer ≥44 dp ; Retour Android utilise l'annulation normale du dialogue. Fermeture également en arrière-plan/détachement. Tests JVM simulés seulement ; rendu, glissement et Retour réels non validés. Les squelettes, contenus, reprises et réessais dynamiques demandés ne sont pas implémentés pour les fonctionnalités bloquées. |

Ces blocages viennent de l'absence de DOM observable et de fermeture éprouvée, pas d'une preuve qu'une intégration sans toucher aux fichiers protégés est impossible en principe. Les boutons n'ouvrent donc pas le panneau Spotify caché ; aucune requête ni sélection n'est déclenchée par eux. Le volume reste bloqué et désactivé comme en A. Aléatoire, Like et diagnostic sont ceux de A.

Retour vers l'APK A : l'artefact signé A reste disponible séparément. Android refuse normalement l'installation d'un versionCode inférieur par-dessus B ; revenir à A peut nécessiter de désinstaller B avant d'installer A, ce qui peut supprimer les données locales et la session. Ne pas promettre un retour sans perte de données.

Tests : JVM avec doubles appuis, fermeture, glissement, arrière-plan, sans clic Web ni AudioManager ; garde Smali du composant ; assemblage local et garde sept actifs. Aucun test sur téléphone, lecture réelle, rendu ou audio. Checklist de test téléphone dans `DIAGNOSTIC_APK_A_B.md`.
