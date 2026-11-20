    // User-approved ("oui préchauffage", after Preview 1022284): Spotify's web player needs
    // 1-5 s to start the first track after the app opens. Once per page load, while paused on
    // this device, start the current track with the page's own media muted, let it buffer,
    // pause it again and put the position back. The account volume is never touched.
    var previewPrewarm = {done: false, active: false, timer: 0};
    // User report (1022305): Spotify's audio element is not always in the DOM (new Audio()),
    // so querySelectorAll missed it: nothing was muted and the track played aloud at launch.
    // Every element play() is called on during the warm-up is remembered and muted first.
    previewPrewarm.seen = [];
    function previewPrewarmMedia() {
        var all = Array.prototype.slice.call(document.querySelectorAll('video, audio'));
        previewPrewarm.seen.forEach(function(m) { if (all.indexOf(m) < 0) all.push(m); });
        return all;
    }
    (function hookPlay() {
        var P = window.HTMLMediaElement && window.HTMLMediaElement.prototype;
        if (!P || P.play.__sfPrewarmHooked) return;
        var play = P.play;
        P.play = function() {
            if (previewPrewarm.active || previewPrewarm.holding) {
                try { this.muted = true; } catch (_) {}
                if (previewPrewarm.seen.indexOf(this) < 0) previewPrewarm.seen.push(this);
            }
            return play.apply(this, arguments);
        };
        P.play.__sfPrewarmHooked = true;
    })();
    function previewPrewarmRemote() {
        // Playback on another device: never take it over.
        if (document.querySelector('[data-testid="connect-bar"], [data-testid="connect-device-bar"], [aria-label*="Écoute sur"], [aria-label*="Listening on"]')) return true;
        var bar = document.querySelector('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"], [data-testid="now-playing-widget-v2"]');
        return !!(bar && /(écoute en cours sur|listening on|lecture sur)/i.test(String(bar.textContent || '')));
    }
    function previewPrewarmFinish(keepPlaying) {
        if (!previewPrewarm.active) return;
        // Keep reporting 'paused' until the pause has landed, or a tap in that window becomes a pause.
        previewPrewarm.active = false; if (keepPlaying) window.__sfPrewarmActive = false;
        if (previewPrewarm.timer) window.clearTimeout(previewPrewarm.timer);
        if (previewPrewarm.watch) window.clearTimeout(previewPrewarm.watch);
        if (!keepPlaying) {
            try { if (typeof window.actPlayPause === 'function') window.actPlayPause(false); } catch (_) {}
            if (previewPrewarm.position >= 0 && typeof window.actSeek === 'function') try { window.actSeek(previewPrewarm.position); } catch (_) {}
        }
        if (keepPlaying) { window.setTimeout(previewPrewarmRelease, 0); return; }
        // User report (1022302): sound came back while the pause had not landed, so the track
        // started audibly at launch. Unmute only once every page media is really paused.
        previewPrewarm.holding = true; previewPrewarm.tries = 0;
        (function settle() {
            window.setTimeout(function() {
                if (!previewPrewarm.holding) return;
                var playing = previewPrewarmMedia().some(function(m) { return m.paused === false; });
                if (!playing) { previewPrewarmRelease(); return; }
                previewPrewarm.tries++;
                if (previewPrewarm.tries <= 3) try { if (typeof window.actPlayPause === 'function') window.actPlayPause(false); } catch (_) {}
                // Still playing after ~3 s: stay muted; the user's next Play/Pause tap unmutes.
                if (previewPrewarm.tries < 12) settle();
            }, previewPrewarm.tries === undefined || previewPrewarm.tries === 0 ? 400 : 250);
        })();
    }
    function previewPrewarmRelease() {
        previewPrewarm.holding = false; window.__sfPrewarmActive = false;
        previewPrewarmMedia().forEach(function(m) { try { m.muted = false; } catch (_) {} });
        document.removeEventListener('play', previewPrewarmMute, true);
    }
    function previewPrewarmMute(e) { try { if ((previewPrewarm.active || previewPrewarm.holding) && e && e.target) e.target.muted = true; } catch (_) {} }
    function previewPrewarmStart() {
        if (previewPrewarm.done) return;
        if (typeof playPauseButton !== 'function' || typeof readNowPlaying !== 'function' || typeof previewPlaybackState !== 'function' ||
            typeof previewRealText !== 'function' || typeof previewSeekObservation !== 'function') { previewPrewarm.done = true; return; }
        var pb = playPauseButton(), info = readNowPlaying() || {};
        if (!pb || typeof window.actPlayPause !== 'function' || previewPlaybackState() !== 'paused' || !previewRealText(info.title)) return;
        previewPrewarm.done = true;
        if (previewPrewarmRemote() || window.__sfUserRequestedPause === true && window.__sfLastPlayRequestAt > Date.now() - 10000) return;
        previewPrewarm.position = previewSeekObservation(); previewPrewarm.title = previewRealText(info.title);
        previewPrewarm.active = true; window.__sfPrewarmActive = true;
        document.addEventListener('play', previewPrewarmMute, true);
        previewPrewarmMedia().forEach(function(m) { try { m.muted = true; } catch (_) {} });
        // A user tap during the warm-up keeps the (now buffered) playback and unmutes it.
        var toggle = window.__sfTogglePlayback;
        if (typeof toggle === 'function' && !toggle.__sfPrewarmWrapped) {
            window.__sfTogglePlayback = function() { if (previewPrewarm.holding) previewPrewarmRelease(); if (previewPrewarm.active) { previewPrewarmFinish(true); try { if (typeof publishPlayerState === 'function') publishPlayerState(true); } catch (_) {} return true; } return toggle.apply(this, arguments); };
            window.__sfTogglePlayback.__sfPrewarmWrapped = true;
        }
        try { window.actPlayPause(true); } catch (_) { previewPrewarmFinish(false); return; }
        previewPrewarm.timer = window.setTimeout(function() { previewPrewarmFinish(false); }, 3000);
        // 1022294: on a free account the muted start can be an ad (no title / another title);
        // Spotify stalls a muted ad, which froze the page for ~70 s. Stop at once, sound back on.
        (function watch() {
            previewPrewarm.watch = window.setTimeout(function() {
                if (!previewPrewarm.active) return;
                var now = '';
                try { now = previewRealText((readNowPlaying() || {}).title); } catch (_) {}
                if (now !== previewPrewarm.title) { previewPrewarmFinish(false); return; }
                watch();
            }, 250);
        })();
    }
    window.setTimeout(function check() { previewPrewarmStart(); if (!previewPrewarm.done) window.setTimeout(check, 1000); }, 1500);
