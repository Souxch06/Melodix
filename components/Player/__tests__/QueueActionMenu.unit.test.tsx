/**
 * QueueActionMenu — le SEUL menu d'actions de file (§10 : réutilisé partout).
 *  1. Deux actions exactement : « Ajouter à la file », « Lire ensuite ».
 *  2. Chacune dispatch AU moteur via le contexte, puis FERME le menu.
 *  3. Sans morceau : rien d'affiché, jamais d'action fantôme.
 */
import * as React from 'react';

import { fireEvent, render } from '@testing-library/react-native';

import { translations } from '@data';
import type { PlayerTrack } from '@services';

import { QueueActionMenu } from '../QueueActionMenu';

const mockAddToQueue = jest.fn();
const mockPlayNext = jest.fn();

jest.mock('@context', () => ({
  usePlayer: () => ({
    addToQueue: mockAddToQueue,
    playNext: mockPlayNext,
  }),
}));

const morceau: PlayerTrack = {
  id: 'spotify:m',
  title: 'Photo',
  artists: ['Neffex'],
  album: null,
  durationMillis: null,
  imageURL: '',
  source: { id: 'm', provider: null },
};

describe('QueueActionMenu — actions de file réutilisables (phase 2)', () => {
  beforeEach(() => jest.clearAllMocks());

  it('« Ajouter à la file » → addToQueue(morceau) puis fermeture', () => {
    const onClose = jest.fn();
    const { getByLabelText } = render(
      <QueueActionMenu onClose={onClose} track={morceau} visible />
    );

    fireEvent.press(getByLabelText(translations.playerQueueAdd));

    expect(mockAddToQueue).toHaveBeenCalledWith(morceau);
    expect(mockPlayNext).not.toHaveBeenCalled();
    expect(onClose).toHaveBeenCalledTimes(1);
  });

  it('« Lire ensuite » → playNext(morceau) puis fermeture', () => {
    const onClose = jest.fn();
    const { getByLabelText } = render(
      <QueueActionMenu onClose={onClose} track={morceau} visible />
    );

    fireEvent.press(getByLabelText(translations.playerQueuePlayNext));

    expect(mockPlayNext).toHaveBeenCalledWith(morceau);
    expect(mockAddToQueue).not.toHaveBeenCalled();
    expect(onClose).toHaveBeenCalledTimes(1);
  });

  it('sans morceau : AUCUNE action possible', () => {
    const { queryByLabelText } = render(
      <QueueActionMenu onClose={() => {}} track={null} visible />
    );

    expect(queryByLabelText(translations.playerQueueAdd)).toBeNull();
    expect(queryByLabelText(translations.playerQueuePlayNext)).toBeNull();
    expect(mockAddToQueue).not.toHaveBeenCalled();
    expect(mockPlayNext).not.toHaveBeenCalled();
  });

  it('menu invisible: même motif — actionnable jamais en creux', () => {
    const { queryByLabelText } = render(
      <QueueActionMenu onClose={() => {}} track={morceau} visible={false} />
    );

    expect(queryByLabelText(translations.playerQueueAdd)).toBeNull();
  });
});
