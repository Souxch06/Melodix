/* WORK IN PROGRESS: state model only, not connected to the Android Preview.
 * A stale player snapshot must not undo a pending user action; a matching
 * snapshot confirms it. A missing confirmation eventually returns to reality.
 * The host performs at most one command per accepted gesture.
 */
(function (root, factory) {
    if (typeof module === 'object' && module.exports) module.exports = factory;
    else root.createOptimisticPlayModel = factory;
}(typeof globalThis === 'object' ? globalThis : this, function createOptimisticPlayModel(host) {
    'use strict';
    var real = null, shown = null, pending = null, lastTap = -Infinity, serial = 0;
    var DEBOUNCE_MS = 750, RECONCILE_MS = 8000;
    function display(value) { if (shown !== value) { shown = value; host.display(value); } }
    function tap() {
        var now = host.now();
        if (!Number.isFinite(now) || now < lastTap || now - lastTap < DEBOUNCE_MS) return 'debounced';
        if (shown === null || real === null) return 'unknown';
        lastTap = now;
        if (pending) host.clearTimer(pending.timer);
        var target = !shown, id = ++serial;
        pending = {id:id, target:target, timer:null};
        display(target);
        pending.timer = host.setTimer(function () {
            if (!pending || pending.id !== id) return;
            pending = null;
            display(real);
            host.unconfirmed();
        }, RECONCILE_MS);
        try { host.command(target); }
        catch (_) {
            if (pending && pending.id === id) {
                host.clearTimer(pending.timer); pending = null; display(real); host.unconfirmed();
            }
        }
        return 'sent';
    }
    function observe(value) {
        if (typeof value !== 'boolean') return false;
        real = value;
        if (pending) {
            if (pending.target !== value) return false;
            host.clearTimer(pending.timer);
            pending = null;
        }
        display(real);
        return true;
    }
    return {tap:tap, observe:observe};
}));
