/**
 * Écran de connexion — CONNEXION SPOTIFY OBLIGATOIRE.
 *
 * Objectif UX : l'utilisateur a simplement l'impression de « se connecter à
 * Melodix avec son compte Spotify », comme sur n'importe quelle application.
 * AUCUN détail technique n'est affiché (jamais de redirect_uri, PKCE, token,
 * code d'erreur ou « diagnostic » — le diagnostic vit uniquement en logcat).
 *
 * Parcours :
 *
 *    [Logo Melodix]
 *    Bienvenue sur Melodix
 *    Connecte-toi avec ton compte Spotify pour continuer.
 *    ( ● Continuer avec Spotify )            ← gros bouton vert arrondi
 *    Tu seras redirigé vers Spotify pour te
 *    connecter en toute sécurité.
 *
 * - Appui → EXACTEMENT le système OAuth Spotify actuel (+ PKCE), inchangé.
 * - Pendant : « Connexion à Spotify… » puis « Finalisation de la connexion… ».
 * - Erreur : message HUMAIN + bouton « Réessayer » (jamais de cause codée).
 * - Config absente : « La connexion Spotify n'est pas disponible pour le
 *   moment. Réessaie plus tard. » — jamais de champ Client ID/secret.
 * - Succès : confirmation brève « Connexion réussie ! » puis l'accueil,
 *   sans écran intermédiaire inutile.
 */
import * as React from 'react';
import {
  ActivityIndicator,
  Animated,
  Image,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { FontAwesome, Ionicons } from '@expo/vector-icons';
import Constants from 'expo-constants';
import { useRouter } from 'expo-router';

import { COLORS } from '@config';
import { useUserData } from '@context';
// Import direct (hors barrel @context) : l'accent vient des préférences mais
// l'écran doit rester fonctionnel quand le seul contexte utilisateur est
// simulé dans les tests historiques du parcours de connexion.
import { useAccent } from '../context/PreferencesContext';
import { translations } from '@data';
import { isSpotifyLoginConfigured, useSpotifyAuth } from '@services';

/** Messages HUMAINS uniquement — dérivés du LoginOutcome, sans cause dupliquée. */
type ErrorCard = {
  title: string;
  body: string;
  /** false = l'erreur de config n'a pas de « Réessayer » utile */
  retryable: boolean;
} | null;

const ANIM = { fadeIn: 420, slideStart: 14, slideEnd: 0 };
/** Confirmation très brève, puis l'accueil prend la main. */
const SUCCESS_DISPLAY_MS = 1300;

export const LoginScreen = () => {
  const router = useRouter();
  const { state, isBusy, isAuthRequestPending, startLogin, resetError } =
    useSpotifyAuth();
  const { sessionStatus } = useUserData();
  // Accent choisi dans les paramètres (teinte Spotify historique par défaut).
  const accent = useAccent();
  const configured = React.useMemo(() => isSpotifyLoginConfigured(), []);
  const [successShown, setSuccessShown] = React.useState(false);
  const successHandledRef = React.useRef(false);

  // La session vient d'être ouverte (OAuth terminé côté hook) : petite
  // confirmation « Connexion réussie ! » puis l'accueil — sans écran
  // intermédiaire inutile (timer auto, toujours < 2 s, lancé UNE fois).
  React.useEffect(() => {
    if (sessionStatus !== 'spotify' || successHandledRef.current) {
      return;
    }
    successHandledRef.current = true;
    setSuccessShown(true);
    const timer = setTimeout(() => {
      router.replace({ pathname: '/(tabs)/home', params: {} });
    }, SUCCESS_DISPLAY_MS);
    return () => clearTimeout(timer);
  }, [sessionStatus, router]);

  // Animation d'arrivée : fondu + glissement discret.
  const fadeAnim = React.useRef(new Animated.Value(0)).current;
  const slideAnim = React.useRef(new Animated.Value(ANIM.slideStart)).current;
  React.useEffect(() => {
    Animated.parallel([
      Animated.timing(fadeAnim, {
        toValue: 1,
        duration: ANIM.fadeIn,
        useNativeDriver: true,
      }),
      Animated.timing(slideAnim, {
        toValue: ANIM.slideEnd,
        duration: ANIM.fadeIn,
        useNativeDriver: true,
      }),
    ]).start();
  }, [fadeAnim, slideAnim]);

  const errorCard: ErrorCard = React.useMemo(() => {
    if (!configured) {
      // Config absente : message humain dédié — JAMAIS de champ Client ID.
      return {
        title: translations.loginNotConfigured,
        body: translations.loginNotConfiguredBody,
        retryable: false,
      };
    }
    if (state.status !== 'error') {
      return null;
    }
    switch (state.outcome.kind) {
      case 'cancelled':
        return {
          title: translations.loginCancelledTitle,
          body: translations.loginCancelledBody,
          retryable: true,
        };
      case 'oauth-refused':
        return {
          title: translations.loginOAuthRefusedTitle,
          body: translations.loginOAuthRefusedBody,
          retryable: true,
        };
      case 'not-configured':
        return {
          title: translations.loginNotConfigured,
          body: translations.loginNotConfiguredBody,
          retryable: false,
        };
      case 'callback-failed':
      case 'network':
      case 'unknown':
      default:
        // Tout échec technique (réseau, callback, session, inattendu…) se
        // résume à l'usage unique demandé : un message humain + Réessayer.
        return {
          title: translations.loginErrorGenericTitle,
          body: translations.loginErrorGenericBody,
          retryable: true,
        };
    }
  }, [configured, state]);

  const statusText = React.useMemo(() => {
    if (state.status === 'requesting') {
      return translations.loginConnecting;
    }
    if (state.status === 'exchanging') {
      return translations.loginExchanging;
    }
    return null;
  }, [state]);

  const buttonDisabled =
    !configured || isBusy || isAuthRequestPending || Boolean(errorCard);

  const handleSpotifyPress = React.useCallback(() => {
    if (buttonDisabled) {
      return; // anti-double-clic
    }
    void startLogin(); // ← l'OAuth Spotify actuel, inchangé
  }, [buttonDisabled, startLogin]);

  const handleRetryPress = React.useCallback(() => {
    resetError();
    if (!configured) {
      return;
    }
    void startLogin();
  }, [configured, resetError, startLogin]);

  if (successShown) {
    return (
      <View style={styles.screen} testID="login-success-screen">
        <Animated.View style={[styles.successContent, { opacity: fadeAnim }]}>
          <Ionicons
            color={accent}
            name="checkmark-circle"
            size={72}
            testID="login-success-icon"
          />
          <Text style={styles.successText} testID="login-success-text">
            {translations.loginSuccess}
          </Text>
        </Animated.View>
      </View>
    );
  }

  return (
    <View style={styles.screen} testID="login-screen">
      <Animated.View
        style={[
          styles.content,
          { opacity: fadeAnim, transform: [{ translateY: slideAnim }] },
        ]}
      >
        {/* Logo Melodix (héros) */}
        <Image
          source={require('@assets/images/logo.png')}
          style={styles.logo}
          resizeMode="contain"
          accessibilityIgnoresInvertColors
          testID="login-logo"
        />

        <Text style={styles.welcome} testID="login-welcome-text">
          {translations.loginWelcomeTitle}
        </Text>
        <Text style={styles.hint}>{translations.loginConnectHint}</Text>

        {errorCard ? (
          <View style={styles.errorCard} testID="login-error-card">
            <Ionicons color={COLORS.RED} name="alert-circle-outline" size={32} />
            <Text style={styles.errorTitle}>{errorCard.title}</Text>
            <Text style={styles.errorBody}>{errorCard.body}</Text>
            {errorCard.retryable && (
              <Pressable
                accessibilityRole="button"
                onPress={handleRetryPress}
                style={({ pressed }) => [
                  styles.retryButton,
                  { backgroundColor: accent },
                  pressed && styles.retryButtonPressed,
                ]}
                testID="login-retry-button"
              >
                <Text style={styles.retryButtonText}>
                  {translations.loginValidate}
                </Text>
              </Pressable>
            )}
          </View>
        ) : (
          <>
            {/* Gros bouton principal — vert, taille généreuse */}
            <Pressable
              accessibilityRole="button"
              accessibilityState={{ disabled: buttonDisabled, busy: isBusy }}
              disabled={buttonDisabled}
              onPress={handleSpotifyPress}
              style={({ pressed }) => [
                styles.primaryButton,
                { backgroundColor: accent },
                pressed && !buttonDisabled && styles.primaryButtonPressed,
                buttonDisabled && styles.primaryButtonDisabled,
              ]}
              testID="login-spotify-button"
            >
              {isBusy ? (
                <View style={styles.buttonInner}>
                  <ActivityIndicator color={COLORS.BLACK} size="small" />
                </View>
              ) : (
                <View style={styles.buttonInner}>
                  <FontAwesome color={COLORS.BLACK} name="spotify" size={22} />
                  <Text style={styles.primaryButtonText}>
                    {translations.loginContinue}
                  </Text>
                </View>
              )}
            </Pressable>

            {/* État de chargement clair, hors bouton */}
            {statusText && (
              <Text style={styles.statusText} testID="login-status-text">
                {statusText}
              </Text>
            )}
          </>
        )}

        <View style={styles.footer}>
          <Ionicons color={COLORS.GREY} name="lock-closed-outline" size={13} />
          <Text style={styles.footerText}>{translations.loginRedirectNote}</Text>
        </View>
        <Text style={styles.versionText} testID="login-version-text">
          Melodix v{Constants.expoConfig?.version ?? '4.1.2'}
        </Text>
      </Animated.View>
    </View>
  );
};

/** Sombre Melodix + accent vert — hiérarchie très resserrée. */
const ANY_DARK = '#0B0B0B';

const styles = StyleSheet.create({
  screen: {
    flex: 1,
    backgroundColor: ANY_DARK,
    alignItems: 'center',
    justifyContent: 'center',
  },
  content: {
    alignItems: 'center',
    justifyContent: 'center',
    maxWidth: 360,
    width: '88%',
    paddingVertical: 32,
  },
  logo: {
    width: 96,
    height: 96,
  },
  welcome: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 26,
    textAlign: 'center',
    marginTop: 30,
    letterSpacing: 0.2,
  },
  hint: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 15,
    textAlign: 'center',
    lineHeight: 22,
    marginTop: 14,
  },
  primaryButton: {
    backgroundColor: COLORS.TINT,
    borderRadius: 999,
    minWidth: 280,
    minHeight: 58,
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 38,
    paddingHorizontal: 32,
  },
  primaryButtonPressed: {
    opacity: 0.82,
    transform: [{ scale: 0.985 }],
  },
  primaryButtonDisabled: {
    opacity: 0.5,
  },
  buttonInner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  primaryButtonText: {
    color: COLORS.BLACK,
    fontFamily: 'SF-Semibold',
    fontSize: 17,
  },
  statusText: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    marginTop: 18,
    textAlign: 'center',
  },
  errorCard: {
    alignItems: 'center',
    backgroundColor: 'rgba(233, 20, 41, 0.08)',
    borderColor: 'rgba(233, 20, 41, 0.28)',
    borderRadius: 20,
    borderWidth: StyleSheet.hairlineWidth,
    marginTop: 38,
    paddingHorizontal: 24,
    paddingVertical: 22,
    width: '100%',
  },
  errorTitle: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 16,
    textAlign: 'center',
    marginTop: 10,
  },
  errorBody: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 14,
    lineHeight: 20,
    textAlign: 'center',
    marginTop: 8,
  },
  retryButton: {
    backgroundColor: COLORS.TINT,
    borderRadius: 999,
    marginTop: 18,
    minWidth: 180,
    paddingVertical: 12,
    paddingHorizontal: 28,
    alignItems: 'center',
  },
  retryButtonPressed: {
    opacity: 0.85,
  },
  retryButtonText: {
    color: COLORS.BLACK,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
  },
  footer: {
    alignItems: 'center',
    flexDirection: 'row',
    gap: 6,
    marginTop: 44,
    paddingHorizontal: 8,
  },
  footerText: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 12,
    lineHeight: 17,
    flexShrink: 1,
  },
  versionText: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 10,
    marginTop: 10,
    opacity: 0.6,
  },
  successContent: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  successText: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 20,
    marginTop: 18,
  },
});
