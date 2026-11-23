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
    // textContent includes aria-hidden nodes and embedded controls. Only read
    // visible text, with a bounded walk, so hidden metadata cannot leak into a title.
    function text(n) {
        if (!n || hiddenBeforeTap(n)) return '';
        var parts = [], visited = 0;
        function walk(node) {
            if (++visited > 1000) return;
            if (node.nodeType === 3) { parts.push(node.nodeValue || ''); return; }
            if (node.nodeType !== 1) return;
            if (node !== n) {
                if (node.matches('button, [role="button"], [role="switch"]') || node.hasAttribute('hidden') || node.getAttribute('aria-hidden') === 'true') return;
                var cs = window.getComputedStyle(node);
                if (cs.display === 'none' || cs.visibility === 'hidden') return;
            }
            if (node.tagName === 'BR') parts.push(' ');
            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);
        }
        walk(n);
        return parts.join('').replace(/\s+/g, ' ').trim().slice(0, 200);
    }
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
    // Spotify's queue may use an explicit Encore title rather than a track
    // link. This is limited to actual rows under #queue-panel, never a
    // neighbouring history or an arbitrary aria-controls target.
    function semanticTitle(n) {
        if (!n.closest('#queue-panel')) return null;
        var titles = Array.from(n.querySelectorAll('[data-encore-id="listRowTitle"]')).filter(function(el) {
            if (!el.isConnected || hiddenBeforeTap(el) || !text(el) || el.closest('button, [role="switch"]') || el.querySelector('a[href*="/artist/"], [data-encore-id="listRowSubtitle"]')) return false;
            var clickable = el.closest('[role="button"]');
            // A row itself may be clickable; a separate action control is not a song.
            return !clickable || (n.contains(clickable) && !!clickable.querySelector('[data-encore-id="listRowSubtitle"]'));
        });
        titles = titles.filter(function(el) { return !titles.some(function(other) { return other !== el && el.contains(other); }); });
        return titles.length === 1 ? titles[0] : null;
    }
    function rows(r) {
        if (!queueScope(r)) return [];
        // A labelled outer sidebar can contain both queue and listening history.
        // If there is an explicit queue panel, read only that subtree.
        var panels = r.matches('#queue-panel') ? [r] : Array.from(r.querySelectorAll('#queue-panel'));
        if (panels.length > 1) return [];
        var scope = panels.length === 1 ? panels[0] : r;
        var list = Array.from(scope.querySelectorAll('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]')).filter(function(n) {
            return !hiddenBeforeTap(n) && !n.closest('#history-panel') && !n.querySelector('[data-testid="queue-tracklist-row"], [data-testid="tracklist-row"], [role="row"]');
        });
        if (!list.length) {
            // No row markers: one row per track link, its closest list item or row-like block.
            var seen = [];
            Array.from(scope.querySelectorAll('a[href*="/track/"], a[href*="/episode/"]')).forEach(function(a) {
                var row = a.closest('li, [role="listitem"], [draggable="true"], [data-encore-id="listRow"]') || a.parentElement && a.parentElement.parentElement || a;
                if (!hiddenBeforeTap(a) && !hiddenBeforeTap(row) && !a.closest('#history-panel') && seen.indexOf(row) < 0) seen.push(row);
            });
            list = seen;
        }
        if (!list.length && queueScope(r)) {
            // Newer Encore queue rows may have a title marker without any
            // track href. Only row containers bearing that marker qualify.
            var marked = Array.from(scope.querySelectorAll('li, [role="listitem"], [data-encore-id="listRow"]')).filter(function(n) { return !hiddenBeforeTap(n) && !n.closest('#history-panel') && (!!semanticTitle(n) || !!titleFallback(n)); });
            list = marked.filter(function(n) { return !marked.some(function(other) { return other !== n && n.contains(other); }); });
        }
        var byImage = false;
        if (!list.length) {
            // User diagnostic (1022422): the queue panel held 50 entity-image elements and no row/track markers.
            // One row per image: climb while the parent still holds only this image.
            var imgs = Array.from(scope.querySelectorAll('[data-testid="entity-image"]')).filter(function(i) { return !hiddenBeforeTap(i) && !i.closest('#history-panel'); });
            imgs.forEach(function(img) {
                var row = img;
                while (row.parentElement && row.parentElement !== scope && row.parentElement.querySelectorAll('[data-testid="entity-image"]').length === 1) row = row.parentElement;
                if (row !== img && list.indexOf(row) < 0) list.push(row);
            });
            byImage = list.length > 0;
        }
        // Scan beyond invalid/placeholder rows, but cap the work. Only the
        // first 40 validated rows are ultimately returned.
        var output = [];
        list.slice(0, 400).some(function(n) {
            var candidates = Array.from(n.querySelectorAll('[data-testid="internal-track-link"], a[href*="/track/"], a[href*="/episode/"], [data-testid="track-title"], [data-testid="context-item-info-title"]')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });
            candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });
            if (candidates.length > 1) return false;
            var t = candidates[0] || null;
            var semantic = !t ? semanticTitle(n) : null;
            if (!t) t = semantic;
            if (!t && queueScope(r)) t = titleFallback(n);
            if (!t && byImage) {
                // Visible leaf texts of the row, in order: title, then artist (controls and durations excluded).
                var leaves = [];
                Array.from(n.querySelectorAll('*')).forEach(function(e) {
                    if (e.children.length || hiddenBeforeTap(e) || e.closest('button, [role="button"]')) return;
                    var v = text(e); if (v && !/^\d{1,2}:\d{2}(:\d{2})?$/.test(v) && leaves.indexOf(v) < 0) leaves.push(v);
                });
                if (leaves.length) { output.push({title: leaves[0].slice(0, 200), artist: (leaves[1] || '').slice(0, 200), duration: '', current: output.length === 0 && byImage}); }
                return output.length >= 40;
            }
            var artistRoot = semantic ? n.querySelector('[data-encore-id="listRowSubtitle"]') : n;
            var artists = artistRoot ? Array.from(artistRoot.querySelectorAll('a[href*="/artist/"], a[href*="/show/"]')).filter(function(el) { return !hiddenBeforeTap(el); }).map(text).filter(Boolean) : [];
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
            var item = {title: text(t), artist: artists.join(', ').slice(0, 200), duration: duration, current: n.getAttribute('aria-current') === 'true' || n.getAttribute('data-testid') === 'queue-now-playing'};
            if (item.title) output.push(item);
            return output.length >= 40;
        });
        return output;
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
    function semanticDetail(r) {
        var panels = Array.from(r.querySelectorAll('#queue-panel'));
        if (r.matches('#queue-panel')) panels.unshift(r);
        if (panels.length !== 1) return 'sem:' + Math.min(panels.length, 9) + '0000';
        var panel = panels[0], titles = Array.from(panel.querySelectorAll('[data-encore-id="listRowTitle"]'));
        var rowCount = Array.from(panel.querySelectorAll('li, [role="listitem"], [role="row"], [data-encore-id="listRow"]')).filter(function(n) { return !!semanticTitle(n); }).length;
        return 'sem:' + [1, Math.min(titles.length,9), Math.min(panel.querySelectorAll('[data-encore-id="listRowSubtitle"]').length,9), Math.min(rowCount,9), Math.min(titles.filter(hiddenBeforeTap).length,9)].join('');
    }
    // Temporarily size zero-height containers. Restore only properties that
    // still have our value, preserving concurrent changes made by Spotify.
    var sized = [];
    function giveSize(r) {
        var h = 0;
        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}
        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {
            var cs = window.getComputedStyle(n), small = false;
            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}
            if (cs.display !== 'none' && cs.visibility !== 'hidden' && !small) continue;
            var entry = {node:n, hadStyle:n.hasAttribute('style'), props:[]};
            sized.push(entry);
            function set(prop, value) {
                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);
                n.style.setProperty(prop, value, 'important');
            }
            if (cs.display === 'none') set('display', 'block');
            if (cs.visibility === 'hidden') set('visibility', 'visible');
            if (small) set('min-height', '640px');
        }
        log('sized:' + sized.length + ',h:' + Math.min(h, 9999));
    }
    function restoreSize() {
        sized.forEach(function(e) { try {
            e.props.forEach(function(p) {
                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== 'important') return;
                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);
            });
            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute('style');
        } catch (_) {} });
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
            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(':disabled') && !b.closest('[aria-disabled="true"]')) {
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
        if (b && !already && hiddenBeforeTap(b)) { log('button:absent'); finish(false, 'absent'); return JSON.stringify({status: 'started', id: job.id}); }
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
                if (r) { log(emptyShape(r, b)); log(emptyDetail(r)); log(semanticDetail(r)); }
                // User diagnostic (1022421): rows:0 in the panel but 99 rows in the page.
                (function(scope, re) {
                    // Spotify's own element names (data-testid), never text: which shapes exist, to aim at next time.
                    // Only names made of known structural words: never anything that could carry content.
                    var VOCAB = /^(queue|row|rows|track|tracks|tracklist|list|item|items|device|devices|connect|picker|menu|popover|context|button|container|page|view|panel|name|title|entity|cell|grid|header|content|root|wrapper|cover|image|link|subtitle|now|playing|next|up|from|section|in|the|of|to|cast|speaker|icon|label|type|local|remote|available|current|active|select|selected|close|open|main|npv|sidebar|right|left|card|dialog|modal|tippy|option|options|aside|region|text|artist|album)$/;
                    var kinds = {};
                    Array.from(scope.querySelectorAll('[data-testid]')).forEach(function(n) { var k = String(n.getAttribute('data-testid')).toLowerCase().replace(/[^a-z-]/g, '').slice(0, 30); if (k && (!re || re.test(k)) && k.split('-').every(function(w) { return VOCAB.test(w); })) kinds[k] = (kinds[k] || 0) + 1; });
                    Object.keys(kinds).slice(0, 10).forEach(function(k) { log('tid:' + k + ':' + Math.min(99, kinds[k])); });
                })(r || document, r ? null : /queue|row|track|next/);
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
