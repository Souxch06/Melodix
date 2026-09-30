import * as React from 'react';
import { Alert, Share, StyleSheet, Text, View } from 'react-native';
import Constants from 'expo-constants';

import { COLORS } from '@config';
import {
  clearNativeDiagLog,
  copyNativeDiagLog,
  NATIVE_DIAG_DEFAULT_FLAGS,
  NativeDiagFlags,
  pushNativeDiagFlags,
  readNativeDiagLog,
  readNativeDiagStatus,
} from '../../services/nativeDiag';

import { SettingsRow } from './SettingsRow';
import { SettingsSection } from './SettingsSection';
import { SettingsSwitch } from './SettingsSwitch';

/**
 * SECTION TEMPORAIRE « Diagnostic technique » (4.4.8-diagnostic).
 *
 * Objectif : récupérer le crash natif DIRECTEMENT depuis l'application,
 * SANS ADB (cahier §5) :
 *  1. AFFICHE version Melodix, statut instantané de la couche MediaSession
 *     (booléens natifs du contrôleur) et un aperçu du journal persistant
 *     filesDir/melodix-native-crash.log (breadcrumbs MXDIAG + exceptions
 *     rattrapées ou NON, pile complète, thread nom+id, timestamp UTC) ;
 *  2. boutons : « Copier le diagnostic » (PRESSE-PAPIERS système via
 *     ClipboardManager natif), « Partager le journal » (feuille système),
 *     « Rafraîchir », « Effacer le diagnostic » ;
 *  3. drapeaux d'isolation natifs (A/B + Test C) — chaque interrupteur
 *     désactive UNE SEULE responsabilité de la couche MediaSession :
 *       - Désactiver complètement MediaSession (A/B : expo-av/audio/fond
 *         INTACTS, zéro service Android démarré)
 *       - Ne pas créer la MediaSession        (C1)
 *       - Ne pas créer le player virtuel      (C2 — implique pas de session)
 *       - Ne pas projeter l'état              (C3)
 *       - Ne pas projeter les métadonnées     (C4)
 *     Repousser l'interrupteur sur OFF restaure le chemin complet.
 *
 * Zéro comportement modifié par défaut : tous les drapeaux naissent à
 * false et le VRAI crash reste possible (le piège d'exceptions délègue
 * toujours au handler précédent). À RETIRER une fois le crash corrigé.
 */

/** Nombre de lignes de queue affichées dans l'aperçu (journal borné < 512 Ko). */
const PREVIEW_LINES = 24;
const PREVIEW_MAX_CHARS = 4000;

const buildPreview = (content: string): string => {
  const lines = content.split('\n').filter((line) => line.trim().length > 0);
  const tail = lines.slice(-PREVIEW_LINES).join('\n');
  return tail.length > PREVIEW_MAX_CHARS
    ? tail.slice(-PREVIEW_MAX_CHARS)
    : tail;
};

export const NativeDiagSection = () => {
  const [flags, setFlags] = React.useState<NativeDiagFlags>(
    NATIVE_DIAG_DEFAULT_FLAGS
  );
  const [status, setStatus] = React.useState<string>('—');
  const [preview, setPreview] = React.useState<string>('');
  const [hasContent, setHasContent] = React.useState<boolean>(false);

  const version = Constants.expoConfig?.version ?? 'inconnue';

  const refresh = React.useCallback(() => {
    setStatus(readNativeDiagStatus());
    const content = readNativeDiagLog();
    setHasContent(content.trim().length > 0);
    setPreview(content.trim() ? buildPreview(content) : '');
  }, []);

  React.useEffect(() => {
    refresh();
  }, [refresh]);

  const toggle = (key: keyof NativeDiagFlags) => (value: boolean) => {
    const next = { ...flags, [key]: value };
    setFlags(next);
    pushNativeDiagFlags(next);
  };

  const copyDiag = () => {
    if (!hasContent) {
      Alert.alert(
        'Diagnostic technique',
        "Le journal est vide.\n\nLance une lecture avec « Lecture en arrière-plan » activée, laisse l'application se fermer, rouvre-la puis reviens ici."
      );
      return;
    }

    const copied = copyNativeDiagLog();
    Alert.alert(
      'Diagnostic technique',
      copied
        ? 'Le diagnostic complet est dans le presse-papiers. Colle-le dans le message de retour.'
        : 'La copie vers le presse-papiers a échoué — utilise « Partager le journal » à la place.'
    );
    refresh();
  };

  const shareLog = async () => {
    const content = readNativeDiagLog();

    if (!content.trim()) {
      Alert.alert(
        'Diagnostic technique',
        "Le journal est vide.\n\nLance une lecture avec « Lecture en arrière-plan » activée pour l'alimenter."
      );
      return;
    }

    const header =
      `Melodix ${version} — journal de diagnostic natif (melodix-native-crash.log)\n` +
      `Couche MediaSession : ${readNativeDiagStatus()}\n` +
      `Lignes : ${content.split('\n').length}\n\n`;

    try {
      await Share.share({ message: header + content });
    } catch {
      // Partage annulé/refusé : aucun effet de bord.
    }

    refresh();
  };

  const clearLog = () => {
    clearNativeDiagLog();
    Alert.alert(
      'Diagnostic technique',
      'Le journal de diagnostic a été effacé.'
    );
    refresh();
  };

  return (
    <SettingsSection
      title="Diagnostic technique"
      testID="settings-section-native-diag"
    >
      <SettingsRow
        label="Version Melodix"
        value={version}
        testID="settings-native-diag-version"
      />
      <SettingsRow
        label="Couche MediaSession"
        value={status}
        testID="settings-native-diag-status"
      />
      <View style={styles.logBox} testID="settings-native-diag-preview">
        <Text style={styles.logTitle}>Journal natif (aperçu de la fin)</Text>
        <Text style={styles.logText}>
          {preview ||
            "Vide — lance une lecture avec « Lecture en arrière-plan » activée pour l'alimenter."}
        </Text>
      </View>
      <SettingsRow
        label="Copier le diagnostic"
        showChevron
        onPress={copyDiag}
        testID="settings-native-diag-copy"
      />
      <SettingsRow
        label="Partager le journal"
        showChevron
        onPress={shareLog}
        testID="settings-native-diag-share"
      />
      <SettingsRow
        label="Rafraîchir l'aperçu"
        showChevron
        onPress={refresh}
        testID="settings-native-diag-refresh"
      />
      <SettingsRow
        label="Effacer le diagnostic"
        showChevron
        onPress={clearLog}
        testID="settings-native-diag-clear"
      />
      <SettingsSwitch
        label="Désactiver complètement MediaSession"
        subtitle="A/B — le service natif n'est JAMAIS démarré ; expo-av, l'audio et la lecture en arrière-plan restent actifs"
        value={flags.skipServiceStart}
        onValueChange={toggle('skipServiceStart')}
        testID="settings-native-diag-no-service"
      />
      <SettingsSwitch
        label="Ne pas créer la MediaSession"
        subtitle="Test C1 — le service démarre, la session n'est jamais construite"
        value={flags.skipSessionCreate}
        onValueChange={toggle('skipSessionCreate')}
        testID="settings-native-diag-no-session"
      />
      <SettingsSwitch
        label="Ne pas créer le player virtuel"
        subtitle="Test C2 — implique aussi l'absence de MediaSession"
        value={flags.skipPlayerCreate}
        onValueChange={toggle('skipPlayerCreate')}
        testID="settings-native-diag-no-player"
      />
      <SettingsSwitch
        label="Ne pas projeter l'état"
        subtitle="Test C3 — aucune projection JS vers le player virtuel"
        value={flags.skipProjection}
        onValueChange={toggle('skipProjection')}
        testID="settings-native-diag-no-projection"
      />
      <SettingsSwitch
        label="Ne pas projeter les métadonnées"
        subtitle="Test C4 — projection sans titre/artwork (MediaItem nu)"
        value={flags.skipMetadata}
        onValueChange={toggle('skipMetadata')}
        isLast
        testID="settings-native-diag-no-metadata"
      />
    </SettingsSection>
  );
};

const styles = StyleSheet.create({
  logBox: {
    backgroundColor: COLORS.SECONDARY,
    borderRadius: 10,
    marginHorizontal: 12,
    marginTop: 6,
    marginBottom: 2,
    paddingHorizontal: 12,
    paddingVertical: 10,
  },
  logTitle: {
    color: COLORS.GREY,
    fontSize: 11,
    fontWeight: '600',
    marginBottom: 6,
    textTransform: 'uppercase',
  },
  logText: {
    color: COLORS.GREY,
    fontSize: 10,
    lineHeight: 14,
  },
});
