import { Platform, StyleSheet } from 'react-native';
import { COLORS, Shapes } from '@config';

export const styles = StyleSheet.create({
  wrapper: {
    backgroundColor: COLORS.PRIMARY,
    height: '100%',
  },
  backgroundImage: {
    ...StyleSheet.absoluteFillObject,
  },
  keyboardAvoidingView: {
    flex: 1,
  },
  logo: {
    width: 53,
    height: 53,
    marginBottom: 20,
  },
  container: {
    paddingHorizontal: 35,
    height: '100%',
    justifyContent: 'flex-end',
    alignItems: 'center',
  },
  containerSetup: {
    paddingHorizontal: 24,
    paddingBottom: 40,
  },
  pressable: {
    backgroundColor: COLORS.TINT,
    paddingVertical: 18,
    paddingHorizontal: 24,
    borderRadius: Shapes.CIRCLE,
    width: '100%',
  },
  pressableDisabled: {
    opacity: 0.5,
  },
  text: {
    fontSize: 16,
    fontWeight: '600',
    color: COLORS.SECONDARY,
    textAlign: 'center',
  },
  content: {
    alignItems: 'center',
    marginBottom: 20,
  },
  title: {
    color: COLORS.WHITE,
    fontFamily: 'Avenir Next',
    fontSize: 35,
    fontWeight: '700',
    textAlign: 'center',
    marginBottom: 25,
  },
  setup: {
    width: '100%',
    backgroundColor: 'rgba(18, 18, 18, 0.92)',
    borderColor: COLORS.SECONDARY,
    borderWidth: 1,
    borderRadius: 16,
    padding: 18,
  },
  setupTitle: {
    color: COLORS.WHITE,
    fontSize: 18,
    fontWeight: '700',
    marginBottom: 8,
  },
  setupText: {
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    lineHeight: 19,
    marginBottom: 10,
  },
  input: {
    backgroundColor: COLORS.SECONDARY,
    color: COLORS.WHITE,
    borderRadius: 10,
    paddingHorizontal: 14,
    paddingVertical: 12,
    fontSize: 15,
    marginBottom: 14,
  },
  redirectUri: {
    color: COLORS.TINT,
    fontFamily: Platform.OS === 'ios' ? 'Menlo' : 'monospace',
    fontSize: 14,
    fontWeight: '600',
    marginBottom: 16,
  },
  error: {
    color: '#ff7a7a',
    fontSize: 13,
    lineHeight: 18,
    marginTop: 12,
    textAlign: 'center',
  },
  note: {
    color: COLORS.GREY,
    textAlign: 'center',
    lineHeight: 22,
    fontSize: 12,
    marginTop: 10,
    marginBottom: 150,
    fontStyle: 'italic',
  },
  noteCompact: {
    marginBottom: 12,
  },
  link: {
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    marginBottom: 128,
    textDecorationLine: 'underline',
  },
});
