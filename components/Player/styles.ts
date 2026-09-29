import { StyleSheet } from 'react-native';

import { COLORS } from '@config';

export const styles = StyleSheet.create({
  wrapper: {
    width: '96%',
    alignSelf: 'center',
    backgroundColor: '#232323',
    borderRadius: 14,
    marginBottom: 6,
    overflow: 'hidden',
    elevation: 10,
    shadowColor: COLORS.BLACK,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.45,
    shadowRadius: 10,
  },
  noticeBar: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.RED,
    paddingHorizontal: 12,
    paddingVertical: 6,
  },
  noticeIcon: {
    marginRight: 6,
  },
  noticeText: {
    flex: 1,
    color: COLORS.WHITE,
    fontSize: 12,
  },
  openArea: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
  },
  progressTrack: {
    height: 2,
    width: '100%',
    backgroundColor: 'rgba(255, 255, 255, 0.15)',
  },
  progressFill: {
    height: 2,
    backgroundColor: COLORS.TINT,
  },
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 10,
    paddingVertical: 6,
  },
  artwork: {
    width: 44,
    height: 44,
    borderRadius: 8,
    backgroundColor: COLORS.PRIMARY,
  },
  info: {
    flex: 1,
    marginLeft: 10,
    marginRight: 6,
  },
  title: {
    color: COLORS.WHITE,
    fontSize: 14,
    fontWeight: '600',
  },
  subtitle: {
    color: COLORS.LIGHT_GREY,
    fontSize: 12,
    marginTop: 2,
  },
  control: {
    width: 40,
    height: 40,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
