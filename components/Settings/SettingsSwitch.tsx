import * as React from 'react';
import { Platform, Switch } from 'react-native';

import { COLORS } from '@config';

import { useAccent } from '@context';

import { SettingsRow } from './SettingsRow';

export type SettingsSwitchPropsType = {
  label: string;
  subtitle?: string;
  value: boolean;
  onValueChange: (value: boolean) => void;
  isLast?: boolean;
  testID?: string;
};

/**
 * Ligne à interrupteur : teintée de l'accent actif. Le réglage derrière le
 * switch est TOUJOURS branché sur un comportement réel (règle d'or de
 * l'écran) — ce composant n'expose rien de factice.
 */
export const SettingsSwitch = ({
  label,
  subtitle,
  value,
  onValueChange,
  isLast,
  testID,
}: SettingsSwitchPropsType) => {
  const accent = useAccent();

  return (
    <SettingsRow
      isLast={isLast}
      label={label}
      right={
        <Switch
          accessibilityLabel={label}
          onValueChange={onValueChange}
          thumbColor={
            Platform.OS === 'android'
              ? value
                ? accent
                : COLORS.LIGHTER_GREY
              : undefined
          }
          testID={testID ? `${testID}-switch` : undefined}
          trackColor={{ false: COLORS.GREY, true: accent }}
          value={value}
        />
      }
      subtitle={subtitle}
      testID={testID}
    />
  );
};
