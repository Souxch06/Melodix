import axios from 'axios';

import { checkSavedItems, MAX_URIS_PER_REQUEST } from '../checkSavedItems';

jest.mock('axios');
jest.mock('../../config', () => ({
  BASE_URL: 'https://api.spotify.com/v1',
  getSessionToken: jest.fn(async () => 'user-token'),
}));

const mockedGet = axios.get as jest.Mock;

describe('checkSavedItems', () => {
  beforeEach(() => {
    mockedGet.mockReset();
  });

  it('queries /me/library/contains with Spotify URIs', async () => {
    mockedGet.mockResolvedValueOnce({ data: [true, false] });

    await expect(checkSavedItems('track', ['a', 'b'])).resolves.toEqual([
      true,
      false,
    ]);
    expect(mockedGet).toHaveBeenCalledWith(
      'https://api.spotify.com/v1/me/library/contains',
      {
        params: { uris: 'spotify:track:a,spotify:track:b' },
        headers: { Authorization: 'Bearer user-token' },
      }
    );
  });

  it(`sends at most ${MAX_URIS_PER_REQUEST} URIs per request and keeps the order`, async () => {
    const ids = Array.from({ length: 85 }, (_, i) => `id${i}`);
    mockedGet.mockImplementation(
      async (_url: string, { params }: { params: { uris: string } }) => ({
        data: params.uris
          .split(',')
          .map((uri) => Number(uri.split('id')[1]) % 2 === 0),
      })
    );

    const result = await checkSavedItems('album', ids);

    expect(
      mockedGet.mock.calls.map(
        ([, options]) => options.params.uris.split(',').length
      )
    ).toEqual([40, 40, 5]);
    expect(result).toEqual(ids.map((_, i) => i % 2 === 0));
  });

  it('reports empty IDs as not saved without sending them', async () => {
    mockedGet.mockResolvedValueOnce({ data: [true] });

    await expect(checkSavedItems('track', ['', 'x', ''])).resolves.toEqual([
      false,
      true,
      false,
    ]);
    expect(mockedGet.mock.calls[0][1].params.uris).toBe('spotify:track:x');
  });

  it('does not call the API when there is nothing to check', async () => {
    await expect(checkSavedItems('playlist', [])).resolves.toEqual([]);
    expect(mockedGet).not.toHaveBeenCalled();
  });
});
