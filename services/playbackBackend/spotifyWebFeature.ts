/**
 * Feature flag LOCAL pour une future intégration de Spotify Web comme moteur
 * de lecture. Désactivé par défaut, en mémoire uniquement : aucune
 * persistance, aucun réglage exposé, aucune config distante.
 *
 * Double verrou délibéré :
 *  1. le flag `enabled` (défaut : false) ;
 *  2. une porte de validation physique : tant que le test sur téléphone
 *     réel (docs/SPOTIFY-WEB-PHYSICAL-TEST.md) n'a pas été consigné comme
 *     PASSED avec sa preuve, `resolveSpotifyWebPlaybackActivation()` refuse
 *     l'activation même si le flag est vrai. Rien n'est déduit ici sur le
 *     DRM, l'audio, la MediaSession réelle, l'audio en arrière-plan ou les
 *     commandes Spotify : tout reste NOT TESTED.
 *
 * VOLONTAIREMENT NON CÂBLÉ : aucun code de production du lecteur
 * (context/PlayerContext.tsx, services/player.ts, services/mediaBridge.ts)
 * n'importe ce module. Il prépare le contrat de sélection pour une phase
 * ultérieure ; l'ordre de production Audius → YouTube reste la seule voie
 * active. Ce fichier est gardé sous test : toute import par le lecteur fera
 * échouer spotifyWebFeature.unit.test.ts tant que la validation physique
 * n'est pas consignée.
 */

export type SpotifyWebPlaybackEngagement = 'audius-youtube' | 'spotify-web';

export type SpotifyWebPhysicalValidation = 'NOT_TESTED' | 'PASSED_ON_DEVICE';

export type SpotifyWebActivationDecision = {
  readonly active: boolean;
  readonly engines: readonly SpotifyWebPlaybackEngagement[];
  readonly blockers: readonly string[];
};

/** Défaut : Spotify Web n'est PAS un moteur de production. */
let enabledFlag = false;

/** Preuve physique non consignée à ce jour : la porte reste fermée. */
let physicalValidation: SpotifyWebPhysicalValidation = 'NOT_TESTED';
let physicalValidationEvidence: string | null = null;

export const isSpotifyWebPlaybackEnabled = (): boolean => enabledFlag;

export const getSpotifyWebPhysicalValidation =
  (): SpotifyWebPhysicalValidation => physicalValidation;

/**
 * Abonnement à l'activation (UI réactive) : notifié à chaque bascule du
 * flag ou consigne de validation physique. Additif — la surface
 * décisionnelle de ce module reste inchangée.
 */
const activationListeners = new Set<() => void>();

const notifyActivationListeners = (): void => {
  activationListeners.forEach((listener) => listener());
};

export const subscribeSpotifyWebPlaybackActivation = (
  listener: () => void
): (() => void) => {
  activationListeners.add(listener);
  return () => {
    activationListeners.delete(listener);
  };
};

/** Bascule le flag LOCAL uniquement — ne prouve en rien une lecture réelle. */
export const setSpotifyWebPlaybackEnabled = (value: boolean): void => {
  enabledFlag = value === true;
  notifyActivationListeners();
};

/**
 * Consigne la validation physique. Exige une référence de preuve non vide
 * (run CI + horodatage, ou test téléphone documenté) : un simple booléen ne
 * peut pas forcer l'ouverture de la porte.
 */
export const recordSpotifyWebPhysicalValidation = (
  passed: boolean,
  evidence: string | null
): void => {
  const trimmed = typeof evidence === 'string' ? evidence.trim() : '';
  if (passed) {
    if (trimmed === '') {
      throw new Error(
        'spotify-web: la validation physique exige une preuve documentée non vide'
      );
    }
    physicalValidation = 'PASSED_ON_DEVICE';
    physicalValidationEvidence = trimmed.slice(0, 200);
  } else {
    physicalValidation = 'NOT_TESTED';
    physicalValidationEvidence = null;
  }
  notifyActivationListeners();
};

export const getSpotifyWebPhysicalValidationEvidence = (): string | null =>
  physicalValidationEvidence;

/**
 * Contrat de sélection EN ATTENTE DE CÂBLAGE : jamais importé par le
 * lecteur. Tant que le double verrou n'est pas levé, les moteurs restent
 * exclusivement `audius-youtube` (cascade interne Audius → YouTube intacte).
 * Quand Spotify Web sera autorisé, il s'INSÈRE devant sans retirer le
 * fallback : ['spotify-web', 'audius-youtube'].
 */
export const resolveSpotifyWebPlaybackActivation =
  (): SpotifyWebActivationDecision => {
    const blockers: string[] = [];
    if (!enabledFlag) {
      blockers.push('flag-local-desactive');
    }
    if (physicalValidation !== 'PASSED_ON_DEVICE') {
      blockers.push('validation-physique-non-consignee');
    }
    const active = blockers.length === 0;
    return {
      active,
      engines: active
        ? (['spotify-web', 'audius-youtube'] as const)
        : (['audius-youtube'] as const),
      blockers,
    };
  };

/** Remet l'état d'usine (flag false, porte fermée) — pour tests uniquement. */
export const resetSpotifyWebPlaybackFeatureForTesting = (): void => {
  enabledFlag = false;
  physicalValidation = 'NOT_TESTED';
  physicalValidationEvidence = null;
  activationListeners.clear();
};
