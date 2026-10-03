import { SPOTIFY_WEB_BRIDGE_VERSION } from './spotifyWebBridge';

/**
 * Standards-only diagnostic probe.
 *
 * It reads the public W3C Media Session surface exposed by the loaded page.
 * It never touches DOM nodes, cookies, storage, network APIs, credentials,
 * media elements or Spotify internals. It only queries EME/Widevine capability;
 * it never creates a MediaKeys session or requests DRM keys. Availability in
 * Spotify's Android WebView runtime remains empirical.
 */
export const SPOTIFY_WEB_MEDIA_SESSION_PROBE = `
(() => {
  const bridge = globalThis.ReactNativeWebView;
  if (!bridge || typeof bridge.postMessage !== 'function') return true;
  const post = (message) => bridge.postMessage(JSON.stringify(message));
  post({ version: ${SPOTIFY_WEB_BRIDGE_VERSION}, type: 'ready' });

  const navigatorApi = globalThis.navigator;
  const mediaSession = navigatorApi && navigatorApi.mediaSession;
  const eme = Boolean(
    navigatorApi && typeof navigatorApi.requestMediaKeySystemAccess === 'function'
  );
  const publishCapabilities = async () => {
    let widevine = false;
    if (eme) {
      try {
        await navigatorApi.requestMediaKeySystemAccess(
          'com.widevine.alpha',
          [{
            initDataTypes: ['cenc'],
            audioCapabilities: [{ contentType: 'audio/mp4; codecs="mp4a.40.2"' }],
          }]
        );
        widevine = true;
      } catch (_) {
        widevine = false;
      }
    }
    post({
      version: ${SPOTIFY_WEB_BRIDGE_VERSION},
      type: 'capabilities',
      payload: { mediaSession: Boolean(mediaSession), eme, widevine },
    });
  };
  void publishCapabilities();

  if (!mediaSession) {
    post({ version: ${SPOTIFY_WEB_BRIDGE_VERSION}, type: 'error', code: 'media_session_unavailable' });
    return true;
  }

  let previousSignature = '';
  const boundedText = (value, max) =>
    typeof value === 'string' ? value.slice(0, max) : null;
  const publish = () => {
    const metadata = mediaSession.metadata;
    const playbackState = mediaSession.playbackState;
    const artwork = metadata && Array.isArray(metadata.artwork)
      ? metadata.artwork.find((item) => item && typeof item.src === 'string')
      : null;
    const payload = {
      status: playbackState === 'playing'
        ? 'playing'
        : playbackState === 'paused'
          ? 'paused'
          : 'idle',
      trackId: null,
      title: metadata ? boundedText(metadata.title, 2048) : null,
      artists: metadata && typeof metadata.artist === 'string' && metadata.artist
        ? [metadata.artist.slice(0, 256)]
        : [],
      artworkUrl: artwork ? boundedText(artwork.src, 2048) : null,
      durationMillis: 0,
      positionMillis: 0,
      isPlaying: playbackState === 'playing',
      isLoading: false,
      errorCode: null,
    };
    const signature = JSON.stringify(payload);
    if (signature !== previousSignature) {
      previousSignature = signature;
      post({ version: ${SPOTIFY_WEB_BRIDGE_VERSION}, type: 'state', payload });
    }
  };

  publish();
  globalThis.setInterval(publish, 1000);
  true;
})();
`;
