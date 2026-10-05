import { StyleSheet } from 'react-native';
import { APP_BACKGROUND_COLOR, SPACING } from '@config';

export const styles = StyleSheet.create({
  container: {
    backgroundColor: APP_BACKGROUND_COLOR,
  },
  flatListContentContainer: {
    backgroundColor: APP_BACKGROUND_COLOR,
    gap: SPACING.xxs,
  },
  gradientOverlay: {
    zIndex: -2,
  },
});
