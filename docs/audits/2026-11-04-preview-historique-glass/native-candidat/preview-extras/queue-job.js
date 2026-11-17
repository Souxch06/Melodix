(function(action) {
    'use strict';
    // Queue drawer source. One explicit tap = open the page's queue panel in the
    // hidden page, read visible rows, then close it if it was closed before.
    // No scrolling, navigation, storage, cookies, tokens or network.
    var W = window;
    if (action === 'poll') return JSON.stringify(W.__melodixQueueJob || {status: 'none'});
    if (action !== 'run') return JSON.stringify({status: 'none'});
    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: 'blocked'});
    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === 'running') return JSON.stringify({status: 'busy'});
    var counter = Number(W.__melodixDrawerCounter);
    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;
    var job = W.__melodixQueueJob = {status: 'running', started: Date.now(), id: String(Date.now()) + ':' + W.__melodixDrawerCounter, ok: false, reason: '', now: '', next: '', journal: []};
    W.__melodixDrawerLease = job;
    function log(code) { if (job.journal.length < 12) job.journal.push(code); }
    function text(n) { return String(n && n.textContent || '').replace(/\s+/g, ' ').trim().slice(0, 200); }
    // Several copies of a control can exist (player bar and full view). Prefer
    // the one in the player bar, then the only visible one; otherwise refuse.
    function pickOne(list) {
        if (list.length <= 1) return list[0] || null;
        var bar = list.filter(function(b) { return !!b.closest('[data-testid="now-playing-bar"]'); });
        if (bar.length === 1) return bar[0];
        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });
        return shown.length === 1 ? shown[0] : null;
    }
    var found = 0, rootAmbiguous = false;
    function button() {
        var list = Array.from(document.querySelectorAll('button, [role="button"]')).filter(function(b) {
            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute('data-testid') || '')) ||
                /^(queue|play queue|file d['’]attente|file de lecture|warteschlange|cola de reproducción|cola|fila de reprodução|fila)$/i.test(String(b.getAttribute('aria-label') || '').trim()));
        });
        found = list.length;
        return pickOne(list);
    }
    function isOpen(b) { return b.getAttribute('aria-pressed') === 'true' || b.getAttribute('aria-expanded') === 'true' || b.getAttribute('data-active') === 'true'; }
    function root(b) {
        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.
        if (/^\/queue(?:\/|$)/.test(String(location.pathname || ''))) {
            var mainView = document.querySelector('#main-view, main');
            if (mainView && mainView.isConnected) return mainView;
        }
        var selectors = '[data-testid="queue-page"], [data-testid="queue-view"], [data-testid="queue-panel"], [data-testid="NPV-queue"], aside[aria-label="Queue"], aside[aria-label="File d’attente"], aside[aria-label="File d\'attente"], section[aria-label="Queue"], section[aria-label="File d’attente"], [role="region"][aria-label="Queue"], [role="region"][aria-label="File d’attente"]';
        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches('button, [role="button"], [role="switch"]'); });
        if (found.length === 1) return found[0];
        if (found.length > 1) { rootAmbiguous = true; return null; }
        var id = b && b.getAttribute('aria-controls');
        var controlled = id ? document.getElementById(id) : null;
        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches('button, [role="button"], [role="switch"]')) return controlled;
        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.
        var labelled = Array.from(document.querySelectorAll('aside, section, [role="region"], [role="complementary"], [role="dialog"], div[aria-label]')).filter(function(n) {
            return n.isConnected && /^(queue|play queue|file d['’]attente|file de lecture|warteschlange|cola( de reproducción)?|fila( de reprodução)?)$/i.test(String(n.getAttribute('aria-label') || '').trim());
        });
        if (labelled.length > 1) { rootAmbiguous = true; return null; }
        return labelled.length === 1 ? labelled[0] : null;
    }
    function rows(r) {
        var list = Array.from(r.querySelectorAll('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]')).filter(function(n) {
            return !n.querySelector('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]');
        });
        if (!list.length) {
            // No row markers: one row per track link, its closest list item or row-like block.
            var seen = [];
            Array.from(r.querySelectorAll('a[href*="/track/"], a[href*="/episode/"]')).forEach(function(a) {
                var row = a.closest('li, [role="listitem"], [draggable="true"], [data-encore-id="listRow"]') || a.parentElement && a.parentElement.parentElement || a;
                if (seen.indexOf(row) < 0) seen.push(row);
            });
            list = seen;
        }
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
            return {title: text(t), artist: artists.join(', ').slice(0, 200), duration: duration, current: n.getAttribute('aria-current') === 'true' || n.getAttribute('data-testid') === 'queue-now-playing'};
        }).filter(function(x) { return x.title; });
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
    // Only an explicitly named queue close control inside the recognised
    // panel is eligible; generic close buttons elsewhere are never clicked.
    function explicitCloser(r, trigger) {
        if (!r || rootAmbiguous) return null;
        var candidates = Array.from(r.querySelectorAll('button, [role="button"]')).filter(function(n) {
            var id=String(n.getAttribute('data-testid')||'').toLowerCase(), label=String(n.getAttribute('aria-label')||'').trim();
            return n.isConnected && n!==trigger && !n.disabled && !n.matches(':disabled') && n.getAttribute('aria-disabled')!=='true' &&
                !n.closest('[aria-disabled="true"]') && !hiddenBeforeTap(n) &&
                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d['’]attente|masquer la file d['’]attente)$/i.test(label));
        });
        return candidates.length===1 ? candidates[0] : null;
    }
    // A connected but hidden panel is not evidence that it was open before
    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.
    function hiddenBeforeTap(n) {
        if (!n) return false;
        try {
            for (var el=n; el && el !== document.body; el=el.parentElement) {
                var cs=window.getComputedStyle(el);
                if (el.hasAttribute('hidden') || el.getAttribute('aria-hidden')==='true' || cs.display==='none' || cs.visibility==='hidden') return true;
            }
            return false;
        } catch (e) { throw e; }
    }
    var b = null, wasOpen = true, openedHere = false, finishing = false;
    function finish(ok, reason) {
        if (finishing) return;
        finishing = true;
        restoreSize();
        function done(closeOk) {
            if (openedHere) log(closeOk ? 'close:verified' : 'close:unverified');
            job.status = 'done'; job.ok = ok && closeOk;
            job.reason = closeOk ? (reason || '') : 'close-unverified';
            if (!closeOk) W.__melodixDrawerUnsafe = true;
            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;
        }
        if (!openedHere) { done(true); return; }
        // Prefer the exact open trigger; otherwise use only a unique explicit
        // close control scoped to this recognised panel. Never guess history.
        var closeAttempted = false;
        try {
            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && !b.matches(':disabled') && !b.closest('[aria-disabled="true"]')) {
                b.click(); closeAttempted = true; log('closed');
            } else {
                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);
                if (closer) { closer.click(); closeAttempted = true; log('close:button'); }
            }
        } catch (_) { log('close-error'); }
        setTimeout(function() {
            try {
                var remains = root(b);
                var hidden = remains && (remains.closest('[hidden], [aria-hidden="true"]') ||
                    window.getComputedStyle(remains).display === 'none' || window.getComputedStyle(remains).visibility === 'hidden');
                var after = button();
                var explicitlyClosed = after && (after.getAttribute('aria-pressed') === 'false' || after.getAttribute('aria-expanded') === 'false' || after.getAttribute('data-active') === 'false') && !isOpen(after);
                var clearlyClosed = closeAttempted && !rootAmbiguous && explicitlyClosed && (!remains || !!hidden);
                done(!!clearlyClosed);
            } catch (_) { done(false); }
        }, 150);
    }
    try {
        b = button();
        var already = root(b);
        if (already && hiddenBeforeTap(already)) already = null;
        if (rootAmbiguous) { log('root:ambiguous'); finish(false, 'ambiguous'); return JSON.stringify({status: 'started', id: job.id}); }
        if (b && (b.disabled || b.matches(':disabled') || b.closest('[aria-disabled="true"]')) && !already) { log('button:disabled'); finish(false, 'disabled'); return JSON.stringify({status: 'started', id: job.id}); }
        if (!b && !already) { log(found > 1 ? 'button:ambiguous:' + Math.min(found, 9) : 'button:absent'); finish(false, found > 1 ? 'ambiguous' : 'absent'); return JSON.stringify({status: 'started', id: job.id}); }
        wasOpen = !!already || (b && isOpen(b));
        if (!wasOpen) { try { openedHere = true; b.click(); log('opened'); } catch (_) { log('open-error'); finish(false, 'command'); return JSON.stringify({status: 'started', id: job.id}); } }
        else log('already-open');
        var end = Date.now() + 4500, forced = false;
        (function step() {
          try {
            var r = null, list = [];
            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];
            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }
            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }
            if (list.length) {
                var line = function(x) { return [x.title, x.artist, x.duration].join('\t').replace(/\n/g, ' '); };
                var marked = list.filter(function(x) { return x.current; });
                job.now = marked.length === 1 ? line(marked[0]) : '';
                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join('\n');
                log('rows:' + Math.min(list.length, 40));
                finish(true, '');
            } else {
                log(r ? 'rows:0' : 'panel:absent');
                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.
                log('path:' + (/^\/queue(?:\/|$)/.test(String(location.pathname || '')) ? 'queue' : 'other'));
                log('links:' + Math.min(r ? r.querySelectorAll('a[href*="/track/"], a[href*="/episode/"]').length : 0, 99));
                log('rowsdoc:' + Math.min(document.querySelectorAll('[data-testid="tracklist-row"], [role="row"]').length, 99));
                finish(false, rootAmbiguous ? 'ambiguous' : r ? 'empty' : 'panel');
            }
          } catch (_) { finish(false, 'error'); }
        })();
        return JSON.stringify({status: 'started', id: job.id});
    } catch (_) {
        finish(false, 'error');
        return JSON.stringify({status: 'started', id: job.id});
    }
})
