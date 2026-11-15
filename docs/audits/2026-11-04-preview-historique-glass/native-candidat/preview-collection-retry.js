    // Browsing does not issue any request of its own: exactly one call to the
    // existing bridge per open or explicit retry. Wait for bridge bootstrap
    // before that call; never inspect a credential or repeat it automatically.
    var openCollectionTimer = null;
    var previewCollectionRetry = null;
    var pendingCollectionUri = null;
    var previewCollectionValue = null;
    var nativeCollectionSequence = 0;
    function previewPhase(stage) {
        try { if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
            window.AndBridge.onNativeUiData('preview-phase', stage); } catch (_) {}
    }
    var previewLastLikedState = '';
    var previewLikedUnavailableShown = false;
    function previewLikedState(state) {
        if (state !== previewLastLikedState) { previewLastLikedState = state; previewPhase(state); }
    }
    function previewLoadState(stage) {
        try {
            if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
                window.AndBridge.onNativeUiData('preview-load', stage + ':unknown');
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
        previewCollectionValue = null;
        window.__sfNativeCollectionRequest = null;
        window.__sfNativeCollectionUri = null;
        window.__sfNativeCollectionHasData = false;
        window.__sfNativeCollectionDomReady = false;
    }
    window.__sfCancelPendingCollection = cancelPendingCollectionNavigation;
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
        previewLastLikedState = '';
        requestId = ++nativeCollectionSequence;
        window.__sfNativeCollectionRequest = requestId;
        window.__sfNativeCollectionUri = uri;
        pendingCollectionUri = uri;
        previewCollectionValue = String(value);
        if (uri === 'spotify:collection:tracks' && spotifyResourceUri(window.location.href) !== uri)
            previewLikedState('liked-route-other');
        function current() { return window.__sfNativeCollectionRequest === requestId && !window.__sfNativeCollectionHasData; }
        function failed(stage) {
            if (!current() || failedOnce) return;
            if (window.__sfNativeCollectionDomReady) {
                stopPreviewCollectionRetry(); stopCollectionFallback();
                previewLoadState('data'); return;
            }
            failedOnce = true;
            stopPreviewCollectionRetry();
            stopCollectionFallback();
            previewLoadState(stage);
            if (previewDefinitelyStopped()) {
                // Historical 9016 fallback; the current playback page is only
                // replaced when paused/stopped is positively observed.
                previewPhase('navigation');
                window.__sfNativeOpenUri(uri);
                return;
            }
            sendNativeUiData('detail', [
                {title:uri === 'spotify:collection:tracks' ? 'Titres likés indisponibles' : 'Titres indisponibles', subtitle:'La lecture continue.', settingValue:'Info', uri:''},
                {title:'Réessayer', subtitle:'Une nouvelle tentative', uri:'melodix:retry-collection'}
            ]);
        }
        function request() {
            if (!current() || started) return;
            started = true;
            previewPhase('bridge-ready');
            previewLoadState('pending');
            try {
                Promise.resolve(window.fetchMediaItems(uri, requestId, String(value))).then(function() {
                    done = true;
                    if (current()) failed('no-data');
                }, function() { done = true; failed('failed'); });
            } catch (_) { done = true; failed('failed'); }
        }
        function waitForBridge(remaining) {
            if (!current()) return;
            // The bridge assigns fetchMediaItems after all of its dependencies are
            // initialized. JS runs to completion, so the exposed function is
            // callable even if unrelated later bootstrap work fails.
            if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
                request(); return;
            }
            if (remaining <= 0) { failed('waiting-bridge'); return; }
            previewLoadState('waiting-bridge');
            previewCollectionRetry = window.setTimeout(function() { waitForBridge(remaining - 1); }, 250);
        }
        openCollectionTimer = window.setTimeout(function() {
            if (current() && !done) failed('timeout');
        }, 6000);
        // If this collection is already the visible Spotify page, publish its
        // existing DOM rows immediately; no navigation, scroll or extra fetch.
        if (spotifyResourceUri(window.location.href) === uri) {
            lastInitialDetailSignature = null;
            runUpdate();
        }
        waitForBridge(20);
        return true;
    };
    window.__sfRetryCollection = function() {
        var value = previewCollectionValue || (spotifyResourceUri(window.location.href) === 'spotify:collection:tracks' ? 'spotify:collection:tracks' : null);
        return value ? window.__sfOpenCollection(value) : false;
    };
