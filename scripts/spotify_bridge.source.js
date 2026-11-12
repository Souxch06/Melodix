(function() {
    if (window.__sfMelodixBridgeCompleted) {
        if (typeof window.__sfEnsureMobileShell === 'function') {
            try { window.__sfEnsureMobileShell(); } catch (_) {}
        }
        return;
    }

    // P0 diagnostic traces on logcat (MDXTRACE) through the native channel:
    // bridge start / bridge done / load errors, status words only.
    function __sfBridgeTrace(msg) {
        try {
            var b = window.AndBridge;
            if (b && typeof b.logDiagEvent === 'function') b.logDiagEvent(String(msg || '').slice(0, 160));
        } catch (_) {}
    }
    function __sfBridgeErrorClass(value) {
        var name = String(value || '');
        return /^(?:Error|TypeError|ReferenceError|SyntaxError|RangeError|URIError|EvalError|SecurityError|NetworkError|AbortError|InvalidStateError|NotSupportedError|QuotaExceededError)$/.test(name)
            ? name : 'unknown';
    }
    window.__sfBridgeTrace = __sfBridgeTrace;
    __sfBridgeTrace('bridge start');
    window.addEventListener('error', function(ev) {
        __sfBridgeTrace('bridge js-error ' + __sfBridgeErrorClass(ev && ev.error && ev.error.name));
    }, true);

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
    let lastBackgroundAudioSleep = null;
    window.playing = false;

    function syncBackgroundAudioWake(playing) {
        const bridge = window.AndBridge;
        const shouldKeepAwake = Boolean(playing && window.__sfBackgroundAudioEnabled !== false);
        if (!bridge || typeof bridge.manageTSleep !== 'function') return false;
        if (lastBackgroundAudioSleep === shouldKeepAwake) return true;
        try {
            bridge.manageTSleep(shouldKeepAwake);
            lastBackgroundAudioSleep = shouldKeepAwake;
            return true;
        } catch (_) {
            return false;
        }
    }
    window.__sfSyncBackgroundAudioWake = syncBackgroundAudioWake;

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
    // A bounded ring of playback state only. Track names, button labels, URLs,
    // account data and arbitrary page text are deliberately excluded. Existing
    // entries are sanitized on read so an older preview cannot keep exposing
    // the track-title fields written by earlier trace versions.
    const PLAYBACK_TRACE_KEY = 'melodix_playback_trace_v1';
    const PLAYBACK_TRACE_LIMIT = 80;
    const PLAYBACK_TRACE_EVENTS = [
        'dom-skip', 'dom-track-row-while-paused', 'pause-hold-reapply', 'pause-hold-kept',
        'pause-hold-start', 'auto-resume-ignored', 'play-from-uri', 'dom-playpause-click',
        'manage-all-play', 'manage-all-pause', 'act-play', 'act-pause', 'act-skip-back',
        'act-skip-forward', 'track-change'
    ];
    const PLAYBACK_TRACE_DETAILS = [
        'unexpected-resume', 'user-pause-active', 'mark', 'track', 'context',
        'was-playing', 'was-paused', 'pause', 'play', 'while-user-paused',
        'while-playing', 'control-button-skip-forward', 'control-button-skip-back'
    ];

    function safePlaybackTraceEntry(value) {
        const entry = value && typeof value === 'object' ? value : {};
        const rawEvent = String(entry.event || '');
        const rawDetail = String(entry.detail || '');
        const safe = {
            at: Number.isFinite(Number(entry.at)) ? Number(entry.at) : 0,
            event: PLAYBACK_TRACE_EVENTS.indexOf(rawEvent) >= 0 ? rawEvent : 'other',
            playing: Boolean(entry.playing),
            hidden: Boolean(entry.hidden)
        };
        if (PLAYBACK_TRACE_DETAILS.indexOf(rawDetail) >= 0) safe.detail = rawDetail;
        return safe;
    }

    function readPlaybackTrace() {
        try {
            const raw = window.localStorage && window.localStorage.getItem(PLAYBACK_TRACE_KEY);
            const parsed = raw ? JSON.parse(raw) : null;
            return Array.isArray(parsed) ? parsed.slice(-PLAYBACK_TRACE_LIMIT).map(safePlaybackTraceEntry) : [];
        } catch (_) {
            return [];
        }
    }

    function tracePlayback(event, detail) {
        let entry = null;
        try {
            entry = safePlaybackTraceEntry({
                at: Date.now(),
                event: event,
                playing: getPlaybackSnapshot().playing,
                hidden: Boolean(document && document.visibilityState === 'hidden'),
                detail: detail
            });
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

    // Rewrite legacy local storage immediately: old trace entries may contain
    // track titles or DOM row text from a prior version.
    try {
        const safeTrace = readPlaybackTrace();
        window.__sfPlaybackTrace = safeTrace;
        if (window.localStorage) window.localStorage.setItem(PLAYBACK_TRACE_KEY, JSON.stringify(safeTrace));
    } catch (_) {}

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
                if (row) tracePlayback('dom-track-row-while-paused');
            } catch (_) {}
        }, true);
    } catch (_) {}

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
                if (row) tracePlayback('dom-track-row-while-paused');
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

    // Mark bridge execution before optional player integrations. The shell and
    // CSS-backed Home renderer are loaded independently by the native bootstrap.
    window.__sfMelodixBridgeStarted = true;
    __sfBridgeTrace('bridge marker set');
    if (window.__sfBridgeExecMode === 'native-inject-pending' || window.__sfBridgeExecMode === 'native-inject-no-start') {
        window.__sfBridgeExecMode = 'native-inject-started';
    }
    window.__sfBridgeLastError = '';
    window.__sfMelodixBridgeBootstrapErrors = 0;
    window.__sfMelodixBridgeBootstrapReady = true;

    try {
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
                                console.log("[Melodix] Captured Native Spotify Platform API!", mod.Platform);
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
    // Account presence is detected from the page UI only: no credential,
    // token, or cookie is ever read by the bridge.
    function hasAccountIdentity() {
        return !!(document.querySelector('[data-testid="user-widget-link"]') ||
                  document.querySelector('a[href*="/user/"]') ||
                  document.querySelector('[aria-label*="Account" i]'));
    }
    window.hasAccountIdentity = hasAccountIdentity;

    function navigateTo(target) {
        if (!target) return;
        window.location.assign(target);
    }
    window.navigateTo = navigateTo;

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

    const oriFetch = window.fetch;
    // No fetch interception: the bridge never captures credentials and
    // never proxies Spotify requests - everything goes out as the page sends it.

    // =========================================================================
    // SECTION 3: WAKE LOCK & BACKGROUND CONTROL
    // =========================================================================

    // No API command is ever sent from the bridge: playback belongs to the
    // web player itself. Kept as a no-op so callers stay harmless.
    window.playFromUri = function(uri, contextUri) {
        if (!uri) return;
        tracePlayback('play-from-uri', /^spotify:track:/i.test(String(uri)) ? 'track' : 'context');
        markUserPlaybackIntent(true);
    };

    // Search-and-play sent credentialed API requests: disabled. The web
    // player's own search and playback are used instead.
    async function searchAndPlay(query) {
        if (!query) return;
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
            const observedPlayState = isPlayPauseLabelPlaying(pb || window.pBtn);
            if (observedPlayState !== null) {
                window.playing = observedPlayState;
                syncBackgroundAudioWake(observedPlayState);
            }
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
                    setTimeout(() => {
                        const state = isPlayPauseLabelPlaying(window.pBtn);
                        if (state !== null) {
                            window.playing = state;
                            syncBackgroundAudioWake(state);
                        }
                    }, 150);
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
        syncBackgroundAudioWake(play);
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
            syncBackgroundAudioWake(window.playing);

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

        const pathname = String(window.location.pathname || '/').replace(
            /^\/intl-[a-z]{2}(?:-[a-z]{2})?(?=\/|$)/i, ''
        ) || '/';
        const isLibraryRoute = pathname === '/collection' || pathname.startsWith('/collection/') ||
            pathname === '/your-library' || pathname.startsWith('/your-library/');
        const isSearchRoute = pathname === '/search' || pathname.startsWith('/search/');
        const active = document.body.classList.contains('sf-library-open') || isLibraryRoute
            ? 'library'
            : (isSearchRoute || document.body.classList.contains('sf-search-focused'))
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
    }

    function isEditableElement(element) {
        if (!element || typeof element.tagName !== 'string') return false;
        const tag = element.tagName.toLowerCase();
        if (tag === 'textarea' || tag === 'select') return true;
        if (tag === 'input') {
            const type = String(element.getAttribute && element.getAttribute('type') || 'text').toLowerCase();
            return !['button', 'checkbox', 'radio', 'submit', 'reset', 'range', 'color', 'file'].includes(type);
        }
        return element.isContentEditable === true;
    }

    // A phone keyboard never shrinks the WebView layout viewport, so the dock
    // would sit on top of the search field instead of under it. Marking the
    // body lets CSS lift the dock while the user types.
    function installMobileNavKeyboardGuard() {
        if (window._sfMobileNavKeyboardGuard) return;
        window._sfMobileNavKeyboardGuard = true;
        const sync = () => {
            if (!document.body) return;
            document.body.classList.toggle('sf-keyboard-open', isEditableElement(document.activeElement));
        };
        document.addEventListener('focusin', sync, true);
        document.addEventListener('focusout', () => window.setTimeout(sync, 0), true);
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
        left: 50% !important;
        right: auto !important;
        bottom: calc(var(--sf-dock-lift, 24px) + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
        transform: translateX(-50%) !important;
        box-sizing: border-box !important;
        display: grid !important;
        grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
        align-items: stretch !important;
        width: calc(100vw - (2 * var(--sf-dock-inset, 16px))) !important;
        max-width: 560px !important;
        height: var(--sf-dock-h, 68px) !important;
        padding: 4px !important;
        background: rgba(11, 11, 20, 0.62) !important;
        -webkit-backdrop-filter: blur(24px) saturate(150%) !important;
        backdrop-filter: blur(24px) saturate(150%) !important;
        border: 1px solid rgba(255, 255, 255, 0.14) !important;
        border-radius: 34px !important;
        z-index: 10010 !important;
    }
    #sf-mobile-nav .sf-mobile-nav__item {
        display: flex !important;
        flex-direction: column !important;
        align-items: center !important;
        justify-content: center !important;
        gap: 4px !important;
        min-width: 44px !important;
        min-height: 44px !important;
        height: 100% !important;
        margin: 0 2px !important;
        padding: 6px 4px !important;
        color: #a1a1b5 !important;
        background: transparent !important;
        border: 0 !important;
        border-radius: 34px !important;
        font: 600 11px/1.1 system-ui, sans-serif !important;
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
        color: #ffffff !important;
        background-image: linear-gradient(135deg, #7c3aed, #db2777) !important;
        box-shadow: 0 8px 20px -8px rgba(124, 58, 237, 0.75) !important;
    }
    body.sf-mobile-shell.sf-fs-open #sf-mobile-nav {
        display: grid !important;
        z-index: 100010 !important;
    }
    body.sf-mobile-shell.sf-fs-open #sf-fs-player {
        padding-bottom: calc(92px + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
    }
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
        bottom: calc(var(--sf-dock-lift, 24px) + var(--sf-dock-h, 68px) + var(--sf-mini-gap, 10px) + var(--sf-mini-h, 68px) + var(--sf-stack-gap, 4px) + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
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
        scroll-padding-bottom: calc(var(--sf-dock-lift, 24px) + var(--sf-dock-h, 68px) + var(--sf-mini-gap, 10px) + var(--sf-mini-h, 68px) + var(--sf-stack-gap, 4px) + 6px + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
        padding-bottom: calc(var(--sf-dock-lift, 24px) + var(--sf-dock-h, 68px) + var(--sf-mini-gap, 10px) + var(--sf-mini-h, 68px) + var(--sf-stack-gap, 4px) + 6px + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
    }
    body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] {
        position: fixed !important;
        left: 10px !important;
        right: 10px !important;
        bottom: calc(var(--sf-dock-lift, 24px) + var(--sf-dock-h, 68px) + var(--sf-mini-gap, 10px) + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
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
        bottom: calc(var(--sf-dock-lift, 24px) + var(--sf-dock-h, 68px) + var(--sf-mini-gap, 10px) + var(--sf-safe-area-bottom, env(safe-area-inset-bottom))) !important;
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
                // The app dock remains available even over the custom expanded
                // player. Close that overlay first so navigation changes the
                // underlying Spotify route rather than leaving the player over it.
                if (document.body.classList.contains('sf-fs-open') &&
                    typeof window.closeFullscreenPlayer === 'function') {
                    window.closeFullscreenPlayer();
                }
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
            // One listener feeds the dock from the real route. Spotify's client
            // router uses pushState/replaceState, which fire no event of their
            // own, so the shell also observes them instead of polling.
            if (!window._sfMobileNavRouteHooked) {
                window._sfMobileNavRouteHooked = true;
                window.addEventListener('popstate', syncMobileNavigation);
                window.addEventListener('sf-navigation', syncMobileNavigation);
                ['pushState', 'replaceState'].forEach((method) => {
                    const original = window.history && window.history[method];
                    if (typeof original !== 'function') return;
                    window.history[method] = function patchedHistoryMethod() {
                        const result = original.apply(this, arguments);
                        try { syncMobileNavigation(); } catch (_) {}
                        return result;
                    };
                });
            }
        }

        installMobileNavKeyboardGuard();

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
                        // Reserve the same header, mini-player and bottom dock
                        // stack at every touch viewport width. The drawer and
                        // player must never cross the always-bottom navigation.
                        const drawerTop = 48;
                        // Nothing below is a magic number: the dock height, the
                        // gap, the mini player and its gap are the same tokens
                        // the stylesheet uses (with the same literal fallbacks),
                        // so the drawer can never sit on the dock.
                        const stack = 'var(--sf-dock-lift, 24px) + var(--sf-dock-h, 68px) + var(--sf-mini-gap, 10px) + var(--sf-mini-h, 68px) + var(--sf-stack-gap, 4px)';
                        ls.style.setProperty('position', 'fixed', 'important');
                        ls.style.setProperty('width', '100%', 'important');
                        ls.style.setProperty('height', `calc(100vh - ${drawerTop}px - (${stack}) - var(--sf-safe-area-top, env(safe-area-inset-top)) - var(--sf-safe-area-bottom, env(safe-area-inset-bottom)))`, 'important');
                        ls.style.setProperty('top', `calc(${drawerTop}px + var(--sf-safe-area-top, env(safe-area-inset-top)))`, 'important');
                        ls.style.setProperty('bottom', `calc(${stack} + var(--sf-safe-area-bottom, env(safe-area-inset-bottom)))`, 'important');
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

    // The supported library path uses the WebView's own session only. There is
    // no Melodix OAuth token or refresh flow in this build; keep that limitation
    // explicit instead of pretending a no-op credential check succeeded.
    const MEDIA_LIBRARY_AUTH_MODE = 'webview-session';
    const MEDIA_LIBRARY_REFRESH_MODE = 'unsupported';
    const MEDIA_LIBRARY_CHECK_SOURCES = [
        'shell-update', 'native-retry', 'web-home-retry', 'unspecified'
    ];
    let mediaLibraryAttemptSequence = 0;

    function spotifyAuthUiState() {
        try {
            const getter = window.__sfGetSpotifyAuthUiState;
            const state = typeof getter === 'function' ? String(getter() || '') : '';
            return ['unknown', 'in-progress', 'connected', 'required'].includes(state) ? state : 'unknown';
        } catch (_) {
            return 'unknown';
        }
    }

    function mediaLibraryAuthReady() {
        // Unknown DOM evidence is not a logout: let the server verify it.
        // Private rows still require a valid libraryV3 response below.
        return spotifyAuthUiState() !== 'required';
    }

    function traceLibraryEvent(line) {
        try {
            if (typeof window.__sfBridgeTrace === 'function') window.__sfBridgeTrace(line);
            else if (window.AndBridge && typeof window.AndBridge.logDiagEvent === 'function') {
                window.AndBridge.logDiagEvent(line);
            }
        } catch (_) {}
    }

    function traceHomeLibraryStage(diagnostic, stage, result, duration, http, request) {
        try {
            const trace = window.__sfTraceHomePipeline;
            if (typeof trace === 'function') {
                trace(diagnostic && diagnostic.correlationId, stage, result, duration, http,
                    diagnostic && diagnostic.attempt, request);
            }
        } catch (_) {}
    }

    function pickOptimalArtwork(sources, fallbackImages) {
        const list = (Array.isArray(sources) && sources.length) ? sources : (Array.isArray(fallbackImages) ? fallbackImages : []);
        if (!list.length) return null;
        if (list.length === 1) return list[0]?.url || null;
        const medium = list.find(s => s && s.url && s.width >= 120 && s.width <= 320);
        if (medium) return medium.url;
        return list[1]?.url || list[0]?.url || null;
    }

    // MEL-BUG-036: the WebPlayer authorizes pathfinder with a Bearer web-player
    // token (GET open.spotify.com/api/token, cookie-authenticated), not with
    // cookies alone. A cookie-only libraryV3 can be answered 401 right after a
    // fresh login -> the Home falls back to the error card. The token is cached
    // with its expiry, NEVER logged (only a boolean reaches diagnostics), and
    // dropped on any 401/403 so the bounded retry refetches it.
    let webPlayerTokenCache = null; // { token, expMs }
    // MEL-BUG-057: status of the LAST /api/token fetch (ok | ko-httpXXX |
    // ko-network | none) — exported as a sanitized enum so a screenshot tells
    // whether the cookie session itself can mint a web-player token. The
    // token value is NEVER stored here.
    let lastTokenFetchStatus = 'none';
    // Presentation metadata only: no request, credential, or retry decisions.
    let tokenApiHttp = 0;
    let tokenFallbackHttp = 0;
    // MEL-BUG-065: boolean only — is a Spotify session cookie (sp_dc) present?
    // Tells "not logged in at all" apart from "cookie present but the token
    // endpoint refused". Only the cookie NAME is tested; the value never
    // leaves this function.
    function hasSpotifySessionCookie() {
        try { return /(?:^|;\s*)sp_dc=/.test(String(document.cookie || '')); }
        catch (_) { return false; }
    }
    function safeTokenFetchStatus(value) {
        const v = String(value || '');
        return /^(ok|none|ko-network|ko-non-json|ko-invalid|ko-expired|ko-http[1-5][0-9]{2})$/.test(v) ? v : 'unknown';
    }
    // Debug-only, closed enums; the native side validates the same grammar.
    // No page-provided URL, body text, cookie, token or error message is sent.
    function sessionDebugEnabled() {
        try { return window.AndBridge && window.AndBridge.isSessionDebugEnabled() === true; }
        catch (_) { return false; }
    }
    function sessionDebugGetter(name, value, failed) {
        try {
            if (!sessionDebugEnabled()) return;
            const origin = location.protocol === 'https:' && location.hostname === 'open.spotify.com' &&
                (!location.port || location.port === '443') ? 'https://open.spotify.com' : 'other';
            const path = location.pathname;
            const route = path === '/' ? 'root' : path === '/app' ? 'app' : path === '/search' ? 'search' : 'other';
            const load = /^(loading|interactive|complete)$/.test(document.readyState) ? document.readyState : 'unknown';
            let frame = 'unknown';
            try { frame = window.top === window ? 'top' : 'child'; } catch (_) {}
            const type = failed === 'absent' ? 'absent' : failed ? 'exception' : typeof value;
            const safe = /^(undefined|number|string|boolean|object|function|exception|absent)$/.test(type) ? type : 'undefined';
            window.AndBridge.onSessionDebug('getter=' + name + ' type=' + safe + ' null=' + (value === null ? 'yes' : 'no') + ' origin=' + origin +
                ' route=' + route + ' load=' + load + ' frame=' + frame);
        } catch (_) {}
    }
    // Extract only exact, safe error codes from a bounded prefix. Arbitrary
    // remote text is not redactable with a guaranteed absence of secrets/PII.
    async function traceDebugLibraryResponse(response, tokenOrigin) {
        try {
            if (!sessionDebugEnabled() || !response || ![400, 401, 403].includes(response.status)) return;
            let body = 'unknown';
            try {
                const clone = response.clone();
                if (!clone.body || !clone.body.getReader) body = 'unknown';
                else {
                    const reader = clone.body.getReader();
                    const first = await reader.read();
                    const bytes = first.value || new Uint8Array(0);
                    const text = new TextDecoder().decode(bytes.subarray(0, 1024));
                    if (!first.done) reader.cancel().catch(() => {});
                    body = text.length ? 'redacted' : 'empty';
                    if (first.done || bytes.length < 1024) {
                        try {
                            const parsed = JSON.parse(text);
                            const code = parsed && (typeof parsed.error === 'string' ? parsed.error :
                                parsed.error && parsed.error.reason);
                            if (['invalid_token', 'unauthorized', 'forbidden', 'bad_request'].includes(code)) body = code;
                        } catch (_) {}
                    }
                }
            } catch (_) { body = 'unknown'; }
            const source = /^(api|fallback|cache-api|cache-fallback)$/.test(tokenOrigin) ? tokenOrigin : 'unknown';
            window.AndBridge.onSessionDebug('http method=POST endpoint=https://api-partner.spotify.com/pathfinder/v2/query status=' + response.status +
                ' token=' + source + ' body=' + body);
        } catch (_) {}
    }
    function traceTokenEndpoint(endpoint, phase, http, duration) {
        traceLibraryEvent('token-http endpoint=' + endpoint + ' phase=' + phase +
            ' http=' + boundedMediaLibraryCount(http, 599) +
            ' duration=' + boundedMediaLibraryCount(duration, 999999));
    }
    // Closed metadata only; never inspect error bodies or log header values.
    function traceTokenResponse(endpoint, response, diagnostic) {
        traceLibraryEvent('token-response endpoint=' + endpoint +
            ' generation=' + boundedMediaLibraryCount(diagnostic && diagnostic.nativeGeneration, 2147483647) +
            ' attempt=' + boundedMediaLibraryCount(diagnostic && diagnostic.attempt, 999999) +
            ' http=' + boundedMediaLibraryCount(response && response.status, 599) +
            ' mime=' + mediaLibraryResponseMime(response));
        if (typeof traceDebugTokenError === 'function') void traceDebugTokenError(endpoint, response);
    }
    // Token refusal diagnostics, debug builds only. Closed categories are the
    // only data allowed through the native channel; remote strings never leave.
    async function readTokenErrorPrefix(response) {
        const reader = response.clone().body.getReader();
        const pieces = [];
        let size = 0, complete = false;
        try {
            for (let i = 0; i < 64 && size < 8192; i++) {
                const part = await reader.read();
                if (part.done) { complete = true; break; }
                if (!part.value || !part.value.length) continue;
                const bytes = part.value.subarray(0, 8192 - size);
                pieces.push(bytes); size += bytes.length;
                if (bytes.length < part.value.length) break;
            }
            const decoder = new TextDecoder();
            let text = '';
            for (const bytes of pieces) text += decoder.decode(bytes, { stream: true });
            text += decoder.decode();
            return { text, complete };
        } finally {
            try { void reader.cancel().catch(() => {}); } catch (_) {}
        }
    }
    function tokenErrorMessageCategory(value) {
        if (typeof value !== 'string' || !value) return 'absent';
        const v = value.slice(0, 1024).toLowerCase();
        if (/missing.{0,40}(param|field)|(?:param|field).{0,40}(missing|required)/.test(v)) return 'missing_parameter';
        if (/invalid.{0,40}(param|field)|(?:param|field).{0,40}invalid/.test(v)) return 'invalid_parameter';
        if (/unsupported|not supported/.test(v)) return 'unsupported';
        if (/rate.limit|too many requests/.test(v)) return 'rate_limit';
        if (/forbidden|access denied|blocked/.test(v)) return 'access_denied';
        if (/auth|credential|session/.test(v)) return 'auth';
        return 'other';
    }
    function tokenErrorJsonFields(prefix) {
        const result = { body: prefix.complete ? 'invalid_json' : 'truncated', code: 'absent', status: 'unknown', message: 'absent' };
        if (!prefix.complete) return result;
        try {
            const data = JSON.parse(prefix.text);
            if (!data || typeof data !== 'object' || Array.isArray(data)) return result;
            result.body = 'json';
            const err = data.error && typeof data.error === 'object' && !Array.isArray(data.error) ? data.error : null;
            const rawCode = err && err.code !== undefined ? err.code : data.code !== undefined ? data.code :
                typeof data.error === 'string' ? data.error : undefined;
            const codes = ['invalid_request', 'invalid_client', 'invalid_grant', 'invalid_token', 'unauthorized', 'forbidden', 'bad_request', 'access_denied', 'rate_limited'];
            if (rawCode !== undefined && rawCode !== null) {
                const numericCode = typeof rawCode === 'number' ? rawCode :
                    typeof rawCode === 'string' && /^[0-9]{1,3}$/.test(rawCode) ? Number(rawCode) : NaN;
                result.code = Number.isInteger(numericCode) && numericCode >= 0 && numericCode <= 999 ? String(numericCode) :
                    typeof rawCode === 'string' && codes.includes(rawCode) ? rawCode : 'other';
            }
            const rawStatus = err && err.status !== undefined ? err.status : data.status;
            const status = typeof rawStatus === 'number' ? rawStatus :
                typeof rawStatus === 'string' && /^[1-5][0-9]{2}$/.test(rawStatus) ? Number(rawStatus) : NaN;
            if (Number.isInteger(status) && status >= 100 && status <= 599) result.status = String(status);
            const msg = err && typeof err.message === 'string' ? err.message :
                typeof data.error_description === 'string' ? data.error_description : data.message;
            result.message = tokenErrorMessageCategory(msg);
        } catch (_) {}
        return result;
    }
    function tokenErrorHtmlFields(prefix) {
        const match = /<title\b[^>]*>([^<]{0,512})<\/title\s*>/i.exec(prefix.text);
        let title = 'absent';
        if (match) {
            const t = match[1].trim().replace(/\s+/g, ' ').toLowerCase();
            const known = { 'access denied': 'access_denied', '403 forbidden': '403_forbidden',
                'forbidden': 'forbidden', 'just a moment...': 'just_a_moment',
                'attention required! | cloudflare': 'attention_required_cloudflare' };
            title = Object.prototype.hasOwnProperty.call(known, t) ? known[t] : 'other';
        } else if (!prefix.complete) title = 'unknown';
        const text = prefix.text.toLowerCase();
        let marker = 'none';
        if (/captcha|turnstile/.test(text)) marker = 'captcha';
        else if (/cf-chl|challenge-platform|checking your browser|just a moment/.test(text)) marker = 'challenge';
        else if (/access denied|forbidden|blocked/.test(text)) marker = 'access_denied';
        else if (/too many requests|rate.limit/.test(text)) marker = 'rate_limit';
        return { body: prefix.complete ? 'html' : 'truncated', title, marker,
            cloudflare: /cloudflare|cf-chl|challenge-platform/.test(text) ? 'yes' : 'no' };
    }
    async function traceDebugTokenError(endpoint, response) {
        try {
            if (!sessionDebugEnabled() || !response ||
                !((endpoint === 'api' && response.status === 400) ||
                  (endpoint === 'fallback' && response.status === 403))) return;
            const isApi = endpoint === 'api';
            const emit = fields => {
                try {
                    if (isApi) window.AndBridge.onSessionDebug('token-error endpoint=api http=400 body=' + fields.body +
                        ' code=' + fields.code + ' status=' + fields.status + ' message=' + fields.message);
                    else window.AndBridge.onSessionDebug('token-error endpoint=fallback http=403 body=' + fields.body +
                        ' title=' + fields.title + ' marker=' + fields.marker + ' cloudflare=' + fields.cloudflare);
                } catch (_) {}
            };
            const unknown = isApi ? {body:'waiting',code:'absent',status:'unknown',message:'absent'} :
                {body:'waiting',title:'unknown',marker:'none',cloudflare:'no'};
            emit(unknown); // Explicit even if the cloned response never finishes.
            if (mediaLibraryResponseMime(response) !== (isApi ? 'json' : 'html')) {
                emit(Object.assign({}, unknown, {body:'wrong_mime'})); return;
            }
            try {
                const prefix = await readTokenErrorPrefix(response);
                emit(isApi ? tokenErrorJsonFields(prefix) : tokenErrorHtmlFields(prefix));
            } catch (_) { emit(Object.assign({}, unknown, {body:'unavailable'})); }
        } catch (_) {}
    }
    // Successful token responses are decoded separately; error text is never
    // exposed, only bounded categories from the debug-only clone above.
    async function decodeWebPlayerToken(response) {
        let data;
        try { data = await response.json(); }
        catch (error) {
            if (error && error.name === 'SyntaxError') return { token: null, expMs: 0, status: 'ko-non-json' };
            throw error; // Body transport/abort failures retain the network classification.
        }
        const token = data && data.accessToken;
        const rawExpiry = data && data.accessTokenExpirationTimestampMs;
        const expiryTypeValid = typeof rawExpiry === 'number' ||
            (typeof rawExpiry === 'string' && /^[0-9]+$/.test(rawExpiry));
        const expMs = expiryTypeValid ? Number(rawExpiry) : NaN;
        if (typeof token !== 'string' || !token.trim() || !Number.isFinite(expMs) || expMs <= 0) {
            return { token: null, expMs: 0, status: 'ko-invalid' };
        }
        if (expMs <= Date.now()) return { token: null, expMs: 0, status: 'ko-expired' };
        return { token: token, expMs: expMs, status: 'ok' };
    }
    async function fetchWebPlayerToken(observation) {
        const nowMs = Date.now();
        const tokenStarted = mediaLibraryNow();
        let endpointStarted = tokenStarted;
        let tokenEndpoint = 'api';
        if (webPlayerTokenCache && webPlayerTokenCache.token &&
            Number(webPlayerTokenCache.expMs) - 60000 > nowMs) {
            observeSessionAttempt(observation, 'tokenResult', 'obtained');
            observeSessionAttempt(observation, 'reason', 'token-source=cache');
            if (observation) observation.debugTokenOrigin = 'cache-' + (webPlayerTokenCache.source || 'unknown');
            lastTokenFetchStatus = 'ok';
            traceTokenEndpoint('cache', 'end', 0, 0);
            return webPlayerTokenCache.token;
        }
        tokenApiHttp = 0;
        tokenFallbackHttp = 0;
        try {
            observeSessionAttempt(observation, 'tokenResult', 'unknown');
            traceTokenEndpoint('api', 'start', 0, 0);
            const tokenRequest = oriFetch('https://open.spotify.com/api/token', {
                method: 'GET',
                credentials: 'include',
                headers: { 'Accept': 'application/json', 'app-platform': 'WebPlayer', 'spotify-app-version': '1.2.40.0' }
            });
            // Acknowledge only after invoking the transport, not when work is queued.
            if (observation && observation.source === 'native-retry') acknowledgeSessionAttemptStart(observation);
            const tokenResp = await tokenRequest;
            tokenApiHttp = boundedMediaLibraryCount(tokenResp && tokenResp.status, 599);
            observeSessionAttempt(observation, 'apiHttp', tokenApiHttp);
            traceTokenEndpoint('api', 'end', tokenResp && tokenResp.status, mediaLibraryNow() - endpointStarted);
            traceTokenResponse('api', tokenResp, observation);
            if (tokenResp && tokenResp.ok) {
                const parsed = await decodeWebPlayerToken(tokenResp);
                lastTokenFetchStatus = parsed.status;
                if (parsed.token) {
                    webPlayerTokenCache = { token: parsed.token, expMs: parsed.expMs, source: 'api' };
                    if (observation) observation.debugTokenOrigin = 'api';
                    return webPlayerTokenCache.token;
                }
            } else {
                const status = tokenResp && Number(tokenResp.status);
                lastTokenFetchStatus = safeTokenFetchStatus(
                    Number.isFinite(status) && status >= 100 && status <= 599 ? 'ko-http' + Math.floor(status) : 'ko-network');
            }
            // The existing fallback uses the same WebView session. No endpoint,
            // request headers or session state are changed by response parsing.
            tokenEndpoint = 'fallback';
            endpointStarted = mediaLibraryNow();
            traceTokenEndpoint('fallback', 'start', 0, 0);
            const altResp = await oriFetch('https://open.spotify.com/get_access_token?reason=transport&productType=web_player', {
                method: 'GET',
                credentials: 'include',
                headers: { 'Accept': 'application/json', 'app-platform': 'WebPlayer', 'spotify-app-version': '1.2.40.0' }
            });
            tokenFallbackHttp = boundedMediaLibraryCount(altResp && altResp.status, 599);
            observeSessionAttempt(observation, 'fallbackHttp', tokenFallbackHttp);
            traceTokenEndpoint('fallback', 'end', altResp && altResp.status, mediaLibraryNow() - endpointStarted);
            traceTokenResponse('fallback', altResp, observation);
            if (altResp && altResp.ok) {
                const parsed = await decodeWebPlayerToken(altResp);
                lastTokenFetchStatus = parsed.status;
                if (parsed.token) {
                    webPlayerTokenCache = { token: parsed.token, expMs: parsed.expMs, source: 'fallback' };
                    if (observation) observation.debugTokenOrigin = 'fallback';
                    return webPlayerTokenCache.token;
                }
            } else {
                const altStatus = altResp && Number(altResp.status);
                lastTokenFetchStatus = safeTokenFetchStatus(
                    Number.isFinite(altStatus) && altStatus >= 100 && altStatus <= 599 ? 'ko-http' + Math.floor(altStatus) : 'ko-network');
            }
        } catch (_) {
            lastTokenFetchStatus = 'ko-network';
            traceTokenEndpoint(tokenEndpoint, 'error', 0, mediaLibraryNow() - endpointStarted);
        } finally {
            traceLibraryEvent('token-result status=' + safeTokenFetchStatus(lastTokenFetchStatus) +
                ' duration=' + boundedMediaLibraryCount(mediaLibraryNow() - tokenStarted, 999999));
        }
        webPlayerTokenCache = null;
        return null;
    }
    function dropWebPlayerToken() { webPlayerTokenCache = null; }

    function getGqlHash(opName, fallbackHash) {
        if (window.spHashes && window.spHashes[opName]) return window.spHashes[opName];
        try {
            const stored = localStorage.getItem('sp_hash_' + opName);
            if (stored) return stored;
        } catch(_) {}
        return fallbackHash;
    }
    window.getGqlHash = getGqlHash;

    window.pendingMediaRequests = window.pendingMediaRequests || new Set();
    // A single-flight promise prevents a forced/manual retry from racing an
    // already-running libraryV3 request and overwriting newer session state.
    let mediaLibraryCheckPromise = null;
    let mediaLibraryRequestGeneration = 0;
    const activeMediaLibraryControllers = new Set();
    const MEDIA_LIBRARY_REQUEST_TIMEOUT_MS = 15000;

    // Diagnostic values are deliberately limited to enums and bounded counts.
    // Neither response bodies, URLs, resource names/IDs, cookies nor errors'
    // message text can reach the native log sink.
    function mediaLibraryNow() {
        try {
            const now = window.performance && typeof window.performance.now === 'function'
                ? Number(window.performance.now()) : Number(Date.now());
            return Number.isFinite(now) ? now : 0;
        } catch (_) {
            return 0;
        }
    }

    function boundedMediaLibraryCount(value, max) {
        const count = Number(value);
        return Number.isFinite(count) ? Math.max(0, Math.min(max, Math.floor(count))) : 0;
    }

    function safeMediaLibraryCheckSource(value) {
        let source = '';
        try {
            source = String(value || '');
        } catch (_) {}
        return MEDIA_LIBRARY_CHECK_SOURCES.indexOf(source) >= 0 ? source : 'unspecified';
    }

    function mediaLibraryResponseMime(response) {
        let raw = '';
        try {
            raw = response && response.headers && typeof response.headers.get === 'function'
                ? String(response.headers.get('content-type') || '') : '';
        } catch (_) {}
        const mime = raw.split(';', 1)[0].trim().toLowerCase();
        if (!mime) return 'missing';
        if (mime === 'application/json' || /^application\/[a-z0-9.+-]+\+json$/.test(mime)) return 'json';
        if (mime === 'text/html' || mime === 'application/xhtml+xml') return 'html';
        return 'other';
    }

    function mediaLibraryHttpStatus(response) {
        const status = Number(response && response.status);
        return Number.isFinite(status) && status >= 100 && status <= 599 ? Math.floor(status) : 0;
    }

    const MEDIA_LIBRARY_MAX_RETRY_AFTER_MS = 24 * 60 * 60 * 1000;
    function mediaLibraryRetryAfterDelayMs(response, now) {
        let value = '';
        try {
            value = String(response && response.headers && response.headers.get('retry-after') || '').trim();
        } catch (_) {}
        if (!value) return 0;

        const current = Number.isFinite(Number(now)) ? Number(now) : Date.now();
        if (/^\d+(?:\.\d+)?$/.test(value)) {
            const seconds = Number(value);
            if (!Number.isFinite(seconds) || seconds <= 0) return 0;
            return Math.max(1000, Math.min(MEDIA_LIBRARY_MAX_RETRY_AFTER_MS, Math.ceil(seconds * 1000)));
        }

        let retryAt = NaN;
        try { retryAt = Date.parse(value); } catch (_) {}
        if (!Number.isFinite(retryAt) || retryAt <= current) return 0;
        return Math.max(1000, Math.min(MEDIA_LIBRARY_MAX_RETRY_AFTER_MS, Math.ceil(retryAt - current)));
    }

    function scheduleMediaLibraryRetryAfter(response) {
        const now = Date.now();
        const requestedDelay = mediaLibraryRetryAfterDelayMs(response, now);
        let fallbackDelay = Number(window.__sfMediaLibRetryDelayMs);
        if (!Number.isFinite(fallbackDelay) || fallbackDelay < 5000) fallbackDelay = 5000;
        fallbackDelay = Math.max(5000, Math.min(60000, Math.floor(fallbackDelay)));
        const previousRetryAt = Number(window.__sfMediaLibRetryAt);
        const hasPendingBackoff = Number.isFinite(previousRetryAt) && previousRetryAt > now;
        const nextDelay = hasPendingBackoff
            ? requestedDelay
            : Math.max(fallbackDelay, requestedDelay);
        const safePreviousRetryAt = hasPendingBackoff ? previousRetryAt : 0;
        window.__sfMediaLibRetryAt = Math.max(safePreviousRetryAt,
            now + Math.min(MEDIA_LIBRARY_MAX_RETRY_AFTER_MS, nextDelay));
        // The shell already advances the delay when it schedules an automatic
        // retry. Advance it here only for direct/manual checks with no deadline.
        if (!hasPendingBackoff) window.__sfMediaLibRetryDelayMs = Math.min(60000, fallbackDelay * 2);
    }

    function createMediaLibraryDiagnostic(source, correlationId) {
        mediaLibraryAttemptSequence = boundedMediaLibraryCount(mediaLibraryAttemptSequence + 1, 999999);
        return {
            startedAt: mediaLibraryNow(),
            attempt: mediaLibraryAttemptSequence,
            correlationId: boundedMediaLibraryCount(correlationId, 999999),
            source: safeMediaLibraryCheckSource(source),
            requests: 0,
            phase: 'request',
            http: 0,
            mime: 'missing',
            error: 'none',
            bearer: false,
            // MEL-BUG-060: seed with the LAST KNOWN token-endpoint status, so a
            // request-phase emit never masks the real cause with 'none'.
            token: safeTokenFetchStatus(lastTokenFetchStatus),
            cookieSession: hasSpotifySessionCookie(),
            received: 0,
            transformed: 0
        };
    }

    function emitMediaLibraryDiagnostic(diagnostic, phase) {
        const state = diagnostic || {
            startedAt: mediaLibraryNow(), attempt: 0, source: 'unspecified', requests: 0,
            phase: 'request', http: 0, mime: 'missing', error: 'none'
        };
        const allowedPhases = ['request', 'response', 'parse', 'transform', 'settle'];
        const allowedMimes = ['json', 'html', 'other', 'missing'];
        const allowedErrors = [
            'none', 'empty', 'token-missing', 'http-401', 'http-403', 'http-other', 'timeout', 'network',
            'non-json', 'invalid-json', 'unexpected-shape', 'graphql', 'parse', 'transform'
        ];
        const requestedPhase = String(phase || state.phase || 'settle');
        const safePhase = allowedPhases.indexOf(requestedPhase) >= 0 ? requestedPhase : 'settle';
        const status = Number(state.http);
        const safeHttp = Number.isFinite(status) && status >= 100 && status <= 599
            ? Math.floor(status) : 0;
        const mime = allowedMimes.indexOf(String(state.mime || '')) >= 0 ? String(state.mime) : 'missing';
        const attempt = boundedMediaLibraryCount(state.attempt, 999999);
        const source = safeMediaLibraryCheckSource(state.source);
        const requests = boundedMediaLibraryCount(state.requests, 1000);
        let error = allowedErrors.indexOf(String(state.error || '')) >= 0 ? String(state.error) : 'parse';
        const claimedHttpStatus = error === 'http-401' ? 401 : error === 'http-403' ? 403 : 0;
        if (claimedHttpStatus && (safeHttp !== claimedHttpStatus || safePhase !== 'response')) {
            error = 'http-other';
        }
        const elapsed = Math.max(0, mediaLibraryNow() - Number(state.startedAt || 0));
        const duration = boundedMediaLibraryCount(elapsed, 999999);
        const line = 'library-fetch phase=' + safePhase + ' http=' + safeHttp +
            ' mime=' + mime + ' duration=' + duration + ' error=' + error +
            ' auth=' + MEDIA_LIBRARY_AUTH_MODE + ' refresh=' + MEDIA_LIBRARY_REFRESH_MODE +
            // MEL-BUG-044: boolean only, so adb logcat alone shows whether a
            // Bearer web-player token was attached to the refused request.
            ' bearer=' + (state.bearer === true ? 1 : 0);
        try {
            // Only fixed source/mode enums, bounded request counts, HTTP class,
            // MIME class and timing are exported. No credential values, payload,
            // URL, account or resource metadata are recorded.
            window.__sfMediaLibLastDiagnostic = {
                attempt: attempt, source: source, requests: requests,
                // Diagnostic correlation only: never influences requests or proof.
                nativeGeneration: boundedMediaLibraryCount(state.nativeGeneration, 2147483647),
                phase: safePhase, http: safeHttp, mime: mime, durationMs: duration,
                error: error, authMode: MEDIA_LIBRARY_AUTH_MODE,
                refreshMode: MEDIA_LIBRARY_REFRESH_MODE,
                // MEL-BUG-041: boolean only — was a Bearer web-player token
                // attached to the request that got refused? The token value
                // itself never leaves this scope.
                bearer: state.bearer === true,
                // MEL-BUG-057: sanitized token-endpoint status enum (ok /
                // ko-httpXXX / ko-network / none) — never a token value.
                token: safeTokenFetchStatus(state.token),
                tokenApiHttp: boundedMediaLibraryCount(state.tokenApiHttp, 599),
                tokenFallbackHttp: boundedMediaLibraryCount(state.tokenFallbackHttp, 599),
                // MEL-BUG-065: boolean only — sp_dc cookie name present?
                cookieSession: hasSpotifySessionCookie()
            };
        } catch (_) {}
        try {
            if (typeof window.__sfBridgeTrace === 'function') window.__sfBridgeTrace(line);
            else if (window.AndBridge && typeof window.AndBridge.logDiagEvent === 'function') {
                window.AndBridge.logDiagEvent(line);
            }
        } catch (_) {}
    }

    function mediaLibraryDiagnosticError(error) {
        const value = String(error || '');
        if (value === 'token-missing') return 'token-missing';
        if (value === 'http-401') return 'http-401';
        if (value === 'http-403') return 'http-403';
        if (/^http-[0-9]{3}$/.test(value)) return 'http-other';
        if (value === 'http-unknown') return 'network';
        if (value === 'timeout') return 'timeout';
        if (value === 'network-error') return 'network';
        if (value === 'non-json') return 'non-json';
        if (value === 'invalid-json') return 'invalid-json';
        if (value === 'unexpected-shape') return 'unexpected-shape';
        if (value === 'graphql-error') return 'graphql';
        if (value === 'transform-error') return 'transform';
        if (value === 'fetch-parse-error') return 'parse';
        return 'none';
    }

    function mediaLibraryTransformedCount(library) {
        if (!library || typeof library !== 'object') return 0;
        return boundedMediaLibraryCount(
            ['playlists', 'albums', 'artists', 'podcasts'].reduce((total, key) =>
                total + (Array.isArray(library[key]) ? library[key].length : 0), 0),
            1000
        );
    }

    function mediaLibraryUiState() {
        const status = String(window.__sfMediaLibStatus || 'pending');
        if (status === 'loading') return 'loading';
        if (status === 'ready') {
            return mediaLibraryTransformedCount(window.mediaLib) === 0 ? 'empty' : 'ready';
        }
        if (status === 'error') {
            const error = String(window.__sfMediaLibError || '');
            const retryAt = Number(window.__sfMediaLibRetryAt || 0);
            if (error !== 'http-401' && error !== 'http-403' && retryAt > Date.now()) {
                return 'retry-planned';
            }
            return 'unavailable';
        }
        return 'inactive';
    }

    function syncMediaLibraryUiState() {
        const state = mediaLibraryUiState();
        if (window.__sfMediaLibUiState !== state) {
            window.__sfMediaLibUiState = state;
            traceLibraryEvent('library.state state=' + state);
        }
        return state;
    }

    // P0 sync fix: the first home scrape can finish before mediaLib arrives.
    // Notify both the native shell and the Web Home renderer when collection
    // state changes; the Web renderer does not depend on unrelated DOM churn.
    // No token, account content, resource IDs, or error text is sent by this event.
    // Startup timing: page-side durations in ms, never account data. The native
    // side accepts only `perf <fixed-label>=<digits>` and timestamps receipt.
    function perfMarkBridge(label, value) {
        traceLibraryEvent('perf ' + label + '=' + Math.max(0, Math.min(999999, value | 0)));
    }

    function notifyMediaLibUiChange() {
        syncMediaLibraryUiState();
        try {
            window.dispatchEvent(new window.Event('sf-media-library-state-changed'));
        } catch (_) {}
    }
    function notifyMediaLibSettled(reason) {
        notifyMediaLibUiChange();
        try {
            if (typeof window.__sfNativeUiRefresh === 'function') window.__sfNativeUiRefresh();
        } catch (_) {}
    }
    window.__sfMediaLibStatus = window.__sfMediaLibStatus || 'pending';
    window.__sfMediaLibError = window.__sfMediaLibError || '';
    window.__sfMediaLibSessionProven = window.__sfMediaLibSessionProven === true;
    window.__sfMediaLibSessionProofKnown = window.__sfMediaLibSessionProofKnown === true ||
        window.__sfMediaLibSessionProven;
    window.__sfMediaLibRawItemCount = Number.isFinite(Number(window.__sfMediaLibRawItemCount))
        ? Math.max(0, Math.min(1000, Math.floor(Number(window.__sfMediaLibRawItemCount)))) : 0;
    window.__sfMediaLibUpdatedAt = Number.isFinite(Number(window.__sfMediaLibUpdatedAt))
        ? Math.max(0, Number(window.__sfMediaLibUpdatedAt)) : 0;
    window.__sfMediaLibProofAuthEpoch = Number.isFinite(Number(window.__sfMediaLibProofAuthEpoch))
        ? Math.max(0, Math.floor(Number(window.__sfMediaLibProofAuthEpoch))) : 0;

    // Read only a canonical value from the native bridge. A non-number from
    // the primitive getter is never trusted as a generation by itself.
    function readNativeSessionGeneration() {
        // An Android interface is visible to subframes too. Never authorize a
        // generation read from a frame or a non-player origin.
        try {
            if (typeof window.top !== 'undefined' && window.top !== window) return 0;
            if (window.location && window.location.origin !== 'https://open.spotify.com') return 0;
        } catch (_) { return 0; }
        const bridge = window.AndBridge;
        if (!bridge) return 0;
        let value;
        let failed = false;
        try {
            if (typeof bridge.getSessionGeneration === 'function') value = bridge.getSessionGeneration();
            else failed = 'absent';
        } catch (_) { failed = true; }
        if (typeof sessionDebugGetter === 'function') sessionDebugGetter('number', value, failed);
        if (typeof value === 'number' && Number.isInteger(value)) {
            return value > 0 && value <= 2147483647 ? value : 0;
        }
        try {
            if (typeof bridge.getSessionGenerationText !== 'function') {
                if (typeof sessionDebugGetter === 'function') sessionDebugGetter('text', undefined, 'absent');
                return 0;
            }
            const text = bridge.getSessionGenerationText();
            if (typeof sessionDebugGetter === 'function') sessionDebugGetter('text', text, false);
            if (typeof text !== 'string' || !/^[1-9][0-9]{0,9}$/.test(text)) return 0;
            const parsed = Number(text);
            return Number.isInteger(parsed) && parsed <= 2147483647 && String(parsed) === text ? parsed : 0;
        } catch (_) {
            if (typeof sessionDebugGetter === 'function') sessionDebugGetter('text', undefined, true);
            return 0;
        }
    }

    function checkMediaLib(force = false, source = 'unspecified', correlationId = 0, expectedGeneration = 0) {
        const safeCorrelationId = boundedMediaLibraryCount(
            correlationId || window.__sfNativeUiHomeCorrelationId, 999999);
        const traceContext = { correlationId: safeCorrelationId, attempt: 0 };
        window.__sfMediaLibCorrelationId = safeCorrelationId;
        // A definite signed-out UI blocks this attempt. Unknown/in-progress
        // may verify against Spotify; neither a cookie nor a DOM signal proves
        // private-library access. Only the validated response can do that.
        if (!mediaLibraryAuthReady()) {
            publishSessionRelanceDiagnostic(source, 'blocage=dom-auth-required');
            traceLibraryEvent('proof-guard decision=blocked reason=auth-required');
            traceHomeLibraryStage(traceContext, 'request', 'skipped-auth', 0, 0, 0);
            syncMediaLibraryUiState();
            return Promise.resolve(false);
        }
        if (mediaLibraryCheckPromise) {
            traceLibraryEvent('proof-guard decision=deferred reason=in-flight');
            traceHomeLibraryStage(traceContext, 'request', 'in-flight', 0, 0, 0);
            return mediaLibraryCheckPromise;
        }

        traceLibraryEvent('proof-guard decision=allowed reason=dom-' + spotifyAuthUiState());
        const diagnostic = createMediaLibraryDiagnostic(source, safeCorrelationId);
        traceHomeLibraryStage(diagnostic, 'request', 'started', 0, 0, 0);
        const observedGeneration = readNativeSessionGeneration();
        if (source === 'native-retry' && expectedGeneration > 0 && observedGeneration !== expectedGeneration) return Promise.resolve(false);
        diagnostic.nativeGeneration = expectedGeneration > 0 && source === 'native-retry' ? expectedGeneration : observedGeneration;
        diagnostic.sessionObservation = { apiHttp: null, fallbackHttp: null, libraryHttp: null, tokenResult: 'not-attempted' };
        const requestGeneration = mediaLibraryRequestGeneration;
        const authEpoch = boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999);
        window.__sfMediaLibLastAuthAttemptEpoch = authEpoch;
        const pending = Promise.resolve().then(() => runMediaLibraryCheck(diagnostic, requestGeneration, authEpoch));
        // Install the lock before notifying observers; a synchronous UI callback
        // or forced retry now joins this request rather than starting another.
        mediaLibraryCheckPromise = pending;
        publishSessionAttemptDiagnostic(diagnostic, false);
        if (force === true) {
            window.__sfMediaLibRetryAt = 0;
            if (window.__sfMediaLibError !== 'http-429') window.__sfMediaLibRetryDelayMs = 5000;
        }
        window.__sfMediaLibStatus = 'loading';
        window.__sfMediaLibError = '';
        window.__sfMediaLibRawItemCount = 0;
        emitMediaLibraryDiagnostic(diagnostic, 'request');
        notifyMediaLibUiChange();
        const clearRequest = () => {
            if (mediaLibraryCheckPromise === pending) mediaLibraryCheckPromise = null;
        };
        pending.then(clearRequest, clearRequest);
        return pending;
    }

    async function runMediaLibraryCheck(diagnostic, requestGeneration, authEpoch) {
        // Cookies/session are supplied only by this WebView's credentialed
        // request. No OAuth token is read and no refresh is available here.
        let allItems = [];
        try {
            allItems = await fetchAllLibrary(diagnostic, requestGeneration, authEpoch);
            if (requestGeneration !== mediaLibraryRequestGeneration ||
                authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) return;
            diagnostic.received = Array.isArray(allItems) ? allItems.length : 0;
            window.__sfMediaLibRawItemCount = boundedMediaLibraryCount(diagnostic.received, 1000);
            let failed = Boolean(window.__sfMediaLibError);
            const failurePhase = diagnostic.error !== 'none' ? diagnostic.phase : '';
            const usable = Array.isArray(allItems) && allItems.length > 0;
            if (window.__sfMediaLibError === 'http-401' || window.__sfMediaLibError === 'http-403') {
                // An authorization refusal invalidates the library proof, not
                // necessarily the Spotify player login. Never retain or render
                // old or partial private rows after either refusal.
                window.mediaLib = null;
                window.__sfMediaLibRawItemCount = 0;
                window.__sfMediaLibUpdatedAt = 0;
                window.__sfMediaLibProofAuthEpoch = 0;
                diagnostic.received = 0;
                window.__sfMediaLibStatus = 'error';
            } else if (!failed || usable) {
                // Keep only actual supported Spotify resources. A non-empty raw
                // response that transforms to zero rows is an error, not an
                // honestly empty library. Preserve the phase where a partial
                // request failed so diagnostics identify the actual boundary.
                if (!failurePhase) diagnostic.phase = 'transform';
                const transformStartedAt = mediaLibraryNow();
                try {
                    const parsed = parseLibrary(allItems);
                    diagnostic.transformed = mediaLibraryTransformedCount(parsed);
                    traceHomeLibraryStage(diagnostic, 'transform',
                        diagnostic.transformed > 0 ? 'populated' : usable ? 'error' : 'empty',
                        boundedMediaLibraryCount(mediaLibraryNow() - transformStartedAt, 999999),
                        diagnostic.http, diagnostic.requests);
                    const parseResult = failed ? 'partial' : !usable ? 'empty' :
                        diagnostic.transformed > 0 ? 'valid' : 'malformed';
                    traceLibraryEvent('library.parse.completed attempt=' +
                        boundedMediaLibraryCount(diagnostic.attempt, 999999) +
                        ' request=' + boundedMediaLibraryCount(diagnostic.requests, 1000) +
                        ' result=' + parseResult);
                    if (usable && diagnostic.transformed === 0) {
                        if (!failed) {
                            window.__sfMediaLibError = 'transform-error';
                            diagnostic.error = 'transform';
                        }
                        window.__sfMediaLibStatus = 'error';
                    } else {
                        window.mediaLib = parsed;
                        window.__sfMediaLibStatus = failed ? 'error' : 'ready';
                        if (!failed) window.__sfMediaLibUpdatedAt = Date.now();
                    }
                } catch (_) {
                    traceHomeLibraryStage(diagnostic, 'transform', 'error',
                        boundedMediaLibraryCount(mediaLibraryNow() - transformStartedAt, 999999),
                        diagnostic.http, diagnostic.requests);
                    window.__sfMediaLibStatus = 'error';
                    window.__sfMediaLibError = 'transform-error';
                    diagnostic.error = 'transform';
                }
            } else {
                // Nothing usable arrived. Preserve previous data for possible
                // retry, but never replace a failure with an empty object.
                window.__sfMediaLibStatus = 'error';
            }
            if (diagnostic.error === 'none' && window.__sfMediaLibError) {
                diagnostic.error = mediaLibraryDiagnosticError(window.__sfMediaLibError);
            }
            if (diagnostic.error === 'none' && window.__sfMediaLibStatus === 'ready' && !usable) {
                diagnostic.error = 'empty';
            }
            diagnostic.phase = diagnostic.error === 'none' || diagnostic.error === 'empty'
                ? 'settle' : diagnostic.phase;
            if (window.pendingMediaRequests && window.pendingMediaRequests.size > 0) {
                const verifiedLibrary = window.__sfMediaLibSessionProofKnown === true &&
                    window.__sfMediaLibSessionProven === true && window.mediaLib;
                for (const reqId of window.pendingMediaRequests) {
                    const items = verifiedLibrary ? (verifiedLibrary[reqId] || []) : [];
                    AndBridge.onMediaItemsLoaded(reqId, JSON.stringify(items));
                }
                window.pendingMediaRequests.clear();
            }
            notifyMediaLibSettled(window.__sfMediaLibStatus);
        } catch (_) {
            if (requestGeneration !== mediaLibraryRequestGeneration ||
                authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) return;
            window.__sfMediaLibStatus = 'error';
            window.__sfMediaLibError = 'transform-error';
            diagnostic.phase = 'transform';
            diagnostic.error = 'transform';
            notifyMediaLibSettled('transform-error');
        } finally {
            if (requestGeneration !== mediaLibraryRequestGeneration) {
                observeSessionAttempt(diagnostic, 'reason', 'abandon=requete-perimee');
            }
            if (authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) {
                observeSessionAttempt(diagnostic, 'reason', 'abandon=contexte-auth-perime');
            }
            publishSessionAttemptDiagnostic(diagnostic, true);
            if (requestGeneration !== mediaLibraryRequestGeneration ||
                authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) {
                diagnostic.phase = 'settle';
                diagnostic.error = 'none';
                return;
            }
            if (diagnostic.error === 'none' && window.__sfMediaLibError) {
                diagnostic.error = mediaLibraryDiagnosticError(window.__sfMediaLibError);
            }
            if (diagnostic.error === 'none' && window.__sfMediaLibStatus === 'ready' && diagnostic.received === 0) {
                diagnostic.error = 'empty';
            }
            if (diagnostic.phase === 'transform' &&
                (diagnostic.error === 'none' || diagnostic.error === 'empty')) diagnostic.phase = 'settle';
            if (window.__sfMediaLibStatus === 'ready') {
                traceLibraryEvent('library.data.ready result=' +
                    (mediaLibraryTransformedCount(window.mediaLib) === 0 ? 'empty' : 'populated'));
            } else if (diagnostic.error !== 'none' && diagnostic.error !== 'empty') {
                const rawError = String(window.__sfMediaLibError || '');
                const errorCategory = rawError === 'http-401' ? 'http-401' :
                    rawError === 'http-403' ? 'http-403' :
                        rawError === 'http-429' ? 'rate-limit' :
                            rawError === 'timeout' ? 'timeout' :
                                rawError === 'network-error' || rawError === 'http-unknown' ? 'network' :
                                    rawError === 'non-json' ? 'non-json' :
                                        rawError === 'invalid-json' ? 'invalid-json' :
                                            rawError === 'unexpected-shape' ? 'unexpected-shape' :
                                                rawError === 'graphql-error' ? 'graphql' :
                                                    rawError === 'transform-error' ? 'transform' :
                                                        /^http-[0-9]{3}$/.test(rawError) ? 'http-other' : 'other';
                traceLibraryEvent('library.error category=' + errorCategory +
                    ' http=' + boundedMediaLibraryCount(diagnostic.http, 599));
            }
            syncMediaLibraryUiState();
            emitMediaLibraryDiagnostic(diagnostic, diagnostic.phase || 'settle');
            // A completed, correlated observation only. No request/header/token value changes.
            publishSessionVerification(diagnostic);

            if (window.__sfMediaLibStatus === 'ready') {
                window.__sfMediaLibRetryAt = 0;
                window.__sfMediaLibRetryDelayMs = 5000;
            }
        }
    }
    // Phase 1 diagnostics only. Never read credentials or feed this channel to the gate.
    function reportSessionDiagnosticFailure(diagnostic, reason) {
        if (!/^canal=(exception-js|indisponible|demarrage-indisponible)$/.test(reason)) return;
        try {
            const bridge = window.AndBridge;
            if (bridge && typeof bridge.onSessionDiagnosticFailure === 'function') {
                bridge.onSessionDiagnosticFailure(
                    boundedMediaLibraryCount(diagnostic && diagnostic.nativeGeneration, 2147483647),
                    boundedMediaLibraryCount(diagnostic && diagnostic.attempt, 999999), reason);
            }
        } catch (_) {} // The fallback channel itself is best effort; never recurse.
    }
    function acknowledgeSessionAttemptStart(diagnostic) {
        try {
            const bridge = window.AndBridge;
            if (bridge && typeof bridge.onSessionAttemptStarted === 'function') {
                bridge.onSessionAttemptStarted(
                    boundedMediaLibraryCount(diagnostic.nativeGeneration, 2147483647),
                    boundedMediaLibraryCount(diagnostic.attempt, 999999));
            } else {
                reportSessionDiagnosticFailure(diagnostic, 'canal=demarrage-indisponible');
            }
        } catch (_) { reportSessionDiagnosticFailure(diagnostic, 'canal=exception-js'); }
    }
    function publishSessionAttemptDiagnostic(diagnostic, completed) {
        const observation = diagnostic && diagnostic.sessionObservation;
        if (!observation) return;
        const http = value => Number.isInteger(value) && value >= 100 && value <= 599 ? value : null;
        const token = ['obtained', 'refused', 'not-attempted'].indexOf(observation.tokenResult) >= 0
            ? observation.tokenResult : 'unknown';
        const result = {
            generation: boundedMediaLibraryCount(diagnostic.nativeGeneration, 2147483647),
            attempt: boundedMediaLibraryCount(diagnostic.attempt, 999999),
            source: safeMediaLibraryCheckSource(diagnostic.source),
            apiHttp: http(observation.apiHttp), fallbackHttp: http(observation.fallbackHttp),
            libraryHttp: http(observation.libraryHttp), completed: completed === true, tokenResult: token,
            reason: /^(abandon=(requete-perimee|contexte-auth-perime)|token-source=cache)$/.test(observation.reason || '')
                ? observation.reason : ''
        };
        // A diagnostic-only, sanitized snapshot for native polling when the
        // JavascriptInterface observation channel fails. Never feeds proof.
        // Keep the observed generation; do not infer it from the retry tap.
        try {
            if (result.source === 'native-retry') window.__sfSessionRetrySnapshot = result;
        } catch (_) {}
        try {
            if (window.AndBridge && typeof window.AndBridge.onSessionAttemptDiagnostic === 'function') {
                window.AndBridge.onSessionAttemptDiagnostic(JSON.stringify(result));
            } else {
                reportSessionDiagnosticFailure(diagnostic, 'canal=indisponible');
            }
        } catch (_) { reportSessionDiagnosticFailure(diagnostic, 'canal=exception-js'); }
    }
    // A blocked request has no network attempt ID. Do not fabricate a completed attempt.
    function publishSessionRelanceDiagnostic(source, reason) {
        if (source !== 'native-retry') return;
        if (!/^(blocage=(dom-auth-required|attente-429))$/.test(reason)) return;
        const diagnostic = { nativeGeneration: 0, attempt: 0 };
        try {
            diagnostic.nativeGeneration = readNativeSessionGeneration();
            if (window.AndBridge && typeof window.AndBridge.onSessionAttemptDiagnostic === 'function') {
                window.AndBridge.onSessionAttemptDiagnostic(JSON.stringify({ generation: diagnostic.nativeGeneration,
                    attempt: 0, source: 'native-retry', reason: reason }));
            } else {
                reportSessionDiagnosticFailure(diagnostic, 'canal=indisponible');
            }
        } catch (_) { reportSessionDiagnosticFailure(diagnostic, 'canal=exception-js'); }
    }
    function observeSessionAttempt(diagnostic, field, value) {
        if (!diagnostic || !diagnostic.sessionObservation) return;
        diagnostic.sessionObservation[field] = value;
        publishSessionAttemptDiagnostic(diagnostic, false);
    }
    function publishSessionVerification(diagnostic) {
        const refusal = code => code === 400 || code === 401 || code === 403;
        const result = {
            generation: boundedMediaLibraryCount(diagnostic.nativeGeneration, 2147483647),
            attempt: boundedMediaLibraryCount(diagnostic.attempt, 999999),
            completed: true,
            token: diagnostic.bearer === true,
            tokenApiHttp: boundedMediaLibraryCount(diagnostic.tokenApiHttp, 599),
            tokenFallbackHttp: boundedMediaLibraryCount(diagnostic.tokenFallbackHttp, 599),
            tokenRefused: diagnostic.bearer !== true && refusal(diagnostic.tokenApiHttp) &&
                refusal(diagnostic.tokenFallbackHttp),
            libraryHttp: boundedMediaLibraryCount(diagnostic.http, 599),
            libraryOk: window.__sfMediaLibStatus === 'ready' && window.__sfMediaLibSessionProven === true &&
                !window.__sfMediaLibError && diagnostic.http >= 200 && diagnostic.http < 300
        };
        try {
            if (window.AndBridge && typeof window.AndBridge.onSessionVerification === 'function') {
                window.AndBridge.onSessionVerification(JSON.stringify(result));
            }
        } catch (_) {}
    }
    // Each native generation admits at most one manual retry, including while
    // waiting behind an older library flight. Never infer a missing generation.
    let nativeRetryGeneration = 0;
    let nativeRetryPromise = null;
    window.__sfRequestSessionVerification = function (expectedGeneration = 0) {
        if (!Number.isInteger(expectedGeneration) || expectedGeneration <= 0 || expectedGeneration > 2147483647) return false;
        const expected = expectedGeneration;
        try {
            if (readNativeSessionGeneration() !== expected || !window.AndBridge ||
                typeof window.AndBridge.isSessionRetryActive !== 'function' ||
                window.AndBridge.isSessionRetryActive(expected) !== true) return false;
        } catch (_) { return false; }
        if (nativeRetryGeneration === expected) return nativeRetryPromise || false;
        const request = () => {
            if (expected) {
                try {
                    if (readNativeSessionGeneration() !== expected || !window.AndBridge ||
                        typeof window.AndBridge.isSessionRetryActive !== 'function' ||
                        window.AndBridge.isSessionRetryActive(expected) !== true) return false;
                } catch (_) { return false; }
            }
            if (window.__sfMediaLibError === 'http-429' && Number(window.__sfMediaLibRetryAt) > Date.now()) {
                publishSessionRelanceDiagnostic('native-retry', 'blocage=attente-429');
                return false;
            }
            // A manual verification must observe a new token response rather than
            // reuse a prior successful bearer. Requests, headers and auth guards stay unchanged.
            if (!mediaLibraryAuthReady()) {
                publishSessionRelanceDiagnostic('native-retry', 'blocage=dom-auth-required');
                return false;
            }
            dropWebPlayerToken();
            return checkMediaLib(true, 'native-retry', 0, expected);
        };
        if (mediaLibraryCheckPromise) {
            // The previous flight may finish after this retry timed out, after a
            // newer retry, or after login navigation. Never start an old queued
            // request without a fresh native generation/flight check.
            let queuedGeneration;
            try {
                const bridge = window.AndBridge;
                if (!bridge || typeof bridge.isSessionRetryActive !== 'function') return false;
                queuedGeneration = readNativeSessionGeneration();
                if (queuedGeneration <= 0 || (expected && queuedGeneration !== expected)) return false;
            } catch (_) { return false; }
            const requestIfCurrent = () => {
                try {
                    const bridge = window.AndBridge;
                    if (!bridge || typeof bridge.isSessionRetryActive !== 'function' ||
                        readNativeSessionGeneration() !== queuedGeneration ||
                        bridge.isSessionRetryActive(queuedGeneration) !== true) return false;
                } catch (_) { return false; }
                return request();
            };
            nativeRetryGeneration = expected;
            nativeRetryPromise = mediaLibraryCheckPromise.then(requestIfCurrent, requestIfCurrent);
            return nativeRetryPromise;
        }
        // Reserve before request(): synchronous observers must not re-enter and
        // start a second request for the same native generation.
        nativeRetryGeneration = expected;
        nativeRetryPromise = null;
        const result = request();
        nativeRetryPromise = result || null;
        return result;
    };
    window.checkMediaLib = checkMediaLib;

    // Do not read, store, or forward credentials. Each page request uses only
    // the browser's included cookies and has a bounded deadline for both the
    // response and its JSON body.
    async function fetchAllLibrary(diagnostic, requestGeneration = mediaLibraryRequestGeneration,
        authEpoch = boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) {
        const trace = diagnostic || createMediaLibraryDiagnostic();
        const limit = 50;
        let offset = 0;
        let allItems = [];
        let hasMore = true;
        // MEL-BUG-036: attach the Bearer web-player token when available. The
        // token value itself must never reach diagnostics; only this flag does.
        const tokenWaitStartedAt = mediaLibraryNow();
        perfMarkBridge('token-request', 0);
        const bearerToken = await fetchWebPlayerToken(trace);
        perfMarkBridge('token-ready', Math.max(0, mediaLibraryNow() - tokenWaitStartedAt));
        trace.bearer = Boolean(bearerToken);
        // MEL-BUG-057: remember WHY there is no bearer (token endpoint refused
        // by the cookie session vs network failure) — status enum only.
        trace.token = safeTokenFetchStatus(lastTokenFetchStatus);
        trace.tokenApiHttp = tokenApiHttp;
        trace.tokenFallbackHttp = tokenFallbackHttp;
        // Only this attempt's observations, never the seeded/stale global HTTP fields.
        const observed = trace.sessionObservation;
        const refused = code => code === 400 || code === 401 || code === 403;
        observeSessionAttempt(trace, 'tokenResult', bearerToken ? 'obtained' :
            observed && refused(observed.apiHttp) && refused(observed.fallbackHttp) ? 'refused' : 'unknown');

        // Match the historical WebView flow: if minting a bearer failed,
        // try the same library request with WebView credentials alone.  A
        // server response must still prove the library; a cookie is not proof.
        if (requestGeneration !== mediaLibraryRequestGeneration ||
            authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) return [];

        while (hasMore && offset < 1000 && requestGeneration === mediaLibraryRequestGeneration &&
            authEpoch === boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) {
            // A token can expire while an earlier page is being read. Do not
            // send it on a later page or retain partial private proof.
            if (bearerToken && (!webPlayerTokenCache || webPlayerTokenCache.token !== bearerToken ||
                !Number.isFinite(webPlayerTokenCache.expMs) || webPlayerTokenCache.expMs <= Date.now())) {
                trace.phase = 'request';
                trace.http = 0;
                trace.mime = 'missing';
                trace.error = 'token-missing';
                trace.bearer = false;
                observeSessionAttempt(trace, 'tokenResult', 'unknown');
                window.__sfMediaLibError = 'token-missing';
                window.__sfMediaLibSessionProofKnown = false;
                window.__sfMediaLibSessionProven = false;
                window.__sfMediaLibRawItemCount = 0;
                window.__sfMediaLibUpdatedAt = 0;
                window.__sfMediaLibProofAuthEpoch = 0;
                window.mediaLib = null;
                return [];
            }
            const activeHash = getGqlHash('libraryV3', '0082bf82412db50128add72dbdb73e2961d59100b9cbf41fb25c568bd8bc358b');
            const endpoint = 'https://api-partner.spotify.com/' + 'pathfinder' + '/v2/' + 'query';
            const controller = typeof window.AbortController === 'function' ? new window.AbortController() : null;
            if (controller) activeMediaLibraryControllers.add(controller);
            let timerId = null;
            let timedOut = false;
            let requestStartedAt = 0;
            let parseStartedAt = 0;
            let rejectTimeout;
            const timeout = new Promise((resolve, reject) => { rejectTimeout = reject; });
            timerId = window.setTimeout(() => {
                timedOut = true;
                const timeoutError = new Error('library-request-timeout');
                timeoutError.name = 'TimeoutError';
                rejectTimeout(timeoutError);
                try { if (controller) controller.abort(); } catch (_) {}
            }, MEDIA_LIBRARY_REQUEST_TIMEOUT_MS);

            try {
                const init = {
                    method: 'POST',
                    mode: 'cors',
                    credentials: 'include',
                    headers: Object.assign({
                        'Content-Type': 'application/json;charset=UTF-8',
                        'app-platform': 'WebPlayer',
                        'spotify-app-version': '1.2.40.0'
                    }, bearerToken ? { 'Authorization': 'Bearer ' + bearerToken } : {}),
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
                                sha256Hash: activeHash
                            }
                        }
                    })
                };
                if (controller) init.signal = controller.signal;

                let resp;
                try {
                    trace.requests = boundedMediaLibraryCount(Number(trace.requests || 0) + 1, 1000);
                    requestStartedAt = mediaLibraryNow();
                    traceLibraryEvent('library.request.started attempt=' +
                        boundedMediaLibraryCount(trace.attempt, 999999) +
                        ' request=' + trace.requests +
                        ' source=' + safeMediaLibraryCheckSource(trace.source));
                    resp = await Promise.race([oriFetch(endpoint, init), timeout]);
                    if (requestGeneration !== mediaLibraryRequestGeneration ||
                        authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) break;
                } catch (_) {
                    if (requestGeneration !== mediaLibraryRequestGeneration ||
                        authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) break;
                    trace.phase = 'request';
                    trace.error = timedOut ? 'timeout' : 'network';
                    window.__sfMediaLibError = timedOut ? 'timeout' : 'network-error';
                    traceHomeLibraryStage(trace, 'response', timedOut ? 'timeout' : 'error',
                        boundedMediaLibraryCount(mediaLibraryNow() - requestStartedAt, 999999),
                        0, trace.requests);
                    break;
                }

                if (requestGeneration !== mediaLibraryRequestGeneration ||
                    authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) break;
                trace.http = mediaLibraryHttpStatus(resp);
                if (typeof traceDebugLibraryResponse === 'function') void traceDebugLibraryResponse(resp, trace.debugTokenOrigin);
                observeSessionAttempt(trace, 'libraryHttp', trace.http);
                trace.mime = mediaLibraryResponseMime(resp);
                trace.phase = 'response';
                const responseDuration = boundedMediaLibraryCount(mediaLibraryNow() - requestStartedAt, 999999);
                traceLibraryEvent('library.request.response attempt=' +
                    boundedMediaLibraryCount(trace.attempt, 999999) +
                    ' request=' + boundedMediaLibraryCount(trace.requests, 1000) +
                    ' http=' + trace.http + ' mime=' + trace.mime +
                    ' duration=' + responseDuration);
                traceHomeLibraryStage(trace, 'response',
                    trace.http >= 200 && trace.http < 300 ? 'valid' : 'error',
                    responseDuration, trace.http, trace.requests);
                if (Number(trace.requests) === 1) {
                    perfMarkBridge('library-response', responseDuration);
                }
                if (trace.http === 401 || trace.http === 403) {
                    // A 401/403 invalidates this library proof and all previously
                    // accepted private rows. A 403 may mean insufficient scope,
                    // app access, or another policy refusal; it is not proof of logout.
                    const refusal = trace.http === 401 ? 'http-401' : 'http-403';
                    // MEL-BUG-036: a refusal may be an expired web-player token;
                    // drop it so the bounded retry refetches a fresh one.
                    dropWebPlayerToken();
                    window.__sfMediaLibSessionProofKnown = true;
                    window.__sfMediaLibSessionProven = false;
                    window.__sfMediaLibError = refusal;
                    window.mediaLib = null;
                    window.__sfMediaLibRawItemCount = 0;
                    window.__sfMediaLibUpdatedAt = 0;
                    window.__sfMediaLibProofAuthEpoch = 0;
                    allItems = [];
                    trace.received = 0;
                    trace.error = refusal;
                    break;
                }

                const responseOk = resp && typeof resp.ok === 'boolean'
                    ? resp.ok : trace.http >= 200 && trace.http < 300;
                if (!responseOk) {
                    if (trace.http === 429) scheduleMediaLibraryRetryAfter(resp);
                    if (trace.http === 400) {
                        // MEL-BUG-032: a 400 from pathfinder is typically a rotated
                        // persisted-query hash (PersistedQueryNotFound). Drop the
                        // cached hash so the next attempt re-resolves it, and record
                        // a bounded transient error instead of a permanently blocking
                        // one. The body text never reaches the log sink.
                        try { localStorage.removeItem('sp_hash_libraryV3'); } catch(_) {}
                        let persistedQueryMiss = false;
                        try {
                            const bodyText = await Promise.race([
                                Promise.resolve().then(() => resp.clone().text()), timeout
                            ]);
                            persistedQueryMiss = typeof bodyText === 'string' &&
                                bodyText.indexOf('PersistedQueryNotFound') >= 0;
                        } catch(_) {}
                        window.__sfMediaLibError = persistedQueryMiss
                            ? 'http-400-persisted-query' : 'http-400';
                        trace.error = persistedQueryMiss ? 'persisted-query-not-found' : 'http-other';
                    } else {
                        window.__sfMediaLibError = trace.http > 0 ? 'http-' + trace.http : 'http-unknown';
                        trace.error = 'http-other';
                    }
                    break;
                }

                if (trace.mime !== 'json' && trace.mime !== 'missing') {
                    window.__sfMediaLibError = 'non-json';
                    trace.error = 'non-json';
                    traceHomeLibraryStage(trace, 'parse', 'malformed', 0, trace.http, trace.requests);
                    break;
                }

                trace.phase = 'parse';
                let data;
                parseStartedAt = mediaLibraryNow();
                try {
                    data = await Promise.race([
                        Promise.resolve().then(() => resp.json()), timeout
                    ]);
                } catch (parseError) {
                    if (requestGeneration !== mediaLibraryRequestGeneration ||
                        authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) break;
                    const bodyReadFailed = !timedOut && parseError && parseError.name === 'TypeError';
                    window.__sfMediaLibError = timedOut ? 'timeout' : bodyReadFailed ? 'network-error' : 'invalid-json';
                    trace.error = timedOut ? 'timeout' : bodyReadFailed ? 'network' : 'invalid-json';
                    traceHomeLibraryStage(trace, 'parse', timedOut ? 'timeout' :
                        bodyReadFailed ? 'error' : 'malformed',
                        boundedMediaLibraryCount(mediaLibraryNow() - parseStartedAt, 999999),
                        trace.http, trace.requests);
                    if (!bodyReadFailed && !timedOut) {
                        traceLibraryEvent('library.parse.completed attempt=' +
                            boundedMediaLibraryCount(trace.attempt, 999999) +
                            ' request=' + boundedMediaLibraryCount(trace.requests, 1000) +
                            ' result=malformed');
                    }
                    break;
                }
                if (requestGeneration !== mediaLibraryRequestGeneration ||
                    authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) break;

                const hasGraphQlErrors = Boolean(Array.isArray(data && data.errors) && data.errors.length > 0);
                const libraryPage = data && data.data && data.data.me && data.data.me.libraryV3;
                const items = libraryPage && libraryPage.items;
                if (!Array.isArray(items)) {
                    traceLibraryEvent('library.parse.completed attempt=' +
                        boundedMediaLibraryCount(trace.attempt, 999999) +
                        ' request=' + boundedMediaLibraryCount(trace.requests, 1000) +
                        ' result=malformed');
                    traceHomeLibraryStage(trace, 'parse', 'malformed',
                        boundedMediaLibraryCount(mediaLibraryNow() - parseStartedAt, 999999),
                        trace.http, trace.requests);
                    window.__sfMediaLibError = hasGraphQlErrors ? 'graphql-error' : 'unexpected-shape';
                    trace.error = hasGraphQlErrors ? 'graphql' : 'unexpected-shape';
                    break;
                }
                traceHomeLibraryStage(trace, 'parse', hasGraphQlErrors ? 'partial' : 'valid',
                    boundedMediaLibraryCount(mediaLibraryNow() - parseStartedAt, 999999),
                    trace.http, trace.requests);
                traceLibraryEvent('library.parse.completed attempt=' +
                    boundedMediaLibraryCount(trace.attempt, 999999) +
                    ' request=' + boundedMediaLibraryCount(trace.requests, 1000) +
                    ' result=' + (hasGraphQlErrors ? 'partial' : 'valid'));
                if (hasGraphQlErrors) {
                    // A partial GraphQL body may contain data but is not a clean
                    // authentication proof. Keep it only for explicit diagnostics/retry.
                    window.__sfMediaLibError = 'graphql-error';
                    trace.error = 'graphql';
                } else {
                    window.__sfMediaLibSessionProofKnown = true;
                    window.__sfMediaLibSessionProven = true;
                    window.__sfMediaLibProofAuthEpoch = boundedMediaLibraryCount(authEpoch, 999999);
                }
                allItems = allItems.concat(items);
                trace.received = allItems.length;

                if (items.length < limit) {
                    hasMore = false;
                } else {
                    offset += limit;
                }
            } finally {
                if (timerId !== null) window.clearTimeout(timerId);
                if (controller) activeMediaLibraryControllers.delete(controller);
            }
        }
        trace.received = allItems.length;
        return allItems;
    }
    window.fetchAllLibrary = fetchAllLibrary;

    function parseLibrary(items) {
        const res = { playlists: [], albums: [], artists: [], podcasts: [] };
        const seen = {
            playlists: new Set(), albums: new Set(), artists: new Set(), podcasts: new Set()
        };
        if (!Array.isArray(items)) return res;

        items.slice(0, 1000).forEach((elem) => {
            const data = elem?.item?.data || elem?.data || elem?.item || elem;
            if (!data) return;
            const typename = String(data.__typename || data.type || '');
            const uri = String(data.uri || data._uri ||
                (data.id ? 'spotify:' + typename.toLowerCase() + ':' + data.id : '') || '').trim().slice(0, 256);
            const name = String(data.name || data.title || data.profile?.name || 'Unknown')
                .replace(/\s+/g, ' ').trim().slice(0, 120);
            const image = data.images?.items?.[0]?.sources?.[0]?.url || data.images?.[0]?.url ||
                data.coverArt?.sources?.[0]?.url || data.visuals?.avatarImage?.sources?.[0]?.url || null;

            if (!uri) return;

            if (typename.includes('Playlist') || uri.includes(':playlist:')) {
                const isLiked = name === 'Liked Songs' || uri.includes('collection');
                const playlistId = isLiked ? 'spotify:collection:tracks' : uri;
                if (seen.playlists.has(playlistId)) return;
                seen.playlists.add(playlistId);
                res.playlists.push({
                    id: playlistId,
                    name: name,
                    image: isLiked ? 'https://misc.scdn.co/liked-songs/liked-songs-640.png' : image,
                    browsable: true
                });
            } else if (typename.includes('Album') || uri.includes(':album:')) {
                if (seen.albums.has(uri)) return;
                seen.albums.add(uri);
                res.albums.push({
                    id: uri,
                    name: name,
                    image: image,
                    artists: data.artists?.items?.map(a => a.profile?.name).filter(Boolean) || [],
                    browsable: true
                });
            } else if (typename.includes('Artist') || uri.includes(':artist:')) {
                if (seen.artists.has(uri)) return;
                seen.artists.add(uri);
                res.artists.push({
                    id: uri,
                    name: name,
                    image: image,
                    browsable: true
                });
            } else if (typename.includes('Podcast') || typename.includes('Show') || uri.includes(':show:')) {
                if (seen.podcasts.has(uri)) return;
                seen.podcasts.add(uri);
                res.podcasts.push({
                    id: uri,
                    name: name,
                    image: image,
                    artists: data.publisher?.name ? [data.publisher.name] : [],
                    browsable: true
                });
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
        return [];
    }
    window.fetchMediaItems = fetchMediaItems;

    window.__sfSearchCache = window.__sfSearchCache || new Map();
    let currentSearchAbortController = null;

    async function searchMediaItems(query) {
        // Fast live search: the cache first, then the native search path.
        // Result sets are always capped at limit: 12.
        const searchOptions = {
            limit: 12
        };
        if (window.__sfSearchCache && window.__sfSearchCache.has(query)) {
            const cached = window.__sfSearchCache.get(query);
            return cached.slice(0, searchOptions.limit);
        }
        return [];
    }
    window.searchMediaItems = searchMediaItems;



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
            document.addEventListener('DOMContentLoaded', ensure, { once: true });
        } else {
            window.setTimeout(ensure, 0);
        }
        window.addEventListener('load', ensure, { once: true });
    }

    // =========================================================================
    // SECTION: SESSION STATE
    // The auth machine turns observed DOM signals into a rendered state. An
    // unknown state is always shown as an explicit unconfirmed notice inside
    // the document flow, never over the primary UI.
    // =========================================================================

    function collectAuthSignals() {
        const route = String(window.location.href || '');
        let host = String(window.location.hostname || '').toLowerCase();
        let pathname = String(window.location.pathname || '/');
        try {
            const parsed = new URL(route);
            host = parsed.hostname.toLowerCase();
            pathname = parsed.pathname || '/';
        } catch (_) {}
        const normalizedPath = pathname.replace(/^\/intl-[a-z]{2}(?:-[a-z]{2})?(?=\/|$)/i, '') || '/';
        return {
            accountsPage: host === 'accounts.spotify.com',
            loginRoute: host === 'open.spotify.com' &&
                /^\/(?:login|signin|oauth|auth|v2\/auth)(?:\/|$)/i.test(normalizedPath),
            loginAction: !!document.querySelector('a[href*="login"], [data-testid="login-button"]'),
            // MEL-BUG-029: a logged-in WebView must stay recognizable even when
            // one Spotify DOM selector family goes stale. Each side keeps
            // several selectors already used across this codebase; sign-in still
            // requires BOTH a profile-side and a player-side signal (fail closed).
            profileControl: !!document.querySelector(
                '[data-testid="user-widget-link"], .main-userWidget-box, a[href^="/user/"]'),
            playerControls: !!document.querySelector(
                '[data-testid="control-button-playpause"], .main-playButton-entrancePoint, ' +
                'aside[data-testid="now-playing-bar"], [data-testid="mini-player"], ' +
                '[data-testid="control-button-skip-forward"], [data-testid="control-button-skip-back"]')
        };
    }

    function invalidateLibraryProofForAuthChange(reason) {
        // A recognized sign-out/login must also discard presentation caches,
        // even when no library request or proof exists. These are memory-only;
        // never touch cookies or local preferences. Native invalidation alone
        // does not reach a still-live WebView.
        for (const cache of [window.__sfSearchCache, window.__sfMediaItemsCache]) {
            try { if (cache && typeof cache.clear === 'function') cache.clear(); } catch (_) {}
        }
        window.__sfCurrentContextUri = null;
        window.__sfCurrentTrackUris = [];
        window.__sfPlayerPayload = null;
        if (currentSearchAbortController) {
            try { currentSearchAbortController.abort(); } catch (_) {}
            currentSearchAbortController = null;
        }
        const hadProof = window.__sfMediaLibSessionProven === true || Boolean(window.mediaLib);
        const hadRequest = Boolean(mediaLibraryCheckPromise || activeMediaLibraryControllers.size);
        if (hadRequest) {
            mediaLibraryRequestGeneration += 1;
            activeMediaLibraryControllers.forEach((controller) => {
                try { controller.abort(); } catch (_) {}
            });
            activeMediaLibraryControllers.clear();
            mediaLibraryCheckPromise = null;
        }
        if (!hadProof && !hadRequest) return false;
        if (hadProof) {
            window.__sfMediaLibSessionProofKnown = true;
            window.__sfMediaLibSessionProven = false;
            window.mediaLib = null;
            window.__sfMediaLibRawItemCount = 0;
            window.__sfMediaLibUpdatedAt = 0;
            window.__sfMediaLibProofAuthEpoch = 0;
        }
        window.__sfMediaLibStatus = 'pending';
        window.__sfMediaLibError = '';
        window.__sfMediaLibRetryAt = 0;
        window.__sfMediaLibRetryDelayMs = 5000;
        notifyMediaLibSettled(reason || 'auth-change');
        return true;
    }

    function clearLibraryProofForLoginRoute() {
        return invalidateLibraryProofForAuthChange('login-route');
    }

    function observeSpotifyAuthState() {
        const runtime = window.MelodixRuntime;
        const hasMachine = runtime && typeof runtime.createAuthStateMachine === 'function';
        const signals = collectAuthSignals();
        let machine = null;
        let observed = null;
        let state = 'unknown';
        let previous;

        if (hasMachine) {
            machine = window._sfAuthMachine;
            if (!machine || typeof machine.observe !== 'function') {
                machine = runtime.createAuthStateMachine(function(next) {
                    if (next === runtime.AUTH_STATE.SIGNED_IN) {
                        const currentEpoch = Number(window.__sfSpotifyAuthEpoch || 0);
                        window.__sfSpotifyAuthEpoch = Math.min(999999,
                            Math.max(0, Number.isFinite(currentEpoch) ? Math.floor(currentEpoch) : 0) + 1);
                    }
                });
                window._sfAuthMachine = machine;
            }
            observed = machine.observe(signals);
            if (observed === runtime.AUTH_STATE.SIGNED_IN) state = 'connected';
            else if (observed === runtime.AUTH_STATE.SIGNED_OUT) state = 'required';
            else state = document.readyState === 'loading' ? 'in-progress' : 'unknown';
        } else {
            state = document.readyState === 'loading' ? 'in-progress' : 'unknown';
        }

        previous = String(window.__sfSpotifyAuthUiState || 'unknown');
        window.__sfSpotifyAuthUiState = state;
        if (signals.accountsPage || signals.loginRoute) clearLibraryProofForLoginRoute();
        else if (state === 'required') invalidateLibraryProofForAuthChange('auth-required');
        if (!window.__sfAuthUiTraceInitialized || previous !== state) {
            window.__sfAuthUiTraceInitialized = true;
            traceLibraryEvent('auth.state state=' + state);
            traceLibraryEvent('webview.session.ready ready=' + (state === 'connected' ? '1' : '0') +
                ' source=player-ui');
            try {
                window.dispatchEvent(new window.Event('sf-spotify-auth-state-changed'));
            } catch (_) {}
        }
        syncMediaLibraryUiState();
        return { runtime: hasMachine ? runtime : null, machine: machine, state: state };
    }

    window.__sfSpotifyAuthUiState = 'unknown';
    window.__sfSpotifyAuthEpoch = Number.isFinite(Number(window.__sfSpotifyAuthEpoch))
        ? Math.max(0, Math.floor(Number(window.__sfSpotifyAuthEpoch))) : 0;
    window.__sfGetSpotifyAuthUiState = function() {
        return observeSpotifyAuthState().state;
    };

    function renderUnconfirmedNotice() {
        const observed = observeSpotifyAuthState();
        const runtime = observed.runtime;
        const machine = observed.machine;
        if (!runtime || typeof runtime.shouldShowUnconfirmedNotice !== 'function' || !machine) return;
        const mainView = document.querySelector('#main-view');
        if (!mainView) return;
        const show = runtime.shouldShowUnconfirmedNotice(machine.getState());
        let notice = document.getElementById('sf-auth-status');
        if (show) {
            if (!notice) {
                notice = document.createElement('div');
                notice.id = 'sf-auth-status';
                notice.className = 'sf-auth-status-body-root';
                notice.setAttribute('role', 'status');
                const title = document.createElement('strong');
                title.textContent = 'Session non confirmée';
                const body = document.createElement('div');
                body.textContent = "L'état de la connexion Spotify n'est pas encore confirmé.";
                notice.appendChild(title);
                notice.appendChild(body);
                mainView.insertBefore(notice, mainView.firstChild);
            }
        } else if (notice && notice.parentNode) {
            notice.parentNode.removeChild(notice);
        }
    }

    function start() {
        renderUnconfirmedNotice();
        syncMediaLibraryUiState();
        if (!window.__sfAuthUiStartupSignalSent) {
            window.__sfAuthUiStartupSignalSent = true;
            try {
                window.dispatchEvent(new window.Event('sf-spotify-auth-state-changed'));
            } catch (_) {}
        }
        if (typeof window.__sfEnsureMobileShell === 'function') {
            try { window.__sfEnsureMobileShell(); } catch (_) {}
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', start);
    } else {
        start();
    }
    window.addEventListener('load', renderUnconfirmedNotice);

    initializeMobileShell();
    installPremiumPromotionCleanup();
    firstFuck();
    window.__sfMelodixBridgeCompleted = true;
    __sfBridgeTrace('bridge done');
})();
