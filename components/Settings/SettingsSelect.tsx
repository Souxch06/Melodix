import * as React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import Ionicons from '@expo/vector-icons/Ionicons';

import { COLORS } from '@config';
import { translations } from '@data';

import { useAccent } from '@context';

export type SettingsSelectOption = {
  id: string;
  label: string;
  /** Option visible mais non fonctionnelle : grisée + « Bientôt disponible »
   * (jamais appliquée — un réglage n'est affiché actif que s'il est réel). */
  disabled?: boolean;
};

export type SettingsSelectPropsType = {
  label: string;
  options: SettingsSelectOption[];
  selectedId: string;
  onSelect: (id: string) => void;
  isLast?: boolean;
  testID?: string;
};

/**
 * Choix exclusif vertical (radio) : coche accentuée sur l'option active.
 * Les options désactivées restent visibles mais honnêtement verrouillées.
 */
export const SettingsSelect = ({
  label,
  options,
  selectedId,
  onSelect,
  isLast,
  testID,
}: SettingsSelectPropsType) => {
  const accent = useAccent();

  return (
    <View
      style={[styles.container, !isLast && styles.separator]}
      testID={testID}
    >
      <Text style={styles.label}>{label}</Text>
      {options.map((option) => {
        const selected = option.id === selectedId;
        return (
          <Pressable
            accessibilityLabel={option.label}
            accessibilityRole="button"
            accessibilityState={{ disabled: option.disabled, selected }}
            key={option.id}
            onPress={() => {
              if (!option.disabled) {
                onSelect(option.id);
              }
            }}
            style={({ pressed }) => [
              styles.option,
              pressed && !option.disabled && styles.optionPressed,
              option.disabled && styles.optionDisabled,
            ]}
            testID={testID ? `${testID}-${option.id}` : undefined}
          >
            <Ionicons
              color={selected ? accent : COLORS.GREY}
              name={selected ? 'radio-button-on' : 'radio-button-off'}
              size={18}
            />
            <Text
              style={[styles.optionLabel, selected && styles.optionSelected]}
            >
              {option.label}
            </Text>
            {option.disabled ? (
              <Text style={styles.comingSoon}>
                {translations.settingsComingSoon}
              </Text>
            ) : null}
          </Pressable>
        );
      })}
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
    marginBottom: 8,
  },
  option: {
    alignItems: 'center',
    borderRadius: 10,
    flexDirection: 'row',
    minHeight: 38,
    paddingHorizontal: 4,
  },
  optionPressed: {
    backgroundColor: COLORS.BORDER_GREY,
  },
  optionDisabled: {
    opacity: 0.45,
  },
  optionLabel: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 14,
    marginLeft: 10,
  },
  optionSelected: {
    color: COLORS.WHITE,
  },
  comingSoon: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 11,
    marginLeft: 'auto',
  },
});
