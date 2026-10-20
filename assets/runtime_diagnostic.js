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
      firstAddedIdsAndTestIds: [],
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

  const recordAddedNodeIdentity = (node) => {
    if (node.nodeType !== 1 || state.mutations.firstAddedIdsAndTestIds.length >= 10) return;

    const id = safeIdentifier(node.id);
    const dataTestId = typeof node.getAttribute === 'function'
      ? safeIdentifier(node.getAttribute('data-testid'))
      : null;
    if (id === null && dataTestId === null) return;

    state.mutations.firstAddedIdsAndTestIds.push({ id, dataTestId });
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
      recordAddedNodeIdentity(node);

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

    return {
      elapsedMs: Math.max(0, Math.round(performance.now() - startedAt)),
      host: window.location.hostname,
      userAgent: navigator.userAgent,
      width: {
        innerWidth: window.innerWidth,
        screenWidth: window.screen ? window.screen.width : null,
        visualViewportWidth: window.visualViewport
          ? window.visualViewport.width
          : null
      },
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
      guiMode: window.SF_CONFIG ? window.SF_CONFIG.guiMode : null,
      touchInput: window.SF_CONFIG && typeof window.SF_CONFIG.touchInput === 'boolean'
        ? window.SF_CONFIG.touchInput
        : null,
      dockLeftSidebar: window.SF_CONFIG
        ? window.SF_CONFIG.dockLeftSidebar
        : null,
      bodyClasses: body ? body.className : null,
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
        mobileShellInitAttempted: window.__sfMelodixMobileShellInitAttempted === true,
        homeInitAttempted: window.__sfMelodixHomeInitAttempted === true,
        mobileShellClass: body
          ? body.classList.contains('sf-mobile-shell')
          : null,
        homeActiveClass: body
          ? body.classList.contains('sf-melodix-home-active')
          : null,
        homeRootPresent: document.querySelector('#sf-melodix-home') !== null,
        nativeUiShellStarted: window.__sfNativeUiShellStarted === true,
        nativeUiShellReady: window.__sfNativeUiShellReady === true,
        nativeUiShellCompleted: window.__sfNativeUiShellCompleted === true,
        nativeUiShellErrors: Number.isInteger(window.__sfNativeUiShellErrors)
          ? window.__sfNativeUiShellErrors
          : null,
        nativeUiReadyNotified: window.__sfNativeUiReadyNotified === true,
        nativeUiRoute: ['home', 'search', 'library', 'detail'].indexOf(window.__sfNativeUiRoute) >= 0
          ? window.__sfNativeUiRoute
          : null,
        nativeHomeRouteRecognized: typeof window.__sfNativeUiHomeRouteRecognized === 'boolean'
          ? window.__sfNativeUiHomeRouteRecognized
          : null,
        nativeHomeRowsCount: Number.isInteger(window.__sfNativeUiHomeRowsCount)
          ? window.__sfNativeUiHomeRowsCount
          : null,
        nativeHomeDataSent: window.__sfNativeUiHomeDataSent === true,
        customStylesheetInjected: document.querySelector('#sf-custom-style') !== null
      },
      mutations: {
        addedNodeCount: state.mutations.addedNodeCount,
        addedNodeCountCapped: state.mutations.addedNodeCountCapped,
        firstAddedIdsAndTestIds: state.mutations.firstAddedIdsAndTestIds.slice(),
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
