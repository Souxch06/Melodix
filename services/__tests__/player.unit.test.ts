import AsyncStorage from '@react-native-async-storage/async-storage';

import { melodixPlayer, PlayerTrack, spotifyTrackSource } from '../player';
import { loadPlaybackSession } from '../playbackSession';
import { PLAY_HISTORY_STORAGE_KEY } from '../history/playHistory';
import { __testSetAudioProviders, MATCH_CACHE_STORAGE_KEY } from '../audio';
import type { AudioProvider, ResolvedStream } from '../audio';

// AsyncStorage est mocké globalement (jest.config moduleNameMapper).

jest.mock('expo-constants', () => ({ expoConfig: { extra: {} } }));

// expo-av stub: captures the latest created sound + its status callback.
let lastStatusCallback: ((status: Record<string, unknown>) => void) | null =
  null;
// eslint-disable-next-line @typescript-eslint/no-explicit-any
let lastSound: any = null;
// Toutes les instances créées — preuve d'absence de double Sound (Phase 1).
// eslint-disable-next-line @typescript-eslint/no-explicit-any
let mockCreatedSounds: any[] = [];

const makeSound = () => ({
  unloadAsync: jest.fn(async () => {}),
  // Les commandes expo-av rendent un AVPlaybackStatus réel. Les tests gardent
  // cette frontière : le moteur ne doit jamais inventer PLAYING/PAUSED à
  // partir de la seule résolution d'une Promise native.
  playAsync: jest.fn(async () => ({
    isLoaded: true,
    isPlaying: true,
    isBuffering: false,
  })),
  pauseAsync: jest.fn(async () => ({
    isLoaded: true,
    isPlaying: false,
    isBuffering: false,
  })),
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
          const created = makeSound();
          lastSound = created;
          mockCreatedSounds.push(created);

          return {
            sound: created,
            status: {
              isLoaded: true,
              isPlaying: true,
              isBuffering: false,
              positionMillis: 0,
            },
          };
        }
      ),
    },
  },
}));

type FakeProviderOverrides = Partial<{
  resolveMatch: AudioProvider['resolveMatch'];
  resolveSource: AudioProvider['resolveSource'];
}>;

const makeProvider = (
  overrides: FakeProviderOverrides = {}
): AudioProvider => ({
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
    lastSound = null;
    mockCreatedSounds = [];
    provider = makeProvider();
    __testSetAudioProviders({ audius: provider });
    await melodixPlayer.__testReset();
  });

  it('plays a Spotify-source track by matching it to the provider', async () => {
    await melodixPlayer.playQueue(
      [{ ...track('one'), explicit: true }, track('two')],
      0
    );
    await flush();

    const state = melodixPlayer.getState();

    expect(provider.resolveMatch).toHaveBeenCalledWith(
      expect.objectContaining({
        title: 'Track one',
        artists: ['Neffex'],
        explicit: true,
      })
    );
    expect(provider.resolveSource).toHaveBeenCalledWith('aud-good');
    expect(state.status).toBe('playing');
    expect(state.resolved).toEqual({
      provider: 'Audius',
      sourceId: 'aud-good',
      score: 90,
    });
  });

  it('n expose PLAYING qu après confirmation réelle du runtime expo-av', async () => {
    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { Sound: { createAsync: jest.Mock } };
    };
    av.Sound.createAsync.mockImplementationOnce(
      async (
        _source: { uri: string },
        _initial: Record<string, unknown>,
        onStatus?: (status: Record<string, unknown>) => void
      ) => {
        lastStatusCallback = onStatus ?? null;
        const created = makeSound();
        lastSound = created;
        mockCreatedSounds.push(created);
        return {
          sound: created,
          status: {
            isLoaded: true,
            isPlaying: false,
            isBuffering: true,
            positionMillis: 0,
          },
        };
      }
    );

    await melodixPlayer.playTrack(track('buffering'));

    expect(melodixPlayer.getState()).toMatchObject({
      status: 'loading',
      buffering: true,
      resolved: expect.objectContaining({ provider: 'Audius' }),
    });
    expect(await AsyncStorage.getItem(PLAY_HISTORY_STORAGE_KEY)).toBeNull();

    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      isBuffering: false,
      positionMillis: 250,
    });

    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      buffering: false,
      positionMillis: 250,
    });
    await flush();
    expect(await AsyncStorage.getItem(PLAY_HISTORY_STORAGE_KEY)).not.toBeNull();
  });

  it('un Sound chargé mais non joué reste PAUSED, jamais faux PLAYING', async () => {
    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { Sound: { createAsync: jest.Mock } };
    };
    av.Sound.createAsync.mockImplementationOnce(async () => {
      const created = makeSound();
      lastSound = created;
      mockCreatedSounds.push(created);
      return {
        sound: created,
        status: {
          isLoaded: true,
          isPlaying: false,
          isBuffering: false,
          positionMillis: 0,
        },
      };
    });

    await melodixPlayer.playTrack(track('not-started'));

    expect(melodixPlayer.getState()).toMatchObject({
      status: 'paused',
      buffering: false,
    });
  });

  it('synchronise l’état réel expo-av lors d’une interruption Audio Focus', async () => {
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();

    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      positionMillis: 12_000,
      durationMillis: 180_000,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      positionMillis: 12_000,
      durationMillis: 180_000,
    });

    // Android retire le focus : expo-av signale la pause sans appeler notre UI.
    lastStatusCallback?.({ isLoaded: true, isPlaying: false });
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'paused',
      positionMillis: 12_000,
      durationMillis: 180_000,
    });

    // Un callback de buffering n’est pas une pause et ne perd ni progression
    // ni durée avec les zéros transitoires parfois publiés par expo-av.
    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: false,
      isBuffering: true,
      positionMillis: 0,
      durationMillis: 0,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      positionMillis: 12_000,
      durationMillis: 180_000,
      buffering: true,
    });

    // Retour du focus/réseau : même Sound, état playing et buffering nettoyé.
    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      isBuffering: false,
      positionMillis: 12_500,
      durationMillis: 180_000,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      buffering: false,
      positionMillis: 12_500,
    });

    // NaN ne doit jamais contaminer l'état partagé UI/MediaSession.
    lastStatusCallback?.({
      isLoaded: true,
      positionMillis: Number.NaN,
      durationMillis: Number.NaN,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      positionMillis: 12_500,
      durationMillis: 180_000,
    });
  });

  it('un changement de piste purge immédiatement position/durée/provider de l ancienne', async () => {
    const a = { ...track('one', 'A'), durationMillis: 180_000 };
    const b = { ...track('two', 'B'), durationMillis: 240_000 };
    await melodixPlayer.playQueue([a, b], 0);
    await flush();
    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      positionMillis: 90_000,
      durationMillis: 180_000,
    });

    await melodixPlayer.next();

    expect(melodixPlayer.getState()).toMatchObject({
      current: expect.objectContaining({ id: 'spotify:two' }),
      status: 'playing',
      positionMillis: 0,
      durationMillis: 240_000,
      resolved: expect.objectContaining({ provider: 'Audius' }),
    });
  });

  it('borne toute valeur numérique incohérente avant l état partagé', async () => {
    await melodixPlayer.playTrack({
      ...track('numeric'),
      durationMillis: Number.POSITIVE_INFINITY,
    });
    await flush();

    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      positionMillis: Number.POSITIVE_INFINITY,
      durationMillis: -1,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      positionMillis: 0,
      durationMillis: 0,
    });

    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      positionMillis: 250_000,
      durationMillis: 180_000,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      positionMillis: 180_000,
      durationMillis: 180_000,
    });
  });

  it('ne traite qu une fois une erreur de flux répétée pour le même Sound', async () => {
    await melodixPlayer.playQueue([track('one'), track('two')], 0);
    await flush();

    const failingCallback = lastStatusCallback;
    failingCallback?.({ isLoaded: false, error: 'stream interrupted' });
    failingCallback?.({ isLoaded: false, error: 'stream interrupted again' });
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.id).toBe('spotify:two');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(mockCreatedSounds).toHaveLength(2);
  });

  it('un morceau rejoué avec succès sort de la liste des échecs sessionnels', async () => {
    melodixPlayer.setRepeat('all');
    await melodixPlayer.playQueue([track('one'), track('two')], 0);
    await flush();

    const firstACallback = lastStatusCallback;
    firstACallback?.({ isLoaded: false, error: 'temporary stream failure' });
    await flush();
    await flush();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:two');

    // Retente A manuellement : son démarrage réel doit le réhabiliter.
    await melodixPlayer.playAtIndex(0);
    await flush();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');

    await melodixPlayer.playAtIndex(1);
    await flush();
    const bCallback = lastStatusCallback;
    bCallback?.({ isLoaded: false, error: 'B unavailable now' });
    await flush();
    await flush();

    // repeat-all peut revenir sur A ; sans réhabilitation, les deux IDs sont
    // encore marqués en échec et le player s'arrête à tort.
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');
    expect(melodixPlayer.getState().status).toBe('playing');
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

    // §3 : la notice existe pendant le saut (bandeau MiniPlayer visible)…
    const seenNotices: ({ kind: string; title: string } | null)[] = [];
    const unsubscribe = melodixPlayer.subscribe((nextState) =>
      seenNotices.push(
        nextState.notice as { kind: string; title: string } | null
      )
    );

    await melodixPlayer.playQueue(
      [track('missing'), track('fine', 'Playable')],
      0
    );
    await flush();
    await flush();

    const state = melodixPlayer.getState();

    expect(noMatch.resolveSource).toHaveBeenCalledTimes(1);
    expect(state.current?.title).toBe('Playable');
    // …mais elle DISPARAÎT dès que le morceau suivant commence vraiment :
    // jamais affichée sur le morceau suivant (Phase 1, section 3).
    expect(seenNotices).toContainEqual({
      kind: 'not-available',
      title: 'Track missing',
    });
    expect(state.notice).toBeNull();
    expect(state.status).toBe('playing');
    unsubscribe();
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

  it('next manuel respecte la fin de file et repeat-all', async () => {
    await melodixPlayer.playQueue([track('one'), track('two')], 1);
    await flush();

    await melodixPlayer.next();
    expect(melodixPlayer.getState().status).toBe('idle');
    expect(melodixPlayer.getState().current).toBeNull();

    melodixPlayer.setRepeat('all');
    await melodixPlayer.playQueue([track('one'), track('two')], 1);
    await flush();
    await melodixPlayer.next();
    await flush();

    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');
  });

  it('previous au début ne boucle que lorsque repeat-all est actif', async () => {
    await melodixPlayer.playQueue([track('one'), track('two')], 0);
    await flush();
    await melodixPlayer.previous();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');

    melodixPlayer.setRepeat('all');
    await melodixPlayer.previous();
    await flush();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:two');
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
    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      durationMillis: 5_000,
      positionMillis: 1_000,
    });

    await melodixPlayer.seekTo(-500);
    expect(melodixPlayer.getState().positionMillis).toBe(0);

    await melodixPlayer.seekTo(1234);
    expect(melodixPlayer.getState().positionMillis).toBe(1234);

    await melodixPlayer.seekTo(50_000);
    expect(melodixPlayer.getState().positionMillis).toBe(5_000);

    await melodixPlayer.seekTo(Number.NaN);
    expect(melodixPlayer.getState().positionMillis).toBe(5_000);

    await melodixPlayer.setVolume(2);
    expect(melodixPlayer.getState().volume).toBe(1);

    await melodixPlayer.setVolume(0.4);
    expect(melodixPlayer.getState().volume).toBeCloseTo(0.4);

    await melodixPlayer.setVolume(Number.NaN);
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
    __testSetAudioProviders({
      audius: densityProvider,
      other: densityProvider,
    });
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

  it('pause then resume drives the SAME sound instance (no new resolve)', async () => {
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();
    expect(melodixPlayer.getState().status).toBe('playing');

    await melodixPlayer.togglePlayPause();
    expect(lastSound.pauseAsync).toHaveBeenCalledTimes(1);
    expect(melodixPlayer.getState().status).toBe('paused');

    await melodixPlayer.togglePlayPause();
    expect(lastSound.playAsync).toHaveBeenCalledTimes(1);
    expect(melodixPlayer.getState().status).toBe('playing');
    // Aucune nouvelle résolution : la recherche initiale seule.
    expect(provider.resolveMatch).toHaveBeenCalledTimes(1);
  });

  it('resume ne publie PLAYING qu après confirmation du runtime', async () => {
    await melodixPlayer.playQueue([track('one')], 0);
    await flush();
    await melodixPlayer.togglePlayPause();
    expect(melodixPlayer.getState().status).toBe('paused');

    // La commande a été acceptée, mais le runtime signale encore le buffering :
    // ni Promise résolue ni intention utilisateur ne prouvent que l'audio joue.
    lastSound.playAsync.mockResolvedValueOnce({
      isLoaded: true,
      isPlaying: false,
      isBuffering: true,
    });
    await melodixPlayer.togglePlayPause();
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'paused',
      buffering: true,
    });

    lastStatusCallback?.({
      isLoaded: true,
      isPlaying: true,
      isBuffering: false,
      positionMillis: 500,
    });
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      buffering: false,
      positionMillis: 500,
    });
  });

  it('clearNotice emits ONLY when a notice exists', async () => {
    let emissions = 0;
    const unsubscribe = melodixPlayer.subscribe(() => {
      emissions += 1;
    });
    emissions = 0; // skip the immediate subscribe() echo

    melodixPlayer.clearNotice(); // no-op : aucune notice en cours
    expect(emissions).toBe(0);

    await melodixPlayer.playQueue([track('one')], 0);
    await flush();
    melodixPlayer.clearNotice(); // pas de notice non plus → no-op confirmé
    unsubscribe();
  });

  it('stop preserves prefs (volume/repeat/shuffle) and resets the queue', async () => {
    melodixPlayer.setRepeat('all');
    melodixPlayer.toggleShuffle();
    await melodixPlayer.setVolume(0.4);

    await melodixPlayer.playQueue([track('one'), track('two')], 0);
    await flush();
    await melodixPlayer.stop();

    const state = melodixPlayer.getState();
    expect(state.queue).toEqual([]);
    expect(state.index).toBe(-1);
    expect(state.current).toBeNull();
    expect(state.status).toBe('idle');
    // Les réglages SURVIVENT à stop() — comportement voulu, vérifié.
    expect(state.repeat).toBe('all');
    expect(state.shuffle).toBe(true);
    expect(state.volume).toBeCloseTo(0.4);

    melodixPlayer.setRepeat('off');
  });
});

describe('melodixPlayer — cascade Audius → YouTube (fallback)', () => {
  let audius: AudioProvider;
  let youtube: AudioProvider;

  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    lastSound = null;
    mockCreatedSounds = [];

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

    expect(youtube.resolveMatch as jest.Mock).toHaveBeenCalledTimes(1);
    expect(youtube.resolveSource as jest.Mock).toHaveBeenCalledWith(
      'yt-video-7'
    );
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

    expect(youTubeSometimes.resolveSource as jest.Mock).toHaveBeenCalledWith(
      'yt-video-7'
    );
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(
      melodixPlayer.getState().queue[melodixPlayer.getState().index].title
    ).toBe('Track yt-only');
  });

  describe('I-5 — une PANNE réseau n est JAMAIS un « indisponible » durable', () => {
    const readStoredCache = async () => {
      const raw = await AsyncStorage.getItem(MATCH_CACHE_STORAGE_KEY);
      return raw ? (JSON.parse(raw) as Record<string, unknown>) : null;
    };

    it('Audius timeout + YouTube timeout → skip propre, AUCUN cache négatif écrit', async () => {
      audius = {
        ...makeProvider(),
        resolveMatch: jest.fn(async () => {
          throw new Error('timeout');
        }),
      };
      youtube = {
        id: 'youtube',
        displayName: 'YouTube',
        matches: jest.fn(async () => []),
        resolveMatch: jest.fn(async () => {
          throw new Error('timeout');
        }),
        resolveSource: jest.fn(async (sourceId: string) => ({
          uri: `https://yt-stream/${sourceId}`,
        })),
      };
      __testSetAudioProviders({ audius, youtube });
      await melodixPlayer.stop();

      await melodixPlayer.playQueue([track('net', 'Track net')], 0);
      await flush();
      await flush();
      await flush();

      // Morceau sauté proprement : jamais de flux, message existant inchangé.
      expect(youtube.resolveSource as jest.Mock).not.toHaveBeenCalled();
      // MAIS rien n'a été gravé en "indisponible"…
      expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
      expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
      expect((await readStoredCache()) ?? {}).not.toHaveProperty('spotify:net');

      // …alors qu'une NOUVELLE tentative effectue RÉELLEMENT une recherche.
      audius = {
        ...makeProvider(),
        resolveMatch: jest.fn(async () => ({
          sourceId: 'aud-back',
          score: 0.9,
        })),
      };
      __testSetAudioProviders({ audius, youtube });
      await melodixPlayer.stop();

      await melodixPlayer.playQueue([track('net', 'Track net')], 0);
      await flush();
      await flush();

      expect(audius.resolveMatch).toHaveBeenCalledTimes(1); // recherche réelle
      expect(melodixPlayer.getState().status).toBe('playing');
      expect(await readStoredCache()).toMatchObject({
        'spotify:net': { providerId: 'audius', matchId: 'aud-back' },
      });
    });

    it('Audius « aucun résultat » + YouTube « aucun résultat » → cache négatif autorisé (prouvé)', async () => {
      // Le beforeEach fournit déjà : audius null / youtube null (sauf yt-only).
      await melodixPlayer.playQueue([track('nowhere', 'Track nowhere')], 0);
      await flush();
      await flush();
      await flush();

      expect(await readStoredCache()).toMatchObject({
        'spotify:nowhere': { providerId: null, matchId: null },
      });

      // Le négatif PROUVÉ est conservé : replay sans AUCUNE re-recherche.
      await melodixPlayer.stop();
      (audius.resolveMatch as jest.Mock).mockClear();
      (youtube.resolveMatch as jest.Mock).mockClear();

      await melodixPlayer.playQueue([track('nowhere', 'Track nowhere')], 0);
      await flush();
      await flush();

      expect(audius.resolveMatch).not.toHaveBeenCalled();
      expect(youtube.resolveMatch).not.toHaveBeenCalled();
    });

    it('Audius en panne + YouTube TROUVE → le morceau JOUE (le provider utile gagne)', async () => {
      audius = {
        ...makeProvider(),
        resolveMatch: jest.fn(async () => {
          throw new Error('timeout');
        }),
      };
      __testSetAudioProviders({ audius, youtube });
      await melodixPlayer.stop();

      await melodixPlayer.playQueue([track('yt-only', 'Track yt-only')], 0);
      await flush();
      await flush();

      expect(youtube.resolveSource as jest.Mock).toHaveBeenCalledWith(
        'yt-video-7'
      );
      expect(melodixPlayer.getState().status).toBe('playing');
      expect(melodixPlayer.getState().resolved).toEqual({
        provider: 'YouTube',
        sourceId: 'yt-video-7',
        score: 62,
      });
      expect(await readStoredCache()).toMatchObject({
        'spotify:yt-only': { providerId: 'youtube', matchId: 'yt-video-7' },
      });
    });
  });

  // ---------- Paramètres : méthodes ADDITIVES branchées par l'écran ----------

  it('setRepeat set explicit modes without cycling (settings switch)', async () => {
    expect(melodixPlayer.getState().repeat).toBe('off');

    melodixPlayer.setRepeat('all');
    expect(melodixPlayer.getState().repeat).toBe('all');

    melodixPlayer.setRepeat('off');
    expect(melodixPlayer.getState().repeat).toBe('off');
  });

  it('setStaysActiveInBackground applies expo-av audio mode ONCE per change and memorizes it', async () => {
    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { setAudioModeAsync: jest.Mock };
    };
    av.setAudioModeAsync.mockClear();

    await melodixPlayer.setStaysActiveInBackground(false);

    const lastCall =
      av.setAudioModeAsync.mock.calls[
        av.setAudioModeAsync.mock.calls.length - 1
      ];
    expect(lastCall[0]).toMatchObject({ staysActiveInBackground: false });

    // Même valeur → aucun appel supplémentaire (garde mémorisée).
    await melodixPlayer.setStaysActiveInBackground(false);
    const after = av.setAudioModeAsync.mock.calls.filter(
      (call) => call[0]?.staysActiveInBackground === false
    ).length;
    expect(after).toBe(1);

    await melodixPlayer.setStaysActiveInBackground(true);
    const finalCall =
      av.setAudioModeAsync.mock.calls[
        av.setAudioModeAsync.mock.calls.length - 1
      ];
    expect(finalCall[0]).toMatchObject({ staysActiveInBackground: true });
  });
});

// ---------------------------------------------------------------------------
// Phase 1 — course critique (token d'annulation) + fallback EN COURS de
// lecture (Audius flux mort → YouTube pour LE MÊME morceau).
// ---------------------------------------------------------------------------

type Deferred<T> = {
  promise: Promise<T>;
  resolve: (value: T) => void;
  reject: (error: unknown) => void;
};

const deferred = <T>(): Deferred<T> => {
  let resolve!: (value: T) => void;
  let reject!: (error: unknown) => void;
  const promise = new Promise<T>((res, rej) => {
    resolve = res;
    reject = rej;
  });

  return { promise, resolve, reject };
};

describe('Phase 1 — course critique : aucun double Sound, le dernier gagne', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    lastSound = null;
    mockCreatedSounds = [];
    __testSetAudioProviders({ audius: makeProvider() });
    await melodixPlayer.__testReset();
  });

  it('deux lectures concurrentes partagent un seul chargement de cache', async () => {
    const cacheGate = deferred<void>();
    const getItemMock = AsyncStorage.getItem as jest.Mock;
    const previousGetItem = getItemMock.getMockImplementation();
    getItemMock.mockImplementation(async (key) => {
      if (key === MATCH_CACHE_STORAGE_KEY) {
        await cacheGate.promise;
      }
      return null;
    });
    const cacheReadsBefore = getItemMock.mock.calls.filter(
      ([key]) => key === MATCH_CACHE_STORAGE_KEY
    ).length;
    const provider = makeProvider({
      resolveMatch: jest.fn(async (query) => ({
        sourceId: `match-${query.title}`,
        score: 0.9,
      })),
    });
    __testSetAudioProviders({ audius: provider });

    void melodixPlayer.playTrack(track('one'));
    for (let attempt = 0; attempt < 10; attempt += 1) {
      const reads = getItemMock.mock.calls.filter(
        ([key]) => key === MATCH_CACHE_STORAGE_KEY
      ).length;
      if (reads > cacheReadsBefore) break;
      await flush();
    }
    void melodixPlayer.playTrack(track('two'));
    await flush();
    const initialCacheReads = getItemMock.mock.calls.filter(
      ([key]) => key === MATCH_CACHE_STORAGE_KEY
    ).length;
    cacheGate.resolve();
    expect(initialCacheReads - cacheReadsBefore).toBe(1);
    await flush();
    await flush();
    await flush();

    expect(provider.resolveMatch).toHaveBeenCalledTimes(2);

    await melodixPlayer.stop();
    (provider.resolveMatch as jest.Mock).mockClear();
    await melodixPlayer.playTrack(track('one'));
    await flush();

    expect(provider.resolveMatch).not.toHaveBeenCalled();
    getItemMock.mockImplementation(previousGetItem);
  });

  it('A puis A très vite : UN SEUL Sound créé (le 2e appel gagne)', async () => {
    void melodixPlayer.playTrack(track('one'));
    void melodixPlayer.playTrack(track('one'));
    await flush();
    await flush();
    await flush();

    expect(mockCreatedSounds).toHaveLength(1);
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');
  });

  it('deux play identiques partagent la résolution Audius en vol', async () => {
    const matchGate = deferred<{ sourceId: string; score: number } | null>();
    const provider = makeProvider({
      resolveMatch: jest.fn(() => matchGate.promise),
    });
    __testSetAudioProviders({ audius: provider });

    const first = melodixPlayer.playTrack(track('same'));
    for (let attempt = 0; attempt < 10; attempt += 1) {
      if ((provider.resolveMatch as jest.Mock).mock.calls.length > 0) break;
      await flush();
    }
    const second = melodixPlayer.playTrack(track('same'));
    await flush();

    expect(provider.resolveMatch).toHaveBeenCalledTimes(1);
    matchGate.resolve({ sourceId: 'aud-shared', score: 0.9 });
    await Promise.all([first, second]);
    await flush();

    expect(provider.resolveMatch).toHaveBeenCalledTimes(1);
    expect(provider.resolveSource).toHaveBeenCalledTimes(1);
    expect(mockCreatedSounds).toHaveLength(1);
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('un play lancé après un stop lent gagne toujours la course', async () => {
    await melodixPlayer.playTrack(track('one', 'Initial A'));
    await flush();
    const slowUnload = deferred<void>();
    lastSound.unloadAsync.mockReturnValueOnce(slowUnload.promise);

    const stopping = melodixPlayer.stop();
    await Promise.resolve();
    const playingB = melodixPlayer.playTrack(track('two', 'Latest B'));
    slowUnload.resolve();
    await Promise.all([stopping, playingB]);
    await flush();

    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      current: expect.objectContaining({ title: 'Latest B' }),
    });
  });

  it('B puis C pendant un unload lent : seul le dernier morceau démarre', async () => {
    await melodixPlayer.playTrack(track('one', 'Initial A'));
    await flush();
    const slowUnload = deferred<void>();
    lastSound.unloadAsync.mockReturnValueOnce(slowUnload.promise);

    const playingB = melodixPlayer.playTrack(track('two', 'Superseded B'));
    await Promise.resolve();
    const playingC = melodixPlayer.playTrack(track('three', 'Latest C'));
    slowUnload.resolve();
    await Promise.all([playingB, playingC]);
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Latest C');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(mockCreatedSounds).toHaveLength(2); // A puis C, jamais B
  });

  it('une pause lente de l ancien Sound ne pause pas le nouveau morceau', async () => {
    await melodixPlayer.playTrack(track('one', 'Initial A'));
    await flush();
    const slowPause = deferred<void>();
    lastSound.pauseAsync.mockReturnValueOnce(slowPause.promise);

    const pausingA = melodixPlayer.togglePlayPause();
    await Promise.resolve();
    await melodixPlayer.playTrack(track('two', 'Latest B'));
    slowPause.resolve();
    await pausingA;
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Latest B');
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('deux toggles pendant une pause native lente respectent le dernier geste', async () => {
    await melodixPlayer.playTrack(track('one', 'Initial A'));
    await flush();
    const slowPause = deferred<void>();
    lastSound.pauseAsync.mockReturnValueOnce(slowPause.promise);

    const pause = melodixPlayer.togglePlayPause();
    await Promise.resolve();
    const resume = melodixPlayer.togglePlayPause();

    // La reprise est sérialisée derrière la pause native en vol.
    expect(lastSound.playAsync).not.toHaveBeenCalled();
    slowPause.resolve();
    await Promise.all([pause, resume]);

    expect(lastSound.pauseAsync).toHaveBeenCalledTimes(1);
    expect(lastSound.playAsync).toHaveBeenCalledTimes(1);
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('un seek lent de l ancien Sound ne déplace pas le nouveau morceau', async () => {
    await melodixPlayer.playTrack(track('one', 'Initial A'));
    await flush();
    const slowSeek = deferred<void>();
    lastSound.setPositionAsync.mockReturnValueOnce(slowSeek.promise);

    const seekingA = melodixPlayer.seekTo(42_000);
    await Promise.resolve();
    await melodixPlayer.playTrack(track('two', 'Latest B'));
    slowSeek.resolve();
    await seekingA;

    expect(melodixPlayer.getState().current?.title).toBe('Latest B');
    expect(melodixPlayer.getState().positionMillis).toBe(0);
  });

  it('un volume lent est déjà appliqué au morceau de remplacement', async () => {
    await melodixPlayer.playTrack(track('one', 'Initial A'));
    await flush();
    const oldSound = lastSound;
    const slowVolume = deferred<void>();
    oldSound.setVolumeAsync.mockReturnValueOnce(slowVolume.promise);

    const changingVolume = melodixPlayer.setVolume(0.25);
    expect(melodixPlayer.getState().volume).toBe(0.25);
    const playingB = melodixPlayer.playTrack(track('two', 'Latest B'));
    await playingB;
    slowVolume.resolve();
    await changingVolume;
    await flush();

    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { Sound: { createAsync: jest.Mock } };
    };
    const latestInitialStatus = av.Sound.createAsync.mock.calls.at(-1)?.[1];
    expect(latestInitialStatus).toEqual(
      expect.objectContaining({ volume: 0.25 })
    );
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      volume: 0.25,
      current: expect.objectContaining({ title: 'Latest B' }),
    });
  });

  it('next pendant loading invalide la résolution avant un unload lent', async () => {
    const slowB = deferred<ResolvedStream | null>();
    const provider = makeProvider({
      resolveMatch: jest.fn(async (query) => ({
        sourceId: query.title,
        score: 0.9,
      })),
      resolveSource: jest.fn(async (sourceId: string) =>
        sourceId === 'Loading B'
          ? slowB.promise
          : { uri: `https://stream/${sourceId}` }
      ),
    });
    __testSetAudioProviders({ audius: provider });
    await melodixPlayer.playQueue(
      [
        track('one', 'Initial A'),
        track('two', 'Loading B'),
        track('three', 'Expected C'),
      ],
      0
    );
    await flush();

    void melodixPlayer.playAtIndex(1);
    await flush();
    expect(melodixPlayer.getState().status).toBe('loading');
    const slowUnload = deferred<void>();
    mockCreatedSounds[0].unloadAsync.mockReturnValueOnce(slowUnload.promise);

    const movingNext = melodixPlayer.next();
    await Promise.resolve();
    slowB.resolve({ uri: 'https://stream/b' });
    await Promise.resolve();
    slowUnload.resolve();
    await movingNext;
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Expected C');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(mockCreatedSounds).toHaveLength(2); // A puis C, jamais B
  });

  it('un play plus récent gagne sur next bloqué dans un unload', async () => {
    const slowB = deferred<ResolvedStream | null>();
    const provider = makeProvider({
      resolveMatch: jest.fn(async (query) => ({
        sourceId: query.title,
        score: 0.9,
      })),
      resolveSource: jest.fn(async (sourceId: string) =>
        sourceId === 'Loading B'
          ? slowB.promise
          : { uri: `https://stream/${sourceId}` }
      ),
    });
    __testSetAudioProviders({ audius: provider });
    await melodixPlayer.playQueue(
      [track('a', 'A'), track('b', 'Loading B'), track('c', 'Old next C')],
      0
    );
    void melodixPlayer.playAtIndex(1);
    await flush();

    const slowUnload = deferred<void>();
    mockCreatedSounds[0].unloadAsync.mockReturnValueOnce(slowUnload.promise);
    const oldNext = melodixPlayer.next();
    await Promise.resolve();
    const latestPlay = melodixPlayer.playTrack(track('d', 'Latest D'));

    slowB.resolve({ uri: 'https://stream/b' });
    slowUnload.resolve();
    await Promise.all([oldNext, latestPlay]);
    await flush();

    expect(melodixPlayer.getState()).toMatchObject({
      current: expect.objectContaining({ title: 'Latest D' }),
      status: 'playing',
    });
    expect(mockCreatedSounds).toHaveLength(2); // A puis D
  });

  it('A en résolution lente, l’utilisateur lance B : A abandonné, B joue', async () => {
    const provider = makeProvider();
    const slowResolve = deferred<{ sourceId: string; score: number } | null>();
    (provider.resolveMatch as jest.Mock).mockReturnValueOnce(
      slowResolve.promise
    );
    __testSetAudioProviders({ audius: provider });

    void melodixPlayer.playTrack(track('one', 'Slow A'));
    await flush(); // A est entré en résolution

    const providerFast = makeProvider();
    __testSetAudioProviders({ audius: providerFast });
    await melodixPlayer.playTrack(track('two', 'Fast B'));
    await flush();
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Fast B');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(mockCreatedSounds).toHaveLength(1);

    // A termine ENFIN son resolve : il ne doit JAMAIS reprendre la main.
    slowResolve.resolve({ sourceId: 'aud-slow', score: 0.9 });
    await flush();
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Fast B');
    expect(melodixPlayer.getState().status).toBe('playing');
    // A n'a créé AUCUN Sound supplémentaire.
    expect(mockCreatedSounds).toHaveLength(1);
  });

  it('Zone 7 : A en chargement → B lancé → C ajouté → A termine : AUCUNE contamination', async () => {
    const provider = makeProvider();
    const slowResolve = deferred<{
      sourceId: string;
      score: number;
    } | null>();
    (provider.resolveMatch as jest.Mock).mockReturnValueOnce(
      slowResolve.promise
    );
    __testSetAudioProviders({ audius: provider });

    void melodixPlayer.playTrack(track('one', 'Pending A'));
    await flush(); // A en résolution

    // B prend la main (provider frais, rapide).
    __testSetAudioProviders({ audius: makeProvider() });
    await melodixPlayer.playTrack(track('two', 'Active B'));
    await flush();
    await flush();
    await flush();
    expect(melodixPlayer.getState().current?.title).toBe('Active B');

    // C ajouté à la file PENDANT que A n'a toujours pas répondu.
    await melodixPlayer.addToQueue(track('three', 'Queued C'));
    expect(melodixPlayer.getState().queue.map(({ title }) => title)).toEqual([
      'Active B',
      'Queued C',
    ]);

    // A termine ENFIN : aucun son, aucun changement d'état, C intact.
    slowResolve.resolve({ sourceId: 'aud-zombie', score: 0.9 });
    await flush();
    await flush();
    await flush();

    const state = melodixPlayer.getState();
    expect(state.current?.title).toBe('Active B');
    expect(state.status).toBe('playing');
    expect(state.queue.map(({ title }) => title)).toEqual([
      'Active B',
      'Queued C',
    ]);
    expect(mockCreatedSounds).toHaveLength(1); // B uniquement
    await melodixPlayer.stop();
  });

  it('A échoue (aucun match) après le démarrage de B : aucune notice fantôme', async () => {
    const failSlow = makeProvider();
    const slowFail = deferred<{ sourceId: string; score: number } | null>();
    (failSlow.resolveMatch as jest.Mock).mockReturnValueOnce(slowFail.promise);
    __testSetAudioProviders({ audius: failSlow });

    void melodixPlayer.playTrack(track('one', 'WillFail A'));
    await flush();

    __testSetAudioProviders({ audius: makeProvider() });
    await melodixPlayer.playTrack(track('two', 'Solid B'));
    await flush();
    await flush();
    await flush();
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      notice: null,
    });

    // L'échec de A arrive APRÈS : ignoré — B continue, aucune erreur affichée.
    slowFail.resolve(null);
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Solid B');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().notice).toBeNull();
    expect(mockCreatedSounds).toHaveLength(1);
  });

  it('stop() pendant une résolution : le son orphelin arrivé ensuite est déchargé', async () => {
    const provider = makeProvider();
    const slowMatch = deferred<{ sourceId: string; score: number } | null>();
    (provider.resolveMatch as jest.Mock).mockReturnValueOnce(slowMatch.promise);
    __testSetAudioProviders({ audius: provider });

    void melodixPlayer.playTrack(track('one'));
    await flush();
    await melodixPlayer.stop();

    slowMatch.resolve({ sourceId: 'aud-good', score: 0.9 });
    await flush();
    await flush();
    await flush();

    expect(mockCreatedSounds).toHaveLength(0);
    expect(melodixPlayer.getState().status).toBe('idle');
  });
});

describe('Phase 1 — fallback en cours de lecture Audius → YouTube', () => {
  const makeYouTube = (
    overrides: FakeProviderOverrides = {}
  ): AudioProvider => ({
    id: 'youtube',
    displayName: 'YouTube',
    matches: jest.fn(async () => []),
    resolveMatch: jest.fn(async () => ({ sourceId: 'yt-live', score: 0.82 })),
    resolveSource: jest.fn(
      async (sourceId: string): Promise<ResolvedStream | null> => ({
        uri: `https://yt-stream/${sourceId}`,
      })
    ),
    ...overrides,
  });

  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    lastSound = null;
    mockCreatedSounds = [];
    await melodixPlayer.__testReset();
  });

  it('Audius OK → Audius joué, YouTube JAMAIS recherché (cascade propre)', async () => {
    const audius = makeProvider();
    const youtube = makeYouTube();
    __testSetAudioProviders({ audius, youtube });

    await melodixPlayer.playTrack(track('one'));
    await flush();
    await flush();

    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().resolved?.provider).toBe('Audius');
    expect(youtube.resolveMatch).not.toHaveBeenCalled();
    expect(youtube.resolveSource).not.toHaveBeenCalled();
  });

  it('match Audius OK mais flux MORT → YouTube pour LE MÊME morceau (pas de skip)', async () => {
    const audius = makeProvider({
      resolveMatch: jest.fn(async () => ({
        sourceId: 'aud-dead',
        score: 0.94,
      })),
      resolveSource: jest.fn(async () => null),
    });
    const youtube = makeYouTube();
    __testSetAudioProviders({ audius, youtube });

    await melodixPlayer.playTrack(track('one'));
    await flush();
    await flush();
    await flush();

    const state = melodixPlayer.getState();
    // Le MÊME morceau continue — la SOURCE a changé, pas le titre.
    expect(state.current?.id).toBe('spotify:one');
    expect(state.status).toBe('playing');
    expect(state.resolved?.provider).toBe('YouTube');
    expect(state.resolved?.sourceId).toBe('yt-live');
    // La suite de la cascade seulement — JAMAIS de re-recherche globale inutile.
    expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
    expect(mockCreatedSounds).toHaveLength(1);

    // Décision YouTube persistée : un replay ne recherche RIEN du tout.
    await melodixPlayer.stop();
    (youtube.resolveMatch as jest.Mock).mockClear();
    (audius.resolveMatch as jest.Mock).mockClear();

    await melodixPlayer.playTrack(track('one'));
    await flush();
    await flush();

    expect(audius.resolveMatch).not.toHaveBeenCalled();
    expect(youtube.resolveMatch).not.toHaveBeenCalled();
    expect(melodixPlayer.getState().resolved?.provider).toBe('YouTube');
  });

  it('Audius flux mort + YouTube indisponible → skip propre sans négatif durable', async () => {
    // Seule « Dead A » a un flux Audius mort ; « Playable B » joue normalement.
    const audius = makeProvider({
      resolveMatch: jest.fn(async (query) =>
        query.title === 'Dead A'
          ? { sourceId: 'aud-dead', score: 0.9 }
          : { sourceId: 'aud-good', score: 0.9 }
      ),
      resolveSource: jest.fn(async (sourceId: string) =>
        sourceId === 'aud-dead' ? null : { uri: `https://stream/${sourceId}` }
      ),
    });
    const youtube = makeYouTube({
      resolveMatch: jest.fn(async () => null),
    });
    __testSetAudioProviders({ audius, youtube });

    const seenNotices: unknown[] = [];
    const unsubscribe = melodixPlayer.subscribe((s2) =>
      seenNotices.push(s2.notice)
    );

    await melodixPlayer.playQueue(
      [track('one', 'Dead A'), track('two', 'Playable B')],
      0
    );
    // Boucle mémoire profonde : fallback YouTube (null) → négatif persisté →
    // avance vers B → résolution complète → son joué. Généreux en ticks.
    for (let i = 0; i < 12; i++) {
      await flush();
    }

    // A considéré indisponible → file CONTINUE vers B qui joue.
    expect(melodixPlayer.getState().current?.title).toBe('Playable B');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(seenNotices).toContainEqual({
      kind: 'not-available',
      title: 'Dead A',
    });
    unsubscribe();

    // Un flux mort peut être une panne CDN : la lecture suivante retente la
    // décision au lieu de conserver 24 h un faux « indisponible ».
    (audius.resolveMatch as jest.Mock).mockClear();
    (youtube.resolveMatch as jest.Mock).mockClear();
    await melodixPlayer.playQueue([track('one', 'Dead A')], 0);
    await flush();
    await flush();
    await flush();

    expect(audius.resolveMatch).toHaveBeenCalledTimes(1);
    expect(youtube.resolveMatch).toHaveBeenCalledTimes(1);
    expect(melodixPlayer.getState().status).toBe('idle'); // plus rien de jouable
  });

  it('un échec en fin de file ne reboucle que si repeat-all est actif', async () => {
    const provider = makeProvider({
      resolveMatch: jest.fn(async (query) =>
        query.title === 'Dead B' ? null : { sourceId: 'aud-good', score: 0.9 }
      ),
    });
    __testSetAudioProviders({ audius: provider });
    const queue = [track('one', 'Playable A'), track('two', 'Dead B')];

    await melodixPlayer.playQueue(queue, 1);
    for (let i = 0; i < 6; i += 1) await flush();

    expect(melodixPlayer.getState()).toMatchObject({
      status: 'idle',
      current: null,
      queue: [],
    });
    expect(provider.resolveMatch).toHaveBeenCalledTimes(1);

    (provider.resolveMatch as jest.Mock).mockClear();
    melodixPlayer.setRepeat('all');
    await melodixPlayer.playQueue(queue, 1);
    for (let i = 0; i < 8; i += 1) await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Playable A');
    expect(melodixPlayer.getState().status).toBe('playing');
    // B est un no-match déjà prouvé et mis en cache ; seul A est recherché.
    expect(provider.resolveMatch).toHaveBeenCalledTimes(1);
  });

  it('erreur réseau Audius (throw) → YouTube prend le relais du MÊME morceau', async () => {
    const audius = makeProvider({
      resolveMatch: jest.fn(async () => {
        throw new Error('discovery node down');
      }),
    });
    const youtube = makeYouTube();
    __testSetAudioProviders({ audius, youtube });

    await melodixPlayer.playTrack(track('one'));
    await flush();
    await flush();
    await flush();

    expect(melodixPlayer.getState().status).toBe('playing');
    expect(melodixPlayer.getState().resolved?.provider).toBe('YouTube');
    expect(melodixPlayer.getState().current?.id).toBe('spotify:one');
  });

  it('aucun double Sound pendant un fallback lent puis changement de morceau', async () => {
    const audius = makeProvider({
      resolveMatch: jest.fn(async (query) =>
        query.title === 'Slow A'
          ? { sourceId: 'aud-slow', score: 0.9 }
          : { sourceId: 'aud-good', score: 0.9 }
      ),
      resolveSource: jest.fn(async (sourceId: string) =>
        sourceId === 'aud-slow'
          ? slowSource.promise
          : { uri: `https://stream/${sourceId}` }
      ),
    });
    const slowSource = deferred<ResolvedStream | null>();
    const youtube = makeYouTube();
    __testSetAudioProviders({ audius, youtube });

    void melodixPlayer.playTrack(track('one', 'Slow A'));
    await flush();

    // L'utilisateur bascule sur B pendant que le flux A se décide encore.
    await melodixPlayer.playTrack(track('two', 'Now B'));
    await flush();
    await flush();
    await flush();

    expect(melodixPlayer.getState().current?.title).toBe('Now B');
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(mockCreatedSounds).toHaveLength(1);

    // A conclut enfin : abandonné — Sound pour B reste le seul jamais créé.
    slowSource.resolve(null);
    await flush();
    await flush();
    await flush();

    expect(mockCreatedSounds).toHaveLength(1);
    expect(melodixPlayer.getState().current?.title).toBe('Now B');
  });
});

/**
 * PHASE 2 — file d'attente avancée : add / play-next / remove / move,
 * cohérence shuffle + repeat, persistance et restauration de session.
 *
 * Invariants testés : `queue` reste toujours la liste ORIGINALE intacte ;
 * `order` (shuffle) est une permutation exacte remappée ; `index` suit le
 * MÊME morceau ; aucun autoplay au boot (la session n'est jouée que par
 * restoreSession explicite).
 */
describe('Phase 2 — file d attente avancée', () => {
  const permutation = (order: number[], taille: number) =>
    expect([...order].sort((a, b) => a - b)).toEqual(
      Array.from({ length: taille }, (_, i) => i)
    );

  let provider: AudioProvider;

  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    lastSound = null;
    mockCreatedSounds = [];
    provider = makeProvider();
    __testSetAudioProviders({ audius: provider });
    await melodixPlayer.__testReset();
  });

  const jouerFileABC = async () => {
    await melodixPlayer.playQueue(
      [track('a', 'A'), track('b', 'B'), track('c', 'C')],
      0
    );
    await flush();
  };

  it('playQueue déduplique et conserve le morceau demandé', async () => {
    await melodixPlayer.playQueue(
      [
        track('a', 'A'),
        track('b', 'B première'),
        track('b', 'B dupliqué'),
        track('c', 'C'),
      ],
      2
    );
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ id }) => id)).toEqual([
      'spotify:a',
      'spotify:b',
      'spotify:c',
    ]);
    expect(state.index).toBe(1);
    expect(state.current?.title).toBe('B première');
  });

  it('addToQueue (shuffle OFF) : place en FIN, lecture et index inchangés', async () => {
    await jouerFileABC();
    melodixPlayer.addToQueue(track('d', 'D'));
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'B', 'C', 'D']);
    expect(state.index).toBe(0);
    expect(state.current?.title).toBe('A');
    expect(state.status).toBe('playing');
  });

  it('addToQueue (shuffle ON) : file originale conservative, ordre complété en fin', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();
    melodixPlayer.addToQueue(track('d', 'D'));

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'B', 'C', 'D']);
    expect(state.order).not.toBeNull();
    permutation(state.order as number[], 4);
    // Le nouveau morceau est joué EN DERNIER de l'ordre.
    expect((state.order as number[])[3]).toBe(3);
  });

  it('orderPointer reste aligné après next, ajout, suppression et move en shuffle', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();

    await melodixPlayer.next();
    let state = melodixPlayer.getState();
    expect((state.order as number[])[state.orderPointer]).toBe(state.index);
    expect(state.orderPointer).toBe(1);

    melodixPlayer.addToQueue(track('d', 'D'));
    state = melodixPlayer.getState();
    expect((state.order as number[])[state.orderPointer]).toBe(state.index);

    const removable = state.queue.findIndex(
      (_, queueIndex) => queueIndex !== state.index
    );
    melodixPlayer.removeFromQueue(removable);
    state = melodixPlayer.getState();
    expect((state.order as number[])[state.orderPointer]).toBe(state.index);

    const movable = state.queue.findIndex(
      (_, queueIndex) => queueIndex !== state.index
    );
    melodixPlayer.moveInQueue(movable, state.queue.length - 1);
    state = melodixPlayer.getState();
    expect((state.order as number[])[state.orderPointer]).toBe(state.index);
  });

  it('addTracksToQueue ajoute un lot atomiquement sans doublons', async () => {
    await jouerFileABC();
    melodixPlayer.addTracksToQueue([
      track('b', 'B dupliqué'),
      track('d', 'D'),
      track('d', 'D dupliqué dans le lot'),
      track('e', 'E'),
    ]);

    expect(melodixPlayer.getState().queue.map(({ title }) => title)).toEqual([
      'A',
      'B',
      'C',
      'D',
      'E',
    ]);
  });

  it('clearQueue arrête le son et vide la source de vérité centrale', async () => {
    await jouerFileABC();
    await melodixPlayer.clearQueue();

    expect(lastSound.unloadAsync).toHaveBeenCalled();
    expect(melodixPlayer.getState()).toMatchObject({
      queue: [],
      index: -1,
      current: null,
      status: 'idle',
    });
  });

  it('addToQueue ignore silencieusement un morceau sans id/titre', () => {
    melodixPlayer.addToQueue({ id: '', title: '' } as unknown as PlayerTrack);

    expect(melodixPlayer.getState().queue).toHaveLength(0);
  });

  it('playNext (shuffle OFF) : A B C + « lire ensuite » D → A D B C', async () => {
    await jouerFileABC();
    melodixPlayer.playNext(track('d', 'D'));
    await flush();

    let state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'D', 'B', 'C']);
    expect(state.current?.title).toBe('A');

    await melodixPlayer.next();
    await flush();
    state = melodixPlayer.getState();
    expect(state.current?.title).toBe('D');
  });

  it('playNext déplace une piste déjà en file au lieu de la dupliquer', async () => {
    await jouerFileABC();
    melodixPlayer.playNext(track('c', 'C actualisé'));

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ id }) => id)).toEqual([
      'spotify:a',
      'spotify:c',
      'spotify:b',
    ]);
    expect(state.queue.filter(({ id }) => id === 'spotify:c')).toHaveLength(1);
    expect(state.current?.id).toBe('spotify:a');

    await melodixPlayer.next();
    await flush();
    expect(melodixPlayer.getState().current?.id).toBe('spotify:c');
  });

  it('playNext (shuffle ON) : D joué IMMÉDIATEMENT après le courant de l ordre', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();
    melodixPlayer.playNext(track('d', 'D'));

    const state = melodixPlayer.getState();
    permutation(state.order as number[], 4);
    const ordre = state.order as number[];
    // pointer 0 = courant (0) ; pointer 1 = le NOUVEAU morceau (index 1).
    expect(ordre[0]).toBe(0);
    expect(ordre[1]).toBe(1);

    await melodixPlayer.next();
    await flush();
    expect(
      melodixPlayer.getState().queue[melodixPlayer.getState().index].title
    ).toBe('D');
  });

  it('playNext déduplique aussi sous shuffle et impose la piste suivante', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();
    melodixPlayer.playNext(track('c', 'C'));

    const state = melodixPlayer.getState();
    expect(state.queue.filter(({ id }) => id === 'spotify:c')).toHaveLength(1);
    const order = state.order as number[];
    const currentPointer = order.indexOf(state.index);
    expect(state.queue[order[currentPointer + 1]].id).toBe('spotify:c');
  });

  it('playNext SANS session : la lecture DÉMARRE (action jamais invisible — M-1)', async () => {
    melodixPlayer.playNext(track('solo', 'Solo'));
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['Solo']);
    expect(state.index).toBe(0);
    expect(state.current?.title).toBe('Solo');
    expect(state.status).toBe('playing');
  });

  it('playNext sur file DORMANTE (addToQueue sans lecture) : conserve + joue la fin (M-1)', async () => {
    // File dormante : « Ajouter à la file » seul ne lance rien (index -1).
    melodixPlayer.addToQueue(track('a', 'A'));
    expect(melodixPlayer.getState().queue.map(({ title }) => title)).toEqual([
      'A',
    ]);

    melodixPlayer.playNext(track('b', 'B'));
    await flush();

    const state = melodixPlayer.getState();
    // A conservé (jamais de perte silencieuse), B joue immédiatement.
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'B']);
    expect(state.current?.title).toBe('B');
    expect(state.status).toBe('playing');
  });

  it('playNext sur file dormante joue une piste existante sans doublon', async () => {
    melodixPlayer.addToQueue(track('a', 'A'));

    melodixPlayer.playNext(track('a', 'A actualisé'));
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ id }) => id)).toEqual(['spotify:a']);
    expect(state.current?.id).toBe('spotify:a');
  });

  it('remove d un morceau APRÈS le courant : index et lecture inchangés', async () => {
    await jouerFileABC();
    melodixPlayer.removeFromQueue(2);
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'B']);
    expect(state.index).toBe(0);
    expect(state.current?.title).toBe('A');
    expect(state.status).toBe('playing');
  });

  it('remove d un morceau AVANT le courant : index décale, MÊME morceau pointé', async () => {
    await jouerFileABC();
    await melodixPlayer.playAtIndex(2); // courant = C
    await flush();

    melodixPlayer.removeFromQueue(0); // retire A
    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['B', 'C']);
    expect(state.index).toBe(1);
    expect(state.current?.title).toBe('C');
    expect(state.status).toBe('playing');
  });

  it('remove pendant shuffle : ordre remappé en permutation exacte, courant conservé', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();

    melodixPlayer.removeFromQueue(1); // retire B (non courant)
    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'C']);
    permutation(state.order as number[], 2);
    expect(state.current?.title).toBe('A');
    expect(state.status).toBe('playing');
  });

  it('remove du MORCEAU COURANT (shuffle OFF, milieu) : le suivant est joué', async () => {
    await jouerFileABC();
    const sonsAvant = mockCreatedSounds.length;

    melodixPlayer.removeFromQueue(0); // retire A ▶
    await flush();
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['B', 'C']);
    expect(state.current?.title).toBe('B');
    expect(state.status).toBe('playing');
    // Un NOUVEAU son a été créé pour B (le son d A déchargé).
    expect(mockCreatedSounds.length).toBeGreaterThan(sonsAvant);
  });

  it('remove du MORCEAU COURANT DERNIER (shuffle OFF) : le précédent prend le relais', async () => {
    await jouerFileABC();
    await melodixPlayer.playAtIndex(2); // courant = C (dernier)
    await flush();

    melodixPlayer.removeFromQueue(2);
    await flush();
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'B']);
    expect(state.current?.title).toBe('B');
  });

  it('remove du MORCEAU COURANT pendant shuffle : suit l ordre aléatoire', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();
    const ordre = melodixPlayer.getState().order as number[];
    // Suivant logique de l ordre actuel (pointer=0 → le suivant).
    const suivantAttendu = ordre[1];

    melodixPlayer.removeFromQueue(melodixPlayer.getState().index);
    await flush();
    await flush();

    const state = melodixPlayer.getState();
    // Le morceau joué est celui qui SUIVAIT dans l ancien ordre (remappé).
    const attendu =
      state.queue[suivantAttendu - (suivantAttendu > 0 ? 1 : 0)]?.title;
    expect(state.current?.title).toBe(attendu);
  });

  it('remove du SEUL morceau : file vide, lecture arrêté proprement', async () => {
    await melodixPlayer.playQueue([track('solo', 'Solo')], 0);
    await flush();

    melodixPlayer.removeFromQueue(0);
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue).toHaveLength(0);
    expect(state.status).toBe('idle');
  });

  it('remove du courant PENDANT sa résolution : aucune résolution orpheline ne joue', async () => {
    await jouerFileABC();
    // B lent : son resolve reste en vol quand on supprime.
    (provider.resolveMatch as jest.Mock).mockImplementationOnce(
      () => new Promise(() => {})
    );
    void melodixPlayer.playAtIndex(1);

    melodixPlayer.removeFromQueue(0); // supprime A (le courant en attente)
    expect(melodixPlayer.getState().current?.title).toBe('B');
  });

  it('moveInQueue : déplace sans casser index ni courant', async () => {
    await jouerFileABC();
    // Déplace C (2) en tête (0).
    melodixPlayer.moveInQueue(2, 0);

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['C', 'A', 'B']);
    expect(state.index).toBe(1); // A est passé de 0 à 1
    expect(state.current?.title).toBe('A');
    expect(state.status).toBe('playing');
  });

  it('moveInQueue sur le MORCEAU COURANT : l index suit son morceau', async () => {
    await jouerFileABC();
    melodixPlayer.moveInQueue(0, 2); // A ▶ vers la fin

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['B', 'C', 'A']);
    expect(state.index).toBe(2);
    expect(state.current?.title).toBe('A');
    expect(state.status).toBe('playing');
  });

  it('moveInQueue pendant shuffle : ordre remappé, permutation toujours exacte', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();

    melodixPlayer.moveInQueue(0, 2);
    const state = melodixPlayer.getState();
    permutation(state.order as number[], 3);
    // Le courant (A passé à l index 2) reste OUVERT À LA TÊTE du pointer.
    expect((state.order as number[])[state.orderPointer]).toBe(state.index);
  });

  it('repeat ONE + remove du courant : la boucle s interrompt, le suivant joue', async () => {
    await jouerFileABC();
    melodixPlayer.setRepeat('one');

    melodixPlayer.removeFromQueue(0);
    await flush();
    await flush();

    const state = melodixPlayer.getState();
    expect(state.current?.title).toBe('B'); // pas de boucle sur A supprimé
    expect(state.repeat).toBe('one'); // le réglage repeat SURVIT
  });

  it('persistance : pause/changement de morceau ÉCRIVENT la session', async () => {
    await jouerFileABC();
    await flush();

    const ecrit1 = await AsyncStorage.getItem('@melodix/playback-session.v1');
    expect(ecrit1).not.toBeNull();
    expect(JSON.parse(ecrit1 as string).queue).toHaveLength(3);

    await melodixPlayer.togglePlayPause(); // pause → écriture
    const ecrit2 = await AsyncStorage.getItem('@melodix/playback-session.v1');
    expect(JSON.parse(ecrit2 as string).index).toBe(0);
  });

  it('persistance sobre : JAMAIS d écriture continue pendant la lecture', async () => {
    const baseTime = 1_000_000_000_000;
    // Horloge figée AVANT la 1re écriture : lastPersistedAt part de baseTime.
    const nowSpy = jest.spyOn(Date, 'now').mockReturnValue(baseTime);

    await jouerFileABC();
    await flush();

    const stockCle = '@melodix/playback-session.v1';
    expect(await AsyncStorage.getItem(stockCle)).not.toBeNull();
    await AsyncStorage.removeItem(stockCle);

    // Trois ticks de lecture à +1 s/+2 s/+3 s (< 8 s) : AUCUNE écriture.
    nowSpy.mockReturnValue(baseTime + 1_000);
    lastStatusCallback?.({ isPlaying: true, positionMillis: 1_000 });
    nowSpy.mockReturnValue(baseTime + 2_000);
    lastStatusCallback?.({ isPlaying: true, positionMillis: 1_500 });
    nowSpy.mockReturnValue(baseTime + 3_000);
    lastStatusCallback?.({ isPlaying: true, positionMillis: 2_000 });
    await flush();

    expect(await AsyncStorage.getItem(stockCle)).toBeNull();

    // 9 s après la dernière écriture : UNE seule sauvegarde repasse.
    nowSpy.mockReturnValue(baseTime + 9_500);
    lastStatusCallback?.({ isPlaying: true, positionMillis: 11_000 });
    await flush();

    expect(await AsyncStorage.getItem(stockCle)).not.toBeNull();
    nowSpy.mockRestore();
  });

  it('stop explicite PURGE la session persistée (jamais de "Reprendre" après arrêt)', async () => {
    await jouerFileABC();
    await flush();
    expect(
      await AsyncStorage.getItem('@melodix/playback-session.v1')
    ).not.toBeNull();

    await melodixPlayer.stop();
    await flush();

    expect(
      await AsyncStorage.getItem('@melodix/playback-session.v1')
    ).toBeNull();
  });

  it('restoreSession : file + morceau + position restaurés, shuffle rebâti', async () => {
    const sSeek = 65_000;
    await melodixPlayer.restoreSession({
      version: 1,
      savedAt: Date.now(),
      queue: [track('a', 'A'), track('b', 'B'), track('c', 'C')],
      index: 1,
      positionMillis: sSeek,
      shuffle: true,
      repeat: 'all',
      volume: 0.5,
    });
    await flush();

    const state = melodixPlayer.getState();
    expect(state.queue.map(({ title }) => title)).toEqual(['A', 'B', 'C']);
    expect(state.index).toBe(1);
    expect(state.current?.title).toBe('B');
    expect(state.status).toBe('playing');
    expect(state.repeat).toBe('all');
    expect(state.volume).toBe(0.5);
    permutation(state.order as number[], 3);
    // Ordre rebâti : le morceau restauré est TOUJOURS au pointer 0.
    expect((state.order as number[])[0]).toBe(1);
    // Position consommée UNE FOIS le son prêt.
    expect(lastSound?.setPositionAsync).toHaveBeenCalledWith(sSeek);
    expect(melodixPlayer.getState().positionMillis).toBe(sSeek);
  });

  it('restoreSession sans morceau valide : no-op silencieux (jamais d autoplay vide)', async () => {
    await melodixPlayer.restoreSession({
      version: 1,
      savedAt: Date.now(),
      queue: [],
      index: 0,
      positionMillis: 0,
      shuffle: false,
      repeat: 'off',
      volume: 1,
    });
    await flush();

    expect(melodixPlayer.getState().status).toBe('idle');
    expect(mockCreatedSounds).toHaveLength(0);
  });

  it('boot : JAMAIS d autoplay — la session stockée reste dormante', async () => {
    await AsyncStorage.setItem(
      '@melodix/playback-session.v1',
      JSON.stringify({
        version: 1,
        savedAt: Date.now(),
        queue: [{ ...track('a', 'A') }],
        index: 0,
        positionMillis: 0,
        shuffle: false,
        repeat: 'off',
        volume: 1,
      })
    );

    // AUCUN appel de restoreSession : rien ne joue.
    expect(melodixPlayer.getState().status).toBe('idle');
    expect(mockCreatedSounds).toHaveLength(0);
  });

  it('aucune fuite : shuffle INCHANGÉ par add/remove/move', async () => {
    await jouerFileABC();
    melodixPlayer.toggleShuffle();
    melodixPlayer.addToQueue(track('d', 'D'));
    melodixPlayer.playNext(track('e', 'E'));
    melodixPlayer.removeFromQueue(3); // D ajouté=file index 3
    melodixPlayer.moveInQueue(1, 2);

    const state = melodixPlayer.getState();
    expect(state.shuffle).toBe(true);
    permutation(state.order as number[], 4);
    expect(state.current?.title).toBe('A');
  });

  // I-1 : file > 200 — la session persistée est FENÊTRÉE sur le courant ;
  // la restauration retrouve le MÊME morceau (plus de « Reprendre » perdu).
  it('I-1 : file de 500, position 250 — session fenêtrée, restauration = même morceau', async () => {
    const queue500 = Array.from({ length: 500 }, (_, i) =>
      track(`t${i}`, `T${i}`)
    );
    await melodixPlayer.playQueue(queue500, 250);
    await flush();

    // File EN MÉMOIRE intacte : 500 morceaux, index 250.
    expect(melodixPlayer.getState().queue).toHaveLength(500);
    expect(melodixPlayer.getState().index).toBe(250);

    const raw = await AsyncStorage.getItem('@melodix/playback-session.v1');
    expect(raw).not.toBeNull();
    const saved = JSON.parse(raw as string);

    // Fenêtre centrée : 150→349, index persisté = 100, courant dedans.
    expect(saved.queue).toHaveLength(200);
    expect(saved.index).toBe(100);
    expect(saved.queue[saved.index].id).toBe('spotify:t250');
    // La session fenêtrée est ACCEPTÉE par le chargeur strict.
    const session = await loadPlaybackSession();
    expect(session).not.toBeNull();

    await melodixPlayer.stop();
    await melodixPlayer.restoreSession(session as never);
    await flush();

    const state = melodixPlayer.getState();
    expect(state.status).toBe('playing');
    expect(state.current?.id).toBe('spotify:t250');
    expect(state.index).toBe(100); // index réaligné dans la fenêtre
    expect(state.queue).toHaveLength(200);
  });
});

describe('Phase 5D — fiabilisation moteur (races / fin collante / seek en vol)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    lastSound = null;
    mockCreatedSounds = [];
    __testSetAudioProviders({ audius: makeProvider() });
    await melodixPlayer.__testReset();
  });

  it('un callback initial synchrone ne fait pas rejeter le Sound créé', async () => {
    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { Sound: { createAsync: jest.Mock } };
    };
    av.Sound.createAsync.mockImplementationOnce(
      async (
        _source: { uri: string },
        _initial: Record<string, unknown>,
        onStatus?: (status: Record<string, unknown>) => void
      ) => {
        const created = makeSound();
        lastStatusCallback = onStatus ?? null;
        // Comportement autorisé par expo-av : premier statut avant la
        // résolution de createAsync.
        onStatus?.({
          isLoaded: true,
          isPlaying: true,
          positionMillis: 0,
          durationMillis: 180_000,
        });
        lastSound = created;
        mockCreatedSounds.push(created);
        return {
          sound: created,
          status: {
            isLoaded: true,
            isPlaying: true,
            isBuffering: false,
            positionMillis: 0,
            durationMillis: 180_000,
          },
        };
      }
    );

    await melodixPlayer.playTrack(track('sync', 'Synchronous status'));
    await flush();

    expect(mockCreatedSounds).toHaveLength(1);
    expect(lastSound.unloadAsync).not.toHaveBeenCalled();
    expect(melodixPlayer.getState()).toMatchObject({
      status: 'playing',
      current: expect.objectContaining({ id: 'spotify:sync' }),
    });
  });

  it('§8 : deux ticks didJustFinish CONSÉCUTIFS du même son = UNE SEULE transition (jamais de saut à N+2)', async () => {
    await melodixPlayer.playQueue(
      [track('a', 'A'), track('b', 'B'), track('c', 'C')],
      0
    );
    await flush();

    const callbackSonA = lastStatusCallback;
    const sonsAvant = mockCreatedSounds.length;

    // expo-av peut RÉÉMETTRE didJustFinish=true sur un tick collant (le
    // vieux son n'est pas encore déchargé quand le suivant se résout).
    callbackSonA?.({ isLoaded: true, didJustFinish: true });
    callbackSonA?.({ isLoaded: true, didJustFinish: true });
    await flush();

    // UN SEUL son supplémentaire créé, morceau B joué — JAMAIS un saut vers C.
    expect(mockCreatedSounds.length).toBe(sonsAvant + 1);
    expect(melodixPlayer.getState().current?.id).toBe('spotify:b');

    // Et le tick ORPHELIN du vieux son reste ignoré bien après la transition.
    callbackSonA?.({ isLoaded: true, didJustFinish: true });
    await flush();
    expect(mockCreatedSounds.length).toBe(sonsAvant + 1);
    expect(melodixPlayer.getState().current?.id).toBe('spotify:b');
  });

  it('§2 : « pause » PENDANT le chargement n est pas un redémarrage (garde loading)', async () => {
    // Résolution artificiellement lente : la fenêtre loading existe vraiment.
    const lente = new Promise<void>((resolve) => setTimeout(resolve, 25));
    const provider = makeProvider({
      resolveSource: jest.fn(async (sourceId: string) => {
        await lente;
        return { uri: `https://stream/${sourceId}` };
      }),
    });
    __testSetAudioProviders({ audius: provider });

    // Sans await : pendant la fenêtre réelle de chargement (résolution lente).
    void melodixPlayer.playQueue([track('a', 'A')], 0);
    await flush(); // pousse les microtâches : emit 'loading' fait, timer 25 ms pas encore
    expect(melodixPlayer.getState().status).toBe('loading');

    // Geste utilisateur très rapide — ignore proprement, aucune relance.
    await melodixPlayer.togglePlayPause();
    await melodixPlayer.togglePlayPause();

    await flush();
    await new Promise((resolve) => setTimeout(resolve, 40));

    // UN SEUL son, UNE SEULE création — le morceau démarre normalement.
    expect(melodixPlayer.getState().status).toBe('playing');
    expect(mockCreatedSounds.length).toBe(1);
  });

  it('§3 : seek PENDANT le chargement est appliqué à l arrivée du son', async () => {
    const lente = new Promise<void>((resolve) => setTimeout(resolve, 25));
    const provider = makeProvider({
      resolveSource: jest.fn(async (sourceId: string) => {
        await lente;
        return { uri: `https://stream/${sourceId}` };
      }),
    });
    __testSetAudioProviders({ audius: provider });

    // Sans await : pendant la fenêtre réelle de chargement (résolution lente).
    void melodixPlayer.playQueue([track('a', 'A')], 0);
    await flush(); // emit 'loading' fait, la résolution lente n'est pas finie
    expect(melodixPlayer.getState().status).toBe('loading');

    // L'utilisateur glisse la barre AVANT que la durée soit connue.
    await melodixPlayer.seekTo(42_000);

    await flush();
    await new Promise((resolve) => setTimeout(resolve, 40));

    // Le mécanisme existant (pendingSeekMillis, comme la restauration) a
    // appliqué la cible au nouveau son — jamais de seek fantôme ni d'erreur.
    expect(lastSound.setPositionAsync).toHaveBeenCalledWith(42_000);
    expect(melodixPlayer.getState().positionMillis).toBe(42_000);
    expect(melodixPlayer.getState().status).toBe('playing');
  });

  it('un seek différé lent de A ne modifie jamais la position de B', async () => {
    const sourceGate = deferred<ResolvedStream | null>();
    const seekGate = deferred<void>();
    const provider = makeProvider({
      resolveSource: jest
        .fn()
        .mockReturnValueOnce(sourceGate.promise)
        .mockImplementation(async (sourceId: string) => ({
          uri: `https://stream/${sourceId}`,
        })),
    });
    __testSetAudioProviders({ audius: provider });
    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { Sound: { createAsync: jest.Mock } };
    };
    av.Sound.createAsync.mockImplementationOnce(
      async (
        _source: { uri: string },
        _initial: Record<string, unknown>,
        onStatus?: (status: Record<string, unknown>) => void
      ) => {
        lastStatusCallback = onStatus ?? null;
        const created = makeSound();
        created.setPositionAsync.mockReturnValueOnce(seekGate.promise);
        lastSound = created;
        mockCreatedSounds.push(created);
        return {
          sound: created,
          status: {
            isLoaded: true,
            isPlaying: true,
            isBuffering: false,
            positionMillis: 0,
          },
        };
      }
    );

    const playingA = melodixPlayer.playQueue([track('a', 'A')], 0);
    await flush();
    await melodixPlayer.seekTo(42_000);
    sourceGate.resolve({ uri: 'https://stream/a' });
    for (let attempt = 0; attempt < 10; attempt += 1) {
      if (lastSound?.setPositionAsync.mock.calls.length) break;
      await flush();
    }
    expect(lastSound.setPositionAsync).toHaveBeenCalledWith(42_000);

    await melodixPlayer.playTrack(track('b', 'B'));
    expect(melodixPlayer.getState().current?.id).toBe('spotify:b');
    seekGate.resolve();
    await playingA;
    await flush();

    expect(melodixPlayer.getState()).toMatchObject({
      current: expect.objectContaining({ id: 'spotify:b' }),
      status: 'playing',
      positionMillis: 0,
    });
  });

  it('M-7 : échec createAsync dont l erreur cite l URL SIGNÉE → journal ASSAINI', async () => {
    const { Audio: av } = jest.requireMock('expo-av') as {
      Audio: { Sound: { createAsync: jest.Mock } };
    };
    av.Sound.createAsync.mockRejectedValueOnce(
      new Error(
        'Player error for content https://cdn.private.invalid/audio.m4a?sig=SECRET_TOKEN&expire=999'
      )
    );
    const errorSpy = jest.spyOn(console, 'error').mockImplementation(() => {});

    await melodixPlayer.playQueue([track('broken', 'Broken')], 0);
    await flush();
    await flush();

    expect(errorSpy).toHaveBeenCalled();
    const serialized = errorSpy.mock.calls
      .flatMap((args) => args.map(String))
      .join(' ');
    expect(serialized).not.toContain('https://cdn.private.invalid');
    expect(serialized).not.toContain('SECRET_TOKEN');
    expect(serialized).toContain('<url>');
    // file d un seul morceau → avance impossible → session stoppée proprement
    expect(melodixPlayer.getState().status).toBe('idle');

    errorSpy.mockRestore();
  });
});
describe('Seek en attente, ciblage du morceau (BUG 1 + restauration)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    lastStatusCallback = null;
    lastSound = null;
    mockCreatedSounds = [];
    __testSetAudioProviders({ audius: makeProvider() });
    await melodixPlayer.__testReset();
  });

  it('seekTo(en chargement) puis next → le seek de A ne atterrit PAS sur B', async () => {
    // Resolve lent : laisse une vraie fenêtre « loading » pour le seek.
    __testSetAudioProviders({
      audius: makeProvider({
        resolveSource: (sourceId: string) =>
          new Promise((resolve) =>
            setTimeout(() => resolve({ uri: `https://stream/${sourceId}` }), 25)
          ),
      }),
    });
    const playPromise = melodixPlayer.playQueue([track('a'), track('b')], 0);
    await flush(); // émission « loading » effectuée, resolve en vol
    // Le son n'existe pas encore : statut « loading » → cible mémorisée.
    await melodixPlayer.seekTo(30_000);
    await playPromise;
    // Son A arrivé : son propre seek (30 s) lui est appliqué — trace valide.
    const soundA = mockCreatedSounds[0];
    expect(soundA.setPositionAsync).toHaveBeenCalledWith(30_000);

    await melodixPlayer.next();
    const soundB = mockCreatedSounds[1];
    expect(soundB).toBeDefined();
    // Le seek de 30 s visait « a » : « b » doit démarrer à 0, jamais à 30 s.
    expect(soundB.setPositionAsync).not.toHaveBeenCalled();
    await melodixPlayer.stop();
  });

  it('restauration borne la position persistée à la durée connue', async () => {
    await melodixPlayer.restoreSession({
      version: 1,
      savedAt: Date.now(),
      queue: [{ ...track('a', 'A'), durationMillis: 100_000 }],
      index: 0,
      positionMillis: 150_000,
      shuffle: false,
      repeat: 'off',
      volume: 1,
    });

    expect(lastSound.setPositionAsync).toHaveBeenCalledWith(100_000);
    expect(melodixPlayer.getState().positionMillis).toBe(100_000);
  });

  it('restoreSession puis next → la position restaurée N EST PAS re-appliquée au morceau suivant', async () => {
    await melodixPlayer.restoreSession({
      version: 1,
      savedAt: Date.now(),
      queue: [track('a', 'A'), track('b', 'B')],
      index: 0,
      positionMillis: 15_000,
      shuffle: false,
      repeat: 'all',
      volume: 1,
    });
    await flush();
    const soundA = mockCreatedSounds[0];
    expect(soundA.setPositionAsync).toHaveBeenCalledWith(15_000);

    await melodixPlayer.next();
    const soundB = mockCreatedSounds[1];
    expect(soundB).toBeDefined();
    expect(soundB.setPositionAsync).not.toHaveBeenCalled();
    await melodixPlayer.stop();
  });

  it('stop purgue un seek en attente (rien applique au morceau suivant)', async () => {
    __testSetAudioProviders({
      audius: makeProvider({
        resolveSource: (sourceId: string) =>
          new Promise((resolve) =>
            setTimeout(
              () =>
                resolve({
                  uri: `https://stream/${sourceId}`,
                }),
              25
            )
          ),
      }),
    });
    const playPromise = melodixPlayer.playQueue([track('a'), track('b')], 0);
    await melodixPlayer.seekTo(42_000);
    // stop AVANT l arrivée du son : le seek mémorisé doit être purgé.
    await melodixPlayer.stop();
    await playPromise;
    await melodixPlayer.playQueue([track('a'), track('b')], 1);
    await new Promise((resolve) => setTimeout(resolve, 50));
    const soundB = mockCreatedSounds[0];
    expect(soundB).toBeDefined();
    expect(soundB.setPositionAsync).not.toHaveBeenCalled();
    await melodixPlayer.stop();
  });
});
