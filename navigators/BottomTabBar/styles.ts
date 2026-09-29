import { StyleSheet } from 'react-native';
import { BOTTOM_NAVIGATION_HEIGHT, COLORS } from '@config';

export const styles = StyleSheet.create({
  container: {
    ...StyleSheet.absoluteFillObject,
    top: 'auto',
    height: BOTTOM_NAVIGATION_HEIGHT,
    paddingBottom: 8,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-around',
    elevation: 7,
    shadowColor: COLORS.BLACK,
    shadowOffset: { width: 0, height: -5 },
    shadowOpacity: 0.7,
    shadowRadius: 7,
    overflow: 'hidden',
  },
  blurBackdrop: {
    ...StyleSheet.absoluteFillObject,
  },
  tintVeil: {
    ...StyleSheet.absoluteFillObject,
    backgroundColor: 'rgba(18, 18, 18, 0.72)',
  },
  topHairline: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    height: StyleSheet.hairlineWidth,
    backgroundColor: 'rgba(255, 255, 255, 0.12)',
  },
  pressable: {
    height: '100%',
    alignItems: 'center',
    justifyContent: 'center',
  },
  linkContainer: {
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  icon: {
    color: COLORS.GREY,
  },
  text: {
    color: COLORS.GREY,
    fontSize: 13,
    lineHeight: 13,
    textAlign: 'center',
    fontFamily: 'SF-Regular',
    marginTop: 5,
  },
  active: {
    color: COLORS.WHITE,
  },
  activeIcon: {
    color: COLORS.TINT,
  },
  activeDot: {
    backgroundColor: COLORS.TINT,
    borderRadius: 3,
    height: 4,
    marginTop: 6,
    width: 4,
  },
  inactiveDot: {
    backgroundColor: 'transparent',
    borderRadius: 3,
    height: 4,
    marginTop: 6,
    width: 4,
  },
});
