/**
 * nativeDiag — 4.4.7-diagnostic (TEMPORAIRE).
 *
 * Relais mince vers le journal persistant natif
 * (filesDir/melodix-native-crash.log, écrit par MelodixDiagLog) :
 *  - miroir des breadcrumbs JS du chemin Play (logcat ReactNativeJS ET
 *    fichier natif, même chronologie) ;
 *  - drapeaux d'isolation A/B + Test C pilotés depuis Réglages ;
 *  - lecture/vidage du journal pour la feuille de partage système.
 *
 * AUCUN comportement n'est modifié : no-op silencieux hors module natif
 * (Jest, iOS, web) et aucune exception ne se propage jamais.
 */
import {
  appendDiagLog,
  clearDiagLog,
  copyDiagLog,
  readDiagLog,
  readDiagStatus,
  setDiagFlags,
} from '../modules/melodix-media';

/** Miroir fichier d'un breadcrumb JS (déjà tracé en console MXDIAG). */
export const diagNativeStep = (step: string): void => {
  try {
    // Module natif absent (Jest/iOS/web) ou mock partiel de test : no-op.
    if (typeof appendDiagLog === 'function') {
      appendDiagLog(step);
    }
  } catch {
    // Le diagnostic ne doit JAMAIS perturber le moteur.
  }
};

/** Drapeaux natifs A/B (skipServiceStart) + Test C (4 sous-étapes). */
export type NativeDiagFlags = {
  skipServiceStart: boolean;
  skipSessionCreate: boolean;
  skipPlayerCreate: boolean;
  skipProjection: boolean;
  skipMetadata: boolean;
};

export const NATIVE_DIAG_DEFAULT_FLAGS: NativeDiagFlags = {
  skipServiceStart: false,
  skipSessionCreate: false,
  skipPlayerCreate: false,
  skipProjection: false,
  skipMetadata: false,
};

/** Pousse les drapeaux vers le natif (appelé à chaque bascule Réglages). */
export const pushNativeDiagFlags = (flags: NativeDiagFlags): void => {
  try {
    if (typeof setDiagFlags === 'function') {
      setDiagFlags({ ...flags });
    }
  } catch {
    // No-op hors natif / mock partiel.
  }
};

/** Journal brut (pour la feuille de partage système — pointe sanitaire ADB). */
export const readNativeDiagLog = (): string => {
  try {
    return typeof readDiagLog === 'function' ? readDiagLog() : '';
  } catch {
    return '';
  }
};

/** Vide le journal natif. */
export const clearNativeDiagLog = (): void => {
  try {
    if (typeof clearDiagLog === 'function') {
      clearDiagLog();
    }
  } catch {
    // No-op hors natif / mock partiel.
  }
};

/**
 * Copie le diagnostic complet dans le PRESSE-PAPIERS système Android
 * (ClipboardManager — exigé par le cahier §5, aucune dépendance JS ajoutée).
 * Retourne true si le presse-papiers a reçu un contenu non vide.
 */
export const copyNativeDiagLog = (): boolean => {
  try {
    return typeof copyDiagLog === 'function' ? copyDiagLog() : false;
  } catch {
    return false;
  }
};

/** Statut instantané de la couche MediaSession (booléens natifs). */
export const readNativeDiagStatus = (): string => {
  try {
    return typeof readDiagStatus === 'function'
      ? readDiagStatus()
      : 'module natif absent';
  } catch {
    return 'module natif absent';
  }
};
