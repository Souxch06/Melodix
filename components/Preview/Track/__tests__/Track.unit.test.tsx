import * as React from 'react';
import { fireEvent, render } from '@testing-library/react-native';

import { Track, TrackPropsType } from '../Track';

jest.mock('@hooks', () => ({
  useApplicationDimensions: () => ({ width: 400, height: 800 }),
}));

const props: TrackPropsType = {
  type: 'playlist',
  title: 'Titre test',
  subtitle: 'Artiste test',
  imageURL: 'https://images.test/track.jpg',
  isDownloaded: false,
  isSaved: false,
  isPlaying: false,
  explicit: false,
};

describe('Track', () => {
  it('affiche les métadonnées et démarre la lecture au toucher', () => {
    const onPress = jest.fn();
    const view = render(<Track {...props} onPress={onPress} />);

    expect(view.getByText('Titre test')).toBeTruthy();
    expect(view.getByText('Artiste test')).toBeTruthy();
    fireEvent.press(view.getByRole('button'));
    expect(onPress).toHaveBeenCalledTimes(1);
  });

  it('affiche et actionne le favori local', () => {
    const onToggleSaved = jest.fn();
    const view = render(
      <Track {...props} isSaved onToggleSaved={onToggleSaved} />
    );

    const buttons = view.getAllByRole('button');
    fireEvent.press(buttons[0]);
    expect(onToggleSaved).toHaveBeenCalledTimes(1);
  });

  it('branche le menu d’actions avec un libellé accessible', () => {
    const onActionsPress = jest.fn();
    const view = render(<Track {...props} onActionsPress={onActionsPress} />);

    fireEvent.press(view.getByTestId('track-actions'));
    expect(onActionsPress).toHaveBeenCalledTimes(1);
    expect(
      view.getByTestId('track-actions').props.accessibilityLabel
    ).toContain(props.title);
  });

  it.each([
    ['audius', 'track-availability-audius'],
    ['youtube', 'track-availability-youtube'],
    ['none', 'track-availability-none'],
  ] as const)(
    'affiche le badge de disponibilité %s',
    (availability, testID) => {
      const view = render(<Track {...props} availability={availability} />);
      expect(view.getByTestId(testID)).toBeTruthy();
    }
  );

  it('masque le favori lorsqu’il est explicitement désactivé', () => {
    const view = render(
      <Track
        {...props}
        isSaved
        forceDisableSaveIcon
        onToggleSaved={jest.fn()}
      />
    );

    expect(view.queryAllByRole('button')).toHaveLength(0);
  });
});
