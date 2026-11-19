    // User-approved ("oui préchauffage", after Preview 1022284): Spotify's web player needs
    // 1-5 s to start the first track after the app opens. Once per page load, while paused on
    // this device, start the current track with the page's own media muted, let it buffer,
    // pause it again and put the position back. The account volume is never touched.
    var previewPrewarm = {done: false, active: false, timer: 0};
    function previewPrewarmMedia() { return Array.prototype.slice.call(document.querySelectorAll('video, audio')); }
    function previewPrewarmRemote() {
        // Playback on another device: never take it over.
        if (document.querySelector('[data-testid="connect-bar"], [data-testid="connect-device-bar"], [aria-label*="Écoute sur"], [aria-label*="Listening on"]')) return true;
        var bar = document.querySelector('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]');
        return !!(bar && /(écoute en cours sur|listening on|lecture sur)/i.test(String(bar.textContent || '')));
    }
    function previewPrewarmFinish(keepPlaying) {
        if (!previewPrewarm.active) return;
        previewPrewarm.active = false; window.__sfPrewarmActive = false;
        if (previewPrewarm.timer) window.clearTimeout(previewPrewarm.timer);
        if (!keepPlaying) {
            try { if (typeof window.actPlayPause === 'function') window.actPlayPause(false); } catch (_) {}
            if (previewPrewarm.position >= 0 && typeof window.actSeek === 'function') try { window.actSeek(previewPrewarm.position); } catch (_) {}
        }
        // Unmute only once the pause has landed (or at once if the user takes over).
        window.setTimeout(function() { previewPrewarmMedia().forEach(function(m) { try { m.muted = false; } catch (_) {} }); document.removeEventListener('play', previewPrewarmMute, true); }, keepPlaying ? 0 : 400);
    }
    function previewPrewarmMute(e) { try { if (previewPrewarm.active && e && e.target) e.target.muted = true; } catch (_) {} }
    function previewPrewarmStart() {
        if (previewPrewarm.done) return;
        if (typeof playPauseButton !== 'function' || typeof readNowPlaying !== 'function' || typeof previewPlaybackState !== 'function' ||
            typeof previewRealText !== 'function' || typeof previewSeekObservation !== 'function') { previewPrewarm.done = true; return; }
        var pb = playPauseButton(), info = readNowPlaying() || {};
        if (!pb || typeof window.actPlayPause !== 'function' || previewPlaybackState() !== 'paused' || !previewRealText(info.title)) return;
        previewPrewarm.done = true;
        if (previewPrewarmRemote() || window.__sfUserRequestedPause === true && window.__sfLastPlayRequestAt > Date.now() - 10000) return;
        previewPrewarm.position = previewSeekObservation();
        previewPrewarm.active = true; window.__sfPrewarmActive = true;
        document.addEventListener('play', previewPrewarmMute, true);
        previewPrewarmMedia().forEach(function(m) { try { m.muted = true; } catch (_) {} });
        // A user tap during the warm-up keeps the (now buffered) playback and unmutes it.
        var toggle = window.__sfTogglePlayback;
        if (typeof toggle === 'function' && !toggle.__sfPrewarmWrapped) {
            window.__sfTogglePlayback = function() { if (previewPrewarm.active) { previewPrewarmFinish(true); try { if (typeof publishPlayerState === 'function') publishPlayerState(true); } catch (_) {} return true; } return toggle.apply(this, arguments); };
            window.__sfTogglePlayback.__sfPrewarmWrapped = true;
        }
        try { window.actPlayPause(true); } catch (_) { previewPrewarmFinish(false); return; }
        previewPrewarm.timer = window.setTimeout(function() { previewPrewarmFinish(false); }, 3000);
    }
    window.setTimeout(function check() { previewPrewarmStart(); if (!previewPrewarm.done) window.setTimeout(check, 1000); }, 1500);
