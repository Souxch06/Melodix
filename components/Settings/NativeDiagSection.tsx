import * as React from 'react';
import { Alert, Share } from 'react-native';

import {
  clearNativeDiagLog,
  NATIVE_DIAG_DEFAULT_FLAGS,
  NativeDiagFlags,
  pushNativeDiagFlags,
  readNativeDiagLog,
} from '../../services/nativeDiag';

import { SettingsRow } from './SettingsRow';
import { SettingsSection } from './SettingsSection';
import { SettingsSwitch } from './SettingsSwitch';

/**
 * SECTION TEMPORAIRE « Diagnostic technique » (4.4.7-diagnostic).
 *
 * Objectif : diagnostiquer le crash MediaSession SANS ADB. Deux outils :
 *  1. copier/partager le journal natif persistant (breadcrumbs MXDIAG +
 *     exceptions rattrapées ou NON, pile complète, threads, timestamp) ;
 *  2. drapeaux d'isolation natifs (A/B + Test C) — chaque interrupteur
 *     désactive UNE SEULE responsabilité de la couche MediaSession :
 *       - Ne pas démarrer le service         (A/B complet)
 *       - Ne pas créer la MediaSession        (C1)
 *       - Ne pas créer le player virtuel      (C2 — implique pas de session)
 *       - Ne pas projeter l'état              (C3)
 *       - Ne pas projeter les métadonnées     (C4)
 *     Repousser l'interrupteur sur OFF restaure le chemin complet.
 *
 * Zéro comportement modifié par défaut : tous les drapeaux naissent à
 * false. À RETIRER intégralement une fois le crash corrigé.
 */
export const NativeDiagSection = () => {
  const [flags, setFlags] = React.useState<NativeDiagFlags>(
    NATIVE_DIAG_DEFAULT_FLAGS
  );

  const toggle = (key: keyof NativeDiagFlags) => (value: boolean) => {
    const next = { ...flags, [key]: value };
    setFlags(next);
    pushNativeDiagFlags(next);
  };

  const shareLog = async () => {
    const content = readNativeDiagLog();

    if (!content.trim()) {
      Alert.alert(
        'Diagnostic technique',
        'Le journal natif est vide (ou le module média est absent sur cette plateforme).\n\n' +
          "Lance une lecture avec « Lecture en arrière-plan » activée pour l'alimenter."
      );
      return;
    }

    const header =
      'Melodix — journal de diagnostic natif (melodix-native-crash.log)\n' +
      `Lignes : ${content.split('\n').length}\n\n`;

    try {
      await Share.share({ message: header + content });
    } catch {
      // Partage annulé : aucune action (le journal reste intact).
    }
  };

  const clearLog = () => {
    clearNativeDiagLog();
    Alert.alert('Diagnostic technique', 'Journal natif vidé.');
  };

  return (
    <SettingsSection
      title="Diagnostic technique (temporaire)"
      testID="settings-section-native-diag"
    >
      <SettingsRow
        label="Partager le journal de diagnostic"
        onPress={() => {
          void shareLog();
        }}
        showChevron={false}
        subtitle="Trace native complète (MediaSession) — aucune donnée sensible"
        testID="settings-native-diag-share"
      />
      <SettingsRow
        label="Vider le journal"
        onPress={clearLog}
        showChevron={false}
        testID="settings-native-diag-clear"
      />
      <SettingsSwitch
        label="Isolation A/B — ne pas démarrer le service"
        onValueChange={toggle('skipServiceStart')}
        subtitle="Audio en arrière-plan actif, MediaSession totalement désactivée"
        testID="settings-native-diag-no-service"
        value={flags.skipServiceStart}
      />
      <SettingsSwitch
        label="Test C1 — ne pas créer la MediaSession"
        onValueChange={toggle('skipSessionCreate')}
        testID="settings-native-diag-no-session"
        value={flags.skipSessionCreate}
      />
      <SettingsSwitch
        label="Test C2 — ne pas créer le player virtuel"
        onValueChange={toggle('skipPlayerCreate')}
        testID="settings-native-diag-no-player"
        value={flags.skipPlayerCreate}
      />
      <SettingsSwitch
        label="Test C3 — ne pas projeter l'état"
        onValueChange={toggle('skipProjection')}
        testID="settings-native-diag-no-projection"
        value={flags.skipProjection}
      />
      <SettingsSwitch
        isLast
        label="Test C4 — ne pas projeter les métadonnées"
        onValueChange={toggle('skipMetadata')}
        testID="settings-native-diag-no-metadata"
        value={flags.skipMetadata}
      />
    </SettingsSection>
  );
};
