import * as React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import Constants from 'expo-constants';

import { COLORS } from '@config';
import { useTranslations } from '@context';
import { SettingsScreen, SettingsSection } from '@components';

/**
 * Page « À propos » in-app : CGU, confidentialité, licences et crédits, en
 * texte réel (pas de lien mort ni de placeholder). Version lue depuis la
 * configuration Expo réelle (app.json).
 */
export const SettingsAboutScreen = () => {
  const t = useTranslations();
  const version = Constants.expoConfig?.version ?? '—';

  const blocks: { title: string; body: string; testID: string }[] = [
    { title: t.settingsTerms, body: t.aboutTermsBody, testID: 'about-terms' },
    {
      title: t.settingsPrivacy,
      body: t.aboutPrivacyBody,
      testID: 'about-privacy',
    },
    {
      title: t.settingsLicenses,
      body: t.aboutLicensesBody,
      testID: 'about-licenses',
    },
    {
      title: t.settingsCredits,
      body: t.settingsCreditsBody,
      testID: 'about-credits',
    },
  ];

  return (
    <SettingsScreen
      testID="settings-about-screen"
      title={t.settingsSectionAbout}
    >
      <View style={styles.hero} testID="settings-about-hero">
        <Text style={styles.appName}>Melodix</Text>
        <Text style={styles.version} testID="settings-about-version">
          {t.settingsVersion} {version}
        </Text>
      </View>
      {blocks.map((block) => (
        <SettingsSection key={block.testID} title={block.title}>
          <View style={styles.block} testID={`settings-${block.testID}`}>
            <Text style={styles.body}>{block.body}</Text>
          </View>
        </SettingsSection>
      ))}
    </SettingsScreen>
  );
};

const styles = StyleSheet.create({
  hero: {
    alignItems: 'center',
    marginBottom: 24,
    paddingTop: 8,
  },
  appName: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 26,
  },
  version: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    marginTop: 4,
  },
  block: {
    paddingHorizontal: 16,
    paddingVertical: 14,
  },
  body: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    lineHeight: 20,
  },
});
