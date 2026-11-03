(() => {
  const SAMPLE_DELAYS_MS = Object.freeze([0, 3000, 8000, 20000]);
  const MAX_ADDED_NODES = 10000;
  const stateKey = '__melodixRuntimeDiagnosticV2';

  if (
    !window.location
    || window.location.protocol !== 'https:'
    || window.location.hostname !== 'open.spotify.com'
    || (window.location.port && window.location.port !== '443')
  ) {
    return null;
  }

  if (window[stateKey]) return false;

  const startedAt = performance.now();
  const body = document.body;
  const state = {
    samples: [],
    complete: false,
    mutations: {
      addedNodeCount: 0,
      addedNodeCountCapped: false,
      firstAddedIdentityPresence: [],
      observerStopped: true
    }
  };
  window[stateKey] = state;

  const safeIdentifier = (value) => {
    if (typeof value !== 'string' || value.length === 0 || value.length > 128) return null;
    if (!/^[A-Za-z0-9_.:-]+$/.test(value)) return null;
    if (/(token|cookie|bearer|authorization|secret)/i.test(value)) return null;
    return value;
  };

  const safeHomeDecision = (value) => {
    const allowed = [
      'body-missing', 'route-not-home', 'gui-mode-unsupported', 'fullscreen-open',
      'renderer-inactive', 'styles-not-ready', 'visible', 'activation-visibility-check-failed',
      'home-root-missing', 'initialization-error', 'rendered', 'rendered-partial', 'updated',
      'status-visible-loading', 'status-visible-empty', 'status-visible-error',
      'status-visible-partial', 'status-visible-ready', 'rendered-status-loading',
      'rendered-status-empty', 'rendered-status-error', 'rendered-status-unavailable'
    ];
    return typeof value === 'string' && allowed.includes(value) ? value : null;
  };

  // Record only whether identifiers exist. Spotify IDs and test IDs may
  // contain account-specific resource identifiers, so their values never
  // leave the page through this diagnostic.
  const recordAddedNodeIdentityPresence = (node) => {
    if (node.nodeType !== 1 || state.mutations.firstAddedIdentityPresence.length >= 10) return;

    const hasId = typeof node.id === 'string' && node.id.length > 0;
    let hasTestId = false;
    try {
      hasTestId = typeof node.getAttribute === 'function' &&
        typeof node.getAttribute('data-testid') === 'string' &&
        node.getAttribute('data-testid').length > 0;
    } catch (_) {}
    if (!hasId && !hasTestId) return;

    state.mutations.firstAddedIdentityPresence.push({ hasId, hasTestId });
  };

  const countAddedSubtree = (rootNode) => {
    const pending = [rootNode];
    while (pending.length > 0) {
      const node = pending.pop();
      if (!node) continue;
      if (state.mutations.addedNodeCount >= MAX_ADDED_NODES) {
        state.mutations.addedNodeCountCapped = true;
        return;
      }

      state.mutations.addedNodeCount += 1;
      recordAddedNodeIdentityPresence(node);

      const children = node.childNodes;
      if (children) {
        for (let index = children.length - 1; index >= 0; index -= 1) {
          pending.push(children[index]);
        }
      }
    }
  };

  let observer = null;
  if (body && typeof MutationObserver === 'function') {
    observer = new MutationObserver((records) => {
      for (const record of records) {
        for (const node of record.addedNodes) {
          if (state.mutations.addedNodeCount >= MAX_ADDED_NODES) {
            state.mutations.addedNodeCountCapped = true;
            return;
          }
          countAddedSubtree(node);
        }
      }
    });
    observer.observe(body, { childList: true, subtree: true });
    state.mutations.observerStopped = false;
  }

  const summarizeRuntimeUserAgent = () => {
    const userAgent = typeof navigator.userAgent === 'string' ? navigator.userAgent : '';
    const chromeMatch = /\bChrome\/(\d{1,3})(?:\.\d+)?/i.exec(userAgent);
    const isWebView = /;\s*wv\)|Version\/\d+\.\d+\s+Chrome\//i.test(userAgent);
    return {
      family: isWebView ? 'android-webview' : /Android/i.test(userAgent) ? 'android-browser' : 'other',
      chromiumMajor: chromeMatch ? Number(chromeMatch[1]) : null
    };
  };

  const safeBodyClasses = () => {
    const allowed = [
      'sf-mobile-shell',
      'sf-library-open',
      'sf-guest',
      'sf-expanded',
      'sf-melodix-home-active'
    ];
    if (!body || !body.classList || typeof body.classList.contains !== 'function') return [];
    return allowed.filter((className) => body.classList.contains(className));
  };

  const finiteMetric = (value, minimum = -10000, maximum = 10000) => {
    if (value === null || typeof value === 'undefined') return null;
    let number;
    try { number = Number(value); } catch (_) { return null; }
    if (!Number.isFinite(number)) return null;
    return Math.max(minimum, Math.min(maximum, Math.round(number * 100) / 100));
  };

  const cssPixelValue = (value) => {
    if (typeof value !== 'string') return null;
    const match = /^\s*(-?\d+(?:\.\d+)?)px\s*$/i.exec(value);
    return match ? finiteMetric(Number(match[1])) : null;
  };

  const readComputedStyle = (element) => {
    if (!element || typeof window.getComputedStyle !== 'function') return null;
    try {
      return window.getComputedStyle(element);
    } catch (_) {
      return null;
    }
  };

  const safeStyleSummary = (style) => {
    if (!style) return null;
    const enumValue = (value, allowed) => allowed.indexOf(String(value || '').toLowerCase()) >= 0
      ? String(value).toLowerCase()
      : 'other';
    const rawZ = String(style.zIndex || '').trim();
    const numericZ = /^-?\d+$/.test(rawZ) ? finiteMetric(Number(rawZ), -100000, 100000) : null;
    return {
      display: enumValue(style.display, ['none', 'block', 'inline', 'inline-block', 'flex', 'grid', 'contents', 'table']),
      position: enumValue(style.position, ['static', 'relative', 'absolute', 'fixed', 'sticky']),
      zIndex: rawZ === 'auto' ? 'auto' : numericZ,
      opacity: finiteMetric(style.opacity, 0, 1),
      visibility: enumValue(style.visibility, ['visible', 'hidden', 'collapse']),
      pointerEvents: enumValue(style.pointerEvents, ['auto', 'none']),
      overflowX: enumValue(style.overflowX, ['visible', 'hidden', 'clip', 'scroll', 'auto']),
      overflowY: enumValue(style.overflowY, ['visible', 'hidden', 'clip', 'scroll', 'auto']),
      boxSizing: enumValue(style.boxSizing, ['content-box', 'border-box']),
      touchAction: enumValue(style.touchAction, ['auto', 'none', 'manipulation', 'pan-x', 'pan-y', 'pan-x pan-y'])
    };
  };

  const readBox = (element) => {
    if (!element || typeof element.getBoundingClientRect !== 'function') return null;
    try {
      const rect = element.getBoundingClientRect();
      return {
        left: finiteMetric(rect.left),
        top: finiteMetric(rect.top),
        right: finiteMetric(rect.right),
        bottom: finiteMetric(rect.bottom),
        width: finiteMetric(rect.width, 0, 10000),
        height: finiteMetric(rect.height, 0, 10000)
      };
    } catch (_) {
      return null;
    }
  };

  const readScrollMetrics = (element) => {
    if (!element) return null;
    const clientWidth = finiteMetric(element.clientWidth, 0, 10000);
    const clientHeight = finiteMetric(element.clientHeight, 0, 10000);
    const scrollWidth = finiteMetric(element.scrollWidth, 0, 20000);
    const scrollHeight = finiteMetric(element.scrollHeight, 0, 20000);
    return {
      clientWidth,
      clientHeight,
      scrollWidth,
      scrollHeight,
      scrollLeft: finiteMetric(element.scrollLeft),
      scrollTop: finiteMetric(element.scrollTop),
      horizontalOverflowPx: clientWidth === null || scrollWidth === null
        ? null
        : Math.max(0, scrollWidth - clientWidth),
      verticalOverflowPx: clientHeight === null || scrollHeight === null
        ? null
        : Math.max(0, scrollHeight - clientHeight)
    };
  };

  const readSurface = (selector) => {
    let element = null;
    try {
      element = document.querySelector(selector);
    } catch (_) {}
    if (!element) return { present: false, visible: false, box: null, scroll: null, style: null };
    const style = readComputedStyle(element);
    const box = readBox(element);
    const opacity = style ? Number(style.opacity) : NaN;
    const visible = Boolean(
      style
      && style.display !== 'none'
      && style.visibility !== 'hidden'
      && style.visibility !== 'collapse'
      && Number.isFinite(opacity)
      && opacity > 0
      && box
      && box.width > 0
      && box.height > 0
    );
    const width = finiteMetric(window.innerWidth, 0, 10000);
    const height = finiteMetric(window.innerHeight, 0, 10000);
    const inViewport = box && width !== null && height !== null
      ? box.right > 0 && box.bottom > 0 && box.left < width && box.top < height
      : null;
    return {
      present: true,
      visible,
      inViewport,
      box,
      scroll: readScrollMetrics(element),
      style: safeStyleSummary(style)
    };
  };

  const intersectingPixels = (left, right, axis) => {
    if (!left || !right) return null;
    const startKey = axis === 'x' ? 'left' : 'top';
    const endKey = axis === 'x' ? 'right' : 'bottom';
    if (left[startKey] === null || left[endKey] === null || right[startKey] === null || right[endKey] === null) {
      return null;
    }
    return Math.max(0, Math.min(left[endKey], right[endKey]) - Math.max(left[startKey], right[startKey]));
  };

  const classifyHitOwner = (element) => {
    if (!element) return 'none';
    const matchesOrClosest = (selector) => {
      try {
        if (typeof element.closest === 'function' && element.closest(selector)) return true;
        return typeof element.matches === 'function' && element.matches(selector);
      } catch (_) {
        return false;
      }
    };
    if (matchesOrClosest('#sf-fs-player')) return 'fullscreen-player';
    if (matchesOrClosest('#sf-mobile-nav')) return 'mobile-navigation';
    if (matchesOrClosest('aside[data-testid="now-playing-bar"]')) return 'now-playing-bar';
    if (matchesOrClosest('#Desktop_LeftSidebar_Id')) return 'desktop-sidebar';
    if (matchesOrClosest('#sf-melodix-home')) return 'melodix-home';
    if (matchesOrClosest('#main-view')) return 'spotify-main';
    if (matchesOrClosest('#global-nav-bar')) return 'spotify-global-navigation';
    return 'other';
  };

  const hitOwnerAtCenter = (element, box) => {
    if (!element || !box || box.width <= 0 || box.height <= 0 || typeof document.elementFromPoint !== 'function') {
      return 'unavailable';
    }
    try {
      return classifyHitOwner(document.elementFromPoint(box.left + box.width / 2, box.top + box.height / 2));
    } catch (_) {
      return 'unavailable';
    }
  };

  const readViewportGeometry = () => {
    const visual = window.visualViewport || null;
    const orientationObject = window.screen && window.screen.orientation;
    const orientationType = orientationObject && typeof orientationObject.type === 'string'
      && ['portrait-primary', 'portrait-secondary', 'landscape-primary', 'landscape-secondary'].indexOf(orientationObject.type) >= 0
      ? orientationObject.type
      : 'unknown';
    let portrait = null;
    let landscape = null;
    if (typeof window.matchMedia === 'function') {
      try {
        portrait = Boolean(window.matchMedia('(orientation: portrait)').matches);
        landscape = Boolean(window.matchMedia('(orientation: landscape)').matches);
      } catch (_) {}
    }
    return {
      innerWidth: finiteMetric(window.innerWidth, 0, 10000),
      innerHeight: finiteMetric(window.innerHeight, 0, 10000),
      screenWidth: window.screen ? finiteMetric(window.screen.width, 0, 10000) : null,
      screenHeight: window.screen ? finiteMetric(window.screen.height, 0, 10000) : null,
      devicePixelRatio: finiteMetric(window.devicePixelRatio, 0, 16),
      orientation: orientationType,
      portrait,
      landscape,
      visualViewport: visual ? {
        width: finiteMetric(visual.width, 0, 10000),
        height: finiteMetric(visual.height, 0, 10000),
        offsetLeft: finiteMetric(visual.offsetLeft),
        offsetTop: finiteMetric(visual.offsetTop),
        pageLeft: finiteMetric(visual.pageLeft),
        pageTop: finiteMetric(visual.pageTop),
        scale: finiteMetric(visual.scale, 0, 16)
      } : null
    };
  };

  const readSafeAreaGeometry = (mobileNavigation, player) => {
    const root = document.documentElement || null;
    const rootStyle = readComputedStyle(root);
    let viewportFitCover = false;
    let topCustomInset = null;
    try {
      const viewport = document.querySelector('meta[name="viewport"]');
      const content = viewport && typeof viewport.getAttribute === 'function'
        ? String(viewport.getAttribute('content') || '')
        : '';
      viewportFitCover = /(?:^|,)\s*viewport-fit\s*=\s*cover(?:\s*,|$)/i.test(content);
    } catch (_) {}
    try {
      const inlineStyle = root && root.style;
      const inlineValue = inlineStyle && typeof inlineStyle.getPropertyValue === 'function'
        ? inlineStyle.getPropertyValue('--sf-safe-area-top')
        : '';
      const computedValue = rootStyle && typeof rootStyle.getPropertyValue === 'function'
        ? rootStyle.getPropertyValue('--sf-safe-area-top')
        : '';
      topCustomInset = cssPixelValue(String(inlineValue || computedValue || '').trim());
    } catch (_) {}
    const navStyle = mobileNavigation ? readComputedStyle(mobileNavigation) : null;
    const playerStyle = player ? readComputedStyle(player) : null;
    const navBox = readBox(mobileNavigation);
    return {
      viewportFitCover,
      topCustomInsetCssPx: topCustomInset,
      mobileNavigationPaddingTopCssPx: navStyle ? cssPixelValue(String(navStyle.paddingTop || '')) : null,
      mobileNavigationPaddingBottomCssPx: navStyle ? cssPixelValue(String(navStyle.paddingBottom || '')) : null,
      mobileNavigationBottomGapCssPx: navBox && finiteMetric(window.innerHeight, 0, 10000) !== null
        ? finiteMetric(window.innerHeight - navBox.bottom)
        : null,
      mobileNavigationBottomInsetInferredCssPx: navBox && navBox.height !== null
        ? finiteMetric(Math.max(0, navBox.height - 72), 0, 200)
        : null,
      playerBottomGapCssPx: (() => {
        const box = readBox(player);
        const height = finiteMetric(window.innerHeight, 0, 10000);
        return box && height !== null ? finiteMetric(height - box.bottom) : null;
      })(),
      playerPaddingBottomCssPx: playerStyle ? cssPixelValue(String(playerStyle.paddingBottom || '')) : null
    };
  };

  const readLayoutGeometry = () => {
    const selectors = {
      globalNavigation: '#global-nav-bar',
      desktopSidebar: '#Desktop_LeftSidebar_Id',
      spotifyMain: '#main-view',
      melodixHome: '#sf-melodix-home',
      mobileNavigation: '#sf-mobile-nav',
      nowPlayingBar: 'aside[data-testid="now-playing-bar"]',
      fullscreenPlayer: '#sf-fs-player',
      playPauseControl: 'aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]'
    };
    const surfaces = {};
    Object.keys(selectors).forEach((key) => { surfaces[key] = readSurface(selectors[key]); });
    const navigationElement = document.querySelector(selectors.mobileNavigation);
    const playerElement = document.querySelector(selectors.nowPlayingBar);
    const navigationBox = surfaces.mobileNavigation.box;
    const playerBox = surfaces.nowPlayingBar.box;
    const homeBox = surfaces.melodixHome.box;
    const actionHitTargets = [];
    if (navigationElement && typeof navigationElement.querySelectorAll === 'function') {
      try {
        const buttons = navigationElement.querySelectorAll('[data-sf-mobile-action]');
        for (let index = 0; index < buttons.length && index < 3; index += 1) {
          const button = buttons[index];
          const rawAction = typeof button.getAttribute === 'function'
            ? String(button.getAttribute('data-sf-mobile-action') || '')
            : '';
          const action = ['home', 'search', 'library'].indexOf(rawAction) >= 0 ? rawAction : 'other';
          const box = readBox(button);
          const owner = hitOwnerAtCenter(button, box);
          actionHitTargets.push({
            action,
            width: box ? box.width : null,
            height: box ? box.height : null,
            owner,
            reachable: owner === 'mobile-navigation'
          });
        }
      } catch (_) {}
    }
    let playPauseElement = null;
    let firstHomeCard = null;
    try {
      playPauseElement = document.querySelector(selectors.playPauseControl);
      firstHomeCard = document.querySelector('#sf-melodix-home .sf-melodix-home__card');
    } catch (_) {}
    const playPauseBox = readBox(playPauseElement);
    const homeCardBox = readBox(firstHomeCard);
    const documentElement = document.documentElement || null;
    const bodyScroll = readScrollMetrics(body);
    const documentScroll = readScrollMetrics(documentElement);
    const mainScroll = readScrollMetrics(document.querySelector(selectors.spotifyMain));
    const homeScroll = readScrollMetrics(document.querySelector(selectors.melodixHome));
    const sidebarScroll = readScrollMetrics(document.querySelector(selectors.desktopSidebar));
    const visualViewport = readViewportGeometry();
    return {
      viewport: visualViewport,
      safeArea: readSafeAreaGeometry(navigationElement, playerElement),
      surfaces,
      overlap: {
        navigationPlayerHorizontalPx: intersectingPixels(navigationBox, playerBox, 'x'),
        navigationPlayerVerticalPx: intersectingPixels(navigationBox, playerBox, 'y'),
        navigationPlayerIntersecting: (intersectingPixels(navigationBox, playerBox, 'x') || 0) > 0
          && (intersectingPixels(navigationBox, playerBox, 'y') || 0) > 0,
        homePlayerHorizontalPx: intersectingPixels(homeBox, playerBox, 'x'),
        homePlayerVerticalPx: intersectingPixels(homeBox, playerBox, 'y'),
        homePlayerIntersecting: (intersectingPixels(homeBox, playerBox, 'x') || 0) > 0
          && (intersectingPixels(homeBox, playerBox, 'y') || 0) > 0
      },
      scroll: {
        document: documentScroll,
        body: bodyScroll,
        spotifyMain: mainScroll,
        melodixHome: homeScroll,
        desktopSidebar: sidebarScroll
      },
      hitTargets: {
        mobileNavigation: actionHitTargets,
        playPause: {
          available: Boolean(playPauseElement),
          width: playPauseBox ? playPauseBox.width : null,
          height: playPauseBox ? playPauseBox.height : null,
          owner: hitOwnerAtCenter(playPauseElement, playPauseBox),
          reachable: hitOwnerAtCenter(playPauseElement, playPauseBox) === 'now-playing-bar'
        },
        firstHomeCard: {
          available: Boolean(firstHomeCard),
          width: homeCardBox ? homeCardBox.width : null,
          height: homeCardBox ? homeCardBox.height : null,
          owner: hitOwnerAtCenter(firstHomeCard, homeCardBox),
          reachable: hitOwnerAtCenter(firstHomeCard, homeCardBox) === 'melodix-home'
        }
      }
    };
  };

  const SHELL_ERROR_SOURCES = Object.freeze([
    'window-js', 'resource-script', 'resource-link', 'resource-image',
    'resource-iframe', 'resource-other', 'run-update', 'install', 'callback', 'promise'
  ]);
  const SHELL_ERROR_SCRIPTS = Object.freeze([
    'native-ui-shell', 'spotify-bridge', 'melodix-home', 'runtime-diagnostic',
    'external', 'inline', 'unknown'
  ]);
  const SHELL_ERROR_PHASES = Object.freeze([
    'uncaught', 'resource-load', 'run-update', 'install', 'bridge-callback', 'unhandled-rejection'
  ]);
  const SHELL_ERROR_CALLBACKS = Object.freeze([
    'none', 'unknown', 'promise', 'runUpdate', 'install',
    'onNativeUiData', 'onNativeUiRoute', 'onNativeUiReady'
  ]);
  const SHELL_ERROR_ROUTES = Object.freeze(['home', 'search', 'library', 'detail', 'settings', 'other']);
  const SHELL_ERROR_CLASSES = Object.freeze([
    'Error', 'TypeError', 'ReferenceError', 'SyntaxError', 'RangeError', 'URIError',
    'EvalError', 'SecurityError', 'NetworkError', 'AbortError', 'InvalidStateError',
    'NotSupportedError', 'QuotaExceededError', 'unknown'
  ]);
  const LIBRARY_CHECK_SOURCES = Object.freeze([
    'shell-update', 'native-retry', 'web-home-retry', 'settings-resync', 'unspecified'
  ]);

  const safeNativeUiShellErrorSources = () => {
    const raw = window.__sfNativeUiShellErrorSources;
    const safe = {};
    SHELL_ERROR_SOURCES.forEach((source) => {
      let count = NaN;
      try { count = Number(raw && raw[source]); } catch (_) {}
      safe[source] = Number.isInteger(count) ? Math.max(0, Math.min(9999, count)) : 0;
    });
    return safe;
  };

  const safeNativeUiShellErrorDetails = () => {
    let raw = [];
    try {
      raw = Array.isArray(window.__sfNativeUiShellErrorDetails)
        ? window.__sfNativeUiShellErrorDetails.slice(-8) : [];
    } catch (_) {}
    return raw.map((entry) => {
      const source = entry && SHELL_ERROR_SOURCES.includes(entry.source) ? entry.source : 'resource-other';
      const script = entry && SHELL_ERROR_SCRIPTS.includes(entry.script) ? entry.script : 'unknown';
      const phase = entry && SHELL_ERROR_PHASES.includes(entry.phase) ? entry.phase : 'uncaught';
      const rawType = entry && (entry.type || entry.name);
      const type = SHELL_ERROR_CLASSES.includes(rawType) ? rawType : 'unknown';
      const callback = entry && SHELL_ERROR_CALLBACKS.includes(entry.callback) ? entry.callback : 'unknown';
      const route = entry && SHELL_ERROR_ROUTES.includes(entry.route) ? entry.route : 'other';
      const coordinate = (value) => {
        const number = Number(value);
        return Number.isInteger(number) && number >= 1 && number <= 1000000 ? number : null;
      };
      const cycle = (value) => {
        if (value === null || typeof value === 'undefined') return null;
        const number = Number(value);
        return Number.isInteger(number) && number >= 0 && number <= 999999 ? number : null;
      };
      const repeatCount = Number(entry && entry.repeatCount);
      return {
        script,
        source,
        phase,
        type,
        name: type,
        callback,
        line: coordinate(entry && entry.line),
        column: coordinate(entry && entry.column),
        route,
        renderCycle: cycle(entry && entry.renderCycle),
        lastRenderCycle: cycle(entry && entry.lastRenderCycle),
        repeatCount: Number.isInteger(repeatCount) ? Math.max(1, Math.min(9999, repeatCount)) : 1
      };
    });
  };

  const safeLibraryFetchDiagnostic = () => {
    const diagnostic = window.__sfMediaLibLastDiagnostic;
    if (!diagnostic || typeof diagnostic !== 'object') return null;
    const phases = ['request', 'response', 'parse', 'transform', 'settle'];
    const mimes = ['json', 'html', 'other', 'missing'];
    const errors = ['none', 'empty', 'http-401', 'http-403', 'http-other', 'timeout', 'network',
      'non-json', 'invalid-json', 'unexpected-shape', 'graphql', 'parse', 'transform'];
    const rawAttempt = Number(diagnostic.attempt);
    const attempt = Number.isInteger(rawAttempt) && rawAttempt >= 0 && rawAttempt <= 999999 ? rawAttempt : 0;
    const source = LIBRARY_CHECK_SOURCES.indexOf(diagnostic.source) >= 0
      ? diagnostic.source : 'unspecified';
    const rawRequests = Number(diagnostic.requests);
    const requests = Number.isInteger(rawRequests) && rawRequests >= 0 && rawRequests <= 1000 ? rawRequests : 0;
    const rawHttp = Number(diagnostic.http);
    const http = Number.isInteger(rawHttp) && rawHttp >= 0 && rawHttp <= 599 ? rawHttp : 0;
    const rawDuration = Number(diagnostic.durationMs);
    const durationMs = Number.isFinite(rawDuration)
      ? Math.max(0, Math.min(999999, Math.floor(rawDuration))) : 0;
    const phase = phases.indexOf(diagnostic.phase) >= 0 ? diagnostic.phase : 'request';
    const mime = mimes.indexOf(diagnostic.mime) >= 0 ? diagnostic.mime : 'missing';
    let error = errors.indexOf(diagnostic.error) >= 0 ? diagnostic.error : 'other';
    if ((error === 'http-401' && (phase !== 'response' || http !== 401)) ||
        (error === 'http-403' && (phase !== 'response' || http !== 403))) error = 'http-other';
    return { attempt, source, requests, http, mime, phase, durationMs, error };
  };

  const collectSample = () => {
    const selectors = [
      '#global-nav-bar',
      '#Desktop_LeftSidebar_Id',
      '#main-view',
      '#sf-melodix-home',
      '#sf-mobile-nav',
      '#sf-mobile-navigation',
      '[data-testid="mobile-nav"]',
      '[data-testid="mobile-nav-bar"]',
      '[data-testid="mobile-navigation"]',
      '[data-testid="bottom-nav-bar"]',
      '[data-testid="bottom-navigation"]',
      '[data-testid="bottom-nav-item-home"]',
      '[data-testid="bottom-nav-item-search"]',
      '[data-testid="bottom-nav-item-your-library"]',
      '[data-testid="bottom-nav-item-premium"]',
      '[data-testid="mobile-nav-home"]',
      '[data-testid="mobile-nav-search"]',
      '[data-testid="mobile-nav-library"]',
      '[data-testid="now-playing-bar"]',
      '[data-testid="mobile-playback-bar"]',
      '[data-testid="now-playing-widget"]',
      '[data-testid="player-controls"]',
      '[data-testid="playback-controls"]',
      '[data-testid="control-button-playpause"]',
      '[data-testid="control-button-back"]',
      '[data-testid="control-button-forward"]',
      '[data-testid="control-button-shuffle"]',
      '[data-testid="control-button-repeat"]',
      '[data-testid="control-button-queue"]',
      '[data-testid="playback-bar"]',
      '[data-testid="seek-bar"]',
      '[data-testid="playback-position"]',
      '[data-testid="playback-duration"]',
      '[data-testid="track-info"]',
      '[data-testid="volume-bar"]',
      '[data-testid="device-picker"]',
      '[data-testid="connect-device-picker"]',
      '[data-testid="queue-button"]',
      '[data-testid="mini-player"]',
      '[data-testid="full-screen-player"]'
    ];
    const presence = {};
    selectors.forEach((selector) => {
      presence[selector] = document.querySelector(selector) !== null;
    });

    const sidebar = document.querySelector('#Desktop_LeftSidebar_Id');
    const v20Dock = document.querySelector('#sf-mobile-navigation');
    const currentDock = document.querySelector('#sf-mobile-nav');
    const homeRoot = document.querySelector('#sf-melodix-home');

    return {
      elapsedMs: Math.max(0, Math.round(performance.now() - startedAt)),
      host: window.location.hostname,
      runtimeUserAgent: summarizeRuntimeUserAgent(),
      width: {
        innerWidth: window.innerWidth,
        screenWidth: window.screen ? window.screen.width : null,
        visualViewportWidth: window.visualViewport
          ? window.visualViewport.width
          : null
      },
      layoutGeometry: readLayoutGeometry(),
      selectors: presence,
      playback: {
        userPaused: typeof window.__sfIsUserPaused === 'function'
          ? Boolean(window.__sfIsUserPaused())
          : null,
        pauseHoldReapplies: Number.isInteger(window.__sfPauseHoldReapplies)
          ? window.__sfPauseHoldReapplies
          : 0,
        trace: typeof window.__sfGetPlaybackTrace === 'function'
          ? window.__sfGetPlaybackTrace(40)
          : null
      },
      guiMode: window.SF_CONFIG && ['csshack', 'bigwindow', 'compact'].indexOf(window.SF_CONFIG.guiMode) >= 0
        ? window.SF_CONFIG.guiMode
        : 'other',
      touchInput: window.SF_CONFIG && typeof window.SF_CONFIG.touchInput === 'boolean'
        ? window.SF_CONFIG.touchInput
        : null,
      dockLeftSidebar: window.SF_CONFIG && typeof window.SF_CONFIG.dockLeftSidebar === 'boolean'
        ? window.SF_CONFIG.dockLeftSidebar
        : null,
      bodyClasses: safeBodyClasses(),
      drawer: {
        expanded: typeof window.__sfLibraryExpanded === 'boolean'
          ? window.__sfLibraryExpanded
          : null,
        libraryOpenClass: body
          ? body.classList.contains('sf-library-open')
          : null,
        guestClass: body ? body.classList.contains('sf-guest') : null,
        expandedClass: body ? body.classList.contains('sf-expanded') : null
      },
      dockDisplay: {
        sfMobileNav: currentDock
          ? window.getComputedStyle(currentDock).display
          : null,
        sfMobileNavigation: v20Dock
          ? window.getComputedStyle(v20Dock).display
          : null
      },
      sidebarDisplay: sidebar
        ? window.getComputedStyle(sidebar).display
        : null,
      ui: {
        andBridgeAvailable: Boolean(window.AndBridge),
        andBridgeDiagAvailable: Boolean(window.AndBridge && typeof window.AndBridge.logDiagEvent === 'function'),
        bridgeStarted: window.__sfMelodixBridgeStarted === true,
        bridgeBootstrapReady: window.__sfMelodixBridgeBootstrapReady === true,
        bridgeCompleted: window.__sfMelodixBridgeCompleted === true,
        bridgeBootstrapErrors: Number.isInteger(window.__sfMelodixBridgeBootstrapErrors)
          ? window.__sfMelodixBridgeBootstrapErrors
          : null,
        bridgeRecoveryAttempts: Number.isInteger(window.__sfNativeUiBridgeRecoveryAttempts)
          ? window.__sfNativeUiBridgeRecoveryAttempts
          : 0,
        bridgeRecovered: window.__sfNativeUiBridgeRecovered === true,
        bridgeExecMode: typeof window.__sfBridgeExecMode === 'string' ? window.__sfBridgeExecMode : null,
        bridgeBytes: Number.isInteger(window.__sfBridgeBytes) ? window.__sfBridgeBytes : null,
        bridgeReadExpected: window.__sfBridgeReadLog && Number.isInteger(window.__sfBridgeReadLog.expected)
          ? window.__sfBridgeReadLog.expected
          : null,
        bridgeReadReceived: window.__sfBridgeReadLog && Number.isInteger(window.__sfBridgeReadLog.received)
          ? window.__sfBridgeReadLog.received
          : null,
        bridgeReadChunks: window.__sfBridgeReadLog && Number.isInteger(window.__sfBridgeReadLog.chunks)
          ? window.__sfBridgeReadLog.chunks
          : null,
        bridgeReadComplete: window.__sfBridgeReadLog && typeof window.__sfBridgeReadLog.complete === 'boolean'
          ? window.__sfBridgeReadLog.complete
          : null,
        bridgeReadMethod: window.__sfBridgeReadLog && ['range', 'single', 'none'].indexOf(window.__sfBridgeReadLog.reader) >= 0
          ? window.__sfBridgeReadLog.reader
          : null,
        bridgeExecSteps: Array.isArray(window.__sfBridgeExecSteps)
          ? window.__sfBridgeExecSteps.slice(-8).map((step) =>
            String(step && step.stage || '').slice(0, 24) + '=' + String(step && step.status || '').slice(0, 24)
          ).join(',')
          : '',
        bridgeLastError: typeof window.__sfBridgeLastError === 'string'
          ? window.__sfBridgeLastError.slice(0, 80)
          : null,
        bridgeCspViolation: typeof window.__sfBridgeCspViolation === 'string'
          ? window.__sfBridgeCspViolation.slice(0, 64)
          : null,
        mobileShellInitAttempted: window.__sfMelodixMobileShellInitAttempted === true,
        homeInitAttempted: window.__sfMelodixHomeInitAttempted === true,
        mobileShellClass: body
          ? body.classList.contains('sf-mobile-shell')
          : null,
        homeActiveClass: body
          ? body.classList.contains('sf-melodix-home-active')
          : null,
        homeRootPresent: homeRoot !== null,
        homeGuiMode: typeof window.__sfMelodixHomeGuiMode === 'string'
          ? safeIdentifier(window.__sfMelodixHomeGuiMode.slice(0, 24))
          : null,
        homeScreen: ['home', 'other'].indexOf(window.__sfMelodixHomeRoute) >= 0
          ? window.__sfMelodixHomeRoute
          : null,
        homeDecision: safeHomeDecision(window.__sfMelodixHomeDecision),
        homeStylesReady: typeof window.__sfMelodixHomeStylesReady === 'boolean'
          ? window.__sfMelodixHomeStylesReady
          : null,
        nativeUiShellStarted: window.__sfNativeUiShellStarted === true,
        nativeUiShellReady: window.__sfNativeUiShellReady === true,
        nativeUiShellCompleted: window.__sfNativeUiShellCompleted === true,
        nativeUiShellErrors: Number.isInteger(window.__sfNativeUiShellErrors)
          ? window.__sfNativeUiShellErrors
          : null,
        nativeUiShellErrorSources: safeNativeUiShellErrorSources(),
        nativeUiShellErrorDetails: safeNativeUiShellErrorDetails(),
        nativeUiShellHomeRenderCycle: Number.isInteger(window.__sfNativeUiHomeRenderCycle)
          ? Math.max(0, Math.min(999999, window.__sfNativeUiHomeRenderCycle))
          : null,
        nativeUiReadyNotified: window.__sfNativeUiReadyNotified === true,
        nativeUiShowMethodCalled: window.__sfNativeUiShowMethodCalled === true,
        nativeUiRootFound: typeof window.__sfNativeUiRootFound === 'boolean'
          ? window.__sfNativeUiRootFound
          : null,
        nativeUiRoute: ['home', 'search', 'library', 'detail'].indexOf(window.__sfNativeUiRoute) >= 0
          ? window.__sfNativeUiRoute
          : null,
        nativeUiRootVisible: typeof window.__sfNativeUiRootVisible === 'boolean'
          ? window.__sfNativeUiRootVisible
          : null,
        nativeUiRootWidth: Number.isInteger(window.__sfNativeUiRootWidth)
          ? window.__sfNativeUiRootWidth
          : null,
        nativeUiRootHeight: Number.isInteger(window.__sfNativeUiRootHeight)
          ? window.__sfNativeUiRootHeight
          : null,
        nativeUiRootParentFound: typeof window.__sfNativeUiRootParentFound === 'boolean'
          ? window.__sfNativeUiRootParentFound
          : null,
        nativeUiRootParentConstraint: typeof window.__sfNativeUiRootParentConstraint === 'boolean'
          ? window.__sfNativeUiRootParentConstraint
          : null,
        nativeUiRootIndex: Number.isInteger(window.__sfNativeUiRootIndex)
          ? window.__sfNativeUiRootIndex
          : null,
        nativeUiHScrollIndex: Number.isInteger(window.__sfNativeUiHScrollIndex)
          ? window.__sfNativeUiHScrollIndex
          : null,
        nativeUiSiblingCount: Number.isInteger(window.__sfNativeUiSiblingCount)
          ? window.__sfNativeUiSiblingCount
          : null,
        nativeUiRootElevation: typeof window.__sfNativeUiRootElevation === 'number' &&
          Number.isFinite(window.__sfNativeUiRootElevation)
          ? window.__sfNativeUiRootElevation
          : null,
        nativeUiRootAboveWebHost: typeof window.__sfNativeUiRootAboveWebHost === 'boolean'
          ? window.__sfNativeUiRootAboveWebHost
          : null,
        nativeUiRootLayoutReady: typeof window.__sfNativeUiRootLayoutReady === 'boolean'
          ? window.__sfNativeUiRootLayoutReady
          : null,
        nativeUiVisibilityConfirmed: typeof window.__sfNativeUiVisibilityConfirmed === 'boolean'
          ? window.__sfNativeUiVisibilityConfirmed
          : null,
        nativeUiHomeContentReady: typeof window.__sfNativeUiHomeContentReady === 'boolean'
          ? window.__sfNativeUiHomeContentReady
          : null,
        nativeHomeRouteRecognized: typeof window.__sfNativeUiHomeRouteRecognized === 'boolean'
          ? window.__sfNativeUiHomeRouteRecognized
          : null,
        nativeUiBridgeCallbacksReady: typeof window.__sfNativeUiBridgeCallbacksReady === 'boolean'
          ? window.__sfNativeUiBridgeCallbacksReady
          : null,
        mediaLibStatus: ['pending', 'loading', 'ready', 'error'].indexOf(window.__sfMediaLibStatus) >= 0
          ? window.__sfMediaLibStatus
          : null,
        libraryFetchDiagnostic: safeLibraryFetchDiagnostic(),
        nativeHomeDataSent: window.__sfNativeUiHomeDataSent === true,
        customStylesheetInjected: document.querySelector('#sf-custom-style') !== null
      },
      mutations: {
        addedNodeCount: state.mutations.addedNodeCount,
        addedNodeCountCapped: state.mutations.addedNodeCountCapped,
        firstAddedIdentityPresence: state.mutations.firstAddedIdentityPresence.slice(),
        observerStopped: state.mutations.observerStopped
      }
    };
  };

  SAMPLE_DELAYS_MS.forEach((delayMs, index) => {
    window.setTimeout(() => {
      const isFinalSample = index === SAMPLE_DELAYS_MS.length - 1;
      if (isFinalSample && observer) {
        observer.disconnect();
        state.mutations.observerStopped = true;
      }

      state.samples.push(collectSample());
      if (isFinalSample) state.complete = true;
    }, delayMs);
  });

  return true;
})()
