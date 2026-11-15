/* WORK IN PROGRESS: not integrated into or delivered with the Preview.
 * Pure state machine for native playlist taps. No Spotify or Android access.
 * The host supplies an exact visible-row check, definite availability,
 * player observation, current-track toggle and one command. A missing or
 * indeterminate availability signal must fail closed.
 * The shared budget must outlive individual screens and controller instances.
 */
(function (root, factory) {
    if (typeof module === 'object' && module.exports) module.exports = factory;
    else root.createPlaylistTapController = factory;
}(typeof globalThis === 'object' ? globalThis : this, function createPlaylistTapController(host, budget) {
    'use strict';
    var WINDOW_MS = 60000;
    var MAX_STARTS = 3;
    var DEBOUNCE_MS = 750;
    var TIMEOUT_MS = 8000;
    var REST_MS = 3000;
    var pending = null;
    var sequence = 0;
    if (!budget || !Array.isArray(budget.starts)) throw new Error('Shared budget required');

    function emit(state, track, context) { host.notify({state: state, track: track, context: context}); }
    function cancel() {
        if (pending) host.clearTimer(pending.timer);
        pending = null;
        sequence += 1;
    }
    function tap(track, context) {
        // Collection rows are deliberately inert, not failed playlist requests.
        if (typeof context === 'string' && /(?:^spotify:collection:|:collection(?:$|:))/i.test(context)) return 'ignored';
        if (typeof context !== 'string' || !/^spotify:playlist:[A-Za-z0-9]+$/.test(context) ||
            typeof track !== 'string' || !/^spotify:track:[A-Za-z0-9]+$/.test(track) ||
            !host.isVisible(track, context)) {
            emit('error', typeof track === 'string' ? track : '', typeof context === 'string' ? context : '');
            return 'invalid';
        }
        // Unknown availability is not evidence that a row is playable.
        var available = host.isAvailable(track, context);
        if (available !== true) {
            emit(available === false ? 'unavailable' : 'error', track, context);
            return available === false ? 'unavailable' : 'invalid';
        }
        // Current-track pause/resume is not a new playlist start. Never apply
        // the launch quota, debounce or failure rest to this existing control.
        if (host.currentTrack() === track) {
            if (pending) { cancel(); emit('clear', track, context); }
            host.toggle();
            return 'toggled';
        }
        var now = host.now();
        if (!Number.isFinite(now) || (Number.isFinite(budget.lastNow) && now < budget.lastNow)) return 'invalid-clock';
        budget.lastNow = now;
        if (Number.isFinite(budget.lastTap) && now - budget.lastTap < DEBOUNCE_MS) return 'debounced';
        budget.lastTap = now;
        if (budget.restUntil === Infinity || (Number.isFinite(budget.restUntil) && now < budget.restUntil)) {
            emit('resting', track, context);
            return 'resting';
        }
        budget.starts = budget.starts.filter(function (t) { return Number.isFinite(t) && now >= t && now - t < WINDOW_MS; });
        if (budget.starts.length >= MAX_STARTS) {
            emit('limited', track, context);
            return 'limited';
        }
        cancel();
        budget.starts.push(now);
        var request = ++sequence;
        pending = {track: track, context: context, timer: null, sequence: request};
        emit('loading', track, context);
        pending.timer = host.setTimer(function () {
            if (!pending || pending.sequence !== request) return;
            // This is not a Spotify failure: the requested state has not yet
            // been observed. Keep listening for a late confirmation.
            pending.slow = true;
            emit('slow', pending.track, pending.context);
        }, TIMEOUT_MS);
        try {
            // Exactly one host call; no automatic retry on errors or timeouts.
            host.play(track, context);
        } catch (_) {
            if (pending && pending.sequence === request) {
                cancel();
                var errorTime = host.now();
                budget.restUntil = Number.isFinite(errorTime) && errorTime >= now ? errorTime + REST_MS : Infinity;
                emit('error', track, context);
            }
        }
        return 'started';
    }
    function observe(track, playing) {
        // A matching paused or incomplete snapshot is not confirmation.
        if (!pending || track !== pending.track || playing !== true) return false;
        var success = pending;
        cancel();
        emit('playing', success.track, success.context);
        return true;
    }
    function retry() {
        // Only an explicit Retry gesture can issue another start. Re-check
        // visibility, availability, the current track and every start limit.
        if (!pending || !pending.slow) return 'ignored';
        return tap(pending.track, pending.context);
    }
    return {tap: tap, retry: retry, observe: observe, leave: cancel};
}));
