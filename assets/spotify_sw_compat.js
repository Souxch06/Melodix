// Targeted compatibility workaround for stale Spotify Web Player service workers.
// The Android bridge injects this only at https://open.spotify.com and before
// page scripts run. It does not alter browser identity, requests, credentials,
// or Spotify player-capability data.
(function () {
    if (window.location.origin !== 'https://open.spotify.com') return;
    if (!('serviceWorker' in navigator)) return;

    try {
        navigator.serviceWorker.register = function () {
            return Promise.reject(new Error('Service worker disabled by Melodix compatibility mode'));
        };
    } catch (_) {}

    try {
        navigator.serviceWorker.getRegistrations().then(function (registrations) {
            registrations.forEach(function (registration) {
                try {
                    if (new URL(registration.scope).origin === window.location.origin) {
                        registration.unregister();
                    }
                } catch (_) {}
            });
        }).catch(function () {});
    } catch (_) {}
})();
