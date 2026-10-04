import { SpotifyWebBackend } from '../SpotifyWebBackend';
import {
  classifySpotifyWebUrl,
  DEFAULT_SPOTIFY_WEB_AUTO_RECONNECT_BASE_DELAY_MS,
  DEFAULT_SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS,
  diagnosticPageLabel,
  isAllowedSpotifyWebNavigation,
  SpotifyWebRuntime,
  type SpotifyWebRuntimeOptions,
} from '../spotifyWebRuntime';

const READY_MESSAGE = '{"version":1,"type":"ready"}';
const PLAYING_MESSAGE = JSON.stringify({
  version: 1,
  type: 'state',
  payload: { status: 'playing', title: 'Track' },
});

type ScheduledTask = { id: number; delayMs: number; callback: () => void };

/** Deterministic timer source: nothing fires unless a test says so. */
class ManualScheduler {
  private tasks: ScheduledTask[] = [];
  private nextId = 0;

  readonly set = (callback: () => void, delayMs: number): number => {
    const id = ++this.nextId;
    this.tasks.push({ id, delayMs, callback });
    return id;
  };

  readonly clear = (handle: unknown): void => {
    this.tasks = this.tasks.filter((task) => task.id !== handle);
  };

  get pendingDelays(): number[] {
    return this.tasks.map((task) => task.delayMs);
  }

  /** Executes the oldest scheduled callback, exactly once. */
  readonly fireNext = (): void => {
    const task = this.tasks.shift();
    if (!task) throw new Error('aucun timer programmé');
    task.callback();
  };
}

const createHarness = (overrides: Partial<SpotifyWebRuntimeOptions> = {}) => {
  const backend = new SpotifyWebBackend();
  const scheduler = new ManualScheduler();
  const reports: { code: string; detail?: string }[] = [];
  const reconnects: string[] = [];
  const runtime = new SpotifyWebRuntime({
    backend,
    scheduler: { set: scheduler.set, clear: scheduler.clear },
    report: (code, detail) => reports.push({ code, detail }),
    reloadWebView: (scope) => reconnects.push(scope),
    ...overrides,
  });
  const reportCodes = () => reports.map((report) => report.code);
  /** Simulates a full document load: onLoadStart then onLoadEnd. */
  const loadDocument = () => {
    runtime.onLoadStart();
    runtime.onLoadEnd();
  };
  return {
    backend,
    loadDocument,
    reconnects,
    reportCodes,
    reports,
    runtime,
    scheduler,
  };
};

describe('SpotifyWebRuntime WebView lifecycle', () => {
  it('mount ouvre une session loading et unmount neutralise les timers', () => {
    const { backend, runtime, scheduler } = createHarness();
    expect(runtime.getSnapshot().phase).toBe('idle');

    const statuses: string[] = [];
    const unsubscribe = backend.subscribe((state) =>
      statuses.push(state.status)
    );
    runtime.mount();
    // Double mount: idempotent, une seule session d'ouverture.
    runtime.mount();
    expect(statuses).toEqual(['idle', 'loading']);
    expect(backend.getState().status).toBe('loading');
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'loading',
      bridgeReady: false,
      lossCause: null,
    });

    runtime.onLoadEnd();
    expect(scheduler.pendingDelays).toEqual([
      DEFAULT_SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS,
    ]);

    runtime.unmount();
    expect(scheduler.pendingDelays).toEqual([]);
    expect(runtime.getSnapshot().phase).toBe('idle');

    // Les événements tardifs d'un owner démonté ne relancent rien.
    runtime.onLoadEnd();
    runtime.onNetworkError();
    runtime.onLoadStart();
    expect(scheduler.pendingDelays).toEqual([]);
    expect(backend.getState().errorCode).toBeNull();
    // Le renderer détruit reste visible même hors montage (vérité UI).
    runtime.onRendererGone();
    expect(runtime.getSnapshot().rendererAvailable).toBe(false);
    expect(backend.getState().status).toBe('loading');
    unsubscribe();
  });

  it('loading → ready : le handshake dans les délais annule la deadline', () => {
    const { backend, loadDocument, reportCodes, runtime, scheduler } =
      createHarness();
    runtime.mount();
    loadDocument();
    expect(runtime.getSnapshot().phase).toBe('awaiting-bridge');
    expect(reportCodes()).toEqual(['webview_loading', 'webview_loaded']);

    expect(runtime.handleBridgeMessage(READY_MESSAGE)).toBe('ready');
    expect(scheduler.pendingDelays).toEqual([]);
    expect(backend.isBridgeReady()).toBe(true);
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'ready',
      bridgeReady: true,
    });
    expect(reportCodes()).toContain('bridge_ready');

    // Un onLoadEnd de sous-frame ne doit jamais réarmer une deadline.
    runtime.onLoadEnd();
    expect(scheduler.pendingDelays).toEqual([]);

    expect(runtime.handleBridgeMessage(PLAYING_MESSAGE)).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'playing',
      title: 'Track',
    });
  });

  it('ready sans deadline : une navigation annule le timer armé et repart en loading', () => {
    const { backend, loadDocument, runtime, scheduler } = createHarness();
    runtime.mount();
    loadDocument();
    // Navigation pendant l'attente : l'ancien document ne peut plus marquer
    // le nouveau en timeout.
    runtime.onLoadStart();
    expect(scheduler.pendingDelays).toEqual([]);
    expect(runtime.getSnapshot().phase).toBe('loading');
    expect(backend.getState().status).toBe('loading');
    expect(backend.isBridgeReady()).toBe(false);

    // La deadline n'est réarmée que par le chargement courant, et un état
    // reste refusé tant que le nouveau document n'a pas fait le handshake.
    runtime.onLoadEnd();
    expect(scheduler.pendingDelays).toEqual([
      DEFAULT_SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS,
    ]);
    expect(
      runtime.handleBridgeMessage(
        '{"version":1,"type":"state","payload":{"status":"playing"}}'
      )
    ).toBe('rejected');
  });

  it('ready trop tardif : la deadline classe bridge_timeout puis planifie la reconnexion', () => {
    const { backend, loadDocument, reports, runtime, scheduler } =
      createHarness();
    runtime.mount();
    loadDocument();

    scheduler.fireNext();
    expect(backend.getState()).toMatchObject({
      status: 'error',
      errorCode: 'bridge_timeout',
    });
    expect(backend.isBridgeReady()).toBe(false);
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'recovering',
      bridgeReady: false,
      lossCause: 'bridge_timeout',
      reconnectAttempt: 1,
    });
    expect(reports.map((report) => report.code)).toEqual([
      'webview_loading',
      'webview_loaded',
      'bridge_timeout',
      'webview_reconnecting',
    ]);
    expect(reports[3].detail).toBe('tentative 1/3');
    expect(scheduler.pendingDelays).toEqual([
      DEFAULT_SPOTIFY_WEB_AUTO_RECONNECT_BASE_DELAY_MS,
    ]);
  });

  it('reconnexion : le reload planifié est supersédé par un ready tardif', () => {
    const { loadDocument, reconnects, runtime, scheduler } = createHarness();
    runtime.mount();
    loadDocument();
    scheduler.fireNext(); // bridge_timeout → reconnect planifiée

    expect(runtime.handleBridgeMessage(READY_MESSAGE)).toBe('ready');
    expect(scheduler.pendingDelays).toEqual([]);
    expect(reconnects).toEqual([]);
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'ready',
      reconnectAttempt: 0,
      lossCause: null,
    });
  });

  it('reconnexion : le cycle perdu → reload → nouveau document prêt rétablit le bridge', () => {
    const { backend, loadDocument, reconnects, runtime, scheduler } =
      createHarness();
    runtime.mount();
    loadDocument();
    scheduler.fireNext(); // bridge_timeout, tentative 1/3 planifiée
    scheduler.fireNext(); // la reconnexion s'exécute
    expect(reconnects).toEqual(['reload']);

    loadDocument();
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'awaiting-bridge',
      lossCause: null,
      reconnectAttempt: 1,
    });
    expect(runtime.handleBridgeMessage(READY_MESSAGE)).toBe('ready');
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'ready',
      reconnectAttempt: 0,
    });
    expect(backend.isBridgeReady()).toBe(true);
  });

  it('renderer détruit : perte marquée, reconnexion en remount, surface neuve', () => {
    const {
      backend,
      loadDocument,
      reconnects,
      reportCodes,
      runtime,
      scheduler,
    } = createHarness();
    runtime.mount();
    loadDocument();

    runtime.onRendererGone();
    expect(backend.getState()).toMatchObject({
      status: 'error',
      errorCode: 'renderer_destroyed',
    });
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'recovering',
      rendererAvailable: false,
      lossCause: 'renderer_destroyed',
      reconnectAttempt: 1,
    });
    expect(reportCodes()).toContain('renderer_destroyed');

    // Une seconde perte du même document ne planifie qu'une reconnexion.
    runtime.onRendererGone();
    expect(scheduler.pendingDelays).toEqual([1500]);

    scheduler.fireNext();
    expect(reconnects).toEqual(['remount']);
    expect(runtime.getSnapshot().rendererAvailable).toBe(true);

    loadDocument();
    expect(runtime.handleBridgeMessage(READY_MESSAGE)).toBe('ready');
    expect(runtime.getSnapshot().phase).toBe('ready');
  });

  it('network error : état error, reconnexion en reload, pont fermé au document suivant', () => {
    const {
      backend,
      loadDocument,
      reportCodes,
      reconnects,
      runtime,
      scheduler,
    } = createHarness();
    runtime.mount();
    loadDocument();
    runtime.handleBridgeMessage(READY_MESSAGE);

    runtime.onNetworkError();
    expect(backend.getState()).toMatchObject({
      status: 'error',
      errorCode: 'network_error',
    });
    expect(reportCodes()).toContain('network_error');
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'recovering',
      lossCause: 'network_error',
    });

    scheduler.fireNext();
    expect(reconnects).toEqual(['reload']);

    // Le nouveau document doit rejouer le handshake complet.
    loadDocument();
    expect(backend.isBridgeReady()).toBe(false);
    expect(runtime.handleBridgeMessage(PLAYING_MESSAGE)).toBe('rejected');
  });

  it('budget de reconnexion : backoff borné, échec puis manualReload qui repart', () => {
    const { loadDocument, reconnects, reportCodes, runtime, scheduler } =
      createHarness({
        bridgeReadyTimeoutMs: 50,
        autoReconnectBaseDelayMs: 100,
        autoReconnectMaxDelayMs: 250,
      });
    runtime.mount();

    const failOneDocument = () => {
      loadDocument();
      expect(scheduler.pendingDelays).toEqual([50]);
      scheduler.fireNext(); // perte (bridge_timeout)
    };

    failOneDocument();
    expect(scheduler.pendingDelays).toEqual([100]);
    scheduler.fireNext();
    failOneDocument();
    expect(scheduler.pendingDelays).toEqual([200]);
    scheduler.fireNext();
    failOneDocument();
    expect(scheduler.pendingDelays).toEqual([250]); // 400 borné au plafond
    scheduler.fireNext();

    // Quatrième échec : plus aucun rechargement automatique.
    failOneDocument();
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'failed',
      reconnectAttempt: 3,
    });
    expect(reportCodes()).toContain('webview_reconnect_exhausted');
    expect(scheduler.pendingDelays).toEqual([]);
    expect(reconnects).toEqual(['reload', 'reload', 'reload']);

    // Le geste utilisateur réarme un budget complet.
    runtime.manualReload();
    expect(reconnects).toHaveLength(4);
    expect(runtime.getSnapshot()).toMatchObject({
      phase: 'loading',
      reconnectAttempt: 0,
    });
    failOneDocument();
    expect(scheduler.pendingDelays).toEqual([100]);
  });

  it('arrière-plan diffère la reconnexion jusqu’au retour au premier plan', () => {
    const { loadDocument, reconnects, reportCodes, runtime, scheduler } =
      createHarness();
    runtime.mount();
    loadDocument();

    runtime.onAppStateChange('background');
    scheduler.fireNext(); // la deadline expire en arrière-plan
    expect(reportCodes()).toContain('background');
    scheduler.fireNext(); // timer de reconnexion : différé, pas de reload
    expect(reconnects).toEqual([]);
    expect(runtime.getSnapshot().phase).toBe('recovering');

    runtime.onAppStateChange('active');
    expect(reconnects).toEqual(['reload']);
    expect(reportCodes()).toContain('foreground');
  });

  it('navigation : labels sûrs, aller-retour login et drapeaux history', () => {
    const { reportCodes, reports, runtime } = createHarness();
    runtime.mount();

    runtime.onNavigationState({
      url: 'https://accounts.spotify.com/authorize?code=token-secret',
      canGoBack: true,
      canGoForward: false,
    });
    expect(runtime.getSnapshot()).toMatchObject({
      page: 'accounts.spotify.com',
      canGoBack: true,
      canGoForward: false,
    });
    expect(reports[reports.length - 1]).toEqual({
      code: 'login_page',
      detail: 'accounts.spotify.com',
    });

    runtime.onNavigationState({
      url: 'https://open.spotify.com/collection/trash?q=token-secret',
      canGoBack: true,
      canGoForward: true,
    });
    expect(runtime.getSnapshot()).toMatchObject({
      page: 'open.spotify.com',
      canGoForward: true,
    });
    expect(reportCodes()).toContain('returned_from_login');
    // Aucune donnée sensible : ni query, ni fragment, ni jeton.
    expect(JSON.stringify(reports)).not.toContain('token-secret');
  });

  it('httpError : le diagnostic sépare le lecteur inaccessible et ne journalise pas l’URL', () => {
    const { reports, runtime } = createHarness();
    runtime.mount();

    runtime.onHttpError('https://open.spotify.com/x?token=secret', 404);
    runtime.onHttpError('https://example.com/blocked?token=secret', 500);
    expect(reports).toEqual([
      { code: 'web_player_inaccessible', detail: 'HTTP 404' },
      { code: 'http_error', detail: 'HTTP 500' },
    ]);
    expect(JSON.stringify(reports)).not.toContain('token=secret');
  });

  it('messages du bridge : la porte du backend reste l’autorité unique', () => {
    const { backend, loadDocument, reports, runtime, scheduler } =
      createHarness();
    runtime.mount();
    loadDocument();

    // Type futur : ignoré sans log, la deadline attendue reste armée.
    expect(
      runtime.handleBridgeMessage(
        '{"version":1,"type":"future-capability","payload":{}}'
      )
    ).toBe('ignored');
    expect(reports.map((report) => report.code)).not.toContain(
      'bridge_message_rejected'
    );

    // État pré-handshake et enveloppe malformée : rejetés puis rapportés.
    expect(runtime.handleBridgeMessage(PLAYING_MESSAGE)).toBe('rejected');
    expect(
      runtime.handleBridgeMessage('{"version":1,"type":"ready","x":1}')
    ).toBe('rejected');
    expect(
      reports.filter((report) => report.code === 'bridge_message_rejected')
    ).toHaveLength(2);
    expect(JSON.stringify(reports)).not.toContain('"x":1');
    expect(scheduler.pendingDelays).toEqual([
      DEFAULT_SPOTIFY_WEB_BRIDGE_READY_TIMEOUT_MS,
    ]);

    // Après timeout, les messages tardifs d’un document mort restent bloqués.
    scheduler.fireNext();
    expect(runtime.handleBridgeMessage(READY_MESSAGE)).toBe('ready');
    expect(backend.isBridgeReady()).toBe(true);
    expect(
      runtime.handleBridgeMessage(
        '{"version":1,"type":"state","payload":{"cookie":"secret"}}'
      )
    ).toBe('rejected');
    expect(JSON.stringify(backend.getState())).not.toContain('secret');
  });

  it('snapshot observable : subscribe diffuse à chaque transition, puis se désabonne', () => {
    const { loadDocument, runtime } = createHarness();
    const phases: string[] = [];
    const unsubscribe = runtime.subscribe((snapshot) =>
      phases.push(snapshot.phase)
    );
    expect(phases).toEqual(['idle']);
    runtime.mount();
    loadDocument();
    expect(phases).toEqual(['idle', 'loading', 'awaiting-bridge']);
    unsubscribe();
    runtime.handleBridgeMessage(READY_MESSAGE);
    expect(phases).toEqual(['idle', 'loading', 'awaiting-bridge']);
  });

  it('les utilitaires de sécurité de la WebView gardent leur contrat', () => {
    expect(classifySpotifyWebUrl('https://open.spotify.com/')).toBe(
      'spotify-player'
    );
    expect(classifySpotifyWebUrl('https://notspotify.example/')).toBe(
      'blocked'
    );
    expect(isAllowedSpotifyWebNavigation('http://open.spotify.com/')).toBe(
      false
    );
    expect(diagnosticPageLabel('https://evil.example/#token=secret')).toBe(
      'navigation bloquée'
    );
  });
});
