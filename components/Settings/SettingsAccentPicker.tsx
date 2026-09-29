import * as React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import Ionicons from '@expo/vector-icons/Ionicons';

import { COLORS } from '@config';

import { useLanguage, usePreferences } from '@context';
import { ACCENT_PRESETS } from '@services';

export type SettingsAccentPickerPropsType = {
  isLast?: boolean;
  testID?: string;
};

/**
 * Sélecteur d'accent : pastilles des presets réels. L'accent choisi est
 * immédiatement persistant (PreferencesContext) et utilisé par les composants
 * branchés (boutons, switches, onglet actif, sliders…).
 */
export const SettingsAccentPicker = ({
  isLast,
  testID = 'settings-accent',
}: SettingsAccentPickerPropsType) => {
  const { accentId, accentHex, setAccent, t } = usePreferences();
  const language = useLanguage();

  return (
    <View
      style={[styles.container, !isLast && styles.separator]}
      testID={testID}
    >
      <Text style={styles.label}>{t.settingsAccent}</Text>
      <View style={styles.swatches}>
        {ACCENT_PRESETS.map((preset) => {
          const selected = preset.id === accentId;
          return (
            <Pressable
              accessibilityLabel={language === 'en' ? preset.labelEn : preset.labelFr}
              accessibilityRole="button"
              accessibilityState={{ selected }}
              key={preset.id}
              onPress={() => setAccent(preset.id)}
              style={[
                styles.swatch,
                { backgroundColor: preset.hex },
                selected && styles.swatchSelected,
              ]}
              testID={`${testID}-${preset.id}`}
            >
              {selected ? (
                <Ionicons color={COLORS.BLACK} name="checkmark" size={16} />
              ) : null}
            </Pressable>
          );
        })}
        <View
          style={[styles.preview, { borderColor: accentHex }]}
          testID={`${testID}-preview`}
        >
          <Text style={[styles.previewText, { color: accentHex }]} numberOfLines={1}>
            Melodix
          </Text>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 16,
    paddingVertical: 12,
  },
  separator: {
    borderBottomColor: COLORS.BORDER_GREY,
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
  label: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Regular',
    fontSize: 15,
    marginBottom: 10,
  },
  swatches: {
    alignItems: 'center',
    flexDirection: 'row',
  },
  swatch: {
    alignItems: 'center',
    borderRadius: 15,
    height: 30,
    justifyContent: 'center',
    marginRight: 12,
    width: 30,
  },
  swatchSelected: {
    borderColor: COLORS.WHITE,
    borderWidth: 2,
  },
  preview: {
    borderRadius: 14,
    borderWidth: 1,
    marginLeft: 'auto',
    paddingHorizontal: 12,
    paddingVertical: 5,
  },
  previewText: {
    fontFamily: 'SF-Semibold',
    fontSize: 12,
  },
});
