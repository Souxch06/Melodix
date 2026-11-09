# Phase 1 — session probablement expirée et surfaces mobiles

## Périmètre / point d’arrêt

Partie A + splash/écrans de statut uniquement. Les phases design system/navigation, accueil, recherche/bibliothèque/playlist, réglages, lecteur et mode clair attendent le test utilisateur. Pas de changement de spoof, requêtes, en-têtes, version Spotify ou adblock. La garde de données privées reste obligatoire.

## Avant : test124 vC1021459 (source applicative 5acef50b)

Le téléphone rapporte `verification-failed-no-logout`, API400/repli403/library401. Ce rapport est une preuve de refus, pas une panne réseau. Il ne prouve pas à lui seul deux tentatives distinctes ou une reconnexion fraîche.

`NativeSessionGate.result`, avant modification : le test `freshLogin` précède l’analyse des refus et saute directement vers l’erreur générique. `pageFinished` positionne ce flag sur tout retour accounts → player, y compris un auto-continue SSO qui ne prouve pas une reconnexion fraîche. Il n’existe aucun compteur des refus répétés. Enfin, l’expiration ouvre automatiquement accounts, ce qui rend le bouton de purge volontaire inaccessible pendant loginActive.

Le ScrollView de `native_session_surface.xml` ne définit pas de carte à largeur maximale ni de wrapper stable distinguant centrage vertical et défilement en hauteur contrainte. Les captures avant seront des reproductions synthétiques sur émulateur du test124 (pas des captures prétendument prises sur le téléphone utilisateur).

## Contrat après

- Deux tentatives courantes distinctes et terminées, avec API400/repli403/library401 et le **même** cookie sp_dc présent : état **session probablement expirée**. Une répétition du même callback ne compte pas.
- Une empreinte SHA256 éphémère du seul cookie de session corrèle ces observations et protège le tap contre un cookie remplacé depuis la preuve. Ni valeur, ni empreinte ne sortent en diagnostic/prefs/fichiers.
- Écran « Ta session Spotify semble expirée » : Se reconnecter (principal), Réessayer (secondaire). Pas de redirection automatique depuis ce refus ; le budget de login automatique au lancement sans cookie reste plafonné à un.
- Purge seulement au tap, après nouvelle comparaison de l’empreinte. Réessayer ne purge rien. Un succès, une absence/changement de cookie ou un résultat réseau/non concordant invalide la preuve de purge.
- Reconnexion fraîche = suppression explicitement demandée et confirmée, puis login. Un simple retour SSO n’arme plus ce flag. Nouveau refus concordant après reconnexion fraîche : « Spotify refuse l’accès avec ce compte », preuves repliées et copiables, sans deuxième redirection.
- Réseau et délai : Réessayer, pas de purge. Le délai initial de présentation reste ~3 s, sans être une preuve d’expiration.
- Carte centrée quand la hauteur suffit, défilement quand clavier/police/paysage réduisent la place ; logo doux et mouvement réduit ; détails repliés, copie volontaire du diagnostic.

## Étapes / relance

1. Documenter puis implémenter le classement et la reconnexion sûre, tests de décisions.
2. Refaire uniquement les surfaces de statut/splash ; tests de ressources, accessibilité et mouvement réduit.
3. Instrumentation Android et captures synthétiques avant/après : téléphone portrait, tablette paysage, police agrandie, petite hauteur/clavier, mesures géométriques et MDXPERF sans contenu privé.
4. Livrer l’APK signé, les résultats et les limites ; s’arrêter pour le test utilisateur.

Après chaque commit de code poussé :

```sh
SHA=$(git rev-parse HEAD)
gh workflow run preview-apk.yml --ref arena/6b935c3e-melodix \
  -f release_tag=v1.3.2-test.125-preview -f source_ref="$SHA"
gh workflow run test-preview-emulator.yml --ref arena/6b935c3e-melodix \
  -f source_ref="$SHA" -f session_gate_only=true -f publish_preview=false
```

Ne pas désinstaller ni lancer clear-data pour tester sur le téléphone. Les états serveur des captures CI sont simulés, jamais une validation d’un vrai compte Spotify.

### Étape classement (implémentée)

`NativeSessionEvidence` conserve uniquement un digest éphémère du sp_dc et un compteur saturé à deux ; le natif filtre auparavant génération, complétion et numéro de tentative. Le même callback ne peut donc pas ajouter deux observations. Un cookie remplacé invalide la suppression, même si les deux anciens refus étaient vrais. Le retour SSO ne positionne plus freshLogin ; seul le callback de suppression volontaire confirmée l’arme. Le statut probable ne navigue pas automatiquement : il rend possible le choix explicite Se reconnecter.

Tests ciblés de décision, compteur et callback de reconnexion exécutés avant le commit. Relance de cette étape : commandes test125 en tête du document (l’UI de l’étape suivante n’est pas encore appliquée). Aucune preuve appareil/capture après ne doit être déduite de ces seuls tests.

### Étape surfaces (implémentée, validation Android à venir)

Fond #0B0B14, halos violet/magenta statiques sans blur, verre 7%/bordure14%, boutons pilules violet→magenta, carte24dp plafonnée à480dp, grille4/marges20. Les boutons font au minimum48dp et grandissent avec la police. ScrollView fillViewport + carte centrée ; défilement si hauteur insuffisante. Logo dérivé du master existant (silhouette recolorée, pas de nouvelle marque), pulse décorative seulement pendant verifying, désactivée si l’échelle d’animation système vaut0. Disclosure250ms sans animation de hauteur ni blocage du tap.

Le header du formulaire Spotify reste compact et séparé : pas de carte/logo de80dp au-dessus du clavier. Les changements de raison rafraîchissent aussi le titre dans un même état. Copie volontaire limitée au diagnostic de la garde (raisons fixes/codes/compteur), pas au diagnostic global WebView.

Fichiers : ressources `session_*`, `native_session_surface`, `native_session_login_header`, helpers `NativeSessionCard`, `NativeSessionSurface*`. Risques restants à vérifier sur Android : inflation custom View, mesure petite hauteur/grande police, padding du formulaire, cycle de vie/Retour. Pas de changement des autres écrans.

### Étape QA (instrumentation)

La matrice reconstruit124 et125 avec la même instrumentation, sur téléphone1080×1920/densité420 et tablette1920×1200/densité160. L’avant reproduit l’erreur rapportée ; l’après affiche la session probable via état synthétique. Cette comparaison vérifie la présentation, pas une authentification. Les cookies ne sont ni injectés ni supprimés ; le compteur pur utilise deux identités factices, et `canClear` reste faux en CI sans cookie.

L’instrumentation après vérifie réseau/401isolé, deadline, preuve valide, ancien callback, compteur borné/changement d’identité, disclosure/copie, rotation, recréation et vrai arrière-plan. Les captures supplémentaires tentent un clavier réel (champ technique vide1px, uniquement dans le test) et une petite hauteur avec police1,6. Les fichiers géométriques indiquent la hauteur réellement disponible ; une demande d’ouverture clavier seule n’est pas une preuve de son affichage. Les nombres gfxinfo sont des mesures émulateur de quelques frames de statut, pas une promesse60fps sur téléphone. Les traces MDXPERF exportées sont limitées aux transitions fixes.

### Complément splash et observabilité

Le fond de lancement et les quatre variantes du splash reprennent le logo dérivé et la vignette phase1. Le thème nuit utilisait encore un fond noir uni au tout premier lancement : il pointe désormais aussi vers le fond de marque. Les icônes adaptive/monochrome du launcher ne sont pas modifiées (phase finitions ultérieure). L’empreinte est également remise à zéro à la fin effective du lancement.

Les miniatures JPEG des seules captures synthétiques sont publiées en annotations de contrôle pour permettre la revue des pixels sans accès au serveur externe des artefacts ; les PNG originaux restent dans chaque artefact de matrice. Les résumés bornés incluent phases, mesures géométriques et gfxinfo. Le journal MDXPERF utilise `NativeStartupTiming.appendTo` (grammaire fermée déjà existante), pas un dump WebView/URL.

Premier run Android phase1 `42602365256` : échec de harnais avant toute installation/capture, `/usr/bin/sh` ne supporte pas `set -o pipefail` et l’action émulateur exécute chaque ligne dans un shell distinct. Cause corrigée en exécutant **un script Bash de fichier**, qui préserve fonctions et variables de la matrice. Le run suivant parti avant ce constat est annulé ; ces runs ne constituent pas des résultats applicatifs.

Run corrigé `42602974124` : **SUCCESS**, les quatre cases avant/après × téléphone/tablette sont vertes. Le téléphone après comprend les assertions de session/lifecycle et les captures petite hauteur/grande police/clavier. Les PNG originaux sont dans les artefacts. GitHub tronque chaque message d’annotation à4096octets : le premier export JPEG monobloc est incomplet et ne doit pas être utilisé. Revue réexportée depuis ces **mêmes artefacts**, sans nouveau build ni état reconstitué, par fragments3600caractères contrôlés en nombre et SHA256. Les fichiers JPEG incomplets ont été retirés avant livraison.
