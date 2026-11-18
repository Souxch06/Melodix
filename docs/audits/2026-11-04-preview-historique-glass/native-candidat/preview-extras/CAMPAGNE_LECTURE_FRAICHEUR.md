# Deuxième campagne : extraction et fraîcheur

Tests synthétiques uniquement. Sept scénarios ont d'abord échoué avec l'ancien code : un lien de pochette sans texte avant le titre, deux titres différents dans une ligne, du texte masqué à l'intérieur d'un titre/artiste/parole, une durée masquée, un titre valide après 40 lignes non reconnues, et plusieurs appareils déclarés actifs avant/après une demande de transfert.

Le candidat ignore le texte descendant caché et les contrôles imbriqués, saute les liens sans titre, refuse plusieurs titres distincts dans une ligne, et renvoie au plus 40 résultats après analyse d'au plus 400 lignes candidates. La détection d'un transfert exige au plus un appareil marqué actif avant le clic et exactement un pendant la vérification. Ces contrôles ne prouvent pas l'identité réelle d'un appareil et ne rendent pas les transferts sûrs sur le téléphone.

Les six tests `freshness-characterization.test.cjs` sont volontairement des tests de **caractérisation**, pas six validations fonctionnelles : trois passent parce qu'ils reproduisent une limite connue (contenu ancien non vide accepté avant son rafraîchissement, pour File, Paroles et Appareils), les trois autres montrent que le contenu arrivant après 300 ms dans un panneau initialement vide est attendu et lu. Cette limite n'est **pas corrigée** : un simple délai arbitraire ne prouverait pas la fraîcheur des données Spotify.

Sur une mesure indicative locale JSDOM, sans émulateur Android, une file synthétique de 400 lignes toutes valides a pris environ 710 ms avant arrêt anticipé à 40 résultats, puis environ 223 ms après. Ces mesures uniques ne sont ni des benchmarks fiables ni des délais téléphone. Si les premières lignes sont invalides, le traitement peut examiner davantage de lignes ; au-delà de 400, il peut ne pas trouver un titre exploitable. Pas de défilement automatique ajouté.

Les champs et codes de diagnostic ne contiennent pas de nouveau texte libre. La File et les autres panneaux n'ont pas été validés sur un appareil authentifié ; le son et Like restent hors preuve.
