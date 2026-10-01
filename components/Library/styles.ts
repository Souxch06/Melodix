import { StyleSheet } from 'react-native';
import { COLORS } from '@config';

export const styles = StyleSheet.create({
  container: {
    backgroundColor: COLORS.PRIMARY,
  },
  scrollView: {
    height: '100%',
    flex: 1,
    flexDirection: 'column',
    backgroundColor: COLORS.PRIMARY,
    paddingHorizontal: 16,
  },
  flatList: {
    paddingVertical: 26,
  },
  flatListColumnWrapper: {
    alignItems: 'flex-start',
    justifyContent: 'flex-start',
    gap: 12,
  },
  personalErrorBanner: {
    color: '#e91429',
    fontFamily: 'SF-Regular',
    fontSize: 13,
    textAlign: 'center',
    paddingVertical: 10,
    lineHeight: 18,
  },
  // Carte d'accès à l'écran Favoris (morceaux « cœur » locaux) en tête de
  // la bibliothèque — même langage visuel que les cartes de l'écran.
  favoritesCard: {
    alignItems: 'center',
    backgroundColor: '#1A1A1A',
    borderRadius: 12,
    flexDirection: 'row',
    gap: 12,
    marginBottom: 18,
    paddingHorizontal: 16,
    paddingVertical: 14,
  },
  favoritesCardPressed: {
    opacity: 0.75,
  },
  favoritesCardText: {
    color: COLORS.WHITE,
    flex: 1,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
  },
});
