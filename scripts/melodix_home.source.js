(function() {
    'use strict';
    if (window._sfMelodixHomeAssetLoaded) return;
    window._sfMelodixHomeAssetLoaded = true;
    window.__sfMelodixHomeInitAttempted = true;

    function traceMelodixHome(message) {
        var line = String(message || '').slice(0, 160);
        try {
            if (typeof window.__sfBridgeTrace === 'function') {
                window.__sfBridgeTrace(line);
                return;
            }
        } catch (_) {}
        try {
            var bridge = window.AndBridge;
            if (bridge && typeof bridge.logDiagEvent === 'function') bridge.logDiagEvent(line);
        } catch (_) {}
    }

    function safeMelodixHomeRoute() {
        try {
            var host = String(window.location.hostname || '').toLowerCase();
            if (host === 'accounts.spotify.com') return 'login';
            if (host !== 'open.spotify.com') return 'other';
            var path = melodixHomeRoutePath();
            if (path === '/' || path === '/home' || path === '/app') return 'home';
            var first = path.split('/').filter(Boolean)[0] || '';
            if (first === 'search') return 'search';
            if (first === 'collection' || first === 'your-library') return 'library';
            return MELODIX_HOME_TYPES.has(first) ? first : 'other';
        } catch (_) {
            return 'other';
        }
    }

    function safeHomeSessionBit() {
        try {
            return melodixHomeHasSessionEvidence() ? '1' : '0';
        } catch (_) {
            return '0';
        }
    }

    function traceHomeGuard(guard, passed) {
        var rawName = String(guard || '');
        if (rawName === 'session') return;
        var allowed = ['body', 'route', 'gui-mode', 'fullscreen', 'activation'];
        var name = allowed.indexOf(rawName) >= 0 ? rawName : 'activation';
        var route = safeMelodixHomeRoute();
        var signature = [passed ? '1' : '0', route].join('|');
        var signatures = window.__sfMelodixHomeGuardTraceSignatures;
        if (!signatures || typeof signatures !== 'object') signatures = {};
        if (signatures[name] === signature) return;
        signatures[name] = signature;
        window.__sfMelodixHomeGuardTraceSignatures = signatures;
        traceMelodixHome('home-guard guard=' + name + ' result=' + (passed ? '1' : '0') +
            ' route=' + route);
    }

    function traceHomeCss(result, passed) {
        var probe = result || {};
        var values = [
            ['marker', probe.marker_present],
            ['computed', probe.computed_style_available],
            ['display', probe.home_display_flex],
            ['fixed', probe.home_position_fixed],
            ['visible', probe.home_visibility_visible],
            ['opacity', probe.home_opacity_nonzero],
            ['z', probe.home_z_index_high],
            ['main-hidden', probe.main_hidden],
            ['error', probe.probe_error],
            ['result', passed]
        ];
        var signature = values.map(function(entry) { return entry[1] ? '1' : '0'; }).join('');
        if (window.__sfMelodixHomeCssTraceSignature === signature) return;
        window.__sfMelodixHomeCssTraceSignature = signature;
        traceMelodixHome('home-css ' + values.map(function(entry) {
            return entry[0] + '=' + (entry[1] ? '1' : '0');
        }).join(' '));
    }

    function traceHomeNode(home, created, action) {
        var exists = Boolean(home);
        var attached = false;
        var visible = false;
        var display = 'none';
        var visibility = 'hidden';
        var opacity = '0';
        var width = 0;
        var height = 0;
        var zIndex = 0;
        try {
            attached = Boolean(home && home.parentNode && document.body && document.body.contains(home));
            if (home && typeof window.getComputedStyle === 'function') {
                var style = window.getComputedStyle(home);
                var rect = home.getBoundingClientRect();
                display = ['flex', 'none', 'block'].indexOf(style.display) >= 0 ? style.display : 'other';
                visibility = ['visible', 'hidden'].indexOf(style.visibility) >= 0 ? style.visibility : 'other';
                opacity = Number(style.opacity) > 0 ? '1' : '0';
                width = Math.max(0, Math.min(99999, Math.round(Number(rect.width) || 0)));
                height = Math.max(0, Math.min(99999, Math.round(Number(rect.height) || 0)));
                zIndex = Math.max(0, Math.min(99999, Number.parseInt(style.zIndex || '0', 10) || 0));
                visible = attached && display !== 'none' && visibility === 'visible' && opacity === '1' &&
                    width > 0 && height > 0;
            }
        } catch (_) {}
        var safeAction = ['create', 'render', 'remove', 'none'].indexOf(String(action || '')) >= 0
            ? String(action) : 'none';
        var line = 'home-node exists=' + (exists ? '1' : '0') +
            ' created=' + (created ? '1' : '0') + ' attached=' + (attached ? '1' : '0') +
            ' visible=' + (visible ? '1' : '0') + ' display=' + display +
            ' visibility=' + visibility + ' opacity=' + opacity + ' width=' + width +
            ' height=' + height + ' z=' + zIndex + ' action=' + safeAction;
        if (window.__sfMelodixHomeNodeTraceSignature === line) return;
        window.__sfMelodixHomeNodeTraceSignature = line;
        traceMelodixHome(line);
    }

    function notifyMelodixHomeOwner(active, sessionProven, force) {
        var bridge = window.AndBridge;
        var value = Boolean(active);
        var session = sessionProven === true;
        if (!bridge || typeof bridge.onMelodixHomeVisibility !== 'function') return;
        if (!value && !session && window.__sfMelodixHomeOwnerSent !== true) {
            // A first unproven Home is not a Web-Home ownership change. Avoid
            // asking Android to reveal Spotify over the separate native
            // connection state that the shell can safely render.
            window.__sfMelodixHomeOwnerSent = false;
            window.__sfMelodixHomeOwnerSessionSent = false;
            return;
        }
        if (!force && window.__sfMelodixHomeOwnerSent === value &&
            window.__sfMelodixHomeOwnerSessionSent === session) return;
        try {
            // Only redacted owner/session booleans cross the bridge; no page or
            // account content is sent, and this never grants authentication.
            bridge.onMelodixHomeVisibility(value, session);
            window.__sfMelodixHomeOwnerSent = value;
            window.__sfMelodixHomeOwnerSessionSent = session;
        } catch (_) {}
    }

    function traceHomeFinal(forceOwnerSync) {
        var home = document.getElementById('sf-melodix-home');
        var nativeKnown = window.__sfNativeUiRootVisibilityKnown === true;
        var nativeVisible = 'unknown';
        if (nativeKnown && window.__sfNativeUiVisibilityConfirmed === true) {
            nativeVisible = '1';
        } else if (nativeKnown && (window.__sfNativeUiRootFound === false ||
            window.__sfNativeUiRootVisible === false)) {
            nativeVisible = '0';
        }
        var homeVisible = false;
        var mainView = null;
        var route = safeMelodixHomeRoute();
        var session = safeHomeSessionBit();
        try {
            mainView = findMelodixHomeContentRoot();
            if (route === 'home' && session === '1' && home && document.body &&
                document.body.contains(home) && typeof window.getComputedStyle === 'function') {
                var style = window.getComputedStyle(home);
                var mainStyle = mainView ? window.getComputedStyle(mainView) : null;
                var rect = home.getBoundingClientRect();
                homeVisible = document.body.classList.contains(MELODIX_HOME_ACTIVE_CLASS) &&
                    style.display !== 'none' && style.visibility === 'visible' && Number(style.opacity) > 0 &&
                    rect.width > 0 && rect.height > 0 &&
                    (!mainView || Boolean(mainStyle && mainStyle.display === 'none'));
            }
        } catch (_) {}
        // Native Home may render in parallel, but it may not cover a Web Home
        // whose authenticated route and visible pixels have just been verified.
        notifyMelodixHomeOwner(homeVisible, session === '1', forceOwnerSync === true);
        window.__sfMelodixHomeFinalVisible = homeVisible;
        var webVisible = nativeVisible === '1' ? '0' : nativeVisible === '0' ? '1' : 'unknown';
        var owner = nativeVisible === '1' ? 'native' : nativeVisible === '0'
            ? homeVisible ? 'web' : 'spotify' : 'unknown';
        var line = 'home-final owner=' + owner + ' route=' + route +
            ' web=' + webVisible + ' native=' + nativeVisible + ' home=' + (homeVisible ? '1' : '0');
        if (window.__sfMelodixHomeFinalTraceSignature === line) return;
        window.__sfMelodixHomeFinalTraceSignature = line;
        traceMelodixHome(line);
    }
    window.__sfMelodixHomeTraceFinal = traceHomeFinal;
    window.__sfMelodixHomeSyncNativeOwner = function() {
        traceHomeFinal(true);
    };

const MELODIX_HOME_ACTIVE_CLASS = 'sf-melodix-home-active';
const MELODIX_HOME_STYLE_PROBE_CLASS = 'sf-melodix-home-style-probe';
const MELODIX_HOME_STYLE_MARKER = 'SF_MELODIX_HOME_STYLES_V1';
const MELODIX_HOME_TYPES = new Set(['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook']);
const MELODIX_HOME_MODES = new Set(['csshack', 'bigwindow']);
const MELODIX_HOME_CARD_CONTAINERS = [
    '[data-testid="card"]',
    '[data-encore-id="card"]',
    '[data-testid="tracklist-row"]',
    '[data-testid*="card-container"]',
    '[data-encore-id*="card"]',
    '[role="listitem"]',
    'article',
    'li'
].join(',');
const MELODIX_HOME_TITLE_SELECTORS = [
    '[data-testid="card-title"]',
    '[data-encore-id="cardTitle"]',
    '[data-testid*="card-title"]',
    '[role="heading"]',
    'h1', 'h2', 'h3'
].join(',');
const MELODIX_HOME_ROOT_SELECTORS = [
    '#main-view',
    '[data-testid="main-view"]',
    '#main-content',
    '[data-testid="main-content"]',
    '[data-testid="home-page"]',
    '[data-testid="browse-feed"]',
    '[data-testid="content-feed"]',
    '[role="main"]',
    'main'
];
const MELODIX_HOME_LINK_SELECTOR = 'a[href], [role="link"][href]';
const MELODIX_HOME_NAV_SELECTOR = 'nav, [role="navigation"], aside, header, footer, #global-nav-bar, ' +
    '#Desktop_LeftSidebar_Id, #sf-mobile-nav, #sf-mobile-navigation, #sf-melodix-home, ' +
    '[data-testid="now-playing-bar"], [data-testid="mobile-playback-bar"], ' +
    '[data-testid="now-playing-widget"], [data-testid="mini-player"]';
let lastHomeDecisionSignature = '';

function melodixHomeRoutePath() {
    const parts = String(window.location.pathname || '/').split('/').filter(Boolean);
    if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
    return parts.length ? `/${parts.join('/')}` : '/';
}

function isMelodixHomeRoute() {
    const path = melodixHomeRoutePath();
    // The native startup probe can deliberately enter the player at /app.
    // Treat that entry as Home too, or the branded renderer remains disabled
    // after the app's own recovery path.
    return window.location.hostname === 'open.spotify.com' && (path === '/' || path === '/home' || path === '/app');
}

function melodixHomeCopy() {
    const locale = (document.documentElement.lang || navigator.language || 'en').toLowerCase().split('-')[0];
    const common = {
        loadingTitle: 'Loading your Spotify library…',
        loadingBody: 'Your real Spotify items are being collected.',
        emptyTitle: 'Nothing saved yet',
        emptyBody: 'Items you save in Spotify will appear here.',
        errorTitle: 'Spotify data is unavailable',
        partialErrorTitle: 'Some Spotify items could not be loaded',
        retry: 'Try again',
        requestError: 'Spotify refused the library request. The cause is not confirmed; try again.',
        accessError: 'Spotify denied access to the library request. Check access or try again.',
        playlists: 'Your playlists',
        albums: 'Saved albums',
        artists: 'Followed artists',
        podcasts: 'Podcasts'
    };
    const copy = {
        fr: {
            morning: 'Bonjour', afternoon: 'Bon après-midi', evening: 'Bonsoir', discover: 'À découvrir',
            loadingTitle: 'Chargement de votre bibliothèque Spotify…',
            loadingBody: 'Vos données Spotify sont en cours de chargement.',
            emptyTitle: 'Aucun contenu enregistré',
            emptyBody: 'Les contenus que vous enregistrez dans Spotify apparaîtront ici.',
            errorTitle: 'Données Spotify indisponibles',
            partialErrorTitle: 'Certaines données Spotify n’ont pas pu être chargées',
            retry: 'Réessayer',
            requestError: 'Spotify a refusé la requête de bibliothèque. La cause n’est pas confirmée ; réessayez.',
            accessError: 'Spotify a refusé l’accès à la bibliothèque. Vérifiez les autorisations ou réessayez.',
            playlists: 'Vos playlists', albums: 'Albums enregistrés',
            artists: 'Artistes suivis', podcasts: 'Podcasts',
            networkError: 'La collecte a échoué. Vérifiez la connexion puis réessayez.',
            rateLimitError: 'Spotify limite temporairement les requêtes. Réessayez dans un instant.',
            serverError: 'Spotify est momentanément indisponible. Réessayez dans un instant.'
        },
        en: {
            morning: 'Good morning', afternoon: 'Good afternoon', evening: 'Good evening', discover: 'Discover',
            ...common,
            networkError: 'The collection failed. Check your connection and try again.',
            rateLimitError: 'Spotify is temporarily limiting requests. Please try again shortly.',
            serverError: 'Spotify is temporarily unavailable. Please try again shortly.',
            requestError: 'Spotify refused the library request. The cause is not confirmed; try again.',
            accessError: 'Spotify denied the library request. Check access or try again.'
        },
        es: {
            morning: 'Buenos días', afternoon: 'Buenas tardes', evening: 'Buenas noches', discover: 'Descubre',
            loadingTitle: 'Cargando tu biblioteca de Spotify…',
            loadingBody: 'Se están cargando tus datos reales de Spotify.',
            emptyTitle: 'No hay contenido guardado',
            emptyBody: 'El contenido que guardes en Spotify aparecerá aquí.',
            errorTitle: 'Los datos de Spotify no están disponibles',
            partialErrorTitle: 'No se pudieron cargar algunos datos de Spotify', retry: 'Reintentar',
            playlists: 'Tus playlists', albums: 'Álbumes guardados', artists: 'Artistas seguidos', podcasts: 'Podcasts',
            networkError: 'No se pudieron recopilar los datos. Comprueba la conexión y vuelve a intentarlo.',
            rateLimitError: 'Spotify está limitando las solicitudes temporalmente. Inténtalo más tarde.',
            serverError: 'Spotify no está disponible temporalmente. Inténtalo más tarde.',
            requestError: 'Spotify rechazó la solicitud de biblioteca. No se conoce la causa; inténtalo de nuevo.',
            accessError: 'Spotify denegó el acceso a la biblioteca. Comprueba el acceso o inténtalo de nuevo.'
        },
        de: {
            morning: 'Guten Morgen', afternoon: 'Guten Tag', evening: 'Guten Abend', discover: 'Entdecken',
            loadingTitle: 'Spotify-Bibliothek wird geladen…',
            loadingBody: 'Deine echten Spotify-Daten werden geladen.',
            emptyTitle: 'Noch nichts gespeichert',
            emptyBody: 'In Spotify gespeicherte Inhalte erscheinen hier.',
            errorTitle: 'Spotify-Daten sind nicht verfügbar',
            partialErrorTitle: 'Einige Spotify-Daten konnten nicht geladen werden', retry: 'Erneut versuchen',
            playlists: 'Deine Playlists', albums: 'Gespeicherte Alben', artists: 'Gefolgte Künstler', podcasts: 'Podcasts',
            networkError: 'Die Daten konnten nicht geladen werden. Prüfe die Verbindung und versuche es erneut.',
            rateLimitError: 'Spotify begrenzt Anfragen vorübergehend. Bitte versuche es später erneut.',
            serverError: 'Spotify ist vorübergehend nicht verfügbar. Bitte versuche es später erneut.',
            requestError: 'Spotify hat die Bibliotheksanfrage abgelehnt. Die Ursache ist nicht bestätigt; bitte versuche es erneut.',
            accessError: 'Spotify hat den Bibliothekszugriff verweigert. Prüfe den Zugriff oder versuche es erneut.'
        },
        it: {
            morning: 'Buongiorno', afternoon: 'Buon pomeriggio', evening: 'Buonasera', discover: 'Scopri',
            loadingTitle: 'Caricamento della libreria Spotify…',
            loadingBody: 'Stiamo caricando i tuoi dati reali di Spotify.',
            emptyTitle: 'Nessun contenuto salvato',
            emptyBody: 'I contenuti salvati su Spotify appariranno qui.',
            errorTitle: 'Dati Spotify non disponibili',
            partialErrorTitle: 'Alcuni dati Spotify non sono stati caricati', retry: 'Riprova',
            playlists: 'Le tue playlist', albums: 'Album salvati', artists: 'Artisti seguiti', podcasts: 'Podcast',
            networkError: 'Raccolta non riuscita. Controlla la connessione e riprova.',
            rateLimitError: 'Spotify sta limitando temporaneamente le richieste. Riprova tra poco.',
            serverError: 'Spotify non è temporaneamente disponibile. Riprova tra poco.',
            requestError: 'Spotify ha rifiutato la richiesta della libreria. La causa non è confermata; riprova.',
            accessError: 'Spotify ha negato l’accesso alla libreria. Verifica l’accesso o riprova.'
        },
        pt: {
            morning: 'Bom dia', afternoon: 'Boa tarde', evening: 'Boa noite', discover: 'Descobrir',
            loadingTitle: 'A carregar a biblioteca Spotify…',
            loadingBody: 'Os teus dados reais do Spotify estão a ser carregados.',
            emptyTitle: 'Ainda não há conteúdo guardado',
            emptyBody: 'O conteúdo guardado no Spotify aparecerá aqui.',
            errorTitle: 'Dados do Spotify indisponíveis',
            partialErrorTitle: 'Não foi possível carregar alguns dados do Spotify', retry: 'Tentar novamente',
            playlists: 'As tuas playlists', albums: 'Álbuns guardados', artists: 'Artistas seguidos', podcasts: 'Podcasts',
            networkError: 'A recolha falhou. Verifica a ligação e tenta novamente.',
            rateLimitError: 'O Spotify está a limitar os pedidos temporariamente. Tenta novamente em breve.',
            serverError: 'O Spotify está temporariamente indisponível. Tenta novamente em breve.',
            requestError: 'O Spotify recusou o pedido da biblioteca. A causa não está confirmada; tenta novamente.',
            accessError: 'O Spotify recusou o acesso à biblioteca. Verifica o acesso ou tenta novamente.'
        }
    };
    const labels = copy[locale] || copy.en;
    const hour = new Date().getHours();
    return {
        ...common,
        ...labels,
        greeting: hour < 12 ? labels.morning : hour < 18 ? labels.afternoon : labels.evening,
        discover: labels.discover
    };
}

function melodixHomeResourcePath(href) {
    try {
        const url = new URL(String(href || ''), window.location.href);
        if (url.protocol !== 'https:' || url.hostname !== 'open.spotify.com' || url.origin !== window.location.origin) {
            return '';
        }
        const parts = url.pathname.split('/').filter(Boolean);
        if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
        const type = String(parts[0] || '').toLowerCase();
        const id = String(parts[1] || '').trim();
        if (type === 'collection' && id === 'tracks' && parts.length === 2) return '/collection/tracks';
        if (!MELODIX_HOME_TYPES.has(type) || !id || parts.length > 2) return '';
        return `/${type}/${id}`;
    } catch (_) {
        return '';
    }
}

function melodixHomeLibraryResource(item, group) {
    const raw = String(item && (item.uri || item.href || item.id) || '').trim();
    const match = /^spotify:([a-z]+):([A-Za-z0-9_-]+)$/i.exec(raw);
    if (match) {
        const type = match[1].toLowerCase();
        const id = match[2];
        if (type === 'collection' && id === 'tracks') {
            return { resourcePath: '/collection/tracks', href: 'https://open.spotify.com/collection/tracks' };
        }
        if (!MELODIX_HOME_TYPES.has(type)) return null;
        return {
            resourcePath: `/${type}/${id}`,
            href: `https://open.spotify.com/${type}/${encodeURIComponent(id)}`
        };
    }
    const resourcePath = melodixHomeResourcePath(raw);
    if (resourcePath) {
        try {
            return { resourcePath, href: new URL(raw, window.location.href).href };
        } catch (_) {
            return null;
        }
    }
    const groupType = { playlists: 'playlist', albums: 'album', artists: 'artist', podcasts: 'show' }[group];
    if (groupType && /^[A-Za-z0-9_-]{1,128}$/.test(raw)) {
        return {
            resourcePath: `/${groupType}/${raw}`,
            href: `https://open.spotify.com/${groupType}/${encodeURIComponent(raw)}`
        };
    }
    return null;
}

function melodixHomeHasSessionEvidence() {
    // Only this WebView's successful, correctly shaped private libraryV3
    // response proves the Spotify session. The native-ready flag, profile UI,
    // public Home cards and stale resource arrays are not authentication.
    return window.__sfMediaLibSessionProofKnown === true &&
        window.__sfMediaLibSessionProven === true;
}

function collectMelodixHomeLibrarySections(seenResources) {
    const library = melodixHomeHasSessionEvidence() ? window.mediaLib : null;
    if (!library || typeof library !== 'object') return [];
    const labels = melodixHomeCopy();
    const groups = [
        ['playlists', labels.playlists || 'Your playlists'],
        ['albums', labels.albums || 'Saved albums'],
        ['artists', labels.artists || 'Followed artists'],
        ['podcasts', labels.podcasts || 'Podcasts']
    ];
    const seen = seenResources || new Set();
    return groups.map(([key, title]) => {
        const cards = [];
        const items = Array.isArray(library[key]) ? library[key] : [];
        items.forEach((item) => {
            const resource = melodixHomeLibraryResource(item, key);
            const name = String(item && (item.name || item.title) || '').replace(/\s+/g, ' ').trim();
            if (!resource || !name || /^unknown$/i.test(name) || seen.has(resource.resourcePath)) return;
            const artists = item && Array.isArray(item.artists)
                ? item.artists.map((artist) => typeof artist === 'string' ? artist : String(artist && (artist.name || artist.title) || '')).filter(Boolean).join(', ')
                : '';
            const subtitle = String(artists || item && (item.owner || item.description || item.type) || '')
                .replace(/\s+/g, ' ').trim().slice(0, 120);
            cards.push({
                title: name.slice(0, 100),
                subtitle,
                image: safeMelodixHomeImage(item && (item.image || item.cover || item.artwork) || ''),
                href: resource.href,
                resourcePath: resource.resourcePath,
                sourceAnchor: null
            });
            seen.add(resource.resourcePath);
        });
        return { title, cards: cards.slice(0, 8) };
    }).filter((section) => section.cards.length > 0).slice(0, 4);
}

function isMelodixHomeNavigationLink(anchor) {
    try {
        return Boolean(anchor && typeof anchor.closest === 'function' && anchor.closest(MELODIX_HOME_NAV_SELECTOR));
    } catch (_) {
        return false;
    }
}

function melodixHomeResourceCount(root) {
    if (!root || typeof root.querySelectorAll !== 'function') return 0;
    let anchors = [];
    try {
        anchors = Array.from(root.querySelectorAll(MELODIX_HOME_LINK_SELECTOR)).slice(0, 300);
    } catch (_) {
        return 0;
    }
    const seen = new Set();
    anchors.forEach((anchor) => {
        if (isMelodixHomeNavigationLink(anchor) || (anchor.closest && anchor.closest('#sf-melodix-home'))) return;
        const path = melodixHomeResourcePath(anchor.href || anchor.getAttribute('href'));
        if (path) seen.add(path);
    });
    return seen.size;
}

function melodixHomeHasNavigation(root) {
    if (!root || typeof root.querySelector !== 'function') return false;
    try {
        return Boolean(root.querySelector(MELODIX_HOME_NAV_SELECTOR));
    } catch (_) {
        return false;
    }
}

function findFallbackMelodixHomeRoot() {
    let anchors = [];
    try {
        anchors = Array.from(document.querySelectorAll(MELODIX_HOME_LINK_SELECTOR)).slice(0, 300);
    } catch (_) {
        return null;
    }
    const candidates = [];
    const candidateDepth = new Map();
    anchors.forEach((anchor) => {
        if (isMelodixHomeNavigationLink(anchor)) return;
        const href = anchor.href || anchor.getAttribute('href') || '';
        if (!melodixHomeResourcePath(href)) return;
        let node = anchor.parentElement;
        let depth = 1;
        while (node && node !== document.body && node !== document.documentElement && depth <= 8) {
            const tag = String(node.tagName || '').toUpperCase();
            if (node.id === 'sf-melodix-home' || (node.closest && node.closest('#sf-melodix-home'))) break;
            if (!['HTML', 'BODY', 'NAV', 'HEADER', 'FOOTER', 'ASIDE'].includes(tag) &&
                !melodixHomeHasNavigation(node)) {
                if (!candidateDepth.has(node) && candidates.length < 64) {
                    candidates.push(node);
                    candidateDepth.set(node, depth);
                } else if (candidateDepth.has(node) && depth < candidateDepth.get(node)) {
                    candidateDepth.set(node, depth);
                }
            }
            node = node.parentElement;
            depth += 1;
        }
    });

    let best = null;
    let bestCount = 0;
    let bestDepth = Infinity;
    candidates.forEach((candidate) => {
        const count = melodixHomeResourceCount(candidate);
        const depth = candidateDepth.get(candidate) || Infinity;
        if (count > bestCount || (count > 0 && count === bestCount && depth < bestDepth)) {
            best = candidate;
            bestCount = count;
            bestDepth = depth;
        }
    });
    if (!best) return null;
    return {
        element: best,
        selector: `fallback:${String(best.tagName || 'element').toLowerCase()}`,
        resourceCount: bestCount
    };
}

function findMelodixHomeContentRoot() {
    let firstRoot = null;
    let firstSelector = '';
    let bestRoot = null;
    let bestSelector = '';
    let bestCount = -1;
    const seen = new Set();

    MELODIX_HOME_ROOT_SELECTORS.forEach((selector) => {
        let candidate = null;
        try {
            candidate = document.querySelector(selector);
        } catch (_) {}
        if (!candidate || seen.has(candidate) || candidate.id === 'sf-melodix-home' ||
            (candidate.closest && candidate.closest('#sf-melodix-home'))) return;
        seen.add(candidate);
        if (!firstRoot) {
            firstRoot = candidate;
            firstSelector = selector;
        }
        const count = melodixHomeResourceCount(candidate);
        if (count > bestCount) {
            bestRoot = candidate;
            bestSelector = selector;
            bestCount = count;
        }
    });

    // Spotify's current Home may not expose #main-view or another semantic
    // main element. Bound the fallback to real Spotify links and eight ancestor
    // levels; never treat arbitrary page text as a card.
    if (!bestRoot || bestCount < 2) {
        const fallback = findFallbackMelodixHomeRoot();
        if (fallback && fallback.resourceCount > bestCount) {
            bestRoot = fallback.element;
            bestSelector = fallback.selector;
            bestCount = fallback.resourceCount;
        }
    }
    if (!bestRoot && firstRoot) {
        bestRoot = firstRoot;
        bestSelector = firstSelector;
        bestCount = 0;
    }
    window.__sfMelodixHomeRootSelector = bestRoot ? bestSelector : 'none';
    window.__sfMelodixHomeRootResourceCount = bestRoot ? Math.max(0, bestCount) : 0;
    return bestRoot;
}

function markMelodixHomeSourceRoot(root) {
    const previous = window._sfMelodixHomeSourceRoot;
    if (previous && previous !== root && typeof previous.removeAttribute === 'function') {
        previous.removeAttribute('data-sf-melodix-source-root');
    }
    if (root && typeof root.setAttribute === 'function') {
        root.setAttribute('data-sf-melodix-source-root', 'true');
        window._sfMelodixHomeSourceRoot = root;
    } else {
        window._sfMelodixHomeSourceRoot = null;
    }
}

function safeMelodixHomeImage(raw) {
    try {
        const url = new URL(String(raw || '').trim(), window.location.href);
        const host = url.hostname.toLowerCase();
        if (url.protocol !== 'https:') return '';
        if (
            host !== 'scdn.co' && !host.endsWith('.scdn.co') &&
            host !== 'spotifycdn.com' && !host.endsWith('.spotifycdn.com')
        ) return '';
        return url.href;
    } catch (_) {
        return '';
    }
}

function melHomeText(node) {
    return String(node && (node.innerText || node.textContent) || '').replace(/\s+/g, ' ').trim();
}

function firstMelodyHomeText(root, selector) {
    if (!root || typeof root.querySelector !== 'function') return '';
    try {
        return melHomeText(root.querySelector(selector));
    } catch (_) {
        return '';
    }
}

function findMelodixHomeCard(anchor, mainView) {
    if (anchor && typeof anchor.closest === 'function') {
        try {
            const known = anchor.closest(MELODIX_HOME_CARD_CONTAINERS);
            if (known && known !== mainView) return known;
        } catch (_) {}
    }

    let node = anchor;
    for (let depth = 0; node && node.parentElement && node.parentElement !== mainView && depth < 6; depth += 1) {
        const parent = node.parentElement;
        if (/^(MAIN|SECTION|NAV|UL|OL)$/.test(parent.tagName || '')) break;
        let resourceLinks = 0;
        try {
            resourceLinks = Array.from(parent.querySelectorAll('a[href], [role="link"][href]'))
                .filter((item) => melodixHomeResourcePath(item.href || item.getAttribute('href'))).length;
        } catch (_) {}
        if (resourceLinks > 1) break;
        if (parent.querySelector('img') || parent.hasAttribute('aria-label')) node = parent;
        else break;
    }
    return node || anchor;
}

function melodixHomeImage(card, anchor) {
    const image = (anchor && anchor.querySelector && anchor.querySelector('img')) ||
        (card && card.querySelector && card.querySelector('img'));
    if (image) {
        let raw = image.currentSrc || image.getAttribute('src') || image.getAttribute('data-src') || image.src || '';
        if (!raw) {
            const srcset = image.getAttribute('srcset') || '';
            raw = (String(srcset).split(',')[0] || '').trim().split(/\s+/)[0] || '';
        }
        const safe = safeMelodixHomeImage(raw);
        if (safe) return safe;
    }
    const backgroundNode = card && card.querySelector
        ? card.querySelector('[style*="background-image"]')
        : null;
    if (backgroundNode) {
        const style = backgroundNode.style && backgroundNode.style.backgroundImage ||
            (typeof window.getComputedStyle === 'function'
                ? window.getComputedStyle(backgroundNode).backgroundImage
                : '');
        const match = /url\((?:['"])?(.*?)(?:['"])?\)/i.exec(style || '');
        if (match) return safeMelodixHomeImage(match[1]);
    }
    return '';
}

function melodixHomeShelf(card, mainView) {
    let node = card;
    while (node && node !== mainView) {
        if (node.matches && node.matches('section, [data-testid*="shelf"], [data-encore-id*="grid"], [role="list"]')) {
            return node;
        }
        node = node.parentElement;
    }
    return mainView;
}

function collectMelodixHomeSections(mainView, seenResources) {
    if (!mainView || typeof mainView.querySelectorAll !== 'function') return [];
    // Spotify has changed card data-testid values repeatedly. Start from
    // real navigable resource links, then infer their enclosing card from
    // multiple stable structural/Encore selectors with a bounded ancestor
    // fallback. No card text, artwork or playlist is synthesized.
    let anchors = [];
    try {
        anchors = Array.from(mainView.querySelectorAll('a[href], [role="link"][href]'));
    } catch (_) {
        return [];
    }
    const grouped = new Map();
    const seen = seenResources instanceof Set ? seenResources : new Set();

    anchors.forEach((anchor) => {
        const href = anchor.href || anchor.getAttribute('href') || '';
        const resourcePath = melodixHomeResourcePath(href);
        if (!resourcePath || seen.has(resourcePath) || isMelodixHomeNavigationLink(anchor) ||
            (anchor.closest && anchor.closest('#sf-melodix-home'))) return;
        const card = findMelodixHomeCard(anchor, mainView);
        const lines = String(card.innerText || card.textContent || anchor.innerText || anchor.textContent || '')
            .split('\n')
            .map((line) => line.replace(/\s+/g, ' ').trim())
            .filter(Boolean);
        const title = firstMelodyHomeText(card, MELODIX_HOME_TITLE_SELECTORS) ||
            firstMelodyHomeText(anchor, MELODIX_HOME_TITLE_SELECTORS) ||
            String((anchor.querySelector('img') || card.querySelector('img') || {}).alt || '').trim() ||
            lines[0] ||
            melHomeText(card.getAttribute && card.getAttribute('aria-label')) ||
            melHomeText(anchor.getAttribute && anchor.getAttribute('aria-label'));
        if (!title) return;

        const shelf = melodixHomeShelf(card, mainView);
        let heading = '';
        if (shelf !== mainView) {
            const headingNodes = Array.from(shelf.querySelectorAll('h1, h2, h3, [role="heading"], [data-testid*="shelf-title"]'));
            const headingNode = headingNodes.find((item) => !(item.closest && item.closest(MELODIX_HOME_CARD_CONTAINERS)));
            heading = melHomeText(headingNode).slice(0, 80);
        }
        const subtitle = firstMelodyHomeText(card,
            '[data-testid="card-subtitle"], [data-encore-id="cardSubtitle"], [data-testid*="subtitle"]') ||
            lines.find((line) => line !== title) || '';
        const cardHref = new URL(href, window.location.href).href;
        const group = grouped.get(shelf) || { title: heading, cards: [] };
        group.cards.push({
            title: title.slice(0, 100),
            subtitle: subtitle.slice(0, 120),
            image: melodixHomeImage(card, anchor),
            href: cardHref,
            resourcePath,
            sourceAnchor: anchor
        });
        grouped.set(shelf, group);
        seen.add(resourcePath);
    });

    return Array.from(grouped.values())
        .map((group) => ({ ...group, cards: group.cards.slice(0, 8) }))
        .filter((group) => group.cards.length > 0)
        .slice(0, 4);
}

function safeMelodixHomeProofState() {
    if (window.__sfMediaLibSessionProofKnown !== true) return 'unknown';
    return window.__sfMediaLibSessionProven === true ? 'valid' : 'invalid';
}

function melodixHomeHasConfirmedHttpStatus(status) {
    const diagnostic = window.__sfMediaLibLastDiagnostic;
    const expectedError = status === 401 || status === 403 ? `http-${status}` : 'http-other';
    return Boolean(diagnostic && typeof diagnostic === 'object' &&
        Number(diagnostic.http) === status && diagnostic.phase === 'response' &&
        diagnostic.error === expectedError &&
        ['json', 'html', 'other', 'missing'].includes(diagnostic.mime) &&
        Number.isFinite(Number(diagnostic.durationMs)) && Number(diagnostic.durationMs) >= 0);
}

function safeMelodixHomeLibraryError() {
    const value = String(window.__sfMediaLibError || '');
    if (!value) return 'none';
    if (value === 'http-401') return melodixHomeHasConfirmedHttpStatus(401) ? 'http-401' : 'other';
    if (value === 'http-403') return melodixHomeHasConfirmedHttpStatus(403) ? 'http-403' : 'other';
    if (/^http-[1-5][0-9]{2}$/.test(value)) {
        const status = Number(value.slice(5));
        return melodixHomeHasConfirmedHttpStatus(status) ? 'http-other' : 'other';
    }
    if (value === 'http-unknown' || value === 'network-error') return 'network';
    if (value === 'timeout') return 'timeout';
    if (value === 'non-json') return 'non-json';
    if (value === 'invalid-json') return 'invalid-json';
    if (value === 'unexpected-shape') return 'unexpected-shape';
    if (value === 'graphql-error') return 'graphql';
    if (value === 'transform-error') return 'transform';
    if (value === 'fetch-parse-error') return 'parse';
    if (value === 'empty') return 'empty';
    return 'other';
}

function setMelodixHomeDecision(reason, details) {
    const state = details || {};
    const requestedMode = String(window.SF_CONFIG && window.SF_CONFIG.guiMode || 'missing');
    const guiMode = MELODIX_HOME_MODES.has(requestedMode) ? requestedMode : 'other';
    const route = safeMelodixHomeRoute();
    const screen = route === 'home' ? 'home' : 'other';
    const rawRoot = String(state.rootSelector || window.__sfMelodixHomeRootSelector || 'none');
    const rootPresent = typeof state.rootPresent === 'boolean'
        ? (state.rootPresent ? '1' : '0')
        : rawRoot !== '' && rawRoot !== 'none' ? '1' : 'unknown';
    const sessionProven = typeof state.sessionProven === 'boolean' ? state.sessionProven : null;
    const proofState = safeMelodixHomeProofState();
    const libraryError = safeMelodixHomeLibraryError();
    const rawLibraryStatus = String(state.libraryStatus || window.__sfMediaLibStatus || 'absent');
    const libraryStatus = ['absent', 'pending', 'loading', 'ready', 'error'].includes(rawLibraryStatus)
        ? rawLibraryStatus : 'other';
    const cardCount = Number.isFinite(Number(state.cardCount))
        ? Math.max(0, Math.min(999, Math.floor(Number(state.cardCount)))) : 0;
    const sectionCount = Number.isFinite(Number(state.sectionCount))
        ? Math.max(0, Math.min(999, Math.floor(Number(state.sectionCount)))) : 0;
    const decision = String(reason || 'unknown').slice(0, 40);
    const signature = [decision, guiMode, route, state.stylesReady ? '1' : '0', rootPresent].join('|');
    window.__sfMelodixHomeGuiMode = guiMode;
    // Only normalized route categories are exposed; Spotify IDs and paths stay
    // in memory for rendering and are never sent to the diagnostic sink.
    window.__sfMelodixHomeRoute = screen;
    window.__sfMelodixHomeStylesReady = Boolean(state.stylesReady);
    window.__sfMelodixHomeSourceCardCount = cardCount;
    window.__sfMelodixHomeSectionCount = sectionCount;
    window.__sfMelodixHomeSessionProven = sessionProven;
    window.__sfMelodixHomeProofState = proofState;
    window.__sfMelodixHomeLibraryStatus = libraryStatus;
    window.__sfMelodixHomeLibraryError = libraryError;
    window.__sfMelodixHomeDecision = decision;
    if (signature !== lastHomeDecisionSignature) {
        lastHomeDecisionSignature = signature;
        traceMelodixHome('home-web decision=' + decision +
            ' mode=' + guiMode + ' route=' + route +
            ' styles=' + (state.stylesReady ? '1' : '0') +
            ' root=' + rootPresent);
    }
}

function deactivateMelodixHome() {
    if (document.body) document.body.classList.remove(MELODIX_HOME_ACTIVE_CLASS);
    const home = document.getElementById('sf-melodix-home');
    if (home) home.remove();
    traceHomeNode(document.getElementById('sf-melodix-home'), false, home ? 'remove' : 'none');
    const sourceRoot = window._sfMelodixHomeSourceRoot;
    if (sourceRoot && typeof sourceRoot.removeAttribute === 'function') {
        sourceRoot.removeAttribute('data-sf-melodix-source-root');
    }
    window._sfMelodixHomeSourceRoot = null;
    window._sfMelodixHomeSignature = '';
    traceHomeFinal();
}

function scheduleMelodixHomeUpdate() {
    if (window._sfMelodixHomeTimer != null) return;
    window._sfMelodixHomeTimer = window.setTimeout(() => {
        window._sfMelodixHomeTimer = null;
        updateMelodixHome();
    }, 80);
}

function observeMelodixHomeDom() {
    if (!document.body || window._sfMelodixHomeObserver || typeof MutationObserver !== 'function') return;
    window._sfMelodixHomeObserver = new MutationObserver(scheduleMelodixHomeUpdate);
    // Keep watching the body, not only the first #main-view instance: the
    // Spotify SPA can replace that node during a route transition.
    window._sfMelodixHomeObserver.observe(document.body, { childList: true, subtree: true });
}

function observeMelodixHomeStyles() {
    const target = document.head || document.documentElement;
    if (!target || window._sfMelodixHomeStyleObserver || typeof MutationObserver !== 'function') return;
    window._sfMelodixHomeStyleObserver = new MutationObserver(() => {
        const style = document.getElementById('sf-custom-style');
        if (style && String(style.textContent || '').indexOf(MELODIX_HOME_STYLE_MARKER) >= 0) {
            scheduleMelodixHomeUpdate();
        }
    });
    window._sfMelodixHomeStyleObserver.observe(target, { childList: true, subtree: true, characterData: true });
}

function melodixHomeStylesPresent() {
    const style = document.getElementById('sf-custom-style');
    return Boolean(style && String(style.textContent || '').indexOf(MELODIX_HOME_STYLE_MARKER) >= 0);
}

function melodixHomeStylesReady(mainView, home) {
    const result = {
        marker_present: melodixHomeStylesPresent(),
        computed_style_available: typeof window.getComputedStyle === 'function' && Boolean(home),
        home_display_flex: false,
        home_position_fixed: false,
        home_visibility_visible: false,
        home_opacity_nonzero: false,
        home_z_index_high: false,
        main_hidden: false,
        probe_error: false
    };
    if (!result.marker_present || !result.computed_style_available) {
        window.__sfMelodixHomeStyleProbeResult = result;
        traceHomeCss(result, false);
        return false;
    }

    const wasActive = document.body.classList.contains(MELODIX_HOME_ACTIVE_CLASS);
    let homeStyle;
    let mainStyle;
    try {
        document.body.classList.remove(MELODIX_HOME_ACTIVE_CLASS);
        document.body.classList.add(MELODIX_HOME_STYLE_PROBE_CLASS);
        homeStyle = window.getComputedStyle(home);
        mainStyle = mainView ? window.getComputedStyle(mainView) : null;
        // getComputedStyle may return live declarations. Snapshot each required
        // value while the temporary probe class is still applied.
        const zIndex = Number.parseInt(homeStyle && homeStyle.zIndex || '0', 10) || 0;
        result.home_display_flex = Boolean(homeStyle && homeStyle.display === 'flex');
        result.home_position_fixed = Boolean(homeStyle && homeStyle.position === 'fixed');
        result.home_visibility_visible = Boolean(homeStyle && homeStyle.visibility === 'visible');
        result.home_opacity_nonzero = Boolean(homeStyle && homeStyle.opacity !== '0');
        result.home_z_index_high = zIndex >= 1000;
        result.main_hidden = !mainView || Boolean(mainStyle && mainStyle.display === 'none');
    } catch (_) {
        result.probe_error = true;
        window.__sfMelodixHomeStyleProbeResult = result;
        traceHomeCss(result, false);
        return false;
    } finally {
        document.body.classList.remove(MELODIX_HOME_STYLE_PROBE_CLASS);
        if (wasActive) document.body.classList.add(MELODIX_HOME_ACTIVE_CLASS);
    }
    window.__sfMelodixHomeStyleProbeResult = result;
    const ready = Boolean(
        result.home_display_flex && result.home_position_fixed && result.home_visibility_visible &&
        result.home_opacity_nonzero && result.main_hidden && result.home_z_index_high
    );
    traceHomeCss(result, ready);
    return ready;
}

function melodixHomeLibraryHasEntries() {
    const library = window.mediaLib;
    return Boolean(library && ['playlists', 'albums', 'artists', 'podcasts'].some((key) =>
        Array.isArray(library[key]) && library[key].length > 0
    ));
}

function melodixHomeStatusState(hasRenderableData) {
    const libraryStatus = String(window.__sfMediaLibStatus || 'pending');
    const nativeState = String(window.__sfNativeUiHomeState || '');
    if (libraryStatus === 'loading' || libraryStatus === 'pending') return 'loading';
    if (libraryStatus === 'error') return 'error';
    if (libraryStatus === 'ready' || nativeState === 'empty') {
        // A settled response containing entries that the renderer could not
        // turn into real Spotify resources is a collection/rendering error,
        // not proof that the account is empty.
        const rawItemCount = Number(window.__sfMediaLibRawItemCount || 0);
        return !hasRenderableData && (melodixHomeLibraryHasEntries() ||
            (Number.isFinite(rawItemCount) && rawItemCount > 0)) ? 'error' : 'empty';
    }
    if (nativeState === 'error' || nativeState === 'unavailable') return 'error';
    return 'loading';
}

function melodixHomeErrorKind() {
    const error = String(window.__sfMediaLibError || '').toLowerCase();
    if (error === 'http-401' && melodixHomeHasConfirmedHttpStatus(401)) return 'request-rejected';
    if (error === 'http-403' && melodixHomeHasConfirmedHttpStatus(403)) return 'access-denied';
    if (error === 'http-429' && melodixHomeHasConfirmedHttpStatus(429)) return 'rate-limit';
    const serverStatus = /^http-5[0-9]{2}$/.test(error) ? Number(error.slice(5)) : 0;
    if (serverStatus && melodixHomeHasConfirmedHttpStatus(serverStatus)) return 'server';
    return 'network';
}

function melodixHomeStatusMessage(labels) {
    const kind = melodixHomeErrorKind();
    if (kind === 'request-rejected') return labels.requestError;
    if (kind === 'access-denied') return labels.accessError;
    if (kind === 'rate-limit') return labels.rateLimitError;
    if (kind === 'server') return labels.serverError;
    return labels.networkError;
}

function retryMelodixHomeLibrary() {
    let result;
    try {
        if (typeof window.__sfNativeRetryLibrary === 'function') {
            result = window.__sfNativeRetryLibrary();
        } else if (typeof window.checkMediaLib === 'function') {
            result = window.checkMediaLib(true, 'web-home-retry');
        } else {
            window.location.reload();
            return;
        }
    } catch (_) {
        scheduleMelodixHomeUpdate();
        return;
    }
    if (result && typeof result.then === 'function') {
        result.then(scheduleMelodixHomeUpdate, scheduleMelodixHomeUpdate);
    } else {
        scheduleMelodixHomeUpdate();
    }
}

function renderMelodixHomeStatus(state, labels, hasPartialData, showRetry) {
    const status = document.createElement('section');
    status.className = `sf-melodix-home__status sf-melodix-home__status--${state}`;
    status.setAttribute('data-state', state);
    status.setAttribute('aria-live', state === 'error' ? 'assertive' : 'polite');
    status.setAttribute('role', state === 'error' ? 'alert' : 'status');

    const title = document.createElement('h2');
    title.className = 'sf-melodix-home__status-title';
    title.textContent = state === 'loading' ? labels.loadingTitle :
        state === 'empty' ? labels.emptyTitle :
        hasPartialData ? labels.partialErrorTitle || labels.errorTitle : labels.errorTitle;
    status.appendChild(title);

    const body = document.createElement('p');
    body.className = 'sf-melodix-home__status-body';
    body.textContent = state === 'loading' ? labels.loadingBody :
        state === 'empty' ? labels.emptyBody : melodixHomeStatusMessage(labels);
    status.appendChild(body);

    if (state === 'error' || showRetry) {
        const retry = document.createElement('button');
        retry.type = 'button';
        retry.className = 'sf-melodix-home__retry';
        retry.textContent = labels.retry;
        retry.setAttribute('data-action', 'retry-library');
        retry.addEventListener('click', retryMelodixHomeLibrary);
        status.appendChild(retry);
    }
    return status;
}

function renderMelodixHomeCard(card) {
    const button = document.createElement('button');
    button.type = 'button';
    button.className = 'sf-melodix-home__card';
    button.setAttribute('aria-label', card.subtitle ? `${card.title}, ${card.subtitle}` : card.title);

    if (card.image) {
        const image = document.createElement('img');
        image.className = 'sf-melodix-home__artwork';
        image.src = card.image;
        image.alt = '';
        image.loading = 'lazy';
        button.appendChild(image);
    }

    const title = document.createElement('span');
    title.className = 'sf-melodix-home__title';
    title.textContent = card.title;
    button.appendChild(title);

    if (card.subtitle) {
        const subtitle = document.createElement('span');
        subtitle.className = 'sf-melodix-home__subtitle';
        subtitle.textContent = card.subtitle;
        button.appendChild(subtitle);
    }

    button.addEventListener('click', () => {
        if (card.sourceAnchor && (card.sourceAnchor.isConnected || document.contains(card.sourceAnchor))) {
            card.sourceAnchor.click();
        } else {
            window.location.assign(card.href);
        }
    });
    return button;
}

function updateMelodixHome() {
    window.__sfMelodixHomeInitAttempted = true;
    const routeCategory = safeMelodixHomeRoute();
    const guiMode = String(window.SF_CONFIG && window.SF_CONFIG.guiMode || 'missing');
    if (!document.body) {
        traceHomeGuard('body', false);
        setMelodixHomeDecision('body-missing', { route: routeCategory });
        traceHomeFinal();
        return;
    }
    traceHomeGuard('body', true);
    if (!isMelodixHomeRoute()) {
        traceHomeGuard('route', false);
        deactivateMelodixHome();
        setMelodixHomeDecision('route-not-home', { route: routeCategory });
        return;
    }
    traceHomeGuard('route', true);
    if (!MELODIX_HOME_MODES.has(guiMode)) {
        traceHomeGuard('gui-mode', false);
        deactivateMelodixHome();
        setMelodixHomeDecision('gui-mode-unsupported', { route: routeCategory });
        return;
    }
    traceHomeGuard('gui-mode', true);
    const fullscreenOpen = document.body.classList.contains('sf-fs-open');
    traceHomeGuard('fullscreen', !fullscreenOpen);
    if (fullscreenOpen) {
        deactivateMelodixHome();
        setMelodixHomeDecision('fullscreen-open', { route: routeCategory });
        return;
    }

    const mainView = findMelodixHomeContentRoot();
    observeMelodixHomeDom();
    observeMelodixHomeStyles();
    const sessionProven = melodixHomeHasSessionEvidence();
    traceHomeGuard('session', sessionProven);
    if (!sessionProven) {
        deactivateMelodixHome();
        // Keep the diagnostic decision neutral: proof is an internal rendering
        // guard, not an instrumentation or CI output.
        setMelodixHomeDecision('renderer-inactive', {
            route: routeCategory, rootSelector: window.__sfMelodixHomeRootSelector || 'none',
            rootPresent: Boolean(mainView), sessionProven: false,
            libraryStatus: window.__sfMediaLibStatus || 'absent'
        });
        return;
    }

    markMelodixHomeSourceRoot(mainView);
    let homeSections = [];
    const seenResources = new Set();
    if (mainView) homeSections = collectMelodixHomeSections(mainView, seenResources);
    const librarySections = collectMelodixHomeLibrarySections(seenResources);
    const sections = homeSections.concat(librarySections);
    const itemCount = sections.reduce((count, section) => count + section.cards.length, 0);
    const libraryStatus = String(window.__sfMediaLibStatus || 'pending');
    const statusState = melodixHomeStatusState(itemCount > 0);
    const hasPartialData = itemCount > 0 && statusState === 'error';
    const showStatus = itemCount === 0 || hasPartialData;
    const showRetry = statusState === 'error' ||
        (statusState === 'loading' && ['absent', 'pending'].includes(libraryStatus));
    let rawAnchorCount = 0;
    try {
        rawAnchorCount = mainView ? mainView.querySelectorAll(MELODIX_HOME_LINK_SELECTOR).length : 0;
    } catch (_) {}
    window.__sfMelodixHomeRawAnchorCount = Math.min(rawAnchorCount, 999);

    let home = document.getElementById('sf-melodix-home');
    const isNewHome = !home;
    if (!home) {
        home = document.createElement('main');
        home.id = 'sf-melodix-home';
        home.className = 'sf-melodix-home';
        home.setAttribute('aria-label', 'Melodix');
        document.body.appendChild(home);
        traceHomeNode(home, true, 'create');
    }
    const stylesReady = melodixHomeStylesReady(mainView, home);
    traceHomeGuard('activation', stylesReady);
    const decisionDetails = {
        route: routeCategory,
        cardCount: itemCount,
        sectionCount: sections.length,
        rootSelector: window.__sfMelodixHomeRootSelector || 'none',
        rootPresent: Boolean(mainView),
        sessionProven,
        libraryStatus
    };
    if (!stylesReady) {
        deactivateMelodixHome();
        setMelodixHomeDecision('styles-not-ready', { ...decisionDetails, stylesReady: false });
        traceHomeFinal();
        return;
    }

    const signature = JSON.stringify({
        sections: sections.map((section) => ({
            title: section.title,
            cards: section.cards.map((card) => [card.resourcePath, card.title, card.subtitle, card.image])
        })),
        status: showStatus ? statusState : '',
        partial: hasPartialData,
        retry: showStatus && showRetry
    });
    if (window._sfMelodixHomeSignature === signature && document.body.classList.contains(MELODIX_HOME_ACTIVE_CLASS)) {
        setMelodixHomeDecision(itemCount ? 'visible' : `status-visible-${statusState}`, {
            ...decisionDetails, stylesReady: true
        });
        const unchangedCards = home.querySelectorAll('.sf-melodix-home__card').length;
        traceHomeNode(home, false, 'render');
        traceMelodixHome('home-data stage=web-rendered');
        traceHomeFinal();
        return;
    }

    const labels = melodixHomeCopy();
    const globalNav = document.querySelector('#global-nav-bar');
    const navVisible = Boolean(globalNav && window.getComputedStyle(globalNav).display !== 'none');
    const navBottom = navVisible ? Math.max(0, globalNav.getBoundingClientRect().bottom) : 0;
    home.style.setProperty('--sf-melodix-home-top', `${Math.ceil(navBottom)}px`);
    home.style.setProperty('--sf-melodix-home-extra-safe-top', navVisible ? '0px' : 'env(safe-area-inset-top)');

    const header = document.createElement('header');
    header.className = 'sf-melodix-home__header';
    const brand = document.createElement('p');
    brand.className = 'sf-melodix-home__brand';
    brand.textContent = 'MELODIX';
    const greeting = document.createElement('h1');
    greeting.textContent = labels.greeting;
    header.append(brand, greeting);
    const fragment = document.createDocumentFragment();
    fragment.appendChild(header);

    sections.forEach((section) => {
        const sectionElement = document.createElement('section');
        sectionElement.className = 'sf-melodix-home__section';
        const heading = document.createElement('h2');
        heading.className = 'sf-melodix-home__section-title';
        heading.textContent = section.title || labels.discover;
        sectionElement.appendChild(heading);

        const cards = document.createElement('div');
        cards.className = 'sf-melodix-home__cards';
        section.cards.forEach((card) => cards.appendChild(renderMelodixHomeCard(card)));
        sectionElement.appendChild(cards);
        fragment.appendChild(sectionElement);
    });
    if (showStatus) fragment.appendChild(renderMelodixHomeStatus(statusState, labels, hasPartialData, showRetry));
    home.replaceChildren(fragment);
    window._sfMelodixHomeSignature = signature;
    document.body.classList.add(MELODIX_HOME_ACTIVE_CLASS);

    let renderedVisible = false;
    try {
        const computedHome = window.getComputedStyle(home);
        const computedMain = mainView ? window.getComputedStyle(mainView) : null;
        renderedVisible = computedHome.display === 'flex' && computedHome.position === 'fixed' &&
            computedHome.visibility === 'visible' && computedHome.opacity !== '0' &&
            (!mainView || Boolean(computedMain && computedMain.display === 'none'));
    } catch (_) {}
    traceHomeGuard('activation', renderedVisible);
    traceHomeNode(home, isNewHome, 'render');
    if (!renderedVisible) {
        deactivateMelodixHome();
        setMelodixHomeDecision('activation-visibility-check-failed', {
            ...decisionDetails, stylesReady: false
        });
        traceHomeFinal();
        return;
    }
    window.__sfMelodixHomeStylesReady = true;
    const renderDecision = itemCount === 0
        ? `rendered-status-${statusState}`
        : hasPartialData ? 'rendered-partial' : isNewHome ? 'rendered' : 'updated';
    setMelodixHomeDecision(renderDecision, { ...decisionDetails, stylesReady: true });
    traceMelodixHome('home-data stage=web-rendered');
    traceHomeFinal();
}

function instrumentMelodixHomeHistory() {
    if (window._sfMelodixHomeHistoryInstrumented) return;
    window._sfMelodixHomeHistoryInstrumented = true;
    const history = window.history;
    ['pushState', 'replaceState'].forEach((method) => {
        if (!history || typeof history[method] !== 'function') return;
        const original = history[method];
        const wrapped = function() {
            const result = original.apply(this, arguments);
            scheduleMelodixHomeUpdate();
            return result;
        };
        try {
            history[method] = wrapped;
        } catch (_) {}
    });
}

function initializeMelodixHome() {
    if (window._sfMelodixHomeListenersAttached) return;
    window._sfMelodixHomeListenersAttached = true;
    window.__sfMelodixHomeInitAttempted = true;
    window.addEventListener('popstate', scheduleMelodixHomeUpdate);
    window.addEventListener('hashchange', scheduleMelodixHomeUpdate);
    window.addEventListener('resize', scheduleMelodixHomeUpdate);
    window.addEventListener('load', scheduleMelodixHomeUpdate, { once: true });
    document.addEventListener('click', (event) => {
        if (event.target && event.target.closest && event.target.closest(
            '#global-nav-bar [data-testid="home-button"], #sf-mobile-nav [data-sf-mobile-action="home"], #sf-melodix-home .sf-melodix-home__card'
        )) scheduleMelodixHomeUpdate();
    });
    document.addEventListener('DOMContentLoaded', () => {
        observeMelodixHomeDom();
        observeMelodixHomeStyles();
        scheduleMelodixHomeUpdate();
    }, { once: true });
    window.addEventListener('sf-melodix-home-styles-ready', scheduleMelodixHomeUpdate);
    window.addEventListener('sf-native-ui-session-proof-changed', scheduleMelodixHomeUpdate);
    window.addEventListener('sf-media-library-state-changed', scheduleMelodixHomeUpdate);
    instrumentMelodixHomeHistory();
    observeMelodixHomeDom();
    observeMelodixHomeStyles();
    updateMelodixHome();
}

    if (window.__sfMelodixHomeTestMode === true) {
        window.__sfHomeTest = {
            initializeMelodixHome: initializeMelodixHome,
            updateMelodixHome: updateMelodixHome,
            collectMelodixHomeSections: collectMelodixHomeSections,
            melodixHomeRoutePath: melodixHomeRoutePath
        };
    }
    try {
        initializeMelodixHome();
    } catch (error) {
        window.__sfMelodixHomeInitErrors = (window.__sfMelodixHomeInitErrors || 0) + 1;
        traceMelodixHome('home-web bootstrap-error ' + String(error && error.name || 'unknown').slice(0, 40));
    }
})();

/* MEL-BUG-068: greeting fallback — while no session is proven, the home title
   still shows a greeting so the connection state is visible at a glance.
   When a real session is proven, the shell sends the real "Bonjour, <pseudo>"
   and this fallback stays silent. No secret material is
   ever read or sent here. */
;(function () {
    function greetingPrefix() {
        var h = new Date().getHours();
        if (h >= 6 && h < 18) return 'Bonjour';
        if (h >= 18 && h < 23) return 'Bonsoir';
        return 'Bonne nuit';
    }
    function tick() {
        try {
            var bridge = window.AndBridge;
            if (!bridge || typeof bridge.onNativeUiData !== 'function') return;
            if (String(window.__sfNativeUiRoute || '') !== 'home') return;
            var auth = String(window.__sfNativeUiHomeAuthState || '');
            if (auth === 'connected') { window.__sfHomeFallbackGreetingSent = false; return; }
            if (window.__sfHomeFallbackGreetingSent) return;
            window.__sfHomeFallbackGreetingSent = true;
            bridge.onNativeUiData('home-greeting',
                greetingPrefix() + ', invité — non connecté (connectez-vous à Spotify)');
        } catch (_) {}
    }
    if (typeof window.setInterval === 'function') window.setInterval(tick, 5000);
    tick();
})();
