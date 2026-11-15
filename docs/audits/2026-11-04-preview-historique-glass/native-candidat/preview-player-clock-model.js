/* WORK IN PROGRESS: mathematical model only; not wired into Android Preview.
 * All numbers are milliseconds on a monotonic clock supplied by the caller.
 * The host must identify the current track and report valid progress, actual
 * playing state and whether playback is advancing. This file performs no IO.
 */
(function (root, factory) {
    if (typeof module === 'object' && module.exports) module.exports = factory;
    else root.createPreviewPlayerClock = factory;
}(typeof globalThis === 'object' ? globalThis : this, function createPreviewPlayerClock() {
    'use strict';
    var state = null;
    var lastTime = null;
    var CORRECTION_MS = 4000;
    var DISCONTINUITY_MS = 2000;
    function finite(x) { return typeof x === 'number' && Number.isFinite(x); }
    function clamp(n, hi) { return Math.max(0, Math.min(hi, n)); }
    function valueAt(now) {
        if (!state || !finite(now) || now < state.at || (lastTime !== null && now < lastTime)) return null;
        lastTime = now;
        var dt = now - state.at;
        var correction = state.moving ? state.correction * Math.min(1, dt / CORRECTION_MS) : 0;
        return clamp(state.base + (state.moving ? dt : 0) + correction, state.duration);
    }
    function update(snapshot, now) {
        if (!finite(now) || (lastTime !== null && now < lastTime) || !snapshot ||
            typeof snapshot.track !== 'string' || !snapshot.track ||
            !finite(snapshot.position) || !finite(snapshot.duration) ||
            snapshot.duration <= 0 || snapshot.position < 0 || snapshot.position > snapshot.duration ||
            typeof snapshot.playing !== 'boolean' || typeof snapshot.advancing !== 'boolean') {
            state = null;
            return false;
        }
        var previous = valueAt(now);
        var incoming = snapshot.position;
        var moving = snapshot.playing && snapshot.advancing && incoming < snapshot.duration;
        var reset = !state || previous === null || state.track !== snapshot.track ||
            snapshot.seek === true || Math.abs(previous - incoming) > DISCONTINUITY_MS ||
            !moving || !state.moving;
        state = {
            track: snapshot.track,
            at: now,
            duration: snapshot.duration,
            moving: moving,
            base: reset ? incoming : clamp(previous, snapshot.duration),
            correction: reset ? 0 : incoming - previous
        };
        lastTime = now;
        return true;
    }
    function clear() { state = null; }
    return {update: update, valueAt: valueAt, clear: clear};
}));
