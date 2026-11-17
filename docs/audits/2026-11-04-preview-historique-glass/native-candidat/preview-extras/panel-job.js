(function(kind, action, wanted) {
    'use strict';
    // Lyrics and devices drawers. One explicit tap = open the page panel in the
    // hidden page, read it, close it if it was closed. A device transfer is a
    // separate, explicitly confirmed action, verified by re-reading the list.
    // No scrolling, navigation, storage, cookies, tokens or network.
    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};
    if (kind !== 'lyrics' && kind !== 'devices') return JSON.stringify({status: 'done', ok: false, reason: 'kind'});
    if (action === 'poll') return JSON.stringify(jobs[kind] || {status: 'none'});
    if (action !== 'run' && action !== 'transfer') return JSON.stringify({status: 'none'});
    if (jobs[kind] && jobs[kind].status === 'running' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: 'busy'});
    var job = jobs[kind] = {status: 'running', started: Date.now(), ok: false, reason: '', body: '', active: -1, synced: false, transferred: false, journal: []};
    function log(c) { if (job.journal.length < 12) job.journal.push(c); }
    function text(n) { return String(n && n.textContent || '').replace(/\s+/g, ' ').trim().slice(0, 300); }
    var specs = {
        lyrics: {
            ids: /^(lyrics-button|control-button-lyrics)$/i,
            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,
            main: true,
            roots: '[data-testid="lyrics-container"], [data-testid="lyrics-page"], [data-testid="lyrics-lyricsContent"]'
        },
        devices: {
            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,
            label: /^(connect to a device|connect to a device\.\.\.|se connecter à un appareil|connecter à un appareil|appareils disponibles|mit einem gerät verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,
            roots: '[data-testid="device-picker"], [data-testid="connect-device-list"], [data-testid="connect-device-picker"], [role="dialog"][aria-label*="appareil" i], [role="dialog"][aria-label*="device" i]'
        }
    };
    var spec = specs[kind], found = 0, rootAmbiguous = false;
    // Several copies of a control can exist (player bar and full view). Prefer
    // the one in the player bar, then the only visible one; otherwise refuse.
    function pickOne(list) {
        if (list.length <= 1) return list[0] || null;
        var bar = list.filter(function(b) { return !!b.closest('[data-testid="now-playing-bar"]'); });
        if (bar.length === 1) return bar[0];
        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });
        return shown.length === 1 ? shown[0] : null;
    }
    function button() {
        var list = Array.from(document.querySelectorAll('button, [role="button"]')).filter(function(b) {
            return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid') || '')) || spec.label.test(String(b.getAttribute('aria-label') || '').trim()));
        });
        found = list.length;
        return pickOne(list);
    }
    function isOpen(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }
    function root(b) {
        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {
            // Spotify may give the trigger itself a device-picker testid.
            // A button is not its own content panel and must not imply open.
            return n.isConnected && n !== b && !n.matches('button, [role="button"], [role="switch"]');
        });
        // Nested wrappers can describe the same panel; unrelated roots are
        // ambiguous and must never be treated as the current content.
        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });
        if (hits.length === 1) return hits[0];
        if (hits.length > 1) { rootAmbiguous = true; return null; }
        var id = b && b.getAttribute('aria-controls'), c = id ? document.getElementById(id) : null;
        if (c && c !== b && c.isConnected && !c.matches('button, [role="button"], [role="switch"]')) return c;
        if (spec.main) {
            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.
            var main = document.querySelector('#main-view, main');
            return main && main.querySelector('[data-testid*="lyric" i]') ? main : null;
        }
        // Device picker opens as a popover/dialog mentioning devices.
        var pops = Array.from(document.querySelectorAll('[role="dialog"], [data-tippy-root], [id^="tippy"]')).filter(function(n) {
            return n.isConnected && n !== b && /appareil|device|dispositivo|gerät/i.test(String(n.getAttribute('aria-label') || ''));
        });
        if (pops.length > 1) rootAmbiguous = true;
        return pops.length === 1 ? pops[0] : null;
    }
    function lyricLines(r) {
        var nodes = Array.from(r.querySelectorAll('[data-testid="fullscreen-lyric"], [data-testid="lyrics-line"]'));
        if (!nodes.length) nodes = Array.from(r.querySelectorAll('[data-testid*="lyric" i]')).filter(function(n) { return !n.children.length || !n.querySelector('[data-testid*="lyric" i]'); });
        if (!nodes.length) nodes = Array.from(r.querySelectorAll('p'));
        var lines = [], active = -1, synced = false;
        nodes.slice(0, 200).forEach(function(n) {
            var t = text(n); if (!t) return;
            if (n.getAttribute('aria-current') === 'true' || n.getAttribute('data-active') === 'true') { active = lines.length; synced = true; }
            if (n.hasAttribute('data-start-time') || n.hasAttribute('data-time')) synced = true;
            lines.push(t);
        });
        return {lines: lines, active: synced ? active : -1, synced: synced};
    }
    function deviceRows(r) {
        var nodes = Array.from(r.querySelectorAll('[data-testid="device-list-item"], [data-testid="device-picker-row"], [role="option"], li button'));
        var seen = [];
        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {
            var nameNode = n.querySelector('[data-testid="device-name"], [data-encore-id="text"]');
            var name = text(nameNode || n).slice(0, 80);
            var typeNode = n.querySelector('[data-testid="device-type"]');
            var current = n.getAttribute('aria-selected') === 'true' || n.getAttribute('aria-current') === 'true' || n.getAttribute('aria-checked') === 'true';
            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : '', current: current};
        }).filter(function(d) { return d.name; });
    }
    // The page is hidden: a panel (or one of its parents) can measure 0 px, and
    // Spotify then draws no rows in it. Give it a size while it is read, then
    // restore the original inline style exactly. No other change to the page.
    var sized = [];
    function giveSize(r) {
        var h = 0;
        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}
        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {
            var cs = window.getComputedStyle(n), small = false;
            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}
            if (cs.display !== 'none' && cs.visibility !== 'hidden' && !small) continue;
            sized.push([n, n.getAttribute('style')]);
            if (cs.display === 'none') n.style.setProperty('display', 'block', 'important');
            if (cs.visibility === 'hidden') n.style.setProperty('visibility', 'visible', 'important');
            if (small) n.style.setProperty('min-height', '640px', 'important');
        }
        log('sized:' + sized.length + ',h:' + Math.min(h, 9999));
    }
    function restoreSize() {
        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute('style'); else e[0].setAttribute('style', e[1]); } catch (_) {} });
        sized = [];
    }
    var b = null, wasOpen = true, openedHere = false;
    function finish(ok, reason) {
        restoreSize();
        function done(closeOk) {
            if (openedHere) log(closeOk ? 'close:verified' : 'close:unverified');
            job.status = 'done'; job.ok = ok && closeOk;
            job.reason = closeOk ? (reason || '') : 'close-unverified';
        }
        if (!openedHere) { done(true); return; }
        // Only the same explicitly open trigger may be toggled back. Do not
        // click a replacement, a disabled control, or guess at browser history.
        try {
            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && b.getAttribute('aria-disabled') !== 'true') {
                b.click(); log('closed');
            }
        } catch (_) { log('close-error'); }
        setTimeout(function() {
            var remains = null;
            try { remains = root(b); } catch (_) { }
            var hidden = remains && (remains.closest('[hidden], [aria-hidden="true"]') ||
                window.getComputedStyle(remains).display === 'none' || window.getComputedStyle(remains).visibility === 'hidden');
            var after = button();
            var explicitlyClosed = after && (after.getAttribute('aria-pressed') === 'false' || after.getAttribute('aria-expanded') === 'false' || after.getAttribute('data-active') === 'false') && !isOpen(after);
            var clearlyClosed = explicitlyClosed && (!remains || !!hidden);
            done(!!clearlyClosed);
        }, 150);
    }
    try {
        b = button(); var already = root(b);
        if (rootAmbiguous) { log('root:ambiguous'); finish(false, 'ambiguous'); return JSON.stringify({status: 'started'}); }
        if (b && (b.disabled || b.getAttribute('aria-disabled') === 'true') && !already) { log('button:disabled'); finish(false, 'disabled'); return JSON.stringify({status: 'started'}); }
        if (!b && !already) { log(found > 1 ? 'button:ambiguous:' + Math.min(found, 9) : 'button:absent'); finish(false, found > 1 ? 'ambiguous' : 'absent'); return JSON.stringify({status: 'started'}); }
        wasOpen = !!already || (b && isOpen(b));
        if (!wasOpen) { try { openedHere = true; b.click(); log('opened'); } catch (_) { log('open-error'); finish(false, 'command'); return JSON.stringify({status: 'started'}); } }
        else log('already-open');
        var end = Date.now() + 4000, forced = false;
        (function step() {
            var r = null;
            try { r = root(button() || b); } catch (_) { r = null; }
            var ready = r && (kind === 'lyrics' ? lyricLines(r).lines.length : deviceRows(r).length);
            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }
            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }
            if (!ready) { log(r ? 'rows:0' : 'panel:absent'); finish(false, rootAmbiguous ? 'ambiguous' : r ? 'empty' : 'panel'); return; }
            if (kind === 'lyrics') {
                var l = lyricLines(r);
                job.body = l.lines.join('\n'); job.active = l.active; job.synced = l.synced;
                log('lines:' + Math.min(l.lines.length, 200) + (l.synced ? ':sync' : ''));
                finish(true, ''); return;
            }
            var rows = deviceRows(r);
            if (action === 'transfer') {
                var target = rows.filter(function(d) { return d.name === wanted; });
                if (target.length !== 1) { log('target:' + (target.length ? 'ambiguous' : 'absent')); finish(false, 'target'); return; }
                if (target[0].current) { log('target:already-active'); job.transferred = true; finish(true, ''); return; }
                try { target[0].node.click(); log('transfer:click'); } catch (_) { log('transfer:error'); finish(false, 'command'); return; }
                var until = Date.now() + 3000;
                (function verify() {
                    var again = null;
                    try { var r2 = root(button() || b); again = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; })[0] : null; } catch (_) { again = null; }
                    if (again && again.current) { log('transfer:verified'); job.transferred = true; finish(true, ''); return; }
                    if (Date.now() < until) { setTimeout(verify, 200); return; }
                    log('transfer:unverified'); finish(false, 'unverified');
                })();
                return;
            }
            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? '1' : ''].join('\t'); }).join('\n');
            log('devices:' + rows.length);
            finish(true, '');
        })();
        return JSON.stringify({status: 'started'});
    } catch (_) {
        finish(false, 'error');
        return JSON.stringify({status: 'started'});
    }
})
