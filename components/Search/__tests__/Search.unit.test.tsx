/**
 * I-2 — CONTENU RÉEL des PlayerTrack produits par la recherche : durée +
 * album du résultat voyagent jusqu'à playQueue (lecture) et au menu
 * « appui long », exactement comme le badge de disponibilité. Drift testé :
 * un homonyme d'un AUTRE album ne doit plus pouvoir être matché par mégarde.
 */
import * as React from 'react';

import { act, fireEvent, render } from '@testing-library/react-native';

import { translations } from '@data';
import { searchCatalog } from '@api';
import type {
  BrowseCategoryModel,
  LibraryItemModel,
  SearchResultsModel,
} from '@models';
import type { PlayerTrack } from '@services';

import { Search, SEARCH_DELAY_MS } from '../Search';

const mockPlayQueue = jest.fn(
  async (_queue: PlayerTrack[], _startIndex: number) => {}
);
const mockTogglePlayPause = jest.fn(async () => {});
const searchCatalogMock = searchCatalog as unknown as jest.Mock;
const mockPush = jest.fn();

jest.mock('expo-router', () => ({
  useRouter: () => ({ push: mockPush }),
  useSegments: () => ['(tabs)', 'search'],
}));

jest.mock('@context', () => ({
  usePlayer: () => ({
    current: null,
    status: 'idle',
    hasActiveSession: false,
    playQueue: mockPlayQueue,
    togglePlayPause: mockTogglePlayPause,
    addToQueue: jest.fn(),
    playNext: jest.fn(),
  }),
}));

jest.mock('@hooks', () => ({
  useApplicationDimensions: () => ({ width: 400, height: 800 }),
}));

const mockGetBrowseCategories = jest.fn<
  Promise<BrowseCategoryModel[]>,
  []
>(async () => []);

jest.mock('@api', () => ({
  searchCatalog: jest.fn(),
  getBrowseCategories: () => mockGetBrowseCategories(),
}));

// Capture le morceau ciblé par le menu « appui long » (même rôle que le
// badge + lecture : ces métadonnées décident du match Audius).
type CapturedTrack = {
  id: string;
  title: string;
  artists: string[];
  album: string | null;
  durationMillis: number | null;
} | null;

const mockCaptured: { current: CapturedTrack } = { current: null };

jest.mock('../../Player/QueueActionMenu', () => ({
  QueueActionMenu: ({ track }: { track: CapturedTrack }) => {
    mockCaptured.current = track;
    return null;
  },
}));

const mkSlide = (overrides: Partial<LibraryItemModel>): LibraryItemModel => ({
  id: 't1',
  type: 'track',
  title: 'Song One',
  subtitle: 'Artist A',
  imageURL: '',
  durationMs: 201_000,
  albumName: 'Album X',
  ...overrides,
});

const typeQueryAndAdvance = async (
  getByPlaceholderText: (text: string) => unknown
) => {
  fireEvent.changeText(
    getByPlaceholderText(translations.searchPlaceholder),
    'song'
  );
  // Debounce réel (400 ms) : on laisse le timer produire puis se résoudre.
  await act(async () => {
    await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
  });
};

beforeEach(() => {
  mockPlayQueue.mockClear();
  mockCaptured.current = null;
  searchCatalogMock.mockReset();
  searchCatalogMock.mockResolvedValue({
    artists: [],
    tracks: [
      mkSlide({
        id: 't1',
        title: 'Song One',
        albumName: 'Album X',
        isrc: 'USRT19901234',
      }),
      mkSlide({
        id: 't2',
        title: 'Song Two',
        durationMs: null,
        albumName: null,
      }),
    ],
    albums: [],
    playlists: [],
  });
});

describe('Search — PlayerTrack propagés (I-2)', () => {
  it('pression : playQueue reçoit durée + album du résultat, index correct', async () => {
    const { getByPlaceholderText, getByText } = render(<Search />);
    await typeQueryAndAdvance(getByPlaceholderText);

    // Appui sur la 2e carte : index réaligné sur la file de la recherche.
    fireEvent.press(getByText('Song Two'));

    expect(mockPlayQueue).toHaveBeenCalledTimes(1);
    const [queue, startIndex] = mockPlayQueue.mock.calls[0];
    expect(startIndex).toBe(1);
    expect(queue).toHaveLength(2);
    expect(queue[1]).toMatchObject({
      id: 'spotify:t2',
      title: 'Song Two',
      durationMillis: null,
      album: null,
      source: { provider: null, id: 't2' },
    });
    // La 1re carte garde ses métadonnées dans la file envoyée au player.
    expect(queue[0]).toMatchObject({
      id: 'spotify:t1',
      durationMillis: 201_000,
      album: 'Album X',
      artists: ['Artist A'],
      // ISRC : signal de matching fort, propagé du résultat au matcher.
      isrc: 'USRT19901234',
    });
  });

  it('appui long : le menu reçoit les mêmes métadonnées que la lecture', async () => {
    const { getByPlaceholderText, getByText } = render(<Search />);
    await typeQueryAndAdvance(getByPlaceholderText);

    fireEvent(getByText('Song One'), 'longPress');

    expect(mockCaptured.current).toMatchObject({
      id: 'spotify:t1',
      title: 'Song One',
      artists: ['Artist A'],
      album: 'Album X',
      durationMillis: 201_000,
      isrc: 'USRT19901234',
    });
  });
});

describe('Search — debounce, races et états (zone 4)', () => {
  it('deux requêtes rapides : la réponse TARDIVE de la 1re n écrase JAMAIS la 2e', async () => {
    const pending: Record<string, (value: unknown) => void> = {};
    searchCatalogMock.mockImplementation(
      (q: string) =>
        new Promise((resolve) => {
          pending[q] = resolve;
        })
    );

    const { getByPlaceholderText, getByText, queryByText } = render(<Search />);
    const input = getByPlaceholderText(translations.searchPlaceholder);

    fireEvent.changeText(input, 'ab');
    // Avant la fin du debounce, l utilisateur affine → « ab » est annulée.
    fireEvent.changeText(input, 'abc');
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });

    // La 2e répond d abord (rapide)…
    pending['abc']?.({
      artists: [],
      tracks: [mkSlide({ id: 'new', title: 'Fresh Result' })],
      albums: [],
      playlists: [],
    });
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 20));
    });
    expect(getByText('Fresh Result')).toBeTruthy();

    // …puis la 1re répond ENFIN : son résultat ne doit PAS apparaître.
    pending['ab']?.({
      artists: [],
      tracks: [mkSlide({ id: 'old', title: 'Stale Result' })],
      albums: [],
      playlists: [],
    });
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 20));
    });
    expect(queryByText('Stale Result')).toBeNull();
    expect(getByText('Fresh Result')).toBeTruthy();
  });

  it('erreur réseau : message d erreur explicite, puis la saisie suivante refonctionne', async () => {
    searchCatalogMock.mockRejectedValueOnce(new Error('network down'));

    const { getByPlaceholderText, getByText, queryByText } = render(<Search />);
    fireEvent.changeText(
      getByPlaceholderText(translations.searchPlaceholder),
      'boom'
    );
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });

    expect(getByText(translations.searchError)).toBeTruthy();

    // Nouvelle saisie → nouvelle tentative : l ancien état erreur disparaît.
    searchCatalogMock.mockResolvedValue({
      artists: [],
      tracks: [mkSlide({ id: 'ok', title: 'Recovered Track' })],
      albums: [],
      playlists: [],
    });
    fireEvent.changeText(
      getByPlaceholderText(translations.searchPlaceholder),
      'recovered'
    );
    expect(queryByText(translations.searchError)).toBeNull();
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });
    expect(getByText('Recovered Track')).toBeTruthy();
  });

  it('retry relance exactement la requête en erreur sans modifier la saisie', async () => {
    searchCatalogMock.mockRejectedValueOnce(new Error('temporary outage'));
    const { getByPlaceholderText, getByTestId, getByText } = render(<Search />);
    fireEvent.changeText(
      getByPlaceholderText(translations.searchPlaceholder),
      'retry me'
    );
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });
    expect(getByTestId('search-error-state')).toBeTruthy();

    searchCatalogMock.mockResolvedValueOnce({
      artists: [],
      tracks: [mkSlide({ id: 'retry-ok', title: 'Retry Result' })],
      albums: [],
      playlists: [],
    });
    fireEvent.press(getByTestId('search-retry'));
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });

    expect(searchCatalogMock).toHaveBeenLastCalledWith('retry me');
    expect(getByText('Retry Result')).toBeTruthy();
  });

  it('signale explicitement les résultats partiels du catalogue de repli', async () => {
    searchCatalogMock.mockResolvedValue({
      artists: [],
      tracks: [mkSlide({ id: 'fallback', title: 'Fallback Track' })],
      albums: [],
      playlists: [],
      degraded: true,
    });

    const { getByPlaceholderText, getByTestId, getByText } = render(<Search />);
    fireEvent.changeText(
      getByPlaceholderText(translations.searchPlaceholder),
      'fallback'
    );
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });

    expect(getByTestId('search-degraded-notice')).toBeTruthy();
    expect(getByText(translations.searchDegraded)).toBeTruthy();
    expect(getByText('Fallback Track')).toBeTruthy();
  });

  it('aucun résultat : message « pas de résultats » dédié (jamais vide blanc)', async () => {
    searchCatalogMock.mockResolvedValue({
      artists: [],
      tracks: [],
      albums: [],
      playlists: [],
    });

    const { getByPlaceholderText, getByText } = render(<Search />);
    fireEvent.changeText(
      getByPlaceholderText(translations.searchPlaceholder),
      'zzzz'
    );
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });

    expect(getByText(translations.searchNoResults('zzzz'))).toBeTruthy();
  });

  it('effacer la barre : retour à l état initial et REQUÊTE EN VOL ANNULÉE', async () => {
    let resolveLate: (value: unknown) => void = () => undefined;
    searchCatalogMock.mockImplementation(
      () =>
        new Promise((resolve) => {
          resolveLate = resolve;
        })
    );

    const { getByPlaceholderText, getByText, queryByText } = render(<Search />);
    const input = getByPlaceholderText(translations.searchPlaceholder);
    fireEvent.changeText(input, 'hello');
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 50));
    });

    // Effacement → état « idle » immédiat.
    fireEvent.changeText(input, '');
    expect(getByText(translations.searchHint)).toBeTruthy();

    // La réponse tardive de « hello » arrive : RIEN ne s affiche.
    resolveLate({
      artists: [],
      tracks: [mkSlide({ id: 'late', title: 'Zombie Result' })],
      albums: [],
      playlists: [],
    });
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 20));
    });
    expect(queryByText('Zombie Result')).toBeNull();
    expect(getByText(translations.searchHint)).toBeTruthy();
  });
});

describe('Search — navigation réelle depuis les résultats', () => {
  const renderWith = async (results: Partial<SearchResultsModel>) => {
    searchCatalogMock.mockResolvedValue({
      artists: [],
      tracks: [],
      albums: [],
      playlists: [],
      ...results,
    });

    const utils = render(<Search />);
    await typeQueryAndAdvance(utils.getByPlaceholderText);

    return utils;
  };

  beforeEach(() => {
    jest.clearAllMocks();
    mockPush.mockClear();
  });

  it('ouvre la page artiste au lieu de laisser le résultat inerte', async () => {
    const { getByText } = await renderWith({
      artists: [
        {
          id: 'ar-42',
          type: 'artist',
          title: 'Daft Punk',
          subtitle: '',
          imageURL: '',
        },
      ],
    });

    fireEvent.press(getByText('Daft Punk'));

    expect(mockPush).toHaveBeenCalledWith('/search/artist/ar-42');
  });

  it('ouvre la page album', async () => {
    const { getByText } = await renderWith({
      albums: [
        {
          id: 'al-7',
          type: 'album',
          title: 'Discovery',
          subtitle: 'Daft Punk',
          imageURL: '',
        },
      ],
    });

    fireEvent.press(getByText('Discovery'));

    expect(mockPush).toHaveBeenCalledWith('/search/album/al-7');
  });

  it('ouvre la page playlist', async () => {
    const { getByText } = await renderWith({
      playlists: [
        {
          id: 'pl-9',
          type: 'playlist',
          title: 'French Touch',
          subtitle: 'Par SpotiFan',
          imageURL: '',
          totalTracks: 42,
        },
      ],
    });

    fireEvent.press(getByText('French Touch'));

    expect(mockPush).toHaveBeenCalledWith('/search/playlist/pl-9');
  });

  it('encode les identifiants utilisés dans la route', async () => {
    const { getByText } = await renderWith({
      artists: [
        {
          id: 'ar/with spaces',
          type: 'artist',
          title: 'Étrange',
          subtitle: '',
          imageURL: '',
        },
      ],
    });

    fireEvent.press(getByText('Étrange'));

    expect(mockPush).toHaveBeenCalledWith('/search/artist/ar%2Fwith%20spaces');
  });
});

describe('Search — « Parcourir » lance une VRAIE recherche', () => {
  const genres = [
    { id: 'electronic', title: 'Électronique', imageURL: '' },
    { id: 'jazz', title: 'Jazz', imageURL: '' },
  ];

  beforeEach(() => {
    jest.clearAllMocks();
    mockPush.mockClear();
    mockGetBrowseCategories.mockResolvedValue(genres);
    searchCatalogMock.mockResolvedValue({
      artists: [],
      tracks: [],
      albums: [],
      playlists: [],
    });
  });

  it('affiche les genres du catalogue local à l état idle', async () => {
    const { getByTestId, getByText } = render(<Search />);
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 0));
    });

    expect(getByTestId('search-browse')).toBeTruthy();
    expect(getByText('Électronique')).toBeTruthy();
    expect(getByText('Jazz')).toBeTruthy();
  });

  it('toucher un genre remplit la recherche et interroge le catalogue', async () => {
    const { getByText } = render(<Search />);
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 0));
    });

    await act(async () => {
      fireEvent.press(getByText('Jazz'));
      await new Promise((resolve) => setTimeout(resolve, SEARCH_DELAY_MS + 30));
    });

    // Même chemin qu'une saisie manuelle : une vraie requête catalogue.
    expect(searchCatalogMock).toHaveBeenCalledWith('Jazz');
    // La section disparaît une fois la recherche lancée.
    expect(() => getByText('Électronique')).toThrow();
  });

  it('masque la section si le catalogue de genres est indisponible', async () => {
    mockGetBrowseCategories.mockResolvedValue([]);

    const { queryByTestId } = render(<Search />);
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 0));
    });

    expect(queryByTestId('search-browse')).toBeNull();
  });
});
