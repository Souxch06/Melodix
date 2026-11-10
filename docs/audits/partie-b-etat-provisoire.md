# Partie B — spécification vs réalisé

Les liens `captures/demo-captures-phone/` et `captures/demo-captures-tablet/` désignent les captures Android jointes au même artefact que l'APK. Elles montrent des **données fictives**, pas une session réelle. La tablette est en paysage et le téléphone en portrait. Le contenu de certaines cartes est une présentation de démonstration ; le shell, les lecteurs et les lignes de réglages utilisent les ressources et rendus natifs indiqués dans `demo/README.md`. Les captures ne démontrent pas le comportement Spotify réel.

| Élément | État | Preuve ou limite |
|---|---|---|
| Verre / flou | Partiel | [Accueil téléphone](captures/demo-captures-phone/accueil.png), [tablette](captures/demo-captures-tablet/accueil.png). Le CSS comprend du flou, mais la barre native utilise un repli sans flou. |
| Dégradé d'accent | Partiel | [Lecteur téléphone](captures/demo-captures-phone/lecteur.png), [tablette](captures/demo-captures-tablet/lecteur.png) ; présence dans les ressources, application globale non garantie. |
| Shimmer | Pas fait | Pas de shimmer dans les composants natifs examinés ; pas de capture pertinente. |
| Barre flottante | Partiel | [Accueil téléphone](captures/demo-captures-phone/accueil.png), [tablette](captures/demo-captures-tablet/accueil.png). Le chevauchement historique de 14 px n'est pas corrigé ni validé. |
| Mini-lecteur | Partiel | [Téléphone](captures/demo-captures-phone/mini-lecteur.png), [tablette](captures/demo-captures-tablet/mini-lecteur.png). Lecteur natif avec données fictives ; pas d'audio ni d'état Spotify réel. |
| Lecteur plein écran | Partiel | [Téléphone](captures/demo-captures-phone/lecteur.png), [tablette](captures/demo-captures-tablet/lecteur.png). Layout natif, contenu et commandes simulés ; pas de lecture réelle. |
| Réglages | Partiel | [Téléphone](captures/demo-captures-phone/reglages.png), [tablette](captures/demo-captures-tablet/reglages.png). Fabrique native copiée sans dispatch réel ; activation et réglages démo locaux. |
| Splash | Partiel | Fond/logo natifs déclarés ; aucune capture de la première frame système Android 12+. |

| Défaut demandé | État |
|---|---|
| Icônes des réglages et pistes des interrupteurs | Corrigé dans le code ; captures de la fabrique de démo ci-dessus. |
| Indication active des réglages | Corrigé dans le code et présent dans le shell de démo ; validation des parcours réels à faire. |
| Bouton « Copier le diagnostic » trop étroit | Corrigé dans le code natif ; écran réel non validé sur cette fixture. |
| Chevauchement de 14 px barre / lecteur | **Pas fait**. |
| Erreurs JavaScript répétées de la WebView | **Pas fait** : la démo ne crée pas de WebView ; aucune cause ni correction ne sont établies par ces captures. |
