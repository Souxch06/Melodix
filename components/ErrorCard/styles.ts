import { StyleSheet } from 'react-native';

import { COLORS } from '@config';

export const styles = StyleSheet.create({
  wrap: {
    alignItems: 'center',
    flex: 1,
    justifyContent: 'center',
  },
  card: {
    alignItems: 'center',
    backgroundColor: '#1A1A1A',
    borderColor: '#2A2A2A',
    borderRadius: 16,
    borderWidth: StyleSheet.hairlineWidth,
    marginHorizontal: 16,
    paddingHorizontal: 24,
    paddingVertical: 26,
  },
  title: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
    marginTop: 12,
    textAlign: 'center',
  },
  body: {
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    marginTop: 8,
    textAlign: 'center',
  },
  retryButton: {
    backgroundColor: COLORS.WHITE,
    borderRadius: 20,
    marginTop: 16,
    paddingHorizontal: 26,
    paddingVertical: 10,
  },
  retryButtonPressed: {
    opacity: 0.75,
  },
  retryButtonText: {
    color: COLORS.BLACK,
    fontFamily: 'SF-Semibold',
    fontSize: 14,
  },
});
