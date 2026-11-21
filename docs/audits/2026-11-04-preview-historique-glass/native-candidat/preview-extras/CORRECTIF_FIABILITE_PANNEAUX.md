# Preview — fiabilité File, Paroles et Appareils

Ce candidat vise plusieurs causes d'indisponibilité reproduites en simulation ; aucun téléphone ni DOM Spotify réel n'a été validé. Le diagnostic du téléphone reste indispensable si les panneaux ne s'affichent pas.

- File : une seule chaîne de racines imbriquées est reconnue comme un seul panneau ; plusieurs branches indépendantes restent ambiguës. La racine extérieure est retenue pour ne pas perdre des lignes.
- Fermeture : après une seule commande, vérifier l'état pendant au plus 900 ms au lieu d'une seule fois à 150 ms. Un ancêtre masqué par CSS est reconnu. Si le même déclencheur n'annonce aucun état, une fermeture spécifique au panneau suivie de la disparition ou du masquage du panneau peut être confirmée. Aucun choix arbitraire n'est effectué si le déclencheur a changé ou si le panneau reste ambigu. Si la fermeture reste incertaine, le verrou de sécurité subsiste.
- Paroles : un bouton de fermeture dont le testid contient `lyric` n'est plus pris pour une ligne, ce qui permet le repli sur les paragraphes.
- Appareils : ne pas cliquer une cible masquée ou désactivée ; après clic, ne pas confirmer par nom si plusieurs cibles de ce nom sont présentes au moment de la vérification. Cela ne garantit pas une identité stable si un appareil est remplacé par un autre de même nom entre deux lectures.
- Tests : `drawer-reliability.test.cjs` vérifie les cas positifs et les refus de sécurité ; les scripts de panneaux et leurs deux copies Smali sont vérifiés au niveau des sources et de l'APK décodé. Les scénarios restent synthétiques.

Limites : un panneau tardif, un DOM non reconnu, une capture de contenu encore incomplet ou caché, un déclencheur remplacé, une fermeture plus lente que la borne, une page `/queue` sans retour observable ou une racine ambiguë peuvent encore échouer ou présenter une information incomplète. Le correctif ne résout pas le risque Like établi séparément ; ne pas l'utiliser pour valider ce candidat. Ne pas considérer le transfert comme prouvé par le simple changement d'un état Web simulé.
