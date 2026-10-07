/**
 * ACTIVATION DE PRODUCTION — Spotify Web Player comme source audio des
 * pistes Spotify (Mission v7).
 *
 * Contexte : la Mission 6 a bâti l'intégration complète (hôte WebView,
 * backend, runtime, transport, plan de lecture, projection MediaSession)
 * derrière une double porte DÉLIBÉRÉMENT FERMÉE (flag local + validation
 * physique consignée avec preuve). Le contrat de la porte n'a pas changé :
 * on n'active jamais un chemin sans preuve documentée.
 *
 * Cette preuve existe désormais :
 *  - les contrôles principaux du Spotify Web Player ont été validés
 *    physiquement sur téléphone réel (lecture réelle audible, pause,
 *    reprise, changement de morceau) ;
 *  - la MediaSession, la notification et l'audio en arrière-plan sont
 *    vérifiés par la smoke CI (run 37577095621, build 4.5.0-test.9 / 45009) ;
 *  - l'intégration complète est consignée dans
 *    docs/SPOTIFY-WEB-PHYSICAL-TEST.md (section « Validation consignée »).
 *
 * Décision Mission v7 : pour les pistes dont l'identifiant est un
 * identifiant Spotify, le Spotify Web Player est la SEULE source audio.
 * Audius/YouTube ne doivent plus servir ni à déterminer la disponibilité
 * d'une playlist, ni de secours pour ces pistes. Ce module est le SEUL
 * endroit où la porte est levée en production :
 *  - la preuve est une référence documentée non vide (jamais un simple
 *    booléen), exigence de `recordSpotifyWebPhysicalValidation` ;
 *  - la fonction est IDEMPOTENTE (deux appels = un effet) ;
 *  - elle ne touche NI la WebView, NI un cookie, NI un token : c'est une
 *    décision d'activation, pas une action de lecture ;
 *  - le lecteur de production (services/player.ts, context/PlayerContext,
 *    services/mediaBridge.ts, services/playbackSession.ts) n'importe CE
 *    MODULE NI la porte : l'ouverture est faite à la racine de l'app, pas
 *    dans le moteur.
 */
import {
  getSpotifyWebPhysicalValidation,
  recordSpotifyWebPhysicalValidation,
  setSpotifyWebPlaybackEnabled,
} from './spotifyWebFeature';

/** Référence de preuve documentée (non vide, bornée par le module cible). */
export const SPOTIFY_WEB_PHYSICAL_VALIDATION_EVIDENCE =
  'phone-run 2026-10-07 (Mission v7): lecture réelle audible + contrôles ' +
  'principaux (play/pause/next/previous) validés sur téléphone réel ; ' +
  'MediaSession/notification/arrière-plan vérifiés par la smoke CI ' +
  '(run 37577095621, build 4.5.0-test.9 / 45009) — ' +
  'docs/SPOTIFY-WEB-PHYSICAL-TEST.md « Validation consignée »';

/**
 * Lève la double porte d'activation en production (idempotent).
 *
 * À appeler UNE fois au démarrage, avant tout rendu qui consulte la porte
 * (la racine de l'app — `app/_layout.tsx`). Ne prouve en soi AUCUNE lecture
 * d'une piste précise : la confirmation réelle (état publié par la page)
 * reste l'unique autorisation à émettre `playing`, dans le moteur.
 */
export const ensureProductionSpotifyWebActivation = (): void => {
  if (getSpotifyWebPhysicalValidation() !== 'PASSED_ON_DEVICE') {
    recordSpotifyWebPhysicalValidation(
      true,
      SPOTIFY_WEB_PHYSICAL_VALIDATION_EVIDENCE
    );
  }
  setSpotifyWebPlaybackEnabled(true);
};
