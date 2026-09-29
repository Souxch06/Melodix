import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import type { GestureResponderEvent, LayoutChangeEvent } from 'react-native';

import { COLORS } from '@config';

/**
 * Curseur GLISSABLE générique (drag horizontal naturel) — utilisé par le
 * MiniPlayer (progression) et le FullPlayer (progression + volume).
 *
 * Invariants (phase 3) :
 *  - valeur NORMALISÉE 0..1, bornée à CHAQUE instant (jamais négative,
 *    jamais > 1) — petites et grandes durées passent par la même formule ;
 *  - pendant le drag, l'UI affiche IMMÉDIATEMENT la position demandée
 *    (preview locale) ; le moteur n'est touché QU'AU RELÂCHEMENT
 *    (`onSlideEnd`) — aucun seek/setVolume par frame ;
 *  - `disabled` : le contrôle est inerte (ex. durée inconnue) ;
 *  - aucun timer, aucun setInterval, aucune écriture disque ;
 *  - annulation propre : un drag interrompu (appel système, changement de
 *    morceau) termine simplement sans jamais crasher (clamps + null-checks).
 */
export const DragSlider = ({
  value,
  disabled,
  onSlideChange,
  onSlideEnd,
  fillColor = COLORS.WHITE,
  restColor = COLORS.BORDER_GREY,
  trackHeight = 3,
  interactiveHeight = 22,
  testID,
  accessibilityLabel,
  accessibilityValueText,
}: {
  /** Valeur courante réelle (0..1) — affichée hors drag. */
  value: number;
  /** Inerte (durée inconnue) : aucun drag possible. */
  disabled?: boolean;
  /** Preview pendant le drag (optionnelle — l'UI interne y répond déjà). */
  onSlideChange?: (value: number) => void;
  /** Valeur FINALE au relâchement — LE seul moment où l'appelant agit. */
  onSlideEnd: (value: number) => void;
  fillColor?: string;
  restColor?: string;
  trackHeight?: number;
  interactiveHeight?: number;
  testID?: string;
  accessibilityLabel?: string;
  accessibilityValueText?: string;
}) => {
  const [trackWidth, setTrackWidth] = React.useState(0);
  const [dragValue, setDragValue] = React.useState<number | null>(null);
  const draggingRef = React.useRef(false);

  const shown = dragValue ?? clamp01(value);
  const valueFromX = (x: number): number =>
    trackWidth > 0 ? clamp01(x / trackWidth) : clamp01(value);

  const handleLayout = (event: LayoutChangeEvent) => {
    setTrackWidth(event.nativeEvent.layout.width);
  };

  const handleTouchStart = (event: GestureResponderEvent) => {
    if (disabled) {
      return;
    }

    draggingRef.current = true;
    const nextValue = valueFromX(event.nativeEvent.locationX);
    setDragValue(nextValue);
    onSlideChange?.(nextValue);
  };

  const handleTouchMove = (event: GestureResponderEvent) => {
    if (!draggingRef.current || disabled) {
      return;
    }

    const nextValue = valueFromX(event.nativeEvent.locationX);
    setDragValue(nextValue);
    onSlideChange?.(nextValue);
  };

  const finishDrag = () => {
    if (!draggingRef.current) {
      return;
    }

    draggingRef.current = false;
    const finalValue = dragValue ?? clamp01(value);
    setDragValue(null);
    if (!disabled) {
      onSlideEnd(finalValue);
    }
  };

  return (
    <View
      accessible
      accessibilityLabel={accessibilityLabel}
      accessibilityRole="adjustable"
      accessibilityState={{ disabled: disabled === true }}
      accessibilityValue={{
        max: 100,
        min: 0,
        now: Math.round(shown * 100),
        text: accessibilityValueText,
      }}
      hitSlop={{ bottom: 14, top: 14 }}
      onLayout={handleLayout}
      onMoveShouldSetResponder={() => !disabled}
      onResponderTerminate={finishDrag}
      onStartShouldSetResponder={() => !disabled}
      onTouchEnd={finishDrag}
      onTouchMove={handleTouchMove}
      onTouchStart={handleTouchStart}
      style={[
        styles.hitArea,
        { height: interactiveHeight },
        disabled && styles.disabled,
      ]}
      testID={testID}
    >
      <View
        pointerEvents="none"
        style={[
          styles.track,
          { backgroundColor: restColor, height: trackHeight },
        ]}
      >
        <View
          style={[
            styles.fill,
            {
              backgroundColor: fillColor,
              height: trackHeight,
              width: `${shown * 100}%`,
            },
          ]}
        />
      </View>
      <View
        pointerEvents="none"
        style={[styles.thumb, { left: `${shown * 100}%` }]}
      />
    </View>
  );
};

const clamp01 = (value: number): number =>
  Number.isFinite(value) ? Math.min(1, Math.max(0, value)) : 0;

const styles = StyleSheet.create({
  hitArea: {
    justifyContent: 'center',
    width: '100%',
  },
  disabled: {
    opacity: 0.45,
  },
  track: {
    borderRadius: 2,
    overflow: 'hidden',
    width: '100%',
  },
  fill: {
    borderRadius: 2,
  },
  thumb: {
    backgroundColor: COLORS.WHITE,
    borderRadius: 6,
    height: 12,
    marginLeft: -6,
    position: 'absolute',
    width: 12,
  },
});
