/**
 * Wrapper JS du module natif `MelodixMedia` (phase 5A).
 *
 * RÔLE STRICT : couche de CONTRÔLE Android MediaSession pour `melodixPlayer`.
 * Ce module ne joue AUCUN audio (moteur = expo-av), ne résout aucun morceau,
 * et ne stocke aucune file — il reçoit une projection d'état et renvoie des
 * commandes. Tout est tolérant à l'absence du natif (Jest, iOS, web) : les
 * appels deviennent des no-op silencieux.
 */
import { EventEmitter, requireNativeModule } from 'expo-modules-core';

export type MediaCommand =
  | { command: 'play' }
  | { command: 'pause' }
  | { command: 'next' }
  | { command: 'previous' }
  | { command: 'stop' }
  | { command: 'seek'; positionMillis: number };

/** Projection d'état poussée vers Android — jamais d'URL de flux dedans. */
export type MediaSessionPayload = {
  trackId: string;
  title: string;
  artist: string;
  album: string | null;
  artworkUrl: string | null;
  durationMillis: number;
  positionMillis: number;
  isPlaying: boolean;
};

type NativeMelodixMedia = {
  updateSession: (payload: MediaSessionPayload) => void;
  stopSession: () => void;
  requestNotificationPermission: () => boolean | null;
  // DIAG 4.4.7 (temporaire) : journal persistant + drapeaux d'isolation.
  setDiagFlags: (flags: Record<string, boolean>) => void;
  appendDiagLog: (line: string) => void;
  readDiagLog: () => string;
  clearDiagLog: () => void;
};

let nativeModule: NativeMelodixMedia | null = null;
let resolved = false;

const getNativeModule = (): NativeMelodixMedia | null => {
  if (!resolved) {
    resolved = true;

    try {
      nativeModule = requireNativeModule<NativeMelodixMedia>('MelodixMedia');
    } catch {
      nativeModule = null; // Jest / web / iOS : couche contrôle absente, OK.
    }
  }

  return nativeModule;
};

export const isMelodixMediaAvailable = (): boolean =>
  getNativeModule() !== null;

/** Projette l'état de lecteur vers la MediaSession (5A : métadonnées+état). */
export const updateSession = (payload: MediaSessionPayload): void => {
  try {
    getNativeModule()?.updateSession(payload);
  } catch {
    // Jamais de crash audio pour une couche de contrôle (phase 5A, §11).
  }
};

/** Ferme la session/service (stop moteur, réglage désactivé, etc.). */
export const stopSession = (): void => {
  try {
    getNativeModule()?.stopSession();
  } catch {
    // Tolérant : natif indisponible.
  }
};

/**
 * Permission notifications Android 13+ (phase 5C) — demandée au RUNTIME,
 * uniquement quand l'utilisateur active la lecture/background média
 * (jamais au boot). Fire-and-forget : la lecture n'en dépend JAMAIS.
 *
 * @returns true accordée (ou inutile), false refusée/en cours, null si
 *          indéterminé côté natif ; NO-OP silencieux hors Android natif.
 */
export const requestMediaNotificationPermission = (): boolean | null => {
  try {
    return getNativeModule()?.requestNotificationPermission() ?? null;
  } catch {
    return null; // Tolérant : jamais de blocage pour la lecture.
  }
};

/** Abonnement aux commandes système (notification/verrou/casque BT). */
export const addMediaCommandListener = (
  listener: (command: MediaCommand) => void
): (() => void) => {
  const module = getNativeModule();

  if (!module) {
    return () => {};
  }

  try {
    const emitter = new EventEmitter(module as never);
    const subscription = emitter.addListener('mediaCommand', listener);

    return () => subscription.remove();
  } catch {
    return () => {};
  }
};

// ---------------------------------------------------------------------------
// DIAG 4.4.7 (temporaire) — journal persistant on-device, zéro ADB.
// Tous les appels sont tolérants à l'absence du natif (Jest/iOS/web) : no-op.
// ---------------------------------------------------------------------------

/** Drapeaux d'isolation A/B + Test C (tous false par défaut). */
export const setDiagFlags = (flags: Record<string, boolean>): void => {
  try {
    getNativeModule()?.setDiagFlags(flags);
  } catch {
    // Diagnostic jamais bloquant.
  }
};

/** Ajoute une ligne au journal natif (miroir des breadcrumbs JS). */
export const appendDiagLog = (line: string): void => {
  try {
    getNativeModule()?.appendDiagLog(line);
  } catch {
    // Diagnostic jamais bloquant.
  }
};

/** Lit le journal natif complet ('' si absent/vide ou module indisponible). */
export const readDiagLog = (): string => {
  try {
    return getNativeModule()?.readDiagLog() ?? '';
  } catch {
    return '';
  }
};

/** Vide le journal natif. */
export const clearDiagLog = (): void => {
  try {
    getNativeModule()?.clearDiagLog();
  } catch {
    // Diagnostic jamais bloquant.
  }
};

export default {
  isMelodixMediaAvailable,
  updateSession,
  stopSession,
  requestMediaNotificationPermission,
  addMediaCommandListener,
  setDiagFlags,
  appendDiagLog,
  readDiagLog,
  clearDiagLog,
};
