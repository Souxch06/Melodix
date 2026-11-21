# Refonte visuelle Glass — paramètres et playlists

La demande porte sur l'apparence : les problèmes de récupération des titres, redémarrage audio, vitesse et animation restent ouverts. La Preview s'appuie sur l'état 1022131, non validé avec Spotify réel. Cette refonte ne modifie ni les sept actifs protégés, ni les commandes de lecture, ni les chemins de navigation ou de chargement.

## Paramètres

En-tête « Votre musique, à votre façon », surfaces en dégradé translucide, nouvelles icônes décoratives discrètes, sections lavande plus lisibles, hiérarchie typographique et badges arrondis. Les images de profil réelles, textes, actions, états ON/OFF/Indisponible, accès et appui long au diagnostic existants sont conservés. Les icônes ne sont pas des boutons et ne créent pas de nouvelles actions.

## Playlist

En-tête avec pochette carrée, libellé playlist, grand titre et séparation des titres, inspiré des pages mobiles tout en gardant la palette violette Glass. La pochette n'est demandée que si elle appartient à la ligne sélectionnée avec une URI strictement identique ; sinon un visuel décoratif abstrait « playlist » est affiché, sans utiliser la pochette d'un morceau. Pas de nombre de titres ni auteur inventés. Les lignes, leurs écouteurs et messages d'attente sont conservés, y compris lors des rendus vides. Pas de gros bouton Play dont la disponibilité n'est pas établie.

## Vérifications et limites

Rendu Java simulé avec faux objets Android : styles de paramètres, maintien du caractère cliquable, titres et statuts d'origine, choix exact de la pochette, défaut décoratif, conservation de la ligne d'attente et isolation des autres pages. Vérifications de structure et reconstruction/redécodage, suite Node hors ligne et comparaison des sept actifs. La simulation ne démontre ni rendu réel, ni accessibilité TalkBack, ni performance, ni fonctionnement Spotify. L'APK est une Preview et la refonte doit encore être inspectée sur Android ; aucun test utilisateur sur téléphone n'est requis pour continuer le travail visuel.
