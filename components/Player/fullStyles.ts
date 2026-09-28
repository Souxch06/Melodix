import { StyleSheet } from 'react-native';

import { COLORS } from '@config';

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.PRIMARY,
    paddingHorizontal: 20,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: 10,
  },
  headerButton: {
    width: 40,
    height: 40,
    alignItems: 'center',
    justifyContent: 'center',
  },
  headerTitle: {
    flex: 1,
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    fontWeight: '600',
    textAlign: 'center',
  },
  artworkWrap: {
    alignItems: 'center',
    marginVertical: 12,
  },
  artwork: {
    width: 280,
    height: 280,
    borderRadius: 8,
    backgroundColor: COLORS.SECONDARY,
  },
  metaWrap: {
    marginBottom: 14,
  },
  title: {
    color: COLORS.WHITE,
    fontSize: 20,
    fontWeight: '700',
  },
  subtitle: {
    color: COLORS.LIGHT_GREY,
    fontSize: 14,
    marginTop: 4,
  },
  providerBadge: {
    color: COLORS.TINT,
    fontSize: 11.5,
    fontWeight: '600',
    marginTop: 6,
  },
  noticeText: {
    color: COLORS.RED,
    fontSize: 12,
    lineHeight: 17,
    marginTop: 6,
  },
  seekWrap: {
    marginBottom: 10,
  },
  seekTrack: {
    height: 22,
    flexDirection: 'row',
    alignItems: 'center',
  },
  seekFill: {
    height: 3,
    backgroundColor: COLORS.WHITE,
    borderTopLeftRadius: 2,
    borderBottomLeftRadius: 2,
  },
  seekRest: {
    height: 3,
    backgroundColor: COLORS.BORDER_GREY,
    borderTopRightRadius: 2,
    borderBottomRightRadius: 2,
  },
  seekThumb: {
    position: 'absolute',
    width: 12,
    height: 12,
    borderRadius: 6,
    backgroundColor: COLORS.WHITE,
    marginLeft: -6,
  },
  timesRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 2,
  },
  timeText: {
    color: COLORS.GREY,
    fontSize: 11,
  },
  controlsRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: 12,
  },
  smallControl: {
    width: 44,
    alignItems: 'center',
  },
  control: {
    width: 56,
    alignItems: 'center',
  },
  playButton: {
    width: 62,
    height: 62,
    borderRadius: 31,
    backgroundColor: COLORS.WHITE,
    alignItems: 'center',
    justifyContent: 'center',
  },
  repeatDot: {
    width: 4,
    height: 4,
    borderRadius: 2,
    backgroundColor: COLORS.TINT,
    marginTop: 2,
  },
  volumeRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 14,
  },
  volumeTrack: {
    flex: 1,
    height: 18,
    marginHorizontal: 10,
    flexDirection: 'row',
    alignItems: 'center',
  },
  volumeFill: {
    height: 3,
    backgroundColor: COLORS.LIGHT_GREY,
    borderTopLeftRadius: 2,
    borderBottomLeftRadius: 2,
  },
  volumeRest: {
    height: 3,
    backgroundColor: COLORS.BORDER_GREY,
    borderTopRightRadius: 2,
    borderBottomRightRadius: 2,
  },
  queueTitle: {
    color: COLORS.WHITE,
    fontSize: 15,
    fontWeight: '700',
    marginBottom: 8,
  },
  queueList: {
    flex: 1,
  },
  queueRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 8,
    borderRadius: 6,
    paddingHorizontal: 6,
  },
  queueRowActive: {
    backgroundColor: COLORS.SECONDARY,
  },
  queueIcon: {
    width: 22,
  },
  queueInfo: {
    flex: 1,
  },
  queueTitleText: {
    color: COLORS.WHITE,
    fontSize: 14,
    fontWeight: '600',
  },
  queueSubtitleText: {
    color: COLORS.LIGHT_GREY,
    fontSize: 12,
    marginTop: 1,
  },
  activeText: {
    color: COLORS.TINT,
  },
  closeSession: {
    position: 'absolute',
    right: 14,
    top: 50,
    width: 36,
    height: 36,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
