import * as React from 'react';
import { AppState } from 'react-native';
import { act, fireEvent, render } from '@testing-library/react-native';

import {
  SpotifyWebPrototypeScreen,
  SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS,
} from '../SpotifyWebPrototypeScreen';

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

const textOf = (element: { props: { children: unknown } }): string =>
  [element.props.children]
    .flat(Infinity)
    .filter((child) => typeof child !== 'object')
    .join('');

describe('SpotifyWebPrototypeScreen WebView lifecycle recovery', () => {
  beforeEach(() => {
    jest.useFakeTimers();
  });

  afterEach(() => {
    jest.clearAllTimers();
    jest.useRealTimers();
  });

  it('timeout de handshake : Bridge: timeout, reconnexion planifiée puis prête au nouveau document', () => {
    const { getByTestId } = render(<SpotifyWebPrototypeScreen />);
    const webView = getByTestId('spotify-webview');

    // La page est chargée, le bridge ne répond jamais.
    fireEvent(webView, 'loadEnd');
    act(() => {
      jest.advanceTimersByTime(SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS);
    });

    expect(textOf(getByTestId('spotify-web-bridge-status'))).toContain(
      'timeout'
    );
    expect(textOf(getByTestId('spotify-web-runtime-status'))).toContain(
      'recovering · reconnexion 1/3'
    );

    // Le backoff automatique déclenche un rechargement ; le nouveau document
    // rejoue un cycle complet et le bridge devient prêt.
    fireEvent(getByTestId('spotify-webview'), 'loadStart');
    fireEvent(getByTestId('spotify-webview'), 'loadEnd');
    expect(textOf(getByTestId('spotify-web-bridge-status'))).toContain(
      'attente'
    );
    fireEvent(getByTestId('spotify-webview'), 'message', {
      nativeEvent: { data: '{"version":1,"type":"ready"}' },
    });
    expect(textOf(getByTestId('spotify-web-bridge-status'))).toContain('prêt');
    expect(textOf(getByTestId('spotify-web-runtime-status'))).toContain(
      'ready · reconnexion 0/3'
    );
  });

  it('renderer détruit : la reconnexion recrée la surface WebView et le rechargement manuel repart', () => {
    const { getByTestId, getByText } = render(<SpotifyWebPrototypeScreen />);
    fireEvent(getByTestId('spotify-webview'), 'loadStart');
    fireEvent(getByTestId('spotify-webview'), 'renderProcessGone', {
      nativeEvent: { didCrash: true },
    });
    expect(textOf(getByTestId('spotify-web-bridge-status'))).toContain(
      'renderer détruit'
    );
    expect(textOf(getByTestId('spotify-web-status'))).toContain(
      'WebView: renderer détruit'
    );

    // Tentative automatique : surface recréée (remount), l'UI redevient saine.
    act(() => {
      jest.advanceTimersByTime(1_500);
    });
    expect(textOf(getByTestId('spotify-web-status'))).toContain(
      'WebView: active'
    );

    // Épuisement du budget après trois nouveaux documents sans bridge :
    // plus aucun timer actif, seule la main de l'utilisateur reprend la main.
    for (let cycle = 0; cycle < 3; cycle += 1) {
      const webView = getByTestId('spotify-webview');
      fireEvent(webView, 'loadStart');
      fireEvent(webView, 'loadEnd');
      act(() => {
        jest.advanceTimersByTime(SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS + 1_500);
      });
    }
    expect(getByText(/webview_reconnect_exhausted/)).toBeTruthy();
    expect(textOf(getByTestId('spotify-web-runtime-status'))).toContain(
      'failed · reconnexion 3/3'
    );

    // Rechargement manuel : budget et deadline entièrement réarmés.
    fireEvent.press(getByTestId('spotify-web-reload'));
    expect(textOf(getByTestId('spotify-web-runtime-status'))).toContain(
      'loading · reconnexion 0/3'
    );
    fireEvent(getByTestId('spotify-webview'), 'loadEnd');
    act(() => {
      jest.advanceTimersByTime(1);
    });
    // Un timer de handshake est bien réarmé : rien n'a expiré après 1 ms.
    expect(textOf(getByTestId('spotify-web-bridge-status'))).toContain(
      'attente'
    );
    act(() => {
      jest.advanceTimersByTime(SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS);
    });
    expect(textOf(getByTestId('spotify-web-runtime-status'))).toContain(
      'recovering · reconnexion 1/3'
    );
  });

  it(' AppState : le runtime rapporte et diffère puis reprend la reconnexion', () => {
    const handlers: ((state: string) => void)[] = [];
    const spy = jest
      .spyOn(AppState, 'addEventListener')
      .mockImplementation((_type, handler) => {
        handlers.push(handler as (state: string) => void);
        return { remove: jest.fn() };
      });
    try {
      const { getByTestId, getByText } = render(<SpotifyWebPrototypeScreen />);
      fireEvent(getByTestId('spotify-webview'), 'loadEnd');

      act(() => {
        handlers.forEach((handler) => handler('background'));
      });
      expect(getByText(/background/)).toBeTruthy();

      // La deadline expire en arrière-plan : le rechargement est différé.
      act(() => {
        jest.advanceTimersByTime(SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS);
      });
      expect(textOf(getByTestId('spotify-web-runtime-status'))).toContain(
        'recovering'
      );

      act(() => {
        handlers.forEach((handler) => handler('active'));
      });
      expect(getByText(/foreground/)).toBeTruthy();
      // Le runtime reste cohérent au retour : un nouveau document complet
      // repart en attente de handshake (déjà vérifié hors écran, le rechargement
      // lui-même est un effet du runtime testé unitairement).
      fireEvent(getByTestId('spotify-webview'), 'loadStart');
      fireEvent(getByTestId('spotify-webview'), 'loadEnd');
      expect(textOf(getByTestId('spotify-web-bridge-status'))).toContain(
        'attente'
      );
    } finally {
      spy.mockRestore();
    }
  });
});
