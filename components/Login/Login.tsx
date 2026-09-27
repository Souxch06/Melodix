import * as React from 'react';
import {
  KeyboardAvoidingView,
  Platform,
  Pressable,
  ScrollView,
  Text,
  TextInput,
  View,
} from 'react-native';
import Animated, {
  interpolateColor,
  useAnimatedStyle,
  useSharedValue,
  withTiming,
} from 'react-native-reanimated';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Image } from 'expo-image';

import { COLORS } from '@config';
import { translations } from '@data';

import { styles } from './styles';

/**
 * - `token`: quick sign-in with the access token shown on developer.spotify.com.
 * - `spotify`: permanent sign-in on the Spotify page, with a Client ID.
 */
export type LoginMethod = 'token' | 'spotify';

export type LoginPropsType = {
  method?: LoginMethod;
  onChangeMethod?: (method: LoginMethod) => void;
  // Quick sign-in
  onSubmitToken?: (value: string) => void;
  onOpenTokenPage?: () => void;
  isCheckingToken?: boolean;
  // Permanent sign-in
  handlePress: () => void;
  isPressableDisabled: boolean;
  isLoading?: boolean;
  // Shows the Spotify Client ID form instead of the sign-in button.
  needsClientId?: boolean;
  redirectUri?: string;
  onSubmitClientId?: (clientId: string) => void;
  // When provided, a link lets the user replace the stored Client ID.
  onChangeClientId?: () => void;
  errorMessage?: string | null;
  // Neutral message, e.g. why the previous session ended.
  infoMessage?: string | null;
};

const AnimatedPressable = Animated.createAnimatedComponent(Pressable);
const AnimatedText = Animated.createAnimatedComponent(Text);

type TokenPanelPropsType = {
  onSubmitToken?: (value: string) => void;
  onOpenTokenPage?: () => void;
  isCheckingToken: boolean;
};

const TokenPanel = ({
  onSubmitToken,
  onOpenTokenPage,
  isCheckingToken,
}: TokenPanelPropsType) => {
  const [tokenInput, setTokenInput] = React.useState('');
  const canSubmit = tokenInput.trim().length > 0 && !isCheckingToken;

  const submitToken = () => {
    if (canSubmit) {
      onSubmitToken?.(tokenInput);
    }
  };

  return (
    <View style={styles.card}>
      <Text style={styles.cardTitle}>{translations.tokenTitle}</Text>
      <Text style={styles.cardText}>{translations.tokenIntro}</Text>

      {translations.tokenSteps.map((step, index) => (
        <View key={step} style={styles.step}>
          <Text style={styles.stepNumber}>{index + 1}</Text>
          <View style={styles.stepContent}>
            <Text style={styles.stepText}>{step}</Text>
            {index === 1 && (
              <Text style={styles.code}>{translations.tokenCodeHint}</Text>
            )}
          </View>
        </View>
      ))}

      <Pressable
        onPress={onOpenTokenPage}
        style={styles.secondaryButton}
        accessibilityRole="link"
      >
        <Text style={styles.secondaryButtonText}>
          {translations.tokenOpenPage}
        </Text>
      </Pressable>

      <TextInput
        value={tokenInput}
        onChangeText={setTokenInput}
        placeholder={translations.tokenPlaceholder}
        placeholderTextColor={COLORS.GREY}
        autoCapitalize="none"
        autoCorrect={false}
        spellCheck={false}
        autoComplete="off"
        importantForAutofill="no"
        multiline
        textAlignVertical="top"
        style={[styles.input, styles.tokenInput]}
        accessibilityLabel={translations.tokenPlaceholder}
      />

      <Pressable
        onPress={submitToken}
        disabled={!canSubmit}
        style={[styles.pressable, !canSubmit && styles.pressableDisabled]}
      >
        <Text style={styles.text}>
          {isCheckingToken
            ? translations.tokenSubmitLoading
            : translations.tokenSubmit}
        </Text>
      </Pressable>

      <Text style={styles.cardNote}>{translations.tokenNote}</Text>
    </View>
  );
};

type ClientIdFormPropsType = {
  redirectUri: string;
  onSubmitClientId?: (clientId: string) => void;
};

const ClientIdForm = ({
  redirectUri,
  onSubmitClientId,
}: ClientIdFormPropsType) => {
  const [clientIdInput, setClientIdInput] = React.useState('');
  const canSubmitClientId = clientIdInput.trim().length > 0;

  const submitClientId = () => {
    if (canSubmitClientId) {
      onSubmitClientId?.(clientIdInput);
    }
  };

  return (
    <View style={styles.card}>
      <Text style={styles.cardTitle}>{translations.clientIdTitle}</Text>
      <Text style={styles.cardText}>{translations.clientIdDescription}</Text>
      <TextInput
        value={clientIdInput}
        onChangeText={setClientIdInput}
        onSubmitEditing={submitClientId}
        placeholder={translations.clientIdPlaceholder}
        placeholderTextColor={COLORS.GREY}
        autoCapitalize="none"
        autoCorrect={false}
        spellCheck={false}
        returnKeyType="done"
        style={styles.input}
        accessibilityLabel={translations.clientIdPlaceholder}
      />
      <Text style={styles.cardText}>{translations.redirectUriLabel}</Text>
      <Text selectable style={styles.redirectUri}>
        {redirectUri}
      </Text>
      <Pressable
        onPress={submitClientId}
        disabled={!canSubmitClientId}
        style={[
          styles.pressable,
          !canSubmitClientId && styles.pressableDisabled,
        ]}
      >
        <Text style={styles.text}>{translations.clientIdSave}</Text>
      </Pressable>
    </View>
  );
};

export const Login = ({
  method = 'token',
  onChangeMethod,
  onSubmitToken,
  onOpenTokenPage,
  isCheckingToken = false,
  isPressableDisabled,
  handlePress,
  isLoading = false,
  needsClientId = false,
  redirectUri = '',
  onSubmitClientId,
  onChangeClientId,
  errorMessage,
  infoMessage,
}: LoginPropsType) => {
  const progress = useSharedValue(0);
  const { top: statusBarOffset, bottom: bottomOffset } = useSafeAreaInsets();

  const animatedPressableStyles = useAnimatedStyle(() => ({
    backgroundColor: interpolateColor(
      progress.value,
      [0, 1],
      [COLORS.TINT, COLORS.LIGHTER_GREY]
    ),
  }));

  const animatedTextStyles = useAnimatedStyle(() => ({
    color: interpolateColor(
      progress.value,
      [0, 1],
      [COLORS.SECONDARY, COLORS.PRIMARY]
    ),
  }));

  const renderSpotifySignIn = () =>
    needsClientId ? (
      <ClientIdForm
        redirectUri={redirectUri}
        onSubmitClientId={onSubmitClientId}
      />
    ) : (
      <>
        <AnimatedPressable
          onPressIn={() => {
            progress.value = withTiming(1, { duration: 250 });
          }}
          onPressOut={() => {
            progress.value = withTiming(0, { duration: 250 });
          }}
          onPress={handlePress}
          disabled={isPressableDisabled}
          style={[styles.pressable, animatedPressableStyles]}
        >
          <AnimatedText style={[styles.text, animatedTextStyles]}>
            {isLoading
              ? translations.loginButtonLoading
              : translations.loginButton}
          </AnimatedText>
        </AnimatedPressable>
        <Text style={styles.note}>{translations.loginNote}</Text>
        {onChangeClientId && (
          <Pressable
            onPress={onChangeClientId}
            hitSlop={10}
            style={styles.switch}
          >
            <Text style={styles.link}>{translations.changeClientId}</Text>
          </Pressable>
        )}
      </>
    );

  return (
    <View style={styles.wrapper}>
      <Image
        style={styles.backgroundImage}
        source={require('@assets/images/login.png')}
      />

      <KeyboardAvoidingView
        style={styles.keyboardAvoidingView}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <ScrollView
          contentContainerStyle={[
            styles.scrollContent,
            {
              paddingTop: statusBarOffset + 48,
              paddingBottom: bottomOffset + 32,
            },
          ]}
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
        >
          <View style={styles.logo}>
            <Image
              style={styles.backgroundImage}
              source={require('@assets/images/logo.png')}
            />
          </View>
          <Text style={styles.title}>{translations.loginWelcome}</Text>

          {infoMessage ? <Text style={styles.info}>{infoMessage}</Text> : null}

          {method === 'token' ? (
            <TokenPanel
              onSubmitToken={onSubmitToken}
              onOpenTokenPage={onOpenTokenPage}
              isCheckingToken={isCheckingToken}
            />
          ) : (
            renderSpotifySignIn()
          )}

          {errorMessage ? (
            <Text style={styles.error}>{errorMessage}</Text>
          ) : null}

          {onChangeMethod && (
            <Pressable
              onPress={() =>
                onChangeMethod(method === 'token' ? 'spotify' : 'token')
              }
              hitSlop={10}
              style={styles.switch}
            >
              <Text style={styles.link}>
                {method === 'token'
                  ? translations.switchToOAuth
                  : translations.switchToToken}
              </Text>
            </Pressable>
          )}
        </ScrollView>
      </KeyboardAvoidingView>
    </View>
  );
};
