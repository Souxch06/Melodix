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
      trace: jest.Mock;
      activation: { active: boolean; blockers: string[] };
      overlayVisible: boolean;
      emitOverlayVisible: (visible: boolean) => void;
      currentSnapshot: Record<string, unknown>;
      emitSnapshot: (s: Record<string, unknown>) => void;
      makeSnapshot: (
        partial?: Record<string, unknown>
      ) => Record<string, unknown>;
      /**
       * Options passées au constructeur du runtime (capture du dernier
       * hôte construit) : permet d'invoquer le callback `report` réel
       * câblé par la vue (les codes de diagnostic y transitent).
       */
      runtimeOptions: {
        report?: (code: string, detail?: string) => void;
        reloadWebView?: unknown;
      } | null;
      /** Pilote le résultat renvoyé par `handleBridgeMessage` du transport. */
      setBridgeMessageResult: (
        result:
          | 'ignored'
          | 'state-updated'
          | 'capabilities-updated'
          | 'command-acknowledged'
      ) => void;
    };
  }
).__testFakes;

jest.mock('@services', () => {
  const mockPublish = jest.fn();
  const mockRegister = jest.fn();
  const mockUnregister = jest.fn();
  const mockManualReload = jest.fn();
  const mockTrace = jest.fn();
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
    // Capture de l'hôte construit (options runtime + dernier transport).
    runtimeOptions: null as {
      report?: (code: string, detail?: string) => void;
      reloadWebView?: unknown;
    } | null,
    bridgeMessageResult: 'ignored' as
      | 'ignored'
      | 'state-updated'
      | 'capabilities-updated'
      | 'command-acknowledged',
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
    constructor(options: {
      backend?: unknown;
      report?: (code: string, detail?: string) => void;
      reloadWebView?: unknown;
    }) {
      // Capture du callback `report` REAL que la vue câble : le test peut
      // l'invoquer comme le runtime le ferait avec un code de diagnostic.
      state.runtimeOptions = {
        report: options.report,
        reloadWebView: options.reloadWebView,
      };
    }
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
    // Le résultat est pilotable : le test simule quel message la vue a
    // fait ACCEPTER par le transport (état publié vs ignoré).
    handleBridgeMessage = jest.fn(
      (..._args: unknown[]) => state.bridgeMessageResult
    );
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
    spotifyWebTrace: mockTrace,
    // Accès tests aux doubles (jamais consommé par la production).
    __testFakes: {
      publish: mockPublish,
      register: mockRegister,
      unregister: mockUnregister,
      manualReload: mockManualReload,
      trace: mockTrace,
      activation: state.activation,
      // Getter live : pointe sur la capture de l'hôte construit le plus
      // récemment (constructor du double runtime).
      get runtimeOptions() {
        return state.runtimeOptions;
      },
      overlayVisible: state.overlayVisible,
      setBridgeMessageResult: (
        result: (typeof state)['bridgeMessageResult']
      ) => {
        state.bridgeMessageResult = result;
      },
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

  let lastProps: Record<string, unknown> | null = null;

  return {
    WebView: ReactMock.forwardRef(
      (props: Record<string, unknown>, ref: unknown) => {
        // Capture des props câblées par la vue : le test peut invoquer
        // onLoadStart / onMessage / onLoadEnd comme le ferait le native.
        lastProps = props;
        return ReactMock.createElement('MockWebView', {
          testID: 'mock-webview',
          ref,
        });
      }
    ),
    __getLastWebViewProps: () => lastProps,
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

/**
 * V17 — BREADCRUMBS logcat de la chaîne (tag [MelodixSpotifyWeb]).
 *
 * Objectif (gap §13) : la smoke CI sur émulateur (APK release, sans run-as)
 * ne peut lire que le logcat. Ces lignes DOIVENT couvrir le montage de
 * l'HÔTE DE PRODUCTION, le résultat du handshake du runtime et le premier
 * état accepté du bridge — et JAMAIS inventer un `playing`. La vue ne
 * fait que MIRMIRER : un code de diagnostic du runtime (enum contrôlée),
 * un breadcrumb de cycle de vie, ou le premier état publié ACCEPTÉ par
 * le transport (une ligne par document).
 */
describe('SpotifyWebHostView — V17 : traces logcat [MelodixSpotifyWeb]', () => {
  /** Props WebView câblées par la vue (sous-ensemble utile au test). */
  type WebViewHandlers = {
    onMessage: (event: { nativeEvent: { data: string } }) => void;
    onLoadStart: () => void;
    onLoadEnd: () => void;
  };
  const webViewProps = (): WebViewHandlers | null =>
    (
      jest.requireMock('react-native-webview') as {
        __getLastWebViewProps: () => Record<string, unknown> | null;
      }
    ).__getLastWebViewProps() as WebViewHandlers | null;

  const traceCalls = (): string[] =>
    fakes.trace.mock.calls.map((c) => String(c[0]));

  beforeEach(() => {
    jest.clearAllMocks();
    fakes.activation.active = true;
    fakes.activation.blockers = [];
    fakes.currentSnapshot = fakes.makeSnapshot();
    mockPreferencesVisible = true;
  });

  it('montage de l’hôte → « host-mounted » ; démontage → « host-unmounted » (le cycle de vie est observable en CI)', () => {
    const { unmount } = render(<SpotifyWebHostView />);
    expect(traceCalls()).toEqual(['host-mounted']);

    unmount();
    expect(traceCalls()).toEqual(['host-mounted', 'host-unmounted']);
  });

  it('hôte inactif → AUCUNE trace (pas d’hôte, pas de fausse vie)', () => {
    fakes.activation.active = false;
    render(<SpotifyWebHostView />);
    expect(fakes.trace).not.toHaveBeenCalled();
  });

  it('chaque code de diagnostic du runtime est MIRROIR dans le logcat (handshake, reload, erreurs…)', () => {
    render(<SpotifyWebHostView />);

    // Le callback `report` réel, câblé par la vue, est invoqué comme le
    // runtime le ferait : codes de l'enum contrôlée, jamais de contenu.
    expect(fakes.runtimeOptions).not.toBeNull();
    fakes.runtimeOptions?.report?.('webview_loading');
    fakes.runtimeOptions?.report?.('webview_loaded', '123ms');
    fakes.runtimeOptions?.report?.('bridge_ready');
    fakes.runtimeOptions?.report?.('network_error');

    expect(traceCalls()).toEqual([
      'host-mounted',
      'webview_loading',
      'webview_loaded',
      'bridge_ready',
      'network_error',
    ]);
    // Le detail (jamais sensible ici) n'est PAS relayé par la vue.
    expect(fakes.trace).not.toHaveBeenCalledWith('webview_loaded', '123ms');
  });

  it('premier état publié ACCEPTÉ par le transport → « bridge-state » (une ligne par document)', () => {
    render(<SpotifyWebHostView />);
    const props = webViewProps();
    expect(props).not.toBeNull();

    // Message d'état ACCEPTÉ par le transport (result « state-updated »).
    fakes.setBridgeMessageResult('state-updated');
    props!.onMessage({ nativeEvent: { data: '{"status":"state"}' } });
    expect(traceCalls()).toContain('bridge-state');

    // Deuxième état accepté du MÊME document : pas de seconde ligne.
    props!.onMessage({ nativeEvent: { data: '{"status":"state"}' } });
    expect(traceCalls().filter((t) => t === 'bridge-state')).toHaveLength(1);

    // Nouveau document (onLoadStart) : la preuve se re-ouvre.
    props!.onLoadStart();
    props!.onMessage({ nativeEvent: { data: '{"status":"state"}' } });
    expect(traceCalls().filter((t) => t === 'bridge-state')).toHaveLength(2);
  });

  it('message IGNORÉ par le transport → pas de « bridge-state » (jamais de preuve inventée)', () => {
    render(<SpotifyWebHostView />);
    const props = webViewProps();
    expect(props).not.toBeNull();

    // Le transport renvoie « ignored » : rien n'a été accepté.
    fakes.setBridgeMessageResult('ignored');
    props!.onMessage({ nativeEvent: { data: '{"status":"state"}' } });
    expect(traceCalls().filter((t) => t === 'bridge-state')).toHaveLength(0);
  });
});
