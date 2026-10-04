/**
 * Titres aimés — la bibliothèque du COMPTE Spotify (GET /v1/me/tracks).
 *
 * Points contrôlés : chargement (spinner), erreur lisible + retry, liste
 * vide, pagination bornée, mention honnête de la troncature, et surtout
 * le fait que les métadonnées de matching (durée, album, ISRC) survivent
 * jusqu'à la file de lecture.
 */
import * as React from 'react';

import { act, fireEvent, render, screen } from '@testing-library/react-native';

import { getSpotifySavedTracks } from '@api';
import type { TrackModel } from '@models';
import { translations } from '@data';

import { LikedSongsScreen } from '../LikedSongsScreen';

jest.mock('@api', () => ({
  getSpotifySavedTracks: jest.fn(),
}));

type PreviewProps = {
  tracks?: TrackModel[];
  summaryTitle?: string;
  summarySubtitle?: string;
  id?: string;
};

const captured: { current: PreviewProps } = { current: {} };

jest.mock('@components', () => {
  const actual = jest.requireActual('@components');
  return {
    ...actual,
    Preview: (props: PreviewProps) => {
      captured.current = props;
      return null;
    },
  };
});

const getSpotifySavedTracksMock = getSpotifySavedTracks as unknown as jest.Mock;

const liked = (id: string): TrackModel => ({
  id,
  title: `Liked ${id}`,
  subtitle: 'Artist A',
  imageURL: `https://img/${id}.jpg`,
  isSaved: true,
  durationMs: 200_000,
  albumName: 'Album A',
  isrc: 'USRT19901234',
});

beforeEach(() => {
  jest.clearAllMocks();
  captured.current = {};
});

describe('LikedSongsScreen — bibliothèque du compte Spotify', () => {
  it('chargement : spinner, puis les morceaux aimés réels', async () => {
    let release: (tracks: TrackModel[]) => void = () => undefined;
    getSpotifySavedTracksMock.mockImplementation(
      () =>
        new Promise<TrackModel[]>((resolve) => {
          release = resolve;
        })
    );

    render(<LikedSongsScreen />);

    expect(screen.getByTestId('liked-songs-loading')).toBeTruthy();

    await act(async () => {
      release([liked('t1'), liked('t2')]);
      await Promise.resolve();
    });

    expect(screen.getByTestId('liked-songs-content')).toBeTruthy();
    expect(captured.current.tracks).toHaveLength(2);
    expect(captured.current.summaryTitle).toBe(translations.likedSongsTitle);
    expect(captured.current.summarySubtitle).toBe(
      translations.likedSongsSubtitle(2)
    );
  });

  it('conserve les métadonnées de matching jusqu à la file de lecture', async () => {
    getSpotifySavedTracksMock.mockResolvedValue([liked('t1')]);

    render(<LikedSongsScreen />);
    await act(async () => {
      await Promise.resolve();
    });

    expect(captured.current.tracks?.[0]).toMatchObject({
      id: 't1',
      isSaved: true,
      durationMs: 200_000,
      albumName: 'Album A',
      isrc: 'USRT19901234',
    });
  });

  it('erreur : carte explicite + « Réessayer » qui relance la requête', async () => {
    getSpotifySavedTracksMock.mockRejectedValueOnce(new Error('spotify down'));

    render(<LikedSongsScreen />);
    await act(async () => {
      await Promise.resolve();
    });

    expect(screen.getByTestId('liked-songs-error')).toBeTruthy();
    expect(screen.getByText(translations.likedSongsErrorTitle)).toBeTruthy();

    // Le retry relance réellement le chargement.
    getSpotifySavedTracksMock.mockResolvedValue([liked('t1')]);
    await act(async () => {
      fireEvent.press(screen.getByText(translations.homeRetry));
      await Promise.resolve();
    });

    expect(getSpotifySavedTracksMock).toHaveBeenCalledTimes(2);
    expect(screen.getByTestId('liked-songs-content')).toBeTruthy();
  });

  it('liste vide : carte d accueil, jamais un écran blanc', async () => {
    getSpotifySavedTracksMock.mockResolvedValue([]);

    render(<LikedSongsScreen />);
    await act(async () => {
      await Promise.resolve();
    });

    expect(screen.getByTestId('liked-songs-empty')).toBeTruthy();
    expect(screen.getByText(translations.likedSongsEmptyTitle)).toBeTruthy();
  });

  it('borne atteinte : mention honnête de la troncature', async () => {
    // Le plafond de l'écran est 200 : au-delà, on le DIT.
    getSpotifySavedTracksMock.mockResolvedValue(
      Array.from({ length: 200 }, (_, i) => liked(`t${i}`))
    );

    render(<LikedSongsScreen />);
    await act(async () => {
      await Promise.resolve();
    });

    expect(screen.getByTestId('liked-songs-truncated')).toBeTruthy();
  });

  it('demande une limite bornée à la couche API (pas de catalogue entier)', async () => {
    getSpotifySavedTracksMock.mockResolvedValue([]);

    render(<LikedSongsScreen />);
    await act(async () => {
      await Promise.resolve();
    });

    expect(getSpotifySavedTracksMock).toHaveBeenCalledWith(200);
  });
});
