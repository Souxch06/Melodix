# Test téléphone — preview instrumentée test.120

**Avant :** mettre à jour **Melodix Preview** avec test.120, sans effacer les
données ni désinstaller. Le paquet `com.melodix.music.preview` est séparé de
Melodix production : utiliser la Preview pour les trois essais. Terminer les
éventuelles demandes de permission,
se connecter normalement si nécessaire, puis revenir à l'accueil. Garder le même
réseau et ne pas lancer de lecture pendant les trois essais. Si Android refuse
la mise à jour, ne pas désinstaller : signaler le message.

Pour chaque essai, attendre les pochettes **ou 30 secondes maximum**, puis toucher
**Copier le diagnostic**. Coller le texte dans une note avant l'essai suivant.

| Essai | Manipulation |
|---|---|
| **FROID** | Réglages Android → Applications → Melodix → **Forcer l'arrêt**, puis ouvrir Melodix depuis son icône. Ne pas effacer stockage/cache. |
| **CHAUD** | Depuis l'accueil Melodix, faire **Retour** jusqu'à quitter l'application, puis la rouvrir immédiatement depuis l'icône, sans forcer l'arrêt. Android peut recréer l'activité ou tuer le processus : le journal permettra de le distinguer. |
| **ARRIÈRE-PLAN** | Depuis l'accueil Melodix, appuyer sur **Accueil Android**, attendre **30 s**, puis revenir via les applications récentes. |

## Exactement quoi m'envoyer

Trois messages/blocs, étiquetés **FROID**, **CHAUD**, **ARRIÈRE-PLAN**. Pour chacun :

1. Dans le texte collé depuis le bouton, copier **de `MDXPERF-BEGIN v=1 dropped=…`
   jusqu'à `MDXPERF-END`, inclus**, sans supprimer de ligne ni réduire à une
   capture d'écran. Ce bloc ne contient que des catégories, nombres et durées :
   pas de cookie, jeton, URL de playlist ou nom de compte. Ne pas envoyer la
   ligne `url=…` de l'ancien en-tête du diagnostic.
2. Ajouter simplement : **« pochettes visibles vers … s »**, ou **« déjà visibles
   au retour »**, ou **« toujours grises après 30 s »**. Une estimation suffit ;
   ne pas la présenter comme une mesure automatique de pixels.

Une seule fois : modèle du téléphone, version Android et Wi-Fi/4G/5G.
Si le bloc manque, si `dropped` n'est pas `0`, ou si une erreur apparaît,
signaler cela au lieu de fournir des identifiants ou de modifier la session.

**Important :** ce test observe des conditions réelles, il ne force aucune
requête Spotify. À chaud, un écran conservé peut légitimement ne produire ni
nouveau jeton, ni requête, ni callback image. Ce sera rapporté comme tel, pas
comme un temps nul. Le callback Picasso mesure le chargement dans une
ImageView, pas la présentation effective des pixels à l'écran.

L'analyse viendra après réception : chronologie CI et téléphone séparées,
payloads/rendus comptés dans la fenêtre observée, puis goulot chiffré avant toute
optimisation. Aucun secret d'authentification n'est nécessaire.
