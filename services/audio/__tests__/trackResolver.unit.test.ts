import { resolveWithProviders } from '../trackResolver';
import type { AudioProvider } from '../types';

/**
 * TrackResolver — ordre STRICT de la cascade :
 *   1. Audius prioritaire — YouTube n'est JAMAIS consulté s'il répond ;
 *   2. YouTube uniquement en fallback ;
 *   3. null si les deux échouent → « indisponible ».
 */

const makeProvider = (
  id: string,
  outcome: { sourceId: string; score: number } | null | 'throw'
): AudioProvider & { resolveMatch: jest.Mock } => ({
  id,
  displayName: id,
  matches: jest.fn(async () => []),
  resolveMatch: jest.fn(async () => {
    if (outcome === 'throw') {
      throw new Error('boom');
    }
    return outcome;
  }),
  resolveSource: jest.fn(async () => ({ uri: 'x://stream' })),
});

const QUERY = {
  title: 'Blinding Lights',
  artists: ['The Weeknd'],
  album: 'After Hours',
  durationMillis: 200_000,
};

describe('trackResolver — cascade Audius → YouTube → null', () => {
  it('Audius trouve : YouTube n\u2019est JAMAIS appelé (prioritaire)', async () => {
    const audius = makeProvider('audius', { sourceId: 'aud-1', score: 0.8 });
    const youtube = makeProvider('youtube', { sourceId: 'yt-1', score: 1 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result?.provider.id).toBe('audius');
    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(youtube.resolveMatch).not.toHaveBeenCalled();
  });

  it('Audius ne trouve rien → YouTube fallback', async () => {
    const audius = makeProvider('audius', null);
    const youtube = makeProvider('youtube', { sourceId: 'yt-42', score: 0.62 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result?.provider.id).toBe('youtube');
    expect(result?.sourceId).toBe('yt-42');
    expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
  });

  it('Audius JETTE (réseau) → YouTube quand même tenté, jamais de crash', async () => {
    const audius = makeProvider('audius', 'throw');
    const youtube = makeProvider('youtube', { sourceId: 'yt-9', score: 0.7 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result?.provider.id).toBe('youtube');
  });

  it('les deux échouent → null (indisponible, jamais de faux choix)', async () => {
    const audius = makeProvider('audius', null);
    const youtube = makeProvider('youtube', null);

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result).toBeNull();
  });

  it('le PREMIER provider gagnant gagne (pas de meilleure offre ultérieure)', async () => {
    // Même si YouTube a un (hypothétique) meilleur score, la priorité Audius
    // est absolue — c'est le contrat « Audius d'abord ».
    const audius = makeProvider('audius', { sourceId: 'aud-mid', score: 0.55 });
    const youtube = makeProvider('youtube', { sourceId: 'yt-best', score: 0.99 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result?.provider.id).toBe('audius');
    expect(result?.sourceId).toBe('aud-mid');
  });
});
