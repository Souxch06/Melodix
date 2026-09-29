import * as React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import Ionicons from '@expo/vector-icons/Ionicons';

import { COLORS } from '@config';

export type SettingsRowPropsType = {
  label: string;
  /** Précision honnête sous le libellé (ex. source réelle d'un réglage). */
  subtitle?: string;
  /** Valeur courante affichée à droite (ex. « Sombre », « 4.3.0 »). */
  value?: string;
  /** Chevron de navigation (rend la ligne pressable). */
  showChevron?: boolean;
  /** Ligne destructive (ex. « Se déconnecter ») : libellé rouge. */
  destructive?: boolean;
  onPress?: () => void;
  /** Contenu personnalisé à droite (switch, pastilles…). */
  right?: React.ReactNode;
  /** Cache le séparateur bas (dernière ligne d'une section). */
  isLast?: boolean;
  testID?: string;
};

/**
 * Ligne de paramètres : libellé (+ sous-titre) à gauche, valeur / contrôle /
 * chevron à droite. Pressable uniquement si `onPress` est fourni — une ligne
 * sans action réelle ne doit pas sembler cliquable.
 */
export const SettingsRow = ({
  label,
  subtitle,
  value,
  showChevron = false,
  destructive = false,
  onPress,
  right,
  isLast = false,
  testID,
}: SettingsRowPropsType) => {
  const body = (
    <>
      <View style={styles.texts}>
        <Text style={[styles.label, destructive && styles.destructive]}>
          {label}
        </Text>
        {subtitle ? <Text style={styles.subtitle}>{subtitle}</Text> : null}
      </View>
      <View style={styles.right}>
        {right}
        {value ? <Text style={styles.value}>{value}</Text> : null}
        {showChevron ? (
          <Ionicons
            color={COLORS.GREY}
            name="chevron-forward"
            size={18}
            style={styles.chevron}
          />
        ) : null}
      </View>
    </>
  );

  const rowStyle = [
    styles.row,
    !isLast && styles.separator,
  ];

  if (!onPress) {
    return (
      <View style={rowStyle} testID={testID}>
        {body}
      </View>
    );
  }

  return (
    <Pressable
      accessibilityRole="button"
      onPress={onPress}
      style={({ pressed }) => [...rowStyle, pressed && styles.pressed]}
      testID={testID}
    >
      {body}
    </Pressable>
  );
};

const styles = StyleSheet.create({
  row: {
    alignItems: 'center',
    flexDirection: 'row',
    justifyContent: 'space-between',
    minHeight: 52,
    paddingHorizontal: 16,
    paddingVertical: 10,
  },
  separator: {
    borderBottomColor: COLORS.BORDER_GREY,
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
  pressed: {
    backgroundColor: COLORS.BORDER_GREY,
  },
  texts: {
    flex: 1,
    paddingRight: 12,
  },
  label: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Regular',
    fontSize: 15,
  },
  destructive: {
    color: COLORS.RED,
  },
  subtitle: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 12,
    marginTop: 3,
  },
  right: {
    alignItems: 'center',
    flexDirection: 'row',
  },
  value: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 14,
  },
  chevron: {
    marginLeft: 4,
  },
});
