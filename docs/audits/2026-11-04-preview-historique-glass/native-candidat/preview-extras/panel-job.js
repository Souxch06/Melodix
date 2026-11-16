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
            roots: '[data-testid="lyrics-container"], [data-testid="lyrics-page"], [data-testid="lyrics-lyricsContent"]'
        },
        devices: {
            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,
            label: /^(connect to a device|connect to a device\.\.\.|se connecter à un appareil|connecter à un appareil|mit einem gerät verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,
            roots: '[data-testid="device-picker"], [data-testid="connect-device-list"], [data-testid="connect-device-picker"], [role="dialog"][aria-label*="appareil" i], [role="dialog"][aria-label*="device" i]'
        }
    };
    var spec = specs[kind];
    function button() {
        var list = Array.from(document.querySelectorAll('button, [role="button"]')).filter(function(b) {
            return b.isConnected && (spec.ids.test(String(b.getAttribute('data-testid') || '')) || spec.label.test(String(b.getAttribute('aria-label') || '').trim()));
        });
        return list.length === 1 ? list[0] : null;
    }
    function isOpen(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }
    function root(b) {
        var found = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) { return n.isConnected; });
        if (found.length >= 1) return found[0];
        var id = b && b.getAttribute('aria-controls'), c = id ? document.getElementById(id) : null;
        return c && c.isConnected ? c : null;
    }
    function lyricLines(r) {
        var nodes = Array.from(r.querySelectorAll('[data-testid="fullscreen-lyric"], [data-testid="lyrics-line"]'));
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
    function finish(ok, reason) { job.status = 'done'; job.ok = ok; job.reason = reason || ''; }
    try {
        var b = button(), already = root(b);
        if (!b && !already) { log('button:absent'); finish(false, 'absent'); return JSON.stringify({status: 'started'}); }
        var wasOpen = !!already || (b && isOpen(b));
        if (!wasOpen) { try { b.click(); log('opened'); } catch (_) { log('open-error'); finish(false, 'command'); return JSON.stringify({status: 'started'}); } }
        else log('already-open');
        var close = function() {
            if (wasOpen) return;
            setTimeout(function() {
                try { var again = button() || b; if (again && (isOpen(again) || root(again))) { again.click(); log('closed'); } } catch (_) { log('close-error'); }
            }, 120);
        };
        var end = Date.now() + 2500;
        (function step() {
            var r = null;
            try { r = root(button() || b); } catch (_) { r = null; }
            var ready = r && (kind === 'lyrics' ? lyricLines(r).lines.length : deviceRows(r).length);
            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }
            if (!ready) { log(r ? 'rows:0' : 'panel:absent'); finish(false, r ? 'empty' : 'panel'); close(); return; }
            if (kind === 'lyrics') {
                var l = lyricLines(r);
                job.body = l.lines.join('\n'); job.active = l.active; job.synced = l.synced;
                log('lines:' + Math.min(l.lines.length, 200) + (l.synced ? ':sync' : ''));
                finish(true, ''); close(); return;
            }
            var rows = deviceRows(r);
            if (action === 'transfer') {
                var target = rows.filter(function(d) { return d.name === wanted; });
                if (target.length !== 1) { log('target:' + (target.length ? 'ambiguous' : 'absent')); finish(false, 'target'); close(); return; }
                if (target[0].current) { log('target:already-active'); job.transferred = true; finish(true, ''); close(); return; }
                try { target[0].node.click(); log('transfer:click'); } catch (_) { log('transfer:error'); finish(false, 'command'); close(); return; }
                var until = Date.now() + 3000;
                (function verify() {
                    var again = null;
                    try { var r2 = root(button() || b); again = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; })[0] : null; } catch (_) { again = null; }
                    if (again && again.current) { log('transfer:verified'); job.transferred = true; finish(true, ''); close(); return; }
                    if (Date.now() < until) { setTimeout(verify, 200); return; }
                    log('transfer:unverified'); finish(false, 'unverified'); close();
                })();
                return;
            }
            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? '1' : ''].join('\t'); }).join('\n');
            log('devices:' + rows.length);
            finish(true, ''); close();
        })();
        return JSON.stringify({status: 'started'});
    } catch (_) {
        finish(false, 'error');
        return JSON.stringify({status: 'started'});
    }
})
