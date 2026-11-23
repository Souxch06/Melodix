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
    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: 'blocked'});
    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === 'running') return JSON.stringify({status: 'busy'});
    var counter = Number(W.__melodixDrawerCounter);
    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;
    var job = jobs[kind] = {status: 'running', started: Date.now(), id: String(Date.now()) + ':' + W.__melodixDrawerCounter, ok: false, reason: '', body: '', active: -1, synced: false, transferred: false, journal: []};
    W.__melodixDrawerLease = job;
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
            // User diagnostic (1022414): 79 lyric elements existed outside the main view (side panel).
            // Use the smallest container holding every lyric line, wherever Spotify put it.
            var ls = Array.from(document.querySelectorAll('[data-testid="fullscreen-lyric"], [data-testid^="lyrics-line"]')).filter(function(n) { return !hiddenBeforeTap(n); });
            if (ls.length) {
                var box = ls[0].parentElement;
                while (box && box !== document.body && !ls.every(function(l) { return box.contains(l); })) box = box.parentElement;
                if (box && box !== document.body) return box;
            }
            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.
            var main = document.querySelector('#main-view, main');
            // The lyrics route can load its lines after the click (user diagnostic 1022413).
            return main && (main.querySelector('[data-testid*="lyric" i]') || /^\/lyrics/.test(location.pathname)) ? main : null;
        }
        // Device picker opens as a popover/dialog mentioning devices.
        var pops = Array.from(document.querySelectorAll('[role="dialog"], [data-tippy-root], [id^="tippy"]')).filter(function(n) {
            return n.isConnected && n !== b && /appareil|device|dispositivo|gerät/i.test(String(n.getAttribute('aria-label') || ''));
        });
        if (pops.length > 1) rootAmbiguous = true;
        if (pops.length === 1) return pops[0];
        // User diagnostic (1022423): the picker is an unlabelled popover holding a device-icon and list-row-title rows.
        // Use the popover/dialog that contains the device icon.
        var icon = Array.from(document.querySelectorAll('[data-testid="device-icon"]')).filter(function(n) { return !hiddenBeforeTap(n); });
        if (icon.length === 1) {
            var box = icon[0].closest('[role="dialog"], [data-tippy-root], [id^="tippy"], [role="menu"], [role="listbox"]');
            if (box && box !== b && box.querySelector('[data-testid="list-row-title"]')) return box;
        }
        return null;
    }
    // Exclude hidden descendants and embedded controls rather than treating
    // all textContent inside a visible lyric element as a line.
    function lyricText(n) {
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
        return parts.join('').replace(/\s+/g, ' ').trim().slice(0, 300);
    }
    function lyricLines(r) {
        // aria-controls by itself may point at unrelated content. Require a
        // lyrics-specific root or a lyrics-specific line marker, not just <p>.
        if (!r.matches(spec.roots) && !r.querySelector('[data-testid="fullscreen-lyric"], [data-testid^="lyrics-line"]')) return {lines: [], active: -1, synced: false};
        var nodes = Array.from(r.querySelectorAll('[data-testid="fullscreen-lyric"], [data-testid="lyrics-line"]'));
        if (!nodes.length) nodes = Array.from(r.querySelectorAll('[data-testid*="lyric" i]')).filter(function(n) {
            // A button such as lyrics-close-button is a control, not a lyric
            // line. Ignoring it lets the paragraph fallback read real lines.
            return !n.closest('button, [role="button"], [role="switch"]') && (!n.children.length || !n.querySelector('[data-testid*="lyric" i]'));
        });
        if (!nodes.length && r.matches(spec.roots)) nodes = Array.from(r.querySelectorAll('p'));
        nodes = nodes.filter(function(n) { return !hiddenBeforeTap(n) && !n.closest('button, [role="button"], [role="switch"]'); });
        var lines = [], active = -1, activeCount = 0, synced = false;
        nodes.slice(0, 200).forEach(function(n) {
            var t = lyricText(n); if (!t) return;
            if (n.getAttribute('aria-current') === 'true' || n.getAttribute('data-active') === 'true') { active = lines.length; activeCount++; synced = true; }
            if (n.hasAttribute('data-start-time') || n.hasAttribute('data-time')) synced = true;
            lines.push(t);
        });
        if (!synced) {
            // User request (1022416): Spotify marks the sung line only by its look - sung and past lines share one
            // colour/opacity, upcoming lines another. The active line is the last one before the upcoming look.
            var looks = [];
            nodes.slice(0, 200).forEach(function(n) { if (!lyricText(n)) return; var cs = window.getComputedStyle(n); looks.push(cs.color + '|' + cs.opacity); });
            var future = looks[looks.length - 1], k = looks.length - 1;
            while (k >= 0 && looks[k] === future) k--;
            if (k >= 0 && k < looks.length - 1 && looks.slice(0, k + 1).every(function(l) { return l !== future; })) { active = k; activeCount = 1; synced = true; }
        }
        return {lines: lines, active: synced && activeCount === 1 ? active : -1, synced: synced};
    }
    function trustedDevices(r) {
        // A trigger's aria-controls alone does not prove the target is Spotify's
        // device picker; never send a transfer into an arbitrary region.
        return !!r && r.matches(spec.roots);
    }
    function deviceRows(r, includeHidden) {
        var nodes = Array.from(r.querySelectorAll('[data-testid="device-list-item"], [data-testid="device-picker-row"], [role="option"], li button'));
        if (!nodes.length) {
            // Newer picker (1022423): one row per list-row-title; the row is its closest clickable ancestor.
            Array.from(r.querySelectorAll('[data-testid="list-row-title"]')).forEach(function(t) {
                var row = t.closest('button, [role="button"], [role="menuitem"], [role="menuitemradio"], li') || t.parentElement;
                if (row && r.contains(row) && nodes.indexOf(row) < 0) nodes.push(row);
            });
        }
        var seen = [];
        nodes = nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return includeHidden || !hiddenBeforeTap(n); });
        // Limit display only. Transfer ambiguity must consider every matching
        // element, including hidden items beyond the first page of results.
        if (!includeHidden) nodes = nodes.slice(0, 30);
        return nodes.map(function(n) {
            var nameNode = n.querySelector('[data-testid="device-name"], [data-testid="list-row-title"], [data-encore-id="text"]');
            var name = text(nameNode || n).slice(0, 80);
            var typeNode = n.querySelector('[data-testid="device-type"]');
            var current = n.getAttribute('aria-selected') === 'true' || n.getAttribute('aria-current') === 'true' || n.getAttribute('aria-checked') === 'true' || !!n.querySelector('[data-testid="device-icon"]');
            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : '', current: current};
        }).filter(function(d) { return d.name; });
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
    // Close only a unique, panel-specific control inside the recognised
    // panel. An ambiguous or generic close button is never used.
    function explicitCloser(r, trigger) {
        if (!r || rootAmbiguous) return null;
        var candidates = Array.from(r.querySelectorAll('button, [role="button"]')).filter(function(n) {
            var id=String(n.getAttribute('data-testid')||'').toLowerCase(), label=String(n.getAttribute('aria-label')||'').trim();
            var known = kind==='lyrics' ? /^(lyrics-close-button|close-lyrics-button)$/.test(id) || /^(close lyrics|hide lyrics|fermer les paroles|masquer les paroles)$/i.test(label) :
                /^(devices-close-button|close-devices-button)$/.test(id) || /^(close devices|close device picker|fermer les appareils|fermer la liste des appareils)$/i.test(label);
            return known && n.isConnected && n!==trigger && !n.disabled && !n.matches(':disabled') && n.getAttribute('aria-disabled')!=='true' &&
                !n.closest('[aria-disabled="true"]') && !hiddenBeforeTap(n);
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
            // User diagnostic (1022415): 74 lyric lines were read, then dropped because Spotify's side panel did not
            // confirm closing. Reading lyrics changes nothing; keep the lines (the drawer stays flagged for recovery).
            job.status = 'done'; job.ok = ok && (closeOk || kind === 'lyrics');
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
        b = button(); var already = root(b);
        if (already && hiddenBeforeTap(already)) already = null;
        if (rootAmbiguous) { log('root:ambiguous'); finish(false, 'ambiguous'); return JSON.stringify({status: 'started', id: job.id}); }
        if (b && (b.disabled || b.matches(':disabled') || b.closest('[aria-disabled="true"]')) && !already) { log('button:disabled'); finish(false, 'disabled'); return JSON.stringify({status: 'started', id: job.id}); }
        if (!b && !already) { log(found > 1 ? 'button:ambiguous:' + Math.min(found, 9) : 'button:absent'); finish(false, found > 1 ? 'ambiguous' : 'absent'); return JSON.stringify({status: 'started', id: job.id}); }
        if (b && !already && hiddenBeforeTap(b)) { log('button:absent'); finish(false, 'absent'); return JSON.stringify({status: 'started', id: job.id}); }
        wasOpen = !!already || (b && isOpen(b));
        if (!wasOpen) { try { openedHere = true; b.click(); log('opened'); } catch (_) { log('open-error'); finish(false, 'command'); return JSON.stringify({status: 'started', id: job.id}); } }
        else log('already-open');
        // Lyrics load over the network after the click: wait longer for them (user diagnostic 1022413).
        var end = Date.now() + (kind === 'lyrics' ? 8000 : 4000), forced = false;
        (function step() {
          try {
            var r = null;
            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null;
            if (kind === 'devices' && action === 'transfer' && r && !trustedDevices(r)) { log('target:absent'); finish(false, 'target'); return; }
            var ready = r && (kind === 'lyrics' ? lyricLines(r).lines.length : deviceRows(r, action === 'transfer').length);
            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }
            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }
            if (!ready && kind === 'devices') {
                // User diagnostic (1022421): the device picker was not found after the click.
                log('dlg:' + Math.min(99, document.querySelectorAll('[role="dialog"], [data-tippy-root], [id^="tippy"], [role="menu"], [role="listbox"]').length));
                (function(scope, re) {
                    // Spotify's own element names (data-testid), never text: which shapes exist, to aim at next time.
                    // Only names made of known structural words: never anything that could carry content.
                    var VOCAB = /^(queue|row|rows|track|tracks|tracklist|list|item|items|device|devices|connect|picker|menu|popover|context|button|container|page|view|panel|name|title|entity|cell|grid|header|content|root|wrapper|cover|image|link|subtitle|now|playing|next|up|from|section|in|the|of|to|cast|speaker|icon|label|type|local|remote|available|current|active|select|selected|close|open|main|npv|sidebar|right|left|card|dialog|modal|tippy|option|options|aside|region|text|artist|album)$/;
                    var kinds = {};
                    Array.from(scope.querySelectorAll('[data-testid]')).forEach(function(n) { var k = String(n.getAttribute('data-testid')).toLowerCase().replace(/[^a-z-]/g, '').slice(0, 30); if (k && (!re || re.test(k)) && k.split('-').every(function(w) { return VOCAB.test(w); })) kinds[k] = (kinds[k] || 0) + 1; });
                    Object.keys(kinds).slice(0, 10).forEach(function(k) { log('tid:' + k + ':' + Math.min(99, kinds[k])); });
                })(document, /device|connect|picker|cast|speaker|popover|context|menu|list/);
            }
            if (!ready && kind === 'lyrics') {
                // Shape only, never text: where the page went and how many lyric-like elements exist.
                var mv = document.querySelector('#main-view, main');
                log('path:' + (/^\/lyrics/.test(location.pathname) ? 'lyrics' : 'other'));
                log('lt:' + Math.min(99, document.querySelectorAll('[data-testid*="lyric" i]').length));
                log('mt:' + Math.min(99, mv ? mv.querySelectorAll('[data-testid]').length : 0));
                log('ll:' + Math.min(99, document.querySelectorAll('[data-testid="fullscreen-lyric"], [data-testid^="lyrics-line"]').length));
                // Kinds of lyric testids present (fixed vocabulary, counts only).
                var kinds = {};
                Array.from(document.querySelectorAll('[data-testid*="lyric" i]')).forEach(function(n) { var k = String(n.getAttribute('data-testid')).toLowerCase().replace(/[^a-z-]/g, '').slice(0, 30); kinds[k] = (kinds[k] || 0) + 1; });
                Object.keys(kinds).slice(0, 6).forEach(function(k) { log('tid:' + k + ':' + Math.min(99, kinds[k])); });
            }
            if (!ready) { log(r ? 'rows:0' : 'panel:absent'); finish(false, rootAmbiguous ? 'ambiguous' : r ? 'empty' : 'panel'); return; }
            if (kind === 'lyrics') {
                var l = lyricLines(r);
                job.body = l.lines.join('\n'); job.active = l.active; job.synced = l.synced;
                log('lines:' + Math.min(l.lines.length, 200) + (l.synced ? ':sync' : ''));
                finish(true, ''); return;
            }
            var rows = deviceRows(r, action === 'transfer');
            if (action === 'transfer') {
                var target = rows.filter(function(d) { return d.name === wanted; });
                if (target.length !== 1) { log('target:' + (target.length ? 'ambiguous' : 'absent')); finish(false, 'target'); return; }
                var targetNode = target[0].node;
                if (targetNode.disabled || targetNode.matches(':disabled') || targetNode.closest('[aria-disabled="true"]') || hiddenBeforeTap(targetNode)) {
                    log('target:disabled'); finish(false, 'target'); return;
                }
                if (rows.filter(function(d) { return d.current; }).length > 1) { log('target:ambiguous'); finish(false, 'target'); return; }
                if (target[0].current) { log('target:already-active'); job.transferred = true; finish(true, ''); return; }
                try { targetNode.click(); log('transfer:click'); } catch (_) { log('transfer:error'); finish(false, 'command'); return; }
                var until = Date.now() + 3000;
                (function verify() {
                  try {
                    var again = null;
                    try {
                        var r2 = root(button() || b), all = r2 === r && trustedDevices(r2) ? deviceRows(r2, true) : [];
                        var matches = all.filter(function(d) { return d.name === wanted; });
                        var activeCount = all.filter(function(d) { return d.current; }).length;
                        // A duplicate, replacement, changed panel or conflicting
                        // active states do not prove the original target is active.
                        again = activeCount === 1 && matches.length === 1 && matches[0].node === targetNode && targetNode.isConnected && !targetNode.disabled && !targetNode.matches(':disabled') && !targetNode.closest('[aria-disabled="true"]') && !hiddenBeforeTap(targetNode) ? matches[0] : null;
                    } catch (_) { again = null; }
                    if (again && again.current) { log('transfer:verified'); job.transferred = true; finish(true, ''); return; }
                    if (Date.now() < until) { setTimeout(verify, 200); return; }
                    log('transfer:unverified'); finish(false, 'unverified');
                  } catch (_) { finish(false, 'error'); }
                })();
                return;
            }
            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? '1' : ''].join('\t'); }).join('\n');
            log('devices:' + rows.length);
            finish(true, '');
          } catch (_) { finish(false, 'error'); }
        })();
        return JSON.stringify({status: 'started', id: job.id});
    } catch (_) {
        finish(false, 'error');
        return JSON.stringify({status: 'started', id: job.id});
    }
})
