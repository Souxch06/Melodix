    // Ordinary collections keep their existing bridge route. Liked tracks use
    // their paginated reader when the session is already available, even if the
    // bridge has not completed bootstrap. Only explicit opens/retries start it.
    var openCollectionTimer = null;
    var previewCollectionRetry = null;
    var pendingCollectionUri = null;
    var previewCollectionValue = null;
    var nativeCollectionSequence = 0;
    function previewPhase(stage) {
        try { if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
            window.AndBridge.onNativeUiData('preview-phase', stage); } catch (_) {}
    }
    function previewLoadState(stage, sessionStatus) {
        try {
            if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
                window.AndBridge.onNativeUiData('preview-load', stage + ':' + (sessionStatus || 'unknown'));
        } catch (_) {}
    }
    function stopPreviewCollectionRetry() {
        if (previewCollectionRetry) window.clearTimeout(previewCollectionRetry);
        previewCollectionRetry = null;
    }
    function stopCollectionFallback() {
        if (openCollectionTimer) window.clearTimeout(openCollectionTimer);
        openCollectionTimer = null;
        pendingCollectionUri = null;
    }
    function cancelPendingCollectionNavigation() {
        stopCollectionFallback();
        stopPreviewCollectionRetry();
        cancelPreviewLikedRequest();
        previewCollectionValue = null;
        window.__sfNativeCollectionRequest = null;
        window.__sfNativeCollectionUri = null;
        window.__sfNativeCollectionHasData = false;
        window.__sfNativeCollectionDomReady = false;
    }
    window.__sfCancelPendingCollection = cancelPendingCollectionNavigation;
    // Even an unconfirmed add can have reached Spotify. Prevent an older
    // in-flight collection response from being shown or cached afterward.
    window.__sfLikedMutationAttempted = function() {
        if (window.__sfNativeCollectionUri === 'spotify:collection:tracks') cancelPendingCollectionNavigation();
    };
    window.__sfNativeCollectionLoaded = function(uri, requestId) {
        if (requestId && requestId === window.__sfNativeCollectionRequest && uri === window.__sfNativeCollectionUri) {
            previewPhase('rows-received');
            window.__sfNativeCollectionHasData = true;
            previewLoadState('data');
            stopPreviewCollectionRetry();
            stopCollectionFallback();
        }
    };
    // Unknown is NOT paused: do not destroy a possibly playing WebView.
    function previewDefinitelyStopped() {
        var state = playPauseLabelPlaying();
        if (isMediaPlaying() || isSpotifyActuallyPlaying() || state === true || window.playing === true) return false;
        var button = playPauseButton();
        var label = button && String(button.getAttribute('aria-label') || '').trim();
        return !!(label && /^(?:play|resume|lire|lecture|reprendre)(?:\s|$)/i.test(label));
    }
    window.__sfOpenCollection = function(value) {
        var uri = nativeSpotifyUri(value), requestId, started = false, done = false, failedOnce = false;
        if (!uri) return false;
        cancelPendingCollectionNavigation();
        requestId = ++nativeCollectionSequence;
        window.__sfNativeCollectionRequest = requestId;
        window.__sfNativeCollectionUri = uri;
        pendingCollectionUri = uri;
        previewCollectionValue = String(value);
        function current() { return window.__sfNativeCollectionRequest === requestId && !window.__sfNativeCollectionHasData; }
        function failed(stage) {
            if (!current() || failedOnce) return;
            failedOnce = true;
            if (uri === 'spotify:collection:tracks' && window.__sfNativeCollectionDomReady) {
                stopPreviewCollectionRetry(); stopCollectionFallback();
                previewLoadState('data'); return;
            }
            stopPreviewCollectionRetry();
            stopCollectionFallback();
            previewLoadState(stage, uri === 'spotify:collection:tracks' && !previewLikedSessionReady() ? 'no-token' : 'unknown');
            if (previewDefinitelyStopped()) {
                // Historical 9016 fallback; the current playback page is only
                // replaced when paused/stopped is positively observed.
                previewPhase('navigation');
                window.__sfNativeOpenUri(uri);
                return;
            }
            sendNativeUiData('detail', [
                {title:'Titres indisponibles', subtitle:uri === 'spotify:collection:tracks' ? 'Titres likés indisponibles. La lecture continue.' : 'La lecture continue.', settingValue:'Info', uri:''},
                {title:'Réessayer', subtitle:'Une nouvelle tentative', uri:'melodix:retry-collection'}
            ]);
        }
        function request() {
            if (!current() || started) return;
            started = true;
            if (window.__sfMelodixBridgeCompleted === true) previewPhase('bridge-ready');
            previewLoadState('pending', uri === 'spotify:collection:tracks' ? (previewLikedSessionReady() ? 'token' : 'no-token') : 'unknown');
            if (uri === 'spotify:collection:tracks') {
                previewLoadLiked(String(value), requestId, function() {
                    return !failedOnce && window.__sfNativeCollectionRequest === requestId && window.__sfNativeCollectionUri === uri;
                }, failed).then(function() { done = true; }, function() { done = true; failed('failed'); });
                return;
            }
            try {
                Promise.resolve(window.fetchMediaItems(uri, requestId, String(value))).then(function() {
                    done = true;
                    if (current()) failed('no-data');
                }, function() { done = true; failed('failed'); });
            } catch (_) { done = true; failed('failed'); }
        }
        function waitForBridge(remaining) {
            if (!current()) return;
            if (uri === 'spotify:collection:tracks' && previewLikedSessionReady()) {
                request(); return;
            }
            if (window.__sfMelodixBridgeCompleted === true && typeof window.fetchMediaItems === 'function') {
                request(); return;
            }
            if (remaining <= 0) { failed('waiting-bridge'); return; }
            previewLoadState('waiting-bridge', uri === 'spotify:collection:tracks' ? 'no-token' : 'unknown');
            previewCollectionRetry = window.setTimeout(function() { waitForBridge(remaining - 1); }, 250);
        }
        // Re-publish only the already visible liked DOM for this explicit tap;
        // clear its presentation signature so an earlier native screen cannot
        // suppress the new detail. No navigation or extra request is added.
        if (uri === 'spotify:collection:tracks' && spotifyResourceUri(window.location.href) === uri) {
            lastInitialDetailSignature = null;
            updateDetailRows(homeScrapeRoot());
        }
        openCollectionTimer = window.setTimeout(function() {
            if (current() && !done) failed('timeout');
        }, 6000);
        waitForBridge(20);
        return true;
    };
    window.__sfRetryCollection = function() {
        var value = previewCollectionValue;
        // A paused-only navigation starts a fresh WebView page; retain no
        // account state, but allow an explicit retry of its visible liked route.
        if (!value && spotifyRoutePath() === '/collection/tracks') value = 'spotify:collection:tracks';
        return value ? window.__sfOpenCollection(value) : false;
    };
