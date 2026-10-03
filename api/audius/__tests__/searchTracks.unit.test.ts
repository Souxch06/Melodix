import { audiusGet } from '../client';
import { searchAudiusTracks } from '../searchTracks';

jest.mock('../client', () => ({
  audiusGet: jest.fn(),
}));

const mockedAudiusGet = audiusGet as jest.MockedFunction<typeof audiusGet>;

describe('searchAudiusTracks — distinction panne / aucun résultat', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('utilise /tracks/search si le endpoint agrégé échoue', async () => {
    mockedAudiusGet
      .mockRejectedValueOnce(new Error('aggregate unavailable'))
      .mockResolvedValueOnce([
        { id: 'a1', title: 'Song' },
        { id: '', title: 'Invalid' },
      ] as never);
    const warn = jest.spyOn(console, 'warn').mockImplementation(() => {});

    await expect(searchAudiusTracks('Artist Song')).resolves.toEqual([
      expect.objectContaining({ id: 'a1' }),
    ]);
    expect(mockedAudiusGet).toHaveBeenNthCalledWith(
      2,
      '/tracks/search',
      expect.objectContaining({ query: 'Artist Song' })
    );
    warn.mockRestore();
  });

  it('propage la panne si les deux endpoints échouent', async () => {
    mockedAudiusGet
      .mockRejectedValueOnce(new Error('aggregate unavailable'))
      .mockRejectedValueOnce(new Error('typed search unavailable'));
    const warn = jest.spyOn(console, 'warn').mockImplementation(() => {});

    await expect(searchAudiusTracks('Artist Song')).rejects.toThrow(
      'typed search unavailable'
    );
    warn.mockRestore();
  });
});
