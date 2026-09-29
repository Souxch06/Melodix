import * as React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { COLORS } from '@config';

export type SettingsSectionPropsType = {
  /** Titre de section (ex. « Compte »). Masqué si absent. */
  title?: string;
  children: React.ReactNode;
  testID?: string;
};

/**
 * Section de paramètres : titre discret au-dessus d'une carte arrondie.
 * Les séparateurs entre lignes sont dessinés par les lignes elles-mêmes
 * (SettingsRow) — la carte ne fournit que le fond et les coins.
 */
export const SettingsSection = ({
  title,
  children,
  testID,
}: SettingsSectionPropsType) => (
  <View style={styles.wrapper} testID={testID}>
    {title ? <Text style={styles.title}>{title.toUpperCase()}</Text> : null}
    <View style={styles.card}>{children}</View>
  </View>
);

const styles = StyleSheet.create({
  wrapper: {
    marginBottom: 24,
  },
  title: {
    color: COLORS.GREY,
    fontFamily: 'SF-Semibold',
    fontSize: 12,
    letterSpacing: 0.8,
    marginBottom: 8,
    marginLeft: 12,
  },
  card: {
    backgroundColor: COLORS.SECONDARY,
    borderRadius: 14,
    overflow: 'hidden',
  },
});
