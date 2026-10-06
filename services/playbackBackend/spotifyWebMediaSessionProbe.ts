import { SPOTIFY_WEB_BRIDGE_VERSION } from './spotifyWebBridge';

/**
 * Standards-only injected side of the Spotify Web bridge (protocol v2).
 *
 * Inbound (page → Melodix), it reads only the public W3C surfaces published by
 * the loaded page itself: `navigator.mediaSession.playbackState`, its
 * `metadata` and, when the page exposes it, `positionState`. State is only
 * ever published from what the page published; playback status is never
 * inferred from anything else.
 *
 * Outbound (Melodix → page), it receives versioned, correlated command
 * envelopes over the standard `message` channel and answers each one with a
 * `command-response`. Execution is deliberately refused: no standard,
 * authorized page-side surface allows a bridge to drive Spotify Web playback,
 * and touching DOM controls, media elements, protected content paths, or
 * faking input would cross that line. Success therefore always means "the
 * page accepted the command" — which, in this phase, the page answers
 * honestly. The whole correlation, expiry and handshake contract is live and
 * exercised end to end.
 *
 * It never touches storage, privileged data, network APIs, media elements or
 * Spotify internals. It only queries EME/Widevine capability; it never creates
 * a MediaKeys session or requests DRM keys.
 */
export const SPOTIFY_WEB_MEDIA_SESSION_PROBE = `
(() => {
  const bridge = globalThis.ReactNativeWebView;
  if (!bridge || typeof bridge.postMessage !== 'function') return true;
  const post = (message) => {
    try {
      bridge.postMessage(JSON.stringify(message));
    } catch (_) {}
  };
  post({ version: ${SPOTIFY_WEB_BRIDGE_VERSION}, type: 'ready' });

  const SAFE_ID = /^[A-Za-z0-9_-]{1,40}$/;
  const COMMANDS = { play: 1, pause: 1, toggle: 1, seek: 1, next: 1, previous: 1 };
  const respond = (requestId, accepted, code) => {
    post({
      version: ${SPOTIFY_WEB_BRIDGE_VERSION},
      type: 'command-response',
      requestId,
      accepted,
      code,
    });
  };
  globalThis.addEventListener('message', (event) => {
    let value = null;
    try {
      value =
        typeof event.data === 'string' ? JSON.parse(event.data) : null;
    } catch (_) {
      return;
    }
    if (
      !value ||
      typeof value !== 'object' ||
      value.version !== ${SPOTIFY_WEB_BRIDGE_VERSION} ||
      value.type !== 'command'
    ) {
      return;
    }
    const requestId =
      typeof value.requestId === 'string' ? value.requestId : '';
    if (!SAFE_ID.test(requestId)) return;
    const command = value.command;
    const shapeValid =
      typeof command === 'string' &&
      (command === 'seek'
        ? typeof value.positionMillis === 'number' &&
          Number.isFinite(value.positionMillis) &&
          value.positionMillis >= 0
        : COMMANDS[command] === 1);
    if (!shapeValid) {
      respond(requestId, false, 'malformed-command');
      return;
    }
    // No authorized execution surface exists from inside the page; refuse
    // honestly instead of simulating anything.
    respond(requestId, false, 'no-authorized-execution-surface');
  });

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
      payload: {
        mediaSession: Boolean(mediaSession),
        eme,
        widevine,
        positionState: Boolean(
          mediaSession &&
            typeof mediaSession.positionState === 'object' &&
            mediaSession.positionState !== null
        ),
      },
    });
  };
  void publishCapabilities();

  if (!mediaSession) {
    post({ version: ${SPOTIFY_WEB_BRIDGE_VERSION}, type: 'error', code: 'media_session_unavailable' });
    return true;
  }

  // Identité de piste : l'URL publique du document lui-même (page piste
  // open.spotify.com/track/<id>). C'est la même information que l'hôte natif
  // reçoit par l'événement standard de navigation de la WebView — aucune
  // donnée de stockage, aucun objet média, aucun chemin protégé n'est lu.
  // null partout ailleurs : une identité inconnue ne doit jamais être
  // inventée (garde anti-faux-positif du transport).
  const TRACK_PATH = /^\/track\/([a-z0-9]{22})(?:[/?#]|$)/;
  const trackIdFromDocument = () => {
    try {
      const href = String(globalThis.location && globalThis.location.href);
      const match = TRACK_PATH.exec(href);
      return match ? match[1] : null;
    } catch (_) {
      return null;
    }
  };

  // Détection de fin : navigator.mediaSession ne publie que playing /
  // paused / none. Un passage playing → paused COLLÉ à la fin de la piste
  // (position dans les 3 dernières secondes) est le fait observable d'une
  // fin de morceau ; tout le reste reste honnêtement paused. Sans
  // positionState (capacité absente), la fin reste indétectable — et rien
  // n'est inventé.
  const END_TOLERANCE_MS = 3000;
  let lastPlaybackState = null;

  let previousSignature = '';
  const boundedText = (value, max) =>
    typeof value === 'string' ? value.slice(0, max) : null;
  const finiteMillis = (seconds) =>
    typeof seconds === 'number' && Number.isFinite(seconds) && seconds >= 0
      ? Math.round(seconds * 1000)
      : 0;
  const publish = () => {
    const playbackState = mediaSession.playbackState;
    const metadata = mediaSession.metadata;
    const positionState = mediaSession.positionState;
    const positionMillis = positionState ? finiteMillis(positionState.position) : 0;
    const durationMillis = positionState ? finiteMillis(positionState.duration) : 0;
    const endedLike =
      playbackState === 'paused' &&
      lastPlaybackState === 'playing' &&
      durationMillis > 0 &&
      positionMillis >= durationMillis - END_TOLERANCE_MS;
    const declared =
      playbackState === 'playing' ? 'playing' : endedLike ? 'ended' : playbackState === 'paused' ? 'paused' : 'idle';
    lastPlaybackState = playbackState;
    const artwork = metadata && Array.isArray(metadata.artwork)
      ? metadata.artwork.find((item) => item && typeof item.src === 'string')
      : null;
    const payload = {
      status: declared,
      trackId: trackIdFromDocument(),
      title: metadata ? boundedText(metadata.title, 2048) : null,
      artists: metadata && typeof metadata.artist === 'string' && metadata.artist
        ? [metadata.artist.slice(0, 256)]
        : [],
      artworkUrl: artwork ? boundedText(artwork.src, 2048) : null,
      durationMillis,
      positionMillis,
      isPlaying: playbackState === 'playing',
      isLoading: false,
      errorCode: null,
      source: 'media-session',
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
