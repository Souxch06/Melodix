import * as React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { COLORS } from '@config';
import { useTranslations } from '@context';
import { SettingsScreen, SettingsSection } from '@components';

/**
 * FAQ in-app : 5 vraies réponses (connexion PKCE, cascades Audius→YouTube,
 * cache des correspondances, déconnexion, données locales). Aucune promesse
 * fictive — tout est écrit d'après le fonctionnement réel de l'app.
 */
export const SettingsFaqScreen = () => {
  const t = useTranslations();

  const entries: { question: string; answer: string; testID: string }[] = [
    { question: t.faqLoginQ, answer: t.faqLoginA, testID: 'faq-login' },
    {
      question: t.faqPlaybackQ,
      answer: t.faqPlaybackA,
      testID: 'faq-playback',
    },
    { question: t.faqSourcesQ, answer: t.faqSourcesA, testID: 'faq-sources' },
    { question: t.faqCacheQ, answer: t.faqCacheA, testID: 'faq-cache' },
    { question: t.faqAccountQ, answer: t.faqAccountA, testID: 'faq-account' },
  ];

  return (
    <SettingsScreen testID="settings-faq-screen" title={t.settingsFaq}>
      <Text style={styles.intro} testID="settings-faq-intro">
        {t.faqIntro}
      </Text>
      {entries.map((entry) => (
        <SettingsSection key={entry.testID}>
          <View style={styles.entry} testID={`settings-${entry.testID}`}>
            <Text style={styles.question}>{entry.question}</Text>
            <Text style={styles.answer}>{entry.answer}</Text>
          </View>
        </SettingsSection>
      ))}
    </SettingsScreen>
  );
};

const styles = StyleSheet.create({
  intro: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    lineHeight: 19,
    marginBottom: 16,
    paddingHorizontal: 4,
  },
  entry: {
    paddingHorizontal: 16,
    paddingVertical: 14,
  },
  question: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
  },
  answer: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    lineHeight: 19,
    marginTop: 8,
  },
});
