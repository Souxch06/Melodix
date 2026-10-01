/**
 * Chaîne métadonnées Spotify → providers : la REQUÊTE COMPLÈTE (titre,
 * artistes, album, durée) doit arriver INTACTE à chaque provider appelé —
 * c'est elle qui alimente le matcher (durée = garde-fou, album = relief).
 */
import { resolveWithProviders } from '../trackResolver';
import type { AudioProvider, AudioSourceQuery } from '../types';

const QUERY: AudioSourceQuery = {
  title: 'One More Time',
  artists: ['Daft Punk'],
  album: 'Discovery',
  durationMillis: 200000,
};

const makeProvider = (
  id: string,
  impl: (
    query: AudioSourceQuery
  ) => Promise<{ sourceId: string; score: number } | null>
): AudioProvider => ({
  id,
  displayName: id,
  matches: async () => [],
  resolveMatch: jest.fn(impl),
  resolveSource: async () => null,
});

describe('trackResolver — intégrité de la requête Spotify le long de la chaine', () => {
  it('le provider AUDIUS reçoit titre + artistes + album + durée TELS QUELS', async () => {
    const audius = makeProvider('audius', async () => ({
      sourceId: 'au-1',
      score: 90,
    }));
    await resolveWithProviders(QUERY, [audius]);
    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(audius.resolveMatch).toHaveBeenCalledWith(QUERY);
  });

  it('en FALLBACK, YouTube reçoit EXACTEMENT la même requête complète que Audius', async () => {
    const audius = makeProvider('audius', async () => null);
    const youtube = makeProvider('youtube', async () => ({
      sourceId: 'yt-1',
      score: 80,
    }));
    await resolveWithProviders(QUERY, [audius, youtube]);
    expect(youtube.resolveMatch).toHaveBeenCalledWith(QUERY);
    expect(audius.resolveMatch).toHaveBeenCalledWith(QUERY);
  });

  it('album/durée manquants chez Spotify : passés en null et jamais inventés', async () => {
    const partial: AudioSourceQuery = {
      title: 'Song',
      artists: ['Artist'],
      album: null,
      durationMillis: null,
    };
    const audius = makeProvider('audius', async () => null);
    await resolveWithProviders(partial, [audius]);
    expect(audius.resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({ album: null, durationMillis: null })
    );
  });
});
