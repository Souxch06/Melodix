/**
 * Mission v9 — SpotifyWebHostView : la vue hôte de production dit la vérité
 * sur la PERTE DE SOURCE et donne un levier de récupération.
 *
 *  1. Déactivation/démontage de l'hôte → un DERNIER état publié `error`
 *     (« host-unmounted », identité nulle) est poussé sur le bus AVANT la
 *     destruction : le PlayerController ne peut plus rester silencieusement
 *     sur « playing » (§2 — jamais de prétention sans confirmation).
 *  2. Budget de reconnexion épuisé (phase `failed`) ou reconnexion en cours
 *     (`recovering`) → un bouton « Recharger » apparaît dans l'overlay et
 *     appelle `manualReload()` du runtime (nouveau document + nouveau
 *     handshake) : la phase d'échec définitif n'est plus un point mort
 *     (§9 — timeout, backoff, limite de tentatives, échec définitif +
 *     récupération manuelle).
 *
 * Les dépendances @services / WebView / contexte sont mockées (frontières
 * explicites) : on teste le câblage réel de la vue, pas une reproduction.
 */
import * as React from 'react';

import { fireEvent, render } from '@testing-library/react-native';

import * as Services from '@services';

import { SpotifyWebHostView } from '../SpotifyWebHostView';

/** Accès typé aux doubles créés DANS le module factory (auto-contenu). */
const fakes = (
  Services as unknown as {
    __testFakes: {
      publish: jest.Mock;
      register: jest.Mock;
      unregister: jest.Mock;
      manualReload: jest.Mock;
      activation: { active: boolean; blockers: string[] };
      overlayVisible: boolean;
      emitOverlayVisible: (visible: boolean) => void;
      currentSnapshot: Record<string, unknown>;
      emitSnapshot: (s: Record<string, unknown>) => void;
      makeSnapshot: (
        partial?: Record<string, unknown>
      ) => Record<string, unknown>;
    };
  }
).__testFakes;

jest.mock('@services', () => {
  const mockPublish = jest.fn();
  const mockRegister = jest.fn();
  const mockUnregister = jest.fn();
  const mockManualReload = jest.fn();
  const snapshotListeners: ((s: Record<string, unknown>) => void)[] = [];
  const overlayListeners: ((visible: boolean) => void)[] = [];

  const makeSnapshot = (partial: Record<string, unknown> = {}) => ({
    phase: 'ready',
    page: 'open.spotify.com',
    canGoBack: false,
    canGoForward: false,
    rendererAvailable: true,
    bridgeReady: true,
    lossCause: null,
    reconnectAttempt: 0,
    maxReconnectAttempts: 3,
    ...partial,
  });
  const state = {
    activation: { active: true, blockers: [] as string[] },
    overlayVisible: false,
    currentSnapshot: makeSnapshot(),
  };

  class MockSpotifyWebBackend {
    getState = jest.fn(() => ({
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
    }));
    subscribe = jest.fn(() => jest.fn());
    attachRuntime = jest.fn();
    attachBridgeTransport = jest.fn();
    destroy = jest.fn();
  }
  class MockSpotifyWebRuntime {
    manualReload = mockManualReload;
    mount = jest.fn();
    unmount = jest.fn();
    getSnapshot = () => ({ ...state.currentSnapshot });
    subscribe = (listener: (s: Record<string, unknown>) => void) => {
      snapshotListeners.push(listener);
      listener(state.currentSnapshot);
      return () => {
        const i = snapshotListeners.indexOf(listener);
        if (i >= 0) snapshotListeners.splice(i, 1);
      };
    };
    onAppStateChange = jest.fn();
    onRendererGone = jest.fn();
    onNetworkError = jest.fn();
    onHttpError = jest.fn();
    onLoadStart = jest.fn();
    onLoadEnd = jest.fn();
    onNavigationState = jest.fn();
    handleBridgeMessage = jest.fn(() => 'ignored' as const);
  }
  class MockSpotifyWebTrackTransport {
    getStatus = jest.fn(() => 'idle' as const);
    handleBridgeMessage = jest.fn(() => 'ignored' as const);
    destroy = jest.fn();
  }

  return {
    publishSpotifyWebPublishedState: mockPublish,
    registerSpotifyWebPlaybackHost: mockRegister,
    unregisterSpotifyWebPlaybackHost: mockUnregister,
    resolveSpotifyWebPlaybackActivation: () => ({
      active: state.activation.active,
      blockers: state.activation.blockers,
      engines: ['spotify-web'],
    }),
    subscribeSpotifyWebPlaybackActivation: (listener: () => void) => {
      listener();
      return () => {};
    },
    subscribeSpotifyWebHostVisibility: (
      listener: (visible: boolean) => void
    ) => {
      overlayListeners.push(listener);
      listener(state.overlayVisible);
      return () => {
        const i = overlayListeners.indexOf(listener);
        if (i >= 0) overlayListeners.splice(i, 1);
      };
    },
    isAllowedSpotifyWebNavigation: () => true,
    SPOTIFY_WEB_MEDIA_SESSION_PROBE: '',
    SpotifyWebBackend: MockSpotifyWebBackend,
    SpotifyWebRuntime: MockSpotifyWebRuntime,
    SpotifyWebTrackTransport: MockSpotifyWebTrackTransport,
    // Accès tests aux doubles (jamais consommé par la production).
    __testFakes: {
      publish: mockPublish,
      register: mockRegister,
      unregister: mockUnregister,
      manualReload: mockManualReload,
      activation: state.activation,
      overlayVisible: state.overlayVisible,
      emitOverlayVisible: (visible: boolean) => {
        state.overlayVisible = visible;
        overlayListeners.forEach((l) => l(visible));
      },
      currentSnapshot: state.currentSnapshot,
      emitSnapshot: (s: Record<string, unknown>) => {
        state.currentSnapshot = makeSnapshot(s);
        snapshotListeners.forEach((l) => l(state.currentSnapshot));
      },
      makeSnapshot,
    },
  };
});

jest.mock('react-native-webview', () => {
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  const ReactMock = require('react');

  return {
    WebView: ReactMock.forwardRef((_props: unknown, ref: unknown) =>
      ReactMock.createElement('MockWebView', {
        testID: 'mock-webview',
        ref,
      })
    ),
  };
});

let mockPreferencesVisible = true;

jest.mock('@context', () => ({
  usePreferences: () => ({ spotifyWebPlayback: mockPreferencesVisible }),
}));

jest.mock('../../../modules/melodix-media', () => ({
  appendDiagLog: jest.fn(),
}));

/** Texte d'un Text RN dont les children peuvent être un tableau. */
const childrenToText = (children: unknown): string =>
  Array.isArray(children)
    ? children.map((c) => String(c)).join('')
    : String(children);

const FINAL_HOST_LOST_STATE = {
  status: 'error',
  trackId: null,
  title: null,
  artists: [],
  artworkUrl: null,
  durationMillis: 0,
  positionMillis: 0,
  isPlaying: false,
  isLoading: false,
  errorCode: 'host-unmounted',
};

describe('SpotifyWebHostView — v9 : perte de source + récupération manuelle', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    fakes.activation.active = true;
    fakes.activation.blockers = [];
    fakes.currentSnapshot = fakes.makeSnapshot();
    mockPreferencesVisible = true;
  });

  it('démontage de l’hôte → DERNIER état publié « error / host-unmounted » (le moteur ne reste jamais sur « playing »)', () => {
    const { unmount } = render(<SpotifyWebHostView />);
    expect(fakes.register).toHaveBeenCalledTimes(1);

    // L'hôte est détruit (navigation, réglage désactivé, démontage).
    unmount();

    // Le DERNIER état publié est l'erreur honnête de perte de source.
    expect(fakes.publish).toHaveBeenCalledWith(FINAL_HOST_LOST_STATE);
    const lastCall =
      fakes.publish.mock.calls[fakes.publish.mock.calls.length - 1][0];
    expect(lastCall).toEqual(FINAL_HOST_LOST_STATE);
    expect(fakes.unregister).toHaveBeenCalledTimes(1);
  });

  it('réglage « Lecture Spotify Web » désactivé → même dernier état publié, la vue rend null', () => {
    const { rerender, queryByTestId } = render(<SpotifyWebHostView />);
    expect(fakes.register).toHaveBeenCalledTimes(1);
    expect(queryByTestId('spotify-web-host-container')).toBeTruthy();

    // L'utilisateur désactive le réglage : l'effet se nettoie.
    mockPreferencesVisible = false;
    rerender(<SpotifyWebHostView />);

    expect(fakes.publish).toHaveBeenCalledWith(FINAL_HOST_LOST_STATE);
    expect(queryByTestId('spotify-web-host-container')).toBeNull();
  });

  it('phase « failed » (budget de reconnexion épuisé) → bouton « Recharger » visible, et il appelle manualReload()', () => {
    // Après les remounts tentés, la surface est neuve (rendererAvailable
    // true) mais le document n'a toujours pas réussi : phase « failed ».
    fakes.emitSnapshot({
      phase: 'failed',
      bridgeReady: false,
      lossCause: 'renderer_destroyed',
    });
    const { rerender, getByTestId } = render(<SpotifyWebHostView />);
    // L'overlay s'ouvre (moteur/UI le demandent).
    fakes.emitOverlayVisible(true);
    rerender(<SpotifyWebHostView />);

    // Le libellé de pont dit la vérité : échec, rechargement manuel requis.
    const statusText = childrenToText(
      getByTestId('spotify-web-overlay-status').props.children
    );
    expect(statusText).toContain('échec');

    const reload = getByTestId('spotify-web-overlay-reload');
    expect(reload).toBeTruthy();
    fireEvent.press(reload);
    expect(fakes.manualReload).toHaveBeenCalledTimes(1);
  });

  it('phase « recovering » → le bouton de rechargement manuel est aussi proposé (pas de point mort)', () => {
    fakes.emitSnapshot({
      phase: 'recovering',
      reconnectAttempt: 2,
      bridgeReady: false,
    });
    const { rerender, getByTestId } = render(<SpotifyWebHostView />);
    fakes.emitOverlayVisible(true);
    rerender(<SpotifyWebHostView />);

    expect(
      childrenToText(getByTestId('spotify-web-overlay-status').props.children)
    ).toContain('reconnexion 2/3');
    expect(getByTestId('spotify-web-overlay-reload')).toBeTruthy();
  });

  it('phase « ready » → pas de bouton de rechargement (rien à récupérer)', () => {
    fakes.emitSnapshot({ phase: 'ready' });
    const { rerender, queryByTestId } = render(<SpotifyWebHostView />);
    fakes.emitOverlayVisible(true);
    rerender(<SpotifyWebHostView />);

    expect(queryByTestId('spotify-web-overlay-reload')).toBeNull();
  });

  it('hôte inactif (flag local désactivé) → aucun hôte construit, aucune WebView', () => {
    fakes.activation.active = false;
    const { queryByTestId } = render(<SpotifyWebHostView />);

    expect(fakes.register).not.toHaveBeenCalled();
    expect(queryByTestId('spotify-web-host-container')).toBeNull();
    expect(queryByTestId('mock-webview')).toBeNull();
  });
});
