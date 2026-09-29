/**
 * DragSlider (phase 3) — curseur glissable générique :
 *  Progression : durée inconnue → inerte ; 0 / milieu / fin ; clamps ; drag
 *  → UN SEUL callback final au relâchement ; annulation propre.
 *  Robustesse : valeur invalide bornée, aucun crash.
 */
import * as React from 'react';

import { fireEvent, render } from '@testing-library/react-native';

import { DragSlider } from '../DragSlider';

const LARGEUR = 200; // layout simulé : 100 px = 50 %

describe('DragSlider — mécanique du glisser (phase 3)', () => {
  it('position 0 / milieu / fin reflétées dans accessibilityValue', () => {
    const { rerender, getByTestId } = render(
      <DragSlider onSlideEnd={() => {}} testID="slider" value={0} />
    );

    expect(getByTestId('slider').props.accessibilityValue.now).toBe(0);

    rerender(<DragSlider onSlideEnd={() => {}} testID="slider" value={0.5} />);
    expect(getByTestId('slider').props.accessibilityValue.now).toBe(50);

    rerender(<DragSlider onSlideEnd={() => {}} testID="slider" value={1} />);
    expect(getByTestId('slider').props.accessibilityValue.now).toBe(100);
  });

  it('valeur hors [0,1] ou invalide → bornée sans crash', () => {
    const { rerender, getByTestId } = render(
      <DragSlider onSlideEnd={() => {}} testID="slider" value={7} />
    );

    expect(getByTestId('slider').props.accessibilityValue.now).toBe(100);

    rerender(<DragSlider onSlideEnd={() => {}} testID="slider" value={-3} />);
    expect(getByTestId('slider').props.accessibilityValue.now).toBe(0);

    rerender(
      <DragSlider onSlideEnd={() => {}} testID="slider" value={Number.NaN} />
    );
    expect(getByTestId('slider').props.accessibilityValue.now).toBe(0);
  });

  it('drag complet : UN SEUL onSlideEnd, à la valeur FINALE du doigt', () => {
    const onSlideEnd = jest.fn();
    const { getByTestId } = render(
      <DragSlider onSlideEnd={onSlideEnd} testID="slider" value={0} />
    );
    const slider = getByTestId('slider');

    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { width: LARGEUR } },
    });
    fireEvent(slider, 'touchStart', { nativeEvent: { locationX: 20 } });
    fireEvent(slider, 'touchMove', { nativeEvent: { locationX: 80 } });
    fireEvent(slider, 'touchMove', { nativeEvent: { locationX: 120 } });
    fireEvent(slider, 'touchEnd');

    // Jamais d'appel pendant le mouvement, un seul au relâchement : 120/200.
    expect(onSlideEnd).toHaveBeenCalledTimes(1);
    expect(onSlideEnd).toHaveBeenCalledWith(0.6);
  });

  it('onSlideChange informe pendant le drag (preview externe éventuelle)', () => {
    const onSlideChange = jest.fn();
    const { getByTestId } = render(
      <DragSlider
        onSlideChange={onSlideChange}
        onSlideEnd={() => {}}
        testID="slider"
        value={0}
      />
    );
    const slider = getByTestId('slider');

    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { width: LARGEUR } },
    });
    fireEvent(slider, 'touchStart', { nativeEvent: { locationX: 40 } });
    fireEvent(slider, 'touchMove', { nativeEvent: { locationX: 60 } });
    fireEvent(slider, 'touchEnd');

    expect(onSlideChange).toHaveBeenCalledTimes(2);
    expect(onSlideChange).toHaveBeenLastCalledWith(0.3);
  });

  it('clamp inférieur : doigt à gauche de la piste → 0, jamais négatif', () => {
    const onSlideEnd = jest.fn();
    const { getByTestId } = render(
      <DragSlider onSlideEnd={onSlideEnd} testID="slider" value={0.5} />
    );
    const slider = getByTestId('slider');

    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { layout: 0, width: LARGEUR } as never },
    });
    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { width: LARGEUR } },
    });
    fireEvent(slider, 'touchStart', { nativeEvent: { locationX: -50 } });
    fireEvent(slider, 'touchEnd');

    expect(onSlideEnd).toHaveBeenCalledWith(0);
  });

  it('clamp supérieur : doigt à droite de la piste → 1, jamais plus', () => {
    const onSlideEnd = jest.fn();
    const { getByTestId } = render(
      <DragSlider onSlideEnd={onSlideEnd} testID="slider" value={0.1} />
    );
    const slider = getByTestId('slider');

    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { width: LARGEUR } },
    });
    fireEvent(slider, 'touchStart', { nativeEvent: { locationX: 900 } });
    fireEvent(slider, 'touchEnd');

    expect(onSlideEnd).toHaveBeenCalledWith(1);
  });

  it('disabled (durée inconnue) : drag ignoré, onSlideEnd JAMAIS appelé', () => {
    const onSlideEnd = jest.fn();
    const onSlideChange = jest.fn();
    const { getByTestId } = render(
      <DragSlider
        disabled
        onSlideChange={onSlideChange}
        onSlideEnd={onSlideEnd}
        testID="slider"
        value={0.3}
      />
    );
    const slider = getByTestId('slider');

    expect(slider.props.accessibilityState?.disabled).toBe(true);

    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { width: LARGEUR } },
    });
    fireEvent(slider, 'touchStart', { nativeEvent: { locationX: 100 } });
    fireEvent(slider, 'touchMove', { nativeEvent: { locationX: 150 } });
    fireEvent(slider, 'touchEnd');

    expect(onSlideEnd).not.toHaveBeenCalled();
    expect(onSlideChange).not.toHaveBeenCalled();
  });

  it('drag incomplet (jamais relâché) : aucun onSlideEnd', () => {
    const onSlideEnd = jest.fn();
    const { getByTestId } = render(
      <DragSlider onSlideEnd={onSlideEnd} testID="slider" value={0.2} />
    );
    const slider = getByTestId('slider');

    fireEvent(slider, 'layout', {
      nativeEvent: { layout: { width: LARGEUR } },
    });
    fireEvent(slider, 'touchStart', { nativeEvent: { locationX: 100 } });
    fireEvent(slider, 'touchMove', { nativeEvent: { locationX: 160 } });
    // Téléphone interrompt le geste : le composant est démonté ainsi.

    expect(onSlideEnd).not.toHaveBeenCalled();
  });
});
