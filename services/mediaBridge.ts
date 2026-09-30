/**
 * mediaBridge (phase 5A) — pont MINCE entre `melodixPlayer` et le module
 * natif MelodixMedia (MediaSession Android).
 *
 * Sens UNIQUE de l'état : JS → Android (projection titre/artistes/album/
 * pochette/durée/position/playing). Commandes : Android → JS, relayées vers
 * les MÊMES méthodes publiques du moteur que l'UI.
 *
 * INTERDITS (contrats phase 5) :
 *  - aucune logique de queue / shuffle / repeat ;
 *  - aucune résolution Audius/YouTube ;
 *  - aucune URL de flux projetée ;
 *  - aucune source de vérité parallèle (pas d'état courant dupliqué) ;
 *  - JAMAIS d'autoplay au boot : le service n'est activé QUE sur le premier
 *    statut 'playing' réel émis par le moteur (action utilisateur) — tout
 *    état avec morceau mais SANS lecture préalable ('idle'/'loading'/
 *    'paused' de restauration) est rejeté sans appel natif — une session
 *    restaurée qui DORT ne déclenche rien. Une fois activée, pause/reprise
 *    du morceau en cours projettent normalement.
 */
import {
  addMediaCommandListener,
  requestMediaNotificationPermission,
  stopSession,
  updateSession,
} from '../modules/melodix-media';
import type {
  MediaCommand,
  MediaSessionPayload,
} from '../modules/melodix-media';

import { melodixPlayer } from './player';
import type { PlayerState } from './player';

let bridgeEnabled = false;
let initialized = false;
let unsubscribePlayer: (() => void) | null = null;
let unsubscribeCommands: (() => void) | null = null;
/** Le service n'a été sollicité QUE si une lecture réelle l'a activé. */
let sessionActivated = false;
/**
 * 5C.1 : permission de notification demandée UNE FOIS par activation —
 * au moment du démarrage réel d'une lecture en arrière-plan (geste play
 * récent, app au premier plan). Couvre le cas du réglage « lecture en
 * arrière-plan » RESTAURÉ à vrai (aucune demande au boot, jamais) et un
 * premier refus ignoré. Idempotent : si déjà accordée, l'appel natif
 * retourne true sans aucune boîte de dialogue.
 */
let notificationPermissionAsked = false;
/** Déduplication : signature JSON du dernier payload RÉELLEMENT poussé. */
let lastPushedSignature = '';

/** Appel natif blindé : une couche de CONTRÔLE ne fait jamais crasher le
 * moteur audio même si Android jette (§11 résilience). */
const callNative = (fn: () => void): void => {
  try {
    fn();
  } catch (error) {
    console.warn('MelodixMedia native error (tolerated):', error);
  }
};

/**
 * Construit la projection d'un état moteur. PURE (testable Jest) : aucune
 * URL de flux n'apparaît, seules les métadonnées d'affichage.
 */
export const buildMediaSessionPayload = (
  state: PlayerState
): MediaSessionPayload | null => {
  const track = state.current;

  if (!track) {
    return null;
  }

  return {
    trackId: track.id,
    title: track.title,
    artist: track.artists.join(', '),
    album: track.album ?? null,
    artworkUrl: track.imageURL || null,
    durationMillis:
      state.durationMillis > 0
        ? state.durationMillis
        : (track.durationMillis ?? 0),
    positionMillis: Math.max(0, state.positionMillis),
    isPlaying: state.status === 'playing',
  };
};

/**
 * Signature de déduplication : la position est arrondie à la seconde pour
 * éviter de pousser deux projections pour le même seconde (§6 perf).
 */
const signatureOf = (payload: MediaSessionPayload): string =>
  [
    payload.trackId,
    payload.title,
    payload.artist,
    payload.durationMillis,
    Math.round(payload.positionMillis / 1000),
    payload.isPlaying ? 1 : 0,
  ].join('|');

/**
 * Point d'entrée des commandes système. Sécurité PLAY/PAUSE : on n'appelle
 * JAMAIS togglePlayPause quand le moteur est déjà dans l'état demandé —
 * sinon un PLAY système mettrait le morceau en pause (phase 5A, §10).
 */
export const handleMediaCommand = (command: MediaCommand): void => {
  const status = melodixPlayer.getState().status;

  switch (command.command) {
    case 'play':
      if (status === 'paused' || status === 'error') {
        void melodixPlayer.togglePlayPause();
      }
      break;

    case 'pause':
      if (status === 'playing') {
        void melodixPlayer.togglePlayPause();
      }
      break;

    case 'next':
      void melodixPlayer.next();
      break;

    case 'previous':
      void melodixPlayer.previous();
      break;

    case 'seek':
      void melodixPlayer.seekTo(command.positionMillis);
      break;

    case 'stop':
      sessionActivated = false;
      lastPushedSignature = '';
      void melodixPlayer.stop();
      break;
  }
};

/**
 * Projection d'un nouvel état moteur (appelée via subscribe).
 *
 * ANTI-AUTOPLAY VERROUILLÉ (§9 durci) : TANT QU'AUCUNE lecture RÉELLE n'a
 * démarré, AUCUN appel natif — MÊME avec un morceau courant. Rejette donc :
 *  - le boot (`current === null`) ;
 *  - une session restaurée simplement PROPOSÉE (pendingRestore : le moteur
 *    n'est pas touché, aucun état n'arrive — verrou double) ;
 *  - un morceau courant 'paused' issu d'une restauration AUTOMATIQUE ;
 *  - les états transitoires 'idle'/'loading' émis avec un morceau par
 *    restoreSession()/playQueue() AVANT le premier son.
 * L'activation exige un statut 'playing' émis par le MOTEUR — qui n'existe
 * qu'après une action utilisateur réelle (lecture, « Reprendre », commande
 * système PLAY). Une fois la session activée, la pause/reprise normale du
 * morceau en cours projette librement (jamais de réinitialisation en pause).
 */
const projectState = (state: PlayerState): void => {
  if (!bridgeEnabled) {
    return;
  }

  const payload = buildMediaSessionPayload(state);

  if (!payload) {
    // Plus de morceau (stop explicite) : fermeture propre si le service
    // avait été activé, sinon AUCUNE interaction avec le natif (anti-boot).
    if (sessionActivated) {
      sessionActivated = false;
      notificationPermissionAsked = false;
      lastPushedSignature = '';
      callNative(stopSession);
    }

    return;
  }

  // LE VERROUILLAGE : aucune activation sans lecture réelle ('playing').
  if (!sessionActivated && !payload.isPlaying) {
    return;
  }

  const pushed = signatureOf(payload);

  if (pushed === lastPushedSignature) {
    return; // rien de neuf à projeter (anti-spam sur ticks 500 ms)
  }

  sessionActivated = true;
  lastPushedSignature = pushed;

  if (!notificationPermissionAsked) {
    notificationPermissionAsked = true;
    // Fire-and-forget : la lecture, le service et la session ne dépendent
    // JAMAIS de la réponse (Android gère la visibilité de la notification).
    try {
      requestMediaNotificationPermission();
    } catch {
      // Tolérant : jamais de blocage pour l'audio (§10 phase 5C).
    }
  }

  callNative(() => updateSession(payload));
};

/**
 * Activation du bridge (réglage « Lecture en arrière-plan », §8).
 * Désactivé : plus aucune projection et le service actif est arrêté.
 */
export const setMediaBridgeEnabled = (enabled: boolean): void => {
  bridgeEnabled = enabled;

  if (!enabled && sessionActivated) {
    sessionActivated = false;
    notificationPermissionAsked = false;
    lastPushedSignature = '';
    callNative(stopSession);
  }
};

export const isMediaBridgeEnabled = (): boolean => bridgeEnabled;

/**
 * Initialise l'écoute (UNE SEULE FOIS). Chaque commande et chaque tick
 * passent par les mêmes méthodes/états que l'UI : zéro état parallèle.
 */
export const initMediaBridge = (): void => {
  if (initialized) {
    return;
  }

  initialized = true;

  unsubscribePlayer = melodixPlayer.subscribe(projectState);
  unsubscribeCommands = addMediaCommandListener(handleMediaCommand);
};

/** Démontage complet (tests, logout éventuel) — idempotent. */
export const teardownMediaBridge = (): void => {
  try {
    unsubscribePlayer?.();
    unsubscribePlayer = null;
    unsubscribeCommands?.();
    unsubscribeCommands = null;

    if (sessionActivated) {
      sessionActivated = false;
      notificationPermissionAsked = false;
      lastPushedSignature = '';
      callNative(stopSession);
    }
  } finally {
    initialized = false;
  }
};
