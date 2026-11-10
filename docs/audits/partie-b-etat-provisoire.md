# Partie B — spécification vs réalisé (provisoire)

Ce tableau est un inventaire **avant** mode démo et nouvelles captures. Les images référencées sont historiques, prises sur d'autres commits : elles ne valident pas l'état actuel, les corrections récentes, ni une tablette paysage. Les captures historiques appelées `player` et `mini-player` montrent un état bloqué sans session, pas les lecteurs. Ne pas les utiliser comme preuves de lecteurs opérationnels. La CI n'a pas encore produit les captures de chaque écran demandées.

| Élément | État | Preuves et limites |
|---|---|---|
| Verre / flou | Partiel | CSS `assets/css_hacks.css` contient du flou et un repli ; les surfaces natives comme `native_tabbar_glass.xml` utilisent un remplissage sans flou. [Ancien statut téléphone](phase1-captures/after-phone-phone-status.jpg), pas une preuve de flou des écrans actuels. |
| Dégradé d'accent | Partiel | Ressources et CSS définissent un dégradé ; visible dans l'[ancien statut téléphone](phase1-captures/after-phone-phone-status.jpg). L'application sur tous les écrans actuels reste à vérifier. |
| Shimmer | Pas fait | Aucun shimmer repéré dans les ressources, le shell et les renderers natifs examinés. Pas de capture disponible. |
| Barre flottante | Partiel | Ressource native et dimensions existent ; [ancienne navigation téléphone](ui-qa-41990724746/phone/home-phone.png) antérieure à la phase 2, donc ne prouve pas le rendu actuel. Chevauchement signalé non résolu ni mesuré ici. |
| Mini-lecteur | Partiel | Layout et fond natifs existent ; [audit phase 6](phase6-lecteur.md) indique qu'il n'a pas été observé avec lecture. Aucune capture probante. |
| Lecteur | Partiel | Layout plein écran natif existe ; [audit phase 6](phase6-lecteur.md), aucune capture probante du lecteur alimenté. |
| Réglages | Partiel | Rendu et correctifs présents ; [ancienne capture téléphone](ui-qa-41990724746/phone/settings-phone.png) montre l'état avant correction, pas les nouvelles icônes ou pistes. À vérifier sur les deux formats. |
| Splash | Partiel | Fond et logo déclarés dans `mel_launch_background.xml` ; aucune capture de la première frame système Android 12+ disponible. L'[ancienne capture de statut](phase1-captures/after-phone-phone-status.jpg) n'est pas une capture de splash. |

Les captures de téléphone portrait et tablette paysage de chaque écran et les vérifications correspondantes restent nécessaires ; ce tableau ne remplace pas ce livrable. Aucun mode démo activable n'est encore présent.
