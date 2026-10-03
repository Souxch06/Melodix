import * as backend from '../../backend';
import { getArtist } from '../artist';

describe('getArtist', () => {
  it('conserve titres populaires, artistes et discographie du backend', async () => {
    jest.spyOn(backend, 'backendGetArtist').mockResolvedValue({
      id: 'artist-1',
      name: 'Daft Punk',
      imageUrl: 'artist.jpg',
      topTracks: [
        {
          id: 'track-1',
          title: 'One More Time',
          artists: ['Daft Punk'],
          album: 'Discovery',
          durationMs: 320_000,
          coverUrl: 'track.jpg',
          audiusMatch: null,
        },
      ],
      albums: [
        {
          id: 'album-1',
          title: 'Discovery',
          artists: ['Daft Punk'],
          coverUrl: 'album.jpg',
          releaseDate: null,
          tracks: null,
        },
      ],
    });

    await expect(getArtist('artist-1')).resolves.toMatchObject({
      id: 'artist-1',
      name: 'Daft Punk',
      topTracks: [
        {
          id: 'track-1',
          title: 'One More Time',
          subtitle: 'Daft Punk',
          albumName: 'Discovery',
          durationMs: 320_000,
        },
      ],
      albums: [
        {
          id: 'album-1',
          type: 'album',
          title: 'Discovery',
          subtitle: 'Daft Punk',
        },
      ],
    });
  });
});
