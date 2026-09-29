/**
 * ResumeSessionCard — « Reprendre la lecture » (phase 2, §7) :
 *  1. Sans session : la carte n'existe pas.
 *  2. Avec session : pochette, titre, artiste, position précédente affichés.
 *  3. « Reprendre » → resumeSession ; « Ignorer » → dismissSession.
 */
import * as React from 'react';

import { fireEvent, render } from '@testing-library/react-native';

import { translations } from '@data';
import type { PlaybackSession } from '@services';

import { ResumeSessionCard } from '../ResumeSessionCard';

const mockResumeSession = jest.fn(async () => {});
const mockDismissSession = jest.fn(async () => {});

let mockPendingRestore: PlaybackSession | null = null;

jest.mock('@context', () => ({
  usePlayer: () => ({
    pendingRestore: mockPendingRestore,
    resumeSession: mockResumeSession,
    dismissSession: mockDismissSession,
  }),
}));

const SESSION: PlaybackSession = {
  version: 1,
  savedAt: 1_700_000_000_000,
  queue: [
    {
      id: 'spotify:x',
      title: 'Chemical',
      artists: ['Post Malone'],
      album: null,
      durationMillis: null,
      imageURL: '',
      source: { id: 'x', provider: null },
    },
  ],
  index: 0,
  positionMillis: 75_000, // 1:15
  shuffle: false,
  repeat: 'off',
  volume: 1,
};

describe('ResumeSessionCard — reprendre la lecture (phase 2)', () => {
  beforeEach(() => {
    mockPendingRestore = null;
    jest.clearAllMocks();
  });

  it('sans session persistée : aucune carte (accueil inchangé)', () => {
    const { queryByTestId } = render(<ResumeSessionCard />);

    expect(queryByTestId('resume-session-card')).toBeNull();
  });

  it('montre titre, artiste et position précédente de la session', () => {
    mockPendingRestore = SESSION;
    const { getByTestId, getByText } = render(<ResumeSessionCard />);

    expect(getByTestId('resume-session-card')).toBeTruthy();
    expect(getByText(translations.playerResumeTitle)).toBeTruthy();
    expect(getByText(/Chemical/)).toBeTruthy();
    expect(getByText(/Post Malone/)).toBeTruthy();
    // « Reprendre à 1:15 » — position HONNÊTE, jamais 0:00.
    expect(getByText(translations.playerResumePosition('1:15'))).toBeTruthy();
  });

  it('« Reprendre » : appelle resumeSession (restauration explicite)', () => {
    mockPendingRestore = SESSION;
    const { getByTestId } = render(<ResumeSessionCard />);

    fireEvent.press(getByTestId('resume-session-resume'));

    expect(mockResumeSession).toHaveBeenCalledTimes(1);
    expect(mockDismissSession).not.toHaveBeenCalled();
  });

  it('« Ignorer » : appelle dismissSession (suppression définitive)', () => {
    mockPendingRestore = SESSION;
    const { getByTestId } = render(<ResumeSessionCard />);

    fireEvent.press(getByTestId('resume-session-dismiss'));

    expect(mockDismissSession).toHaveBeenCalledTimes(1);
    expect(mockResumeSession).not.toHaveBeenCalled();
  });

  it('queue vide / index invalide : défensive, aucune carte cassée', () => {
    mockPendingRestore = { ...SESSION, queue: [], index: 0 };
    const { queryByTestId } = render(<ResumeSessionCard />);

    expect(queryByTestId('resume-session-card')).toBeNull();
  });
});
