/**
 * Écran de connexion (affiché automatiquement sans session Spotify valide).
 *
 * Design : sombre Melodix, titre "Bienvenue sur Melodix", un SEUL appel à
 * l'action « Continuer avec Spotify » (OAuth PKCE via la page officielle).
 * Lien secondaire discret « Explorer sans compte » pour conserver le mode
 * local/Audius de Melodix 3.0 à portée de main.
 *
 * AUCUN champ credential : ni Client ID, ni secret, ni token n'est jamais
 * demandé — tout est géré par la configuration du build du mainteneur.
 */
import * as React from 'react';
import {
  ActivityIndicator,
  Image,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { useRouter } from 'expo-router';

import { COLORS } from '@config';
import { translations } from '@data';
import { isSpotifyLoginConfigured, useSpotifyAuth } from '@services';

export const LoginScreen = () => {
  const router = useRouter();
  const { state, isBusy, startLogin, resetError } = useSpotifyAuth();
  const configured = React.useMemo(() => isSpotifyLoginConfigured(), []);

  const errorText = React.useMemo(() => {
    if (state.status !== 'error') {
      return null;
    }
    switch (state.outcome.kind) {
      case 'cancelled':
        return translations.loginCancelled;
      case 'not-configured':
        return translations.loginNotConfigured;
      case 'unavailable':
      default:
        return translations.loginUnavailable;
    }
  }, [state]);

  const statusText = React.useMemo(() => {
    if (state.status === 'requesting') {
      return translations.loginConnecting;
    }
    if (state.status === 'exchanging') {
      return translations.loginExchanging;
    }
    return null;
  }, [state]);

  const handleSpotifyPress = React.useCallback(() => {
    if (isBusy) {
      return;
    }
    if (errorText) {
      resetError();
    }
    void startLogin();
  }, [isBusy, errorText, resetError, startLogin]);

  const handleLocalPress = React.useCallback(() => {
    router.replace({ pathname: '/(tabs)/home', params: {} });
  }, [router]);

  return (
    <View style={styles.container}>
      <View style={styles.topSpacer} />

      <Image
        source={require('@assets/images/logo.png')}
        style={styles.logo}
        resizeMode="contain"
        testID="login-logo"
      />

      <Text style={styles.welcome}>{translations.loginWelcome}</Text>
      <Text style={styles.tagline}>{translations.loginTagline}</Text>
      <Text style={styles.description}>{translations.loginDescription}</Text>

      <Pressable
        accessibilityRole="button"
        disabled={!configured || isBusy}
        onPress={handleSpotifyPress}
        style={({ pressed }) => [
          styles.primaryButton,
          (!configured || isBusy) && styles.primaryButtonDisabled,
          pressed && styles.primaryButtonPressed,
        ]}
        testID="login-spotify-button"
      >
        {isBusy ? (
          <ActivityIndicator color={COLORS.BLACK} />
        ) : (
          <Text style={styles.primaryButtonText}>
            {translations.loginContinue}
          </Text>
        )}
      </Pressable>

      {statusText && (
        <View style={styles.statusRow}>
          <ActivityIndicator color={COLORS.TINT} size="small" />
          <Text style={styles.statusText}>{statusText}</Text>
        </View>
      )}

      {errorText && (
        <Text style={styles.errorText} testID="login-error-text">
          {errorText}
        </Text>
      )}

      {!configured && (
        <Text style={styles.configurationNote} testID="login-not-configured-note">
          {translations.loginNotConfigured}
        </Text>
      )}

      <Text style={styles.privacyNote}>{translations.loginPrivacyNote}</Text>

      <Pressable
        accessibilityRole="button"
        onPress={handleLocalPress}
        style={styles.localLink}
        testID="login-local-link"
      >
        <Text style={styles.localLinkText}>
          {translations.loginContinueWithoutAccount}
        </Text>
      </Pressable>
    </View>
  );
};

/** Échelle d'espacements locale à l'écran. */
const SPACE = { xxs: 4, xs: 8, sm: 12, md: 16, lg: 20, xl: 24, xxl: 32 };

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.PRIMARY,
    alignItems: 'center',
    paddingHorizontal: SPACE.xl,
    paddingBottom: SPACE.xxl,
  },
  topSpacer: { height: 96 },
  logo: {
    width: 110,
    height: 110,
    marginBottom: SPACE.xl,
  },
  welcome: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 26,
    textAlign: 'center',
  },
  tagline: {
    color: COLORS.TINT,
    fontFamily: 'SF-Semibold',
    fontSize: 16,
    textAlign: 'center',
    marginTop: SPACE.xs,
  },
  description: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 14,
    textAlign: 'center',
    lineHeight: 20,
    marginTop: SPACE.md,
    maxWidth: 340,
  },
  primaryButton: {
    backgroundColor: COLORS.TINT,
    borderRadius: 999,
    paddingVertical: SPACE.md,
    paddingHorizontal: SPACE.xxl,
    marginTop: SPACE.xxl,
    minWidth: 280,
    alignItems: 'center',
    justifyContent: 'center',
    minHeight: 56,
  },
  primaryButtonPressed: { opacity: 0.85 },
  primaryButtonDisabled: { opacity: 0.55 },
  primaryButtonText: {
    color: COLORS.BLACK,
    fontFamily: 'SF-Semibold',
    fontSize: 16,
  },
  statusRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: SPACE.md,
    gap: SPACE.xs,
  },
  statusText: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    marginLeft: SPACE.xs,
  },
  errorText: {
    color: COLORS.RED,
    fontFamily: 'SF-Regular',
    fontSize: 14,
    textAlign: 'center',
    marginTop: SPACE.md,
    lineHeight: 20,
  },
  configurationNote: {
    color: COLORS.LIGHTER_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    textAlign: 'center',
    marginTop: SPACE.md,
    lineHeight: 19,
  },
  privacyNote: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 12,
    textAlign: 'center',
    lineHeight: 17,
    marginTop: SPACE.xl,
    maxWidth: 340,
  },
  localLink: {
    paddingVertical: SPACE.md,
    paddingHorizontal: SPACE.lg,
    marginTop: SPACE.sm,
  },
  localLinkText: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 14,
    textDecorationLine: 'underline',
  },
});
