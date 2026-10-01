/**
 * Favoris — écran dédié de la bibliothèque locale :
 * chargement (spinner), lignes issues de listSavedTracks avec AUCUN champ
 * perdu (sous-titre/album/durée de matching préservés), cœur = retrait,
 * liste vide, erreur de stockage lisible + retry. Jamais d'écran blanc.
 */
import * as React from 'react';

import {
  act,
  fireEvent,
  render,
  screen,
  waitFor,
} from '@testing-library/react-native';

import { listSavedTracks, toggleSavedTrack } from '@services';
import type { LocalTrackEntry } from '@services';
import type { TrackModel } from '@models';

import { translations } from '@data';

import { FavoritesScreen } from '../FavoritesScreen';

jest.mock('@services', () => ({
  listSavedTracks: jest.fn(),
  toggleSavedTrack: jest.fn(),
}));

type PreviewProps = {
  tracks?: TrackModel[];
  summaryTitle?: string;
  summaryInfo?: string;
  onToggleTrackSaved?: (track: TrackModel) => void;
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

const listSavedTracksMock = listSavedTracks as unknown as jest.Mock;
const toggleSavedTrackMock = toggleSavedTrack as unknown as jest.Mock;

const savedEntry = (
  id: string,
  overrides?: Partial<LocalTrackEntry>
): LocalTrackEntry => ({
  addedAt: 1_000,
  track: {
    id,
    title: `Song ${id}`,
    subtitle: '',
    imageURL: `https://img/${id}.jpg`,
  },
  albumTitle: 'Their Album',
  artists: ['Alpha', 'Beta'],
  durationMs: 123_000,
  ...overrides,
});

beforeEach(() => {
  jest.clearAllMocks();
  captured.current = {};
});

describe('FavoritesScreen — bibliothèque locale dédiée', () => {
  it('chargement : spinner pendant la lecture du stockage, puis lignes', async () => {
    let releaseList: (entries: LocalTrackEntry[]) => void = () => undefined;
    listSavedTracksMock.mockImplementation(
      () =>
        new Promise<LocalTrackEntry[]>((resolve) => {
          releaseList = resolve;
        })
    );

    render(<FavoritesScreen />);
    // Pendant le chargement : état explicite, JAMAIS un écran blanc.
    expect(screen.getByTestId('favorites-loading')).toBeTruthy();

    await act(async () => {
      releaseList([savedEntry('t1')]);
    });

    await waitFor(() => {
      expect(captured.current.summaryTitle).toBe(translations.favoritesTitle);
    });
  }, 10_000);

  it('les lignes conservent TOUS les champs nécessaires au player (aucun perdu)', async () => {
    listSavedTracksMock.mockResolvedValue([savedEntry('t1')]);

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(captured.current.tracks).toHaveLength(1);
    });

    const [row] = captured.current.tracks as TrackModel[];
    expect(row.id).toBe('t1');
    expect(row.title).toBe('Song t1');
    // Sous-titre vide en stockage → reconstitué depuis les artistes mémorisés.
    expect(row.subtitle).toBe('Alpha, Beta');
    // album + durée = métadonnées de matching (I-2) — préservées.
    expect(row.albumName).toBe('Their Album');
    expect(row.durationMs).toBe(123_000);
    expect(row.imageURL).toBe('https://img/t1.jpg');
    expect(row.isSaved).toBe(true);
  });

  it('sous-titre/album déjà présents dans le TrackModel : PRIORITÉ aux valeurs du morceau', async () => {
    listSavedTracksMock.mockResolvedValue([
      savedEntry('t9', {
        track: {
          id: 't9',
          title: 'Kept',
          subtitle: 'Original Artist',
          albumName: 'Original Album',
          durationMs: 42_000,
        },
      }),
    ]);

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(captured.current.tracks).toHaveLength(1);
    });

    const [row] = captured.current.tracks as TrackModel[];
    expect(row.subtitle).toBe('Original Artist');
    expect(row.albumName).toBe('Original Album');
    expect(row.durationMs).toBe(42_000);
  });

  it('compteur de favoris affiché dans le résumé', async () => {
    listSavedTracksMock.mockResolvedValue([
      savedEntry('t1'),
      savedEntry('t2'),
      savedEntry('t3'),
    ]);

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(captured.current.summaryInfo).toBe(
        translations.favoritesTracksInfo(3)
      );
    });
  });

  it('cœur d une ligne = retrait des favoris : la ligne DISPARAÎT de la liste', async () => {
    listSavedTracksMock.mockResolvedValue([savedEntry('t1'), savedEntry('t2')]);
    toggleSavedTrackMock.mockResolvedValue(false);

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(captured.current.tracks).toHaveLength(2);
    });

    const rows = captured.current.tracks as TrackModel[];
    await act(async () => {
      captured.current.onToggleTrackSaved?.(rows[0]);
    });

    expect(toggleSavedTrackMock).toHaveBeenCalledTimes(1);
    expect(captured.current.tracks).toHaveLength(1);
    expect((captured.current.tracks as TrackModel[])[0].id).toBe('t2');
  });

  it('toggle qui garde le favori (ré-ajout improbable) : la ligne RESTE', async () => {
    listSavedTracksMock.mockResolvedValue([savedEntry('t1')]);
    toggleSavedTrackMock.mockResolvedValue(true);

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(captured.current.tracks).toHaveLength(1);
    });

    const rows = captured.current.tracks as TrackModel[];
    await act(async () => {
      captured.current.onToggleTrackSaved?.(rows[0]);
    });

    expect(captured.current.tracks).toHaveLength(1);
  });

  it('bibliothèque vide : carte explicite (jamais d écran blanc)', async () => {
    listSavedTracksMock.mockResolvedValue([]);

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(screen.getByTestId('favorites-empty')).toBeTruthy();
    });
    expect(screen.getByText(translations.favoritesEmptyTitle)).toBeTruthy();
    expect(screen.getByText(translations.favoritesEmptyBody)).toBeTruthy();
  });

  it('erreur de lecture du stockage : carte erreur + « Réessayer » recharge réellement', async () => {
    listSavedTracksMock.mockRejectedValueOnce(new Error('storage ko'));

    render(<FavoritesScreen />);

    await waitFor(() => {
      expect(screen.getByTestId('favorites-load-error')).toBeTruthy();
    });

    listSavedTracksMock.mockResolvedValue([savedEntry('t1')]);

    await act(async () => {
      fireEvent.press(screen.getByTestId('favorites-load-retry'));
    });

    await waitFor(() => {
      expect(captured.current.tracks).toHaveLength(1);
    });
    expect(listSavedTracksMock).toHaveBeenCalledTimes(2);
    expect(screen.queryByTestId('favorites-load-error')).toBeNull();
  });
});
