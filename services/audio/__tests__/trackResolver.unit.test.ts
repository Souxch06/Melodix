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

describe('trackResolver — cascade Audius → YouTube → typée (I-5)', () => {
  it('Audius trouve : YouTube n\u2019est JAMAIS appelé (prioritaire)', async () => {
    const audius = makeProvider('audius', { sourceId: 'aud-1', score: 0.8 });
    const youtube = makeProvider('youtube', { sourceId: 'yt-1', score: 1 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result.status).toBe('matched');
    if (result.status === 'matched') {
      expect(result.provider.id).toBe('audius');
    }
    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(youtube.resolveMatch).not.toHaveBeenCalled();
  });

  it('Audius ne trouve rien → YouTube fallback', async () => {
    const audius = makeProvider('audius', null);
    const youtube = makeProvider('youtube', { sourceId: 'yt-42', score: 0.62 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    if (result.status !== 'matched') {
      throw new Error(`attendu matched, reçu ${result.status}`);
    }
    expect(result.provider.id).toBe('youtube');
    expect(result.sourceId).toBe('yt-42');
    expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
  });

  it('Audius JETTE (réseau) → YouTube quand même tenté, jamais de crash', async () => {
    const audius = makeProvider('audius', 'throw');
    const youtube = makeProvider('youtube', { sourceId: 'yt-9', score: 0.7 });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    if (result.status !== 'matched') {
      throw new Error(`attendu matched, reçu ${result.status}`);
    }
    expect(result.provider.id).toBe('youtube');
  });

  it('les deux répondent « rien » → no-match PROUVÉ (négatif durable autorisé)', async () => {
    const audius = makeProvider('audius', null);
    const youtube = makeProvider('youtube', null);

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result).toEqual({ status: 'no-match' });
    // Les DEUX catalogues ont tranché : la preuve est complète.
    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
  });

  it('le PREMIER provider gagnant gagne (pas de meilleure offre ultérieure)', async () => {
    // Même si YouTube a un (hypothétique) meilleur score, la priorité Audius
    // est absolue — c'est le contrat « Audius d'abord ».
    const audius = makeProvider('audius', { sourceId: 'aud-mid', score: 0.55 });
    const youtube = makeProvider('youtube', {
      sourceId: 'yt-best',
      score: 0.99,
    });

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    if (result.status !== 'matched') {
      throw new Error(`attendu matched, reçu ${result.status}`);
    }
    expect(result.provider.id).toBe('audius');
    expect(result.sourceId).toBe('aud-mid');
  });
});

describe('trackResolver — I-5 : une panne n est PAS un « indisponible »', () => {
  it('Audius timeout + YouTube timeout → error : JAMAIS de cache négatif durable', async () => {
    const audius = makeProvider('audius', 'throw');
    const youtube = makeProvider('youtube', 'throw');

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result).toEqual({ status: 'error' });
    // Les deux ont été tentés — mais aucun n'a TRANCHÉ.
    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
  });

  it('Audius en panne + YouTube « rien » → error (preuve incomplète, jamais no-match)', async () => {
    const audius = makeProvider('audius', 'throw');
    const youtube = makeProvider('youtube', null);

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result).toEqual({ status: 'error' });
  });

  it('ne journalise pas les détails privés d une erreur provider', async () => {
    const privateDetail = 'private title https://signed.example/token';
    const audius = makeProvider('audius', null);
    audius.resolveMatch.mockRejectedValue(new Error(privateDetail));
    const warn = jest.spyOn(console, 'warn').mockImplementation(() => {});

    await expect(resolveWithProviders(QUERY, [audius])).resolves.toEqual({
      status: 'error',
    });

    const logged = JSON.stringify(warn.mock.calls);
    warn.mockRestore();
    expect(logged).not.toContain('private title');
    expect(logged).not.toContain('signed.example');
  });

  it('Audius « rien » + YouTube en panne → error (preuve incomplète)', async () => {
    const audius = makeProvider('audius', null);
    const youtube = makeProvider('youtube', 'throw');

    const result = await resolveWithProviders(QUERY, [audius, youtube]);

    expect(result).toEqual({ status: 'error' });
  });
});
