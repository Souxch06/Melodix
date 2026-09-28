/**
 * Écran de connexion — CONNEXION SPOTIFY OBLIGATOIRE.
 *
 * Design cible (sombre, minimal, accent vert) :
 *
 *          ┌───────────────────────────────┐
 *          │        ◉ Melodix × ♫          │  logos Melodix + Spotify
 *          │    Ta musique. Ton univers.   │
 *          │   ( pitching sans clé )       │
 *          │                               │
 *          │   ( ● Continuer avec Spotify )│  bouton vert, taille généreuse
 *          │                               │
 *          │      [ erreur + Réessayer ]   │
 *          │   Connexion sécurisée avec    │
 *          │           Spotify.            │
 *          └───────────────────────────────┘
 *
 * - AUCUN champ credential : ni Client ID, ni secret, ni token.
 * - AUCUN accès à l'application sans compte (lien supprimé : (tabs) refuse
 *   déjà la navigation sans session, pas d'échappatoire ici non plus).
 * - Bouton unique : retour tactile, coins arrondis, désactivé tant que
 *   expo-auth-session n'est pas prêt (anti-double-clic), label
 *   « Connexion à Spotify... » pendant le flux OAuth.
 * - Erreurs : messages propres fournis (sans stack trace ni détail
 *   technique), bouton « Réessayer ». Erreur non configurée : texte exact.
 * - Animations discrètes : fondu + glissement à l'arrivée, opacité au
 *   pressage. Responsive : contenu centré borné à 360 px, indicateur de
 *   chargement dans le bouton.
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
import { useRouter } from 'expo-router';

import { COLORS } from '@config';
import { useUserData } from '@context';
import { translations } from '@data';
import { isSpotifyLoginConfigured, useSpotifyAuth } from '@services';

/** États de message, dérivés strictement du `LoginOutcome` du hook. */
type ErrorCard = {
  title: string;
  body: string;
} | null;

/** Durées « discrètes » : rapides sans être brusques. */
const ANIM = { fadeIn: 420, slideStart: 14, slideEnd: 0 };

export const LoginScreen = () => {
  const router = useRouter();
  const { state, isBusy, isAuthRequestPending, startLogin, resetError } =
    useSpotifyAuth();
  const { sessionStatus } = useUserData();
  const configured = React.useMemo(() => isSpotifyLoginConfigured(), []);

  // Filet de sécurité : si la session est restaurée/validée pendant
  // l'affichage, l'accueil reprend immédiatement la main.
  React.useEffect(() => {
    if (sessionStatus === 'spotify') {
      router.replace({ pathname: '/(tabs)/home', params: {} });
    }
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
      // Config absente : carte dédiée, écran « Connexion indisponible ».
      return {
        title: translations.loginNotConfiguredTitle,
        body: translations.loginNotConfiguredBody,
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
        };
      case 'not-configured':
        return {
          title: translations.loginNotConfiguredTitle,
          body: translations.loginNotConfiguredBody,
        };
      case 'unavailable':
      default:
        return {
          title: translations.loginErrorTitle,
          body: translations.loginErrorBody,
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
    // Anti-double-clic : ne rien relancer tant qu'un flux est en cours,
    // et jamais quand la config est absente ou qu'une erreur est affichée.
    if (buttonDisabled) {
      return;
    }
    void startLogin();
  }, [buttonDisabled, startLogin]);

  const handleRetryPress = React.useCallback(() => {
    resetError();
    if (!configured) {
      return; // réessayer sans config ne changera rien : message conservé
    }
    void startLogin();
  }, [configured, resetError, startLogin]);

  return (
    <View style={styles.screen} testID="login-screen">
      <Animated.View
        style={[
          styles.content,
          { opacity: fadeAnim, transform: [{ translateY: slideAnim }] },
        ]}
      >
        {/* Logos Melodix × Spotify */}
        <View style={styles.logoRow}>
          <Image
            source={require('@assets/images/logo.png')}
            style={styles.logo}
            resizeMode="contain"
            accessibilityIgnoresInvertColors
            testID="login-logo"
          />
          <Text style={styles.logoTimes}>{translations.loginHeaderNotation}</Text>
          <View style={styles.spotifyBadge}>
            <FontAwesome color={COLORS.TINT} name="spotify" size={44} />
          </View>
        </View>

        <Text style={styles.tagline}>{translations.loginTagline}</Text>
        <Text style={styles.description}>{translations.loginDescription}</Text>

        {errorCard ? (
          <View style={styles.errorCard} testID="login-error-card">
            <Ionicons
              color={COLORS.TINT}
              name="alert-circle-outline"
              size={30}
            />
            <Text style={styles.errorTitle}>{errorCard.title}</Text>
            <Text style={styles.errorBody}>{errorCard.body}</Text>
            {configured && (
              <Pressable
                accessibilityRole="button"
                onPress={handleRetryPress}
                style={({ pressed }) => [
                  styles.retryButton,
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
            {/* Bouton principal — vert Spotify, grande zone tactile */}
            <Pressable
              accessibilityRole="button"
              accessibilityState={{ disabled: buttonDisabled, busy: isBusy }}
              disabled={buttonDisabled}
              onPress={handleSpotifyPress}
              style={({ pressed }) => [
                styles.primaryButton,
                pressed && !buttonDisabled && styles.primaryButtonPressed,
                buttonDisabled && styles.primaryButtonDisabled,
              ]}
              testID="login-spotify-button"
            >
              {isBusy ? (
                <View style={styles.buttonInner}>
                  <ActivityIndicator color={COLORS.BLACK} size="small" />
                  <Text style={styles.primaryButtonTextLoading}>
                    {statusText ?? translations.loginConnecting}
                  </Text>
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

            {/* Étiquette du flux OAuth (hors bouton, plus lisible) */}
            {statusText && (
              <Text style={styles.statusText} testID="login-status-text">
                {statusText}
              </Text>
            )}
          </>
        )}

        <View style={styles.footer}>
          <Ionicons color={COLORS.GREY} name="lock-closed-outline" size={13} />
          <Text style={styles.footerText}>{translations.loginSecureFootnote}</Text>
        </View>
      </Animated.View>
    </View>
  );
};


/** Palette spécifique écran : étroite, dérivées de COLORS pour l'unité. */
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
    maxWidth: 360, // responsive : contenu borné quel que soit l'écran
    width: '88%',
    paddingVertical: 32,
  },
  logoRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  logo: {
    width: 92,
    height: 92,
  },
  logoTimes: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 28,
    marginHorizontal: 18,
  },
  spotifyBadge: {
    width: 92,
    height: 92,
    borderRadius: 46,
    borderWidth: 1,
    borderColor: 'rgba(29, 185, 84, 0.35)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  tagline: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 24,
    textAlign: 'center',
    marginTop: 28,
    lineHeight: 30,
  },
  description: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 14,
    textAlign: 'center',
    lineHeight: 21,
    marginTop: 14,
  },
  primaryButton: {
    backgroundColor: COLORS.TINT, // vert Spotify
    borderRadius: 999, // coins arrondis façon Spotify
    minWidth: 280,
    minHeight: 58,
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 36,
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
  primaryButtonTextLoading: {
    color: COLORS.BLACK,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
  },
  statusText: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    marginTop: 16,
    textAlign: 'center',
  },
  errorCard: {
    alignItems: 'center',
    backgroundColor: 'rgba(29, 185, 84, 0.08)',
    borderColor: 'rgba(29, 185, 84, 0.25)',
    borderRadius: 20,
    borderWidth: StyleSheet.hairlineWidth,
    marginTop: 36,
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
    borderRadius: 999,
    borderColor: COLORS.TINT,
    borderWidth: 1.5,
    marginTop: 18,
    minWidth: 180,
    paddingVertical: 12,
    alignItems: 'center',
  },
  retryButtonPressed: {
    opacity: 0.8,
  },
  retryButtonText: {
    color: COLORS.TINT,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
  },
  footer: {
    alignItems: 'center',
    flexDirection: 'row',
    gap: 6,
    marginTop: 42,
  },
  footerText: {
    color: COLORS.GREY,
    fontFamily: 'SF-Regular',
    fontSize: 12,
  },
});
