import { COLORS } from '@config';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    backgroundColor: COLORS.PRIMARY,
  },
  searchBar: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    backgroundColor: COLORS.WHITE,
    borderRadius: 8,
    marginHorizontal: 16,
    marginTop: 12,
    marginBottom: 8,
    paddingHorizontal: 12,
  },
  searchInput: {
    flex: 1,
    color: COLORS.PRIMARY,
    fontSize: 15,
    fontWeight: '600',
    paddingVertical: 12,
  },
  results: {
    flex: 1,
  },
  resultsContent: {
    paddingTop: 8,
    paddingBottom: 32,
  },
  message: {
    color: COLORS.LIGHT_GREY,
    fontSize: 14,
    lineHeight: 20,
    marginTop: 32,
    paddingHorizontal: 32,
    textAlign: 'center',
  },
  loader: {
    marginTop: 32,
  },
});
