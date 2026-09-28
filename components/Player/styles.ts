import { StyleSheet } from 'react-native';

import { COLORS } from '@config';

export const styles = StyleSheet.create({
  wrapper: {
    width: '100%',
    backgroundColor: COLORS.SECONDARY,
    borderTopWidth: StyleSheet.hairlineWidth,
    borderTopColor: COLORS.BLACK,
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
    backgroundColor: COLORS.GREY,
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
    borderRadius: 4,
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
