import * as React from 'react';
import { act, fireEvent, render, waitFor } from '@testing-library/react-native';

import { SpotifyWebPrototypeScreen } from '../SpotifyWebPrototypeScreen';

const mockBack = jest.fn();

jest.mock('expo-router', () => ({
  useRouter: () => ({ back: mockBack }),
}));

jest.mock('react-native-webview', () => {
  const ReactModule = jest.requireActual('react');
  const { View: NativeView } = jest.requireActual('react-native');
  return {
    WebView: ReactModule.forwardRef(
      (props: Record<string, unknown>, _ref: unknown) => (
        <NativeView {...props} />
      )
    ),
  };
});

describe('SpotifyWebPrototypeScreen', () => {
  beforeEach(() => jest.clearAllMocks());

  it('reste isolé, diagnostique login/retour et renderer détruit', async () => {
    const { getByTestId, getByText } = render(<SpotifyWebPrototypeScreen />);
    const webView = getByTestId('spotify-webview');

    expect(webView.props.source).toEqual({ uri: 'https://open.spotify.com' });
    expect(webView.props.sharedCookiesEnabled).toBe(true);
    expect(webView.props.thirdPartyCookiesEnabled).toBe(true);
    expect(webView.props.injectedJavaScript).toBeUndefined();

    fireEvent(webView, 'navigationStateChange', {
      url: 'https://accounts.spotify.com/login',
      canGoBack: true,
      canGoForward: false,
    });
    expect(getByText(/login_page/)).toBeTruthy();

    fireEvent(webView, 'navigationStateChange', {
      url: 'https://open.spotify.com/',
      canGoBack: true,
      canGoForward: false,
    });
    expect(getByText(/returned_from_login/)).toBeTruthy();

    fireEvent(webView, 'renderProcessGone', {
      nativeEvent: { didCrash: true },
    });
    await waitFor(() => expect(getByText(/renderer détruit/)).toBeTruthy());
    expect(getByText(/renderer_destroyed/)).toBeTruthy();
  });

  it('branche réellement onMessage avec handshake obligatoire et état validé', () => {
    const { getByTestId, getByText } = render(<SpotifyWebPrototypeScreen />);
    const webView = getByTestId('spotify-webview');
    const stateMessage = JSON.stringify({
      version: 1,
      type: 'state',
      payload: {
        status: 'playing',
        trackId: 'spotify:test',
        title: 'Track',
        artists: ['Artist'],
        isPlaying: true,
      },
    });

    fireEvent(webView, 'message', { nativeEvent: { data: stateMessage } });
    expect(getByText(/bridge_message_rejected/)).toBeTruthy();

    fireEvent(webView, 'message', {
      nativeEvent: { data: '{"version":1,"type":"ready"}' },
    });
    expect(getByText(/bridge_ready/)).toBeTruthy();
    fireEvent(webView, 'message', { nativeEvent: { data: stateMessage } });
    expect(getByText(/Lecture: playing/)).toBeTruthy();
  });

  it('bloque les navigations externes et garde play/pause non branchés', async () => {
    const { getByTestId, getByText } = render(<SpotifyWebPrototypeScreen />);
    const webView = getByTestId('spotify-webview');

    let allowed = true;
    act(() => {
      allowed = webView.props.onShouldStartLoadWithRequest({
        url: 'https://malicious.example/collect',
      });
    });
    expect(allowed).toBe(false);
    expect(getByText(/navigation_blocked/)).toBeTruthy();

    fireEvent.press(getByTestId('spotify-web-play-probe'));
    await waitFor(() =>
      expect(getByText(/command_unavailable · play/)).toBeTruthy()
    );
  });
});
