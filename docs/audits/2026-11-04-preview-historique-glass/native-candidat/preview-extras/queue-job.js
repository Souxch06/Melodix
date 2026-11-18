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
        var selectors = '#queue-panel, [data-testid="queue-page"], [data-testid="queue-view"], [data-testid="queue-panel"], [data-testid="NPV-queue"], aside[aria-label="Queue"], aside[aria-label="File d’attente"], aside[aria-label="File d\'attente"], section[aria-label="Queue"], section[aria-label="File d’attente"], [role="region"][aria-label="Queue"], [role="region"][aria-label="File d’attente"]';
        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches('button, [role="button"], [role="switch"]'); });
        // A chain of nested markers can describe one queue. Keep the outer
        // wrapper so headers and rows belonging to that queue are retained;
        // independent branches remain ambiguous and are never merged.
        if (found.length > 1) {
            var leaves = found.filter(function(n) { return !found.some(function(other) { return other !== n && n.contains(other); }); });
            if (leaves.length === 1) {
                var outer = found.filter(function(n) { return !found.some(function(other) { return other !== n && other.contains(n); }); });
                if (outer.length === 1) return outer[0];
            }
            rootAmbiguous = true; return null;
        }
        if (found.length === 1) return found[0];
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
    // Title fallbacks are permitted only inside a queue-specific region, not
    // an arbitrary aria-controls target or a playlist elsewhere in the page.
    function queueScope(r) {
        if (!r) return false;
        if (/^\/queue(?:\/|$)/.test(String(location.pathname || '')) && r.matches('#main-view, main')) return true;
        if (r.matches('#queue-panel, [data-testid="queue-page"], [data-testid="queue-view"], [data-testid="queue-panel"], [data-testid="NPV-queue"]')) return true;
        return /^(queue|play queue|file d['’]attente|file de lecture|warteschlange|cola( de reproducción)?|fila( de reprodução)?)$/i.test(String(r.getAttribute('aria-label') || '').trim());
    }
    function titleFallback(n) {
        // These are specific track-title markers, not positional text guesses
        // or generic album/artist links. Reject multiple distinct candidates.
        var candidates = Array.from(n.querySelectorAll('[class*="ListRowTitle__ListRowText"]')).filter(function(el) {
            return el.isConnected && !el.closest('button, [role="button"], [role="switch"]') && !hiddenBeforeTap(el) && !!text(el);
        });
        candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });
        return candidates.length === 1 ? candidates[0] : null;
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
        if (!list.length && queueScope(r)) {
            // Newer Encore queue rows may have a title marker without any
            // track href. Only row containers bearing that marker qualify.
            var marked = Array.from(r.querySelectorAll('li, [role="listitem"], [data-encore-id="listRow"]')).filter(function(n) { return !!titleFallback(n); });
            list = marked.filter(function(n) { return !marked.some(function(other) { return other !== n && n.contains(other); }); });
        }
        return list.slice(0, 40).map(function(n) {
            var t = n.querySelector('[data-testid="internal-track-link"], a[href*="/track/"], a[href*="/episode/"], [data-testid="track-title"], [data-testid="context-item-info-title"]');
            if (!t && queueScope(r)) t = titleFallback(n);
            var artists = Array.from(n.querySelectorAll('a[href*="/artist/"], a[href*="/show/"]')).map(text).filter(Boolean);
            if (!artists.length) { var a = n.querySelector('[data-testid="track-artist"], [data-testid="context-item-info-artist"]'); if (a) artists.push(text(a)); }
            if (!artists.length && t && queueScope(r)) {
                var details = Array.from(n.querySelectorAll('[class*="ListRowDetails__ListRowDetailText"]')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });
                if (details.length === 1) artists.push(text(details[0]));
            }
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
    // Failure-only structural fingerprint. Every character is a fixed category
    // or a count capped at 9; no page text, IDs, hrefs or arbitrary labels leave
    // the WebView. This does not read a different panel or perform any action.
    function emptyShape(r, trigger) {
        if (!r) return '';
        var kind = 7;
        if (/^\/queue(?:\/|$)/.test(String(location.pathname || '')) && r.matches('#main-view, main')) kind = 0;
        else if (r.matches('[data-testid="queue-page"]')) kind = 1;
        else if (r.matches('[data-testid="queue-view"]')) kind = 2;
        else if (r.matches('[data-testid="queue-panel"]')) kind = 3;
        else if (r.matches('[data-testid="NPV-queue"]')) kind = 4;
        else if (r.matches('#queue-panel')) kind = 8;
        else if (trigger && trigger.getAttribute('aria-controls') && document.getElementById(trigger.getAttribute('aria-controls')) === r) kind = 5;
        else kind = 6;
        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }
        return 'shape:' + [kind, Math.min(r.children.length,9), count('*'),
            count('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]'),
            count('a[href]'), count('a[href*="/track/"], a[href*="/episode/"]'),
            count('a[href^="spotify:track:"], a[href^="spotify:episode:"]'),
            count('[data-uri], [data-track-uri], [data-spotify-uri]'),
            count('[data-testid*="track" i]'), count('li, [role="listitem"]'),
            count('[role="row"]'), count('[data-testid*="queue" i]'),
            count('[data-encore-id="listRow"]'), String(r.textContent || '').trim() ? 1 : 0].join('');
    }
    // Extra bounded categories diagnose which supported row shapes exist if
    // extraction still fails. Never return selectors, text or attribute values.
    function emptyDetail(r) {
        if (!r) return '';
        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }
        return 'detail:' + [count('#queue-panel'), count('[class*="ListRowTitle__ListRowText"]'),
            count('[class*="ListRowDetails__ListRowDetailText"]'), count('a[href*="/artist/"]'),
            count('a[href*="/album/"]'), count('[data-context-item-type="track"], [data-context-item-type="episode"]'),
            count('[role="gridcell"]'), count('[data-encore-id="text"]'), count('[data-flip-id*="section-header-"]')].join('');
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
        // The close animation and the aria state can settle asynchronously.
        // Inspect for a bounded interval; never send a second close click.
        // If the same unique trigger has no state attributes, a successful
        // panel-specific close plus disappearance of the recognised root is
        // evidence of closure. A replacement trigger, a new visible root, or
        // an ambiguous root is never accepted as confirmation.
        if (!closeAttempted) { done(false); return; }
        var closeDeadline = Date.now() + 900;
        (function verifyClose() {
            setTimeout(function() {
                try {
                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);
                    var after = button();
                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }
                    var explicitlyClosed = after && (after.getAttribute('aria-pressed') === 'false' || after.getAttribute('aria-expanded') === 'false' || after.getAttribute('data-active') === 'false') && !isOpen(after);
                    var noState = after && !after.hasAttribute('aria-pressed') && !after.hasAttribute('aria-expanded') && !after.hasAttribute('data-active');
                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);
                    if (clearlyClosed) { done(true); return; }
                    if (Date.now() < closeDeadline) { verifyClose(); return; }
                    done(false);
                } catch (_) { done(false); }
            }, 150);
        })();
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
                if (r) { log(emptyShape(r, b)); log(emptyDetail(r)); }
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
