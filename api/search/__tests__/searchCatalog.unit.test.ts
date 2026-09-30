import { isBackendConfigured } from '@services';
import type { LibraryItemModel, SearchResultsModel } from '@models';

import { audiusTrackToLibraryItem, searchAudiusTracks } from '../../audius';
import type { AudiusTrackMatch } from '../../audius';
import { backendSearchCatalog } from '../../backend';
import { SEARCH_LIMIT, searchCatalog } from '../searchCatalog';

// Le repli de recherche est contractual (audit Phase 6, §1) :
// backend Melodix → métadonnées Spotify ; Audius UNIQUEMENT en repli, ou
// quand le backend n'est pas configuré — et la recherche ne casse JAMAIS.

jest.mock('@services', () => ({
  isBackendConfigured: jest.fn(),
}));

jest.mock('../../audius', () => ({
  audiusTrackToLibraryItem: jest.fn(),
  searchAudiusTracks: jest.fn(),
}));

jest.mock('../../backend', () => ({
  backendSearchCatalog: jest.fn(),
}));

const mockedIsBackendConfigured = isBackendConfigured as jest.MockedFunction<
  typeof isBackendConfigured
>;
const mockedBackendSearchCatalog = backendSearchCatalog as jest.MockedFunction<
  typeof backendSearchCatalog
>;
const mockedSearchAudiusTracks = searchAudiusTracks as jest.MockedFunction<
  typeof searchAudiusTracks
>;
const mockedAudiusTrackToLibraryItem =
  audiusTrackToLibraryItem as jest.MockedFunction<
    typeof audiusTrackToLibraryItem
  >;

const backendResults: SearchResultsModel = {
  artists: [],
  tracks: [
    {
      id: 'spotify:1',
      type: 'track',
      title: 'One More Time',
      subtitle: 'Daft Punk',
      imageURL: 'https://img.example/cover.jpg',
    },
  ],
  albums: [],
  playlists: [],
};

const audiusTrack: AudiusTrackMatch = {
  id: 'audius:xyz',
  title: 'One More Time',
  duration: 320,
};

const audiusItem: LibraryItemModel = {
  id: 'audius:xyz',
  type: 'track',
  title: 'One More Time',
  subtitle: 'Daft Punk',
  imageURL: 'https://img.example/audius.jpg',
};

let warnSpy: jest.SpyInstance;
let errorSpy: jest.SpyInstance;

beforeEach(() => {
  jest.clearAllMocks();
  // Les branchements d'échec journalisent (warn/error) : silencieux en test.
  warnSpy = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  errorSpy = jest.spyOn(console, 'error').mockImplementation(() => undefined);
});

afterEach(() => {
  warnSpy.mockRestore();
  errorSpy.mockRestore();
});

describe('searchCatalog — cascade backend → Audius', () => {
  it('uses the backend when configured and healthy, without any Audius fallback call', async () => {
    mockedIsBackendConfigured.mockReturnValue(true);
    mockedBackendSearchCatalog.mockResolvedValue(backendResults);

    const results = await searchCatalog('daft punk');

    expect(mockedIsBackendConfigured).toHaveBeenCalledTimes(1);
    expect(mockedBackendSearchCatalog).toHaveBeenCalledWith(
      'daft punk',
      SEARCH_LIMIT
    );
    expect(results).toBe(backendResults);
    expect(mockedSearchAudiusTracks).not.toHaveBeenCalled();
    expect(mockedAudiusTrackToLibraryItem).not.toHaveBeenCalled();
  });

  it('falls back to Audius when the configured backend request fails', async () => {
    mockedIsBackendConfigured.mockReturnValue(true);
    mockedBackendSearchCatalog.mockRejectedValue(new Error('backend down'));
    mockedSearchAudiusTracks.mockResolvedValue([audiusTrack]);
    mockedAudiusTrackToLibraryItem.mockReturnValue(audiusItem);

    const results = await searchCatalog('daft punk');

    expect(mockedBackendSearchCatalog).toHaveBeenCalledTimes(1);
    expect(mockedSearchAudiusTracks).toHaveBeenCalledWith(
      'daft punk',
      SEARCH_LIMIT
    );
    expect(mockedAudiusTrackToLibraryItem).toHaveBeenCalledTimes(1);
    expect(mockedAudiusTrackToLibraryItem.mock.calls[0][0]).toBe(audiusTrack);
    expect(results).toEqual({
      artists: [],
      tracks: [audiusItem],
      albums: [],
      playlists: [],
    });
    expect(warnSpy).toHaveBeenCalled();
  });

  it('goes straight to Audius when the backend is not configured', async () => {
    mockedIsBackendConfigured.mockReturnValue(false);
    mockedSearchAudiusTracks.mockResolvedValue([audiusTrack]);
    mockedAudiusTrackToLibraryItem.mockReturnValue(audiusItem);

    const results = await searchCatalog('daft punk');

    expect(mockedBackendSearchCatalog).not.toHaveBeenCalled();
    expect(mockedSearchAudiusTracks).toHaveBeenCalledWith(
      'daft punk',
      SEARCH_LIMIT
    );
    expect(results.tracks).toEqual([audiusItem]);
    expect(results.artists).toEqual([]);
    expect(results.albums).toEqual([]);
    expect(results.playlists).toEqual([]);
  });

  it('returns empty results instead of propagating when Audius fails', async () => {
    mockedIsBackendConfigured.mockReturnValue(false);
    mockedSearchAudiusTracks.mockRejectedValue(new Error('audius down'));

    const results = await searchCatalog('daft punk');

    expect(results).toEqual({
      artists: [],
      tracks: [],
      albums: [],
      playlists: [],
    });
    expect(errorSpy).toHaveBeenCalled();
  });
});
