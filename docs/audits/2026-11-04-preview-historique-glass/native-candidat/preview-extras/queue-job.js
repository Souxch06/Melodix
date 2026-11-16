(function(action) {
    'use strict';
    // Queue drawer source. One explicit tap = open the page's queue panel in the
    // hidden page, read visible rows, then close it if it was closed before.
    // No scrolling, navigation, storage, cookies, tokens or network.
    var W = window;
    if (action === 'poll') return JSON.stringify(W.__melodixQueueJob || {status: 'none'});
    if (action !== 'run') return JSON.stringify({status: 'none'});
    if (W.__melodixQueueJob && W.__melodixQueueJob.status === 'running' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: 'busy'});
    var job = W.__melodixQueueJob = {status: 'running', started: Date.now(), ok: false, reason: '', now: '', next: '', journal: []};
    function log(code) { if (job.journal.length < 12) job.journal.push(code); }
    function text(n) { return String(n && n.textContent || '').replace(/\s+/g, ' ').trim().slice(0, 200); }
    function button() {
        var list = Array.from(document.querySelectorAll('button, [role="button"]')).filter(function(b) {
            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute('data-testid') || '')) ||
                /^(queue|play queue|file d['’]attente|file de lecture|warteschlange|cola de reproducción|cola|fila de reprodução|fila)$/i.test(String(b.getAttribute('aria-label') || '').trim()));
        });
        return list.length === 1 ? list[0] : null;
    }
    function isOpen(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }
    function root(b) {
        var selectors = '[data-testid="queue-page"], [data-testid="queue-view"], [data-testid="queue-panel"], [data-testid="NPV-queue"], aside[aria-label="Queue"], aside[aria-label="File d’attente"], aside[aria-label="File d\'attente"], section[aria-label="Queue"], section[aria-label="File d’attente"], [role="region"][aria-label="Queue"], [role="region"][aria-label="File d’attente"]';
        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });
        if (found.length === 1) return found[0];
        var id = b && b.getAttribute('aria-controls');
        var controlled = id ? document.getElementById(id) : null;
        return controlled && controlled.isConnected ? controlled : null;
    }
    function rows(r) {
        var list = Array.from(r.querySelectorAll('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]')).filter(function(n) {
            return !n.querySelector('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]');
        });
        return list.slice(0, 40).map(function(n) {
            var t = n.querySelector('[data-testid="internal-track-link"], a[href*="/track/"], a[href*="/episode/"], [data-testid="track-title"], [data-testid="context-item-info-title"]');
            var artists = Array.from(n.querySelectorAll('a[href*="/artist/"], a[href*="/show/"]')).map(text).filter(Boolean);
            if (!artists.length) { var a = n.querySelector('[data-testid="track-artist"], [data-testid="context-item-info-artist"]'); if (a) artists.push(text(a)); }
            var duration = '';
            Array.from(n.querySelectorAll('div, span')).some(function(x) {
                if (x.children.length) return false;
                var v = text(x);
                if (/^\d{1,2}:\d{2}(:\d{2})?$/.test(v)) { duration = v; return true; }
                return false;
            });
            return {title: text(t), artist: artists.join(', ').slice(0, 200), duration: duration};
        }).filter(function(x) { return x.title; });
    }
    function finish(ok, reason) { job.status = 'done'; job.ok = ok; job.reason = reason || ''; }
    try {
        var b = button();
        var already = root(b);
        if (!b && !already) { log('button:absent'); finish(false, 'absent'); return JSON.stringify({status: 'started'}); }
        var wasOpen = !!already || (b && isOpen(b));
        if (!wasOpen) { try { b.click(); log('opened'); } catch (_) { log('open-error'); finish(false, 'command'); return JSON.stringify({status: 'started'}); } }
        else log('already-open');
        var end = Date.now() + 2500;
        (function step() {
            var r = null, list = [];
            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }
            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }
            if (list.length) {
                var line = function(x) { return [x.title, x.artist, x.duration].join('\t').replace(/\n/g, ' '); };
                job.now = line(list[0]); job.next = list.slice(1).map(line).join('\n');
                log('rows:' + Math.min(list.length, 40));
                finish(true, '');
            } else { log(r ? 'rows:0' : 'panel:absent'); finish(false, r ? 'empty' : 'panel'); }
            if (!wasOpen) {
                setTimeout(function() {
                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log('closed'); } } catch (_) { log('close-error'); }
                }, 100);
            }
        })();
        return JSON.stringify({status: 'started'});
    } catch (_) {
        finish(false, 'error');
        return JSON.stringify({status: 'started'});
    }
})
