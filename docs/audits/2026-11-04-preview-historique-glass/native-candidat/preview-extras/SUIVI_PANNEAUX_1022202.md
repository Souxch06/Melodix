# File, Paroles, Appareils — correction et diagnostic

## Faits reproductibles et modifications

- Dans une fixture, le bouton `connect-device-picker` était pris pour le panneau : aucune ouverture ni lecture. Le contrôle interactif est maintenant exclu des racines ; les racines indépendantes multiples ne sont pas choisies arbitrairement.
- La structure avant l'ouverture compte séparément les commandes et les racines, sans texte ni identifiants. Le diagnostic du tiroir indique résultat, codes et comptes autorisés, ainsi que la construction native. Les entrées arbitraires d’un journal sont rejetées.
- Un travail attend une fermeture reconnue avant d'annoncer le résultat. Sans état de fermeture vérifié, il signale `close:unverified`, n'effectue pas de clic supplémentaire aveugle et ne présente pas le contenu comme confirmé. Un panneau déjà ouvert est laissé dans son état initial.
- Une barre latérale contenant des liens de piste n'est pas automatiquement une file. La première ligne n'est plus présumée être en cours de lecture ; seule une marque explicite établit cette catégorie.
- Les messages ne déduisent plus « pas de paroles » ou « aucun appareil » d'un échec de lecture.

## Limites

Tests DOM et JVM simulés uniquement. La structure et le comportement de la page Spotify sur le téléphone ne sont pas connus ici. En particulier, si l'action ouvre une page `/queue` sans état de fermeture utilisable, le code ne peut pas garantir le retour à la page d'origine : il signale la fermeture non confirmée au lieu de naviguer ou cliquer à l'aveugle. Une fermeture anticipée du tiroir natif peut empêcher la collecte du résultat final du travail en arrière-plan. Aucun transfert de lecture n'est effectué sans confirmation explicite.

Les tests et la garde des sept fichiers protégés ne remplacent pas le contrôle réel décrit dans `CHECKLIST_TEST_TELEPHONE.md`.

## Vérifications locales

- 43 cas JS `mode-queue-jobs.test.cjs` et 7 cas des sondes/lectures : réussis (fixtures DOM).
- Simulation JVM des tiroirs, scénarios de confidentialité, compilation UTF-8 et Smali recompilés : réussis.
- Chaîne locale complète jusqu'à l'APK non signée : réussie ; contrôle des sept ressources protégées 9016 : 7/7.
- Aucun résultat de téléphone, aucune validation du rendu réel ou de la fermeture d'une page `/queue`. **PARTIEL / BLOQUÉ** pour la garantie de fermeture et la disponibilité réelle ; aucune APK signée présentée comme corrigée sur cette seule base.

## Poursuite autonome — travaux concurrents et fermeture anticipée

- Reproduction : un deuxième appui pouvait recevoir `busy`, puis lire le résultat du premier travail comme s'il correspondait au second, y compris lors d'un transfert. Les travaux File/Paroles/Appareils partagent désormais un verrou en mémoire ; `busy` est affiché comme tel, sans interroger ni réutiliser l'ancien résultat.
- Chaque travail reçoit un identifiant technique éphémère, sans donnée de piste ou de compte, absent du diagnostic copiable. Le natif refuse tout résultat dont l'identifiant diffère de celui du travail demandé.
- Si le tiroir natif est fermé avant le résultat d'un travail identifié, une lecture passive et bornée de son état peut compléter le diagnostic, sans afficher son contenu, sans nouvelle action et sans écraser une demande plus récente. Si la page ou l'activité disparaît, le résultat reste inconnu.
- Une fermeture non confirmée met les nouvelles opérations des trois tiroirs en sécurité jusqu'au rechargement de la page : pas de deuxième clic aveugle ni de transfert déclenché après ce constat. Les erreurs asynchrones sont également soldées comme non confirmées.
- Le transfert et la fermeture sont rapportés séparément : un transfert vérifié avec fermeture incertaine ne devient pas un faux « transfert non vérifié » ; un appareil déjà actif n'est pas présenté comme nouvellement transféré.

Ces protections ne constituent **pas** une garantie que la page Spotify se ferme dans tous les cas. En particulier, une navigation `/queue` sans contrôle de retour vérifiable demeure bloquante ; aucune navigation d'historique n'est inventée. Tests de simulation uniquement, aucun téléphone disponible.
- Après un essai de fermeture, des racines multiples restent un état ambigu : même si le bouton paraît désactivé, la fermeture ne peut pas être déclarée vérifiée. Une fixture reproduit ce cas et vérifie le blocage des commandes suivantes.
- Vérification locale finale : chaîne complète jusqu'à l'APK non signée réussie, 77 scénarios JS du lot lecteur/panneaux et simulation JVM, Smali décodé vérifié, sept ressources protégées 9016 identiques. Ceci ne valide ni le service Spotify réel ni la fermeture sur appareil.
