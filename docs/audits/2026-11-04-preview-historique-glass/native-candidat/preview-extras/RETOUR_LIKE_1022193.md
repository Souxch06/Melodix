# Retour téléphone — Like 1022193

## Constat

La sonde reçue après appui indique `Like : état=unknown, motif=absent`,
`résultat : non envoyé : absent`, `like=0`, `view=0` et aucune méthode
utilisée. L'appui est donc arrivé dans le composant natif, mais aucune commande
Like n'a été envoyée. Dans ce code, ce résultat signifie que la page a été
classée sans contrôle Like reconnu **et** que l'identité de piste n'a pas pu
être utilisée par le composant. Il ne démontre ni l'absence réelle de tout
contrôle Spotify ni la raison exacte de l'identité inutilisable.

La présence de l'identité titre/artiste/durée de l'horloge ne prouve pas la
présence d'un identifiant de piste utilisable pour Like : ce sont deux contrôles
indépendants. Le journal indique aussi une observation « paused » ; il ne mesure
pas le son et ne permet pas d'expliquer l'échec Like.

## Adaptation, preuve et limites

- Comme le lecteur récupère déjà les liens de piste non marqués dans la barre
  Spotify, la recherche d'identité Like accepte ces liens dans la barre de
  lecture uniquement. Tous les liens de piste doivent rester cohérents ; pas
  de correspondance par simple titre ou de lien pris dans une playlist.
- Un éventuel ouvreur de vue reste strictement reconnu et unique. Aucun clic
  de Like n'est envoyé si l'identité, le contrôle ou son état reste incertain.
- Les sondes ajoutent seulement des comptes bornés (`track_links`,
  `track_named`, `track_generic`, `npv_opener`) et les catégories « piste page
  présente/absente », « titre cohérent/différent/absent ». Ni titre, ni artiste,
  ni identifiant, ni donnée de session ne figurent dans le rapport copiable.
- Les tests DOM/JVM sont des simulations. Le diagnostic fourni ne dit pas si
  le téléphone possède un lien générique ni un ouvreur de vue ; le correctif
  n'est donc pas présenté comme une réparation réelle confirmée.
