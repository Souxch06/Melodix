    // Read only the already displayed player and bridge metadata. The state is
    // tri-state: an unrecognised label or absent media is not a proven pause.
    function previewPlaybackState() {
        var button = playPauseButton();
        var label = button && typeof button.getAttribute === 'function' ? String(button.getAttribute('aria-label') || '').trim() : '';
        if (/paus/i.test(label)) return 'playing';
        if (/^(?:play|resume|lire|lecture|reprendre)(?:\s|$)/i.test(label)) return 'paused';
        return 'unknown';
    }
    function previewRealText(value) {
        var s = typeof value === 'string' ? value.trim() : '';
        return /^(?:no track|no artist|aucun titre|lecture arrêtée|aucune lecture en cours)$/i.test(s) ? '' : s.slice(0,120);
    }
    var previewSeekInput = null, previewSeekAttributeBefore = null;
    function previewSeekObservation() {
        var clock = readClock(['[data-testid="playback-position"]']);
        if (clock >= 0) return clock * 1000;
        // actSeek writes the range property, not its attribute. An attribute
        // subsequently rewritten by the page is a separate UI observation.
        if (previewSeekInput && previewSeekInput.isConnected) {
            var attr = previewSeekInput.getAttribute('value');
            if (attr !== previewSeekAttributeBefore && /^\d+$/.test(String(attr))) return Number(attr);
        }
        return -1;
    }
    function playerPayload() {
        var info = readNowPlaying();
        var title = previewRealText(info.title), artist = previewRealText(info.artist);
        var bridgeTitle = previewRealText(window.track), bridgeArtist = previewRealText(window.artist);
        // Never combine an artist from an unrelated visible track with a title.
        if ((!title && !artist) && bridgeTitle && bridgeArtist) { title = bridgeTitle; artist = bridgeArtist; }
        else if (title && !artist && bridgeTitle === title && bridgeArtist) artist = bridgeArtist;
        var state = previewPlaybackState();
        var valid = info.previewDurationMs > 0 && info.previewPositionMs >= 0 && info.previewPositionMs <= info.previewDurationMs;
        var identity = !!(title && artist && info.previewDurationMs > 0);
        return {
            track: title || 'Aucune lecture en cours', artist: artist || '', cover: info.cover || '',
            playing: state === 'playing', previewPlaybackState: state,
            position: info.position, duration: info.duration,
            previewTrackUri: info.previewTrackUri, previewProgressSource: info.previewProgressSource,
            previewPositionMs: info.previewPositionMs, previewDurationMs: info.previewDurationMs,
            // Wall-clock time of this existing observation, not the source update time.
            previewObservedAtMs: Date.now(),
            // The text clock is independent of the slider property that actSeek writes.
            previewConfirmPositionMs: previewSeekObservation(),
            previewProgressValid: valid, previewAdvancing: valid && identity && state === 'playing'
        };
    }

    // Calling the existing action is the only operation here. Recheck the
    // identity in the WebView to avoid seeking a track changed in transit.
    window.__sfPreviewSeek = function(pos, title, artist, duration, uri) {
        var p = playerPayload();
        if (!p.previewProgressValid || p.track !== title || p.artist !== artist ||
            p.previewDurationMs !== duration || (uri && p.previewTrackUri && uri !== p.previewTrackUri) ||
            typeof window.actSeek !== 'function' || !document.querySelector('div[data-testid="playback-progressbar"] input[type="range"]')) return false;
        previewSeekInput = document.querySelector('div[data-testid="playback-progressbar"] input[type="range"]');
        previewSeekAttributeBefore = previewSeekInput.getAttribute('value');
        window.actSeek(Math.max(0, Math.min(duration, Math.round(Number(pos)))));
        return true; // invocation only, not a Spotify acknowledgement
    };
