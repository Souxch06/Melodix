import * as React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { COLORS } from '@config';
import { useUserData } from '@context';
import { translations } from '@data';

/** Prénom exploitable depuis le nom d'affichage Spotify (« Julien R. » → « Julien »). */
export const firstNameOf = (displayName: string): string => {
  const first = displayName.trim().split(/\s+/)[0] ?? '';
  return first || displayName.trim();
};

/** Message d'accueil selon l'heure locale (matin / après-midi / nuit). */
export const greetingForHour = (hour: number, name: string): string => {
  if (hour >= 6 && hour < 18) {
    return translations.homeGreetingMorning(name);
  }
  if (hour >= 18 && hour < 23) {
    return translations.homeGreetingEvening(name);
  }
  return translations.homeGreetingNight(name);
};

/**
 * Bandeau d'accueil personnalisé : « Bonsoir, [Prénom] 👋 » puis
 * « Qu'est-ce que tu veux écouter ? » — aucune donnée fictive : le prénom
 * vient du profil Spotify déjà chargé (repli « Mélomane » du contexte).
 */
export const Greeting = () => {
  const { userData } = useUserData();
  const name = React.useMemo(
    () => firstNameOf(userData?.displayName ?? ''),
    [userData]
  );
  const greeting = React.useMemo(
    () => greetingForHour(new Date().getHours(), name),
    [name]
  );

  return (
    <View style={styles.container} testID="home-greeting">
      <Text numberOfLines={1} style={styles.greeting} testID="home-greeting-text">
        {greeting}
      </Text>
      <Text style={styles.prompt} testID="home-greeting-prompt">
        {translations.homeListenPrompt}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 16,
    paddingTop: 8,
    paddingBottom: 18,
  },
  greeting: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 26,
    letterSpacing: 0.2,
  },
  prompt: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 15,
    lineHeight: 21,
    marginTop: 6,
  },
});

export default Greeting;
