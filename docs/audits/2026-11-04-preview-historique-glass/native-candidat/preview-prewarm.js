// Startup must be passive: do not issue a Spotify play command to prewarm.
// Playback begins only after an explicit user action through the player UI.
(function () {
    'use strict';
    if (typeof window !== 'undefined') {
        window.__sfPrewarmActive = false;
        window.__sfPrewarmDisabledReason = 'startup-autoplay-disabled';
    }
})();
