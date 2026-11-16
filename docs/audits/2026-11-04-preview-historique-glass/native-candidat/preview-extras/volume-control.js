(function(action, requested) {
    'use strict';
    // Spotify player volume only; never Android audio, session data or network.
    // Methods in order, each verified by reading the value again:
    // (a) native range setter + input/change, (b) pointer on the volume track,
    // (c) volume of the page's own media element.
    var journal = [];
    function ranges() {
        return Array.from(document.querySelectorAll('[data-testid="volume-bar"] input[type="range"], input[data-testid="volume-bar"][type="range"]')).filter(function(n) { return n.isConnected; });
    }
    function readRange(input) {
        if (!input) return null;
        var min = input.hasAttribute('min') ? Number(input.min) : 0, max = input.hasAttribute('max') ? Number(input.max) : 100, current = Number(input.value);
        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;
        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};
    }
    function media() {
        return Array.from(document.querySelectorAll('audio, video')).filter(function(m) { return typeof m.volume === 'number' && isFinite(m.volume); });
    }
    var list = ranges(), input = list.length === 1 ? list[0] : null;
    var disabled = input && (input.disabled || input.matches(':disabled') || input.closest('[aria-disabled="true"]'));
    var current = disabled ? null : readRange(input);
    if (action === 'query') {
        if (current) return JSON.stringify({ok: true, percent: current.percent, method: 'range'});
        var players = media();
        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: 'media'});
        return JSON.stringify({ok: false, reason: disabled ? 'disabled' : list.length > 1 ? 'ambiguous' : input ? 'range' : 'absent'});
    }
    var target = Number(requested);
    if (action !== 'set' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: 'request'});
    // Never act on a disabled, duplicated or out-of-range Spotify control.
    if (disabled) return JSON.stringify({ok: false, reason: 'disabled'});
    if (list.length > 1) return JSON.stringify({ok: false, reason: 'ambiguous'});
    if (input && !current) return JSON.stringify({ok: false, reason: 'range'});
    var bar0 = document.querySelector('[data-testid="volume-bar"]');
    if (bar0 && (bar0.getAttribute('aria-disabled') === 'true' || bar0.closest('[aria-disabled="true"], fieldset:disabled'))) return JSON.stringify({ok: false, reason: 'disabled'});
    function near(p) { return p !== null && Math.abs(p - target) <= 2; }
    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join('>')}); }
    // (a) native setter on the unique range.
    if (current) {
        try {
            var value = current.min + (current.max - current.min) * target / 100;
            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value').set;
            setter.call(input, String(value));
            input.dispatchEvent(new Event('input', {bubbles: true}));
            input.dispatchEvent(new Event('change', {bubbles: true}));
            var after = readRange(input);
            if (near(after ? after.percent : null)) { journal.push('a:ok'); return done('range'); }
            journal.push('a:unchanged');
        } catch (_) { journal.push('a:error'); }
    } else journal.push(disabled ? 'a:disabled' : 'a:absent');
    // (b) pointer press at the target position on the visible track.
    try {
        var bar = document.querySelector('[data-testid="volume-bar"]');
        var track = bar && (bar.querySelector('[data-testid="progress-bar"]') || bar.querySelector('[role="slider"]') || bar);
        var box = track ? track.getBoundingClientRect() : null;
        if (box && box.width > 4) {
            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;
            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: 'mouse', isPrimary: true};
            var Pointer = typeof PointerEvent === 'function' ? PointerEvent : MouseEvent;
            track.dispatchEvent(new Pointer('pointerdown', base));
            track.dispatchEvent(new MouseEvent('mousedown', base));
            document.dispatchEvent(new Pointer('pointerup', base));
            document.dispatchEvent(new MouseEvent('mouseup', base));
            var again = readRange(input || (ranges()[0] || null));
            if (near(again ? again.percent : null)) { journal.push('b:ok'); return done('pointer'); }
            journal.push('b:unchanged');
        } else journal.push('b:no-track');
    } catch (_) { journal.push('b:error'); }
    // (c) the page's own media element(s).
    try {
        var players = media();
        if (players.length) {
            players.forEach(function(m) { m.volume = target / 100; });
            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push('c:ok'); return done('media'); }
            journal.push('c:unchanged');
        } else journal.push('c:absent');
    } catch (_) { journal.push('c:error'); }
    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):
    // unverifiable, so reported as sent only, never as a confirmed value.
    try {
        var from = Number(arguments[2]);
        var target2 = document.body;
        var send = function(code, shift) {
            ['keydown', 'keyup'].forEach(function(type) {
                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));
            });
        };
        if (target === 0) { send('ArrowDown', true); journal.push('d:ctrl-shift-down'); return JSON.stringify({ok: true, sent: true, unverified: true, method: 'keyboard', journal: journal.join('>')}); }
        if (isFinite(from) && from >= 0) {
            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));
            for (var k = 0; k < steps; k++) send(target > from ? 'ArrowUp' : 'ArrowDown', false);
            journal.push('d:ctrl-' + (target > from ? 'up' : 'down') + 'x' + steps);
            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: 'keyboard', journal: journal.join('>')});
        } else journal.push('d:no-start');
    } catch (_) { journal.push('d:error'); }
    return JSON.stringify({ok: false, reason: 'command', journal: journal.join('>')});
})
