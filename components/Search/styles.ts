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
  degradedNotice: {
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    lineHeight: 18,
    marginBottom: 8,
    paddingHorizontal: 20,
  },
  errorState: {
    alignItems: 'center',
  },
  loader: {
    marginTop: 32,
  },
  retryButton: {
    backgroundColor: COLORS.WHITE,
    borderRadius: 18,
    marginTop: 16,
    paddingHorizontal: 20,
    paddingVertical: 9,
  },
  retryText: {
    color: COLORS.PRIMARY,
    fontSize: 14,
    fontWeight: '700',
  },
  // « Parcourir » : raccourcis de recherche par genre (état idle).
  browseSection: {
    marginTop: 24,
    paddingHorizontal: 16,
  },
  browseTitle: {
    color: COLORS.WHITE,
    fontSize: 16,
    fontWeight: '700',
    marginBottom: 12,
  },
  browseChips: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  browseChip: {
    backgroundColor: COLORS.LIGHT_GREY,
    borderRadius: 16,
    paddingHorizontal: 14,
    paddingVertical: 8,
  },
  browseChipPressed: {
    opacity: 0.6,
  },
  browseChipText: {
    color: COLORS.WHITE,
    fontSize: 13,
    fontWeight: '600',
  },
});
