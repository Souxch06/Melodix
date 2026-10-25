window.__sfBridgeFileHeadExec = true;
window.__sfBridgeEntered = true;
window.__sfBridgeLoadStage = 'bridge-entered';
try {
(function() {
    window.__sfBridgeEntered = true;
    window.__sfBridgeLoadStage = 'bridge-entered';
    if (window.__sfMelodixBridgeCompleted) {
        if (typeof window.__sfEnsureMobileShell === 'function') {
            try { window.__sfEnsureMobileShell(); } catch (_) {}
        }
        return;
    }
    if (window.__sfMelodixBridgeStarted) return;
    window.__sfMelodixBridgeStarted = true;
    window.SF_CONFIG = window.SF_CONFIG || {};

    // Global flags injected by Android:
    // window.SF_CONFIG = { ... };

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
        // Session data dies with the session: no playlists, titles or covers
        // from the previous account may remain visible after a logout, and any
        // in-flight library result is dropped by the run epoch.
        try {
            libRunEpoch += 1;
            isFetchingLib = false;
            mediaLibRetryAttempts = 0;
            window.__sfMediaLibRetryExhausted = false;
            if (mediaLibRetryTimer) { clearTimeout(mediaLibRetryTimer); mediaLibRetryTimer = null; }
            window.mediaLib = null;
            window.__sfMediaLibState = null;
            window.__sfMediaLibError = null;
            window.likedSongsCache = null;
            if (window.pendingMediaRequests && window.pendingMediaRequests.clear) window.pendingMediaRequests.clear();
        } catch (_) {}
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


    function sanitizeDiagnostic(value) {
        var text = String(value && value.message || value || '');
        text = text.replace(/Set-Cookie:\s*[^;\r\n]+/gi, 'Set-Cookie:[redacted]');
        text = text.replace(/Cookie:\s*[^\r\n]+/gi, 'Cookie:[redacted]');
        text = text.replace(/Authorization:\s+\S+(?:\s+\S+)?/gi, 'Authorization:[redacted]');
        text = text.replace(/Bearer\s+\S+/gi, 'Bearer [redacted]');
        text = text.replace(/\b(?:access_token|refresh_token|id_token|client_secret|code|sp_dc|sp_key|sessionid)=[^&\s;]+/gi, function(match) {
            return match.slice(0, match.indexOf('=') + 1) + '[redacted]';
        });
        text = text.replace(/spotify:user:[^\s,;]+/gi, 'spotify:user:[redacted]');
        text = text.replace(/[A-Za-z0-9_-]{8,}\.[A-Za-z0-9._-]{8,}\.[A-Za-z0-9._-]{8,}/g, '[redacted-jwt]');
        return text.slice(0, 160);
    }

    function logBridgeError(context, error) {
        var name = error && error.name ? String(error.name) : 'Error';
        var msg = sanitizeDiagnostic(error);
        console.error('[Melodix] ' + String(context || 'bridge') + ': ' + name + (msg ? ': ' + msg : ''));
    }

    // Defense in depth for the JS fetch wrapper only. AndBridge.nativeFetch in
    // smali still opens the URL first; this does not replace a native allowlist.
    function isAllowedNativeFetchUrl(raw) {
        var parsed;
        var host;
        var port;
        if (typeof raw !== 'string' || !raw) return false;
        try {
            parsed = new URL(raw);
        } catch (_) {
            return false;
        }
        if (parsed.protocol !== 'https:') return false;
        if (parsed.username || parsed.password) return false;
        host = String(parsed.hostname || '').toLowerCase();
        if (!host) return false;
        if (host.indexOf(':') >= 0) return false;
        if (/^[0-9]{1,3}(?:\.[0-9]{1,3}){3}$/.test(host)) return false;
        port = parsed.port;
        if (port && port !== '443') return false;
        if (host === 'spotify.com' || (host.length > 12 && host.slice(host.length - 12) === '.spotify.com')) {
            return true;
        }
        if (host === 'scdn.co' || (host.length > 8 && host.slice(host.length - 8) === '.scdn.co')) {
            return true;
        }
        return false;
    }

    function wrapNativeFetchBridge() {
        var bridge;
        var original;
        var guarded;
        try {
            bridge = typeof window !== 'undefined' ? window.AndBridge : null;
        } catch (_) {
            return;
        }
        if (!bridge || typeof bridge.nativeFetch !== 'function' || bridge.nativeFetch._sfAllowlisted) return;
        original = bridge.nativeFetch.bind(bridge);
        guarded = function(url, method, headers, body) {
            if (!isAllowedNativeFetchUrl(String(url || ''))) {
                logBridgeError('nativeFetch', { name: 'SecurityError', message: 'host-not-allowed' });
                return JSON.stringify({ status: 403, body: '' });
            }
            return original(url, method, headers, body);
        };
        guarded._sfAllowlisted = true;
        try {
            bridge.nativeFetch = guarded;
        } catch (err) {
            logBridgeError('nativeFetch-wrap', err);
        }
    }
    wrapNativeFetchBridge();

    // >>> sf-pause-intent
    // A pause the user explicitly asked for must stay a pause. Every automatic
    // playback helper (resume, retry, "take control", autoplay) checks this
    // latch before touching the player, so pausing never jumps to another
    // track. The latch is cleared by explicit play requests only.
    function isPlayPauseLabelPlaying(pb) {
        if (!pb || typeof pb.getAttribute !== 'function') return null;
        let label = '';
        try {
            label = String(pb.getAttribute('aria-label') || '').trim();
        } catch (_) {
            return null;
        }
        if (!label) return null;
        return /paus/i.test(label);
    }

    function getPlayPauseButton() {
        let pb = null;
        if (document && typeof document.querySelector === 'function') {
            try {
                pb = document.querySelector('[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]') ||
                     document.querySelector('aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]') ||
                     document.querySelector('button[data-testid="control-button-playpause"]');
            } catch (_) {
                pb = null;
            }
        }
        return pb || window.pBtn || null;
    }

    function playbackMediaNodes() {
        if (!document || typeof document.querySelectorAll !== 'function') return [];
        let nodes = null;
        try {
            nodes = document.querySelectorAll('audio, video');
        } catch (_) {
            return [];
        }
        if (!nodes || typeof nodes.length !== 'number') return [];
        const list = [];
        for (let i = 0; i < nodes.length; i += 1) list.push(nodes[i]);
        return list;
    }

    function isMediaElementPlaying() {
        const nodes = playbackMediaNodes();
        for (let i = 0; i < nodes.length; i += 1) {
            const el = nodes[i];
            if (!el || el.paused !== false || el.ended || el.muted) continue;
            if (String(el.tagName || '').toUpperCase() === 'VIDEO' && el.muted) continue;
            // The silent keep-alive track is not Spotify playback: counting it
            // here would make every "is it paused?" check answer "playing" and
            // turn a pause request into a resume.
            if (/silent\.mp3/i.test(String(el.currentSrc || el.src || ''))) continue;
            return true;
        }
        return false;
    }

    // Real, audible content only, and only when the playhead actually moves.
    // A paused player keeps its position, a buffering/preloading element does
    // not advance and the silent keep-alive media never counts. Requiring a
    // moving playhead makes the pause hold unable to mistake a frozen element
    // for a resume (which would turn a pause into a play).
    let lastAudibleTime = -1;

    function isAudiblePlaybackAdvancing() {
        const nodes = playbackMediaNodes();
        let position = -1;
        for (let i = 0; i < nodes.length; i += 1) {
            const el = nodes[i];
            if (!el || el.paused !== false || el.ended || el.muted) continue;
            if (String(el.tagName || '').toUpperCase() === 'VIDEO' && el.muted) continue;
            if (/silent\.mp3/i.test(String(el.currentSrc || el.src || ''))) continue;
            const current = Number(el.currentTime || 0);
            if (current > position) position = current;
        }
        const advancing = position >= 0 && lastAudibleTime >= 0 && position > lastAudibleTime + 0.05;
        lastAudibleTime = position;
        return advancing;
    }

    // Single source of truth for "is the player running right now?". The DOM
    // label is preferred, the cached flag is only a fallback, and a live media
    // element always wins so a stale label can never flip a pause into a play.
    function getPlaybackSnapshot() {
        const pb = getPlayPauseButton();
        const labelState = isPlayPauseLabelPlaying(pb);
        let playing = labelState === null ? Boolean(window.playing) : labelState;
        if (!playing && isMediaElementPlaying()) playing = true;
        return { playing: playing, hasButton: Boolean(pb) };
    }
    window.__sfGetPlaybackSnapshot = getPlaybackSnapshot;

    // ---- Playback trace (preview diagnostics) ------------------------------
    // A tiny ring buffer of playback events. It never stores URLs, tokens or
    // page content: only event names, timestamps, the player's own state and
    // the current track title. The preview runtime diagnostic reads it, so a
    // field report can be matched with what the player actually did.
    const PLAYBACK_TRACE_KEY = 'melodix_playback_trace_v1';
    const PLAYBACK_TRACE_LIMIT = 80;

    function readPlaybackTrace() {
        try {
            const raw = window.localStorage && window.localStorage.getItem(PLAYBACK_TRACE_KEY);
            const parsed = raw ? JSON.parse(raw) : null;
            return Array.isArray(parsed) ? parsed : [];
        } catch (_) {
            return [];
        }
    }

    function tracePlayback(event, detail) {
        let entry = null;
        try {
            const pb = getPlayPauseButton();
            entry = {
                at: Date.now(),
                event: String(event || '').slice(0, 32),
                playing: getPlaybackSnapshot().playing,
                label: pb && typeof pb.getAttribute === 'function'
                    ? String(pb.getAttribute('aria-label') || '').slice(0, 24)
                    : '',
                hidden: Boolean(document && document.visibilityState === 'hidden'),
                track: String(window.track || '').slice(0, 48)
            };
            if (detail) entry.detail = String(detail).slice(0, 96);
            let trace = readPlaybackTrace();
            trace.push(entry);
            if (trace.length > PLAYBACK_TRACE_LIMIT) {
                trace = trace.slice(trace.length - PLAYBACK_TRACE_LIMIT);
            }
            window.__sfPlaybackTrace = trace;
            if (window.localStorage) {
                window.localStorage.setItem(PLAYBACK_TRACE_KEY, JSON.stringify(trace));
            }
        } catch (_) {}
        return entry;
    }

    function clearPlaybackTrace() {
        try {
            window.__sfPlaybackTrace = [];
            if (window.localStorage) window.localStorage.removeItem(PLAYBACK_TRACE_KEY);
        } catch (_) {}
    }

    window.__sfTracePlayback = tracePlayback;
    window.__sfClearPlaybackTrace = clearPlaybackTrace;
    window.__sfGetPlaybackTrace = function(limit) {
        const trace = (window.__sfPlaybackTrace || readPlaybackTrace()).slice();
        const max = Number(limit) > 0 ? Math.min(Number(limit), PLAYBACK_TRACE_LIMIT) : PLAYBACK_TRACE_LIMIT;
        return trace.slice(Math.max(0, trace.length - max));
    };

    // Record DOM activations that can change the track, so a field report shows
    // whether the change came from the app or from Spotify's own player.
    try {
        document.addEventListener('click', function(event) {
            const target = event && event.target;
            if (!target || typeof target.closest !== 'function') return;
            try {
                const skip = target.closest('[data-testid="control-button-skip-forward"], [data-testid="control-button-skip-back"]');
                if (skip) {
                    tracePlayback('dom-skip', String(skip.getAttribute('data-testid') || ''));
                    return;
                }
                if (!window.__sfUserRequestedPause) return;
                const row = target.closest('[data-testid="tracklist-row"]');
                if (row) tracePlayback('dom-track-row-while-paused', String(row.innerText || '').slice(0, 24));
            } catch (_) {}
        }, true);
    } catch (_) {}

    // ---- Sticky pause hold -------------------------------------------------
    // After an explicit pause the player is watched for a short while. If
    // playback restarts without a user play request (native timer, media
    // session echo, Spotify autoplay/queue logic), the pause is re-applied at
    // once instead of letting the next track play. Any explicit play or skip
    // request ends the hold immediately.
    const PAUSE_HOLD_MS = 45000;
    const PAUSE_HOLD_SETTLE_MS = 1200;
    const PAUSE_HOLD_TICK_MS = 300;
    const PAUSE_HOLD_MAX_REAPPLIES = 5;
    const PAUSE_HOLD_REAPPLY_GAP_MS = 1500;
    let pauseHoldTimer = null;
    let pauseHoldSince = 0;
    let pauseHoldUntil = 0;
    let pauseHoldReapplies = 0;
    let pauseHoldLastReapplyAt = 0;

    function endPauseHold() {
        if (pauseHoldTimer) {
            try {
                window.clearInterval(pauseHoldTimer);
            } catch (_) {}
            pauseHoldTimer = null;
        }
        pauseHoldUntil = 0;
    }

    function pauseHoldTick() {
        if (!window.__sfUserRequestedPause) {
            endPauseHold();
            return;
        }
        const now = Date.now();
        if (now > pauseHoldUntil || pauseHoldReapplies >= PAUSE_HOLD_MAX_REAPPLIES) {
            endPauseHold();
            return;
        }
        if (now - pauseHoldSince < PAUSE_HOLD_SETTLE_MS) return;
        if (now - pauseHoldLastReapplyAt < PAUSE_HOLD_REAPPLY_GAP_MS) return;
        if (window.__sfLastPlayRequestAt && now - window.__sfLastPlayRequestAt < PAUSE_HOLD_SETTLE_MS) return;

        // Two independent signals are required before touching the player: the
        // playhead must really be moving AND the player must label itself as
        // playing. A pause that is still settling (fading out while the label
        // already says "Play") is therefore never toggled back on.
        const pb = getPlayPauseButton();
        if (!pb || typeof pb.click !== 'function') return;
        if (isPlayPauseLabelPlaying(pb) !== true) return;
        if (!isAudiblePlaybackAdvancing()) return;

        try {
            pb.click();
        } catch (_) {
            return;
        }
        pauseHoldReapplies += 1;
        pauseHoldLastReapplyAt = now;
        lastAudibleTime = -1;
        window.__sfPauseHoldReapplies = (window.__sfPauseHoldReapplies || 0) + 1;
        tracePlayback('pause-hold-reapply', 'unexpected-resume');
    }

    function startPauseHold(source) {
        const now = Date.now();
        if (pauseHoldTimer && now < pauseHoldUntil) {
            // Our own re-pause click fires the player button listener; it must
            // not restart the window or reset the re-apply budget.
            tracePlayback('pause-hold-kept', source);
            return;
        }
        pauseHoldSince = now;
        pauseHoldUntil = now + PAUSE_HOLD_MS;
        pauseHoldReapplies = 0;
        pauseHoldLastReapplyAt = 0;
        lastAudibleTime = -1;
        tracePlayback('pause-hold-start', source);
        if (pauseHoldTimer) {
            try {
                window.clearInterval(pauseHoldTimer);
            } catch (_) {}
        }
        pauseHoldTimer = window.setInterval(pauseHoldTick, PAUSE_HOLD_TICK_MS);
    }

    function markUserPlaybackIntent(playing, options) {
        const explicit = !options || options.explicit !== false;
        const paused = !playing;
        if (!paused && !explicit) {
            // Spotify resumed on its own: autoplay, a queue hand-off or a ghost
            // media-session command. The user asked for a pause, so the latch
            // and the hold stay armed until an explicit play or the hold ends.
            tracePlayback('auto-resume-ignored', 'user-pause-active');
            return;
        }
        window.__sfUserRequestedPause = paused;
        reqPause = paused;
        if (paused) {
            window.__sfUserPausedAt = Date.now();
            startPauseHold('mark');
        } else {
            ulFlag = false;
            window.__sfLastPlayRequestAt = Date.now();
            endPauseHold();
        }
    }
    window.__sfMarkUserPlaybackIntent = markUserPlaybackIntent;
    window.__sfIsUserPaused = function() {
        return Boolean(window.__sfUserRequestedPause);
    };
    window.__sfEndPauseHold = endPauseHold;
    // <<< sf-pause-intent
    let pfint = null;
    let afint = null;
    let cssint = null;
    let aaint = null;
    let tagint = null;
    let fsUpdateTimer = null;
    let fsScrubbing = false;
    let mobileLibraryOpen = false;

    // Start the Home and shell observers before optional player integrations.
    // Function declarations are hoisted; their scheduled work runs after this
    // script yields, and the initializers are idempotent.
    window.__sfMelodixBridgeStarted = true;
    window.__sfBridgeLoadStage = 'bridge-initialized';
    window.__sfMelodixBridgeBootstrapErrors = 0;
    window.__sfMelodixHomeInitAttempted = true;
    try {
        initializeMelodixHome();
    } catch (_) {
        window.__sfMelodixBridgeBootstrapErrors += 1;
    }
    window.__sfMelodixBridgeBootstrapReady = true;

    try {
        window.spotAuthToken = window.spotAuthToken || localStorage.getItem('spot_auth_token') || null;
        window.spotCliToken = window.spotCliToken || localStorage.getItem('spot_cli_token') || null;
        window.spotDevId = window.spotDevId || localStorage.getItem('spot_dev_id') || localStorage.getItem('spot_device_id') || null;
    } catch (_) {}

    // --- Webpack Module Hook: Capture Melodix Platform APIs & CosmosAsync ---
    (function hookMelodixPlatform() {
        const chunkName = window.webpackChunkopen_spotify ? "webpackChunkopen_spotify" : "webpackChunkxpui";
        const chunkArray = window[chunkName] = window[chunkName] || [];

        chunkArray.push([
            [Symbol("sf-melodix-platform")],
            {},
            (require) => {
                try {
                    const modules = require.m;
                    for (const id in modules) {
                        try {
                            const mod = require(id);
                            if (mod && mod.Platform) {
                                window.Melodix = window.Melodix || {};
                                window.Melodix.Platform = mod.Platform;
                                console.log("[Melodix] Captured Native Spotify Platform API");
                            }
                            if (mod && mod.CosmosAsync) {
                                window.Melodix = window.Melodix || {};
                                window.Melodix.CosmosAsync = mod.CosmosAsync;
                            }
                        } catch (e) {}
                    }
                } catch (e) {}
            }
        ]);
    })();

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
        if (window.__sfNativeUiShellReady) return;
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
        if (window.__sfNativeUiShellReady) return;
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
        if (typeof window.__sfEnsureMobileShell === 'function') {
            window.__sfEnsureMobileShell();
        }

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

    window.syncUserInfo = function() {
        try {
            let username = '';
            let displayName = '';
            let avatarUrl = '';

            // 1. Spicetify / Spotify internal UserAPI memory lookup
            if (window.Spicetify && window.Spicetify.Platform && window.Spicetify.Platform.UserAPI) {
                window.Spicetify.Platform.UserAPI.getUser().then(u => {
                    if (u) {
                        username = u.uri ? u.uri.replace('spotify:user:', '') : (u.username || '');
                        displayName = u.name || u.displayName || username;
                        avatarUrl = u.images && u.images[0] ? u.images[0].url : '';
                        if (window.AndBridge && typeof window.AndBridge.onUserInfoCaptured === 'function' && displayName) {
                            window.AndBridge.onUserInfoCaptured(username, displayName, avatarUrl);
                        }
                    }
                }).catch(() => {});
            }

            // 2. DOM Selector Fallback (Target explicit profile widget buttons)
            const userBtn = document.querySelector('button[data-testid="user-widget-link"]') ||
                            document.querySelector('[data-testid="user-widget-avatar"]') ||
                            document.querySelector('button[aria-label*="Profile" i]') ||
                            document.querySelector('a[data-testid="user-widget-link"]') ||
                            Array.from(document.querySelectorAll('a[href*="/user/"]')).find(a => {
                                const href = a.getAttribute('href') || '';
                                return !href.includes('/collection') && !href.includes('/playlist') && !href.includes('/album');
                            });

            if (userBtn) {
                const userHref = userBtn.getAttribute('href') || '';
                if (userHref.includes('/user/')) {
                    const candidate = userHref.split('/user/')[1].split('?')[0].split('/')[0];
                    if (candidate && candidate !== 'collection') {
                        username = candidate;
                        window.spotUserId = username;
                    }
                }
                const rawName = (userBtn.getAttribute('aria-label') || userBtn.innerText || '').replace(/^Profile:\s*/i, '').trim();
                const invalidNames = ['Liked Songs', 'Your Library', 'Home', 'Search', 'Create Playlist', 'Liked songs'];
                if (rawName && !invalidNames.includes(rawName)) {
                    displayName = rawName;
                }
                const avatarImg = userBtn.querySelector('img');
                if (avatarImg && avatarImg.src) {
                    avatarUrl = avatarImg.src;
                }

                if (window.AndBridge && typeof window.AndBridge.onUserInfoCaptured === 'function' && (displayName || username)) {
                    window.AndBridge.onUserInfoCaptured(username, displayName, avatarUrl);
                }
            }
        } catch(e) {}
    };

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

    function resolveFetchUrl(input) {
        if (typeof input === 'string') return input;
        try {
            if (input && typeof input.url === 'string') return input.url;
        } catch (_) {}
        return '';
    }

    function collectHeaderEntries(source, out) {
        if (!source) return out;
        try {
            if (typeof source.forEach === 'function' && !Array.isArray(source)) {
                source.forEach(function(val, key) {
                    const k = String(key || '').trim();
                    if (!k || k.toLowerCase() === 'cookie' || k.toLowerCase() === 'set-cookie') return;
                    out[k] = String(val == null ? '' : val);
                });
                return out;
            }
            if (Array.isArray(source)) {
                for (let i = 0; i < source.length; i += 1) {
                    const pair = source[i];
                    if (!pair || pair.length < 2) continue;
                    const k = String(pair[0] || '').trim();
                    if (!k || k.toLowerCase() === 'cookie' || k.toLowerCase() === 'set-cookie') continue;
                    out[k] = String(pair[1] == null ? '' : pair[1]);
                }
                return out;
            }
            if (typeof source === 'object') {
                const keys = Object.keys(source);
                for (let i = 0; i < keys.length; i += 1) {
                    const k = String(keys[i] || '').trim();
                    if (!k || k.toLowerCase() === 'cookie' || k.toLowerCase() === 'set-cookie') continue;
                    if (source[keys[i]] !== undefined) {
                        out[k] = String(source[keys[i]] == null ? '' : source[keys[i]]);
                    }
                }
            }
        } catch (_) {}
        return out;
    }

    function serializeFetchHeaders(primary, secondary) {
        const merged = {};
        collectHeaderEntries(secondary, merged);
        collectHeaderEntries(primary, merged);
        return merged;
    }

    function readHeaderValue(source, targetName) {
        if (!source || !targetName) return '';
        const wanted = String(targetName).toLowerCase();
        try {
            if (typeof source.get === 'function') {
                const v = source.get(targetName) || source.get(wanted);
                return v ? String(v) : '';
            }
            const map = collectHeaderEntries(source, {});
            const keys = Object.keys(map);
            for (let i = 0; i < keys.length; i += 1) {
                if (keys[i].toLowerCase() === wanted) return map[keys[i]];
            }
        } catch (_) {}
        return '';
    }

    const oriFetch = window.fetch;

    // The library layer must never hang: a stalled connection becomes a
    // classified NetworkError after __sfLibFetchTimeoutMs so the UI reaches a
    // terminal state instead of a loading indicator stuck forever.
    window.__sfLibFetchTimeoutMs = 12000;
    function libFetch(url, options) {
        const timeoutMs = Number(window.__sfLibFetchTimeoutMs) > 0 ? Number(window.__sfLibFetchTimeoutMs) : 12000;
        const opts = Object.assign({}, options || {});
        const Controller = (typeof AbortController === 'function') ? AbortController : null;
        const controller = Controller ? new Controller() : null;
        if (controller && !opts.signal) opts.signal = controller.signal;
        return new Promise((resolve, reject) => {
            let settled = false;
            const fail = (err) => {
                if (settled) return;
                settled = true;
                reject(err);
            };
            const timer = setTimeout(() => {
                const err = new Error('fetch-timeout-' + timeoutMs + 'ms');
                // Distinct name so the diagnostic report can tell "the
                // request stalled" from "the network was down".
                err.name = 'NetworkTimeoutError';
                try { if (controller) controller.abort(); } catch (_) {}
                fail(err);
            }, timeoutMs);
            Promise.resolve().then(() => oriFetch(url, opts)).then((resp) => {
                if (settled) return;
                settled = true;
                clearTimeout(timer);
                resolve(resp);
            }, (err) => {
                clearTimeout(timer);
                if (settled) return;
                if (err && err.name === 'AbortError') {
                    const timeout = new Error('fetch-timeout-' + timeoutMs + 'ms');
                    timeout.name = 'NetworkTimeoutError';
                    fail(timeout);
                    return;
                }
                fail(err);
            });
        });
    }
    window.libFetch = libFetch;
    window.fetch = async function(...args) {
        const [url, opts] = args;
        const strUrl = resolveFetchUrl(url);
        const method = (opts?.method || (url && url.method) || 'GET').toString().toUpperCase() || 'GET';

        if (window.SF_CONFIG?.isCanvasDisabled && (strUrl.includes('canvas-storage') || strUrl.includes('/v1/canvas'))) {
            return new Response(JSON.stringify({canvases:[]}), {status: 200});
        }

        const headers = opts?.headers || {};
        if (method === 'POST' && strUrl.includes('/track-playback/v1/devices') && typeof opts?.body === 'string') {
            try {
                const body = JSON.parse(opts.body);
                const deviceId = body?.device?.device_id;
                if (deviceId && deviceId !== window.spotDevId) {
                    window.spotDevId = deviceId;
                    try { localStorage.setItem('spot_dev_id', deviceId); } catch(_) {}
                    typeof checkMediaLib === 'function' && checkMediaLib();
                }
            } catch (_) {}
        }

        const cliToken = readHeaderValue(headers, 'Client-Token') || readHeaderValue(url?.headers, 'Client-Token');
        if (cliToken && cliToken !== window.spotCliToken) {
            window.spotCliToken = cliToken;
            try { localStorage.setItem('spot_cli_token', cliToken); } catch(_) {}
            typeof checkMediaLib === 'function' && checkMediaLib();
        }

        const authHead = readHeaderValue(headers, 'Authorization') || readHeaderValue(url?.headers, 'Authorization');
        if (authHead?.startsWith('Bearer ') && authHead !== window.spotAuthToken) {
            window.spotAuthToken = authHead;
            try { localStorage.setItem('spot_auth_token', authHead); } catch(_) {}
            typeof checkMediaLib === 'function' && checkMediaLib();
        }

        if (method === 'POST' && strUrl.includes('pathfinder/v2/query') && opts?.body) {
            try {
                const bodyObj = typeof opts.body === 'string' ? JSON.parse(opts.body) : null;
                const opName = bodyObj?.operationName;
                const hash = bodyObj?.extensions?.persistedQuery?.sha256Hash;
                if (opName && hash) {
                    window.spHashes = window.spHashes || {};
                    if (window.spHashes[opName] !== hash) {
                        window.spHashes[opName] = hash;
                        try { localStorage.setItem('sp_hash_' + opName, hash); } catch(_) {}
                        console.log(`[Spotifuck] Dynamic GQL hash captured for ${opName}: ${hash.substring(0, 10)}...`);
                        if (opName === 'libraryV3' || opName === 'fetchLibraryTracks') {
                            typeof checkMediaLib === 'function' && checkMediaLib(true);
                        }
                    }
                }
            } catch(e) {}
        }

        if (ffDone && strUrl.includes('/track-playback/') && method === 'PUT') {
            const bodyStr = opts?.body ? (typeof opts.body === 'string' ? opts.body : '') : '';
            if (bodyStr.includes('"paused":true')) {
                manageAll(false);
            } else if (bodyStr.includes('"paused":false')) {
                const pb = document.querySelector('button[data-testid="control-button-playpause"]') || window.pBtn;
                const label = pb ? String(pb.getAttribute('aria-label') || '') : '';
                if (/paus/i.test(label)) {
                    manageAll(true);
                }
            }
        }

        if (strUrl && (strUrl.includes('connect-state') || strUrl.includes('melody/v1/msg'))) {
            wrapNativeFetchBridge();
            if (!isAllowedNativeFetchUrl(strUrl)) {
                const blockedErr = new TypeError('Blocked disallowed fetch URL');
                logBridgeError('nativeFetch', { name: 'SecurityError', message: 'host-not-allowed' });
                throw blockedErr;
            }
            if (typeof AndBridge !== 'undefined' && AndBridge && typeof AndBridge.nativeFetch === 'function') {
                const reqHeaders = serializeFetchHeaders(opts?.headers, url?.headers);
                const reqBody = opts?.body ? (typeof opts.body === 'string' ? opts.body : JSON.stringify(opts.body)) : null;
                let parsed = null;
                try {
                    const rawRes = AndBridge.nativeFetch(strUrl, method, JSON.stringify(reqHeaders), reqBody);
                    parsed = rawRes ? JSON.parse(rawRes) : null;
                } catch (e) {
                    logBridgeError('nativeFetch', e);
                    throw e;
                }
                const status = parsed && typeof parsed.status === 'number' ? parsed.status : 0;
                if (status <= 0) {
                    const netErr = new Error((parsed && parsed.error) || 'Native fetch failed');
                    logBridgeError('nativeFetch', netErr);
                    throw netErr;
                }
                const resBody = parsed.body == null ? '' : String(parsed.body);
                const HeaderCtor = window.Headers || Headers;
                const safeHeaders = new HeaderCtor();
                if (parsed && parsed.headers && typeof parsed.headers === 'object') {
                    for (const [hk, hv] of Object.entries(parsed.headers)) {
                        if (!hk || hk.charAt(0) === ':' || /^set-cookie/i.test(hk)) continue;
                        try {
                            safeHeaders.append(hk, hv == null ? '' : String(hv));
                        } catch (_) {}
                    }
                }
                const statusNames = {
                    200: 'OK',
                    201: 'Created',
                    202: 'Accepted',
                    204: 'No Content',
                    304: 'Not Modified',
                    400: 'Bad Request',
                    401: 'Unauthorized',
                    403: 'Forbidden',
                    404: 'Not Found',
                    429: 'Too Many Requests',
                    500: 'Internal Server Error',
                    502: 'Bad Gateway',
                    503: 'Service Unavailable',
                    504: 'Gateway Timeout'
                };
                const makeResponseObj = () => {
                    let used = false;
                    const consumeBody = () => {
                        if (used) throw new TypeError('Body has already been consumed.');
                        used = true;
                        return resBody;
                    };
                    const obj = {
                        ok: status >= 200 && status < 300,
                        status: status,
                        statusText: statusNames[status] || '',
                        headers: safeHeaders,
                        url: strUrl,
                        redirected: false,
                        type: 'basic',
                        get bodyUsed() { return used; },
                        json: async () => JSON.parse(consumeBody()),
                        text: async () => consumeBody(),
                        arrayBuffer: async () => new TextEncoder().encode(consumeBody()).buffer,
                        blob: async () => {
                            const raw = consumeBody();
                            return typeof Blob === 'function' ? new Blob([raw]) : new TextEncoder().encode(raw);
                        },
                        clone: function() {
                            if (used) throw new TypeError('Cannot clone a consumed Response.');
                            return makeResponseObj();
                        }
                    };
                    return obj;
                };
                return makeResponseObj();
            }
        }

        try {
            const resp = await oriFetch(url, opts);
            if (resp.status === 404 && strUrl.includes('connect-state') && strUrl.includes('/command/from/')) {
                console.warn('[Spotifuck] Ignored 404 on connect-state command to avoid interrupting playback');
            }
            return resp;
        } catch (err) {
            throw err;
        }
    };

    // =========================================================================
    // SECTION 3: WAKE LOCK & BACKGROUND CONTROL
    // =========================================================================

    window.playFromUri = function(uri, contextUri) {
        if (!uri) return;
        // An explicit play request always wins over a previous pause.
        tracePlayback('play-from-uri', /^spotify:track:/i.test(String(uri)) ? 'track' : 'context');
        markUserPlaybackIntent(true);

        if (uri && (uri.startsWith('http://') || uri.startsWith('https://'))) {
            try {
                const u = new URL(uri);
                let pathSegments = u.pathname.split('/').filter(Boolean);
                if (pathSegments.length > 0 && pathSegments[0].startsWith('intl-')) {
                    pathSegments = pathSegments.slice(1);
                }
                if (pathSegments.length >= 2) {
                    uri = 'spotify:' + pathSegments.join(':');
                } else if (pathSegments.length === 1) {
                    uri = 'spotify:' + pathSegments[0];
                }
            } catch(e) {}
        }

        if (uri && uri.startsWith('spotify:search:')) {
            const rawQuery = uri.substring('spotify:search:'.length);
            let query = rawQuery;
            try {
                query = decodeURIComponent(rawQuery);
            } catch (_) {}
            if (typeof AndBridge !== 'undefined' && AndBridge && typeof AndBridge.onNativeUiData === 'function') {
                try { AndBridge.onNativeUiData('open-search', query); } catch (_) {}
            }
            if (typeof window.searchMediaItems === 'function') {
                try { window.searchMediaItems(query); } catch (_) {}
            }
            if (typeof window.openSearch === 'function') {
                window.openSearch(query);
            }
            return;
        }

        const devId = window.spotDevId || localStorage.getItem('spot_dev_id');
        if (!devId) {
            console.warn('[Spotifuck] Cannot playFromUri: device ID not ready yet');
            return;
        }

        let playContext = contextUri || uri;
        let isTrack = uri && uri.startsWith('spotify:track:');
        let isContextItem = uri && (uri.startsWith('spotify:album:') || uri.startsWith('spotify:playlist:') || uri.startsWith('spotify:artist:') || uri.startsWith('spotify:show:'));

        if (isContextItem) {
            playContext = uri;
        }

        let isLikedSongs = (playContext === 'your_library' || playContext.includes('collection') || playContext === 'playlists' || playContext === 'spotify:collection:tracks');

        let playOptions = {
            license: 'tft',
            skip_to: {},
            player_options_override: {}
        };

        let commandContext = {
            uri: playContext,
            url: 'context://' + playContext,
            metadata: {}
        };

        let featIdent = playContext.match(/^spotify:([^:]+)/)?.[1];
        if (featIdent == 'user' || isLikedSongs) featIdent = 'your_library';

        if (isLikedSongs) {
            let tracks = window.likedSongsCache || [];
            let targetUri = isTrack ? uri : (tracks[0]?.id || uri);
            let trackList = (tracks || []).map(t => t.id || t.uri || t).filter(Boolean);

            if (targetUri && targetUri.includes(':track:') && !trackList.includes(targetUri)) {
                trackList.unshift(targetUri);
            }

            let collectionUri = window.spotUserId ? `spotify:user:${window.spotUserId}:collection` : "spotify:collection:tracks";

            commandContext = {
                uri: collectionUri,
                url: "context://" + collectionUri,
                metadata: {
                    context_description: "Liked Songs"
                },
                pages: [{
                    page_url: "context://" + collectionUri,
                    tracks: trackList.map(u => ({ uri: u }))
                }]
            };

            featIdent = 'collection-tracks';

            playOptions.skip_to = {
                track_uri: targetUri
            };
        } else if (isTrack) {
            if (contextUri && contextUri !== uri && !contextUri.startsWith('spotify:track:')) {
                playOptions.skip_to = {
                    track_uri: uri
                };
            } else {
                const queueUris = Array.isArray(window.__sfCurrentTrackUris) && window.__sfCurrentTrackUris.includes(uri)
                    ? window.__sfCurrentTrackUris.slice(0, 80)
                    : [uri];
                const ctxUri = (window.__sfCurrentContextUri && window.__sfCurrentContextUri.startsWith('spotify:') && queueUris.length > 1)
                    ? window.__sfCurrentContextUri
                    : uri;
                const trackIdx = queueUris.indexOf(uri);
                commandContext = {
                    uri: ctxUri,
                    url: "context://" + ctxUri,
                    metadata: {},
                    pages: [{
                        page_url: "context://" + ctxUri,
                        tracks: queueUris.map(u => ({ uri: u }))
                    }]
                };
                playOptions.skip_to = trackIdx >= 0
                    ? { track_uri: uri, track_index: trackIdx }
                    : { track_uri: uri };
                featIdent = 'search';
            }
        }

        const token = window.spotAuthToken || localStorage.getItem('spot_auth_token');
        const cliTok = window.spotCliToken || localStorage.getItem('spot_cli_token');
        if (!token) {
            console.warn('[Spotifuck] Cannot playFromUri: AuthToken not ready');
            return;
        }

        console.log('[Spotifuck] playFromUri sending command');

        fetch(`https://gew4-spclient.spotify.com/connect-state/v1/player/command/from/${devId}/to/${devId}`, {
            method: 'POST',
            headers: {
                'Authorization': token,
                'Client-Token': cliTok || '',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                command: {
                    context: commandContext,
                    play_origin: {
                        feature_identifier: featIdent || 'your_library',
                        feature_version: featVer || '1.2.40.0',
                        referrer_identifier: 'your_library'
                    },
                    options: playOptions,
                    endpoint: 'play'
                }
            })
        });
    };

    async function searchAndPlay(query) {
        if (!query) return;
        try {
            await ensureAuthToken();
            const token = window.spotAuthToken || (function() { try { return localStorage.getItem('spot_auth_token'); } catch(_) { return null; } })();
            const cliTok = window.spotCliToken || (function() { try { return localStorage.getItem('spot_cli_token'); } catch(_) { return null; } })();
            if (!token) {
                console.warn('[Spotifuck] searchAndPlay: Auth token unavailable.');
                return;
            }
            const headers = {
                'Authorization': token,
                'Content-Type': 'application/json;charset=UTF-8',
                'app-platform': 'WebPlayer',
                'spotify-app-version': '1.2.40.0'
            };
            if (cliTok) {
                headers['Client-Token'] = cliTok;
            }
            const resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                method: 'POST',
                mode: 'cors',
                credentials: 'include',
                headers: headers,
                body: JSON.stringify({
                    variables: {
                        searchTerm: query,
                        offset: 0,
                        limit: 10,
                        numberOfTopResults: 5,
                        includeAudiobooks: false,
                        includeArtistHasConcertsField: false,
                        includePreReleases: false,
                        includeLocalConcertsField: false,
                        includeAuthors: false
                    },
                    operationName: 'searchDesktop',
                    extensions: {
                        persistedQuery: {
                            version: 1,
                            sha256Hash: getGqlHash('searchDesktop', '4801118d4a100f756e833d33984436a3899cff359c532f8fd3aaf174b60b3b49')
                        }
                    }
                })
            });
            if (!resp.ok) return;
            const data = await resp.json();
            const searchData = data?.data?.searchV2 || data?.data?.search;
            const topResults = searchData?.topResultsV2?.items || searchData?.topResults?.items || [];
            let targetUri = null;
            for (const elem of topResults) {
                const itemWrapper = elem?.item || elem;
                const d = itemWrapper?.data || itemWrapper;
                const uri = itemWrapper?.uri || d?.uri || (d?.id ? 'spotify:' + (d?.__typename?.toLowerCase().replace('responsewrapper', '') || 'track') + ':' + d?.id : null);
                if (uri) {
                    targetUri = uri;
                    break;
                }
            }
            if (!targetUri) {
                const tracks = searchData?.tracksV2?.items || searchData?.tracks?.items || [];
                const firstTrack = tracks[0]?.item || tracks[0];
                const d = firstTrack?.data || firstTrack;
                targetUri = firstTrack?.uri || d?.uri || (d?.id ? 'spotify:track:' + d.id : null);
            }
            if (targetUri) {
                window.playFromUri(targetUri);
            }
        } catch (e) {
            logBridgeError('searchAndPlay', e);
        }
    }
    window.searchAndPlay = searchAndPlay;

    window.openSearch = function(query) {
        if (!query) return;
        console.log('[Spotifuck] openSearch called with query:', query);

        const executeSearchOnInput = (sr) => {
            if (sr._valueTracker) {
                try { sr._valueTracker.setValue(''); } catch(e) {}
            }
            const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value')?.set;
            if (nativeInputValueSetter) {
                nativeInputValueSetter.call(sr, query);
            } else {
                sr.value = query;
            }

            try {
                sr.dispatchEvent(new InputEvent('input', { bubbles: true, cancelable: true, inputType: 'insertText', data: query }));
            } catch(e) {}
            sr.dispatchEvent(new Event('input', { bubbles: true, cancelable: true }));
            sr.dispatchEvent(new Event('change', { bubbles: true, cancelable: true }));

            // Dispatch React Fiber synthetic onChange
            const reactKey = Object.keys(sr).find(k => k.startsWith('__reactProps$') || k.startsWith('__reactEventHandlers$'));
            if (reactKey && sr[reactKey]?.onChange) {
                try {
                    sr[reactKey].onChange({
                        target: sr,
                        currentTarget: sr,
                        bubbles: true,
                        preventDefault: () => {},
                        stopPropagation: () => {}
                    });
                } catch(e) {}
            }

            // Step 2: After React batches the input change, submit the search via Enter and Form submit
            setTimeout(() => {
                const enterInit = { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true, cancelable: true };
                sr.dispatchEvent(new KeyboardEvent('keydown', enterInit));
                sr.dispatchEvent(new KeyboardEvent('keypress', enterInit));
                sr.dispatchEvent(new KeyboardEvent('keyup', enterInit));

                if (reactKey && sr[reactKey]?.onKeyDown) {
                    try {
                        sr[reactKey].onKeyDown({
                            ...enterInit,
                            target: sr,
                            currentTarget: sr,
                            preventDefault: () => {},
                            stopPropagation: () => {}
                        });
                    } catch(e) {}
                }

                const form = sr.closest('form');
                if (form) {
                    const formReactKey = Object.keys(form).find(k => k.startsWith('__reactProps$') || k.startsWith('__reactEventHandlers$'));
                    if (formReactKey && form[formReactKey]?.onSubmit) {
                        try {
                            form[formReactKey].onSubmit({
                                target: form,
                                currentTarget: form,
                                bubbles: true,
                                preventDefault: () => {},
                                stopPropagation: () => {}
                            });
                        } catch(e) {}
                    }
                    try {
                        if (typeof form.requestSubmit === 'function') {
                            form.requestSubmit();
                        } else {
                            form.dispatchEvent(new Event('submit', { bubbles: true, cancelable: true }));
                        }
                    } catch(e) {}
                }
            }, 50);
        };

        const tryPopulate = () => {
            let sr = document.querySelector('input[data-testid="search-input"]');
            if (sr) {
                executeSearchOnInput(sr);
                return true;
            }
            return false;
        };

        if (!tryPopulate()) {
            const navBtn = document.querySelector('a[href="/search"]') ||
                           document.querySelector('button[data-testid="search-icon"]') ||
                           document.querySelector('button[aria-label*="Search" i]');
            if (navBtn) navBtn.click();
            setTimeout(tryPopulate, 150);
            setTimeout(tryPopulate, 400);
            setTimeout(tryPopulate, 800);
        }
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
                    tracePlayback('dom-playpause-click', /paus/i.test(window.pBtn.getAttribute('aria-label') || '') ? 'pause' : 'play');
                    if (/paus/i.test(window.pBtn.getAttribute('aria-label') || '')) {
                        markUserPlaybackIntent(false);
                        reqPause = true;
                        ulFlag = false;
                        manageWake(false);
                    } else if (!ulFlag) {
                        markUserPlaybackIntent(true);
                        reqPause = false;
                        manageWake(true);
                        ulFlag = true;
                        setTimeout(() => {
                            if (ulFlag) {
                                if (window.pBtn && !/paus/i.test(window.pBtn.getAttribute('aria-label') || '')) {
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
        tracePlayback(play ? 'manage-all-play' : 'manage-all-pause');
        if (play) markUserPlaybackIntent(true, { explicit: !window.__sfUserRequestedPause });
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
        const pb = getPlayPauseButton();
        if (!pb) return;

        const currentlyPlaying = getPlaybackSnapshot().playing;

        let target = play;
        if (target === null || typeof target === 'undefined') {
            target = !currentlyPlaying;
        }
        target = Boolean(target);

        // Record the intent before clicking so no helper can undo the pause.
        tracePlayback(target ? 'act-play' : 'act-pause', currentlyPlaying ? 'was-playing' : 'was-paused');
        markUserPlaybackIntent(target);

        // Only click when the player is not already in the requested state; a
        // blind click here used to toggle playback back on (and, through the
        // legacy retry hooks, could advance to the next track).
        if (currentlyPlaying === target) return;
        pb.click();
    };

    window.actSkipBack = function(e) {
        if (e) {
            e.preventDefault();
            e.stopPropagation();
        }
        // A skip is an explicit user request: stop watching for unwanted resumes.
        endPauseHold();
        tracePlayback('act-skip-back');
        if (window.Melodix && window.Melodix.Platform && window.Melodix.Platform.PlayerAPI) {
            manageWake(true);
            window.Melodix.Platform.PlayerAPI.previous();
            return;
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
        // A skip is an explicit user request: stop watching for unwanted resumes.
        endPauseHold();
        tracePlayback('act-skip-forward');
        if (window.Melodix && window.Melodix.Platform && window.Melodix.Platform.PlayerAPI) {
            manageWake(true);
            window.Melodix.Platform.PlayerAPI.next();
            return;
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
        if (window.Melodix && window.Melodix.Platform && window.Melodix.Platform.PlayerAPI) {
            window.Melodix.Platform.PlayerAPI.toggleRepeat();
            setTimeout(() => addAndAuto(true), 100);
            return;
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
        if (window.Melodix && window.Melodix.Platform && window.Melodix.Platform.PlayerAPI) {
            window.Melodix.Platform.PlayerAPI.toggleShuffle();
            setTimeout(() => {
                if (typeof window.syncShuffleState === 'function') window.syncShuffleState();
                if (typeof updMedia === 'function') updMedia(true);
            }, 150);
            return;
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

    function premiumOfferText(text) {
        const normalized = String(text || '').replace(/\s+/g, ' ').trim();
        const mentionsPremium = /\bpremium\b/i.test(normalized);
        const hasTwoMonthFreeOffer = /2\s*(?:mois|months?)/i.test(normalized) &&
            /(?:0\s*(?:€|euros?)|€\s*0|free|gratuit)/i.test(normalized);
        const hasExplicitFreeTrial = /(?:free\s+trial|trial\s+for\s+free|essai\s+gratuit|essai\s+offert|try.{0,30}premium.{0,40}free|essayez.{0,30}premium.{0,40}gratuit)/i.test(normalized);
        return mentionsPremium && (hasTwoMonthFreeOffer || hasExplicitFreeTrial);
    }

    function premiumOfferCloseButton(container) {
        const labeledClose = container.querySelector(
            'button[aria-label*="close" i], button[aria-label*="dismiss" i], button[aria-label*="fermer" i], ' +
            '[role="button"][aria-label*="close" i], [role="button"][aria-label*="fermer" i], ' +
            'button[title*="close" i], button[title*="fermer" i]'
        );
        if (labeledClose) return labeledClose;
        return Array.from(container.querySelectorAll('button, [role="button"]')).find((button) => {
            const label = String(button.getAttribute('aria-label') || button.title || button.innerText || button.textContent || '')
                .replace(/\s+/g, '')
                .trim();
            return /^[x×✕✖]$/i.test(label);
        }) || null;
    }

    function dismissPremiumOfferFrom(seed) {
        let element = seed && seed.nodeType === 1 ? seed : seed?.parentElement;
        for (let depth = 0; element && depth < 10; depth += 1, element = element.parentElement) {
            if (element === document.body || element === document.documentElement) break;
            const text = String(element.innerText || element.textContent || '').replace(/\s+/g, ' ').trim();
            if (!text || text.length > 2400 || !premiumOfferText(text)) continue;

            const testId = String(element.getAttribute('data-testid') || '').toLowerCase();
            const role = String(element.getAttribute('role') || '').toLowerCase();
            const closeButton = premiumOfferCloseButton(element);
            const knownPromoContainer = /premium.*(?:offer|upsell|promo|trial)|(?:offer|upsell|promo|trial).*premium/.test(testId);
            if (!closeButton && role !== 'dialog' && !knownPromoContainer) continue;
            if (element.getAttribute('data-melodix-premium-dismissed') === 'true') return true;

            element.setAttribute('data-melodix-premium-dismissed', 'true');
            if (element.style && typeof element.style.setProperty === 'function') {
                element.style.setProperty('display', 'none', 'important');
            }
            if (closeButton) {
                try { closeButton.click(); } catch (_) {}
            }
            return true;
        }
        return false;
    }

    function dismissPremiumUpsells(root) {
        if (!root) return;
        const scanRoot = root.nodeType === 1 ? root : root.parentElement;
        if (!scanRoot) return;
        dismissPremiumOfferFrom(scanRoot);
        if (typeof scanRoot.querySelectorAll !== 'function') return;
        scanRoot.querySelectorAll('h1, h2, h3, h4, p, span, [data-testid], [role="dialog"]').forEach((element) => {
            const text = String(element.innerText || element.textContent || '');
            if (premiumOfferText(text)) dismissPremiumOfferFrom(element);
        });
    }

    function installPremiumPromotionCleanup() {
        if (!document.body) {
            document.addEventListener('DOMContentLoaded', installPremiumPromotionCleanup, { once: true });
            return;
        }
        if (!document.getElementById('sf-premium-promo-cleanup-style')) {
            const style = document.createElement('style');
            style.id = 'sf-premium-promo-cleanup-style';
            style.textContent = `
                [data-melodix-premium-dismissed="true"],
                [data-testid*="premium-upsell" i],
                [data-testid*="premium-offer" i],
                [data-testid*="premium-promo" i],
                [data-testid*="premium-trial" i] { display: none !important; }
            `;
            (document.head || document.documentElement).appendChild(style);
        }
        dismissPremiumUpsells(document.body);
        if (window._sfPremiumPromoObserver) return;

        let scanTimer = null;
        window._sfPremiumPromoObserver = new MutationObserver(() => {
            if (scanTimer) return;
            scanTimer = setTimeout(() => {
                scanTimer = null;
                dismissPremiumUpsells(document.body);
            }, 80);
        });
        window._sfPremiumPromoObserver.observe(document.body, { childList: true, subtree: true });
    }

    window.addGlobalCleanup = function() {
        installPremiumPromotionCleanup();
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
                if (window.__sfNativeUiShellReady) return;
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
            if ('pBtn' in window && firstPlay && !window.__sfUserRequestedPause && window.pBtn.getAttribute('aria-label') === 'Play') {
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
                // Legacy "take control" (`TakeControl` preference) clicked a green
                // play button and then the first list row as soon as the player
                // looked paused. In Melodix that hijacked a real pause and could
                // start another track, so it is now intentionally inert: the user
                // is the only one allowed to (re)start playback.
                if (window.SF_CONFIG.autoPlayMode === "permanent") {
                    if ('pBtn' in window && !reqPause && !ulFlag && !window.__sfUserRequestedPause && window.pBtn.getAttribute('aria-label') === 'Play') {
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
                window.track = (ta.textContent || ta.innerText || '').trim();
            } else {
                window.track = null;
            }

            if (window.track !== window.__sfLastTrackTitle) {
                if (typeof window.__sfLastTrackTitle !== 'undefined' && window.track) {
                    tracePlayback('track-change', window.__sfUserRequestedPause ? 'while-user-paused' : 'while-playing');
                }
                window.__sfLastTrackTitle = window.track;
            }

            if (window.track !== window.__sfLastTrackTitle) {
                if (window.__sfLastTrackTitle !== undefined) {
                    tracePlayback('track-change', window.__sfUserRequestedPause ? 'while-user-paused' : 'while-playing');
                }
                window.__sfLastTrackTitle = window.track;
            }

            let aa = document.querySelector('a[data-testid=context-item-info-artist]') || document.querySelector('a[data-testid=context-item-info-show]');
            if (aa) {
                window.artist = (aa.textContent || aa.innerText || '').trim();
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

            let pbDom = document.querySelector('button[data-testid="control-button-playpause"]') || window.pBtn;
            if (pbDom && typeof pbDom.getAttribute === 'function') {
                let pbLabel = String(pbDom.getAttribute('aria-label') || '').trim();
                if (pbLabel) {
                    window.playing = /paus/i.test(pbLabel);
                }
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

    function syncMobileNavigation() {
        if (!document.body) return;
        // A stale state after a route transition must not permanently hide the mobile dock.
        if (
            document.body.classList.contains('sf-fs-open') &&
            !document.getElementById('sf-fs-player')
        ) {
            document.body.classList.remove('sf-fs-open');
        }

        const nav = document.getElementById('sf-mobile-nav');
        if (!nav) return;

        const pathname = window.location.pathname || '/';
        const active = document.body.classList.contains('sf-library-open')
            ? 'library'
            : (pathname === '/search' || pathname.startsWith('/search/') || document.body.classList.contains('sf-search-focused'))
                ? 'search'
                : 'home';

        nav.querySelectorAll('[data-sf-mobile-action]').forEach((button) => {
            if (button.getAttribute('data-sf-mobile-action') === active) {
                button.setAttribute('aria-current', 'page');
            } else {
                button.removeAttribute('aria-current');
            }
        });
        const libraryTab = nav.querySelector('[data-sf-mobile-action="library"]');
        if (libraryTab) {
            libraryTab.setAttribute('aria-expanded', String(document.body.classList.contains('sf-library-open')));
        }
        updateMelodixHome();
    }

    function hasTouchInput() {
        const config = window.SF_CONFIG || {};
        if (typeof config.touchInput === 'boolean') return config.touchInput;
        try {
            const navigatorInfo = window.navigator || {};
            const coarsePointer = typeof window.matchMedia === 'function' && (
                window.matchMedia('(any-pointer: coarse)').matches ||
                window.matchMedia('(pointer: coarse)').matches
            );
            return Number(navigatorInfo.maxTouchPoints || navigatorInfo.msMaxTouchPoints || 0) > 0 ||
                ('ontouchstart' in window) || coarsePointer;
        } catch (_) {
            return false;
        }
    }

    function isMobileNavigationViewport() {
        const touchInput = hasTouchInput();
        try {
            if (typeof window.matchMedia === 'function') {
                return window.matchMedia(
                    '(max-width: 820px) and (orientation: portrait), (hover: none) and (pointer: coarse)'
                ).matches || touchInput;
            }
        } catch (_) {}
        return Number(window.innerWidth || 0) <= 820 || touchInput;
    }

    function ensureMobileShellFallbackStyles() {
        if (document.getElementById('sf-mobile-shell-fallback-style')) return;
        const style = document.createElement('style');
        style.id = 'sf-mobile-shell-fallback-style';
        style.textContent = `
    body.sf-mobile-shell #sf-mobile-nav {
        position: fixed !important;
        left: 0 !important;
        right: 0 !important;
        bottom: 0 !important;
        box-sizing: border-box !important;
        display: grid !important;
        grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
        align-items: stretch !important;
        width: 100vw !important;
        height: calc(72px + env(safe-area-inset-bottom)) !important;
        padding: 5px 16px calc(5px + env(safe-area-inset-bottom)) !important;
        background: rgba(13, 16, 14, 0.97) !important;
        border-top: 1px solid rgba(255, 255, 255, 0.09) !important;
        z-index: 10010 !important;
    }
    #sf-mobile-nav .sf-mobile-nav__item {
        display: flex !important;
        flex-direction: column !important;
        align-items: center !important;
        justify-content: center !important;
        gap: 4px !important;
        min-width: 44px !important;
        min-height: 54px !important;
        margin: 0 4px !important;
        padding: 5px 8px !important;
        color: #a6ada8 !important;
        background: transparent !important;
        border: 0 !important;
        border-radius: 14px !important;
        font: 600 10px/1.1 system-ui, sans-serif !important;
    }
    #sf-mobile-nav .sf-mobile-nav__item svg {
        display: block !important;
        width: 23px !important;
        height: 23px !important;
        fill: none !important;
        stroke: currentColor !important;
        stroke-width: 1.8 !important;
        stroke-linecap: round !important;
        stroke-linejoin: round !important;
    }
    #sf-mobile-nav .sf-mobile-nav__item[aria-current="page"] {
        color: #1ed760 !important;
    }
    body.sf-fs-open #sf-mobile-nav { display: none !important; }
    body:not(.sf-library-open) #Desktop_LeftSidebar_Id {
        visibility: hidden !important;
        opacity: 0 !important;
        pointer-events: none !important;
    }
    body.sf-library-open #Desktop_LeftSidebar_Id {
        position: fixed !important;
        top: calc(48px + env(safe-area-inset-top)) !important;
        left: 0 !important;
        right: 0 !important;
        bottom: calc(72px + env(safe-area-inset-bottom)) !important;
        width: 100% !important;
        overflow-y: auto !important;
        visibility: visible !important;
        opacity: 1 !important;
        pointer-events: auto !important;
        z-index: 10005 !important;
    }
    #Desktop_LeftSidebar_Id .YourLibraryX header,
    #Desktop_LeftSidebar_Id header {
        position: relative !important;
        min-height: 56px !important;
        padding: 14px 16px 14px 58px !important;
    }
    #Desktop_LeftSidebar_Id .sf-mobile-library-close {
        display: none !important;
        position: absolute !important;
        left: 12px !important;
        top: 50% !important;
        width: 40px !important;
        height: 40px !important;
        min-width: 40px !important;
        min-height: 40px !important;
        align-items: center !important;
        justify-content: center !important;
        transform: translateY(-50%) !important;
        color: #f5f7f5 !important;
        background: rgba(255, 255, 255, 0.08) !important;
        border: 1px solid rgba(255, 255, 255, 0.1) !important;
        border-radius: 50% !important;
        font: 400 28px/1 system-ui, sans-serif !important;
        z-index: 2 !important;
    }
    body.sf-library-open #Desktop_LeftSidebar_Id .sf-mobile-library-close {
        display: flex !important;
    }
    #main-view,
    #main-view [data-overlayscrollbars-viewport] {
        scroll-padding-bottom: calc(160px + env(safe-area-inset-bottom)) !important;
        padding-bottom: calc(160px + env(safe-area-inset-bottom)) !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] {
        position: fixed !important;
        left: 10px !important;
        right: 10px !important;
        bottom: calc(78px + env(safe-area-inset-bottom)) !important;
        box-sizing: border-box !important;
        width: auto !important;
        min-width: 0 !important;
        max-width: calc(100vw - 20px) !important;
        height: 68px !important;
        min-height: 68px !important;
        max-height: 68px !important;
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        gap: 8px !important;
        padding: 8px 12px !important;
        overflow: hidden !important;
        border: 1px solid rgba(255, 255, 255, 0.09) !important;
        border-radius: 16px !important;
        background: rgba(24, 28, 25, 0.97) !important;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.46) !important;
        z-index: 10015 !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] > div:first-child,
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid="now-playing-widget"] {
        display: flex !important;
        flex: 1 1 auto !important;
        align-items: center !important;
        min-width: 0 !important;
        overflow: hidden !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid="CoverSlotCollapsed__container"] {
        flex: 0 0 48px !important;
        width: 48px !important;
        height: 48px !important;
        margin: 0 10px 0 0 !important;
        overflow: hidden !important;
        border-radius: 9px !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] > div:nth-child(2) {
        display: flex !important;
        flex: 0 0 auto !important;
        align-items: center !important;
        margin: 0 !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] > div:nth-child(n + 3) {
        display: none !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid="general-controls"] button:not([data-testid="control-button-playpause"]) {
        display: none !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"] {
        display: flex !important;
        width: 44px !important;
        height: 44px !important;
        min-width: 44px !important;
        min-height: 44px !important;
        align-items: center !important;
        justify-content: center !important;
        margin: 0 !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid="playback-progressbar"],
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid*="volume"],
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid*="queue"] {
        display: none !important;
    }
    body.sf-library-open aside[data-testid="now-playing-bar"] {
        bottom: calc(10px + env(safe-area-inset-bottom)) !important;
    }
    @media screen and (orientation: landscape) {
        body.sf-mobile-shell #global-nav-bar {
            display: none !important;
        }
    }
`;
        (document.head || document.documentElement).appendChild(style);
    }

    function mobileLibraryButton() {
        if (window.lBtn && window.lBtn.isConnected) return window.lBtn;
        return document.querySelector('#Desktop_LeftSidebar_Id header>div>div:first-child button') ||
               document.querySelector('#Desktop_LeftSidebar_Id button[aria-label*="Library" i]');
    }

    function setMobileLibraryOpen(shouldOpen) {
        const isOpen = !!document.body?.classList.contains('sf-library-open');
        if (isOpen === shouldOpen) {
            if (typeof window.switchLs === 'function') window.switchLs(shouldOpen);
            return;
        }

        if (typeof window.switchLs !== 'function') {
            document.body.classList.toggle('sf-library-open', shouldOpen);
            const sidebar = document.querySelector('#Desktop_LeftSidebar_Id');
            if (shouldOpen && sidebar) ensureMobileLibraryCloseButton(sidebar);
            syncMobileNavigation();
            return;
        }

        const library = mobileLibraryButton();
        if (library) {
            library.click();
            window.setTimeout(() => {
                if (typeof window.switchLs === 'function') window.switchLs(shouldOpen);
            }, 0);
        } else if (typeof window.switchLs === 'function') {
            window.switchLs(shouldOpen);
        }
    }

    function ensureMobileLibraryCloseButton(sidebar) {
        const header = sidebar.querySelector('.YourLibraryX header') || sidebar.querySelector('header');
        if (!header || header.querySelector('.sf-mobile-library-close')) return;

        const closeButton = document.createElement('button');
        closeButton.type = 'button';
        closeButton.className = 'sf-mobile-library-close';
        const locale = (document.documentElement.lang || navigator.language || 'en').toLowerCase().split('-')[0];
        const closeLabels = {
            fr: 'Fermer la bibliothèque',
            es: 'Cerrar la biblioteca',
            de: 'Bibliothek schließen',
            it: 'Chiudi la libreria',
            pt: 'Fechar biblioteca'
        };
        closeButton.setAttribute('aria-label', closeLabels[locale] || 'Close library');
        closeButton.textContent = '×';
        closeButton.addEventListener('click', (event) => {
            event.preventDefault();
            event.stopPropagation();
            setMobileLibraryOpen(false);
        });
        header.appendChild(closeButton);
    }

    function closeMobileLibrary() {
        if (!document.body?.classList.contains('sf-library-open')) return;
        setMobileLibraryOpen(false);
    }

    function installMobileNavigation() {
        const guiMode = window.SF_CONFIG?.guiMode;
        const isMobileViewport = isMobileNavigationViewport();
        if (!document.body || (guiMode !== 'csshack' && !isMobileViewport)) return;
        if (isMobileViewport) ensureMobileShellFallbackStyles();
        document.body.classList.add('sf-mobile-shell');

        let nav = document.getElementById('sf-mobile-nav');
        if (!nav) {
            const locale = (document.documentElement.lang || navigator.language || 'en').toLowerCase().split('-')[0];
            const fallbacks = {
                fr: ['Accueil', 'Recherche', 'Bibliothèque'],
                en: ['Home', 'Search', 'Library'],
                es: ['Inicio', 'Buscar', 'Biblioteca'],
                de: ['Start', 'Suche', 'Bibliothek'],
                it: ['Home', 'Cerca', 'Libreria'],
                pt: ['Início', 'Buscar', 'Biblioteca']
            };
            const defaults = fallbacks[locale] || fallbacks.en;
            const navigationLabels = {
                fr: 'Navigation principale',
                en: 'Main navigation',
                es: 'Navegación principal',
                de: 'Hauptnavigation',
                it: 'Navigazione principale',
                pt: 'Navegação principal'
            };
            const readLabel = (element, fallback) => {
                const value = element && (
                    element.getAttribute('aria-label') ||
                    element.getAttribute('title') ||
                    element.textContent
                );
                return String(value || fallback).replace(/\s+/g, ' ').trim().slice(0, 32) || fallback;
            };
            const homeControl = document.querySelector('#global-nav-bar button[data-testid="home-button"]');
            const searchControl = document.querySelector('#global-nav-bar button[data-testid="search-icon"], #global-nav-bar a[href="/search"]');
            const libraryHeading = document.querySelector('#Desktop_LeftSidebar_Id .YourLibraryX header h1, #Desktop_LeftSidebar_Id header h1');

            nav = document.createElement('nav');
            nav.id = 'sf-mobile-nav';
            nav.className = 'sf-mobile-nav';
            nav.setAttribute('aria-label', navigationLabels[locale] || navigationLabels.en);
            nav.style.display = 'none';
            nav.innerHTML = `
                <button class="sf-mobile-nav__item" type="button" data-sf-mobile-action="home">
                    <svg viewBox="0 0 24 24" aria-hidden="true"><path d="m3 10 9-7 9 7v10a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z"/></svg>
                    <span data-sf-mobile-label="home"></span>
                </button>
                <button class="sf-mobile-nav__item" type="button" data-sf-mobile-action="search">
                    <svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="10.8" cy="10.8" r="6.8"/><path d="m16 16 5 5"/></svg>
                    <span data-sf-mobile-label="search"></span>
                </button>
                <button class="sf-mobile-nav__item" type="button" data-sf-mobile-action="library">
                    <svg viewBox="0 0 24 24" aria-hidden="true"><path d="m3 6 9-4 9 4-9 4zM3 12l9 4 9-4M3 18l9 4 9-4"/></svg>
                    <span data-sf-mobile-label="library"></span>
                </button>
            `;
            nav.querySelector('[data-sf-mobile-label="home"]').textContent = readLabel(homeControl, defaults[0]);
            nav.querySelector('[data-sf-mobile-label="search"]').textContent = readLabel(searchControl, defaults[1]);
            nav.querySelector('[data-sf-mobile-label="library"]').textContent = readLabel(libraryHeading, defaults[2]);

            nav.addEventListener('click', (event) => {
                const button = event.target.closest('[data-sf-mobile-action]');
                if (!button) return;

                const action = button.getAttribute('data-sf-mobile-action');
                if (action === 'home') {
                    closeMobileLibrary();
                    const home = document.querySelector('#global-nav-bar button[data-testid="home-button"]') ||
                                 document.querySelector('#global-nav-bar a[href="/"]');
                    if (home) home.click();
                    else window.location.assign('/');
                    setTimeout(syncMobileNavigation, 250);
                    return;
                }

                if (action === 'search') {
                    closeMobileLibrary();
                    const searchLink = Array.from(document.querySelectorAll('a[href]')).find((link) => {
                        try {
                            const url = new URL(link.href, window.location.href);
                            return url.origin === window.location.origin && url.pathname === '/search';
                        } catch (_) {
                            return false;
                        }
                    });
                    if (searchLink) {
                        searchLink.click();
                    } else {
                        const searchButton = document.querySelector('#global-nav-bar button[data-testid="search-icon"]');
                        const searchInput = document.querySelector('input[data-testid="search-input"]');
                        if (searchButton) searchButton.click();
                        if (searchInput) setTimeout(() => searchInput.focus(), 80);
                        if (!searchButton && !searchInput) window.location.assign('/search');
                    }
                    setTimeout(() => {
                        button.setAttribute('aria-current', 'page');
                        syncMobileNavigation();
                    }, 250);
                    return;
                }

                if (action === 'library') {
                    const shouldOpen = !document.body.classList.contains('sf-library-open');
                    setMobileLibraryOpen(shouldOpen);
                    setTimeout(syncMobileNavigation, 80);
                    setTimeout(syncMobileNavigation, 260);
                }
            });

            document.body.appendChild(nav);
            window.addEventListener('popstate', syncMobileNavigation);
        }

        if (!window._sfMobileNavObserver) {
            window._sfMobileNavObserver = new MutationObserver(() => {
                if (!document.getElementById('sf-mobile-nav')) {
                    if (typeof window.__sfEnsureMobileShell === 'function') {
                        window.__sfEnsureMobileShell();
                    } else {
                        installMobileNavigation();
                    }
                    return;
                }
                syncMobileNavigation();
            });
            window._sfMobileNavObserver.observe(document.body, {
                attributes: true,
                attributeFilter: ['class'],
                childList: true
            });
        }
        syncMobileNavigation();
    }

    window.addCSSJSHack = function() {
        let meta = document.querySelector('meta[name="viewport"]');
        const config = window.SF_CONFIG || {};
        const screen = window.screen || {};
        const screenWidth = Number(config.screenWidth || screen.width || 0);
        const screenHeight = Number(config.screenHeight || screen.height || 0);
        const shortestScreenSide = Math.min(screenWidth, screenHeight);
        const isCompactWindow = shortestScreenSide > 0 && shortestScreenSide < 600;
        const hasTouch = hasTouchInput();
        let isBigWindow = config.guiMode === "bigwindow" && !isCompactWindow && !hasTouch;
        let isLandscape = window.matchMedia("(orientation: landscape)").matches;

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
            if ((isBigWindow && isLandscape) || isCompactWindow) {
                meta.setAttribute('content', content);
            } else {
                let current = meta.getAttribute('content') || "";
                if (!current.includes('viewport-fit=cover')) {
                    meta.setAttribute('content', current + ', viewport-fit=cover');
                }
            }
        } else {
            meta = document.createElement('meta');
            meta.name = "viewport";
            meta.content = content;
            document.head.appendChild(meta);
        }

        if (!window._sfResizeListenerAttached) {
            window._sfResizeListenerAttached = true;
            window.addEventListener('resize', () => {
                if (window.addCSSJSHack) window.addCSSJSHack();
            });
        }

        let existingVal = parseInt(document.documentElement.style.getPropertyValue('--sf-safe-area-top')) || 0;
        let sbHeight = existingVal;
        if (window.SF_CONFIG && !window.SF_CONFIG.hideStatusBar) {
            sbHeight = window.SF_CONFIG.statusBarHeight || existingVal || 0;
        }
        if (sbHeight > 0) {
            document.documentElement.style.setProperty('--sf-safe-area-top', sbHeight + 'px');
        }

        installMobileNavigation();

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
                        switchLs(document.body.classList.contains('sf-library-open'));
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

            // Library sidebar toggler helper
            window.switchLs = function(forceOpen) {
                const ls = document.querySelector('#Desktop_LeftSidebar_Id');
                const shouldOpen = typeof forceOpen === 'boolean' ? forceOpen : !mobileLibraryOpen;
                mobileLibraryOpen = shouldOpen;

                if (document.body) {
                    document.body.classList.toggle('sf-library-open', shouldOpen);
                }

                if (ls) {
                    if (shouldOpen) {
                        ls.style.setProperty('position', 'fixed', 'important');
                        ls.style.setProperty('width', '100%', 'important');
                        ls.style.setProperty('height', 'calc(100vh - 48px - 72px - var(--sf-safe-area-top, env(safe-area-inset-top)) - env(safe-area-inset-bottom))', 'important');
                        ls.style.setProperty('top', 'calc(48px + var(--sf-safe-area-top, env(safe-area-inset-top)))', 'important');
                        ls.style.setProperty('bottom', 'calc(72px + env(safe-area-inset-bottom))', 'important');
                        ls.style.setProperty('left', '0px', 'important');
                        ls.style.setProperty('overflow-y', 'auto', 'important');
                        ls.style.setProperty('z-index', '10005', 'important');
                        ensureMobileLibraryCloseButton(ls);
                    } else {
                        ls.style.setProperty('z-index', '1', 'important');
                        ls.style.setProperty('position', 'fixed', 'important');
                        ls.style.setProperty('top', 'var(--sf-safe-area-top, env(safe-area-inset-top))', 'important');
                        ls.style.setProperty('left', '60px', 'important');
                        ls.style.setProperty('width', '48px', 'important');
                        ls.style.setProperty('height', '48px', 'important');
                        ls.style.removeProperty('bottom');
                        ls.style.removeProperty('overflow-y');
                    }
                }
                syncMobileNavigation();
            };
        }
    };

    // =========================================================================
    // SECTION 4: LIBRARY & FOLDER RESOLUTION
    // =========================================================================

    // =========================================================================
    // SECTION 4a: TEMPORARY LIBRARY-FETCH DIAGNOSTIC (no secrets, ever)
    // =========================================================================
    // Temporary instrumentation for the real-account investigation: it records,
    // step by step, where the real playlist retrieval pipeline is
    // (session -> token -> libraryV3 call -> HTTP status -> response shape ->
    // parsing -> native shell delivery) so the exact failing stage can be read
    // in Paramètres > Diagnostic de récupération. Every recorded value is a
    // boolean, a small number, or a short label built from a controlled
    // vocabulary passed through sanitizeDiagnostic — never tokens, cookies,
    // account identifiers, playlist names or raw payloads.
    // NOTE: libraryV3 is an undocumented internal persisted-query operation of
    // the Spotify Web Player (api-partner.spotify.com/pathfinder), NOT a
    // public/official Spotify API: its shape and hash can change at any time.
    const LIB_DIAG_MAX_STEPS = 40;

    function libDiagSafeLabel(value, fallback) {
        var text = sanitizeDiagnostic(value);
        text = String(text || '').replace(/\s+/g, ' ').trim().slice(0, 72);
        if (!text) return fallback || '';
        // Second line of defense: anything outside a conservative charset is
        // dropped entirely instead of being stored (no markup, no URLs).
        if (!/^[A-Za-zÀ-ÖØ-öø-ÿ0-9 .:,=+()/'!?_-]{1,72}$/.test(text)) return '[non affiché]';
        return text;
    }

    function libDiagZeroParsed() {
        return { playlists: 0, albums: 0, artists: 0, podcasts: 0, skipped: 0 };
    }

    function libDiagZeroDelivered() {
        return { homeRows: 0, homePlaylistRows: 0, mediaRows: 0, mediaPlaylistRows: 0, seen: false, afterReady: false };
    }

    function libDiagRunBegin() {
        var diag = window.__sfLibDiag;
        if (!diag) return;
        var session = window.__sfAuthBridgeState === 'signed-in'
            ? 'detected'
            : window.__sfAuthBridgeState === 'signed-out'
                ? 'not-detected'
                : 'unknown';
        diag.lastRun = {
            session: session,
            token: null,
            hashSource: null,
            attempts: [],
            itemsTotal: 0,
            parsed: libDiagZeroParsed(),
            delivered: libDiagZeroDelivered(),
            status: null
        };
        libDiagRecord('session', session !== 'not-detected', session === 'detected'
            ? 'connectée'
            : session === 'not-detected' ? 'déconnectée' : 'indéterminée');
        libDiagPush('start');
    }

    function libDiagRecord(step, ok, detail) {
        try {
            var diag = window.__sfLibDiag;
            if (!diag) return;
            diag.steps.push({
                step: libDiagSafeLabel(step, '?'),
                ok: Boolean(ok),
                detail: libDiagSafeLabel(detail, ''),
                at: Date.now()
            });
            if (diag.steps.length > LIB_DIAG_MAX_STEPS) {
                diag.steps.splice(0, diag.steps.length - LIB_DIAG_MAX_STEPS);
            }
            libDiagPush('record');
        } catch (_) {}
    }

    function libDiagUpdate(fields) {
        // Whitelisted keys with strict value shapes only: an unknown key is
        // ignored, so a secret can never be persisted here by mistake.
        try {
            var run = window.__sfLibDiag && window.__sfLibDiag.lastRun;
            if (!run || !fields) return;
            if (typeof fields.session === 'string'
                && ['detected', 'not-detected', 'unknown'].indexOf(fields.session) >= 0) {
                run.session = fields.session;
            }
            if (typeof fields.token === 'string'
                && ['bearer', 'missing', 'malformed'].indexOf(fields.token) >= 0) {
                run.token = fields.token;
            }
            if (typeof fields.hashSource === 'string'
                && ['dynamic', 'fallback'].indexOf(fields.hashSource) >= 0) {
                run.hashSource = fields.hashSource;
            }
            if (typeof fields.status === 'string'
                && ['pending', 'ready', 'empty', 'error'].indexOf(fields.status) >= 0) {
                run.status = fields.status;
            }
            if (typeof fields.itemsTotal === 'number' && isFinite(fields.itemsTotal) && fields.itemsTotal >= 0) {
                run.itemsTotal = fields.itemsTotal;
            }
            if (fields.parsed && typeof fields.parsed === 'object') {
                ['playlists', 'albums', 'artists', 'podcasts', 'skipped'].forEach(function(key) {
                    if (typeof fields.parsed[key] === 'number' && isFinite(fields.parsed[key]) && fields.parsed[key] >= 0) {
                        run.parsed[key] = fields.parsed[key];
                    }
                });
            }
            if (fields.delivered && typeof fields.delivered === 'object') {
                ['homeRows', 'homePlaylistRows', 'mediaRows', 'mediaPlaylistRows'].forEach(function(key) {
                    if (typeof fields.delivered[key] === 'number' && isFinite(fields.delivered[key]) && fields.delivered[key] >= 0) {
                        run.delivered[key] = fields.delivered[key];
                    }
                });
                if (fields.delivered.seen) run.delivered.seen = true;
                if (fields.delivered.afterReady) run.delivered.afterReady = true;
            }
            libDiagPush('update');
        } catch (_) {}
    }

    function libDiagAttempt(info) {
        try {
            var run = window.__sfLibDiag && window.__sfLibDiag.lastRun;
            if (!run || !info) return;
            run.attempts.push({
                candidate: (info.candidate === 'dynamic' || info.candidate === 'fallback') ? info.candidate : '?',
                httpStatus: typeof info.httpStatus === 'number' && isFinite(info.httpStatus) ? info.httpStatus : null,
                networkError: Boolean(info.networkError),
                gqlErrorCodes: Array.isArray(info.gqlErrorCodes)
                    ? info.gqlErrorCodes.filter(function(code) {
                        return /^[A-Z0-9_]{1,48}$/.test(String(code));
                    }).slice(0, 4)
                    : [],
                shape: info.shape === 'ok' || info.shape === 'mismatch' || info.shape === 'me-null' ? info.shape : null,
                items: typeof info.items === 'number' && isFinite(info.items) && info.items >= 0 ? info.items : null
            });
            if (run.attempts.length > 12) run.attempts.splice(0, run.attempts.length - 12);
        } catch (_) {}
    }

    function libDiagPatchLastAttempt(patch) {
        try {
            var run = window.__sfLibDiag && window.__sfLibDiag.lastRun;
            if (!run || !run.attempts.length || !patch) return;
            var last = run.attempts[run.attempts.length - 1];
            if (patch.shape === 'ok' || patch.shape === 'mismatch' || patch.shape === 'me-null') last.shape = patch.shape;
            if (typeof patch.items === 'number' && isFinite(patch.items) && patch.items >= 0) last.items = patch.items;
        } catch (_) {}
    }

    function libDiagGqlCodes(errors) {
        var codes = [];
        try {
            (Array.isArray(errors) ? errors : []).forEach(function(entry) {
                var code = entry && entry.extensions && entry.extensions.code;
                if (code) {
                    code = String(code).toUpperCase();
                    if (/^[A-Z0-9_]{1,48}$/.test(code)) codes.push(code);
                }
            });
        } catch (_) {}
        return codes.slice(0, 4);
    }

    // JS -> native push of the bounded library snapshot: the diagnostic screen
    // must read the pipeline state even when native->JS evaluateJavascript is
    // dead on a device (the JS->native AndBridge direction keeps working).
    // Whitelisted fields only — token readiness as oui/non, never a value.
    function libDiagPush(reason) {
        try {
            var diag = window.__sfLibDiag;
            if (!diag || !window.AndBridge || typeof window.AndBridge.onLibDiagState !== 'function') return;
            var run = diag.lastRun || {};
            var attempts = (run.attempts || []).slice(-3).map(function (a) {
                return {
                    httpStatus: (a && typeof a.httpStatus === 'number') ? a.httpStatus : null,
                    gqlErrorCodes: (a && Array.isArray(a.gqlErrorCodes)) ? a.gqlErrorCodes.slice(0, 3) : [],
                    shape: (a && a.shape) || null
                };
            });
            var snapshot = {
                status: run.status || null,
                hashSource: run.hashSource || null,
                itemsTotal: typeof run.itemsTotal === 'number' ? run.itemsTotal : 0,
                shape: attempts.length ? attempts[attempts.length - 1].shape : null,
                token: run.token === 'bearer' ? 'oui' : (run.token ? 'non' : '?'),
                attempts: attempts
            };
            window.AndBridge.onLibDiagState(libDiagSafeLabel(reason, '?') + ' ' + JSON.stringify(snapshot));
        } catch (_) {}
    }

    function libDiagFailureKind(run) {
        if (!run) return null;
        var attempts = run.attempts || [];
        var i;
        if (run.token === 'missing' || run.token === 'malformed') return 'token-missing';
        for (i = 0; i < attempts.length; i += 1) {
            if (attempts[i].networkError) return 'network';
        }
        for (i = 0; i < attempts.length; i += 1) {
            if (attempts[i].httpStatus === 401 || attempts[i].httpStatus === 403) return 'access-denied';
        }
        for (i = 0; i < attempts.length; i += 1) {
            if (attempts[i].shape === 'me-null') return 'no-session';
        }
        for (i = 0; i < attempts.length; i += 1) {
            if ((attempts[i].gqlErrorCodes || []).length) return 'graphql-error';
        }
        for (i = 0; i < attempts.length; i += 1) {
            if (attempts[i].httpStatus && attempts[i].httpStatus >= 400) return 'http-error';
        }
        for (i = 0; i < attempts.length; i += 1) {
            if (attempts[i].shape === 'mismatch') return 'shape-mismatch';
        }
        if (run.status === 'error') return 'fetch-error';
        if (run.itemsTotal > 0 && (run.parsed.playlists + run.parsed.albums + run.parsed.artists + run.parsed.podcasts) === 0) {
            return 'parse-gap';
        }
        if (run.status === 'ready' && run.parsed.playlists > 0 && run.delivered.afterReady
            && (run.delivered.homePlaylistRows + run.delivered.mediaPlaylistRows) === 0) {
            return 'render-gap';
        }
        return null;
    }

    function libDiagConclude() {
        var run = window.__sfLibDiag && window.__sfLibDiag.lastRun;
        if (!run) return 'Diagnostic non initialisé';
        var kind = libDiagFailureKind(run);
        if (!kind) {
            if (run.status === 'ready') {
                return 'Parcours complet : ' + run.parsed.playlists + ' playlist(s) analysée(s), '
                    + (run.delivered.homePlaylistRows + run.delivered.mediaPlaylistRows) + ' transmise(s) au shell natif.';
            }
            if (run.status === 'empty') {
                return 'Réponse valide et vide : ce compte ne contient aucune playlist.';
            }
            return 'En attente du premier chargement de la bibliothèque.';
        }
        var byKind = {
            'token-missing': 'Échec à l\'étape « Jeton d\'accès » : absent ou format inattendu.',
            'network': 'Échec à l\'étape « Statut HTTP » : erreur réseau (requête interrompue).',
            'access-denied': 'Échec à l\'étape « Statut HTTP » : accès refusé (HTTP 401/403).',
            'no-session': 'Échec à l\'étape « Structure de la réponse » : session non reconnue (me=null).',
            'graphql-error': 'Échec à l\'étape « Appel bibliothèque » : requête GraphQL rejetée.',
            'http-error': 'Échec à l\'étape « Statut HTTP » : erreur serveur Spotify.',
            'shape-mismatch': 'Échec à l\'étape « Structure de la réponse » : structure inattendue.',
            'fetch-error': 'Échec de la récupération de la bibliothèque.',
            'parse-gap': 'Échec à l\'étape « Analyse » : éléments reçus mais inexploitables.',
            'render-gap': 'Échec à l\'étape « Rendu » : playlists chargées mais non transmises au shell.'
        };
        return byKind[kind] || 'Échec de la récupération.';
    }

    window.__sfLibDiag = {
        version: 1,
        temporary: true,
        steps: [],
        lastRun: {
            session: null,
            token: null,
            hashSource: null,
            attempts: [],
            itemsTotal: 0,
            parsed: libDiagZeroParsed(),
            delivered: libDiagZeroDelivered(),
            status: null
        }
    };
    window.__sfLibDiagRecord = libDiagRecord;
    window.__sfLibDiagUpdate = libDiagUpdate;
    window.__sfLibDiagPush = libDiagPush;
    window.__sfGetLibDiagReport = function() {
        var diag = window.__sfLibDiag;
        if (!diag) return null;
        return {
            temporary: true,
            steps: diag.steps.map(function(entry) {
                return { step: entry.step, ok: entry.ok, detail: entry.detail, at: entry.at };
            }),
            lastRun: {
                session: diag.lastRun.session,
                token: diag.lastRun.token,
                hashSource: diag.lastRun.hashSource,
                attempts: diag.lastRun.attempts.slice(),
                itemsTotal: diag.lastRun.itemsTotal,
                parsed: Object.assign({}, diag.lastRun.parsed),
                delivered: Object.assign({}, diag.lastRun.delivered),
                status: diag.lastRun.status
            },
            failureKind: libDiagFailureKind(diag.lastRun),
            conclusion: libDiagConclude()
        };
    };

    async function ensureAuthToken() {
        if (!window.spotAuthToken) {
            try {
                window.spotAuthToken = localStorage.getItem('spot_auth_token') || null;
                window.spotCliToken = localStorage.getItem('spot_cli_token') || null;
                window.spotDevId = localStorage.getItem('spot_dev_id') || localStorage.getItem('spot_device_id') || null;
            } catch (_) {}
        }
        if (window.spotAuthToken) return true;
        // Fast check: wait up to 1.2s in 40ms increments for Spotify's native Web Player fetch interceptor or localStorage
        let attempts = 0;
        while (!window.spotAuthToken && attempts < 30) {
            await new Promise(r => setTimeout(r, 40));
            attempts++;
            if (!window.spotAuthToken) {
                try {
                    window.spotAuthToken = localStorage.getItem('spot_auth_token') || null;
                    window.spotCliToken = localStorage.getItem('spot_cli_token') || null;
                    window.spotDevId = localStorage.getItem('spot_dev_id') || localStorage.getItem('spot_device_id') || null;
                } catch (_) {}
            }
        }
        return !!window.spotAuthToken;
    }
    window.ensureAuthToken = ensureAuthToken;

    function pickOptimalArtwork(sources, fallbackImages) {
        const list = (Array.isArray(sources) && sources.length) ? sources : (Array.isArray(fallbackImages) ? fallbackImages : []);
        if (!list.length) return null;
        if (list.length === 1) return list[0]?.url || null;
        const medium = list.find(s => s && s.url && s.width >= 120 && s.width <= 320);
        if (medium) return medium.url;
        return list[1]?.url || list[0]?.url || null;
    }

    function getGqlHash(opName, fallbackHash) {
        // Robustness for the internal persisted-query hash: only a well-formed
        // 64-hex sha256 may be used; a corrupted capture/storage falls back to
        // the bundled hash instead of sending garbage to pathfinder.
        const isSha256 = (value) => /^[a-f0-9]{64}$/i.test(String(value || ''));
        if (window.spHashes && isSha256(window.spHashes[opName])) return window.spHashes[opName];
        try {
            const stored = localStorage.getItem('sp_hash_' + opName);
            if (isSha256(stored)) return stored;
        } catch(_) {}
        return fallbackHash;
    }
    window.getGqlHash = getGqlHash;

    window.pendingMediaRequests = window.pendingMediaRequests || new Set();
    let isFetchingLib = false;
    // Monotonic run id: results from older runs are dropped, never merged.
    let libRunEpoch = 0;
    let mediaLibRetryTimer = null;
    let mediaLibRetryAttempts = 0;
    const MEDIA_LIB_MAX_RETRIES = 5;

    // The native shell must be able to tell "still loading" from "the account
    // has no playlist" from "the fetch failed": only the first one may show a
    // loading state, the other two need an honest empty/error state.
    function publishMediaLibState(state, errorMessage) {
        window.__sfMediaLibState = state;
        window.__sfMediaLibError = errorMessage || null;
        libDiagPush('publish');
        if (typeof window.__sfNotifyMediaLibReady === 'function') {
            try { window.__sfNotifyMediaLibReady(); } catch (_) {}
        }
    }

    function scheduleMediaLibRetry() {
        if (mediaLibRetryTimer) return;
        if (mediaLibRetryAttempts >= MEDIA_LIB_MAX_RETRIES) {
            // Bounded waiting: once the retry budget is spent the state must
            // become terminal. Staying 'pending' forever is the bug this
            // replaces: the loading indicator can never resolve after this.
            window.__sfMediaLibRetryExhausted = true;
            if (window.__sfMediaLibState !== 'ready' && window.__sfMediaLibState !== 'empty') {
                libDiagUpdate({ status: 'error' });
                publishMediaLibState('error', 'retry-exhausted');
            }
            return;
        }
        mediaLibRetryAttempts += 1;
        const delay = Math.min(3000 * mediaLibRetryAttempts, 15000);
        mediaLibRetryTimer = setTimeout(() => {
            mediaLibRetryTimer = null;
            checkMediaLib(true);
        }, delay);
    }

    async function checkMediaLib(force = false) {
        if (isFetchingLib && !force) return;
        if (!force && window.__sfMediaLibRetryExhausted) {
            // A new user-driven call (warmup / Accueil retry) re-opens the
            // bounded retry budget; timer-driven forced calls never do.
            window.__sfMediaLibRetryExhausted = false;
            mediaLibRetryAttempts = 0;
        }
        libDiagRunBegin();
        await ensureAuthToken();
        if (!window.spotAuthToken) {
            console.warn("[Spotifuck] checkMediaLib: Auth token unavailable.");
            // Stay in "pending" (never claim an empty account) and retry once
            // the Spotify session had a chance to expose its Bearer token.
            libDiagUpdate({ token: 'missing', status: 'pending' });
            libDiagRecord('token', false, 'absent');
            if (!window.mediaLib) window.__sfMediaLibState = 'pending';
            scheduleMediaLibRetry();
            return;
        }
        const tokenLooksBearer = window.spotAuthToken.startsWith('Bearer ');
        libDiagUpdate({ token: tokenLooksBearer ? 'bearer' : 'malformed' });
        libDiagRecord('token', tokenLooksBearer, tokenLooksBearer ? 'format Bearer' : 'format inattendu');
        // Serialize the fetch phase: re-check the lock after the awaited token
        // wait so two concurrent calls never fetch twice in parallel.
        if (isFetchingLib && !force) return;
        isFetchingLib = true;
        const capturedEpoch = ++libRunEpoch;
        try {
            const allItems = await fetchAllLibrary();
            if (capturedEpoch !== libRunEpoch) {
                // A newer run or a logout owns the state now: this slower
                // response must never overwrite the fresher one.
                console.warn("[Spotifuck] checkMediaLib: late library response dropped (stale run).");
                return;
            }
            window.mediaLib = parseLibrary(allItems);
            mediaLibRetryAttempts = 0;
            pushMediaLibToNative();
            console.log("[Spotifuck] checkMediaLib: Successfully loaded mediaLib! Draining pending requests:", Array.from(window.pendingMediaRequests));
            if (window.pendingMediaRequests && window.pendingMediaRequests.size > 0) {
                for (const reqId of window.pendingMediaRequests) {
                    const items = window.mediaLib?.[reqId];
                    if (Array.isArray(items)) {
                        AndBridge.onMediaItemsLoaded(reqId, JSON.stringify(items));
                    } else {
                        // Not a library category (a collection or a track
                        // list): answer through the real loader instead of
                        // pretending the request held zero items.
                        try { fetchMediaItems(reqId); } catch (_) {}
                    }
                }
                window.pendingMediaRequests.clear();
            }
            libDiagUpdate({ status: window.mediaLib.playlists.length ? 'ready' : 'empty' });
            libDiagRecord('parse', true, 'playlists=' + window.mediaLib.playlists.length
                + ' albums=' + window.mediaLib.albums.length
                + ' artistes=' + window.mediaLib.artists.length
                + ' podcasts=' + window.mediaLib.podcasts.length);
            publishMediaLibState(window.mediaLib.playlists.length ? 'ready' : 'empty', null);
        } catch (e) {
            if (capturedEpoch !== libRunEpoch) {
                // A stale run's failure must not clobber a newer state either.
                console.warn("[Spotifuck] checkMediaLib: stale failure dropped (stale run).");
                return;
            }
            logBridgeError('checkMediaLib', e);
            libDiagUpdate({ status: 'error' });
            libDiagRecord('fetch', false, String((e && e.name) || 'Error'));
            publishMediaLibState('error', sanitizeDiagnostic(e));
            scheduleMediaLibRetry();
        } finally {
            isFetchingLib = false;
        }
    }
    window.checkMediaLib = checkMediaLib;

    // =========================================================================
    // PUSH MODEL: the page sends the normalized library to native over the
    // JS->native AndBridge channel (bounded batches of 25). This never depends
    // on native->JS evaluateJavascript, which can be dead on a real device.
    // =========================================================================
    var LIB_PUSH_BATCH = 25;
    var LIB_PUSH_CATS = ['playlists', 'albums', 'artists', 'podcasts'];

    function pushMediaLibBatch(cat, items, index, total, epoch) {
        try {
            if (!window.AndBridge || typeof window.AndBridge.onMediaLibBatch !== 'function') return;
            var norm = (items || []).slice(0, 40).map(function (it) {
                return {
                    title: String((it && it.name) || '').slice(0, 120),
                    subtitle: (Array.isArray(it && it.artists) ? it.artists.join(', ') : '').slice(0, 120),
                    uri: String((it && it.id) || ''),
                    image: String((it && it.image) || '').slice(0, 400)
                };
            });
            window.AndBridge.onMediaLibBatch(JSON.stringify({
                cat: String(cat),
                items: norm,
                i: index,
                n: total,
                epoch: epoch,
                last: index + 1 >= total
            }));
        } catch (_) {}
    }

    function pushMediaLibToNative() {
        try {
            var lib = window.mediaLib;
            if (!lib) return;
            window.__sfLibPushEpoch = (window.__sfLibPushEpoch || 0) + 1;
            var epoch = window.__sfLibPushEpoch;
            LIB_PUSH_CATS.forEach(function (cat) {
                var items = Array.isArray(lib[cat]) ? lib[cat] : [];
                var total = Math.max(1, Math.ceil(items.length / LIB_PUSH_BATCH));
                for (var i = 0; i < total; i += 1) {
                    pushMediaLibBatch(cat, items.slice(i * LIB_PUSH_BATCH, (i + 1) * LIB_PUSH_BATCH), i, total, epoch);
                }
            });
        } catch (_) {}
    }
    window.__sfPushMediaLibToNative = pushMediaLibToNative;

    // Self-start: the page loads its library BY ITSELF as soon as the Spotify
    // token is ready, with timed retries — never waiting for a native request
    // (that channel can be unreachable while JS->native keeps working).
    var libSelfLastAttempt = 0;
    function libSelfStartTick() {
        try {
            if (window.__sfMediaLibState === 'ready' || window.__sfMediaLibState === 'empty') return;
            if (!window.spotAuthToken) return;
            var now = Date.now();
            if (now - libSelfLastAttempt < 15000) return;
            libSelfLastAttempt = now;
            if (typeof window.checkMediaLib === 'function') window.checkMediaLib(true);
        } catch (_) {}
    }
    window.__sfLibSelfStartTick = libSelfStartTick;
    try {
        setInterval(libSelfStartTick, 1500);
    } catch (_) {}

    // =========================================================================
    // COMMAND QUEUE: the page polls AndBridge.pollCommands() and executes what
    // comes back. This REPLACES native->JS (evaluateJavascript) for commands,
    // which can be dead on a real device. Only whitelisted functions are ever
    // called; the interval is short while commands are pending or the native
    // UI is visible, longer otherwise.
    // =========================================================================
    var CMD_POLL_FAST = 400;
    var CMD_POLL_BASE = 1200;
    var CMD_POLL_SLOW = 4000;
    var CMD_FNS = [
        '__sfOpenCollection', '__sfOpenLibrary', '__sfOpenLibraryCategory',
        'checkMediaLib', 'fetchMediaItems', 'searchMediaItems',
        '__sfToggleSpotifySetting', '__sfRequestSpotifySettings',
        '__sfRequestQueue', '__sfNativeRequestHome', '__sfNativeOpenUri',
        '__sfSkip', '__sfToggleShuffle', '__sfToggleRepeat', '__sfTogglePlayback',
        '__sfMarkUserPlaybackIntent', '__sfSeekFraction'
    ];
    var cmdPollBusy = 0;

    function execCommand(cmd) {
        try {
            if (!cmd || typeof cmd !== 'object') return;
            var fn = String(cmd.fn || '');
            var arg = cmd.arg == null ? '' : String(cmd.arg);
            if (CMD_FNS.indexOf(fn) < 0) return;
            var target = window[fn];
            if (typeof target === 'function') target(arg);
        } catch (_) {}
    }
    window.__sfExecCommand = execCommand;

    function pollCommandsTick() {
        var delay = CMD_POLL_BASE;
        try {
            if (window.AndBridge && typeof window.AndBridge.pollCommands === 'function') {
                var raw = window.AndBridge.pollCommands();
                var res = (typeof raw === 'string' && raw) ? JSON.parse(raw) : null;
                var cmds = res && Array.isArray(res.cmds) ? res.cmds : [];
                var ui = res && res.ui ? String(res.ui) : '';
                cmds.slice(0, 8).forEach(execCommand);
                if (cmds.length) cmdPollBusy = 5;
                if (cmdPollBusy > 0) {
                    cmdPollBusy -= 1;
                    delay = CMD_POLL_FAST;
                } else if (ui || (typeof document === 'undefined' || document.visibilityState === 'visible')) {
                    delay = CMD_POLL_BASE;
                } else {
                    delay = CMD_POLL_SLOW;
                }
            }
        } catch (_) {}
        try { setTimeout(pollCommandsTick, delay); } catch (_) {}
    }
    window.__sfPollCommandsTick = pollCommandsTick;
    try {
        setTimeout(pollCommandsTick, 600);
    } catch (_) {}

    async function fetchAllLibrary() {
        if (!window.spotAuthToken || !window.spotAuthToken.startsWith('Bearer ')) {
            console.warn("[Spotifuck] fetchAllLibrary: Authorization token not ready.");
            // A missing or malformed credential must surface as an explicit
            // error, never as an empty library: the account may hold playlists.
            const tokenError = new Error('token-not-ready');
            tokenError.name = 'TokenError';
            throw tokenError;
        }
        const limit = 50;
        let offset = 0;
        let allItems = [];
        let rawItemCount = 0;
        let hasMore = true;

        while (hasMore && offset < 1000) {
            const headers = {
                'Authorization': window.spotAuthToken,
                'Content-Type': 'application/json;charset=UTF-8',
                'app-platform': 'WebPlayer',
                'spotify-app-version': '1.2.40.0'
            };
            if (window.spotCliToken) {
                headers['Client-Token'] = window.spotCliToken;
            }
            const fallbackHash = '0082bf82412db50128add72dbdb73e2961d59100b9cbf41fb25c568bd8bc358b';
            const activeHash = getGqlHash('libraryV3', fallbackHash);
            const hashCandidates = activeHash === fallbackHash
                ? [fallbackHash]
                : [activeHash, fallbackHash];
            libDiagUpdate({ hashSource: activeHash === fallbackHash ? 'fallback' : 'dynamic' });
            libDiagRecord('hash', true, activeHash === fallbackHash ? 'hash intégré' : 'hash capté + intégré');
            let resp = null;
            let data = null;
            let gqlCodes = [];
            for (const candidate of hashCandidates) {
                const candidateLabel = candidate === fallbackHash ? 'fallback' : 'dynamic';
                try {
                    resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                        method: 'POST',
                        mode: 'cors',
                        credentials: 'include',
                        headers: headers,
                        body: JSON.stringify({
                            variables: {
                                filters: [],
                                order: null,
                                textFilter: '',
                                features: ['LIKED_SONGS', 'YOUR_EPISODES_V2', 'PRERELEASES', 'EVENTS'],
                                limit: limit,
                                offset: offset,
                                flatten: false,
                                expandedFolders: [],
                                folderUri: null,
                                includeFoldersWhenFlattening: true
                            },
                            operationName: 'libraryV3',
                            extensions: {
                                persistedQuery: {
                                    version: 1,
                                    sha256Hash: candidate
                                }
                            }
                        })
                    });
                } catch (networkErr) {
                    // A network failure is its own category: record it and let
                    // the caller classify it (never an empty library).
                    libDiagAttempt({ candidate: candidateLabel, networkError: true });
                    libDiagRecord('http', false, 'erreur réseau');
                    throw networkErr;
                }
                if (resp.ok) {
                    data = await resp.json();
                    if (!data?.errors?.length) {
                        libDiagAttempt({ candidate: candidateLabel, httpStatus: resp.status, gqlErrorCodes: [] });
                        break;
                    }
                    gqlCodes = libDiagGqlCodes(data.errors);
                    libDiagAttempt({ candidate: candidateLabel, httpStatus: resp.status, gqlErrorCodes: gqlCodes });
                    data = null;
                } else {
                    libDiagAttempt({ candidate: candidateLabel, httpStatus: resp.status, gqlErrorCodes: [] });
                }
            }

            // A failed request must surface as an error, never as an empty
            // library: "no playlist" and "could not load" need different UI.
            if (!resp || !resp.ok || !data) {
                logBridgeError('pathfinder', { name: 'HttpError', message: String((resp && resp.status) || '') });
                const httpError = new Error('HTTP ' + String((resp && resp.status) || '0') + (gqlCodes.length ? ' ' + gqlCodes.join(',') : ''));
                httpError.name = 'HttpError';
                if (gqlCodes.length) httpError.name = 'GraphQLError';
                throw httpError;
            }

            // Validate the real response shape before trusting it. libraryV3
            // is an undocumented internal operation: an unrecognized structure
            // is a distinct failure ("shape-mismatch"), never a silently empty
            // library. `me: null` means the session was not recognized.
            const dataRoot = data && data.data;
            const meNode = dataRoot ? dataRoot.me : undefined;
            if (dataRoot && meNode === null) {
                libDiagPatchLastAttempt({ shape: 'me-null' });
                libDiagRecord('shape', false, 'me=null');
                const sessionError = new Error('libraryV3-me-null');
                sessionError.name = 'ShapeError';
                throw sessionError;
            }
            const libNode = meNode && meNode.libraryV3;
            if (!libNode || !Array.isArray(libNode.items)) {
                libDiagPatchLastAttempt({ shape: 'mismatch' });
                libDiagRecord('shape', false, 'structure inattendue');
                const shapeError = new Error('libraryV3-shape-unexpected');
                shapeError.name = 'ShapeError';
                throw shapeError;
            }

            const items = libNode.items;
            libDiagPatchLastAttempt({ shape: 'ok', items: items.length });
            libDiagRecord('shape', true, 'items=' + items.length);
            rawItemCount += items.length;
            libDiagUpdate({ itemsTotal: rawItemCount });
            allItems = allItems.concat(items);

            if (items.length < limit) {
                hasMore = false;
            } else {
                offset += limit;
            }
        }
        return allItems;
    }
    window.fetchAllLibrary = fetchAllLibrary;

    function parseLibrary(items) {
        const res = { playlists: [], albums: [], artists: [], podcasts: [] };
        let skippedItems = 0;
        if (!Array.isArray(items)) return res;

        // The real libraryV3 payload wraps items at varying depths
        // (item.data, item.data.data, data, data.data...). Resolve the first
        // node that actually looks like a media object: it must carry a
        // spotify: URI or a name. Nothing is invented: only fields that
        // really exist are read.
        function unwrapItemData(elem) {
            const chain = [
                elem?.item?.data?.data,
                elem?.item?.data,
                elem?.item,
                elem?.data?.data,
                elem?.data,
                elem
            ];
            for (const node of chain) {
                if (!node || typeof node !== 'object') continue;
                const nodeUri = node.uri || node._uri;
                if (typeof nodeUri === 'string' && nodeUri.indexOf('spotify:') === 0) return node;
                if (node.name || node.title || node.profile?.name) return node;
            }
            return chain.find(n => n && typeof n === 'object') || null;
        }

        function walkImage(node) {
            if (!node || typeof node !== 'object') return null;
            const direct =
                node.images?.items?.[0]?.sources?.[0]?.url ||
                node.images?.items?.[0]?.url ||
                node.images?.[0]?.url ||
                node.coverArt?.sources?.[0]?.url ||
                node.visuals?.avatarImage?.sources?.[0]?.url ||
                node.visuals?.squareImage?.sources?.[0]?.url ||
                node.visuals?.mainImage?.sources?.[0]?.url ||
                node.visuals?.headerImage?.sources?.[0]?.url ||
                null;
            return direct;
        }

        items.forEach((elem) => {
            const data = unwrapItemData(elem);
            if (!data) {
                skippedItems += 1;
                return;
            }
            const typename = data.__typename || data.type || elem?.item?.__typename || '';
            const uri = data.uri || data._uri || (data.id ? 'spotify:' + typename.toLowerCase() + ':' + data.id : '') || '';
            const name = data.name || data.title || data.profile?.name || 'Unknown';
            const image = walkImage(data) || walkImage(elem?.item?.data) || walkImage(elem?.item);

            if (!uri) {
                skippedItems += 1;
                return;
            }

            if (typename.includes('Playlist') || uri.includes(':playlist:')) {
                const isLiked = name === 'Liked Songs' || uri.includes('collection');
                if (isLiked) {
                    if (res.playlists.some(p => p.name === 'Liked Songs' || p.id.includes('collection'))) return;
                } else if (res.playlists.some(p => p.id === uri)) {
                    return;
                }
                res.playlists.push({
                    id: isLiked ? 'spotify:collection:tracks' : uri,
                    name: name,
                    image: isLiked ? 'https://misc.scdn.co/liked-songs/liked-songs-640.png' : image,
                    browsable: true
                });
            } else if (typename.includes('Album') || uri.includes(':album:')) {
                res.albums.push({
                    id: uri,
                    name: name,
                    image: image,
                    artists: data.artists?.items?.map(a => a.profile?.name).filter(Boolean) || [],
                    browsable: true
                });
            } else if (typename.includes('Artist') || uri.includes(':artist:')) {
                res.artists.push({
                    id: uri,
                    name: name,
                    image: image,
                    browsable: true
                });
            } else if (typename.includes('Podcast') || typename.includes('Show') || uri.includes(':show:')) {
                res.podcasts.push({
                    id: uri,
                    name: name,
                    image: image,
                    artists: data.publisher?.name ? [data.publisher.name] : [],
                    browsable: true
                });
            }
        });
        console.log(`[Spotifuck] parseLibrary parsed ${res.playlists.length} playlists, ${res.albums.length} albums, ${res.artists.length} artists, ${res.podcasts.length} podcasts`);
        libDiagUpdate({
            parsed: {
                playlists: res.playlists.length,
                albums: res.albums.length,
                artists: res.artists.length,
                podcasts: res.podcasts.length,
                skipped: skippedItems
            }
        });
        return res;
    }
    window.parseLibrary = parseLibrary;

    // =========================================================================
    // SECTION 5: ASYNCHRONOUS MEDIA BROWSER & SEARCH
    // =========================================================================

    window.__sfMediaItemsCache = window.__sfMediaItemsCache || new Map();

    function rememberCurrentTracks(parentId, tracks) {
        if (!Array.isArray(tracks) || !tracks.length) return;
        const uris = tracks.map(t => t && (t.id || t.uri)).filter(u => u && u.includes(':track:'));
        if (uris.length > 0) {
            window.__sfCurrentContextUri = parentId || null;
            window.__sfCurrentTrackUris = uris;
        }
    }

    async function fetchMediaItems(parentId) {
        try {
            if (window.__sfMediaItemsCache && window.__sfMediaItemsCache.has(parentId)) {
                const cachedTracks = window.__sfMediaItemsCache.get(parentId);
                rememberCurrentTracks(parentId, cachedTracks);
                AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(cachedTracks));
                return;
            }
            await ensureAuthToken();
            // 1. Root categories (playlists, albums, artists, podcasts)
            if (parentId === 'playlists' || parentId === 'albums' || parentId === 'artists' || parentId === 'podcasts') {
                if (!window.mediaLib || !window.mediaLib[parentId]?.length) {
                    window.pendingMediaRequests.add(parentId);
                    await checkMediaLib();
                }
                window.pendingMediaRequests.delete(parentId);
                const libState = (window.mediaLib && window.mediaLib.state) || window.__sfMediaLibState || 'pending';
                const categoryItems = (window.mediaLib && Array.isArray(window.mediaLib[parentId])) ? window.mediaLib[parentId] : null;
                if (categoryItems && categoryItems.length > 0) {
                    const items = categoryItems.map(item => {
                        let img = item.image;
                        if (item.name === 'Liked Songs' || (item.id && (item.id.includes('collection') || item.id === 'spotify:playlist:liked'))) {
                            img = 'https://misc.scdn.co/liked-songs/liked-songs-640.png';
                        }
                        return { ...item, image: img, isGrid: true };
                    });
                    AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(items));
                    return;
                }
                if (categoryItems && categoryItems.length === 0 && (libState === 'ready' || libState === 'empty')) {
                    // Truly empty account: honest empty state, never an error.
                    AndBridge.onMediaItemsLoaded(parentId, "[]");
                    mediaItemsStatusRow('empty', parentId);
                    return;
                }
                if (libState === 'error') {
                    // A failed fetch is never an empty library.
                    AndBridge.onMediaItemsLoaded(parentId, "[]");
                    mediaItemsStatusRow('error', parentId, window.__sfMediaLibError || window.__sfLibError);
                    return;
                }
                console.log("[Spotifuck] fetchMediaItems: mediaLib not ready yet for " + parentId + ". Queued in pendingMediaRequests.");
                window.pendingMediaRequests.add(parentId);
                mediaItemsStatusRow('loading', parentId);
                return;
            }

        window.likedSongsCache = window.likedSongsCache || null;

        async function getLikedSongsTracks() {
            if (window.likedSongsCache && window.likedSongsCache.length > 0) {
                return window.likedSongsCache;
            }

            const activeHash = getGqlHash('fetchLibraryTracks', '087278b20b743578a6262c2b0b4bcd20d879c503cc359a2285baf083ef944240');

            try {
                console.log("[Spotifuck] Fetching Liked Songs via fetchLibraryTracks GQL (hash: " + activeHash.substring(0, 8) + ")...");
                await ensureAuthToken();
                const headers = {
                    'Authorization': window.spotAuthToken,
                    'Content-Type': 'application/json;charset=UTF-8',
                    'app-platform': 'WebPlayer',
                    'spotify-app-version': '1.2.40.0'
                };
                if (window.spotCliToken) {
                    headers['Client-Token'] = window.spotCliToken;
                }
                const resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                    method: 'POST',
                    mode: 'cors',
                    credentials: 'include',
                    headers: headers,
                    body: JSON.stringify({
                        variables: {
                            offset: 0,
                            limit: 50
                        },
                        operationName: 'fetchLibraryTracks',
                        extensions: {
                            persistedQuery: {
                                version: 1,
                                sha256Hash: activeHash
                            }
                        }
                    })
                });
                console.log("[Spotifuck] fetchLibraryTracks status:", resp.status);
                if (resp.ok) {
                    const data = await resp.json();
                    const tracksData = data?.data?.me?.library?.tracks || data?.data?.me?.libraryV3 || data?.data?.libraryTracks || data?.data;
                    const items = tracksData?.items || [];
                    const tracks = items.map(elem => {
                        const trackWrapper = elem?.track || elem?.itemV2 || elem;
                        const trackData = trackWrapper?.data || trackWrapper;
                        if (!trackData) return null;
                        const uri = trackWrapper?._uri || trackWrapper?.uri || trackData?.uri || (trackData?.id ? 'spotify:track:' + trackData.id : '') || "";
                        if (!uri || !uri.includes(':track:')) return null;
                        const artists = trackData.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || trackData.artists?.map(a => a.name).filter(Boolean) || [];
                        const albumData = trackData.albumOfTrack || trackData.album || {};
                        const coverUrl = pickOptimalArtwork(albumData.coverArt?.sources, albumData.images);
                        return {
                            id: uri,
                            name: trackData.name || trackData.title || "Unknown Track",
                            image: coverUrl,
                            artists: artists,
                            browsable: false
                        };
                    }).filter(Boolean);
                    console.log(`[Spotifuck] fetchLibraryTracks parsed ${tracks.length} Liked Songs tracks!`);
                    if (tracks.length > 0) {
                        window.likedSongsCache = tracks;
                        return tracks;
                    }
                }
            } catch (e) {
                logBridgeError('fetchLibraryTracks', e);
            }

            return window.likedSongsCache || [];
        }

        // 2. Liked Songs
        if (parentId === 'spotify:collection:tracks' || parentId.endsWith(':collection') || parentId.startsWith('spotify:collection')) {
            console.log("[Spotifuck] Liked Songs requested for parentId:", parentId);
            const tracks = await getLikedSongsTracks();
            rememberCurrentTracks(parentId, tracks);
            console.log(`[Spotifuck] Returning ${tracks.length} Liked Songs tracks to Android Auto for ${parentId}`);
            AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(tracks));
            return;
        }

            // 3. Specific Playlist tracks (using GQL fetchPlaylist)
            if (parentId.startsWith('spotify:playlist:') || (parentId.includes(':user:') && parentId.includes(':playlist:'))) {
                const fallbackPlaylistHash = '346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763';
                const playlistHashCandidates = [];
                const capturedPlaylistHash = getGqlHash('fetchPlaylist', fallbackPlaylistHash);
                if (/^[a-f0-9]{64}$/i.test(capturedPlaylistHash) && playlistHashCandidates.indexOf(capturedPlaylistHash) < 0) {
                    playlistHashCandidates.push(capturedPlaylistHash);
                }
                if (playlistHashCandidates.indexOf(fallbackPlaylistHash) < 0) playlistHashCandidates.push(fallbackPlaylistHash);
                let playlistData = null;
                let playlistError = null;
                for (let i = 0; i < playlistHashCandidates.length; i++) {
                    try {
                        const resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                            method: 'POST',
                            mode: 'cors',
                            credentials: 'include',
                            headers: {
                                'Authorization': window.spotAuthToken,
                                'Client-Token': window.spotCliToken || '',
                                'Content-Type': 'application/json;charset=UTF-8',
                                'app-platform': 'WebPlayer',
                                'spotify-app-version': '1.2.40.0'
                            },
                            body: JSON.stringify({
                                variables: {
                                    uri: parentId,
                                    offset: 0,
                                    limit: 80,
                                    enableWatchFeedEntrypoint: false
                                },
                                operationName: 'fetchPlaylist',
                                extensions: {
                                    persistedQuery: {
                                        version: 1,
                                        sha256Hash: playlistHashCandidates[i]
                                    }
                                }
                            })
                        });
                        if (!resp || !resp.ok) {
                            const httpError = new Error("Failed to fetch playlist tracks GQL: " + (resp ? resp.statusText : 'no response'));
                            httpError.name = 'HttpError';
                            httpError.status = resp ? resp.status : 0;
                            throw httpError;
                        }
                        const payload = await resp.json();
                        if (payload && payload.errors && payload.errors.length) {
                            const gqlError = new Error('fetchPlaylist GraphQL rejected');
                            gqlError.name = 'GraphQLError';
                            gqlError.codes = payload.errors.map(e => String((e && e.message) || '')).join('|').slice(0, 120);
                            throw gqlError;
                        }
                        if (!payload || !payload.data) {
                            const shapeError = new Error('fetchPlaylist shape-unexpected: no data');
                            shapeError.name = 'ShapeError';
                            throw shapeError;
                        }
                        playlistData = payload.data;
                        break;
                    } catch (e) {
                        playlistError = e;
                    }
                }
                if (!playlistData) throw playlistError || new Error('fetchPlaylist failed');
                const playlistObj = playlistData.playlistV2 || playlistData.playlist || playlistData.playlistUnion;
                if (!playlistObj || typeof playlistObj !== 'object') {
                    const shapeError = new Error('fetchPlaylist shape-unexpected: no playlist');
                    shapeError.name = 'ShapeError';
                    throw shapeError;
                }
                const content = playlistObj.content || playlistObj.tracks || playlistObj;
                const items = content?.items || playlistObj.items || [];
                if (!Array.isArray(items)) {
                    const shapeError = new Error('fetchPlaylist shape-mismatch: items');
                    shapeError.name = 'ShapeError';
                    throw shapeError;
                }
                const tracks = items.map(elem => {
                    const itemV2 = elem?.itemV2 || elem?.item;
                    const trackData = itemV2?.data || elem?.track || itemV2 || elem;
                    if (!trackData) return null;
                    const uri = trackData.uri || trackData._uri || elem?.uri || (trackData.id ? 'spotify:track:' + trackData.id : '') || "";
                    if (!uri || !uri.includes(':track:')) return null;
                    const artists = trackData.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || trackData.artists?.map(a => a.name).filter(Boolean) || [];
                    const albumData = trackData.albumOfTrack || trackData.album || {};
                    const coverUrl = pickOptimalArtwork(albumData.coverArt?.sources, albumData.images);
                    return {
                        id: uri,
                        name: trackData.name || trackData.title || "Unknown Track",
                        image: coverUrl,
                        artists: artists,
                        browsable: false
                    };
                }).filter(Boolean);
                if (tracks.length > 0) window.__sfMediaItemsCache.set(parentId, tracks);
                rememberCurrentTracks(parentId, tracks);
                console.log(`[Spotifuck] fetchPlaylist parsed ${tracks.length} tracks for ${parentId}`);
                AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(tracks));
                return;
            }

            // 3. Specific Album tracks (using GQL getAlbum)
            if (parentId.startsWith('spotify:album:')) {
                const albumId = parentId.split(':')[2];
                const resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                    method: 'POST',
                    mode: 'cors',
                    credentials: 'include',
                    headers: {
                        'Authorization': window.spotAuthToken,
                        'Client-Token': window.spotCliToken,
                        'Content-Type': 'application/json;charset=UTF-8',
                        'app-platform': 'WebPlayer',
                        'spotify-app-version': '1.2.40.0'
                    },
                    body: JSON.stringify({
                        variables: {
                            uri: `spotify:album:${albumId}`,
                            locale: "",
                            offset: 0,
                            limit: 80
                        },
                        operationName: 'getAlbum',
                        extensions: {
                            persistedQuery: {
                                version: 1,
                                sha256Hash: getGqlHash('getAlbum', 'b9bfabef66ed756e5e13f68a942deb60bd4125ec1f1be8cc42769dc0259b4b10')
                            }
                        }
                    })
                });
                if (!resp.ok) throw new Error("Failed to fetch album GQL: " + resp.statusText);
                const data = await resp.json();
                const albumData = data?.data?.albumUnion || data?.data?.album || data?.data?.albumV2;
                const albumCover = pickOptimalArtwork(albumData?.coverArt?.sources, albumData?.images);
                const items = albumData?.tracksV2?.items || albumData?.tracks?.items || albumData?.tracks || [];
                const tracks = items.map(elem => {
                    const trackObj = elem?.track || elem?.item?.data || elem;
                    if (!trackObj) return null;
                    const uri = trackObj.uri || trackObj._uri || (trackObj.id ? 'spotify:track:' + trackObj.id : '') || "";
                    if (!uri) return null;
                    const artists = trackObj.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || trackObj.artists?.map(a => a.name).filter(Boolean) || [];
                    return {
                        id: uri,
                        name: trackObj.name || trackObj.title || "Unknown Track",
                        image: albumCover,
                        artists: artists,
                        browsable: false
                    };
                }).filter(Boolean);
                if (tracks.length > 0) window.__sfMediaItemsCache.set(parentId, tracks);
                rememberCurrentTracks(parentId, tracks);
                console.log(`[Spotifuck] getAlbum parsed ${tracks.length} tracks for ${parentId}`);
                AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(tracks));
                return;
            }

            // 4. Specific Artist (fetch their top tracks using GQL queryArtistOverview)
            if (parentId.startsWith('spotify:artist:')) {
                const artistId = parentId.split(':')[2];
                const resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                    method: 'POST',
                    mode: 'cors',
                    credentials: 'include',
                    headers: {
                        'Authorization': window.spotAuthToken,
                        'Client-Token': window.spotCliToken,
                        'Content-Type': 'application/json;charset=UTF-8',
                        'app-platform': 'WebPlayer',
                        'spotify-app-version': '1.2.40.0'
                    },
                    body: JSON.stringify({
                        variables: {
                            uri: `spotify:artist:${artistId}`,
                            locale: ""
                        },
                        operationName: 'queryArtistOverview',
                        extensions: {
                            persistedQuery: {
                                version: 1,
                                sha256Hash: getGqlHash('queryArtistOverview', '5b9e64f43843fa3a9b6a98543600299b0a2cbbbccfdcdcef2402eb9c1017ca4c')
                            }
                        }
                    })
                });
                if (!resp.ok) throw new Error("Failed to fetch artist top tracks GQL: " + resp.statusText);
                const data = await resp.json();
                const artistData = data?.data?.artistUnion || data?.data?.artist;
                const items = artistData?.discography?.topTracks?.items || artistData?.topTracks?.items || artistData?.topTracks || [];
                const tracks = items.map(elem => {
                    const trackObj = elem?.track || elem?.item?.data || elem;
                    if (!trackObj) return null;
                    const uri = trackObj.uri || trackObj._uri || (trackObj.id ? 'spotify:track:' + trackObj.id : '') || "";
                    if (!uri) return null;
                    const artists = trackObj.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || [];
                    const albumData = trackObj.albumOfTrack || trackObj.album || {};
                    const coverUrl = pickOptimalArtwork(albumData.coverArt?.sources, albumData.images);
                    return {
                        id: uri,
                        name: trackObj.name || trackObj.title || "Unknown Track",
                        image: coverUrl,
                        artists: artists,
                        browsable: false
                    };
                }).filter(Boolean);
                if (tracks.length > 0) window.__sfMediaItemsCache.set(parentId, tracks);
                rememberCurrentTracks(parentId, tracks);
                console.log(`[Spotifuck] queryArtistOverview parsed ${tracks.length} tracks for ${parentId}`);
                AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(tracks));
                return;
            }

            // 5. Specific Podcast (fetch show episodes)
            if (parentId.startsWith('spotify:show:')) {
                const showId = parentId.split(':')[2];
                const resp = await fetch(`https://api.spotify.com/v1/shows/${showId}/episodes?limit=50`, {
                    headers: {
                        'Authorization': window.spotAuthToken,
                        'Client-Token': window.spotCliToken,
                        'app-platform': 'WebPlayer'
                    }
                });
                if (!resp.ok) throw new Error("Failed to fetch show episodes");
                const data = await resp.json();
                const episodes = (data.items || []).map(e => {
                    const uri = e.uri || e._uri || (e.id ? 'spotify:episode:' + e.id : '') || "";
                    return {
                        id: uri,
                        name: e.name,
                        image: e.images?.[0]?.url || null,
                        browsable: false
                    };
                });
                AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(episodes));
                return;
            }

            // Fallback for unknown categories: distinct, honest state.
            AndBridge.onMediaItemsLoaded(parentId, "[]");
            mediaItemsStatusRow('unsupported', parentId);
        } catch (e) {
            logBridgeError('fetchMediaItems', e);
            window.__sfLibError = e;
            AndBridge.onMediaItemsLoaded(parentId, "[]");
            mediaItemsStatusRow('error', parentId, e);
        }
    }

        // Honest per-screen status rows for the media/detail pipeline. They are
        // pushed on the same 'media:<parentId>' channel the screen already
        // renders, so the state lands on the concerned page only. Failures and
        // empty libraries are distinct rows; errors carry a real retry sentinel
        // handled by openNativeRow ("spotify:retry:media:" + parentId).
        function mediaItemsStatusRow(kind, parentId, e) {
            var row;
            if (kind === 'loading') {
                row = { title: 'Chargement des playlists…', section: 'Votre bibliothèque' };
            } else if (kind === 'empty') {
                row = {
                    title: parentId === 'playlists' ? 'Aucune playlist dans ce compte' : 'Aucun élément dans ce compte',
                    subtitle: 'Créez-en un sur Spotify, puis réessayez',
                    section: 'Votre bibliothèque'
                };
            } else if (kind === 'unsupported') {
                row = {
                    title: 'Catégorie non prise en charge',
                    subtitle: 'Ce type de contenu ne peut pas être affiché ici',
                    section: 'Détails'
                };
            } else {
                var subtitle = 'Réponse inattendue — touchez pour réessayer';
                var errName = String((e && (e.name || e.message)) || e || '');
                if ((e && e.name === 'HttpError' && (e.status === 401 || e.status === 403)) || /401|403/.test(errName) && errName.indexOf('HttpError') >= 0) {
                    subtitle = 'Accès refusé par Spotify — touchez pour réessayer';
                } else if (errName === 'TypeError' || errName === 'NetworkError' || /network|fetch/i.test(errName)) {
                    subtitle = 'Erreur réseau — touchez pour réessayer';
                }
                row = {
                    title: 'Impossible de charger les titres',
                    subtitle: subtitle,
                    section: 'Détails',
                    uri: 'spotify:retry:media:' + parentId
                };
            }
            if (kind === 'error' && (parentId === 'playlists' || parentId === 'albums' || parentId === 'artists' || parentId === 'podcasts')) {
                row.title = 'Impossible de charger les playlists';
                row.section = 'Votre bibliothèque';
            }
            if (kind === 'empty' || kind === 'error' || kind === 'loading') {
                row.uri = row.uri || ('spotify:retry:media:' + parentId);
            }
            try {
                AndBridge.onNativeUiData('media:' + parentId, JSON.stringify([row]));
            } catch (_) {}
        }
    window.fetchMediaItems = fetchMediaItems;

    window.__sfSearchCache = window.__sfSearchCache || new Map();
    let currentSearchAbortController = null;

    async function searchMediaItems(query) {
        try {
            const normQuery = String(query || '').trim().toLowerCase();
            if (!normQuery) {
                AndBridge.onSearchCompleted(query, "[]");
                return;
            }
            if (window.__sfSearchCache && window.__sfSearchCache.has(normQuery)) {
                const cached = window.__sfSearchCache.get(normQuery);
                rememberCurrentTracks('spotify:search:' + normQuery, cached);
                AndBridge.onSearchCompleted(query, JSON.stringify(cached));
                return;
            }

            if (currentSearchAbortController) {
                try { currentSearchAbortController.abort(); } catch (_) {}
            }
            const abortController = typeof AbortController === 'function' ? new AbortController() : null;
            currentSearchAbortController = abortController;

            await ensureAuthToken();
            const token = window.spotAuthToken || (function() { try { return localStorage.getItem('spot_auth_token'); } catch(_) { return null; } })();
            const cliTok = window.spotCliToken || (function() { try { return localStorage.getItem('spot_cli_token'); } catch(_) { return null; } })();
            if (!token) {
                console.warn("[Spotifuck] searchMediaItems: Auth token unavailable.");
                AndBridge.onSearchCompleted(query, "[]");
                return;
            }
            const headers = {
                'Authorization': token,
                'Content-Type': 'application/json;charset=UTF-8',
                'app-platform': 'WebPlayer',
                'spotify-app-version': '1.2.40.0'
            };
            if (cliTok) {
                headers['Client-Token'] = cliTok;
            }
            const fetchOpts = {
                method: 'POST',
                mode: 'cors',
                credentials: 'include',
                headers: headers,
                body: JSON.stringify({
                    variables: {
                        searchTerm: query,
                        offset: 0,
                        limit: 12,
                        numberOfTopResults: 5,
                        includeAudiobooks: false,
                        includeArtistHasConcertsField: false,
                        includePreReleases: false,
                        includeLocalConcertsField: false,
                        includeAuthors: false
                    },
                    operationName: 'searchDesktop',
                    extensions: {
                        persistedQuery: {
                            version: 1,
                            sha256Hash: getGqlHash('searchDesktop', '4801118d4a100f756e833d33984436a3899cff359c532f8fd3aaf174b60b3b49')
                        }
                    }
                })
            };
            if (abortController) fetchOpts.signal = abortController.signal;
            const resp = await libFetch('https://api-partner.spotify.com/pathfinder/v2/query', fetchOpts);
            if (!resp.ok) throw new Error("Failed to search GQL: " + resp.statusText);
            const data = await resp.json();
            const searchData = data?.data?.searchV2 || data?.data?.search;
            const results = [];
            const seenUris = new Set();

            const pushItem = (item) => {
                if (!item || !item.id || seenUris.has(item.id) || results.length >= 24) return;
                seenUris.add(item.id);
                results.push(item);
            };

            // 1. Top Result (Spotify's best direct match - Song, Artist, Album, etc.)
            const topResults = searchData?.topResultsV2?.items || searchData?.topResults?.items || [];
            topResults.forEach(elem => {
                const itemWrapper = elem?.item || elem;
                const data = itemWrapper?.data || itemWrapper;
                if (!data) return;
                const typeName = data.__typename || '';
                const uri = itemWrapper.uri || data.uri || (data.id ? 'spotify:' + (typeName.toLowerCase().replace('responsewrapper', '') || 'track') + ':' + data.id : '') || "";
                if (!uri) return;

                let type = 'Song';
                let isBrowsable = false;
                let artistsList = [];
                let img = null;

                if (uri.includes(':track:')) {
                    type = 'Song';
                    isBrowsable = false;
                    artistsList = data.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || data.artists?.map(a => a.name).filter(Boolean) || [];
                    const albumData = data.albumOfTrack || data.album || {};
                    img = pickOptimalArtwork(albumData.coverArt?.sources, albumData.images);
                } else if (uri.includes(':artist:')) {
                    type = 'Artist';
                    isBrowsable = true;
                    img = pickOptimalArtwork(data.visuals?.avatarImage?.sources, data.images);
                } else if (uri.includes(':album:')) {
                    type = 'Album';
                    isBrowsable = true;
                    artistsList = data.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || [];
                    img = pickOptimalArtwork(data.coverArt?.sources, data.images);
                } else if (uri.includes(':playlist:')) {
                    type = 'Playlist';
                    isBrowsable = true;
                    const owner = data.ownerV2?.data?.name || data.owner?.name || "";
                    if (owner) artistsList = [owner];
                    img = pickOptimalArtwork(data.images?.items?.[0]?.sources, data.images);
                }

                pushItem({
                    id: uri,
                    name: data.name || data.title || "Top Result",
                    image: img,
                    type: type,
                    artists: artistsList,
                    browsable: isBrowsable
                });
            });

            // Extract all category pools
            const rawSongs = [];
            (searchData?.tracksV2?.items || searchData?.tracks?.items || []).forEach(elem => {
                const itemWrapper = elem?.item || elem;
                const data = itemWrapper?.data || itemWrapper;
                if (!data) return;
                const uri = itemWrapper.uri || data.uri || (data.id ? 'spotify:track:' + data.id : '') || "";
                if (!uri || !uri.includes(':track:')) return;
                const artistsList = data.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || data.artists?.map(a => a.name).filter(Boolean) || [];
                const albumData = data.albumOfTrack || data.album || {};
                const coverUrl = pickOptimalArtwork(albumData.coverArt?.sources, albumData.images);
                rawSongs.push({
                    id: uri,
                    name: data.name || data.title || "Track",
                    image: coverUrl,
                    type: 'Song',
                    artists: artistsList,
                    browsable: false
                });
            });

            const rawAlbums = [];
            (searchData?.albumsV2?.items || searchData?.albums?.items || []).forEach(elem => {
                const item = elem?.data || elem;
                if (!item) return;
                const uri = item.uri || (item.id ? 'spotify:album:' + item.id : '');
                if (!uri) return;
                const name = item.name || "Album";
                const img = pickOptimalArtwork(item.coverArt?.sources, item.images);
                const artists = item.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || [];
                rawAlbums.push({
                    id: uri,
                    name: name,
                    image: img,
                    type: 'Album',
                    artists: artists,
                    browsable: true
                });
            });

            const rawPlaylists = [];
            (searchData?.playlists?.items || []).forEach(elem => {
                const item = elem?.data || elem;
                if (!item) return;
                const uri = item.uri || (item.id ? 'spotify:playlist:' + item.id : '');
                if (!uri) return;
                const name = item.name || item.title || "Playlist";
                const img = pickOptimalArtwork(item.images?.items?.[0]?.sources, item.images);
                const owner = item.ownerV2?.data?.name || item.owner?.name || "";
                rawPlaylists.push({
                    id: uri,
                    name: name,
                    image: img,
                    type: 'Playlist',
                    artists: owner ? [owner] : [],
                    browsable: true
                });
            });

            const rawArtists = [];
            (searchData?.artists?.items || []).forEach(elem => {
                const item = elem?.data || elem;
                if (!item) return;
                const uri = item.uri || (item.id ? 'spotify:artist:' + item.id : '');
                if (!uri) return;
                const name = item.profile?.name || item.name || "Artist";
                const img = pickOptimalArtwork(item.visuals?.avatarImage?.sources, item.images);
                rawArtists.push({
                    id: uri,
                    name: name,
                    image: img,
                    type: 'Artist',
                    artists: [],
                    browsable: true
                });
            });

            // 2. Interleave: Top 6 Songs -> Top 3 Albums -> Top 3 Playlists -> Top 2 Artists -> Remaining
            rawSongs.slice(0, 6).forEach(pushItem);
            rawAlbums.slice(0, 3).forEach(pushItem);
            rawPlaylists.slice(0, 3).forEach(pushItem);
            rawArtists.slice(0, 2).forEach(pushItem);

            // 3. Append remaining results
            rawSongs.slice(6).forEach(pushItem);
            rawAlbums.slice(3).forEach(pushItem);
            rawPlaylists.slice(3).forEach(pushItem);
            rawArtists.slice(2).forEach(pushItem);
            if (results.length > 0 && window.__sfSearchCache) {
                if (window.__sfSearchCache.size >= 30) {
                    const oldestKey = window.__sfSearchCache.keys().next().value;
                    window.__sfSearchCache.delete(oldestKey);
                }
                window.__sfSearchCache.set(normQuery, results);
            }
            rememberCurrentTracks('spotify:search:' + normQuery, results);
            console.log(`[Spotifuck] Search parsed ${results.length} ordered results (Top -> Songs -> Albums -> Playlists -> Artists) for "${query}"`);
            AndBridge.onSearchCompleted(query, JSON.stringify(results));
        } catch (e) {
            if (e && e.name === 'AbortError') return;
            logBridgeError('searchMediaItems', e);
            AndBridge.onSearchCompleted(query, "[]");
        }
    }
    window.searchMediaItems = searchMediaItems;

    function melodixHomeCopy() {
        const locale = (document.documentElement.lang || navigator.language || 'en').toLowerCase().split('-')[0];
        const copy = {
            fr: { morning: 'Bonjour', afternoon: 'Bon après-midi', evening: 'Bonsoir', discover: 'À découvrir' },
            en: { morning: 'Good morning', afternoon: 'Good afternoon', evening: 'Good evening', discover: 'Discover' },
            es: { morning: 'Buenos días', afternoon: 'Buenas tardes', evening: 'Buenas noches', discover: 'Descubre' },
            de: { morning: 'Guten Morgen', afternoon: 'Guten Tag', evening: 'Guten Abend', discover: 'Entdecken' },
            it: { morning: 'Buongiorno', afternoon: 'Buon pomeriggio', evening: 'Buonasera', discover: 'Scopri' },
            pt: { morning: 'Bom dia', afternoon: 'Boa tarde', evening: 'Boa noite', discover: 'Descobrir' }
        };
        const labels = copy[locale] || copy.en;
        const hour = new Date().getHours();
        return {
            greeting: hour < 12 ? labels.morning : hour < 18 ? labels.afternoon : labels.evening,
            discover: labels.discover
        };
    }

    function melodixHomeResourcePath(href) {
        try {
            const url = new URL(href, window.location.href);
            if (url.origin !== window.location.origin) return false;
            return /^\/(playlist|album|artist|track|show|episode|audiobook)\/[^/]+/.test(url.pathname);
        } catch (_) {
            return false;
        }
    }

    function collectMelodixHomeSections(mainView) {
        if (!mainView) return [];
        const cardNodes = Array.from(mainView.querySelectorAll('[data-testid="card"]'));
        const candidates = cardNodes.length
            ? cardNodes
            : Array.from(mainView.querySelectorAll('a[href]')).filter((anchor) => anchor.querySelector('img'));
        const grouped = new Map();
        const seen = new Set();

        candidates.forEach((candidate) => {
            const sourceAnchor = candidate.matches('a[href]')
                ? candidate
                : candidate.querySelector('a[href]');
            if (!sourceAnchor || !melodixHomeResourcePath(sourceAnchor.href)) return;
            const image = sourceAnchor.querySelector('img') || candidate.querySelector('img');
            const imageUrl = image?.currentSrc || image?.getAttribute('src') || image?.getAttribute('data-src') || '';
            const href = sourceAnchor.href;
            if (seen.has(href)) return;
            seen.add(href);

            const lines = String(candidate.innerText || candidate.textContent || sourceAnchor.innerText || sourceAnchor.textContent || '')
                .split('\n')
                .map((line) => line.replace(/\s+/g, ' ').trim())
                .filter(Boolean);
            const title = String(
                candidate.getAttribute('aria-label') ||
                sourceAnchor.getAttribute('aria-label') ||
                lines[0] ||
                image?.getAttribute('alt') || ''
            ).replace(/\s+/g, ' ').trim().slice(0, 100);
            if (!title) return;
            const subtitle = lines.find((line) => line !== title) || '';
            const section = candidate.closest('section') || mainView;
            const headingNode = section === mainView
                ? null
                : Array.from(section.querySelectorAll('h2, h3, [data-testid="shelf-title"]'))
                    .find((node) => !node.closest('[data-testid="card"]'));
            const heading = String(headingNode?.textContent || '')
                .replace(/\s+/g, ' ').trim().slice(0, 80);
            const group = grouped.get(section) || { title: heading, cards: [] };
            group.cards.push({
                title,
                subtitle: subtitle.slice(0, 120),
                image: imageUrl,
                href,
                sourceAnchor
            });
            grouped.set(section, group);
        });

        return Array.from(grouped.values())
            .map((group) => ({ ...group, cards: group.cards.slice(0, 8) }))
            .filter((group) => group.cards.length > 0)
            .slice(0, 4);
    }

    function deactivateMelodixHome(disconnectObserver = false) {
        document.body?.classList.remove('sf-melodix-home-active');
        document.getElementById('sf-melodix-home')?.remove();
        window._sfMelodixHomeSignature = '';
        if (disconnectObserver) {
            if (window._sfMelodixHomeDocumentObserver) {
                window._sfMelodixHomeDocumentObserver.disconnect();
                window._sfMelodixHomeDocumentObserver = null;
            }
            if (window._sfMelodixHomeObserver) {
                window._sfMelodixHomeObserver.disconnect();
                window._sfMelodixHomeObserver = null;
                window._sfMelodixHomeView = null;
            }
        }
    }

    function scheduleMelodixHomeUpdate() {
        if (window._sfMelodixHomeTimer != null) return;
        window._sfMelodixHomeTimer = window.setTimeout(() => {
            window._sfMelodixHomeTimer = null;
            updateMelodixHome();
        }, 80);
    }

    function observeMelodixHomeView(mainView) {
        if (window._sfMelodixHomeView === mainView && window._sfMelodixHomeObserver) return;
        if (window._sfMelodixHomeObserver) window._sfMelodixHomeObserver.disconnect();
        window._sfMelodixHomeView = mainView;
        window._sfMelodixHomeObserver = new MutationObserver(scheduleMelodixHomeUpdate);
        window._sfMelodixHomeObserver.observe(mainView, { childList: true, subtree: true });
    }

    function observeMelodixHomeDocument() {
        if (!document.body || window._sfMelodixHomeDocumentObserver) return;
        const attachToMainView = () => {
            const mainView = document.querySelector('#main-view');
            if (!mainView) return false;
            if (window._sfMelodixHomeDocumentObserver) {
                window._sfMelodixHomeDocumentObserver.disconnect();
                window._sfMelodixHomeDocumentObserver = null;
            }
            observeMelodixHomeView(mainView);
            scheduleMelodixHomeUpdate();
            return true;
        };

        if (attachToMainView()) return;
        window._sfMelodixHomeDocumentObserver = new MutationObserver(attachToMainView);
        window._sfMelodixHomeDocumentObserver.observe(document.body, { childList: true, subtree: true });
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
        if (!document.body) return;
        const mainView = document.querySelector('#main-view');
        const homePath = window.location.pathname.replace(/\/+$/, '') || '/';
        const isSpotifyHome = window.location.hostname === 'open.spotify.com' &&
            (homePath === '/' || homePath === '/home');
        const guiMode = window.SF_CONFIG?.guiMode;
        // The full stylesheet is injected in both supported visual modes. Do not
        // restrict the custom home to csshack: tablet/landscape devices may use
        // bigwindow while still expecting the same WebView home.
        const hasMelodixHomeStyles = guiMode === 'csshack' || guiMode === 'bigwindow';
        if (!isSpotifyHome || !hasMelodixHomeStyles) {
            deactivateMelodixHome(true);
            return;
        }
        if (document.body.classList.contains('sf-fs-open')) {
            deactivateMelodixHome(false);
            return;
        }

        if (!mainView) {
            deactivateMelodixHome(true);
            observeMelodixHomeDocument();
            return;
        }
        observeMelodixHomeView(mainView);

        const sections = collectMelodixHomeSections(mainView);
        const itemCount = sections.reduce((count, section) => count + section.cards.length, 0);
        if (itemCount < 2) {
            deactivateMelodixHome(false);
            return;
        }

        const labels = melodixHomeCopy();
        const signature = sections.map((section) => `${section.title}:${section.cards.map((card) => `${card.href}|${card.title}|${card.image}`).join(',')}`).join('||');
        let home = document.getElementById('sf-melodix-home');
        if (!home) {
            home = document.createElement('main');
            home.id = 'sf-melodix-home';
            home.className = 'sf-melodix-home';
            home.setAttribute('aria-label', 'Melodix');
            document.body.appendChild(home);
            window.__sfBridgeLoadStage = 'home-initialized';
        }

        const globalNav = document.querySelector('#global-nav-bar');
        const navVisible = !!(globalNav && getComputedStyle(globalNav).display !== 'none');
        const navBottom = navVisible ? Math.max(0, globalNav.getBoundingClientRect().bottom) : 0;
        home.style.setProperty('--sf-melodix-home-top', `${Math.ceil(navBottom)}px`);
        home.style.setProperty('--sf-melodix-home-extra-safe-top', navVisible ? '0px' : 'env(safe-area-inset-top)');

        if (window._sfMelodixHomeSignature === signature && document.body.classList.contains('sf-melodix-home-active')) {
            return;
        }

        const header = document.createElement('header');
        header.className = 'sf-melodix-home__header';
        const brand = document.createElement('p');
        brand.className = 'sf-melodix-home__brand';
        brand.textContent = 'MELODIX';
        const greeting = document.createElement('h1');
        greeting.textContent = labels.greeting;
        header.append(brand, greeting);
        home.replaceChildren(header);

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
            home.appendChild(sectionElement);
        });

        window._sfMelodixHomeSignature = signature;
        document.body.classList.add('sf-melodix-home-active');
    }

    function initializeMelodixHome() {
        if (window._sfMelodixHomeListenersAttached) return;
        window._sfMelodixHomeListenersAttached = true;
        window.addEventListener('popstate', scheduleMelodixHomeUpdate);
        window.addEventListener('resize', scheduleMelodixHomeUpdate);
        window.addEventListener('load', scheduleMelodixHomeUpdate, { once: true });
        document.addEventListener('click', (event) => {
            if (event.target?.closest?.('#global-nav-bar [data-testid="home-button"], #sf-mobile-nav [data-sf-mobile-action="home"], #sf-melodix-home .sf-melodix-home__card')) {
                scheduleMelodixHomeUpdate();
            }
        });
        document.addEventListener('DOMContentLoaded', () => {
            observeMelodixHomeDocument();
            scheduleMelodixHomeUpdate();
        }, { once: true });
        observeMelodixHomeDocument();
        scheduleMelodixHomeUpdate();
    }

    function initializeMobileShell() {
        window.__sfMelodixMobileShellInitAttempted = true;
        if (window._sfMobileShellListenersAttached) return;
        window._sfMobileShellListenersAttached = true;

        const maxRetries = 40;
        let retries = 0;
        let retryTimer = null;

        const attempt = () => {
            retryTimer = null;
            if (document.getElementById('sf-mobile-nav')) return;

            if (
                document.body &&
                (window.SF_CONFIG?.guiMode === 'csshack' || isMobileNavigationViewport())
            ) {
                try {
                    installMobileNavigation();
                    if (typeof window.addCSSJSHack === 'function') {
                        window.addCSSJSHack();
                    }
                } catch (_) {
                    try {
                        installMobileNavigation();
                    } catch (_) {}
                }
            }

            if (!document.getElementById('sf-mobile-nav') && retries < maxRetries) {
                retries += 1;
                retryTimer = window.setTimeout(attempt, 500);
            }
        };

        const ensure = () => {
            if (document.getElementById('sf-mobile-nav')) {
                if (retryTimer) window.clearTimeout(retryTimer);
                retryTimer = null;
                return;
            }
            if (retryTimer) return;
            if (retries >= maxRetries) retries = 0;
            attempt();
        };

        window.__sfEnsureMobileShell = ensure;
        if (document.readyState === 'loading') {
            const start = ensure;
        document.addEventListener('DOMContentLoaded', ensure, { once: true });
        document.addEventListener('DOMContentLoaded', start, { once: true });
        } else {
            window.setTimeout(ensure, 0);
        }
        window.addEventListener('load', ensure, { once: true });
    }

    initializeMobileShell();
    initializeMelodixHome();
    installPremiumPromotionCleanup();
    firstFuck();
    window.__sfMelodixBridgeCompleted = true;
})();
} catch (e) {
    window.__sfMelodixBridgeStarted = false;
    var diagnostic = String(e && e.message || e || '');
    diagnostic = diagnostic.replace(/Set-Cookie:\s*[^;\r\n]+/gi, 'Set-Cookie:[redacted]');
    diagnostic = diagnostic.replace(/Cookie:\s*[^\r\n]+/gi, 'Cookie:[redacted]');
    diagnostic = diagnostic.replace(/Authorization:\s+\S+(?:\s+\S+)?/gi, 'Authorization:[redacted]');
    diagnostic = diagnostic.replace(/Bearer\s+\S+/gi, 'Bearer [redacted]');
    diagnostic = diagnostic.replace(/\b(?:access_token|refresh_token|id_token|client_secret|code|sp_dc|sp_key|sessionid)=[^&\s;]+/gi, function(match) {
        return match.slice(0, match.indexOf('=') + 1) + '[redacted]';
    });
    diagnostic = diagnostic.replace(/spotify:user:[^\s,;]+/gi, 'spotify:user:[redacted]');
    diagnostic = diagnostic.replace(/[A-Za-z0-9_-]{8,}\.[A-Za-z0-9._-]{8,}\.[A-Za-z0-9._-]{8,}/g, '[redacted-jwt]');
    window.__sfBridgeLastError = ('iife-throw:' + diagnostic).slice(0, 160);
    if (window.__sfBridgeEntered !== true) {
        window.__sfBridgeLoadStage = 'iife-throw';
    }
}
