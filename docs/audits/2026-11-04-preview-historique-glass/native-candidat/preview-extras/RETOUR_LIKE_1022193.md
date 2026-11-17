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

## Nouveau retour téléphone — Preview 1022194

Le second diagnostic indique à nouveau `non envoyé : absent`, avec cette fois
`piste_page=absente`, `titre_page=absent`, `track_links=0`, `track_named=0`,
`track_generic=0`, `npv_opener=0`, `like=0`, `view=0`. Ces valeurs concernent
les éléments et formats reconnus par la sonde dans les zones inspectées ; elles
ne prouvent pas qu'aucun contrôle n'existe ailleurs dans la page Spotify.

**BLOQUÉ :** deux essais successifs sur téléphone ne fournissent ni identité
exploitable ni contrôle Like/ouvreur de vue reconnu. Dans ces conditions,
il n'existe pas de clic dont l'effet d'ajout et la piste peuvent être établis
sans risque ; aucune troisième tentative à l'aveugle, aucune playlist choisie,
et aucune confirmation d'ajout ne sont justifiées. La cause plus profonde
(absence réelle, emplacement ou structure non reconnus, ou données obsolètes)
reste inconnue.

Le pont 9016 protégé contient un ancien `actAddToFav` fondé sur une position
DOM et qui programme `addAndAuto` : sa cible et ses effets sur la lecture ne
sont pas vérifiés, donc il ne constitue pas un repli sûr sous les contraintes.
Aucun fichier protégé n'a été modifié et aucun nouveau build n'a été déclenché
pour ce constat. La copie de diagnostic ne contient ni titre, ni artiste, ni
identifiant de piste, ni données de session.
