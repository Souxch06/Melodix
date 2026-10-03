import { buildBackendMediaSessionPayload } from '../mediaProjection';
import { SpotifyWebBackend } from '../SpotifyWebBackend';
import {
  parseSpotifyWebBridgeMessage,
  parseSpotifyWebCommand,
} from '../spotifyWebBridge';
import { normalizeSpotifyWebState } from '../spotifyWebState';
import {
  classifySpotifyWebUrl,
  diagnosticPageLabel,
  isAllowedSpotifyWebNavigation,
} from '../spotifyWebRuntime';

describe('Spotify Web playback state normalization', () => {
  it('normalise playing/paused sans inventer les métadonnées absentes', () => {
    expect(normalizeSpotifyWebState({ status: 'playing' })).toMatchObject({
      status: 'playing',
      title: null,
      artists: [],
      artworkUrl: null,
      durationMillis: 0,
      positionMillis: 0,
    });
    expect(normalizeSpotifyWebState({ status: 'paused' }).status).toBe(
      'paused'
    );
  });

  it('rejette états, durées, positions et artworks invalides', () => {
    expect(
      normalizeSpotifyWebState({
        status: 'buffering',
        durationMillis: Number.NaN,
        positionMillis: -12,
        artworkUrl: 'javascript:alert(1)',
      })
    ).toEqual({
      backendId: 'spotify-web',
      status: 'idle',
      trackId: null,
      title: null,
      artists: [],
      artworkUrl: null,
      durationMillis: 0,
      positionMillis: 0,
      isPlaying: false,
      isLoading: false,
      errorCode: null,
    });
  });

  it('borne la position à la durée et normalise les erreurs renderer', () => {
    expect(
      normalizeSpotifyWebState({
        status: 'error',
        errorCode: 'renderer_destroyed',
        durationMillis: 1000,
        positionMillis: 9000,
      })
    ).toMatchObject({
      status: 'error',
      errorCode: 'renderer_destroyed',
      durationMillis: 1000,
      positionMillis: 1000,
    });
  });
});

describe('Spotify Web bridge validation', () => {
  it('accepte uniquement les enveloppes connues', () => {
    expect(
      parseSpotifyWebBridgeMessage('{"type":"ready","version":1}')
    ).toEqual({ type: 'ready', version: 1 });
    expect(
      parseSpotifyWebBridgeMessage(
        '{"version":1,"type":"state","payload":{"status":"playing"}}'
      )
    ).toEqual({ version: 1, type: 'state', payload: { status: 'playing' } });
    expect(
      parseSpotifyWebBridgeMessage(
        '{"version":1,"type":"error","code":"network_error"}'
      )
    ).toEqual({ version: 1, type: 'error', code: 'network_error' });
  });

  it.each([
    '',
    'not-json',
    '{"type":"unknown"}',
    '{"type":"state","payload":null}',
    '{"type":"error","code":"token=secret"}',
    '{"version":1,"type":"state","payload":{"status":"playing","cookie":"forbidden"}}',
    '{"version":1,"type":"state","payload":{"artists":"not-an-array"}}',
  ])('rejette un message invalide sans throw: %s', (raw) => {
    expect(parseSpotifyWebBridgeMessage(raw)).toBeNull();
  });

  it('rejette les commandes inconnues', () => {
    expect(parseSpotifyWebCommand({ version: 1, command: 'play' })).toEqual({
      version: 1,
      command: 'play',
    });
    expect(parseSpotifyWebCommand({ version: 1, command: 'pause' })).toEqual({
      version: 1,
      command: 'pause',
    });
    expect(
      parseSpotifyWebCommand({
        version: 1,
        command: 'seek',
        positionMillis: 1234,
      })
    ).toEqual({ version: 1, command: 'seek', positionMillis: 1234 });
    expect(parseSpotifyWebCommand({ version: 1, command: 'next' })).toEqual({
      version: 1,
      command: 'next',
    });
    expect(parseSpotifyWebCommand({ version: 1, command: 'previous' })).toEqual(
      { version: 1, command: 'previous' }
    );
    expect(
      parseSpotifyWebCommand({ version: 1, command: 'extract-cookies' })
    ).toBeNull();
    expect(
      parseSpotifyWebCommand({
        version: 1,
        command: 'seek',
        positionMillis: -1,
      })
    ).toBeNull();
    expect(parseSpotifyWebCommand(null)).toBeNull();
  });
});

describe('future MediaSession projection', () => {
  it('ne projette rien sans titre et normalise un état jouable', () => {
    const empty = normalizeSpotifyWebState({ status: 'playing' });
    expect(buildBackendMediaSessionPayload(empty)).toBeNull();

    const payload = buildBackendMediaSessionPayload(
      normalizeSpotifyWebState({
        status: 'playing',
        trackId: 'spotify:web:1',
        title: 'Track',
        artists: ['Artist'],
        artworkUrl: 'https://i.scdn.co/image/test',
        durationMillis: 1000,
        positionMillis: 2000,
      })
    );
    expect(payload).toEqual({
      trackId: 'spotify:web:1',
      title: 'Track',
      artist: 'Artist',
      album: null,
      artworkUrl: 'https://i.scdn.co/image/test',
      durationMillis: 1000,
      positionMillis: 1000,
      isPlaying: true,
    });
  });
});

describe('SpotifyWebBackend isolated lifecycle', () => {
  it('publie les transitions playing/paused/error et délègue les commandes', async () => {
    const backend = new SpotifyWebBackend();
    const statuses: string[] = [];
    const play = jest.fn(async () => true);
    const pause = jest.fn(async () => true);
    const seek = jest.fn(async () => true);
    const next = jest.fn(async () => true);
    const previous = jest.fn(async () => true);
    const unsubscribe = backend.subscribe((state) =>
      statuses.push(state.status)
    );
    backend.attachRuntime({ play, pause, seek, next, previous });

    backend.updateState({ status: 'playing', title: 'Track' });
    backend.updateState({ status: 'paused', title: 'Track' });
    backend.updateState({ status: 'error', errorCode: 'renderer_destroyed' });

    await expect(backend.play()).resolves.toBe(true);
    await expect(backend.pause()).resolves.toBe(true);
    await expect(backend.seek(1200)).resolves.toBe(true);
    await expect(backend.next()).resolves.toBe(true);
    await expect(backend.previous()).resolves.toBe(true);
    await expect(backend.seek(Number.NaN)).resolves.toBe(false);
    expect(play).toHaveBeenCalledTimes(1);
    expect(pause).toHaveBeenCalledTimes(1);
    expect(seek).toHaveBeenCalledWith(1200);
    expect(next).toHaveBeenCalledTimes(1);
    expect(previous).toHaveBeenCalledTimes(1);
    expect(statuses).toEqual(['idle', 'playing', 'paused', 'error']);
    expect(backend.getState().errorCode).toBe('renderer_destroyed');

    unsubscribe();
    backend.destroy();
    await expect(backend.play()).resolves.toBe(false);
  });
});

describe('SpotifyWebBackend bridge intake', () => {
  it('applique uniquement un message versionné et strictement validé', () => {
    const backend = new SpotifyWebBackend();
    expect(
      backend.receiveBridgeMessage(
        JSON.stringify({
          version: 1,
          type: 'state',
          payload: {
            trackId: 'track-1',
            title: 'Track',
            artists: ['Artist'],
            durationMillis: 2000,
            positionMillis: 500,
            isPlaying: true,
            isLoading: false,
          },
        })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      trackId: 'track-1',
      artists: ['Artist'],
      isPlaying: true,
      isLoading: false,
    });
    expect(
      backend.receiveBridgeMessage(
        '{"version":1,"type":"state","payload":{"token":"secret"}}'
      )
    ).toBe('rejected');
    expect(backend.getState().trackId).toBe('track-1');
  });
});

describe('Spotify Web navigation safety', () => {
  it('autorise seulement HTTPS sur les domaines Spotify', () => {
    expect(classifySpotifyWebUrl('https://open.spotify.com/')).toBe(
      'spotify-player'
    );
    expect(classifySpotifyWebUrl('https://accounts.spotify.com/login')).toBe(
      'spotify-login'
    );
    expect(
      isAllowedSpotifyWebNavigation('https://challenge.spotify.com/')
    ).toBe(true);
    expect(isAllowedSpotifyWebNavigation('http://open.spotify.com/')).toBe(
      false
    );
    expect(isAllowedSpotifyWebNavigation('https://evil.example/')).toBe(false);
  });

  it('ne retourne jamais path, query ou fragment dans le diagnostic', () => {
    expect(
      diagnosticPageLabel(
        'https://accounts.spotify.com/authorize?code=sensitive#token=sensitive'
      )
    ).toBe('accounts.spotify.com');
  });
});
