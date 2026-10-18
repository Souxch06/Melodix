(function() {
    // Global flags injected by Android:
    // window.SF_CONFIG = { ... };

    // Spotify is loaded with a desktop UA. Use Android's actual display metrics
    // to prevent WebView from falling back to a 980px desktop layout viewport.
    function isDeviceLandscape() {
        const orientationType = window.screen && window.screen.orientation && window.screen.orientation.type;
        if (orientationType) return orientationType.indexOf('landscape') === 0;
        const config = window.SF_CONFIG || {};
        const width = Number(config.screenWidth) || Number(window.screen && window.screen.width) || 0;
        const height = Number(config.screenHeight) || Number(window.screen && window.screen.height) || 0;
        return width && height ? width > height : window.matchMedia('(orientation: landscape)').matches;
    }

    function getDeviceViewportMetrics() {
        const config = window.SF_CONFIG || {};
        const rawWidth = Number(config.screenWidth) || Number(window.screen && window.screen.width) || 0;
        const rawHeight = Number(config.screenHeight) || Number(window.screen && window.screen.height) || 0;
        const orientationType = window.screen && window.screen.orientation && window.screen.orientation.type;
        const portrait = orientationType
            ? orientationType.indexOf('portrait') === 0
            : (rawWidth && rawHeight ? rawWidth <= rawHeight : window.matchMedia('(orientation: portrait)').matches);
        const deviceWidth = rawWidth && rawHeight
            ? (portrait ? Math.min(rawWidth, rawHeight) : Math.max(rawWidth, rawHeight))
            : rawWidth;
        const deviceHeight = rawWidth && rawHeight
            ? (portrait ? Math.max(rawWidth, rawHeight) : Math.min(rawWidth, rawHeight))
            : rawHeight;
        const root = document.documentElement;
        let width = Math.round((root && root.clientWidth) || window.innerWidth || 0);
        let height = Math.round((window.visualViewport && window.visualViewport.height) || window.innerHeight || (root && root.clientHeight) || 0);

        // Correct an unscaled desktop layout width with the native device width;
        // otherwise keep the narrower WebView width (for insets or split-screen).
        if (deviceWidth > 0 && (!width || width > deviceWidth + 64)) width = deviceWidth;
        if (!width) width = deviceWidth;
        if (!height) height = deviceHeight;
        return { width: Math.max(0, Math.round(width)), height: Math.max(0, Math.round(height)) };
    }

    (function applyPhoneViewport() {
        try {
            const updateViewport = () => {
                const config = window.SF_CONFIG || {};
                const isBigWindow = config.guiMode === 'bigwindow';
                const isLandscape = isDeviceLandscape();
                if (isBigWindow && isLandscape) return;

                const root = document.documentElement;
                if (!root) return;
                const metrics = getDeviceViewportMetrics();
                root.style.setProperty('--sf-device-width', metrics.width > 0 ? `${metrics.width}px` : '100vw');
                root.style.setProperty('--sf-device-height', metrics.height > 0 ? `${metrics.height}px` : '100dvh');
                if (metrics.width > 0 && metrics.height > 0) {
                    root.style.setProperty('--sf-device-aspect', `${metrics.width} / ${metrics.height}`);
                }

                let meta = document.querySelector('meta[name="viewport"]');
                if (!meta) {
                    meta = document.createElement('meta');
                    meta.name = 'viewport';
                    (document.head || root).appendChild(meta);
                }
                const viewportWidth = metrics.width > 0 ? metrics.width : 'device-width';
                const content = `width=${viewportWidth}, initial-scale=1.0, viewport-fit=cover`;
                if (meta.getAttribute('content') !== content) meta.setAttribute('content', content);
            };

            window.__sfApplyDeviceViewport = updateViewport;
            updateViewport();
            if (!window.__sfDeviceViewportListenersAttached) {
                window.__sfDeviceViewportListenersAttached = true;
                const scheduleUpdate = () => window.requestAnimationFrame(() => window.__sfApplyDeviceViewport && window.__sfApplyDeviceViewport());
                window.addEventListener('resize', scheduleUpdate, { passive: true });
                window.addEventListener('orientationchange', scheduleUpdate, { passive: true });
                if (window.visualViewport) window.visualViewport.addEventListener('resize', scheduleUpdate, { passive: true });
                if (window.screen && window.screen.orientation && window.screen.orientation.addEventListener) {
                    window.screen.orientation.addEventListener('change', scheduleUpdate);
                }
            }
        } catch (_) {}
    })();

    // =========================================================================
    // SECTION 1: CORE CONTEXT & INITIALIZATION
    // =========================================================================

    let reqPause = false;
    let firstPlay = true;
    let ulFlag = false;
    let ffDone = false;
    let featVer = `web-player_${new Date().toISOString().split('T')[0]}_${Date.now()}_${Math.floor(Math.random()*0xFFFFFFF).toString(16).padStart(7,'0')}`;
    let lastState = null;
    let lastPos = null;
    window.playing = false;
    let pfint = null;
    let afint = null;
    let cssint = null;
    let aaint = null;
    let tagint = null;
    let fsUpdateTimer = null;
    let fsScrubbing = false;

    // Session state is observed only from Spotify's rendered sign-in/player UI.
    // No cookies, OAuth headers, localStorage credentials, or private Web APIs are read.
    window.__sfMarkLoggedOut = function() {
        window.__sfAuthBridgeState = 'signed-out';
        if (!window.__sfLogoutBridgeNotified) {
            window.__sfLogoutBridgeNotified = true;
            try {
                if (window.AndBridge && typeof window.AndBridge.logoutDetected === 'function') {
                    window.AndBridge.logoutDetected();
                }
            } catch (_) {}
        }
        if (document.body) {
            document.body.classList.add('sf-guest');
            document.body.classList.remove('sf-library-open');
        }
        window.__sfLibraryExpanded = false;
        if (window.__sfDrawerState) window.__sfDrawerState.setOpen(false);
    };

    window.__sfMarkLoggedIn = function() {
        window.__sfAuthBridgeState = 'signed-in';
        window.__sfLogoutBridgeNotified = false;
        if (document.body) document.body.classList.remove('sf-guest');
        try {
            if (window.AndBridge && typeof window.AndBridge.loginDetected === 'function') {
                window.AndBridge.loginDetected();
            }
        } catch (_) {}
    };

    (function observeSpotifyAuthUi() {
        const hideAuthNotice = () => {
            const notice = document.getElementById('sf-auth-status');
            if (notice) notice.remove();
        };

        const showAuthNotice = () => {
            if (!document.body || document.getElementById('sf-auth-status')) return;
            const notice = document.createElement('div');
            notice.id = 'sf-auth-status';
            notice.setAttribute('role', 'status');
            notice.setAttribute('aria-live', 'polite');
            const message = document.createElement('span');
            message.textContent = 'Session Spotify non confirmée par Melodix. Vérifiez votre session sur le lecteur officiel, puis rechargez si nécessaire.';
            const retry = document.createElement('button');
            retry.type = 'button';
            retry.textContent = 'Recharger';
            retry.setAttribute('aria-label', 'Recharger le lecteur Spotify');
            retry.addEventListener('click', () => window.location.reload());
            notice.append(message, retry);
            const mainView = document.querySelector('#main-view');
            if (mainView) mainView.insertBefore(notice, mainView.firstChild);
            else {
                notice.classList.add('sf-auth-status-body-root');
                document.body.insertBefore(notice, document.body.firstChild);
            }
        };

        const runtime = window.MelodixRuntime;
        if (!runtime || !document.documentElement) {
            console.warn('[Melodix] Session state helper unavailable; authentication remains unconfirmed.');
            window.setTimeout(showAuthNotice, 15000);
            return;
        }

        const machine = runtime.createAuthStateMachine((state) => {
            if (state === runtime.AUTH_STATE.SIGNED_IN) window.__sfMarkLoggedIn();
            else if (state === runtime.AUTH_STATE.SIGNED_OUT) window.__sfMarkLoggedOut();
        });
        window.__sfAuthStateMachine = machine;

        let unknownNoticeTimer = null;
        let scheduled = false;
        let observer = null;

        const isVisible = (element) => {
            if (!element || element.hidden || element.getAttribute('aria-hidden') === 'true') return false;
            try {
                const style = window.getComputedStyle ? window.getComputedStyle(element) : null;
                if (style && (style.display === 'none' || style.visibility === 'hidden' || style.opacity === '0')) return false;
            } catch (_) {}
            return typeof element.getClientRects !== 'function' || element.getClientRects().length > 0;
        };

        const getAuthSignals = () => {
            const host = (window.location.hostname || '').toLowerCase();
            const pathname = (window.location.pathname || '/').toLowerCase();
            const accountsPage = host === 'accounts.spotify.com' || host.endsWith('.accounts.spotify.com');
            const loginRoute = /(?:^|\/)(?:login|auth)(?:\/|$)/i.test(pathname);
            const signInText = /\b(log\s*in|sign\s*in|sign\s*up|log\s*out|connexion|se\s+connecter|s'inscrire|déconnexion)\b/i;
            const guestActions = Array.from(document.querySelectorAll(
                'button[data-testid="web-player-link"], button[data-testid="login-button"], a[href*="/login"], button[aria-label*="sign in" i], button[aria-label*="log in" i]'
            ));
            const loginAction = guestActions.some((element) => {
                if (!isVisible(element)) return false;
                // The public Web Player CTA is a guest signal only; it is never an auth success signal.
                if (element.matches && element.matches('button[data-testid="web-player-link"]')) return true;
                const label = `${element.innerText || ''} ${element.getAttribute('aria-label') || ''}`;
                return signInText.test(label);
            });
            const profiles = Array.from(document.querySelectorAll(
                'button[data-testid="user-widget-link"], a[data-testid="user-widget-link"], [data-testid="user-widget-avatar"], button[aria-label*="profile" i]'
            ));
            const profileControl = profiles.some((element) => {
                if (!isVisible(element)) return false;
                const label = `${element.innerText || ''} ${element.getAttribute('aria-label') || ''}`;
                const href = element.getAttribute('href') || '';
                const hasAccountIdentity = /\/user\//i.test(href) || !!element.querySelector('img[src]');
                return hasAccountIdentity && !signInText.test(label);
            });
            const playerBar = document.querySelector('aside[data-testid="now-playing-bar"]');
            const playControl = document.querySelector('button[data-testid="control-button-playpause"]');
            const playerControls = isVisible(playerBar) && isVisible(playControl) && !playControl.disabled;

            return { accountsPage, loginRoute, loginAction, profileControl, playerControls };
        };

        const inspectAuthUi = () => {
            const state = machine.observe(getAuthSignals());
            window.__sfObservedAuthState = state;
            if (state !== runtime.AUTH_STATE.UNKNOWN) {
                if (unknownNoticeTimer) {
                    window.clearTimeout(unknownNoticeTimer);
                    unknownNoticeTimer = null;
                }
                hideAuthNotice();
                return;
            }
            // Do not gate this on the last confirmed state: after the official
            // sign-in page, signed-out can transition to unknown while the player hydrates.
            if (!unknownNoticeTimer) {
                unknownNoticeTimer = window.setTimeout(() => {
                    unknownNoticeTimer = null;
                    if (runtime.shouldShowUnconfirmedNotice(machine.getState())) showAuthNotice();
                }, 15000);
            }
        };

        const scheduleInspection = () => {
            if (scheduled) return;
            scheduled = true;
            window.setTimeout(() => {
                scheduled = false;
                inspectAuthUi();
            }, 100);
        };

        window.__sfRefreshAuthState = scheduleInspection;
        observer = new MutationObserver(scheduleInspection);
        observer.observe(document.documentElement, {
            childList: true,
            subtree: true,
            attributes: true,
            attributeFilter: ['aria-label', 'aria-hidden', 'class', 'style', 'href', 'data-testid']
        });
        window.addEventListener('popstate', scheduleInspection);
        window.addEventListener('pageshow', scheduleInspection);
        document.addEventListener('DOMContentLoaded', scheduleInspection, { once: true });
        scheduleInspection();
    })();

    // A small native-feeling tab bar for portrait phones. It delegates to the
    // existing Spotify navigation and Library toggle, so routes and handlers
    // remain Spotify's own rather than being reimplemented.
    (function installMobileNavigation() {
        if (window.location.hostname !== 'open.spotify.com') return;
        const config = window.SF_CONFIG || {};
        const initialMetrics = getDeviceViewportMetrics();
        const isPortraitPhone = !isDeviceLandscape()
            && initialMetrics.width > 0
            && initialMetrics.width <= 700;
        // The app may retain the Wide Window setting across updates. On an
        // actual portrait phone, do not let that setting disable mobile UI.
        if (config.guiMode && config.guiMode !== 'csshack' && !isPortraitPhone) return;
        if (document.body) document.body.classList.add('sf-mobile-shell');

        const icons = {
            home: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="m3 10 9-7 9 7v10a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/></svg>',
            search: '<svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="10.8" cy="10.8" r="6.8" fill="none" stroke="currentColor" stroke-width="1.8"/><path d="m16 16 4.5 4.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/></svg>',
            library: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 5.5h16M4 10.5h16M4 15.5h11M4 20h11" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/></svg>'
        };

        const libraryElement = () => document.querySelector('#Desktop_LeftSidebar_Id');
        const mobileRuntimeStyles = `
            body.sf-mobile-shell { background: #121212 !important; color: #f7f7f7 !important; }
            body.sf-mobile-shell #main-view-container,
            body.sf-mobile-shell .main-view-container,
            body.sf-mobile-shell #main-view {
                box-sizing: border-box !important;
                width: 100vw !important;
                min-width: 0 !important;
                max-width: 100vw !important;
                margin-left: 0 !important;
                margin-right: 0 !important;
                background: #121212 !important;
                overflow-x: hidden !important;
            }
            body.sf-mobile-shell:not(.sf-expanded):not(.sf-statusbar-hidden) #global-nav-bar {
                position: sticky !important;
                top: 0 !important;
                z-index: 2147482000 !important;
                box-sizing: border-box !important;
                display: flex !important;
                align-items: center !important;
                justify-content: flex-start !important;
                gap: 8px !important;
                width: 100vw !important;
                height: calc(58px + max(var(--sf-safe-area-top, 0px), env(safe-area-inset-top, 0px), 24px)) !important;
                min-height: calc(58px + max(var(--sf-safe-area-top, 0px), env(safe-area-inset-top, 0px), 24px)) !important;
                padding: calc(max(var(--sf-safe-area-top, 0px), env(safe-area-inset-top, 0px), 24px) + 6px) 12px 6px !important;
                border: 0 !important;
                background: #121212 !important;
                box-shadow: none !important;
            }
            body.sf-mobile-shell.sf-statusbar-hidden:not(.sf-expanded) #global-nav-bar {
                height: 58px !important;
                min-height: 58px !important;
                padding: 6px 12px !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar::before {
                content: "M" !important;
                display: grid !important;
                flex: 0 0 34px !important;
                width: 34px !important;
                height: 34px !important;
                place-items: center !important;
                border-radius: 11px !important;
                background: #1ed760 !important;
                color: #07110a !important;
                font-size: 20px !important;
                font-weight: 900 !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar::after {
                content: "Melodix" !important;
                position: absolute !important;
                left: 58px !important;
                top: 50% !important;
                color: #fff !important;
                font-size: 17px !important;
                font-weight: 800 !important;
                transform: translateY(-50%) !important;
                pointer-events: none !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[data-testid="home-button"],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar form[role="search"],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar a[href="/search"],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[data-testid="search-icon"],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[aria-label*="Search" i],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[data-testid*="back" i],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[data-testid*="forward" i],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[aria-label*="notification" i],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar [data-testid*="notification"],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[aria-label*="friend" i],
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar [data-testid*="friend"] {
                display: none !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) #global-nav-bar button[data-testid="user-widget-link"] {
                display: inline-flex !important;
                flex: 0 0 38px !important;
                width: 38px !important;
                height: 38px !important;
                min-width: 38px !important;
                min-height: 38px !important;
                margin-left: auto !important;
                padding: 0 !important;
                border-radius: 50% !important;
            }
            body.sf-mobile-shell:not(.sf-library-open) #Desktop_LeftSidebar_Id { display: none !important; }
            body.sf-mobile-shell #Desktop_PanelContainer_Id,
            body.sf-mobile-shell aside[data-testid="right-sidebar"],
            body.sf-mobile-shell aside[data-testid="now-playing-view"] {
                box-sizing: border-box !important;
                width: 100vw !important;
                min-width: 0 !important;
                max-width: 100vw !important;
                margin-left: 0 !important;
                margin-right: 0 !important;
                overflow-x: hidden !important;
                border-radius: 0 !important;
                background: #121212 !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) #main-view [data-testid="cover-art-image"],
            body.sf-mobile-shell:not(.sf-expanded) #Desktop_PanelContainer_Id [data-testid="cover-art-image"],
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-view"] [data-testid="cover-art-image"] {
                display: block !important;
                width: min(64vw, 30vh, 248px) !important;
                height: min(64vw, 30vh, 248px) !important;
                max-width: calc(100vw - 28px) !important;
                max-height: min(64vw, 30vh, 248px) !important;
                margin: 8px auto 14px !important;
                border-radius: 12px !important;
                object-fit: cover !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) #main-view div:has(> [data-testid="cover-art-image"]),
            body.sf-mobile-shell:not(.sf-expanded) #Desktop_PanelContainer_Id div:has(> [data-testid="cover-art-image"]),
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-view"] div:has(> [data-testid="cover-art-image"]) {
                display: flex !important;
                flex: 0 0 auto !important;
                align-items: center !important;
                justify-content: center !important;
                width: min(64vw, 30vh, 248px) !important;
                height: min(64vw, 30vh, 248px) !important;
                max-width: calc(100vw - 28px) !important;
                margin: 8px auto 14px !important;
                overflow: hidden !important;
                border-radius: 12px !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) div:has(> #VideoPlayerCinema_ReactPortal):not(:has(video)) > div > div {
                width: min(64vw, 30vh, 248px) !important;
                height: min(64vw, 30vh, 248px) !important;
                max-width: calc(100vw - 28px) !important;
                margin: 8px auto 14px !important;
                overflow: hidden !important;
                border-radius: 12px !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) div:has(> #VideoPlayerCinema_ReactPortal):has(video) > div,
            body.sf-mobile-shell:not(.sf-expanded) div:has(> #VideoPlayerCinema_ReactPortal):has(video) > div > div,
            body.sf-mobile-shell:not(.sf-expanded) div[data-testid="video-player-cinema"]:has(video),
            body.sf-mobile-shell:not(.sf-expanded) .VideoPlayer__container:has(video) {
                width: 100% !important;
                max-width: 100% !important;
                max-height: min(42vh, 320px) !important;
                aspect-ratio: 16 / 9 !important;
                margin: 8px auto 14px !important;
                overflow: hidden !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) div[data-testid="video-player-cinema"] video,
            body.sf-mobile-shell:not(.sf-expanded) .VideoPlayer__container video,
            body.sf-mobile-shell:not(.sf-expanded) #main-view video,
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-view"] video {
                display: block !important;
                width: 100% !important;
                max-width: 100% !important;
                max-height: min(42vh, 320px) !important;
                object-fit: contain !important;
            }
            body.sf-mobile-shell #sf-mobile-navigation {
                position: fixed !important;
                left: 0 !important;
                right: 0 !important;
                bottom: 0 !important;
                z-index: 2147483001 !important;
                box-sizing: border-box !important;
                display: grid !important;
                grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
                align-items: stretch !important;
                height: calc(62px + env(safe-area-inset-bottom, 0px)) !important;
                padding: 5px 14px calc(5px + env(safe-area-inset-bottom, 0px)) !important;
                border: 0 !important;
                border-top: 1px solid rgba(255, 255, 255, 0.06) !important;
                border-radius: 0 !important;
                background: #121212 !important;
            }
            body.sf-mobile-shell #sf-mobile-navigation .sf-mobile-tab {
                display: flex !important;
                flex-direction: column !important;
                align-items: center !important;
                justify-content: center !important;
                gap: 3px !important;
                min-width: 0 !important;
                min-height: 48px !important;
                padding: 3px !important;
                border: 0 !important;
                background: transparent !important;
                color: #b3b3b3 !important;
                font: 500 10px/1.1 Arial, sans-serif !important;
            }
            body.sf-mobile-shell #sf-mobile-navigation .sf-mobile-tab svg {
                display: block !important;
                width: 21px !important;
                height: 21px !important;
            }
            body.sf-mobile-shell #sf-mobile-navigation .sf-mobile-tab[aria-current="page"] {
                color: #1ed760 !important;
            }
            body.sf-mobile-shell.sf-library-open #sf-mobile-navigation,
            body.sf-mobile-shell.sf-guest #sf-mobile-navigation,
            body.sf-expanded #sf-mobile-navigation { display: none !important; }
            body.sf-mobile-shell:not(.sf-expanded):not(.sf-guest):not(.sf-library-open) #main-view {
                padding-bottom: calc(142px + env(safe-area-inset-bottom, 0px)) !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] {
                position: fixed !important;
                left: 6px !important;
                right: 6px !important;
                bottom: calc(69px + env(safe-area-inset-bottom, 0px)) !important;
                z-index: 2147483000 !important;
                box-sizing: border-box !important;
                display: flex !important;
                flex-direction: row !important;
                align-items: center !important;
                width: auto !important;
                min-width: 0 !important;
                height: 56px !important;
                min-height: 56px !important;
                max-height: 56px !important;
                margin: 0 !important;
                padding: 4px 8px !important;
                overflow: hidden !important;
                border: 0 !important;
                border-radius: 7px !important;
                background: #282828 !important;
                box-shadow: none !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] [data-testid="cover-art-image"] {
                flex: 0 0 42px !important;
                width: 42px !important;
                height: 42px !important;
                object-fit: cover !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] [data-testid="general-controls"] button:not([data-testid="control-button-playpause"]) {
                display: none !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] [data-testid="general-controls"] {
                position: absolute !important;
                top: 50% !important;
                right: 8px !important;
                width: 42px !important;
                margin: 0 !important;
                transform: translateY(-50%) !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"] {
                width: 38px !important;
                height: 38px !important;
                min-width: 38px !important;
                min-height: 38px !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] [data-testid="playback-progressbar"] {
                position: absolute !important;
                left: 8px !important;
                right: 8px !important;
                bottom: 1px !important;
                height: 2px !important;
                min-height: 2px !important;
                margin: 0 !important;
            }
            body.sf-mobile-shell:not(.sf-expanded) aside[data-testid="now-playing-bar"] > div > div:last-child {
                display: none !important;
            }
            body.sf-mobile-shell aside[data-testid="now-playing-view"] [data-testid="grid-container"] {
                display: flex !important;
                flex-wrap: nowrap !important;
                gap: 12px !important;
                overflow-x: auto !important;
                overflow-y: hidden !important;
                scroll-snap-type: x mandatory !important;
                scrollbar-width: none !important;
                -webkit-overflow-scrolling: touch !important;
            }
            body.sf-mobile-shell aside[data-testid="now-playing-view"] [data-testid="grid-container"] > [data-testid="card"] {
                flex: 0 0 min(42vw, 148px) !important;
                min-width: 0 !important;
                scroll-snap-align: start !important;
            }
        `;

        function ensureMobileRuntimeStyles() {
            if (!document.body) return;
            let style = document.getElementById('sf-mobile-runtime-style');
            if (!style) {
                style = document.createElement('style');
                style.id = 'sf-mobile-runtime-style';
                (document.head || document.documentElement).appendChild(style);
            }
            if (style.textContent !== mobileRuntimeStyles) style.textContent = mobileRuntimeStyles;
        }

        function updateActiveTab(nav) {
            if (!nav || !document.body) return;
            const path = window.location.pathname || '/';
            const libraryOpen = !!window.__sfLibraryExpanded || document.body.classList.contains('sf-library-open');
            const active = libraryOpen || path.startsWith('/collection')
                ? 'library'
                : (path.startsWith('/search') ? 'search' : 'home');
            nav.querySelectorAll('[data-sf-tab]').forEach(button => {
                if (button.dataset.sfTab === active) button.setAttribute('aria-current', 'page');
                else button.removeAttribute('aria-current');
            });
        }

        function setLibraryExpanded(expanded) {
            const sidebar = libraryElement();
            expanded = window.__sfDrawerState
                ? window.__sfDrawerState.setOpen(expanded)
                : expanded === true;
            window.__sfLibraryExpanded = expanded;
            if (!sidebar) {
                const isCollectionRoute = (window.location.pathname || '').startsWith('/collection');
                if (expanded && !isCollectionRoute) {
                    const libraryLink = document.querySelector(
                        '#global-nav-bar a[href^="/collection"], a[href^="/collection"], #global-nav-bar button[data-testid*="library" i]'
                    );
                    if (libraryLink) libraryLink.click();
                    else window.location.assign('https://open.spotify.com/collection/tracks');
                } else if (!expanded && isCollectionRoute) {
                    window.location.assign('https://open.spotify.com/');
                }
                updateActiveTab(document.getElementById('sf-mobile-navigation'));
                return;
            }

            if (typeof window.switchLs === 'function') {
                window.switchLs(expanded);
            } else {
                const safeTop = 'var(--sf-safe-area-top, env(safe-area-inset-top, 0px))';
                sidebar.style.setProperty('position', 'fixed', 'important');
                if (expanded) {
                    sidebar.style.setProperty('top', `calc(${safeTop} + 48px)`, 'important');
                    sidebar.style.setProperty('left', '0px', 'important');
                    sidebar.style.setProperty('width', '100%', 'important');
                    sidebar.style.setProperty('height', `calc(100dvh - ${safeTop} - 48px)`, 'important');
                    sidebar.style.setProperty('bottom', '0px', 'important');
                    sidebar.style.setProperty('overflow-y', 'auto', 'important');
                    sidebar.style.setProperty('z-index', '2147483000', 'important');
                } else {
                    sidebar.style.setProperty('top', safeTop, 'important');
                    sidebar.style.setProperty('left', '60px', 'important');
                    sidebar.style.setProperty('width', '48px', 'important');
                    sidebar.style.setProperty('height', '48px', 'important');
                    sidebar.style.removeProperty('bottom');
                    sidebar.style.removeProperty('overflow-y');
                    sidebar.style.setProperty('z-index', '1', 'important');
                }
                window.__sfLibraryExpanded = expanded;
            }

            document.body.classList.toggle('sf-library-open', expanded);
            if (window.lBtn) window.lBtn.setAttribute('aria-expanded', String(expanded));
            updateActiveTab(document.getElementById('sf-mobile-navigation'));
        }

        function closeLibraryDrawer() {
            const sidebar = libraryElement();
            if (sidebar) {
                // Reuse the existing close path so inline geometry, heading, and
                // aria-expanded are restored along with the JS/CSS state.
                setLibraryExpanded(false);
                return;
            }

            if (window.__sfDrawerState) window.__sfDrawerState.setOpen(false);
            window.__sfLibraryExpanded = false;
            if (document.body) document.body.classList.remove('sf-library-open');
            if (window.lBtn) window.lBtn.setAttribute('aria-expanded', 'false');
            updateActiveTab(document.getElementById('sf-mobile-navigation'));
        }

        function activateRoute(kind) {
            const selectors = kind === 'home'
                ? ['#global-nav-bar button[data-testid="home-button"]', '#global-nav-bar a[href="/"]', 'a[href="/"]']
                : ['#global-nav-bar a[href="/search"]', 'a[href="/search"]', '#global-nav-bar button[data-testid="search-icon"]', '#global-nav-bar button[aria-label*="Search" i]'];
            const target = selectors.map(selector => document.querySelector(selector)).find(Boolean);
            if (target) target.click();
            else window.location.assign(kind === 'home' ? 'https://open.spotify.com/' : 'https://open.spotify.com/search');
        }

        function ensureMobileNavigation() {
            if (!document.body) return false;
            const sidebar = libraryElement();

            // The mobile shell must not depend on Spotify mounting its desktop
            // library sidebar: narrow player/detail routes may omit that panel.
            document.body.classList.add('sf-mobile-shell');
            document.body.classList.toggle('sf-statusbar-hidden', !!config.hideStatusBar);
            ensureMobileRuntimeStyles();
            if (typeof window.__sfLogoutBridgeNotified !== 'boolean') window.__sfLogoutBridgeNotified = false;
            if (!window.__sfDrawerState && window.MelodixRuntime) {
                window.__sfDrawerState = window.MelodixRuntime.createDrawerState(false);
            }
            if (typeof window.__sfLibraryExpanded !== 'boolean') {
                window.__sfLibraryExpanded = window.__sfDrawerState
                    ? window.__sfDrawerState.setOpen(false)
                    : false;
            } else if (window.__sfDrawerState) {
                window.__sfDrawerState.setOpen(window.__sfLibraryExpanded);
            }

            let nav = document.getElementById('sf-mobile-navigation');
            if (!nav) {
                nav = document.createElement('nav');
                nav.id = 'sf-mobile-navigation';
                nav.setAttribute('aria-label', 'Navigation mobile');
                nav.innerHTML = `
                    <button type="button" class="sf-mobile-tab" data-sf-tab="home" aria-label="Accueil">
                        ${icons.home}<span>Accueil</span>
                    </button>
                    <button type="button" class="sf-mobile-tab" data-sf-tab="search" aria-label="Recherche">
                        ${icons.search}<span>Recherche</span>
                    </button>
                    <button type="button" class="sf-mobile-tab" data-sf-tab="library" aria-label="Bibliothèque">
                        ${icons.library}<span>Bibliothèque</span>
                    </button>`;
                nav.addEventListener('click', event => {
                    const button = event.target.closest('[data-sf-tab]');
                    if (!button) return;
                    const kind = button.dataset.sfTab;
                    if (kind === 'library') {
                        setLibraryExpanded(!window.__sfLibraryExpanded);
                    } else {
                        closeLibraryDrawer();
                        activateRoute(kind);
                        updateActiveTab(nav);
                    }
                });
                document.body.appendChild(nav);
            }

            if (sidebar && !sidebar.dataset.sfMobileCloseBound) {
                sidebar.dataset.sfMobileCloseBound = 'true';
                sidebar.addEventListener('click', event => {
                    if (!event.target.closest('header button, header [role="button"]')) return;
                    window.setTimeout(() => {
                        const open = window.__sfDrawerState
                            ? window.__sfDrawerState.isOpen()
                            : !!window.__sfLibraryExpanded;
                        document.body.classList.toggle('sf-library-open', open);
                        updateActiveTab(nav);
                    }, 0);
                }, true);
            }

            updateActiveTab(nav);
            return !!sidebar;
        }

        let mobileNavObserver = null;
        if (!ensureMobileNavigation() && document.documentElement) {
            mobileNavObserver = new MutationObserver(() => {
                if (ensureMobileNavigation()) {
                    mobileNavObserver.disconnect();
                    mobileNavObserver = null;
                }
            });
            mobileNavObserver.observe(document.documentElement, { childList: true, subtree: true });
            window.setTimeout(() => {
                if (mobileNavObserver) mobileNavObserver.disconnect();
                mobileNavObserver = null;
            }, 30000);
        }
        window.addEventListener('DOMContentLoaded', ensureMobileNavigation, { once: true });

        window.addEventListener('popstate', () => updateActiveTab(document.getElementById('sf-mobile-navigation')));

        document.addEventListener('click', event => {
            const action = event.target.closest('button, a, [role="menuitem"]');
            if (!action) return;
            const label = `${action.innerText || ''} ${action.getAttribute('aria-label') || ''}`.trim().toLowerCase();
            if (/^(log out|logout|sign out|déconnexion|se déconnecter)(\s|$)/.test(label)) {
                if (typeof window.__sfMarkLoggedOut === 'function') window.__sfMarkLoggedOut();
            }
        }, true);
    })();

    // Spotify's private Webpack modules and session credentials are not accessed.

    // --- Native SVG Paths (Spotifuck Assets) ---
    const NATIVE_SVGS = {
        previous: `
            <svg viewBox="0 0 16 16" width="32" height="32">
                <path d="M3.3 1a.7.7 0 0 1 .7.7v5.15l9.95-5.744a.7.7 0 0 1 1.05.606v12.575
                         a.7.7 0 0 1-1.05.607L4 8.949V14.3a.7.7 0 0 1-.7.7H1.7
                         a.7.7 0 0 1-.7-.7V1.7a.7.7 0 0 1 .7-.7z" fill="currentColor"/>
            </svg>
        `,
        next: `
            <svg viewBox="0 0 16 16" width="32" height="32">
                <path d="M12.7 1a.7.7 0 0 0-.7.7v5.15L2.05 1.107A.7.7 0 0 0 1 1.712v12.575
                         a.7.7 0 0 0 1.05.607L12 9.149V14.3a.7.7 0 0 0 .7.7h1.6
                         a.7.7 0 0 0 .7-.7V1.7a.7.7 0 0 0-.7-.7z" fill="currentColor"/>
            </svg>
        `,
        shuffle: `
            <svg viewBox="0 0 24 24" width="28" height="28">
                <path d="M18.788 3.702a1 1 0 0 1 1.414-1.414L23.914 6l-3.712 3.712
                         a1 1 0 1 1-1.414-1.414L20.086 7h-1.518a5 5 0 0 0-3.826 1.78
                         l-7.346 8.73a7 7 0 0 1-5.356 2.494H1v-2h1.04
                         a5 5 0 0 0 3.826-1.781l7.345-8.73A7 7 0 0 1 18.569 5
                         h1.518l-1.298-1.298z" fill="currentColor"/>
                <path d="M18.788 14.289a1 1 0 0 0 0 1.414L20.086 17h-1.518
                         a5 5 0 0 1-3.826-1.78l-1.403-1.668-1.306 1.554 1.178 1.4
                         A7 7 0 0 0 18.568 19h1.518l-1.298 1.298a1 1 0 1 0 1.414 1.414
                         L23.914 18l-3.712-3.713a1 1 0 0 0-1.414 0z
                         M7.396 6.49l2.023 2.404-1.307 1.553-2.246-2.67
                         a5 5 0 0 0-3.826-1.78H1v-2h1.04A7 7 0 0 1 7.396 6.49" fill="currentColor"/>
            </svg>
        `,
        smart_shuffle: `
            <svg viewBox="0 0 24 24" width="28" height="28">
                <path d="M 7.335 0.6 a 0.667 0.667 0 0 0 -1.327 0 c -0.083 0.86 -0.457 2.21 -1.309 3.386
                         C 3.86 5.142 2.567 6.126 0.6 6.333 a 0.667 0.667 0 0 0 0 1.327
                         c 1.967 0.207 3.26 1.19 4.099 2.347 c 0.851 1.176 1.227 2.527 1.307 3.386
                         a 0.666 0.666 0 0 0 1.329 0 c 0.08 -0.86 0.456 -2.21 1.307 -3.386
                         c 0.839 -1.156 2.132 -2.14 4.099 -2.348 a 0.667 0.667 0 0 0 0 -1.326
                         c -1.967 -0.207 -3.26 -1.191 -4.1 -2.347 C 7.792 2.81 7.417 1.459 7.336 0.6 Z
                         m 11.979 6.186 a 1 1 0 0 1 1.415 -1.414 l 3.211 3.211 l -3.212 3.211
                         a 1 1 0 0 1 -1.414 -1.414 l 0.797 -0.797 h -0.862 a 4 4 0 0 0 -3.06 1.425
                         l -6.122 7.275 a 7.3 7.3 0 0 1 -1.383 1.279 c -0.51 0.352 -1.178 0.685 -1.905 0.685
                         v -2 c 0.137 0 0.4 -0.077 0.768 -0.331 c 0.35 -0.242 0.7 -0.577 0.99 -0.921
                         l 6.12 -7.275 a 6 6 0 0 1 4.592 -2.137 h 0.863 Z" fill="currentColor"/>
                <path d="M19.249 19.584a6 6 0 0 1-4.591-2.137l-.771-.917-.006-.007-.003-.003-.016-.02-.06-.07
                         a2 2 0 0 0-.118-.12l1.289-1.53a3.3 3.3 0 0 1 .42.433l.028.035.007.007.76.904
                         a4 4 0 0 0 3.06 1.425h.84l-.798-.797a1 1 0 0 1 1.414-1.415l3.212 3.212-3.212 3.211
                         a1 1 0 1 1-1.414-1.414l.797-.797z" fill="currentColor"/>
            </svg>
        `,
        repeat: `
            <svg viewBox="0 0 16 16" width="28" height="28">
                <path d="M0 4.75A3.75 3.75 0 0 1 3.75 1h8.5A3.75 3.75 0 0 1 16 4.75v5
                         a3.75 3.75 0 0 1-3.75 3.75H9.81l1.018 1.018a.75.75 0 1 1-1.06 1.06
                         L6.939 12.75l2.829-2.828a.75.75 0 1 1 1.06 1.06L9.811 12h2.439
                         a2.25 2.25 0 0 0 2.25-2.25v-5a2.25 2.25 0 0 0-2.25-2.25h-8.5
                         A2.25 2.25 0 0 0 1.5 4.75v5A2.25 2.25 0 0 0 3.75 12H5v1.5H3.75
                         A3.75 3.75 0 0 1 0 9.75z" fill="currentColor"/>
            </svg>
        `,
        repeat_one: `
            <svg viewBox="0 0 16 16" width="28" height="28">
                <path d="M0 4.75A3.75 3.75 0 0 1 3.75 1h.75v1.5h-.75A2.25 2.25 0 0 0 1.5 4.75v5
                         A2.25 2.25 0 0 0 3.75 12H5v1.5H3.75A3.75 3.75 0 0 1 0 9.75z
                         M12.25 2.5a2.25 2.25 0 0 1 2.25 2.25v5A2.25 2.25 0 0 1 12.25 12H9.81
                         l1.018-1.018a.75.75 0 0 0-1.06-1.06L6.939 12.75l2.829 2.828
                         a.75.75 0 1 0 1.06-1.06L9.811 13.5h2.439A3.75 3.75 0 0 0 16 9.75v-5
                         A3.75 3.75 0 0 0 12.25 1h-.75v1.5z" fill="currentColor"/>
                <path d="m8 1.85.77.694H6.095V1.488q1.046-.077 1.507-.385.474-.308.583-.913h1.32V8H8z" fill="currentColor"/>
                <path d="M8.77 2.544 8 1.85v.693z" fill="currentColor"/>
            </svg>
        `,
        repeat_on: `
            <svg viewBox="0 0 16 16" width="28" height="28">
                <path d="M0 4.75A3.75 3.75 0 0 1 3.75 1h8.5A3.75 3.75 0 0 1 16 4.75v5
                         a3.75 3.75 0 0 1-3.75 3.75H9.81l1.018 1.018a.75.75 0 1 1-1.06 1.06
                         L6.939 12.75l2.829-2.828a.75.75 0 1 1 1.06 1.06L9.811 12h2.439
                         a2.25 2.25 0 0 0 2.25-2.25v-5a2.25 2.25 0 0 0-2.25-2.25h-8.5
                         A2.25 2.25 0 0 0 1.5 4.75v5A2.25 2.25 0 0 0 3.75 12H5v1.5H3.75
                         A3.75 3.75 0 0 1 0 9.75z" fill="currentColor"/>
                <path d="M8 5.75A1.5 1.5 0 1 0 8 8.75A1.5 1.5 0 1 0 8 5.75Z" fill="currentColor"/>
            </svg>
        `,
        fav_on: `
            <svg viewBox="0 0 16 16" width="28" height="28">
                <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m11.748-1.97
                         a.75.75 0 0 0-1.06-1.06l-4.47 4.47-1.405-1.406
                         a.75.75 0 1 0-1.061 1.06l2.466 2.467 5.53-5.53z" fill="currentColor"/>
            </svg>
        `,
        fav_off: `
            <svg viewBox="0 0 16 16" width="28" height="28">
                <path d="M8 1.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13
                         M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8" fill="currentColor"/>
                <path d="M11.75 8a.75.75 0 0 1-.75.75H8.75V11a.75.75 0 0 1-1.5 0
                         V8.75H5a.75.75 0 0 1 0-1.5h2.25V5a.75.75 0 0 1 1.5 0
                         v2.25H11a.75.75 0 0 1 .75.75" fill="currentColor"/>
            </svg>
        `
    };

    // --- DOM Tagger & Interaction Logic ---
    window.tagDOM = function() {
        const bar = document.querySelector('aside[data-testid="now-playing-bar"]');
        if (bar) {
            bar.classList.add('sf-player-bar');
            const widget = bar.querySelector('[data-testid="now-playing-widget"]');
            if (widget) {
                widget.classList.add('sf-player-widget');
                const cover = widget.querySelector('[data-testid="CoverSlotCollapsed__container"]');
                if (cover && !cover.classList.contains('sf-fs-trigger')) {
                    cover.classList.add('sf-fs-trigger');
                    cover.addEventListener('click', (e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        openFullscreenPlayer();
                    });
                }
                for (let i = 0; i < widget.children.length; i++) {
                    let ch = widget.children[i];
                    if (!ch.querySelector('[data-testid="CoverSlotCollapsed__container"]') && ch.querySelector('a')) {
                        if (!ch.classList.contains('sf-track-info')) {
                            ch.classList.add('sf-track-info');
                            // Removed swipe gesture from mini-player song title
                            // setupSwipe(ch);
                        }
                        break;
                    }
                }
            }
        }

        // Setup swipe gesture ONLY on static cover art images, NOT video podcast containers
        let expArt = null;
        let coverImages = document.querySelectorAll('[data-testid="cover-art-image"]');
        for (let i = 0; i < coverImages.length; i++) {
            let img = coverImages[i];
            if (img.closest('aside[data-testid="now-playing-bar"]')) {
                continue;
            }
            if (img.closest('#main-view') || img.closest('.main-view-container') || img.closest('.YourLibraryX')) {
                continue;
            }
            expArt = img.parentElement || img;
            break;
        }
        if (expArt && !expArt.querySelector('video:not([src*="canvaz"])')) {
            setupSwipe(expArt);
        }
    };

    function openFullscreenPlayer() {
        if (document.getElementById('sf-fs-player')) return;
        const overlay = document.createElement('div');
        overlay.id = 'sf-fs-player';
        overlay.innerHTML = `
            <div id="sf-fs-bg"></div>
            <div class="sf-fs-top">
                <button class="sf-fs-min" aria-label="Close">
                    <svg viewBox="0 0 24 24" width="32" height="32">
                        <path d="M7 10l5 5 5-5z" fill="currentColor"/>
                    </svg>
                </button>

                <div class="sf-fs-top-right">
                    <button class="sf-fs-connect-btn" title="Connect">
                        <svg viewBox="0 0 16 16" width="22" height="22">
                            <path d="M6 2.75C6 1.784 6.784 1 7.75 1h6.5c.966 0 1.75.784 1.75 1.75v10.5
                                     A1.75 1.75 0 0114.25 15h-6.5A1.75 1.75 0 016 13.25zm1.75-.25
                                     a.25.25 0 00-.25.25v10.5c0 .138.112.25.25.25h6.5a.25.25 0 00.25-.25
                                     V2.75a.25.25 0 00-.25-.25zm-6 0a.25.25 0 00-.25.25v6.5c0 .138.112.25.25.25
                                     H4V11H1.75A1.75 1.75 0 010 9.25v-6.5C0 1.784.784 1 1.75 1H4v1.5z
                                     M4 15H2v-1.5h2z" fill="currentColor"/>
                            <path d="M13 10a2 2 0 11-4 0 2 2 0 014 0m-1-5a1 1 0 11-2 0 1 1 0 012 0" fill="currentColor"/>
                        </svg>
                    </button>
                    <button class="sf-fs-queue-btn" title="Queue">
                        <svg viewBox="0 0 16 16" width="22" height="22">
                            <path d="M15 15H1v-1.5h14zm0-4.5H1V9h14z
                                     m-14-7A2.5 2.5 0 013.5 1h9a2.5 2.5 0 010 5h-9
                                     A2.5 2.5 0 011 3.5zm2.5-1a1 1 0 100 2h9a1 1 0 100-2z" fill="currentColor"/>
                        </svg>
                    </button>
                </div>
            </div>
            <div class="sf-fs-art-container" id="sf-fs-art-wrap">
                <img id="sf-fs-art" crossorigin="anonymous" draggable="false">
            </div>
            <div class="sf-fs-player-card">
                <div class="sf-fs-info">
                    <h2 id="sf-fs-title"></h2>
                    <p id="sf-fs-artist"></p>
                </div>
                <div class="sf-fs-progress">
                    <span id="sf-fs-pos">0:00</span>
                    <div id="sf-fs-bar-container">
                        <div id="sf-fs-bar-rail">
                            <div id="sf-fs-bar-fill"></div>
                            <div id="sf-fs-bar-handle"></div>
                        </div>
                    </div>
                    <span id="sf-fs-dur">0:00</span>
                </div>
                <div class="sf-fs-controls">
                    <button class="sf-fs-prev"><span id="sf-fs-prev-svg"></span></button>
                    <button class="sf-fs-play"><svg id="sf-fs-play-svg"></svg></button>
                    <button class="sf-fs-next"><span id="sf-fs-next-svg"></span></button>
                </div>
                <div class="sf-fs-extra-controls">
                    <button class="sf-fs-shuffle-btn"><span id="sf-fs-shuffle-svg"></span></button>
                    <button class="sf-fs-like-btn"><span id="sf-fs-like-svg"></span></button>
                    <button class="sf-fs-repeat-btn"><span id="sf-fs-repeat-svg"></span></button>
                </div>
            </div>
        `;
        document.body.appendChild(overlay);
        document.body.classList.add('sf-fs-open');

        // Robust Event Listeners
        overlay.querySelector('.sf-fs-min').onclick = (e) => {
            e.preventDefault();
            e.stopPropagation();
            closeFullscreenPlayer();
        };
        overlay.querySelector('.sf-fs-connect-btn').onclick = openConnect;
        overlay.querySelector('.sf-fs-queue-btn').onclick = openQueue;
        overlay.querySelector('.sf-fs-prev').onclick = actSkipBack;
        overlay.querySelector('.sf-fs-play').onclick = (e) => actPlayPause(null, e);
        overlay.querySelector('.sf-fs-next').onclick = actSkipForward;
        overlay.querySelector('.sf-fs-shuffle-btn').onclick = actShuffle;
        overlay.querySelector('.sf-fs-like-btn').onclick = actAddToFav;
        overlay.querySelector('.sf-fs-repeat-btn').onclick = actRepeat;

        setupFullscreenGestures(overlay);

        // Dynamic color extraction from album art with CORS support
        window.sfExtractArtworkColors = function(coverUrl) {
            if (!coverUrl) return;
            try {
                const tempImg = new Image();
                tempImg.crossOrigin = 'anonymous';
                tempImg.onload = function() {
                    try {
                        const canvas = document.createElement('canvas');
                        canvas.width = 16;
                        canvas.height = 16;
                        const ctx = canvas.getContext('2d', { willReadFrequently: true });
                        ctx.drawImage(tempImg, 0, 0, 16, 16);
                        const data = ctx.getImageData(0, 0, 16, 16).data;

                        // Top-left area (3,3)
                        const idx1 = (3 * 16 + 3) * 4;
                        let r1 = data[idx1], g1 = data[idx1+1], b1 = data[idx1+2];

                        // Bottom-right area (12,12)
                        const idx2 = (12 * 16 + 12) * 4;
                        let r2 = data[idx2], g2 = data[idx2+1], b2 = data[idx2+2];

                        // If samples are near-black, sample center areas
                        if (r1 + g1 + b1 < 60) {
                            const idx3 = (8 * 16 + 8) * 4;
                            r1 = data[idx3]; g1 = data[idx3+1]; b1 = data[idx3+2];
                        }
                        if (r2 + g2 + b2 < 60) {
                            const idx4 = (12 * 16 + 4) * 4;
                            r2 = data[idx4]; g2 = data[idx4+1]; b2 = data[idx4+2];
                        }

                        const rgbToHsl = (r, g, b) => {
                            r /= 255; g /= 255; b /= 255;
                            const max = Math.max(r, g, b), min = Math.min(r, g, b);
                            let h, s, l = (max + min) / 2;
                            if (max === min) {
                                h = s = 0;
                            } else {
                                const d = max - min;
                                s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
                                switch (max) {
                                    case r: h = (g - b) / d + (g < b ? 6 : 0); break;
                                    case g: h = (b - r) / d + 2; break;
                                    case b: h = (r - g) / d + 4; break;
                                }
                                h /= 6;
                            }
                            return [h * 360, s * 100, l * 100];
                        };

                        let [h1, s1, l1] = rgbToHsl(r1, g1, b1);
                        let [h2, s2, l2] = rgbToHsl(r2, g2, b2);

                        // Ensure vibrant neon pastel properties
                        s1 = Math.max(75, s1);
                        s2 = Math.max(75, s2);
                        l1 = Math.max(55, Math.min(75, l1));
                        l2 = Math.max(55, Math.min(75, l2));

                        const color1 = `hsl(${h1.toFixed(1)}, ${s1.toFixed(1)}%, ${l1.toFixed(1)}%)`;
                        const color2 = `hsl(${h2.toFixed(1)}, ${s2.toFixed(1)}%, ${l2.toFixed(1)}%)`;

                        document.body.style.setProperty('--sf-art-color-from', color1);
                        document.body.style.setProperty('--sf-art-color-to', color2);
                    } catch (e) {
                        document.body.style.setProperty('--sf-art-color-from', '#9e80ff');
                        document.body.style.setProperty('--sf-art-color-to', '#ff9efc');
                    }
                };
                tempImg.onerror = function() {
                    document.body.style.setProperty('--sf-art-color-from', '#9e80ff');
                    document.body.style.setProperty('--sf-art-color-to', '#ff9efc');
                };
                tempImg.src = coverUrl;
            } catch (e) {}
        };

        const barContainer = document.getElementById('sf-fs-bar-container');
        barContainer.addEventListener('touchstart', (e) => {
            fsScrubbing = true;
            handleScrub(e);
        }, {passive: false});
        barContainer.addEventListener('touchmove', handleScrub, {passive: false});
        barContainer.addEventListener('touchend', () => {
            fsScrubbing = false;
        });
        updateFullscreenUI();
        fsUpdateTimer = setInterval(updateFullscreenUI, 500);
    }

    window.openConnect = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        closeFullscreenPlayer();
        document.querySelector('button[aria-label="Connect to a device"]')?.click();
    };

    window.openQueue = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        closeFullscreenPlayer();
        document.querySelector('button[data-testid="control-button-queue"]')?.click();
    };

    function handleScrub(e) {
        const rail = document.getElementById('sf-fs-bar-rail');
        const rect = rail.getBoundingClientRect();
        const x = e.touches[0].clientX - rect.left;
        const frac = Math.max(0, Math.min(1, x / rect.width));
        const pos = Math.round(frac * window.duration);
        actSeek(pos);
        updateProgressUI(pos, window.duration);
    }

    function updateFullscreenUI() {
        if (!document.getElementById('sf-fs-player')) {
            clearInterval(fsUpdateTimer);
            return;
        }
        document.getElementById('sf-fs-title').innerText = window.track || "No Track";
        document.getElementById('sf-fs-artist').innerText = window.artist || "No Artist";
        const art = document.getElementById('sf-fs-art');
        const bg = document.getElementById('sf-fs-bg');
        if (window.cover) {
            const bigCover = window.cover.replace('00004851', '0000b273');
            if (art.src !== bigCover) {
                art.crossOrigin = 'anonymous';
                art.src = bigCover;
                window.sfExtractArtworkColors(bigCover);
            }
            if (bg && bg.style.backgroundImage !== `url("${bigCover}")`) {
                bg.style.backgroundImage = `url("${bigCover}")`;
            }
        }

        document.getElementById('sf-fs-prev-svg').innerHTML = NATIVE_SVGS.previous;
        document.getElementById('sf-fs-next-svg').innerHTML = NATIVE_SVGS.next;

        const playSvg = document.getElementById('sf-fs-play-svg');
        if (playSvg) {
            playSvg.setAttribute('viewBox', '0 0 16 16');
            if (window.playing) {
                playSvg.innerHTML = `
                    <path d="M2.7 1a.7.7 0 00-.7.7v12.6a.7.7 0 00.7.7h2.6a.7.7 0 00.7-.7V1.7a.7.7 0 00-.7-.7z
                             m8 0a.7.7 0 00-.7.7v12.6a.7.7 0 00.7.7h2.6a.7.7 0 00.7-.7V1.7a.7.7 0 00-.7-.7z" fill="currentColor"/>
                `;
            } else {
                playSvg.innerHTML = `
                    <path d="M3 1.713a.7.7 0 011.05-.607l10.89 6.288
                             a.7.7 0 010 1.212L4.05 14.894A.7.7 0 013 14.287z" fill="currentColor"/>
                `;
            }
        }

        const shSvgWrap = document.getElementById('sf-fs-shuffle-svg');
        if (shSvgWrap) {
            if (window.shmode === 'mixed') {
                shSvgWrap.style.color = '#fff';
                shSvgWrap.innerHTML = NATIVE_SVGS.smart_shuffle;
            } else if (window.shmode === 'true') {
                shSvgWrap.style.color = '#fff';
                shSvgWrap.innerHTML = NATIVE_SVGS.shuffle;
            } else {
                shSvgWrap.style.color = '#b3b3b3';
                shSvgWrap.innerHTML = NATIVE_SVGS.shuffle;
            }
        }

        const repSvgWrap = document.getElementById('sf-fs-repeat-svg');
        if (repSvgWrap) {
            if (window.repmode === 'true') {
                repSvgWrap.style.color = '#fff';
                repSvgWrap.innerHTML = NATIVE_SVGS.repeat_on;
            } else if (window.repmode === 'mixed') {
                repSvgWrap.style.color = '#fff';
                repSvgWrap.innerHTML = NATIVE_SVGS.repeat_one;
            } else {
                repSvgWrap.style.color = '#b3b3b3';
                repSvgWrap.innerHTML = NATIVE_SVGS.repeat;
            }
        }

        const likeSvgWrap = document.getElementById('sf-fs-like-svg');
        if (likeSvgWrap) {
            if (window.isfav) {
                likeSvgWrap.style.color = '#fff';
                likeSvgWrap.innerHTML = NATIVE_SVGS.fav_on;
            } else {
                likeSvgWrap.style.color = '#b3b3b3';
                likeSvgWrap.innerHTML = NATIVE_SVGS.fav_off;
            }
        }

        if (!fsScrubbing) {
            updateProgressUI(window.position, window.duration);
        }
    }

    function updateProgressUI(pos, dur) {
        const fill = document.getElementById('sf-fs-bar-fill');
        const handle = document.getElementById('sf-fs-bar-handle');
        const posTxt = document.getElementById('sf-fs-pos');
        const durTxt = document.getElementById('sf-fs-dur');
        
        const safePos = (typeof pos === 'number' && isFinite(pos) && pos > 0) ? pos : 0;
        const safeDur = (typeof dur === 'number' && isFinite(dur) && dur > 0) ? dur : 0;
        
        if (safeDur > 0) {
            const pct = Math.max(0, Math.min(100, (safePos / safeDur) * 100));
            if (fill) fill.style.width = `${pct}%`;
            if (handle) handle.style.left = `${pct}%`;
        } else {
            if (fill) fill.style.width = '0%';
            if (handle) handle.style.left = '0%';
        }
        
        if (posTxt) posTxt.innerText = formatTime(pos);
        if (durTxt) durTxt.innerText = formatTime(dur);
    }

    function formatTime(ms) {
        if (typeof ms !== 'number' || !isFinite(ms) || ms < 0) {
            ms = 0;
        }
        const totalSec = Math.floor(ms / 1000);
        const min = Math.floor(totalSec / 60);
        const sec = totalSec % 60;
        return `${min}:${sec.toString().padStart(2, '0')}`;
    }

    window.closeFullscreenPlayer = function() {
        const overlay = document.getElementById('sf-fs-player');
        if (overlay) {
            overlay.remove();
            document.body.classList.remove('sf-fs-open');
            clearInterval(fsUpdateTimer);
        }
    };

    /**
     * Touch gesture engine for the SpotiCap Fullscreen Player Overlay (#sf-fs-player).
     * Handles:
     * 1. Horizontal swipe left/right on artwork or track info to skip tracks.
     * 2. Vertical drag-down on artwork, top header, or track info to collapse/exit the player (120px threshold).
     * 3. Ignores interactive controls (buttons, seek bar) to prevent accidental drags.
     */
    function setupFullscreenGestures(overlay) {
        let startX = null, startY = null;
        let mode = null; // 'h' = horizontal track skip, 'v' = vertical drag-down collapse
        let currentDx = 0, currentDy = 0;
        const artWrap = overlay.querySelector('#sf-fs-art-wrap');

        // Prevent Android WebView native scrolling from swallowing touchmove events
        overlay.style.touchAction = 'none';

        overlay.addEventListener('touchstart', (e) => {
            if (e.touches.length !== 1) return;
            // Ignore interactive control elements (buttons, progress bar, links, inputs)
            if (e.target.closest('button, #sf-fs-bar-container, a, input, select')) return;

            // Restrict gesture initiation to Artwork (#sf-fs-art-wrap), Header (.sf-fs-top), or Title/Artist (.sf-fs-info)
            const isTouchTarget = e.target.closest('#sf-fs-art-wrap, .sf-fs-top, .sf-fs-info');
            if (!isTouchTarget) return;

            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
            mode = null;
            currentDx = 0;
            currentDy = 0;

            overlay.style.transition = 'none';
            if (artWrap) artWrap.style.transition = 'none';
        }, { passive: true });

        overlay.addEventListener('touchmove', (e) => {
            if (startX === null || startY === null) return;
            const touch = e.touches[0];
            const dx = touch.clientX - startX;
            const dy = touch.clientY - startY;

            if (!mode) {
                const isArtOrInfo = e.target.closest('#sf-fs-art-wrap, .sf-fs-info');
                if (isArtOrInfo && Math.abs(dx) > 10 && Math.abs(dx) > Math.abs(dy)) {
                    mode = 'h';
                } else if (dy > 8 && dy > Math.abs(dx)) {
                    mode = 'v';
                }
            }

            if (mode === 'h' && artWrap) {
                currentDx = dx;
                artWrap.style.transform = `translateX(${dx}px)`;
                artWrap.style.opacity = Math.max(0.3, 1 - Math.abs(dx) / 250);
            } else if (mode === 'v') {
                currentDy = Math.max(0, dy);
                overlay.style.transform = `translateY(${currentDy}px)`;
                overlay.style.opacity = Math.max(0.1, 1 - (currentDy / (window.innerHeight * 0.6)));
            }
        }, { passive: true });

        const handleEnd = () => {
            if (startX === null) return;
            startX = null;
            startY = null;

            if (mode === 'h' && artWrap) {
                const threshold = artWrap.offsetWidth / 2;
                if (Math.abs(currentDx) > threshold) {
                    if (currentDx > 0) {
                        actSkipBack();
                    } else {
                        actSkipForward();
                    }
                    setTimeout(updateFullscreenUI, 300);
                }
                artWrap.style.transition = 'transform 0.3s ease, opacity 0.3s ease';
                artWrap.style.transform = '';
                artWrap.style.opacity = '';
            } else if (mode === 'v') {
                const dismissThreshold = 120; // 120px pull-to-dismiss distance threshold
                if (currentDy > dismissThreshold) {
                    overlay.style.transition = 'transform 0.2s ease-out, opacity 0.2s ease-out';
                    overlay.style.transform = 'translateY(100%)';
                    overlay.style.opacity = '0';
                    setTimeout(() => {
                        closeFullscreenPlayer();
                    }, 200);
                } else {
                    overlay.style.transition = 'transform 0.3s ease-out, opacity 0.3s ease-out';
                    overlay.style.transform = '';
                    overlay.style.opacity = '';
                }
            } else {
                overlay.style.transition = 'transform 0.3s ease-out, opacity 0.3s ease-out';
                overlay.style.transform = '';
                overlay.style.opacity = '';
            }
            mode = null;
        };

        overlay.addEventListener('touchend', handleEnd);
        overlay.addEventListener('touchcancel', handleEnd);
    }

    /**
     * Touch swipe helper for non-fullscreen elements (e.g. expanded now playing bar artwork).
     */
    function setupSwipe(el, isFs = false) {
        if (el._sfSwipeAttached) return;
        el._sfSwipeAttached = true;
        el.style.touchAction = 'pan-y';
        el.style.userSelect = 'none';
        el.style.webkitUserDrag = 'none';
        el.addEventListener('dragstart', (e) => e.preventDefault());
        
        // Also apply drag/selection prevention to nested images to prevent browser drag events
        el.querySelectorAll('img').forEach(img => {
            img.style.webkitUserDrag = 'none';
            img.style.userSelect = 'none';
            img.addEventListener('dragstart', (e) => e.preventDefault());
        });
        
        let startX = null, swiping = false;
        let currentDx = 0;
        
        el.addEventListener('touchstart', (e) => {
            if (e.touches.length !== 1) return;
            startX = e.touches[0].clientX;
            swiping = false;
            currentDx = 0;
            el.style.transition = 'none';
        }, { passive: true });

        el.addEventListener('touchmove', (e) => {
            if (startX === null) return;
            let dx = e.touches[0].clientX - startX;
            if (!swiping && Math.abs(dx) > 10) {
                swiping = true;
            }
            if (swiping) {
                currentDx = dx;
                el.style.transform = `translateX(${dx}px)`;
                el.style.opacity = Math.max(0.3, 1 - Math.abs(dx) / 250);
            }
        }, { passive: true });

        el.addEventListener('touchend', () => {
            if (startX === null) return;
            startX = null;
            let threshold = el.offsetWidth / 2;
            if (swiping && Math.abs(currentDx) > threshold) {
                if (currentDx > 0) {
                    actSkipBack();
                } else {
                    actSkipForward();
                }
            }
            el.style.transition = 'transform 0.3s ease, opacity 0.3s ease';
            el.style.transform = '';
            el.style.opacity = '';
        });
    }

    // Dismiss search input focus/dropdown when tapping anywhere outside the search form
    document.addEventListener('click', function(e) {
        // Skip interception for mouse pointer events (Smart TV mice, desktop)
        if (e.pointerType === 'mouse') return;

        // Strictly match music tracklist rows ONLY (leave all podcasts 100% native default)
        const row = e.target.closest('[data-testid="tracklist-row"]');
        if (!row) return;
        
        // Never intercept inside sidebar, navigation drawers, or library lists
        if (row.closest('aside') || row.closest('nav') || row.closest('.YourLibraryX')) return;

        // If user tapped inside a popup menu, dialog, or dropdown options, let native interaction happen
        if (e.target.closest('[role="menu"], [role="menuitem"], [role="menuitemcheckbox"], [data-testid*="menu"], [data-tippy-root], #context-menu')) return;

        // If user tapped directly on a button, link, or input, let native interaction happen
        if (e.target.closest('button, a[href], input, textarea')) return;

        const playBtn = row.querySelector('button[data-testid="play-button"]') || 
                        row.querySelector('button[aria-label*="Play"]') || 
                        row.querySelector('button[aria-label*="play"]');
        if (playBtn) {
            e.preventDefault();
            e.stopPropagation();
            const sr = document.querySelector('input[data-testid="search-input"]');
            if (sr) {
                sr.blur();
            }
            playBtn.click();
        }
    }, true);

    // Dismiss search input focus/dropdown when tapping anywhere outside the search form
    let _sfCollapseDebounceMs = 0; // prevents double-click from touchstart+mousedown toggling the bar
    const _sfCollapseSearchBar = (sr, sb, reason) => {
        const now = Date.now();
        if (now - _sfCollapseDebounceMs < 400) {
            return;
        }
        _sfCollapseDebounceMs = now;
        sb.click();
        // After bar collapses, clean up any lingering dropdown that Spotify keeps mounted
        setTimeout(() => {
            const searchForm2 = document.querySelector('form[role="search"]');
            const drop = searchForm2?.querySelector('[role="listbox"]') ||
                          searchForm2?.querySelector('[data-tippy-root]');
            if (drop && sr?.getAttribute('aria-expanded') !== 'true') {
                drop.style.setProperty('display', 'none', 'important');
                // Restore after a tick so React doesn't break on remount
                requestAnimationFrame(() => drop.style.removeProperty('display'));
            }
        }, 300);
    };

    const dismissSearch = (e) => {
        const searchForm = document.querySelector('form[role="search"]');
        if (!searchForm) return;

        const isInsideForm = searchForm.contains(e.target);

        // Narrow dropdown to only elements INSIDE the search form — avoids false-positives
        // from home-page grids that also use role="listbox"
        const searchDropdownEl = searchForm.querySelector('[role="listbox"]') ||
                                  searchForm.querySelector('[data-tippy-root]') ||
                                  searchForm.querySelector('[role="dialog"]');
        const isInsideDropdown = !!(searchDropdownEl && searchDropdownEl.contains(e.target));
        const isInsideInputArea = isInsideForm && !isInsideDropdown;

        const sr = document.querySelector('input[data-testid="search-input"]');

        if (isInsideInputArea) {
            // Tapping the input/search-button area — let normal focus flow handle it
            return;
        }

        if (isInsideDropdown) {
            // Tapping inside the search dropdown — only act on play-button / album-art taps
            const isPlayClick = e.target.closest('[class*="header-side"]') ||
                                 e.target.closest('[id*="-play"]') ||
                                  e.target.closest('button[aria-label*="Play" i]') ||
                                  e.target.closest('button[aria-label*="Pause" i]') ||
                                  e.target.closest('[data-testid="entity-image"]') ||
                                  (e.target.closest('[data-encore-id="listRow"]') && (e.target.tagName === 'IMG' || e.target.closest('[class*="header-side-flex"]')));
            if (isPlayClick && sr) {
                window._sfBlurFromDropdown = true;
                sr.blur();
                // Spotify may blur the input itself before our blur() runs (no blur event fires).
                // After 50ms, if the blur handler never consumed the flag, advance it to 'pending'
                // so gobserver can collapse the bar when the dropdown is removed from DOM.
                setTimeout(() => {
                    if (window._sfBlurFromDropdown === true) {
                        window._sfBlurFromDropdown = 'pending';
                    }
                }, 50);
            }
        } else {
            // Tapping completely outside the form

            // Clear any stale pending state from a previous play-in-dropdown
            if (window._sfBlurFromDropdown) {
                window._sfBlurFromDropdown = false;
            }

            const sb = sr?.closest('form')?.querySelector('button[data-testid="search-icon"]');
            const isAriaExpanded = sr?.getAttribute('aria-expanded') === 'true';
            const isPort = window.matchMedia('(orientation: portrait)').matches;

            if (isAriaExpanded && isPort && sb) {
                _sfCollapseSearchBar(sr, sb, 'Outside tap aria-expanded=true');
            } else {
                // Not expanded or landscape — just blur
                if (sr) sr.blur();
            }
        }
    };
    document.addEventListener('touchstart', dismissSearch, { capture: true, passive: true });
    // Only attach mousedown dismissal for touch-emulated mice (pointerType check inside),
    // not for real mouse devices (Smart TV, desktop) to avoid eating login/input clicks.
    document.addEventListener('mousedown', function(e) {
        if (e.pointerType === 'mouse') return;
        dismissSearch(e);
    }, { capture: true });

    // -------------------------------------------------------------------------
    // TV / D-PAD FOCUS HIGHLIGHT
    // Add body.sf-tv-nav on first keydown (TV remote / keyboard) to activate
    // the Spotify-green focus ring CSS. Remove it on touchstart so the ring
    // never shows for phone / tablet users.
    // -------------------------------------------------------------------------
    let _sfTvNavActive = false;
    document.addEventListener('keydown', function(e) {
        // D-pad keys: DPAD_CENTER(23), UP(19), DOWN(20), LEFT(21), RIGHT(22)
        // Also handle Tab and Enter for desktop keyboard nav
        const tvKeys = [9, 13, 19, 20, 21, 22, 23, 37, 38, 39, 40];
        if (!_sfTvNavActive && tvKeys.includes(e.keyCode)) {
            _sfTvNavActive = true;
            document.body.classList.add('sf-tv-nav');
        }
    }, { capture: true, passive: true });
    document.addEventListener('touchstart', function() {
        if (_sfTvNavActive) {
            _sfTvNavActive = false;
            document.body.classList.remove('sf-tv-nav');
        }
    }, { capture: true, passive: true });
    document.addEventListener('mousedown', function(e) {
        // Real mouse click (Smart TV mouse pointer) — keep nav mode off
        if (e.pointerType === 'mouse' && _sfTvNavActive) {
            _sfTvNavActive = false;
            document.body.classList.remove('sf-tv-nav');
        }
    }, { capture: true, passive: true });

    // =========================================================================
    // SECTION 2: FETCH & CREDENTIAL INTERCEPTION
    // =========================================================================

    const canvasSelector = [
        '#VideoPlayerNpv_ReactPortal video',
        '.canvasVideoContainerNPV video',
        '[data-testid="track-visual-enhancement"] ~ div video',
        '[data-testid="canvas-video"] video',
        '.VideoPlayer__container video'
    ].join(', ');

    window.SF_UPDATE = function(config) {
        if (!config) return;
        window.SF_CONFIG = Object.assign(window.SF_CONFIG || {}, config);
        
        if (typeof config.isCanvasDisabled !== 'undefined') {
            if (config.isCanvasDisabled) {
                document.body.classList.add('sf-hide-canvas');
                document.body.classList.remove('sf-video-bg');
            } else {
                document.body.classList.remove('sf-hide-canvas');
                document.body.classList.add('sf-video-bg');
            }
        }

        if (typeof config.isFullScreenEnabled !== 'undefined') {
            if (config.isFullScreenEnabled) {
                document.body.classList.add('sf-fullscreen-enabled');
                document.body.classList.remove('sf-fullscreen-disabled');
            } else {
                document.body.classList.remove('sf-fullscreen-enabled');
                document.body.classList.add('sf-fullscreen-disabled');
            }
        }

        if (typeof config.isAmoled !== 'undefined') {
            const amStyleId = 'sf-amoled-override';
            let style = document.getElementById(amStyleId);
            if (config.isAmoled) {
                if (!style) {
                    style = document.createElement('style');
                    style.id = amStyleId;
                    style.textContent = `
                        .encore-dark-theme {
                            --background-base: #000 !important;
                            --background-highlight: #000 !important;
                            --background-elevated-base: #000 !important;
                            --background-elevated-highlight: #000 !important;
                            --background-elevated-press: #000 !important;
                            --background-tinted-base: #000 !important;
                        }
                        aside[data-testid=now-playing-bar] {
                            background: #000 !important;
                            box-shadow: none;
                            border-top: 1px solid #666;
                        }
                    `;
                    document.head.appendChild(style);
                }
            } else if (style) {
                style.remove();
            }
        }
    };

    window.syncUserInfo = function() {};

    window.updMedia = function(force = false) {
        const currState = [
            window.track || "",
            window.artist || "",
            window.playing,
            window.repmode || "",
            window.shmode || "",
            window.isfav,
            window.cover || ""
        ].join('|');
        if (force || currState !== lastState) {
            lastState = currState;
            const values = {
                artist: window.artist || "No Artist",
                track: window.track || "No Track",
                playing: window.playing,
                repeat: window.repmode || "false",
                shuffle: window.shmode || "false",
                fav: window.isfav,
                cover: window.cover || "",
                duration: window.duration || 0,
                position: window.position || 0
            };
            AndBridge.recMediaStatus(JSON.stringify(values));
            lastPos = window.position;
        } else if (window.playing) {
            if (lastPos === null || Math.abs(window.position - lastPos) >= 3000) {
                AndBridge.recMediaPosition(window.position);
                lastPos = window.position;
            }
        }
        window.syncUserInfo();
    };

    // Leave Spotify's network stack untouched: no Authorization interception,
    // token persistence, CORS proxy, or private endpoint calls.

    // =========================================================================
    // SECTION 3: WAKE LOCK & BACKGROUND CONTROL
    // =========================================================================

    function officialSpotifyUrl(uri) {
        if (!uri) return null;
        const value = String(uri).trim();
        if (/^https:\/\//i.test(value)) {
            try {
                const parsed = new URL(value);
                if (parsed.hostname !== 'open.spotify.com' || parsed.port || parsed.username || parsed.password) return null;
                return `https://open.spotify.com${parsed.pathname}${parsed.search}${parsed.hash}`;
            } catch (_) {
                return null;
            }
        }
        if (value === 'spotify:collection:tracks') return 'https://open.spotify.com/collection/tracks';
        const match = value.match(/^spotify:(track|album|artist|playlist|show|episode):([A-Za-z0-9]+)(?::.*)?$/i);
        if (!match) return null;
        return `https://open.spotify.com/${match[1].toLowerCase()}/${match[2]}`;
    }

    // External intents are routed to Spotify's own Web Player page. Playback and
    // access checks remain in Spotify's UI; Melodix does not issue player commands.
    window.playFromUri = function(uri) {
        if (!uri) return;
        const value = String(uri);
        if (value.startsWith('spotify:search:')) {
            const encodedQuery = value.substring('spotify:search:'.length);
            let query = encodedQuery;
            try {
                query = decodeURIComponent(encodedQuery);
            } catch (_) {}
            window.openSearch(query);
            return;
        }
        const target = officialSpotifyUrl(value);
        if (!target) {
            console.warn('[Melodix] Unsupported Spotify URI; open it in the official Spotify player.');
            return;
        }
        window.location.assign(target);
    };

    window.searchAndPlay = function(query) {
        if (query) window.openSearch(query);
    };

    window.openSearch = function(query) {
        const value = String(query || '').trim();
        if (!value) return;
        window.location.assign(`https://open.spotify.com/search/${encodeURIComponent(value)}`);
    };

    window.firstFuck = function() {
        if (pfint) clearInterval(pfint);
        pfint = setInterval(() => {
            if (typeof window.syncUserInfo === 'function') {
                window.syncUserInfo();
            }

            if (document.visibilityState === 'visible') {
                AndBridge.wakeUp();
            } else if (window.playing && document.visibilityState === 'hidden') {
                AndBridge.wakeUp();
            }
            
            window.syncNpBtnPos = function() {
                if (window.SF_CONFIG && window.SF_CONFIG.guiMode === "csshack") {
                    let lyBtn = document.querySelector('button[data-testid="lyrics-button"]');
                    let queueBtn = document.querySelector('button[aria-label*="Queue" i]') || document.querySelector('button[data-testid*="queue"]');
                    let connectBtn = document.querySelector('button[aria-label*="Connect" i]') || document.querySelector('button[data-testid*="connect"]');
                    let fallbackContainer = document.querySelector('aside[data-testid="now-playing-bar"] > div > div:last-child');
                    let anchorBtn = lyBtn || queueBtn || connectBtn;

                    if (anchorBtn && anchorBtn.parentNode) {
                        if (typeof window.npBtn === 'undefined') {
                            window.npBtn = document.createElement('button');
                            window.npBtn.className = 'npbtn';
                            window.npBtn.onclick = clickNP;
                            window.npBtn.innerHTML = `
                                <svg viewBox="0 0 16 17">
                                    <rect x="1" y="0.75" width="14" height="15.5" rx="2" fill="none" stroke="currentColor" stroke-width="1.5"/>
                                    <path d="M 6 5 L 6 5.9160156 L 9.6933594 8.5 L 6 11.080078 L 6 12 L 11 8.5 L 6 5 z"
                                          stroke="currentColor" stroke-width="1.2"/>
                                </svg>
                            `;
                        }
                        if (window.npBtn.nextSibling !== anchorBtn) {
                            anchorBtn.parentNode.insertBefore(window.npBtn, anchorBtn);
                        }
                    } else if (fallbackContainer && (!window.npBtn || !document.body.contains(window.npBtn))) {
                        if (typeof window.npBtn === 'undefined') {
                            window.npBtn = document.createElement('button');
                            window.npBtn.className = 'npbtn';
                            window.npBtn.onclick = clickNP;
                            window.npBtn.innerHTML = `
                                <svg viewBox="0 0 16 17">
                                    <rect x="1" y="0.75" width="14" height="15.5" rx="2" fill="none" stroke="currentColor" stroke-width="1.5"/>
                                    <path d="M 6 5 L 6 5.9160156 L 9.6933594 8.5 L 6 11.080078 L 6 12 L 11 8.5 L 6 5 z"
                                          stroke="currentColor" stroke-width="1.2"/>
                                </svg>
                            `;
                        }
                        fallbackContainer.appendChild(window.npBtn);
                    }
                }
            };
            window.syncNpBtnPos();
            
            let pb = document.querySelector('button[data-testid=control-button-playpause]:not(.fuckd)') ||
                     document.querySelector('aside button[data-testid=control-button-playpause]:not(.fuckd)');
            if (pb) {
                AndBridge.playLoaded();
                pb.classList.add('fuckd');
                window.pBtn = pb;
                window.pBtn.addEventListener('click', () => {
                    if (window.pBtn.getAttribute('aria-label') !== 'Play') {
                        reqPause = true;
                        ulFlag = false;
                        manageWake(false);
                    } else if (!ulFlag) {
                        reqPause = false;
                        manageWake(true);
                        ulFlag = true;
                        setTimeout(() => {
                            if (ulFlag) {
                                if (window.pBtn && window.pBtn.getAttribute('aria-label') === 'Play') {
                                    console.warn('[Melodix] Playback did not start; automatic skip cancelled.');
                                }
                                // Release the retry guard, but never advance past the selected track.
                                ulFlag = false;
                            }
                        }, 10000);
                    }
                });
                
                if (!ffDone) {
                    ffDone = true;
                    addGlobalCleanup();
                    addAutoFeatures();
                    addCSSJSHack();
                    addAndAuto();
                    tagDOM();
                    if (tagint) clearInterval(tagint);
                    tagint = setInterval(tagDOM, 2000);
                    manageAll(window.playing || false);
                }
            }
        }, 5000);
    };

    window.manageWake = function(enable) {
        if (enable) {
            if (document.visibilityState == 'hidden') AndBridge.wakeUp();
        } else {
            let hasCanvas = !window.SF_CONFIG.isCanvasDisabled && !!document.querySelector(canvasSelector);
            if (!AndBridge.isWoke() && document.visibilityState == 'visible' && !hasCanvas) {
                AndBridge.wakeOff();
            }
        }
    };

    window.manageAll = function(play) {
        window.playing = play;
        AndBridge.manageTShut(!play);
        AndBridge.manageTSleep(play);
        if (play) {
            firstFuck();
            addGlobalCleanup();
            addAutoFeatures();
            addCSSJSHack();
            addAndAuto();
        }
        updMedia();
    };

    window.clickNP = function() {
        let rBtn = document.querySelector('#Desktop_PanelContainer_Id')?.parentNode?.parentNode?.nextElementSibling?.querySelector('button');
        if (rBtn) {
            let npHid = document.querySelector('#Desktop_PanelContainer_Id').parentNode.parentNode.ariaHidden;
            if (typeof window.npBtn !== 'undefined') {
                if (npHid && npHid == 'true') {
                    window.npBtn.classList.add('active');
                } else {
                    window.npBtn.classList.remove('active');
                }
            }
            rBtn.click();
        }
    };

    window.closeNowPlay = function() {
        let rc = document.querySelector('#Desktop_PanelContainer_Id');
        if (rc && rc.parentNode.parentNode.ariaHidden == 'false') {
            let rBtn = rc.parentNode?.parentNode?.nextElementSibling?.querySelector('button');
            if (rBtn) rBtn.click();
        }
    };

    window.trigUnlock = function() {
        let uint = setInterval(() => {
            if (window.pBtn.disabled) {
                AndBridge.deferMessage('reload');
                window.location.reload();
            } else if (window.pBtn.getAttribute('aria-label') !== 'Play') {
                clearInterval(uint);
                ulFlag = false;
            }
        }, 3000);
    };

    window.actPlayPause = function(play, e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        const pb = document.querySelector('button[data-testid="control-button-playpause"]') || window.pBtn;
        if (!pb) return;
        
        if (play === null || typeof play === 'undefined') {
            pb.click();
        } else if (play === true) {
            if (!window.playing) pb.click();
        } else if (play === false) {
            if (window.playing) pb.click();
        }
    };

    window.actSkipBack = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        let bb = document.querySelector('button[data-testid=control-button-skip-back]');
        if (bb) {
            manageWake(true);
            bb.click();
        }
    };

    window.actSkipForward = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        let fb = document.querySelector('button[data-testid=control-button-skip-forward]');
        if (fb) {
            manageWake(true);
            fb.click();
        }
    };

    window.actRepeat = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        let rb = document.querySelector('button[data-testid=control-button-repeat]');
        if (rb) {
            rb.click();
            setTimeout(() => addAndAuto(true), 100);
            setTimeout(() => addAndAuto(true), 500);
        }
    };

    function getShuffleButton() {
        let sb = document.querySelector('button[data-testid="control-button-shuffle"]') ||
                 document.querySelector('button[data-testid*="shuffle"]') ||
                 document.querySelector('button[aria-label*="shuffle" i]');
        if (!sb) {
            let container = document.querySelector('div[data-testid="player-controls"]') ||
                            document.querySelector('aside[data-testid="now-playing-bar"]');
            if (container) {
                let btns = container.querySelectorAll('button');
                if (btns && btns.length >= 4) {
                    sb = btns[0];
                }
            }
        }
        return sb;
    }

    window.actShuffle = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        let sb = getShuffleButton();
        if (sb) {
            sb.click();
            setTimeout(() => {
                if (typeof window.syncShuffleState === 'function') window.syncShuffleState();
                if (typeof updMedia === 'function') updMedia(true);
            }, 150);
        }
    };

    window.actAddToFav = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        let fb = document.querySelector('div[data-testid=now-playing-widget]>div:last-child>button');
        if (fb) {
            fb.click();
            setTimeout(() => addAndAuto(true), 100);
            setTimeout(() => addAndAuto(true), 500);
        }
    };

    window.actSeek = function(pos) {
        let rg = document.querySelector('div[data-testid=playback-progressbar] input[type=range]');
        if (rg) {
            rg.value = pos;
            rg.dispatchEvent(new Event('change', { bubbles: true }));
        }
    };

    window.findCanvasToggle = function() {
        // Try the current known ID first
        let el = document.getElementById('settings.videos-and-canvas.canvas');
        if (el) return el;
        // Fallback: find a label whose visible text is exactly "Canvas" and grab its checkbox
        for (let label of document.querySelectorAll('label[for]')) {
            if ((label.textContent || '').trim() === 'Canvas') {
                try {
                    let cb = document.getElementById(label.htmlFor) || document.querySelector('#' + CSS.escape(label.htmlFor));
                    if (cb && cb.type === 'checkbox') return cb;
                } catch(e) {}
            }
        }
        return null;
    };

    window.syncCanvasToggle = function(el) {
        // Kept empty to prevent Spotify's internal global video player from being disabled for Video Podcasts
    };

    window.addGlobalCleanup = function() {
        let gst = document.createElement('style');
        gst.id = 'global-cleanup-style';
        gst.textContent = `
            /* Hide generic banners, but preserve login/form error alerts */
            div[data-encore-id=banner]:not([class*="error" i]):not(:has([role="alert"])):not([role="alert"]),
            #global-nav-bar > div:first-of-type,
            #global-nav-bar a[href="/download"],
            #global-nav-bar button[aria-label*="Upgrade" i],
            #global-nav-bar button[aria-label*="Premium" i],
            #global-nav-bar button[aria-label*="Explore" i],
            #global-nav-bar a[href*="premium" i],
            a[href*="spotify.com/premium"],
            [data-testid="upgrade-button"],
            button[aria-label*="Explore Premium"],
            button[aria-label*="Upgrade"],
            div.main-view-container__mh-footer-container,
            button[data-testid="open-in-desktop-app"],
            [data-testid="desktop-client-button"],
            a[href="/download"],
            button[aria-label="Open in Desktop app"],
            [aria-label="Download Spotify"],
            [data-testid="top-bar-download-button"],
            a[href*="desktop-download"],
            button[aria-label*="Download"],
            #Desktop_LeftSidebar_Id a[href*="/download"],
            #Desktop_LeftSidebar_Id button[aria-label*="Download"] {
                display: none !important;
            }

            aside[data-testid="now-playing-bar"],
            .lbtn {
                z-index: calc(var(--above-everything-grid-area-z-index) + 10) !important;
                opacity: 1 !important;
                visibility: visible !important;
            }

            .sf-hide-canvas .canvasVideoContainerNPV,
            .sf-hide-canvas [data-testid="canvas-video"],
            .sf-hide-canvas video[src*="canvaz"] {
                display: none !important;
            }

            .sf-hide-canvas [data-testid="track-visual-enhancement"] {
                display: block !important;
                pointer-events: auto !important;
                transform: none !important;
            }

            .sf-hide-canvas [data-testid="track-visual-enhancement"] img {
                display: block !important;
            }
        `;
        if (!document.getElementById('global-cleanup-style')) {
            document.head.appendChild(gst);
        }

        if (typeof window.gobserver === 'undefined') {
            window.gobserver = new MutationObserver((mutations) => {
                mutations.forEach((mutation) => {
                    // ── Removed nodes: detect search dropdown leaving DOM ──────────────
                    mutation.removedNodes.forEach((node) => {
                        if (node.nodeType === 1 && window._sfBlurFromDropdown === 'pending') {
                            // Check if this removed node IS or CONTAINS the search dropdown
                            const isDropdown = (node.getAttribute?.('role') === 'listbox' ||
                                               node.getAttribute?.('role') === 'dialog' ||
                                               node.hasAttribute?.('data-tippy-root')) &&
                                              (node.querySelector?.('[data-encore-id="typeList"]') ||
                                               node.querySelector?.('[class*="type-list"]') ||
                                               (node.querySelector?.('[data-encore-id="listRow"]') && !node.querySelector?.('[role="menu"]')));
                            if (isDropdown) {
                                window._sfBlurFromDropdown = false;
                                const sr2 = document.querySelector('input[data-testid="search-input"]');
                                const sb2 = sr2?.closest('form')?.querySelector('button[data-testid="search-icon"]');
                                if (sr2 && sb2) {
                                    const isExpandedNow = sr2.getAttribute('aria-expanded') === 'true' || sr2.offsetWidth > 60;
                                    if (isExpandedNow) sb2.click();
                                }
                            }
                        }
                    });

                    // ── Added nodes ──────────────────────────────────────────────────────
                    mutation.addedNodes.forEach((node) => {
                        if (node.nodeType === 1) {
                            node.querySelectorAll("button, a, span").forEach(el => {
                                let txt = (el.innerText || "").toLowerCase();
                                const blockedTexts = [
                                    'open in desktop app', 'open app', 'install app',
                                    'download spotify', 'explore premium', 'upgrade to premium', 'get premium'
                                ];
                                if (blockedTexts.some(t => txt.includes(t))) {
                                    el.style.setProperty('display', 'none', 'important');
                                    if (el.closest('nav') || el.closest('#Desktop_LeftSidebar_Id') || el.closest('#global-nav-bar')) {
                                        let p = el.parentElement;
                                        if (p && p.childNodes.length === 1) {
                                            p.style.setProperty('display', 'none', 'important');
                                        }
                                    }
                                }
                            });
                            
                            let cv = findCanvasToggle();
                            if (cv && node.contains(cv)) {
                                syncCanvasToggle(cv);
                            }
                            
                            if (window.SF_CONFIG.isCanvasDisabled) {
                                node.querySelectorAll("[role='menuitem'], li").forEach(el => {
                                    let txt = (el.innerText || "").toLowerCase();
                                    if (txt.includes('canvas') && !txt.includes('artwork') && !txt.includes('album art')) {
                                        el.style.setProperty('display', 'none', 'important');
                                    }
                                });
                            }
                        }
                    });
                });
                if (typeof window.syncNpBtnPos === 'function') {
                    window.syncNpBtnPos();
                }
            });
            window.gobserver.observe(document.body, { childList: true, subtree: true });
        }
    };

    window.addAutoFeatures = function() {
        if (window.SF_CONFIG.autoPlayMode === "onetime") {
            if ('pBtn' in window && firstPlay && window.pBtn.getAttribute('aria-label') === 'Play') {
                window.pBtn.click();
                firstPlay = false;
            }
        }
        
        if (window.SF_CONFIG.closeNowPlay ||
            window.SF_CONFIG.takeControl ||
            window.SF_CONFIG.autoPlayMode === "permanent" ||
            typeof window.SF_CONFIG.isCanvasDisabled !== 'undefined') {
            if (afint) clearInterval(afint);
            afint = setInterval(() => {
                if (typeof window.SF_CONFIG.isCanvasDisabled !== 'undefined') {
                    let cv = findCanvasToggle();
                    if (cv) syncCanvasToggle(cv);
                }
                if (window.SF_CONFIG.closeNowPlay) {
                    closeNowPlay();
                }
                if (window.SF_CONFIG.takeControl) {
                    let ft = document.querySelector('aside div.encore-bright-accent-set button');
                    if (ft) {
                        ft.click();
                        setTimeout(() => {
                            let cb = document.querySelector('aside ul[role=list] li[role=listitem] div[role=button]');
                            if (cb) cb.click();
                        }, 500);
                    }
                }
                if (window.SF_CONFIG.autoPlayMode === "permanent") {
                    if ('pBtn' in window && !reqPause && !ulFlag && window.pBtn.getAttribute('aria-label') === 'Play') {
                        window.pBtn.click();
                    }
                }
            }, 5000);
        }
    };

    window.addAndAuto = function(once = false) {
        const run = () => {
            let ta = document.querySelector('a[data-testid=context-item-link]');
            if (ta) {
                window.track = ta.innerText;
            } else {
                window.track = null;
            }
            
            let aa = document.querySelector('a[data-testid=context-item-info-artist]') || document.querySelector('a[data-testid=context-item-info-show]');
            if (aa) {
                window.artist = aa.innerText;
            } else {
                window.artist = '';
            }
            
            let rr = document.querySelector('button[data-testid=control-button-repeat]');
            if (rr) {
                window.repmode = rr.getAttribute('aria-checked');
            } else {
                window.repmode = 'false';
            }
            
            window.syncShuffleState = function() {
                let sh = getShuffleButton();

                if (sh) {
                    let html = sh.innerHTML || "";
                    let checked = sh.getAttribute('aria-checked') || sh.getAttribute('aria-pressed');
                    let isActive = checked === 'true' || checked === 'mixed' || sh.classList.contains('encore-internal-color-text-bright-accent');
                    let isSmartPath = html.includes('4.502') || html.includes('M4.502') || html.includes('sparkle') || checked === 'mixed';

                    if (!isActive) {
                        window.shmode = 'false';
                    } else if (isSmartPath) {
                        window.shmode = 'mixed';
                    } else {
                        window.shmode = 'true';
                    }
                } else {
                    window.shmode = 'false';
                }
            };

            let sh = getShuffleButton();
            if (sh && !sh.classList.contains('sf-click-bind')) {
                sh.classList.add('sf-click-bind');
                sh.addEventListener('click', () => {
                    setTimeout(() => {
                        if (typeof window.syncShuffleState === 'function') window.syncShuffleState();
                        if (typeof updMedia === 'function') updMedia(true);
                    }, 150);
                });
            }

            window.syncShuffleState();
            
            let fb = document.querySelector('div[data-testid=now-playing-widget]>div:last-child>button');
            if (fb && fb.getAttribute('aria-checked') === 'true') {
                window.isfav = true;
            } else {
                window.isfav = false;
            }
            
            let rg = document.querySelector('div[data-testid=playback-progressbar] input[type=range]');
            if (rg) {
                window.duration = parseInt(rg.getAttribute('max'));
                window.position = parseInt(rg.getAttribute('value'));
            } else {
                window.duration = null;
                window.position = null;
            }
            
            let im = document.querySelector('img[data-testid=cover-art-image]');
            if (im) {
                window.cover = im.src;
            } else {
                window.cover = null;
            }
            
            if (document.body.classList.contains('sf-expanded')) {
                let candidates = Array.from(document.querySelectorAll('div[style*="--cinema-mode-bg-color-from"]'));
                let cs = candidates.find(el => el.offsetParent !== null || el.getClientRects().length > 0) || candidates[candidates.length - 1];
                if (cs) {
                    ['--cinema-mode-bg-color-from', '--cinema-mode-bg-color-to', '--background-base'].forEach(v => {
                        let val = cs.style.getPropertyValue(v).trim();
                        if (val) document.body.style.setProperty(v, val);
                    });
                }
            }
            updMedia(once);
        };
        
        if (once) {
            run();
            return;
        }
        if (aaint) clearInterval(aaint);
        aaint = setInterval(run, 1000);
    };

    window.addCSSJSHack = function() {
        let meta = document.querySelector('meta[name="viewport"]');
        let isBigWindow = window.SF_CONFIG && window.SF_CONFIG.guiMode === "bigwindow";
        let isLandscape = isDeviceLandscape();
        
        let content = "width=device-width, initial-scale=1.0, viewport-fit=cover";
        if (isBigWindow && isLandscape) {
            let screenW = 0;
            if (window.SF_CONFIG && typeof window.SF_CONFIG.screenWidth === 'number' && typeof window.SF_CONFIG.screenHeight === 'number') {
                screenW = Math.max(window.SF_CONFIG.screenWidth, window.SF_CONFIG.screenHeight);
            }
            if (screenW > 0) {
                let scale = screenW / 1280;
                content = `width=1280, initial-scale=${scale.toFixed(3)}, minimum-scale=${scale.toFixed(3)}, maximum-scale=${scale.toFixed(3)}, viewport-fit=cover`;
            } else {
                content = "width=1280, viewport-fit=cover";
            }
        }

        if (meta) {
            // Keep the device-width layout in CSS mode even though the WebView
            // advertises a desktop UA. Preserve the 1280px big-window landscape
            // viewport only when that mode was explicitly selected.
            meta.setAttribute('content', content);
        } else {
            meta = document.createElement('meta');
            meta.name = "viewport";
            meta.content = content;
            document.head.appendChild(meta);
        }
        if (window.__sfApplyDeviceViewport) window.__sfApplyDeviceViewport();

        if (!window._sfResizeListenerAttached) {
            window._sfResizeListenerAttached = true;
            window.addEventListener('resize', () => {
                if (window.addCSSJSHack) window.addCSSJSHack();
            });
        }

        const root = document.documentElement;
        const existingVal = parseFloat(root.style.getPropertyValue('--sf-safe-area-top')) || 0;
        const config = window.SF_CONFIG || {};
        const statusBarHidden = !!(document.body && document.body.classList.contains('sf-statusbar-hidden'));
        let sbHeight = existingVal;
        if (!config.hideStatusBar && !statusBarHidden) {
            sbHeight = Math.max(Number(config.statusBarHeight) || 0, existingVal);
            // Android WebView can report a zero inset while drawing under the
            // visible status bar. Reserve its standard 24dp height until native
            // WindowInsets delivers the device-specific value.
            if (config.guiMode === 'csshack' && !isDeviceLandscape()) sbHeight = Math.max(sbHeight, 24);
        }
        if (sbHeight > 0) {
            root.style.setProperty('--sf-safe-area-top', sbHeight + 'px');
        }

        if (window.SF_CONFIG.guiMode === "csshack") {
            const checkExpanded = () => {
                let minBtn = document.querySelector(
                    'button[aria-label*="Minimize"]:not(#Desktop_LeftSidebar_Id *):not(.YourLibraryX *):not([aria-label*="Library"]), ' +
                    'button[aria-label*="Back to player"]'
                );
                let isVis = !!(minBtn && (minBtn.offsetParent !== null || minBtn.offsetWidth > 0));
                if (isVis !== window.sf_is_expanded) {
                    window.sf_is_expanded = isVis;
                    AndBridge.setExpanded(isVis);
                }
                if (isVis) {
                    document.body.classList.add('sf-expanded');
                    // Instant color extraction to prevent flash of fallback colors
                    let candidates = Array.from(document.querySelectorAll('div[style*="--cinema-mode-bg-color-from"]'));
                    let cs = candidates.find(el => el.offsetParent !== null || el.getClientRects().length > 0) || candidates[candidates.length - 1];
                    if (cs) {
                        ['--cinema-mode-bg-color-from', '--cinema-mode-bg-color-to', '--background-base'].forEach(v => {
                            let val = cs.style.getPropertyValue(v).trim();
                            if (val) document.body.style.setProperty(v, val);
                        });
                    }
                } else {
                    document.body.classList.remove('sf-expanded');
                    [
                        '--background-base',
                        '--background-highlight',
                        '--background-press',
                        '--cinema-mode-bg-color-from',
                        '--cinema-mode-bg-color-to'
                    ].forEach(v => {
                        document.body.style.removeProperty(v);
                    });
                }
            };

            if (window._sfExpandedObserver) window._sfExpandedObserver.disconnect();
            let obsTimer = null;
            window._sfExpandedObserver = new MutationObserver(() => {
                if (obsTimer) return;
                obsTimer = requestAnimationFrame(() => {
                    checkExpanded();
                    obsTimer = null;
                });
            });
            window._sfExpandedObserver.observe(document.body, { childList: true, subtree: true });
            checkExpanded();

            if (cssint) clearInterval(cssint);
            cssint = setInterval(function() {
                // Sidebar button setup
                if (!window.SF_CONFIG?.dockLeftSidebar) {
                    let lb = document.querySelector('#Desktop_LeftSidebar_Id header>div>div:first-child button:not(.fuckd)');
                    if (lb) {
                        window.lBtn = lb;
                        lb.classList.add('fuckd', 'lbtn');
                        lb.style.padding = '0px';
                        lb.style.height = '20px';
                        lb.addEventListener('click', function() {
                            setTimeout(() => switchLs(), 0);
                        });
                        // Start with the library closed, so the public home or sign-in
                        // screen is not covered by the full-width library drawer.
                        if (!window.__sfLibraryInitialized) {
                            window.__sfLibraryInitialized = true;
                            switchLs(false);
                        } else {
                            window.lBtn.setAttribute('aria-expanded', String(!!window.__sfLibraryExpanded));
                        }
                        AndBridge.cssInjected();
                    }

                    // Sidebar items setup
                    let lbit = document.querySelector('#Desktop_LeftSidebar_Id div[role=grid]:not(.fuckd)');
                    if (lbit) {
                        lbit.classList.add('fuckd');
                        lbit.addEventListener('click', () => {
                            setTimeout(() => {
                                window.lBtn.click();
                                closeNowPlay();
                            }, 0);
                        });
                    }
                }

                // Home button setup
                let hb = document.querySelector('#global-nav-bar button[data-testid=home-button]:not(.fuckd)');
                if (hb) {
                    hb.classList.add('fuckd');
                    hb.addEventListener('click', () => {
                        closeNowPlay();
                    });
                }

                // Search bar setup
                let sr = document.querySelector('input[data-testid=search-input]:not(.fuckd)');
                if (sr) {
                    sr.classList.add('fuckd');
                    let isTapping = false;
                    const sb = sr.closest('form')?.querySelector('button[data-testid="search-icon"]');
                    
                    if (sb) {
                        sb.addEventListener('mousedown', () => {
                            isTapping = true;
                        });
                        sb.addEventListener('touchstart', () => {
                            isTapping = true;
                        }, {passive:true});
                        sb.addEventListener('click', () => {
                            const isPort = window.matchMedia("(orientation: portrait)").matches;
                            const isExpanded = sr.getAttribute('aria-expanded') === 'true' || sr.offsetWidth > 60;
                            if (isPort) {
                                if (isExpanded) {
                                    if (sr.value !== '') {
                                        const val = sr.value;
                                        sr.value = '';
                                        setTimeout(() => {
                                            sr.value = val;
                                        }, 150);
                                    }
                                } else {
                                    setTimeout(() => {
                                        sr.focus();
                                    }, 50);
                                }
                            }
                        });
                    }
                    
                    sr.addEventListener('focus', () => {
                        isTapping = false;
                        document.body.classList.add('sf-search-focused');
                        AndBridge.setSearchActive(true);
                    });
                    
                    sr.addEventListener('blur', () => {
                        const isPort = window.matchMedia("(orientation: portrait)").matches;
                        const isExpanded = sr.getAttribute('aria-expanded') === 'true';
                        const fromDropdown = window._sfBlurFromDropdown === true;
                        // Consume the flag regardless
                        if (window._sfBlurFromDropdown === true) window._sfBlurFromDropdown = false;
                        document.body.classList.remove('sf-search-focused');
                        AndBridge.setSearchActive(false);
                        if (fromDropdown) {
                            // User tapped a play button inside the dropdown.
                            // Don't collapse immediately — the dropdown is still in the DOM.
                            // gobserver will watch for its removal and collapse then.
                            window._sfBlurFromDropdown = 'pending';
                            // Safety net: Spotify sometimes keeps the dropdown open after play.
                            // Synthesize a mousedown outside the form — this triggers both our
                            // dismissSearch (which debounces+collapses the bar) AND Spotify's
                            // own outside-click handler (which closes the dropdown).
                            setTimeout(() => {
                                if (window._sfBlurFromDropdown === 'pending') {
                                    window._sfBlurFromDropdown = false;
                                    document.body.dispatchEvent(new MouseEvent('mousedown', {
                                        bubbles: true, cancelable: false, view: window
                                    }));
                                }
                            }, 1000);
                        } else if (isPort && !isTapping && sb) {
                            setTimeout(() => {
                                const isExpandedNow = sr.getAttribute('aria-expanded') === 'true' || sr.offsetWidth > 60;
                                if (isExpandedNow) {
                                    const val = sr.value;
                                    if (val === '') {
                                        sb.click();
                                    } else {
                                        sr.value = '';
                                        sb.click();
                                        sr.value = val;
                                    }
                                }
                            }, 150);
                        }
                        setTimeout(() => {
                            isTapping = false;
                        }, 600);
                    });
                }

                // Backup check for player expand/minimize status
                checkExpanded();

                // User profile button setup
                let ub = document.querySelector('button[data-testid=user-widget-link]:not(.fuckd)');
                if (ub) {
                    ub.classList.add('fuckd');
                    ub.addEventListener('click', () => {
                        closeNowPlay();
                    });
                }
            }, 3000);

            // Library sidebar toggler helper. Track our own state instead of
            // inferring it from Spotify's changing CSS class count.
            window.switchLs = function(forceExpanded) {
                const ls = document.querySelector('#Desktop_LeftSidebar_Id');
                if (!window.__sfDrawerState && window.MelodixRuntime) {
                    window.__sfDrawerState = window.MelodixRuntime.createDrawerState(false);
                }
                const expanded = typeof forceExpanded === 'boolean'
                    ? (window.__sfDrawerState ? window.__sfDrawerState.setOpen(forceExpanded) : forceExpanded)
                    : (window.__sfDrawerState ? window.__sfDrawerState.toggle() : !window.__sfLibraryExpanded);
                window.__sfLibraryExpanded = expanded;
                if (document.body) document.body.classList.toggle('sf-library-open', expanded);
                if (!ls) {
                    updateActiveTab(document.getElementById('sf-mobile-navigation'));
                    return;
                }

                const heading = ls.querySelector('header>div>div:first-child h1');
                if (heading && !heading.dataset.sfOriginalTitle) {
                    heading.dataset.sfOriginalTitle = heading.innerHTML;
                }

                if (expanded) {
                    ls.style.setProperty('position', 'fixed', 'important');
                    ls.style.setProperty('width', '100%', 'important');
                    const safeTop = 'max(var(--sf-safe-area-top, 0px), env(safe-area-inset-top, 0px), 24px)';
                    ls.style.setProperty('height', `calc(var(--sf-device-height, 100dvh) - 58px - ${safeTop} - env(safe-area-inset-bottom, 0px))`, 'important');
                    ls.style.setProperty('top', `calc(58px + ${safeTop})`, 'important');
                    ls.style.setProperty('bottom', 'env(safe-area-inset-bottom, 0px)', 'important');
                    ls.style.setProperty('left', '0px', 'important');
                    ls.style.setProperty('overflow-y', 'auto', 'important');
                    ls.style.setProperty('z-index', 'calc(var(--above-everything-grid-area-z-index) + 5)', 'important');
                    if (heading) heading.innerHTML = '✖ &nbsp; ' + (window.SF_CONFIG?.closeLibText || 'Library');
                } else {
                    ls.style.setProperty('z-index', '1', 'important');
                    ls.style.setProperty('position', 'fixed', 'important');
                    ls.style.setProperty('top', 'var(--sf-safe-area-top, env(safe-area-inset-top))', 'important');
                    ls.style.setProperty('left', '60px', 'important');
                    ls.style.setProperty('width', '48px', 'important');
                    ls.style.setProperty('height', '48px', 'important');
                    ls.style.removeProperty('bottom');
                    ls.style.removeProperty('overflow-y');
                    if (heading && heading.dataset.sfOriginalTitle) {
                        heading.innerHTML = heading.dataset.sfOriginalTitle;
                    }
                }

                if (document.body) document.body.classList.toggle('sf-library-open', expanded);
                if (window.lBtn) window.lBtn.setAttribute('aria-expanded', String(expanded));
                updateActiveTab(document.getElementById('sf-mobile-navigation'));
            };

            // Collapse the drawer as soon as it exists; the slower polling loop
            // below still attaches the live toggle to Spotify's header button.
            if (!window.SF_CONFIG?.dockLeftSidebar && !window.__sfLibraryInitialized && document.querySelector('#Desktop_LeftSidebar_Id')) {
                window.__sfLibraryInitialized = true;
                window.switchLs(false);
            }
        }
    };

    // Spotify's private Pathfinder library/search endpoints are deliberately not
    // called. Keep the Android MediaBrowser callbacks complete so the unsupported
    // native catalog reports an empty result instead of leaving a request pending.
    window.fetchMediaItems = function(parentId) {
        console.warn('[Melodix] Native library browsing is unavailable; use Spotify\'s official Library tab.');
        try {
            if (window.AndBridge && typeof window.AndBridge.onMediaItemsLoaded === 'function') {
                window.AndBridge.onMediaItemsLoaded(String(parentId || ''), '[]');
            }
        } catch (_) {}
    };

    window.searchMediaItems = function(query) {
        console.warn('[Melodix] Native catalog search is unavailable; use Spotify\'s official Search page.');
        try {
            if (window.AndBridge && typeof window.AndBridge.onSearchCompleted === 'function') {
                window.AndBridge.onSearchCompleted(String(query || ''), '[]');
            }
        } catch (_) {}
    };

    firstFuck();
})();
