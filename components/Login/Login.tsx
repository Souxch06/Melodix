import * as React from 'react';
import {
  KeyboardAvoidingView,
  Platform,
  Pressable,
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

export type LoginPropsType = {
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
};

const AnimatedPressable = Animated.createAnimatedComponent(Pressable);
const AnimatedText = Animated.createAnimatedComponent(Text);

export const Login = ({
  isPressableDisabled,
  handlePress,
  isLoading = false,
  needsClientId = false,
  redirectUri = '',
  onSubmitClientId,
  onChangeClientId,
  errorMessage,
}: LoginPropsType) => {
  const progress = useSharedValue(0);
  const { top: statusBarOffset } = useSafeAreaInsets();
  const [clientIdInput, setClientIdInput] = React.useState('');
  const canSubmitClientId = clientIdInput.trim().length > 0;

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

  const submitClientId = () => {
    if (canSubmitClientId) {
      onSubmitClientId?.(clientIdInput);
    }
  };

  return (
    <View style={[styles.wrapper, { paddingTop: statusBarOffset }]}>
      <Image
        style={styles.backgroundImage}
        source={require('@assets/images/login.png')}
      />

      <KeyboardAvoidingView
        style={styles.keyboardAvoidingView}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <View
          style={[styles.container, needsClientId && styles.containerSetup]}
        >
          <View style={styles.logo}>
            <Image
              style={styles.backgroundImage}
              source={require('@assets/images/logo.png')}
            />
          </View>
          <View style={styles.content}>
            <Text style={styles.title}>{translations.loginWelcome}</Text>
          </View>

          {needsClientId ? (
            <View style={styles.setup}>
              <Text style={styles.setupTitle}>
                {translations.clientIdTitle}
              </Text>
              <Text style={styles.setupText}>
                {translations.clientIdDescription}
              </Text>
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
              <Text style={styles.setupText}>
                {translations.redirectUriLabel}
              </Text>
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
          ) : (
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
          )}

          {errorMessage ? (
            <Text style={styles.error}>{errorMessage}</Text>
          ) : null}

          {!needsClientId && (
            <>
              <Text
                style={[styles.note, onChangeClientId && styles.noteCompact]}
              >
                {translations.loginNote}
              </Text>
              {onChangeClientId && (
                <Pressable onPress={onChangeClientId} hitSlop={10}>
                  <Text style={styles.link}>{translations.changeClientId}</Text>
                </Pressable>
              )}
            </>
          )}
        </View>
      </KeyboardAvoidingView>
    </View>
  );
};
