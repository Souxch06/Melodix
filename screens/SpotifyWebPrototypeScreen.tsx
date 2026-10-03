import * as React from 'react';
import { AppState, Pressable, StyleSheet, Text, View } from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { useRouter } from 'expo-router';
import { WebView } from 'react-native-webview';
import type { WebViewNavigation } from 'react-native-webview';
import type { WebViewRenderProcessGoneEvent } from 'react-native-webview/lib/WebViewTypes';

import { COLORS } from '@config';
import {
  diagnosticPageLabel,
  isAllowedSpotifyWebNavigation,
  SpotifyWebBackend,
  type PlaybackBackendState,
  type SpotifyWebDiagnosticCode,
} from '../services/playbackBackend';

const SPOTIFY_WEB_URL = 'https://open.spotify.com';
const MAX_EVENTS = 12;

type DiagnosticEvent = {
  id: number;
  code: SpotifyWebDiagnosticCode | 'command_unavailable';
  detail?: string;
};

/**
 * Experimental, isolated WebView probe. It does not receive OAuth PKCE data,
 * inspect cookies/storage, inject scripts, scrape the DOM or touch PlayerContext.
 */
export const SpotifyWebPrototypeScreen = () => {
  const router = useRouter();
  const webViewRef = React.useRef<WebView>(null);
  const backendRef = React.useRef(new SpotifyWebBackend());
  const eventIdRef = React.useRef(0);
  const sawLoginRef = React.useRef(false);
  const currentPageRef = React.useRef('open.spotify.com');
  const [backendState, setBackendState] = React.useState<PlaybackBackendState>(
    backendRef.current.getState()
  );
  const [events, setEvents] = React.useState<DiagnosticEvent[]>([]);
  const [canGoBack, setCanGoBack] = React.useState(false);
  const [canGoForward, setCanGoForward] = React.useState(false);
  const [rendererAvailable, setRendererAvailable] = React.useState(true);

  const report = React.useCallback(
    (code: DiagnosticEvent['code'], detail?: string) => {
      // detail is always a controlled enum/label, never an upstream URL/error.
      setEvents((previous) =>
        [
          { id: ++eventIdRef.current, code, ...(detail ? { detail } : {}) },
          ...previous,
        ].slice(0, MAX_EVENTS)
      );
    },
    []
  );

  React.useEffect(() => {
    const backend = backendRef.current;
    const unsubscribe = backend.subscribe(setBackendState);
    // Commands intentionally remain unavailable until a reliable, approved
    // runtime API exists. No DOM/media-element control is injected.
    backend.attachRuntime({
      play: async () => false,
      pause: async () => false,
      seek: async () => false,
      next: async () => false,
      previous: async () => false,
    });
    return () => {
      unsubscribe();
      backend.destroy();
    };
  }, []);

  React.useEffect(() => {
    const subscription = AppState.addEventListener('change', (nextState) => {
      report(nextState === 'active' ? 'foreground' : 'background');
    });
    return () => subscription.remove();
  }, [report]);

  const handleNavigation = React.useCallback(
    (navigation: WebViewNavigation) => {
      const label = diagnosticPageLabel(navigation.url);
      currentPageRef.current = label;
      setCanGoBack(navigation.canGoBack);
      setCanGoForward(navigation.canGoForward);
      if (label === 'accounts.spotify.com') {
        sawLoginRef.current = true;
        report('login_page', label);
      } else if (label === 'open.spotify.com') {
        report(
          sawLoginRef.current ? 'returned_from_login' : 'spotify_loaded',
          label
        );
      }
    },
    [report]
  );

  const handleRendererGone = React.useCallback(
    (_event: WebViewRenderProcessGoneEvent) => {
      setRendererAvailable(false);
      backendRef.current.updateState({
        status: 'error',
        errorCode: 'renderer_destroyed',
      });
      report('renderer_destroyed');
    },
    [report]
  );

  const reload = React.useCallback(() => {
    setRendererAvailable(true);
    backendRef.current.updateState({ status: 'loading' });
    report('webview_loading', 'rechargement manuel');
    webViewRef.current?.reload();
  }, [report]);

  const requestCommand = React.useCallback(
    async (command: 'play' | 'pause') => {
      const accepted =
        command === 'play'
          ? await backendRef.current.play()
          : await backendRef.current.pause();
      if (!accepted) report('command_unavailable', command);
    },
    [report]
  );

  return (
    <View style={styles.screen} testID="spotify-web-prototype-screen">
      <View style={styles.header}>
        <Pressable
          accessibilityLabel="Retour"
          onPress={() => router.back()}
          style={styles.iconButton}
          testID="spotify-web-close"
        >
          <Ionicons color={COLORS.WHITE} name="close" size={26} />
        </Pressable>
        <View style={styles.headerText}>
          <Text style={styles.title}>Prototype Spotify Web</Text>
          <Text style={styles.experimental}>EXPÉRIMENTAL · DIAGNOSTIC</Text>
        </View>
        <Pressable
          accessibilityLabel="Recharger"
          onPress={reload}
          style={styles.iconButton}
          testID="spotify-web-reload"
        >
          <Ionicons color={COLORS.WHITE} name="reload" size={22} />
        </Pressable>
      </View>

      <View style={styles.statusPanel}>
        <Text style={styles.statusText} testID="spotify-web-status">
          WebView: {rendererAvailable ? 'active' : 'renderer détruit'} · page:{' '}
          {currentPageRef.current}
        </Text>
        <Text style={styles.statusText}>
          Lecture: {backendState.status} · session: indéterminée
        </Text>
        <Text style={styles.disclaimer}>
          Aucun cookie, token, credential ou flux n’est lu par Melodix.
        </Text>
      </View>

      <View style={styles.webContainer}>
        <WebView
          allowsInlineMediaPlayback
          cacheEnabled
          domStorageEnabled
          javaScriptEnabled
          mediaPlaybackRequiresUserAction
          mixedContentMode="never"
          onError={() => {
            backendRef.current.updateState({
              status: 'error',
              errorCode: 'network_error',
            });
            report('network_error');
          }}
          onHttpError={(event) => {
            const code =
              diagnosticPageLabel(event.nativeEvent.url) === 'open.spotify.com'
                ? 'web_player_inaccessible'
                : 'http_error';
            report(code, `HTTP ${event.nativeEvent.statusCode}`);
          }}
          onLoadEnd={() => {
            backendRef.current.updateState({ status: 'idle' });
            report('webview_loaded');
          }}
          onLoadStart={() => {
            backendRef.current.updateState({ status: 'loading' });
            report('webview_loading');
          }}
          onNavigationStateChange={handleNavigation}
          onRenderProcessGone={handleRendererGone}
          onShouldStartLoadWithRequest={(request) => {
            const allowed = isAllowedSpotifyWebNavigation(request.url);
            if (!allowed) report('navigation_blocked');
            return allowed;
          }}
          originWhitelist={['https://*.spotify.com/*', 'https://spotify.com/*']}
          ref={webViewRef}
          setSupportMultipleWindows={false}
          sharedCookiesEnabled
          source={{ uri: SPOTIFY_WEB_URL }}
          startInLoadingState
          thirdPartyCookiesEnabled
          testID="spotify-webview"
        />
      </View>

      <View style={styles.controls}>
        <Pressable
          onPress={() => webViewRef.current?.goBack()}
          disabled={!canGoBack}
          style={[styles.control, !canGoBack && styles.disabled]}
          testID="spotify-web-back"
        >
          <Ionicons color={COLORS.WHITE} name="arrow-back" size={20} />
        </Pressable>
        <Pressable
          onPress={() => void requestCommand('play')}
          style={styles.control}
          testID="spotify-web-play-probe"
        >
          <Ionicons color={COLORS.WHITE} name="play" size={20} />
        </Pressable>
        <Pressable
          onPress={() => void requestCommand('pause')}
          style={styles.control}
          testID="spotify-web-pause-probe"
        >
          <Ionicons color={COLORS.WHITE} name="pause" size={20} />
        </Pressable>
        <Pressable
          onPress={() => webViewRef.current?.goForward()}
          disabled={!canGoForward}
          style={[styles.control, !canGoForward && styles.disabled]}
          testID="spotify-web-forward"
        >
          <Ionicons color={COLORS.WHITE} name="arrow-forward" size={20} />
        </Pressable>
      </View>

      <View style={styles.eventPanel} testID="spotify-web-events">
        <Text style={styles.eventTitle}>Événements sans données sensibles</Text>
        {events.slice(0, 4).map((event) => (
          <Text key={event.id} style={styles.eventText}>
            {event.code}
            {event.detail ? ` · ${event.detail}` : ''}
          </Text>
        ))}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  control: {
    alignItems: 'center',
    backgroundColor: COLORS.SECONDARY,
    borderRadius: 18,
    height: 36,
    justifyContent: 'center',
    width: 54,
  },
  controls: {
    flexDirection: 'row',
    gap: 12,
    justifyContent: 'center',
    paddingVertical: 10,
  },
  disabled: { opacity: 0.3 },
  disclaimer: { color: COLORS.GREY, fontSize: 11, marginTop: 4 },
  eventPanel: { backgroundColor: COLORS.NAV, padding: 10 },
  eventText: { color: COLORS.LIGHT_GREY, fontSize: 11, marginTop: 2 },
  eventTitle: { color: COLORS.WHITE, fontSize: 12, fontWeight: '600' },
  experimental: { color: COLORS.TINT, fontSize: 10, fontWeight: '700' },
  header: {
    alignItems: 'center',
    backgroundColor: COLORS.NAV,
    flexDirection: 'row',
    paddingHorizontal: 8,
    paddingTop: 12,
  },
  headerText: { alignItems: 'center', flex: 1 },
  iconButton: {
    alignItems: 'center',
    height: 44,
    justifyContent: 'center',
    width: 44,
  },
  screen: { backgroundColor: COLORS.PRIMARY, flex: 1 },
  statusPanel: { backgroundColor: COLORS.NAV, padding: 10 },
  statusText: { color: COLORS.LIGHT_GREY, fontSize: 12 },
  title: { color: COLORS.WHITE, fontSize: 17, fontWeight: '600' },
  webContainer: { backgroundColor: COLORS.WHITE, flex: 1 },
});
