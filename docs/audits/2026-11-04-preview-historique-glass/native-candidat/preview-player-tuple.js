    // Read only the already displayed player and bridge metadata. The state is
    // tri-state: an unrecognised label or absent media is not a proven pause.
    function previewPlaybackState() {
        if (window.__sfUserRequestedPause === true) return 'paused';
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
            previewProgressValid: valid, previewAdvancing: valid && identity && state === 'playing'
        };
    }
