import {
  DEFAULT_SPOTIFY_WEB_COMMAND_TIMEOUT_MS,
  SpotifyWebBackend,
} from '../SpotifyWebBackend';
import { SPOTIFY_WEB_MEDIA_SESSION_PROBE } from '../spotifyWebMediaSessionProbe';
import {
  buildSpotifyWebBridgeCommandMessage,
  classifySpotifyWebBridgeMessage,
  parseSpotifyWebBridgeMessage,
  parseSpotifyWebCommand,
  SPOTIFY_WEB_BRIDGE_VERSION,
} from '../spotifyWebBridge';
import {
  INITIAL_SPOTIFY_WEB_STATE,
  normalizeSpotifyWebState,
} from '../spotifyWebState';

type ScheduledTask = { id: number; delayMs: number; callback: () => void };

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

  readonly fireNext = (): void => {
    const task = this.tasks.shift();
    if (!task) throw new Error('aucun timer programmé');
    task.callback();
  };
}

const v2 = (envelope: Record<string, unknown>) =>
  JSON.stringify({ version: 2, ...envelope });

const createHarness = (
  options: {
    commandTimeoutMillis?: number;
    send?: (raw: string) => boolean;
  } = {}
) => {
  const scheduler = new ManualScheduler();
  const sent: string[] = [];
  const backend = new SpotifyWebBackend({
    scheduler,
    commandTimeoutMillis:
      options.commandTimeoutMillis ?? DEFAULT_SPOTIFY_WEB_COMMAND_TIMEOUT_MS,
  });
  backend.attachBridgeTransport({
    send:
      options.send ??
      ((raw) => {
        sent.push(raw);
        return true;
      }),
  });
  const requestIdOf = (raw: string): string =>
    (JSON.parse(raw) as { requestId: string }).requestId;
  /** Simulates the page answering through the same validated receive path. */
  const pageRespond = (rawCommand: string, accepted: boolean, code?: string) =>
    backend.receiveBridgeMessage(
      v2({
        type: 'command-response',
        requestId: requestIdOf(rawCommand),
        accepted,
        ...(code ? { code } : {}),
      })
    );
  const handshake = () => backend.receiveBridgeMessage(v2({ type: 'ready' }));
  return { backend, handshake, pageRespond, scheduler, sent };
};

describe('Spotify Web bridge v2 : handshake et versionnement', () => {
  it('accepte le handshake v2 et n’en déduit jamais un état de lecture', () => {
    const { backend, handshake } = createHarness();
    expect(handshake()).toBe('ready');
    expect(backend.isBridgeReady()).toBe(true);
    // Garantie clé du commit player : un handshake (ou future commande) ne
    // publie jamais "playing". Ici, rien ne change l'état.
    expect(backend.getState()).toEqual(INITIAL_SPOTIFY_WEB_STATE);
    expect(backend.getState().status).toBe('idle');
  });

  it('refuse un handshake malformé et un état publié avant handshake', () => {
    const backend = new SpotifyWebBackend();
    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'ready', payload: { anything: true } })
      )
    ).toBe('rejected');
    expect(backend.isBridgeReady()).toBe(false);
    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'state', payload: { status: 'playing' } })
      )
    ).toBe('rejected');
    expect(backend.getState().status).toBe('idle');
  });

  it('conserve le contrat v1 verbatim et rejette toute autre version', () => {
    expect(
      parseSpotifyWebBridgeMessage('{"version":1,"type":"ready"}')
    ).toEqual({ version: 1, type: 'ready' });
    expect(
      parseSpotifyWebBridgeMessage(
        '{"version":1,"type":"state","payload":{"status":"playing"}}'
      )
    ).not.toBeNull();
    // v1 gèle ses statuts : buffering/ended ne sont pas des enveloppes v1.
    expect(
      parseSpotifyWebBridgeMessage(
        '{"version":1,"type":"state","payload":{"status":"buffering"}}'
      )
    ).toBeNull();
    expect(
      parseSpotifyWebBridgeMessage(
        '{"version":1,"type":"state","payload":{"status":"ended"}}'
      )
    ).toBeNull();
    expect(
      parseSpotifyWebBridgeMessage('{"version":3,"type":"ready"}')
    ).toBeNull();
    expect(
      parseSpotifyWebBridgeMessage('{"version":"2","type":"ready"}')
    ).toBeNull();
    expect(parseSpotifyWebBridgeMessage('{"type":"ready"}')).toBeNull();
    expect(SPOTIFY_WEB_BRIDGE_VERSION).toBe(2);
  });

  it('ignore un type v2 futur mais rejette un type connu malformé', () => {
    expect(
      classifySpotifyWebBridgeMessage(
        v2({ type: 'future-capability', payload: { anything: true } })
      )
    ).toEqual({ kind: 'ignored' });
    expect(
      classifySpotifyWebBridgeMessage(
        v2({ type: 'state', payload: { status: 'playing', secret: 1 } })
      )
    ).toEqual({ kind: 'rejected' });
    expect(classifySpotifyWebBridgeMessage('no-json')).toEqual({
      kind: 'rejected',
    });
  });
});

describe('Spotify Web bridge v2 : états réels du Web Player', () => {
  it('publie loading, playing et paused exactement comme la page les déclare', () => {
    const { backend, handshake } = createHarness();
    handshake();

    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'state',
          payload: { status: 'loading', source: 'media-session' },
        })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'loading',
      isLoading: true,
      isPlaying: false,
    });

    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'state',
          payload: {
            status: 'playing',
            title: 'Real Track',
            artists: ['Real Artist'],
            artworkUrl: 'https://i.scdn.co/image/x',
            durationMillis: 200_000,
            positionMillis: 10_000,
            source: 'media-session',
          },
        })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'playing',
      isPlaying: true,
      title: 'Real Track',
      artists: ['Real Artist'],
      durationMillis: 200_000,
      positionMillis: 10_000,
    });

    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'state', payload: { status: 'paused' } })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'paused',
      isPlaying: false,
    });
  });

  it('projette buffering en chargement et ended en idle sans inventer de lecture', () => {
    const { backend, handshake } = createHarness();
    handshake();
    backend.receiveBridgeMessage(
      v2({
        type: 'state',
        payload: { status: 'playing', title: 'Track', artists: ['A'] },
      })
    );

    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'state', payload: { status: 'buffering' } })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'loading',
      isLoading: true,
      isPlaying: false,
    });

    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'state', payload: { status: 'ended', title: 'Track' } })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'idle',
      isLoading: false,
      isPlaying: false,
      title: 'Track',
    });
    // Un 'idle' explicite du probe (booleens false) ne doit jamais être
    // ré-interprété en 'paused' par l'inférence du normaliseur gelé.
    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'state',
          payload: { status: 'idle', isPlaying: false, isLoading: false },
        })
      )
    ).toBe('state-updated');
    expect(backend.getState().status).toBe('idle');
    // L'état normalisé refusant toujours les statuts inconnus, 'buffering'
    // ne peut pas survivre à une passe directe sur normalizeSpotifyWebState.
    expect(normalizeSpotifyWebState({ status: 'buffering' }).status).toBe(
      'idle'
    );
  });

  it('rapporte les erreurs de lecture remontées par la page', () => {
    const { backend, handshake } = createHarness();
    handshake();
    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'error', code: 'playback_error' })
      )
    ).toBe('error-updated');
    expect(backend.getState()).toMatchObject({
      status: 'error',
      errorCode: 'playback_error',
    });
    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'state',
          payload: { status: 'error', errorCode: 'src_failed' },
        })
      )
    ).toBe('state-updated');
    expect(backend.getState()).toMatchObject({
      status: 'error',
      errorCode: 'src_failed',
    });
  });

  it('accepte positionState dans capabilities v2, garde la porte stricte v1', () => {
    const { backend, handshake } = createHarness();
    handshake();
    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'capabilities',
          payload: {
            mediaSession: true,
            eme: true,
            widevine: false,
            positionState: true,
          },
        })
      )
    ).toBe('capabilities-updated');
    expect(backend.getRuntimeCapabilities()).toEqual({
      mediaSession: true,
      eme: true,
      widevine: false,
      positionState: true,
    });
    expect(
      parseSpotifyWebBridgeMessage(
        '{"version":1,"type":"capabilities","payload":{"mediaSession":true,"eme":true,"widevine":false,"positionState":true}}'
      )
    ).toBeNull();
  });
});

describe('Spotify Web bridge v2 : commandes corrélées', () => {
  it('commande réussie = réponse acceptée pour le bon requestId, sans toucher l’état', async () => {
    const { backend, handshake, pageRespond, scheduler, sent } =
      createHarness();
    handshake();
    backend.receiveBridgeMessage(
      v2({ type: 'state', payload: { status: 'paused', title: 'Track' } })
    );

    const pendingPlay = backend.play();
    expect(sent).toHaveLength(1);
    const envelope = JSON.parse(sent[0]) as Record<string, unknown>;
    expect(envelope).toMatchObject({
      version: 2,
      type: 'command',
      command: 'play',
    });
    expect(typeof envelope.requestId).toBe('string');
    expect(scheduler.pendingDelays).toEqual([
      DEFAULT_SPOTIFY_WEB_COMMAND_TIMEOUT_MS,
    ]);

    expect(pageRespond(sent[0], true)).toBe('command-response');
    await expect(pendingPlay).resolves.toBe(true);
    // Preuve de non-simulation : "accepted" seul ne publie jamais playing.
    expect(backend.getState().status).toBe('paused');
    expect(scheduler.pendingDelays).toEqual([]);
  });

  it('commande refusée par la page → false, état inchangé, réponse inconnue ignorée', async () => {
    const { backend, handshake, pageRespond, sent } = createHarness();
    handshake();
    const pending = backend.pause();
    expect(pageRespond(sent[0], false, 'no-authorized-execution-surface')).toBe(
      'command-response'
    );
    await expect(pending).resolves.toBe(false);
    expect(backend.getState().status).toBe('idle');
    // Une réponse pour un requestId jamais émis ne produit aucun effet.
    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'command-response',
          requestId: 'never-sent',
          accepted: true,
        })
      )
    ).toBe('ignored');
  });

  it('expire la commande sans réponse et ignore la réponse tardive', async () => {
    const { backend, handshake, pageRespond, scheduler, sent } = createHarness({
      commandTimeoutMillis: 100,
    });
    handshake();
    const pending = backend.next();
    expect(scheduler.pendingDelays).toEqual([100]);
    scheduler.fireNext();
    await expect(pending).resolves.toBe(false);

    // Réponse tardive (après expiration) : ignorée, sans double résolution.
    expect(pageRespond(sent[0], true)).toBe('ignored');
    expect(scheduler.pendingDelays).toEqual([]);
  });

  it('latest-command-wins : la réponse à la commande remplacée ne réussit pas', async () => {
    const { backend, handshake, pageRespond, sent } = createHarness();
    handshake();
    const oldPlay = backend.play();
    const newPause = backend.pause();
    expect(sent).toHaveLength(2);

    pageRespond(sent[0], true); // réponse à play, remplacée par pause
    await expect(oldPlay).resolves.toBe(false);

    pageRespond(sent[1], true);
    await expect(newPause).resolves.toBe(true);
  });

  it('réponses dupliquées ou sur requestId inconnu n’ont aucun effet', async () => {
    const { backend, handshake, pageRespond, sent } = createHarness();
    handshake();
    const pending = backend.previous();
    expect(pageRespond(sent[0], true)).toBe('command-response');
    await expect(pending).resolves.toBe(true);
    // Le doublon (entry déjà consommée) est ignoré silencieusement.
    expect(pageRespond(sent[0], true)).toBe('ignored');
  });

  it('toggle, seek et refus des entrées invalides avant émission', async () => {
    const { backend, handshake, sent, scheduler } = createHarness();
    handshake();

    const pendingToggle = backend.toggle();
    expect(JSON.parse(sent[0])).toMatchObject({ command: 'toggle' });
    const toggleId = (JSON.parse(sent[0]) as { requestId: string }).requestId;
    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'command-response', requestId: toggleId, accepted: true })
      )
    ).toBe('command-response');
    await expect(pendingToggle).resolves.toBe(true);

    await expect(backend.seek(Number.NaN)).resolves.toBe(false);
    await expect(backend.seek(-1)).resolves.toBe(false);
    expect(sent).toHaveLength(1); // rien d'envoyé pour un seek invalide
    expect(scheduler.pendingDelays).toEqual([]);

    const pendingSeek = backend.seek(1500);
    expect(JSON.parse(sent[1])).toMatchObject({
      command: 'seek',
      positionMillis: 1500,
    });
    const seekId = (JSON.parse(sent[1]) as { requestId: string }).requestId;
    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'command-response', requestId: seekId, accepted: true })
      )
    ).toBe('command-response');
    await expect(pendingSeek).resolves.toBe(true);
  });

  it('refuse immédiatement si le transport ne délivre pas (WebView absente)', async () => {
    const { backend, handshake, scheduler } = createHarness({
      send: () => false,
    });
    handshake();
    await expect(backend.play()).resolves.toBe(false);
    expect(scheduler.pendingDelays).toEqual([]);
  });

  it('commande avant handshake ou après déconnexion du bridge', async () => {
    const { backend, handshake, scheduler, sent } = createHarness();
    await expect(backend.play()).resolves.toBe(false);
    expect(sent).toHaveLength(0);

    handshake();
    const pending = backend.play();
    expect(sent).toHaveLength(1);

    // Déconnexion : la session repart, la commande en attente est soldée false.
    backend.beginRuntimeSession();
    await expect(pending).resolves.toBe(false);
    expect(backend.isBridgeReady()).toBe(false);
    expect(scheduler.pendingDelays).toEqual([]);
    await expect(backend.pause()).resolves.toBe(false);

    // Reconnexion : nouveau handshake, les commandes repartent.
    handshake();
    const recovered = backend.play();
    expect(sent).toHaveLength(2);
    backend.receiveBridgeMessage(
      v2({
        type: 'command-response',
        requestId: (JSON.parse(sent[1]) as { requestId: string }).requestId,
        accepted: true,
      })
    );
    await expect(recovered).resolves.toBe(true);
  });

  it('un renderer détruit solde les commandes en attente et bloque l’état suivant', async () => {
    const { backend, handshake, sent } = createHarness();
    const session = backend.beginRuntimeSession();
    handshake();
    const pending = backend.play();
    expect(backend.markRuntimeUnavailable(session, 'renderer_destroyed')).toBe(
      true
    );
    await expect(pending).resolves.toBe(false);
    // Message tardif de l'ancien document : toujours bloqué par la porte.
    expect(
      backend.receiveBridgeMessage(
        v2({ type: 'state', payload: { status: 'playing' } })
      )
    ).toBe('rejected');
    const responseId = (JSON.parse(sent[0]) as { requestId: string }).requestId;
    expect(
      backend.receiveBridgeMessage(
        v2({
          type: 'command-response',
          requestId: responseId,
          accepted: true,
        })
      )
    ).toBe('rejected');
  });

  it('destroy() soldette tout et détache le transport', async () => {
    const { backend, handshake, scheduler } = createHarness();
    handshake();
    const pending = backend.play();
    backend.destroy();
    await expect(pending).resolves.toBe(false);
    expect(scheduler.pendingDelays).toEqual([]);
    expect(backend.isBridgeReady()).toBe(false);
    await expect(backend.play()).resolves.toBe(false);
  });

  it('attachRuntime(null) puis re-attach invalident les commandes en attente', async () => {
    const { backend, handshake } = createHarness();
    handshake();
    const pending = backend.play();
    backend.attachRuntime(null);
    await expect(pending).resolves.toBe(false);
  });
});

describe('Spotify Web bridge v2 : contrats purs et sécurité du probe', () => {
  it('le builder produit des enveloppes repassées par le parseur côté page', () => {
    for (const command of [
      'play',
      'pause',
      'toggle',
      'next',
      'previous',
    ] as const) {
      const raw = buildSpotifyWebBridgeCommandMessage(command, 'req-1');
      expect(raw).not.toBeNull();
      expect(parseSpotifyWebCommand(JSON.parse(raw as string))).toEqual({
        version: 2,
        requestId: 'req-1',
        command,
      });
    }
    const seek = buildSpotifyWebBridgeCommandMessage('seek', 'req-2', 2500);
    expect(seek).not.toBeNull();
    expect(parseSpotifyWebCommand(JSON.parse(seek as string))).toEqual({
      version: 2,
      requestId: 'req-2',
      command: 'seek',
      positionMillis: 2500,
    });
    expect(buildSpotifyWebBridgeCommandMessage('seek', 'req-3', -1)).toBeNull();
    expect(
      buildSpotifyWebBridgeCommandMessage('play', 'id avec espace')
    ).toBeNull();
    expect(
      buildSpotifyWebBridgeCommandMessage('play', 'x'.repeat(64))
    ).toBeNull();
    expect(buildSpotifyWebBridgeCommandMessage('play', 'req-1', 10)).toBeNull();
    // v1 reste le contrat gelé côté test existant ; toggle y est inconnu.
    expect(
      parseSpotifyWebCommand({ version: 1, command: 'toggle' })
    ).toBeNull();
    expect(
      parseSpotifyWebCommand({ version: 2, command: 'toggle' })
    ).toBeNull();
  });

  it('rejette les réponses malformées sans jamais journaliser la charge utile', () => {
    const good = v2({
      type: 'command-response',
      requestId: 'r-1',
      accepted: false,
      code: 'no-authorized-execution-surface',
    });
    expect(parseSpotifyWebBridgeMessage(good)).toEqual({
      version: 2,
      type: 'command-response',
      requestId: 'r-1',
      accepted: false,
      code: 'no-authorized-execution-surface',
    });
    expect(
      parseSpotifyWebBridgeMessage(
        v2({ type: 'command-response', requestId: 'r-1' })
      )
    ).toBeNull(); // accepted manquant
    expect(
      parseSpotifyWebBridgeMessage(
        v2({ type: 'command-response', requestId: 'r 1', accepted: true })
      )
    ).toBeNull(); // id non sûr
    expect(
      parseSpotifyWebBridgeMessage(
        v2({ type: 'command-response', requestId: 'r-1', accepted: 'yes' })
      )
    ).toBeNull();
    expect(
      parseSpotifyWebBridgeMessage(
        v2({
          type: 'command-response',
          requestId: 'r-1',
          accepted: true,
          details: 'stack trace',
        })
      )
    ).toBeNull(); // aucun champ inconnu
  });

  it('le probe v2 ne contient aucune surface d’exécution ou de collecte', () => {
    // Continuité du contrat v1 du probe (tests de garde existants).
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain(
      'navigatorApi.mediaSession'
    );
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain("type: 'ready'");
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain("type: 'state'");
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain("'com.widevine.alpha'");
    // Nouveautés v2 : corrélation des réponses et refus honnête d'exécution.
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain(
      "type: 'command-response'"
    );
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain('requestId');
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain(
      'no-authorized-execution-surface'
    );
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).toContain("'media-session'");
    // Interdits absolus : DOM, éléments média, contrôle de lecture simulé,
    // captation de données ou réseau, input synthétique, contournement.
    expect(SPOTIFY_WEB_MEDIA_SESSION_PROBE).not.toMatch(
      /cookie|localStorage|sessionStorage|XMLHttpRequest|\bfetch\b|querySelector|getElementById|innerHTML|srcObject|\.play\(|\.pause\(|createMediaKeys|setMediaKeys|generateRequest|MediaElement|KeyboardEvent|dispatchEvent|token/i
    );
  });
});
