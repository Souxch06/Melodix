# Campagne de réponses tardives — APK 1022250

**Archive historique du candidat 1022250 / commit c93b99c.** Les scénarios ci-dessous ont depuis été corrigés dans les sources de la branche ; consulter `CORRECTIF_REPONSES_TARDIVES.md` pour l’état actuel et les nouvelles limites. Cet historique ne décrit pas un APK ultérieur.

Code applicatif testé : `a5cde753a8a72e257e29015bfe1cf460677437e8`. Simulation JVM/JSDOM avec callbacks WebView contrôlés, vues Android factices et parseur `org.json` libcore (miroir GrapheneOS `2804897a14425d5e045ff8bc13a14ba7bef5b9bb`) ; également exécutée avec JSON-java `2cd0a8c2112a3bc17d33ba8546c54ecb613613f1`. Ni téléphone Android, ni Spotify authentifié, ni audio. L'ordonnancement des callbacks dans ces tests est provoqué volontairement et n'est pas établi sur appareil.

## File, Paroles, Appareils

- Pour chaque panneau, après l'expiration du délai de 8 s puis appui sur Actualiser, une réponse tardive de la première lecture ne remplace pas le nouveau contenu. Une réponse tardive de démarrage ne lance pas non plus de nouvelle lecture. Le second essai peut afficher ses propres données simulées.
- **Caractérisation, pas validation de sûreté** : si l'on reste sur le même panneau après expiration et qu'on ne réessaie pas, un résultat tardif de la même opération remplace le message d'indisponibilité. Observé sur les trois panneaux en simulation ; le comportement n'a pas été modifié. Cela ne garantit pas la fraîcheur des données affichées.

## Volume : anomalie non corrigée

En simulant un geste du curseur, puis une commande dont la réponse arrive après la lecture du volume programmée 350 ms plus tard, les deux réponses suivantes ont été essayées séparément :

1. une réponse de commande `sent: true` issue du script réel exécuté sur un DOM synthétique ;
2. une réponse d'échec `sent: false` forgée pour le test.

Dans les deux cas, le diagnostic reste « en attente » et la réponse de commande est ignorée : la lecture suivante a incrémenté le même compteur `serial` que celui utilisé pour filtrer les retours de commande. Dans le cas d'échec, le diagnostic ne rapporte donc pas cet échec et l'alerte prévue n'est pas déclenchée. Une lecture de page plus récente peut toutefois être affichée ; ni celle-ci ni `sent: true` ne prouvent que le son a changé. **Ce défaut est reproduit uniquement dans la simulation, pas encore corrigé ni confirmé sur téléphone.**

Des contrôles supplémentaires vérifient qu'une ancienne réponse de commande ou de lecture n'écrase pas une commande plus récente, et qu'une réponse tardive après détachement de la vue n'est pas prise en compte. Ces garanties ne doivent pas être perdues dans un futur correctif : séparer les générations de lectures et de commandes exige aussi une invalidation au changement de cycle de vie et un traitement prudent d'un échec arrivé après une lecture plus récente.

## Exécution et interprétation

Sur le test tel qu'il existait au commit `c93b99c`, voir `CAMPAGNE_PONT_JSON.md` pour installer les dépendances. Sans option supplémentaire, la campagne historique **passait en caractérisant les limites connues**. Sur cette version historique seulement, ces variables reproduisaient les deux tests rouges :

```sh
BRIDGE_REQUIRE_SET_ACK=1       # échec attendu : réponse tardive de commande envoyée ignorée
BRIDGE_REQUIRE_FAILURE_ACK=1   # échec attendu : réponse tardive d'échec ignorée
```

Les deux vérifications strictes échouaient avec le parseur libcore au commit `c93b99c`. Aucun correctif applicatif, reconstruction ou nouvel APK dans cette campagne historique. Les limites antérieures (fraîcheur des panneaux non vides, transfert incertain et Like) demeurent ouvertes.
