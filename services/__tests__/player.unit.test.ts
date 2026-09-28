import AsyncStorage from '@react-native-async-storage/async-storage';

import { melodixPlayer, PlayerTrack, spotifyTrackSource } from '../player';
import { __testSetAudioProviders, MATCH_CACHE_STORAGE_KEY } from '../audio';
import type { AudioProvider, ResolvedStream } from '../audio';

// AsyncStorage est mocké globalement (jest.config moduleNameMapper).

jest.mock('expo-constants', () => ({ expoConfig: { extra: {} } }));

// expo-av stub: captures the latest created sound + its status callback.
let lastStatusCallback: ((status: Record<string, unknown>) => void) | null =
  null;

const makeSound = () => ({
  unloadAsync: jest.fn(async () => {}),
  playAsync: jest.fn(async () => {}),
  pauseAsync: jest.fn(async () => {}),
  setPositionAsync: jest.fn(async () => {}),
  setVolumeAsync: jest.fn(async () => {}),
});

jest.mock('expo-av', () => ({
  Audio: {
    setAudioModeAsync: jest.fn(async () => {}),
    Sound: {
      createAsync: jest.fn(
        async (
          _source: { uri: string },
          _initial: Record<string, unknown>,
          onStatus?: (status: Record<string, unknown>) => void
        ) => {
          lastStatusCallback = onStatus ?? null;

          return { sound: makeSound() };
        }
      ),
    },
  },
}));

type FakeProviderOverrides = Partial<{
  resolveMatch: AudioProvider['resolveMatch'];
  resolveSource: AudioProvider['resolveSource'];
}>;

const makeProvider = (overrides: FakeProviderOverrides = {}): AudioProvider => ({
  id: 'audius',
  displayName: 'Audius',
  matches: jest.fn(async () => []),
  resolveMatch: jest.fn(async () => ({ sourceId: 'aud-good', score: 0.9 })),
  resolveSource: jest.fn(
    async (sourceId: string): Promise<ResolvedStream | null> => ({
      uri: `https://stream/${sourceId}`,
    })
  ),
  ...overrides,
});

const track = (
  id: string,
  title = `Track ${id}`,
  artists = ['Neffex']
): PlayerTrack => ({
  id: `spotify:${id}`,
  title,
  artists,
  album: null,
  imageURL: '',
  source: spotifyTrackSource(id),
});

const flush = () => new Promise((resolve) => setTimeout(resolve, 0));

describe('melodixPlayer engine', () => {
  let provider: AudioProvider;

  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    provider = makeProvider();
    __testSetAudioProviders({ audius: provider });
    await melodixPlayer.__testReset();
  });

  it('plays a Spotify-source track by matching it to the provider', async () => {
    await melodixPlayer.playQueue([track('one'), track('two')], 0);
    await flush();

    const state = melodixPlayer.getState();

    expect(provider.resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({ title: 'Track one', artists: ['Neffex'] })
    );
    expect(provider.resolveSource).toHaveBeenCalledWith('aud-good');
    expect(state.status).toBe('playing');
    expect(state.resolved).toEqual({
      provider: 'Audius',
      sourceId: 'aud-good',
      score: 90,
    });
  });

  it('caches the decision: replaying does not search again', async () => {
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();
    await melodixPlayer.stop();

    (provider.resolveMatch as jest.Mock).mockClear();
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();

    expect(provider.resolveMatch).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('reports and skips a track with no reliable match, never substitutes', async () => {
    const noMatch = makeProvider({
      resolveMatch: jest.fn(async (query) =>
        query.title === 'Track missing'
          ? null
          : { sourceId: 'aud-good', score: 0.9 }
      ),
      resolveSource: jest.fn(async (id: string) => ({
        uri: `https://stream/${id}`,
      })),
    });
    __testSetAudioProviders({ audius: noMatch });
    await melodixPlayer.stop();

    await melodixPlayer.playQueue(
      [track('missing'), track('fine', 'Playable')],
      0
    );
    await flush();
    await flush();

    const state = melodixPlayer.getState();

    expect(noMatch.resolveSource).toHaveBeenCalledTimes(1);
    expect(state.current?.title).toBe('Playable');
    expect(state.notice).toEqual({
      kind: 'not-available',
      title: 'Track missing',
    });
    expect(state.status).toBe('playing');
  });

  it('a dead cached stream is invalidated then re-matched once', async () => {
    await AsyncStorage.setItem(
      MATCH_CACHE_STORAGE_KEY,
      JSON.stringify({
        'spotify:one': {
          version: 1,
          matchedAt: Date.now(),
          matchId: 'dead-id',
          score: 88,
        },
      })
    );

    const retryProvider = makeProvider({
      resolveSource: jest.fn(async (id: string) =>
        id === 'dead-id' ? null : { uri: `https://stream/${id}` }
      ),
      resolveMatch: jest.fn(async () => ({ sourceId: 'fresh-id', score: 0.8 })),
    });
    __testSetAudioProviders({ audius: retryProvider });
    // Recreate cache-cold state (new run of the module would behave alike).
    await melodixPlayer.stop();

    await melodixPlayer.playQueue([track('one')], 0);
    await flush();
    await flush();

    expect(retryProvider.resolveMatch).toHaveBeenCalled();
    expect(retryProvider.resolveSource).toHaveBeenCalledWith('fresh-id');
    expect(melodixPlayer.getState().resolved?.sourceId).toBe('fresh-id');
  });

  it('stops after the last track when repeat is off', async () => {
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();

    lastStatusCallback?.({ isLoaded: true, didJustFinish: true });
    await flush();

    expect(melodixPlayer.getState().status).toBe('idle');
  });

  it('repeats the single track in repeat "one" mode', async () => {
    melodixPlayer.cycleRepeat();
    melodixPlayer.cycleRepeat();
    expect(melodixPlayer.getState().repeat).toBe('one');

    await melodixPlayer.playQueue([track('one')], 0);
    await flush();
    lastStatusCallback?.({ isLoaded: true, didJustFinish: true });
    await flush();

    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');
  });

  it('wraps around in repeat "all" mode', async () => {
    melodixPlayer.cycleRepeat();
    expect(melodixPlayer.getState().repeat).toBe('all');

    await melodixPlayer.playQueue([track('one'), track('two')], 0);
    await flush();
    lastStatusCallback?.({ isLoaded: true, didJustFinish: true });
    await flush();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:two');

    lastStatusCallback?.({ isLoaded: true, didJustFinish: true });
    await flush();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');

    melodixPlayer.cycleRepeat();
    melodixPlayer.cycleRepeat();
    expect(melodixPlayer.getState().repeat).toBe('off');
  });

  it('previous restarts the track after 3 seconds, else goes back', async () => {
    await melodixPlayer.playQueue([track('one'), track('two')], 1);
    await flush();

    lastStatusCallback?.({ isLoaded: true, positionMillis: 8000 });
    await melodixPlayer.previous();

    expect(melodixPlayer.getState().positionMillis).toBe(0);
    expect(melodixPlayer.getState().current?.id).toBe('spotify:two');

    lastStatusCallback?.({ isLoaded: true, positionMillis: 1000 });
    await melodixPlayer.previous();
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');
  });

  it('shuffle keeps the current track first in the order', async () => {
    await melodixPlayer.playQueue(
      [track('one'), track('two'), track('three'), track('four')],
      1
    );
    await flush();

    melodixPlayer.toggleShuffle();

    const { order, shuffle } = melodixPlayer.getState();

    expect(shuffle).toBe(true);
    expect(order).toHaveLength(4);
    expect(order?.[0]).toBe(1);
    expect([...order!].sort()).toEqual([0, 1, 2, 3]);
  });

  it('seek clamps and volume is applied', async () => {
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();

    await melodixPlayer.seekTo(-500);
    expect(melodixPlayer.getState().positionMillis).toBe(0);

    await melodixPlayer.seekTo(1234);
    expect(melodixPlayer.getState().positionMillis).toBe(1234);

    await melodixPlayer.setVolume(2);
    expect(melodixPlayer.getState().volume).toBe(1);

    await melodixPlayer.setVolume(0.4);
    expect(melodixPlayer.getState().volume).toBeCloseTo(0.4);
  });

  it('nothing playable left in queue ends the session with a notice', async () => {
    const noMatch = makeProvider({
      resolveMatch: jest.fn(async () => null),
    });
    __testSetAudioProviders({ audius: noMatch });
    await melodixPlayer.stop();

    await melodixPlayer.playQueue([track('a'), track('b')], 0);
    await flush();
    await flush();
    await flush();

    const state = melodixPlayer.getState();

    expect((noMatch.resolveMatch as jest.Mock).mock.calls.length).toBe(2);
    expect(state.status).toBe('idle');
    expect(state.notice?.title).toBe('Track b');
  });

  it('native provider tracks skip matching entirely', async () => {
    const densityProvider = makeProvider();
    __testSetAudioProviders({ audius: densityProvider, other: densityProvider });
    await melodixPlayer.stop();

    const native: PlayerTrack = {
      id: 'audius:native-1',
      title: 'Native',
      artists: ['X'],
      imageURL: '',
      source: { provider: 'audius', id: 'native-1' },
    };

    await melodixPlayer.playQueue([native], 0);
    await flush();

    expect(densityProvider.resolveMatch).not.toHaveBeenCalled();
    expect(densityProvider.resolveSource).toHaveBeenCalledWith('native-1');
    expect(melodixPlayer.getState().resolved?.score).toBe(1);
  });
});

describe('melodixPlayer — cascade Audius → YouTube (fallback)', () => {
  let audius: AudioProvider;
  let youtube: AudioProvider;

  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;

    // Audius ne trouve RIEN ; YouTube répond pour un contenu précis.
    audius = {
      ...makeProvider(),
      resolveMatch: jest.fn(async () => null),
    };
    youtube = {
      id: 'youtube',
      displayName: 'YouTube',
      matches: jest.fn(async () => []),
      resolveMatch: jest.fn(async (query: { title?: string }) =>
        query.title === 'Track yt-only'
          ? { sourceId: 'yt-video-7', score: 0.62 }
          : null
      ),
      resolveSource: jest.fn(async (sourceId: string) => ({
        uri: `https://yt-stream/${sourceId}`,
      })),
    };

    __testSetAudioProviders({ audius, youtube });
    await melodixPlayer.__testReset();
  });

  it('Audius échoue → YouTube joue (le morceau est lu, la source est tracée)', async () => {
    await melodixPlayer.playQueue([track('yt-only', 'Track yt-only')], 0);
    await flush();
    await flush();

    const state = melodixPlayer.getState();

    expect((youtube.resolveMatch as jest.Mock)).toHaveBeenCalledTimes(1);
    expect((youtube.resolveSource as jest.Mock)).toHaveBeenCalledWith('yt-video-7');
    expect(state.status).toBe('playing');
    expect(state.resolved).toEqual({
      provider: 'YouTube',
      sourceId: 'yt-video-7',
      score: 62,
    });
  });

  it('le cache mémorise le provider : replay sans nouvelle recherche', async () => {
    await melodixPlayer.playQueue([track('yt-only', 'Track yt-only')], 0);
    await flush();
    await melodixPlayer.stop();

    (audius.resolveMatch as jest.Mock).mockClear();
    (youtube.resolveMatch as jest.Mock).mockClear();

    await melodixPlayer.playQueue([track('yt-only', 'Track yt-only')], 0);
    await flush();

    expect(audius.resolveMatch).not.toHaveBeenCalled();
    expect(youtube.resolveMatch).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().resolved?.provider).toBe('YouTube');
  });

  it('les deux échouent → skip automatique vers le morceau jouable (jamais de blocage)', async () => {
    const youTubeSometimes = {
      ...youtube,
      resolveMatch: jest.fn(async (query: { title?: string }) =>
        query.title === 'Track yt-only'
          ? { sourceId: 'yt-video-7', score: 0.62 }
          : null
      ),
    };
    __testSetAudioProviders({ audius, youtube: youTubeSometimes });
    await melodixPlayer.stop();

    await melodixPlayer.playQueue(
      [track('nowhere', 'Track nowhere'), track('yt-only', 'Track yt-only')],
      0
    );
    await flush();
    await flush();

    expect(
      (youTubeSometimes.resolveSource as jest.Mock)
    ).toHaveBeenCalledWith('yt-video-7');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().queue[melodixPlayer.getState().index].title).toBe(
      'Track yt-only'
    );
  });
});
