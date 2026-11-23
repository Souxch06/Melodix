.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# static fields
.field private static final PANEL_JOB:Ljava/lang/String; = "(function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    W.__melodixDrawerLease = job;\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            main: true,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0, rootAmbiguous = false;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {\n            // Spotify may give the trigger itself a device-picker testid.\n            // A button is not its own content panel and must not imply open.\n            return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');\n        });\n        // Nested wrappers can describe the same panel; unrelated roots are\n        // ambiguous and must never be treated as the current content.\n        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });\n        if (hits.length === 1) return hits[0];\n        if (hits.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        if (c && c !== b && c.isConnected && !c.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return c;\n        if (spec.main) {\n            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.\n            var main = document.querySelector(\'#main-view, main\');\n            return main && main.querySelector(\'[data-testid*=\"lyric\" i]\') ? main : null;\n        }\n        // Device picker opens as a popover/dialog mentioning devices.\n        var pops = Array.from(document.querySelectorAll(\'[role=\"dialog\"], [data-tippy-root], [id^=\"tippy\"]\')).filter(function(n) {\n            return n.isConnected && n !== b && /appareil|device|dispositivo|ger\u00e4t/i.test(String(n.getAttribute(\'aria-label\') || \'\'));\n        });\n        if (pops.length > 1) rootAmbiguous = true;\n        return pops.length === 1 ? pops[0] : null;\n    }\n    // Exclude hidden descendants and embedded controls rather than treating\n    // all textContent inside a visible lyric element as a line.\n    function lyricText(n) {\n        if (!n || hiddenBeforeTap(n)) return \'\';\n        var parts = [], visited = 0;\n        function walk(node) {\n            if (++visited > 1000) return;\n            if (node.nodeType === 3) { parts.push(node.nodeValue || \'\'); return; }\n            if (node.nodeType !== 1) return;\n            if (node !== n) {\n                if (node.matches(\'button, [role=\"button\"], [role=\"switch\"]\') || node.hasAttribute(\'hidden\') || node.getAttribute(\'aria-hidden\') === \'true\') return;\n                var cs = window.getComputedStyle(node);\n                if (cs.display === \'none\' || cs.visibility === \'hidden\') return;\n            }\n            if (node.tagName === \'BR\') parts.push(\' \');\n            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);\n        }\n        walk(n);\n        return parts.join(\'\').replace(/\\s+/g, \' \').trim().slice(0, 300);\n    }\n    function lyricLines(r) {\n        // aria-controls by itself may point at unrelated content. Require a\n        // lyrics-specific root or a lyrics-specific line marker, not just <p>.\n        if (!r.matches(spec.roots) && !r.querySelector(\'[data-testid=\"fullscreen-lyric\"], [data-testid^=\"lyrics-line\"]\')) return {lines: [], active: -1, synced: false};\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'[data-testid*=\"lyric\" i]\')).filter(function(n) {\n            // A button such as lyrics-close-button is a control, not a lyric\n            // line. Ignoring it lets the paragraph fallback read real lines.\n            return !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && (!n.children.length || !n.querySelector(\'[data-testid*=\"lyric\" i]\'));\n        });\n        if (!nodes.length && r.matches(spec.roots)) nodes = Array.from(r.querySelectorAll(\'p\'));\n        nodes = nodes.filter(function(n) { return !hiddenBeforeTap(n) && !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        var lines = [], active = -1, activeCount = 0, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = lyricText(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; activeCount++; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced && activeCount === 1 ? active : -1, synced: synced};\n    }\n    function trustedDevices(r) {\n        // A trigger\'s aria-controls alone does not prove the target is Spotify\'s\n        // device picker; never send a transfer into an arbitrary region.\n        return !!r && r.matches(spec.roots);\n    }\n    function deviceRows(r, includeHidden) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        nodes = nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return includeHidden || !hiddenBeforeTap(n); });\n        // Limit display only. Transfer ambiguity must consider every matching\n        // element, including hidden items beyond the first page of results.\n        if (!includeHidden) nodes = nodes.slice(0, 30);\n        return nodes.map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    // Temporarily size zero-height containers. Restore only properties that\n    // still have our value, preserving concurrent changes made by Spotify.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            var entry = {node:n, hadStyle:n.hasAttribute(\'style\'), props:[]};\n            sized.push(entry);\n            function set(prop, value) {\n                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);\n                n.style.setProperty(prop, value, \'important\');\n            }\n            if (cs.display === \'none\') set(\'display\', \'block\');\n            if (cs.visibility === \'hidden\') set(\'visibility\', \'visible\');\n            if (small) set(\'min-height\', \'640px\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try {\n            e.props.forEach(function(p) {\n                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== \'important\') return;\n                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);\n            });\n            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute(\'style\');\n        } catch (_) {} });\n        sized = [];\n    }\n    // Close only a unique, panel-specific control inside the recognised\n    // panel. An ambiguous or generic close button is never used.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            var known = kind===\'lyrics\' ? /^(lyrics-close-button|close-lyrics-button)$/.test(id) || /^(close lyrics|hide lyrics|fermer les paroles|masquer les paroles)$/i.test(label) :\n                /^(devices-close-button|close-devices-button)$/.test(id) || /^(close devices|close device picker|fermer les appareils|fermer la liste des appareils)$/i.test(label);\n            return known && n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n);\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button(); var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && !already && hiddenBeforeTap(b)) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4000, forced = false;\n        (function step() {\n          try {\n            var r = null;\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null;\n            if (kind === \'devices\' && action === \'transfer\' && r && !trustedDevices(r)) { log(\'target:absent\'); finish(false, \'target\'); return; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r, action === \'transfer\').length);\n            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\'); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); return;\n            }\n            var rows = deviceRows(r, action === \'transfer\');\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); return; }\n                var targetNode = target[0].node;\n                if (targetNode.disabled || targetNode.matches(\':disabled\') || targetNode.closest(\'[aria-disabled=\"true\"]\') || hiddenBeforeTap(targetNode)) {\n                    log(\'target:disabled\'); finish(false, \'target\'); return;\n                }\n                if (rows.filter(function(d) { return d.current; }).length > 1) { log(\'target:ambiguous\'); finish(false, \'target\'); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); return; }\n                try { targetNode.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                  try {\n                    var again = null;\n                    try {\n                        var r2 = root(button() || b), all = r2 === r && trustedDevices(r2) ? deviceRows(r2, true) : [];\n                        var matches = all.filter(function(d) { return d.name === wanted; });\n                        var activeCount = all.filter(function(d) { return d.current; }).length;\n                        // A duplicate, replacement, changed panel or conflicting\n                        // active states do not prove the original target is active.\n                        again = activeCount === 1 && matches.length === 1 && matches[0].node === targetNode && targetNode.isConnected && !targetNode.disabled && !targetNode.matches(\':disabled\') && !targetNode.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(targetNode) ? matches[0] : null;\n                    } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\');\n                  } catch (_) { finish(false, \'error\'); }\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\');\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n"

.field private static final PANEL_PROBE:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');});\n    var controls={\n        queue:/^(control-button-queue|queue-button)$/i,\n        lyrics:/^(lyrics-button|control-button-lyrics)$/i,\n        devices:/^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i\n    };\n    var labels={\n        queue:/^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i,\n        lyrics:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n        devices:/^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i\n    };\n    var triggers=Array.from(document.querySelectorAll(\'button,[role=\"button\"]\')).filter(function(b){\n        return b.isConnected && (controls[kind].test(String(b.getAttribute(\'data-testid\')||\'\')) || labels[kind].test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        controls:Math.min(triggers.length,99), buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n"

.field private static final PANEL_READ:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n"

.field private static final QUEUE_JOB:Ljava/lang/String; = "(function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    W.__melodixDrawerLease = job;\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    // textContent includes aria-hidden nodes and embedded controls. Only read\n    // visible text, with a bounded walk, so hidden metadata cannot leak into a title.\n    function text(n) {\n        if (!n || hiddenBeforeTap(n)) return \'\';\n        var parts = [], visited = 0;\n        function walk(node) {\n            if (++visited > 1000) return;\n            if (node.nodeType === 3) { parts.push(node.nodeValue || \'\'); return; }\n            if (node.nodeType !== 1) return;\n            if (node !== n) {\n                if (node.matches(\'button, [role=\"button\"], [role=\"switch\"]\') || node.hasAttribute(\'hidden\') || node.getAttribute(\'aria-hidden\') === \'true\') return;\n                var cs = window.getComputedStyle(node);\n                if (cs.display === \'none\' || cs.visibility === \'hidden\') return;\n            }\n            if (node.tagName === \'BR\') parts.push(\' \');\n            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);\n        }\n        walk(n);\n        return parts.join(\'\').replace(/\\s+/g, \' \').trim().slice(0, 200);\n    }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0, rootAmbiguous = false;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\'))) {\n            var mainView = document.querySelector(\'#main-view, main\');\n            if (mainView && mainView.isConnected) return mainView;\n        }\n        var selectors = \'#queue-panel, [data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        // A chain of nested markers can describe one queue. Keep the outer\n        // wrapper so headers and rows belonging to that queue are retained;\n        // independent branches remain ambiguous and are never merged.\n        if (found.length > 1) {\n            var leaves = found.filter(function(n) { return !found.some(function(other) { return other !== n && n.contains(other); }); });\n            if (leaves.length === 1) {\n                var outer = found.filter(function(n) { return !found.some(function(other) { return other !== n && other.contains(n); }); });\n                if (outer.length === 1) return outer[0];\n            }\n            rootAmbiguous = true; return null;\n        }\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return controlled;\n        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.\n        var labelled = Array.from(document.querySelectorAll(\'aside, section, [role=\"region\"], [role=\"complementary\"], [role=\"dialog\"], div[aria-label]\')).filter(function(n) {\n            return n.isConnected && /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(n.getAttribute(\'aria-label\') || \'\').trim());\n        });\n        if (labelled.length > 1) { rootAmbiguous = true; return null; }\n        return labelled.length === 1 ? labelled[0] : null;\n    }\n    // Title fallbacks are permitted only inside a queue-specific region, not\n    // an arbitrary aria-controls target or a playlist elsewhere in the page.\n    function queueScope(r) {\n        if (!r) return false;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) return true;\n        if (r.matches(\'#queue-panel, [data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"]\')) return true;\n        return /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(r.getAttribute(\'aria-label\') || \'\').trim());\n    }\n    function titleFallback(n) {\n        // These are specific track-title markers, not positional text guesses\n        // or generic album/artist links. Reject multiple distinct candidates.\n        var candidates = Array.from(n.querySelectorAll(\'[class*=\"ListRowTitle__ListRowText\"]\')).filter(function(el) {\n            return el.isConnected && !el.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && !hiddenBeforeTap(el) && !!text(el);\n        });\n        candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });\n        return candidates.length === 1 ? candidates[0] : null;\n    }\n    // Spotify\'s queue may use an explicit Encore title rather than a track\n    // link. This is limited to actual rows under #queue-panel, never a\n    // neighbouring history or an arbitrary aria-controls target.\n    function semanticTitle(n) {\n        if (!n.closest(\'#queue-panel\')) return null;\n        var titles = Array.from(n.querySelectorAll(\'[data-encore-id=\"listRowTitle\"]\')).filter(function(el) {\n            if (!el.isConnected || hiddenBeforeTap(el) || !text(el) || el.closest(\'button, [role=\"switch\"]\') || el.querySelector(\'a[href*=\"/artist/\"], [data-encore-id=\"listRowSubtitle\"]\')) return false;\n            var clickable = el.closest(\'[role=\"button\"]\');\n            // A row itself may be clickable; a separate action control is not a song.\n            return !clickable || (n.contains(clickable) && !!clickable.querySelector(\'[data-encore-id=\"listRowSubtitle\"]\'));\n        });\n        titles = titles.filter(function(el) { return !titles.some(function(other) { return other !== el && el.contains(other); }); });\n        return titles.length === 1 ? titles[0] : null;\n    }\n    function rows(r) {\n        if (!queueScope(r)) return [];\n        // A labelled outer sidebar can contain both queue and listening history.\n        // If there is an explicit queue panel, read only that subtree.\n        var panels = r.matches(\'#queue-panel\') ? [r] : Array.from(r.querySelectorAll(\'#queue-panel\'));\n        if (panels.length > 1) return [];\n        var scope = panels.length === 1 ? panels[0] : r;\n        var list = Array.from(scope.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !hiddenBeforeTap(n) && !n.closest(\'#history-panel\') && !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        if (!list.length) {\n            // No row markers: one row per track link, its closest list item or row-like block.\n            var seen = [];\n            Array.from(scope.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\')).forEach(function(a) {\n                var row = a.closest(\'li, [role=\"listitem\"], [draggable=\"true\"], [data-encore-id=\"listRow\"]\') || a.parentElement && a.parentElement.parentElement || a;\n                if (!hiddenBeforeTap(a) && !hiddenBeforeTap(row) && !a.closest(\'#history-panel\') && seen.indexOf(row) < 0) seen.push(row);\n            });\n            list = seen;\n        }\n        if (!list.length && queueScope(r)) {\n            // Newer Encore queue rows may have a title marker without any\n            // track href. Only row containers bearing that marker qualify.\n            var marked = Array.from(scope.querySelectorAll(\'li, [role=\"listitem\"], [data-encore-id=\"listRow\"]\')).filter(function(n) { return !hiddenBeforeTap(n) && !n.closest(\'#history-panel\') && (!!semanticTitle(n) || !!titleFallback(n)); });\n            list = marked.filter(function(n) { return !marked.some(function(other) { return other !== n && n.contains(other); }); });\n        }\n        // Scan beyond invalid/placeholder rows, but cap the work. Only the\n        // first 40 validated rows are ultimately returned.\n        var output = [];\n        list.slice(0, 400).some(function(n) {\n            var candidates = Array.from(n.querySelectorAll(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });\n            candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });\n            if (candidates.length > 1) return false;\n            var t = candidates[0] || null;\n            var semantic = !t ? semanticTitle(n) : null;\n            if (!t) t = semantic;\n            if (!t && queueScope(r)) t = titleFallback(n);\n            var artistRoot = semantic ? n.querySelector(\'[data-encore-id=\"listRowSubtitle\"]\') : n;\n            var artists = artistRoot ? Array.from(artistRoot.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).filter(function(el) { return !hiddenBeforeTap(el); }).map(text).filter(Boolean) : [];\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            if (!artists.length && t && queueScope(r)) {\n                var details = Array.from(n.querySelectorAll(\'[class*=\"ListRowDetails__ListRowDetailText\"]\')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });\n                if (details.length === 1) artists.push(text(details[0]));\n            }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            var item = {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration, current: n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-testid\') === \'queue-now-playing\'};\n            if (item.title) output.push(item);\n            return output.length >= 40;\n        });\n        return output;\n    }\n    // Failure-only structural fingerprint. Every character is a fixed category\n    // or a count capped at 9; no page text, IDs, hrefs or arbitrary labels leave\n    // the WebView. This does not read a different panel or perform any action.\n    function emptyShape(r, trigger) {\n        if (!r) return \'\';\n        var kind = 7;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) kind = 0;\n        else if (r.matches(\'[data-testid=\"queue-page\"]\')) kind = 1;\n        else if (r.matches(\'[data-testid=\"queue-view\"]\')) kind = 2;\n        else if (r.matches(\'[data-testid=\"queue-panel\"]\')) kind = 3;\n        else if (r.matches(\'[data-testid=\"NPV-queue\"]\')) kind = 4;\n        else if (r.matches(\'#queue-panel\')) kind = 8;\n        else if (trigger && trigger.getAttribute(\'aria-controls\') && document.getElementById(trigger.getAttribute(\'aria-controls\')) === r) kind = 5;\n        else kind = 6;\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'shape:\' + [kind, Math.min(r.children.length,9), count(\'*\'),\n            count(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\'),\n            count(\'a[href]\'), count(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\'),\n            count(\'a[href^=\"spotify:track:\"], a[href^=\"spotify:episode:\"]\'),\n            count(\'[data-uri], [data-track-uri], [data-spotify-uri]\'),\n            count(\'[data-testid*=\"track\" i]\'), count(\'li, [role=\"listitem\"]\'),\n            count(\'[role=\"row\"]\'), count(\'[data-testid*=\"queue\" i]\'),\n            count(\'[data-encore-id=\"listRow\"]\'), String(r.textContent || \'\').trim() ? 1 : 0].join(\'\');\n    }\n    // Extra bounded categories diagnose which supported row shapes exist if\n    // extraction still fails. Never return selectors, text or attribute values.\n    function emptyDetail(r) {\n        if (!r) return \'\';\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'detail:\' + [count(\'#queue-panel\'), count(\'[class*=\"ListRowTitle__ListRowText\"]\'),\n            count(\'[class*=\"ListRowDetails__ListRowDetailText\"]\'), count(\'a[href*=\"/artist/\"]\'),\n            count(\'a[href*=\"/album/\"]\'), count(\'[data-context-item-type=\"track\"], [data-context-item-type=\"episode\"]\'),\n            count(\'[role=\"gridcell\"]\'), count(\'[data-encore-id=\"text\"]\'), count(\'[data-flip-id*=\"section-header-\"]\')].join(\'\');\n    }\n    function semanticDetail(r) {\n        var panels = Array.from(r.querySelectorAll(\'#queue-panel\'));\n        if (r.matches(\'#queue-panel\')) panels.unshift(r);\n        if (panels.length !== 1) return \'sem:\' + Math.min(panels.length, 9) + \'0000\';\n        var panel = panels[0], titles = Array.from(panel.querySelectorAll(\'[data-encore-id=\"listRowTitle\"]\'));\n        var rowCount = Array.from(panel.querySelectorAll(\'li, [role=\"listitem\"], [role=\"row\"], [data-encore-id=\"listRow\"]\')).filter(function(n) { return !!semanticTitle(n); }).length;\n        return \'sem:\' + [1, Math.min(titles.length,9), Math.min(panel.querySelectorAll(\'[data-encore-id=\"listRowSubtitle\"]\').length,9), Math.min(rowCount,9), Math.min(titles.filter(hiddenBeforeTap).length,9)].join(\'\');\n    }\n    // Temporarily size zero-height containers. Restore only properties that\n    // still have our value, preserving concurrent changes made by Spotify.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            var entry = {node:n, hadStyle:n.hasAttribute(\'style\'), props:[]};\n            sized.push(entry);\n            function set(prop, value) {\n                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);\n                n.style.setProperty(prop, value, \'important\');\n            }\n            if (cs.display === \'none\') set(\'display\', \'block\');\n            if (cs.visibility === \'hidden\') set(\'visibility\', \'visible\');\n            if (small) set(\'min-height\', \'640px\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try {\n            e.props.forEach(function(p) {\n                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== \'important\') return;\n                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);\n            });\n            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute(\'style\');\n        } catch (_) {} });\n        sized = [];\n    }\n    // Only an explicitly named queue close control inside the recognised\n    // panel is eligible; generic close buttons elsewhere are never clicked.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            return n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n) &&\n                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d[\'\u2019]attente|masquer la file d[\'\u2019]attente)$/i.test(label));\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button();\n        var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && !already && hiddenBeforeTap(b)) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4500, forced = false;\n        (function step() {\n          try {\n            var r = null, list = [];\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];\n            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                var marked = list.filter(function(x) { return x.current; });\n                job.now = marked.length === 1 ? line(marked[0]) : \'\';\n                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else {\n                log(r ? \'rows:0\' : \'panel:absent\');\n                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.\n                log(\'path:\' + (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) ? \'queue\' : \'other\'));\n                log(\'links:\' + Math.min(r ? r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\').length : 0, 99));\n                log(\'rowsdoc:\' + Math.min(document.querySelectorAll(\'[data-testid=\"tracklist-row\"], [role=\"row\"]\').length, 99));\n                if (r) { log(emptyShape(r, b)); log(emptyDetail(r)); log(semanticDetail(r)); }\n                finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\');\n            }\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n"

.field private static final RECOVER:Ljava/lang/String; = "(function(){try{var b=document.querySelector(\'[data-testid=\"lyrics-button\"],[data-testid=\"control-button-lyrics\"]\');if(b&&(b.getAttribute(\'aria-pressed\')===\'true\'||b.getAttribute(\'data-active\')===\'true\'))b.click();document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}));window.__melodixDrawerUnsafe=false;window.__melodixDrawerLease=null;return \'ok\'}catch(e){return \'error\'}})()"

.field private static final TRACE_READ:Ljava/lang/String; = "(function(){var t=window.__melodixOpenTrace;if(!t||typeof t!==\'object\')return \'\';var n=function(x){return typeof x===\'number\'&&isFinite(x)&&x>=0?String(Math.min(Math.round(x),9999999)):\'-\';};var k=t.kind===\'liked\'||t.kind===\'playlist\'?t.kind:\'-\';var ph=/^(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable)$/.test(String(t.phase))?t.phase:\'-\';return [k,ph,n(t.nav),n(t.ready),n(t.dom),n(t.classified),n(t.rendered),n(t.first),n(t.full),n(t.updates)].join(\',\');})()"

.field static displayReport:Ljava/lang/String;

.field private static final observations:[Ljava/lang/String;

.field private static openTrace:Ljava/lang/String;

.field private static final panelJournals:[Ljava/lang/String;

.field private static final probeSerial:[J

.field private static queueJournal:Ljava/lang/String;

.field private static traceAt:J


# instance fields
.field private final controls:[Landroid/widget/Button;

.field private final icons:[I

.field private lastAction:J

.field private lyricsLive:Z

.field private melodixQueue:Z

.field private final names:[Ljava/lang/String;

.field private openedAt:J

.field private panelJobId:Ljava/lang/String;

.field private panelJobPending:Z

.field private panelReason:Ljava/lang/String;

.field private panelSerial:J

.field private panelSettled:J

.field private panelStep:Ljava/lang/String;

.field private queueJobId:Ljava/lang/String;

.field private queueJobPending:Z

.field private queueReason:Ljava/lang/String;

.field private queueSerial:J

.field private queueStep:Ljava/lang/String;

.field private readSerial:J

.field private recovering:Z

.field private settledSerial:J

.field private final traceTick:Ljava/lang/Runnable;

.field private volumeRunning:Z

.field private webDialog:Lcom/melodix/music/PreviewPlayerSheet;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 34
    const-string v0, "aucune"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 51
    const-string v1, "non observ\u00e9e"

    filled-new-array {v1, v1, v1}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    .line 52
    const/4 v1, 0x3

    new-array v1, v1, [J

    fill-array-data v1, :array_0

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    .line 54
    const-wide/16 v1, -0x1

    sput-wide v1, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    .line 58
    const-string v1, "non lue"

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    .line 60
    const-string v1, "\nAffichage lecteur : non observ\u00e9"

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    .line 236
    filled-new-array {v0, v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 8
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 13

    .line 406
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    new-instance p2, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {p2, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    .line 126
    const-string p2, "File"

    const-string v0, "Paroles"

    const-string v1, "Appareils"

    filled-new-array {p2, v0, v1}, [Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 127
    const/4 v2, 0x4

    const/4 v3, 0x5

    const/4 v4, 0x6

    filled-new-array {v2, v3, v4}, [I

    move-result-object v5

    iput-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[I

    .line 128
    const/4 v5, 0x3

    new-array v6, v5, [Landroid/widget/Button;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    .line 130
    const-wide/16 v6, -0x3e8

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    .line 153
    const-string v6, ""

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v7, "envoi"

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    .line 206
    const-wide/16 v7, -0x1

    iput-wide v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    .line 237
    iput-wide v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    .line 242
    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    .line 406
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v7, 0x11

    invoke-virtual {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 407
    const-string v7, "Volume"

    filled-new-array {p2, v0, v1, v7}, [Ljava/lang/String;

    move-result-object p2

    .line 408
    const/4 v0, 0x1

    filled-new-array {v2, v3, v4, v0}, [I

    move-result-object v1

    .line 409
    move v3, v6

    :goto_0
    if-ge v3, v2, :cond_7

    .line 410
    if-ne v3, v5, :cond_0

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {v4, p1}, Lcom/melodix/music/PreviewPlayerVolume;-><init>(Landroid/content/Context;)V

    goto :goto_1

    :cond_0
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 411
    :goto_1
    aget-object v7, p2, v3

    aget v8, v1, v3

    const v9, -0x4b513b

    invoke-static {p1, v7, v8, v9}, Lcom/melodix/music/PreviewPanelIcon;->tile(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41200000    # 10.0f

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v4, v9}, Landroid/widget/Button;->setTextColor(I)V

    .line 412
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setSingleLine(Z)V

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v7, 0x40000000    # 2.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    const/high16 v9, 0x40800000    # 4.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v10

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    invoke-virtual {v4, v8, v10, v7, v9}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v7, 0x42600000    # 56.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 413
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v9, 0x14ffffff

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v9, 0x41900000    # 18.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v10

    const v11, 0x1fffffff

    invoke-virtual {v8, v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 414
    const/4 v10, 0x0

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v11, 0x0

    invoke-virtual {v4, v11}, Landroid/widget/Button;->setElevation(F)V

    invoke-virtual {v4, v11}, Landroid/widget/Button;->setTranslationZ(F)V

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 415
    new-instance v11, Landroid/graphics/drawable/RippleDrawable;

    const v12, 0x447b3fe4

    invoke-static {v12}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v12

    invoke-direct {v11, v12, v8, v10}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v11}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 416
    if-ne v3, v5, :cond_1

    const-string v8, "Volume du lecteur indisponible"

    goto :goto_2

    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v10, v10, v3

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " : indisponible, page Spotify non accessible"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_2
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 417
    if-ge v3, v5, :cond_2

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_2
    if-ne v3, v5, :cond_3

    move v8, v9

    goto :goto_3

    :cond_3
    const v8, 0x3f4ccccd    # 0.8f

    :goto_3
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setActivated(Z)V

    .line 418
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v10

    iget v10, v10, Landroid/content/res/Configuration;->fontScale:F

    const v11, 0x3fa66666    # 1.3f

    cmpl-float v10, v10, v11

    if-lez v10, :cond_4

    const/4 v7, -0x2

    goto :goto_4

    :cond_4
    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    :goto_4
    invoke-direct {v8, v6, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v3, :cond_5

    const/high16 v7, 0x41000000    # 8.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    iput v7, v8, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_5
    invoke-virtual {p0, v4, v8}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 419
    if-ge v3, v5, :cond_6

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aput-object v4, v7, v3

    new-instance v7, Lcom/melodix/music/PreviewPlayerTiles$23;

    invoke-direct {v7, p0, v3}, Lcom/melodix/music/PreviewPlayerTiles$23;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 409
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 422
    :cond_7
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Activity;
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->readTrace(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method static synthetic access$1208(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method static synthetic access$1300(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    return-wide v0
.end method

.method static synthetic access$1402(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->parseObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Ljava/lang/String;)Z
    .locals 0

    .line 30
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerTiles;->validJobId(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1802(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 0

    .line 30
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    return p0
.end method

.method static synthetic access$1902(Lcom/melodix/music/PreviewPlayerTiles;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    return p1
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2002(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    return-void
.end method

.method static synthetic access$2202(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2400(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$2502(Lcom/melodix/music/PreviewPlayerTiles;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->lyricsLive:Z

    return p1
.end method

.method static synthetic access$2600(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    return-wide v0
.end method

.method static synthetic access$2708(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    return-wide v0
.end method

.method static synthetic access$2800(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    return-wide v0
.end method

.method static synthetic access$2900()[Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$302(J)J
    .locals 0

    .line 30
    sput-wide p0, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    return-wide p0
.end method

.method static synthetic access$3100(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$3202(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3300(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 0

    .line 30
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobPending:Z

    return p0
.end method

.method static synthetic access$3302(Lcom/melodix/music/PreviewPlayerTiles;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobPending:Z

    return p1
.end method

.method static synthetic access$3400(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$3402(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3500(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p10}, Lcom/melodix/music/PreviewPlayerTiles;->pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3600(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 0

    .line 30
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    return p0
.end method

.method static synthetic access$3602(Lcom/melodix/music/PreviewPlayerTiles;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    return p1
.end method

.method static synthetic access$3700(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p5}, Lcom/melodix/music/PreviewPlayerTiles;->recover(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$3802(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3900(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400()[J
    .locals 1

    .line 30
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    return-object v0
.end method

.method static synthetic access$4000(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;JLjava/lang/String;I)V
    .locals 0

    .line 30
    invoke-direct/range {p0 .. p6}, Lcom/melodix/music/PreviewPlayerTiles;->pollClosed(ILandroid/app/Activity;JLjava/lang/String;I)V

    return-void
.end method

.method static synthetic access$4100(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 0

    .line 30
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerTiles;->resultCode(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4200(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4300(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->openedAt:J

    return-wide v0
.end method

.method static synthetic access$4400(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method static synthetic access$4500(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V

    return-void
.end method

.method static synthetic access$500()[Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 0

    .line 30
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->count(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$708(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 30
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    return-object p0
.end method

.method static synthetic access$802(Lcom/melodix/music/PreviewPlayerTiles;Lcom/melodix/music/PreviewPlayerSheet;)Lcom/melodix/music/PreviewPlayerSheet;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    return-object p1
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result p0

    return p0
.end method

.method private activate(I)V
    .locals 17

    .line 360
    move-object/from16 v9, p0

    move/from16 v0, p1

    const-string v1, "envoi"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v8

    .line 361
    iget-boolean v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v4, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v4

    if-nez v4, :cond_7

    if-eqz v8, :cond_7

    invoke-virtual {v8}, Landroid/app/Activity;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_7

    invoke-virtual {v8}, Landroid/app/Activity;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_7

    iget-object v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-nez v4, :cond_7

    iget-wide v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x190

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    goto/16 :goto_6

    .line 362
    :cond_0
    iput-wide v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    iget-object v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v2, v2, v0

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->performHapticFeedback(I)Z

    invoke-direct {v9, v0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V

    .line 364
    :try_start_0
    new-instance v11, Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {v11, v8}, Lcom/melodix/music/PreviewPlayerSheet;-><init>(Landroid/app/Activity;)V

    .line 365
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v4, 0x41b00000    # 22.0f

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {v9, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/4 v13, 0x0

    invoke-virtual {v12, v5, v13, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v8}, Lcom/melodix/music/PreviewPlayerSheet;->background(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 366
    invoke-virtual {v11}, Lcom/melodix/music/PreviewPlayerSheet;->dragListener()Landroid/view/View$OnTouchListener;

    move-result-object v4

    .line 367
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v7, "Glisser vers le bas pour fermer"

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 368
    new-instance v7, Landroid/view/View;

    invoke-direct {v7, v8}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v14, 0xffffff

    const v15, 0x4479c000    # 999.0f

    const v10, 0x66ffffff

    invoke-static {v8, v10, v14, v15}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42100000    # 36.0f

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v14

    const/high16 v15, 0x40800000    # 4.0f

    invoke-direct {v9, v15}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v15

    invoke-direct {v10, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42000000    # 32.0f

    invoke-direct {v9, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v14

    const/4 v15, -0x1

    invoke-direct {v7, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 369
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v7, 0x10

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 370
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v7, v4}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 371
    const-string v4, "LECTEUR"

    const v14, -0x4a5c2e

    const/high16 v2, 0x41200000    # 10.0f

    invoke-direct {v9, v8, v4, v14, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v2

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x41900000    # 18.0f

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v4, v15, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    if-nez v0, :cond_1

    const-string v2, "File d\u2019attente"

    goto :goto_0

    :cond_1
    iget-object v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v2, v2, v0

    :goto_0
    const/high16 v4, 0x41a00000    # 20.0f

    invoke-direct {v9, v8, v2, v15, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v2

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v4, v15, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 373
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    const-string v4, "Appareils disponibles"

    goto :goto_1

    :cond_2
    const-string v4, "Contenu du lecteur"

    :goto_1
    const v2, -0x485533

    const/high16 v14, 0x41500000    # 13.0f

    invoke-direct {v9, v8, v4, v2, v14}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v2

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v10

    invoke-direct {v4, v15, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v13, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 374
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v4, ""

    const v7, -0x212b13

    invoke-static {v8, v4, v3, v7}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fermer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {v2, v13}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v2, v13}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v2, v13}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v10, 0x42400000    # 48.0f

    invoke-direct {v9, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setMinHeight(I)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 375
    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$18;

    invoke-direct {v3, v9, v11}, Lcom/melodix/music/PreviewPlayerTiles$18;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Lcom/melodix/music/PreviewPlayerSheet;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42200000    # 40.0f

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v9, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {v3, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v15, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v14, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {v9, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    const/high16 v4, 0x41000000    # 8.0f

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v9, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-virtual {v14, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 377
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const v3, 0xcffffff

    const v4, 0x16ffffff

    const/high16 v5, 0x41900000    # 18.0f

    invoke-static {v8, v3, v4, v5}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v14}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 378
    const/high16 v3, 0x42f00000    # 120.0f

    invoke-direct {v9, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    const/high16 v5, 0x435c0000    # 220.0f

    invoke-direct {v9, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x1

    if-ne v0, v5, :cond_3

    :goto_2
    goto :goto_3

    :cond_3
    const/high16 v5, 0x43aa0000    # 340.0f

    invoke-direct {v9, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    goto :goto_2

    :goto_3
    invoke-direct {v4, v15, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 379
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "Actualiser"

    const/4 v3, 0x2

    invoke-static {v8, v2, v3, v15}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Actualiser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v9, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v7, v15}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {v7, v13}, Landroid/widget/Button;->setAllCaps(Z)V

    const/16 v2, 0x11

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setGravity(I)V

    invoke-direct {v9, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/4 v2, 0x0

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-static {v8, v13}, Lcom/melodix/music/PreviewPlayerSheet;->actionBackground(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 380
    iget-object v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v11, v2}, Lcom/melodix/music/PreviewPlayerSheet;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lcom/melodix/music/PreviewPlayerSheet;->setCanceledOnTouchOutside(Z)V

    .line 381
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$19;

    invoke-direct {v2, v9, v0, v8}, Lcom/melodix/music/PreviewPlayerTiles$19;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V

    invoke-virtual {v11, v2}, Lcom/melodix/music/PreviewPlayerSheet;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 388
    iput-object v11, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->openedAt:J

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    .line 389
    new-instance v5, Lcom/melodix/music/PreviewPlayerTiles$20;

    move-object v1, v5

    move-object/from16 v2, p0

    move/from16 v3, p1

    move-object v4, v8

    move-object v13, v5

    move-object v5, v11

    move-object v6, v14

    move-object/from16 v16, v7

    invoke-direct/range {v1 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$20;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Lcom/melodix/music/PreviewPlayerSheet;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    move-object/from16 v6, v16

    invoke-virtual {v6, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v1, v15, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x41600000    # 14.0f

    invoke-direct {v9, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v12, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 391
    invoke-virtual {v11, v12}, Lcom/melodix/music/PreviewPlayerSheet;->showSheet(Landroid/view/View;)V

    invoke-virtual {v11}, Lcom/melodix/music/PreviewPlayerSheet;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_4

    invoke-virtual {v11}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    return-void

    .line 392
    :cond_4
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    const/4 v2, -0x2

    invoke-virtual {v1, v15, v2}, Landroid/view/Window;->setLayout(II)V

    .line 393
    if-nez v0, :cond_5

    invoke-direct {v9, v8, v11, v14, v6}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_4

    :cond_5
    const-string v7, "run"

    const-string v10, ""

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object v3, v8

    move-object v4, v11

    move-object v5, v14

    move-object v8, v10

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    :goto_4
    goto :goto_5

    :catch_0
    move-exception v0

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_6

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    const/4 v1, 0x0

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    :cond_6
    const-string v0, "Indisponible dans cette version"

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    .line 395
    :goto_5
    return-void

    .line 361
    :cond_7
    :goto_6
    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 133
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 134
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 135
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 133
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 136
    :cond_2
    :goto_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    return-object v0
.end method

.method private addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 7

    .line 163
    const-string v0, "\t"

    const/4 v1, -0x1

    invoke-virtual {p3, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p3

    array-length v0, p3

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    aget-object v2, p3, v0

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_5

    .line 164
    :cond_0
    array-length v2, p3

    const/4 v3, 0x1

    const-string v4, ""

    if-le v2, v3, :cond_1

    aget-object v2, p3, v3

    goto :goto_0

    :cond_1
    move-object v2, v4

    :goto_0
    array-length v3, p3

    const/4 v5, 0x2

    if-le v3, v5, :cond_2

    aget-object v3, p3, v5

    goto :goto_1

    :cond_2
    move-object v3, v4

    .line 165
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v2, v4

    goto :goto_2

    :cond_3
    const-string v2, " \u00b7 "

    :goto_2
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    :cond_4
    move-object v2, v4

    :goto_3
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 166
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget-object p3, p3, v0

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_4

    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_4
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/high16 v2, 0x41700000    # 15.0f

    invoke-direct {p0, p1, p3, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p1

    const/4 p3, 0x3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxLines(I)V

    const/high16 p3, 0x40c00000    # 6.0f

    invoke-direct {p0, p3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {p0, p3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result p3

    invoke-virtual {p1, v0, v2, v0, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p3, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    return-void

    .line 163
    :cond_6
    :goto_5
    return-void
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    const-string v1, "[^a-z0-9:-]+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, p0, v2

    .line 46
    const-string v4, "(opened|already-open|open-error|closed|close-error|panel:absent|root:ambiguous|button:absent|button:disabled|button:ambiguous:[0-9]{1,2}|rows:[0-9]{1,2}|lines:[0-9]{1,3}(:sync)?|devices:[0-9]{1,2}|sized:[0-9]{1,2}|h:[0-9]{1,4}|path:(queue|other)|links:[0-9]{1,2}|rowsdoc:[0-9]{1,2}|shape:[0-9]{14}|detail:[0-9]{9}|sem:[0-9]{5}|target:(ambiguous|absent|already-active)|transfer:(click|error|verified|unverified)|close:(verified|unverified|button))"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 47
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_1

    const/16 v4, 0x3e

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v4, 0xa0

    if-le v3, v4, :cond_2

    goto :goto_2

    .line 45
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    :cond_3
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "aucune"

    goto :goto_3

    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_3
    return-object p0
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 2

    .line 77
    const/16 v0, 0x63

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 6

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nStructure File : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure Paroles : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure Appareils : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v4, 0x2

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nFile (tiroir) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nParoles (tiroir) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nAppareils (tiroir) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nOuverture collection (compteurs, sans titre ni identifiant) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-wide v1, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " ; relev\u00e9 il y a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sget-wide v4, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " s"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private dp(F)I
    .locals 1

    .line 423
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method static formatTrace(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 63
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 64
    :cond_0
    const-string v0, "(liked|playlist|-),(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable|-)(,(-|\\d{1,7})){8}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "illisible"

    return-object p0

    .line 65
    :cond_1
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v2, p0, v1

    const-string v3, "liked"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "\u2014"

    if-eqz v2, :cond_2

    const-string v1, "lik\u00e9s"

    goto :goto_0

    :cond_2
    aget-object v1, p0, v1

    const-string v2, "playlist"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    move-object v1, v2

    goto :goto_0

    :cond_3
    move-object v1, v3

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", phase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", navigation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", page pr\u00eate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", lignes DOM="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x4

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", lignes class\u00e9es="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x5

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", lignes envoy\u00e9es au natif="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x6

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", premi\u00e8re liste="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 67
    const/4 v1, 0x7

    aget-object v2, p0, v1

    const-string v4, "-"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v5, " ms"

    if-eqz v2, :cond_4

    move-object v1, v3

    goto :goto_1

    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v1, p0, v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", liste compl\u00e8te="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x8

    aget-object v2, p0, v1

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_2

    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v1, p0, v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mises \u00e0 jour="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x9

    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 66
    return-object p0

    .line 63
    :cond_6
    :goto_3
    const-string p0, "aucune ouverture observ\u00e9e"

    return-object p0
.end method

.method private line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;
    .locals 1

    .line 148
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextSize(F)V

    return-object v0
.end method

.method private loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 20

    .line 306
    move-object/from16 v12, p0

    move/from16 v13, p1

    move-object/from16 v14, p2

    move-object/from16 v15, p4

    move-object/from16 v11, p5

    const-string v0, ","

    iget-wide v1, v12, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    const-wide/16 v3, 0x1

    add-long v9, v1, v3

    iput-wide v9, v12, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    const-string v1, ""

    iput-object v1, v12, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, v12, Lcom/melodix/music/PreviewPlayerTiles;->panelJobPending:Z

    iget-boolean v2, v12, Lcom/melodix/music/PreviewPlayerTiles;->lyricsLive:Z

    if-nez v2, :cond_0

    invoke-direct {v12, v14, v15}, Lcom/melodix/music/PreviewPlayerTiles;->skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    :cond_0
    invoke-virtual {v11, v1}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v1, 0x1

    if-ne v13, v1, :cond_1

    const-string v1, "lyrics"

    goto :goto_0

    :cond_1
    const-string v1, "devices"

    :goto_0
    move-object/from16 v16, v1

    .line 307
    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$13;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide v3, v9

    move-object/from16 v5, p3

    move/from16 v6, p1

    move-object/from16 v7, p6

    move-object/from16 v17, v0

    move-object v0, v8

    move-object/from16 v8, p2

    move-wide/from16 v18, v9

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    invoke-direct/range {v1 .. v10}, Lcom/melodix/music/PreviewPlayerTiles$13;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILjava/lang/String;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-string v1, "transfer"

    move-object/from16 v10, p6

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-wide/16 v1, 0x2af8

    goto :goto_1

    :cond_2
    const-wide/16 v1, 0x1f40

    :goto_1
    invoke-virtual {v12, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 308
    invoke-direct {v12, v14}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v1, v13, -0x1

    const-string v2, "page:inaccessible"

    aput-object v2, v0, v1

    invoke-direct {v12, v13, v14, v15, v11}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 309
    :cond_3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "((function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    W.__melodixDrawerLease = job;\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            main: true,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0, rootAmbiguous = false;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {\n            // Spotify may give the trigger itself a device-picker testid.\n            // A button is not its own content panel and must not imply open.\n            return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');\n        });\n        // Nested wrappers can describe the same panel; unrelated roots are\n        // ambiguous and must never be treated as the current content.\n        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });\n        if (hits.length === 1) return hits[0];\n        if (hits.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        if (c && c !== b && c.isConnected && !c.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return c;\n        if (spec.main) {\n            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.\n            var main = document.querySelector(\'#main-view, main\');\n            return main && main.querySelector(\'[data-testid*=\"lyric\" i]\') ? main : null;\n        }\n        // Device picker opens as a popover/dialog mentioning devices.\n        var pops = Array.from(document.querySelectorAll(\'[role=\"dialog\"], [data-tippy-root], [id^=\"tippy\"]\')).filter(function(n) {\n            return n.isConnected && n !== b && /appareil|device|dispositivo|ger\u00e4t/i.test(String(n.getAttribute(\'aria-label\') || \'\'));\n        });\n        if (pops.length > 1) rootAmbiguous = true;\n        return pops.length === 1 ? pops[0] : null;\n    }\n    // Exclude hidden descendants and embedded controls rather than treating\n    // all textContent inside a visible lyric element as a line.\n    function lyricText(n) {\n        if (!n || hiddenBeforeTap(n)) return \'\';\n        var parts = [], visited = 0;\n        function walk(node) {\n            if (++visited > 1000) return;\n            if (node.nodeType === 3) { parts.push(node.nodeValue || \'\'); return; }\n            if (node.nodeType !== 1) return;\n            if (node !== n) {\n                if (node.matches(\'button, [role=\"button\"], [role=\"switch\"]\') || node.hasAttribute(\'hidden\') || node.getAttribute(\'aria-hidden\') === \'true\') return;\n                var cs = window.getComputedStyle(node);\n                if (cs.display === \'none\' || cs.visibility === \'hidden\') return;\n            }\n            if (node.tagName === \'BR\') parts.push(\' \');\n            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);\n        }\n        walk(n);\n        return parts.join(\'\').replace(/\\s+/g, \' \').trim().slice(0, 300);\n    }\n    function lyricLines(r) {\n        // aria-controls by itself may point at unrelated content. Require a\n        // lyrics-specific root or a lyrics-specific line marker, not just <p>.\n        if (!r.matches(spec.roots) && !r.querySelector(\'[data-testid=\"fullscreen-lyric\"], [data-testid^=\"lyrics-line\"]\')) return {lines: [], active: -1, synced: false};\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'[data-testid*=\"lyric\" i]\')).filter(function(n) {\n            // A button such as lyrics-close-button is a control, not a lyric\n            // line. Ignoring it lets the paragraph fallback read real lines.\n            return !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && (!n.children.length || !n.querySelector(\'[data-testid*=\"lyric\" i]\'));\n        });\n        if (!nodes.length && r.matches(spec.roots)) nodes = Array.from(r.querySelectorAll(\'p\'));\n        nodes = nodes.filter(function(n) { return !hiddenBeforeTap(n) && !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        var lines = [], active = -1, activeCount = 0, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = lyricText(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; activeCount++; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced && activeCount === 1 ? active : -1, synced: synced};\n    }\n    function trustedDevices(r) {\n        // A trigger\'s aria-controls alone does not prove the target is Spotify\'s\n        // device picker; never send a transfer into an arbitrary region.\n        return !!r && r.matches(spec.roots);\n    }\n    function deviceRows(r, includeHidden) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        nodes = nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return includeHidden || !hiddenBeforeTap(n); });\n        // Limit display only. Transfer ambiguity must consider every matching\n        // element, including hidden items beyond the first page of results.\n        if (!includeHidden) nodes = nodes.slice(0, 30);\n        return nodes.map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    // Temporarily size zero-height containers. Restore only properties that\n    // still have our value, preserving concurrent changes made by Spotify.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            var entry = {node:n, hadStyle:n.hasAttribute(\'style\'), props:[]};\n            sized.push(entry);\n            function set(prop, value) {\n                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);\n                n.style.setProperty(prop, value, \'important\');\n            }\n            if (cs.display === \'none\') set(\'display\', \'block\');\n            if (cs.visibility === \'hidden\') set(\'visibility\', \'visible\');\n            if (small) set(\'min-height\', \'640px\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try {\n            e.props.forEach(function(p) {\n                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== \'important\') return;\n                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);\n            });\n            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute(\'style\');\n        } catch (_) {} });\n        sized = [];\n    }\n    // Close only a unique, panel-specific control inside the recognised\n    // panel. An ambiguous or generic close button is never used.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            var known = kind===\'lyrics\' ? /^(lyrics-close-button|close-lyrics-button)$/.test(id) || /^(close lyrics|hide lyrics|fermer les paroles|masquer les paroles)$/i.test(label) :\n                /^(devices-close-button|close-devices-button)$/.test(id) || /^(close devices|close device picker|fermer les appareils|fermer la liste des appareils)$/i.test(label);\n            return known && n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n);\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button(); var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && !already && hiddenBeforeTap(b)) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4000, forced = false;\n        (function step() {\n          try {\n            var r = null;\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null;\n            if (kind === \'devices\' && action === \'transfer\' && r && !trustedDevices(r)) { log(\'target:absent\'); finish(false, \'target\'); return; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r, action === \'transfer\').length);\n            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\'); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); return;\n            }\n            var rows = deviceRows(r, action === \'transfer\');\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); return; }\n                var targetNode = target[0].node;\n                if (targetNode.disabled || targetNode.matches(\':disabled\') || targetNode.closest(\'[aria-disabled=\"true\"]\') || hiddenBeforeTap(targetNode)) {\n                    log(\'target:disabled\'); finish(false, \'target\'); return;\n                }\n                if (rows.filter(function(d) { return d.current; }).length > 1) { log(\'target:ambiguous\'); finish(false, \'target\'); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); return; }\n                try { targetNode.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                  try {\n                    var again = null;\n                    try {\n                        var r2 = root(button() || b), all = r2 === r && trustedDevices(r2) ? deviceRows(r2, true) : [];\n                        var matches = all.filter(function(d) { return d.name === wanted; });\n                        var activeCount = all.filter(function(d) { return d.current; }).length;\n                        // A duplicate, replacement, changed panel or conflicting\n                        // active states do not prove the original target is active.\n                        again = activeCount === 1 && matches.length === 1 && matches[0].node === targetNode && targetNode.isConnected && !targetNode.disabled && !targetNode.matches(\':disabled\') && !targetNode.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(targetNode) ? matches[0] : null;\n                    } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\');\n                  } catch (_) { finish(false, \'error\'); }\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\');\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {v16 .. v16}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v2, v17

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p6 .. p6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p7 .. p7}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$14;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide/from16 v3, v18

    move-object/from16 v5, p3

    move/from16 v6, p1

    move-object/from16 v7, p2

    move-object v12, v8

    move-object/from16 v8, p4

    move-object v14, v9

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    move-object/from16 v11, v16

    invoke-direct/range {v1 .. v11}, Lcom/melodix/music/PreviewPlayerTiles$14;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v14, v12}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    move-object/from16 v1, p0

    goto :goto_2

    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v1, v13, -0x1

    const-string v2, "demarrage:erreur"

    aput-object v2, v0, v1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    invoke-direct {v1, v13, v2, v15, v3}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 316
    :goto_2
    return-void
.end method

.method private loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 16

    .line 210
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    const-string v1, ""

    const-wide/16 v2, 0x1

    const/4 v4, 0x0

    :try_start_0
    const-string v0, "com.melodix.music.PreviewPlayerControllerQueue"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v5, "snapshot"

    new-array v6, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v6, v4, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v0, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 211
    instance-of v6, v0, Ljava/lang/String;

    if-eqz v6, :cond_0

    iget-wide v6, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    add-long/2addr v6, v2

    iput-wide v6, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    iput-boolean v5, v9, Lcom/melodix/music/PreviewPlayerTiles;->melodixQueue:Z

    new-instance v5, Lorg/json/JSONObject;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v10, v11, v12, v5}, Lcom/melodix/music/PreviewPlayerTiles;->renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->melodixQueue:Z

    invoke-direct/range {p0 .. p4}, Lcom/melodix/music/PreviewPlayerTiles;->removable(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 212
    :cond_0
    iget-wide v5, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    add-long v13, v5, v2

    iput-wide v13, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    iput-boolean v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    invoke-direct {v9, v10, v11}, Lcom/melodix/music/PreviewPlayerTiles;->skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v12, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 213
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$7;

    move-object v1, v0

    move-object/from16 v2, p0

    move-wide v3, v13

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$7;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-wide/16 v1, 0x1f40

    invoke-virtual {v9, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 214
    invoke-direct/range {p0 .. p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "page:inaccessible"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 215
    :cond_1
    :try_start_1
    const-string v15, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    W.__melodixDrawerLease = job;\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    // textContent includes aria-hidden nodes and embedded controls. Only read\n    // visible text, with a bounded walk, so hidden metadata cannot leak into a title.\n    function text(n) {\n        if (!n || hiddenBeforeTap(n)) return \'\';\n        var parts = [], visited = 0;\n        function walk(node) {\n            if (++visited > 1000) return;\n            if (node.nodeType === 3) { parts.push(node.nodeValue || \'\'); return; }\n            if (node.nodeType !== 1) return;\n            if (node !== n) {\n                if (node.matches(\'button, [role=\"button\"], [role=\"switch\"]\') || node.hasAttribute(\'hidden\') || node.getAttribute(\'aria-hidden\') === \'true\') return;\n                var cs = window.getComputedStyle(node);\n                if (cs.display === \'none\' || cs.visibility === \'hidden\') return;\n            }\n            if (node.tagName === \'BR\') parts.push(\' \');\n            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);\n        }\n        walk(n);\n        return parts.join(\'\').replace(/\\s+/g, \' \').trim().slice(0, 200);\n    }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0, rootAmbiguous = false;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\'))) {\n            var mainView = document.querySelector(\'#main-view, main\');\n            if (mainView && mainView.isConnected) return mainView;\n        }\n        var selectors = \'#queue-panel, [data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        // A chain of nested markers can describe one queue. Keep the outer\n        // wrapper so headers and rows belonging to that queue are retained;\n        // independent branches remain ambiguous and are never merged.\n        if (found.length > 1) {\n            var leaves = found.filter(function(n) { return !found.some(function(other) { return other !== n && n.contains(other); }); });\n            if (leaves.length === 1) {\n                var outer = found.filter(function(n) { return !found.some(function(other) { return other !== n && other.contains(n); }); });\n                if (outer.length === 1) return outer[0];\n            }\n            rootAmbiguous = true; return null;\n        }\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return controlled;\n        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.\n        var labelled = Array.from(document.querySelectorAll(\'aside, section, [role=\"region\"], [role=\"complementary\"], [role=\"dialog\"], div[aria-label]\')).filter(function(n) {\n            return n.isConnected && /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(n.getAttribute(\'aria-label\') || \'\').trim());\n        });\n        if (labelled.length > 1) { rootAmbiguous = true; return null; }\n        return labelled.length === 1 ? labelled[0] : null;\n    }\n    // Title fallbacks are permitted only inside a queue-specific region, not\n    // an arbitrary aria-controls target or a playlist elsewhere in the page.\n    function queueScope(r) {\n        if (!r) return false;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) return true;\n        if (r.matches(\'#queue-panel, [data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"]\')) return true;\n        return /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(r.getAttribute(\'aria-label\') || \'\').trim());\n    }\n    function titleFallback(n) {\n        // These are specific track-title markers, not positional text guesses\n        // or generic album/artist links. Reject multiple distinct candidates.\n        var candidates = Array.from(n.querySelectorAll(\'[class*=\"ListRowTitle__ListRowText\"]\')).filter(function(el) {\n            return el.isConnected && !el.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && !hiddenBeforeTap(el) && !!text(el);\n        });\n        candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });\n        return candidates.length === 1 ? candidates[0] : null;\n    }\n    // Spotify\'s queue may use an explicit Encore title rather than a track\n    // link. This is limited to actual rows under #queue-panel, never a\n    // neighbouring history or an arbitrary aria-controls target.\n    function semanticTitle(n) {\n        if (!n.closest(\'#queue-panel\')) return null;\n        var titles = Array.from(n.querySelectorAll(\'[data-encore-id=\"listRowTitle\"]\')).filter(function(el) {\n            if (!el.isConnected || hiddenBeforeTap(el) || !text(el) || el.closest(\'button, [role=\"switch\"]\') || el.querySelector(\'a[href*=\"/artist/\"], [data-encore-id=\"listRowSubtitle\"]\')) return false;\n            var clickable = el.closest(\'[role=\"button\"]\');\n            // A row itself may be clickable; a separate action control is not a song.\n            return !clickable || (n.contains(clickable) && !!clickable.querySelector(\'[data-encore-id=\"listRowSubtitle\"]\'));\n        });\n        titles = titles.filter(function(el) { return !titles.some(function(other) { return other !== el && el.contains(other); }); });\n        return titles.length === 1 ? titles[0] : null;\n    }\n    function rows(r) {\n        if (!queueScope(r)) return [];\n        // A labelled outer sidebar can contain both queue and listening history.\n        // If there is an explicit queue panel, read only that subtree.\n        var panels = r.matches(\'#queue-panel\') ? [r] : Array.from(r.querySelectorAll(\'#queue-panel\'));\n        if (panels.length > 1) return [];\n        var scope = panels.length === 1 ? panels[0] : r;\n        var list = Array.from(scope.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !hiddenBeforeTap(n) && !n.closest(\'#history-panel\') && !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        if (!list.length) {\n            // No row markers: one row per track link, its closest list item or row-like block.\n            var seen = [];\n            Array.from(scope.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\')).forEach(function(a) {\n                var row = a.closest(\'li, [role=\"listitem\"], [draggable=\"true\"], [data-encore-id=\"listRow\"]\') || a.parentElement && a.parentElement.parentElement || a;\n                if (!hiddenBeforeTap(a) && !hiddenBeforeTap(row) && !a.closest(\'#history-panel\') && seen.indexOf(row) < 0) seen.push(row);\n            });\n            list = seen;\n        }\n        if (!list.length && queueScope(r)) {\n            // Newer Encore queue rows may have a title marker without any\n            // track href. Only row containers bearing that marker qualify.\n            var marked = Array.from(scope.querySelectorAll(\'li, [role=\"listitem\"], [data-encore-id=\"listRow\"]\')).filter(function(n) { return !hiddenBeforeTap(n) && !n.closest(\'#history-panel\') && (!!semanticTitle(n) || !!titleFallback(n)); });\n            list = marked.filter(function(n) { return !marked.some(function(other) { return other !== n && n.contains(other); }); });\n        }\n        // Scan beyond invalid/placeholder rows, but cap the work. Only the\n        // first 40 validated rows are ultimately returned.\n        var output = [];\n        list.slice(0, 400).some(function(n) {\n            var candidates = Array.from(n.querySelectorAll(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });\n            candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });\n            if (candidates.length > 1) return false;\n            var t = candidates[0] || null;\n            var semantic = !t ? semanticTitle(n) : null;\n            if (!t) t = semantic;\n            if (!t && queueScope(r)) t = titleFallback(n);\n            var artistRoot = semantic ? n.querySelector(\'[data-encore-id=\"listRowSubtitle\"]\') : n;\n            var artists = artistRoot ? Array.from(artistRoot.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).filter(function(el) { return !hiddenBeforeTap(el); }).map(text).filter(Boolean) : [];\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            if (!artists.length && t && queueScope(r)) {\n                var details = Array.from(n.querySelectorAll(\'[class*=\"ListRowDetails__ListRowDetailText\"]\')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });\n                if (details.length === 1) artists.push(text(details[0]));\n            }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            var item = {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration, current: n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-testid\') === \'queue-now-playing\'};\n            if (item.title) output.push(item);\n            return output.length >= 40;\n        });\n        return output;\n    }\n    // Failure-only structural fingerprint. Every character is a fixed category\n    // or a count capped at 9; no page text, IDs, hrefs or arbitrary labels leave\n    // the WebView. This does not read a different panel or perform any action.\n    function emptyShape(r, trigger) {\n        if (!r) return \'\';\n        var kind = 7;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) kind = 0;\n        else if (r.matches(\'[data-testid=\"queue-page\"]\')) kind = 1;\n        else if (r.matches(\'[data-testid=\"queue-view\"]\')) kind = 2;\n        else if (r.matches(\'[data-testid=\"queue-panel\"]\')) kind = 3;\n        else if (r.matches(\'[data-testid=\"NPV-queue\"]\')) kind = 4;\n        else if (r.matches(\'#queue-panel\')) kind = 8;\n        else if (trigger && trigger.getAttribute(\'aria-controls\') && document.getElementById(trigger.getAttribute(\'aria-controls\')) === r) kind = 5;\n        else kind = 6;\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'shape:\' + [kind, Math.min(r.children.length,9), count(\'*\'),\n            count(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\'),\n            count(\'a[href]\'), count(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\'),\n            count(\'a[href^=\"spotify:track:\"], a[href^=\"spotify:episode:\"]\'),\n            count(\'[data-uri], [data-track-uri], [data-spotify-uri]\'),\n            count(\'[data-testid*=\"track\" i]\'), count(\'li, [role=\"listitem\"]\'),\n            count(\'[role=\"row\"]\'), count(\'[data-testid*=\"queue\" i]\'),\n            count(\'[data-encore-id=\"listRow\"]\'), String(r.textContent || \'\').trim() ? 1 : 0].join(\'\');\n    }\n    // Extra bounded categories diagnose which supported row shapes exist if\n    // extraction still fails. Never return selectors, text or attribute values.\n    function emptyDetail(r) {\n        if (!r) return \'\';\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'detail:\' + [count(\'#queue-panel\'), count(\'[class*=\"ListRowTitle__ListRowText\"]\'),\n            count(\'[class*=\"ListRowDetails__ListRowDetailText\"]\'), count(\'a[href*=\"/artist/\"]\'),\n            count(\'a[href*=\"/album/\"]\'), count(\'[data-context-item-type=\"track\"], [data-context-item-type=\"episode\"]\'),\n            count(\'[role=\"gridcell\"]\'), count(\'[data-encore-id=\"text\"]\'), count(\'[data-flip-id*=\"section-header-\"]\')].join(\'\');\n    }\n    function semanticDetail(r) {\n        var panels = Array.from(r.querySelectorAll(\'#queue-panel\'));\n        if (r.matches(\'#queue-panel\')) panels.unshift(r);\n        if (panels.length !== 1) return \'sem:\' + Math.min(panels.length, 9) + \'0000\';\n        var panel = panels[0], titles = Array.from(panel.querySelectorAll(\'[data-encore-id=\"listRowTitle\"]\'));\n        var rowCount = Array.from(panel.querySelectorAll(\'li, [role=\"listitem\"], [role=\"row\"], [data-encore-id=\"listRow\"]\')).filter(function(n) { return !!semanticTitle(n); }).length;\n        return \'sem:\' + [1, Math.min(titles.length,9), Math.min(panel.querySelectorAll(\'[data-encore-id=\"listRowSubtitle\"]\').length,9), Math.min(rowCount,9), Math.min(titles.filter(hiddenBeforeTap).length,9)].join(\'\');\n    }\n    // Temporarily size zero-height containers. Restore only properties that\n    // still have our value, preserving concurrent changes made by Spotify.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            var entry = {node:n, hadStyle:n.hasAttribute(\'style\'), props:[]};\n            sized.push(entry);\n            function set(prop, value) {\n                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);\n                n.style.setProperty(prop, value, \'important\');\n            }\n            if (cs.display === \'none\') set(\'display\', \'block\');\n            if (cs.visibility === \'hidden\') set(\'visibility\', \'visible\');\n            if (small) set(\'min-height\', \'640px\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try {\n            e.props.forEach(function(p) {\n                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== \'important\') return;\n                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);\n            });\n            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute(\'style\');\n        } catch (_) {} });\n        sized = [];\n    }\n    // Only an explicitly named queue close control inside the recognised\n    // panel is eligible; generic close buttons elsewhere are never clicked.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            return n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n) &&\n                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d[\'\u2019]attente|masquer la file d[\'\u2019]attente)$/i.test(label));\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button();\n        var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && !already && hiddenBeforeTap(b)) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4500, forced = false;\n        (function step() {\n          try {\n            var r = null, list = [];\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];\n            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                var marked = list.filter(function(x) { return x.current; });\n                job.now = marked.length === 1 ? line(marked[0]) : \'\';\n                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else {\n                log(r ? \'rows:0\' : \'panel:absent\');\n                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.\n                log(\'path:\' + (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) ? \'queue\' : \'other\'));\n                log(\'links:\' + Math.min(r ? r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\').length : 0, 99));\n                log(\'rowsdoc:\' + Math.min(document.querySelectorAll(\'[data-testid=\"tracklist-row\"], [role=\"row\"]\').length, 99));\n                if (r) { log(emptyShape(r, b)); log(emptyDetail(r)); log(semanticDetail(r)); }\n                finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\');\n            }\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)(\"run\");"

    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$8;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide v3, v13

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object v13, v8

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$8;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v0, v15, v13}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 220
    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "demarrage:erreur"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 221
    :goto_0
    return-void
.end method

.method private message(Ljava/lang/String;)V
    .locals 2

    .line 146
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method private paintControls()V
    .locals 6

    .line 139
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 140
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v1, v1, v0

    if-nez v1, :cond_0

    goto :goto_1

    .line 141
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    const v2, 0x3f4ccccd    # 0.8f

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setAlpha(F)V

    .line 142
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[I

    aget v4, v4, v0

    const v5, -0x4b513b

    invoke-static {v2, v3, v4, v5}, Lcom/melodix/music/PreviewPanelIcon;->tile(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 143
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : consulter si disponible"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 139
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 145
    :cond_1
    return-void
.end method

.method private panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 10

    .line 246
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lyricsLive:Z

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->lyricsLive:Z

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    invoke-virtual {p4, v3}, Landroid/widget/Button;->setEnabled(Z)V

    return-void

    .line 247
    :cond_0
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    .line 248
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    .line 249
    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    if-ne p1, v3, :cond_1

    const-string p1, "Paroles non disponibles sur cette page Spotify"

    goto :goto_0

    :cond_1
    const-string p1, "Appareils non disponibles sur cette page Spotify"

    :goto_0
    move-object v4, p1

    const-string v5, "Le bouton correspondant est absent de la page."

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 250
    :cond_2
    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    if-ne p1, v3, :cond_3

    const-string v0, "Spotify ne propose pas de paroles pour ce titre"

    goto :goto_1

    :cond_3
    const-string v0, "Appareils indisponibles pour le moment"

    :goto_1
    move-object v8, v0

    if-ne p1, v3, :cond_4

    const-string p1, "Le contr\u00f4le des paroles Spotify est d\u00e9sactiv\u00e9 ; aucune ligne n\u2019est disponible."

    goto :goto_2

    :cond_4
    const-string p1, "Le bouton Spotify est d\u00e9sactiv\u00e9 ; r\u00e9essayez plus tard."

    :goto_2
    move-object v9, p1

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v4 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 251
    :cond_5
    const-string v1, "busy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v8, "Un panneau est d\u00e9j\u00e0 en cours"

    const-string v9, "Attendez sa fermeture avant de r\u00e9essayer."

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v4 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 252
    :cond_6
    const-string v1, "close-unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v8, "Fermeture du panneau non confirm\u00e9e"

    const-string v9, "Le contenu n\u2019a pas \u00e9t\u00e9 pr\u00e9sent\u00e9 comme confirm\u00e9 ; voir le diagnostic."

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v4 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 253
    :cond_7
    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v8, "Lecture refus\u00e9e"

    const-string v9, "Plusieurs contr\u00f4les ou panneaux possibles ; aucun choix arbitraire."

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v4 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 254
    :cond_8
    if-ne p1, v3, :cond_9

    const-string v0, "Paroles indisponibles"

    goto :goto_3

    :cond_9
    const-string v0, "Liste d\u2019appareils indisponible"

    :goto_3
    move-object v8, v0

    if-ne p1, v3, :cond_a

    const-string p1, "Contenu non lu ; touchez R\u00e9essayer."

    goto :goto_4

    :cond_a
    const-string p1, "Liste non lue ; touchez R\u00e9essayer."

    :goto_4
    move-object v9, p1

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v4 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    return-void
.end method

.method private panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 239
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/high16 v0, 0x41900000    # 18.0f

    const/4 v1, -0x1

    invoke-direct {p0, p1, p4, v1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_0

    const p4, -0x384424

    const/high16 v0, 0x41600000    # 14.0f

    invoke-direct {p0, p1, p5, p4, v0}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p1

    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p4, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 241
    return-void
.end method

.method private parseObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 207
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :cond_0
    return-object v0

    :catch_0
    move-exception p1

    return-object v0
.end method

.method private pollClosed(ILandroid/app/Activity;JLjava/lang/String;I)V
    .locals 9

    .line 343
    const/16 v0, 0x2c

    if-gt p6, v0, :cond_2

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-nez v0, :cond_2

    .line 344
    if-nez p1, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    :goto_0
    cmp-long v0, p3, v0

    if-nez v0, :cond_2

    invoke-static {p5}, Lcom/melodix/music/PreviewPlayerTiles;->validJobId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 345
    :cond_1
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$17;

    move-object v1, v0

    move-object v2, p0

    move-wide v3, p3

    move v5, p1

    move-object v6, p2

    move-object v7, p5

    move v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$17;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JILandroid/app/Activity;Ljava/lang/String;I)V

    const-wide/16 p1, 0xfa

    invoke-virtual {p0, v0, p1, p2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 358
    return-void

    .line 344
    :cond_2
    :goto_1
    return-void
.end method

.method private pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 328
    move-object v12, p0

    move/from16 v10, p8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "demarre:lectures="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v12, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    const/16 v0, 0x2c

    if-le v10, v0, :cond_0

    return-void

    .line 329
    :cond_0
    new-instance v13, Lcom/melodix/music/PreviewPlayerTiles$16;

    move-object v0, v13

    move-object v1, p0

    move-wide/from16 v2, p6

    move-object/from16 v4, p3

    move-object/from16 v5, p2

    move v6, p1

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p10

    move/from16 v10, p8

    move-object/from16 v11, p9

    invoke-direct/range {v0 .. v11}, Lcom/melodix/music/PreviewPlayerTiles$16;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;ILandroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;ILjava/lang/String;)V

    const-wide/16 v0, 0xfa

    invoke-virtual {p0, v13, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 339
    return-void
.end method

.method private pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 11

    .line 223
    move-object v9, p0

    move/from16 v8, p7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "demarre:lectures="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    .line 224
    const/16 v0, 0x1e

    if-le v8, v0, :cond_1

    iget-wide v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    cmp-long v0, p5, v0

    if-nez v0, :cond_0

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    move-object v4, p2

    if-ne v0, v4, :cond_0

    const-string v0, "delai"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    move-object v5, p1

    move-object v6, p3

    move-object v7, p4

    invoke-direct {p0, p1, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    :cond_0
    return-void

    .line 225
    :cond_1
    move-object v5, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    new-instance v10, Lcom/melodix/music/PreviewPlayerTiles$9;

    move-object v0, v10

    move-object v1, p0

    move-wide/from16 v2, p5

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$9;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    const-wide/16 v0, 0xfa

    invoke-virtual {p0, v10, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 235
    return-void
.end method

.method private probe(ILandroid/app/Activity;)V
    .locals 7

    .line 79
    const-string v0, "page inaccessible"

    if-nez p1, :cond_0

    const-string v1, "queue"

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    const-string v1, "lyrics"

    goto :goto_0

    :cond_1
    const-string v1, "devices"

    :goto_0
    sget-object v2, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    aget-wide v3, v2, p1

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    aput-wide v3, v2, p1

    .line 81
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "G"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 82
    instance-of v2, p2, Landroid/webkit/WebView;

    if-nez v2, :cond_2

    sget-object p2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aput-object v0, p2, p1

    return-void

    .line 83
    :cond_2
    check-cast p2, Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "((function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');});\n    var controls={\n        queue:/^(control-button-queue|queue-button)$/i,\n        lyrics:/^(lyrics-button|control-button-lyrics)$/i,\n        devices:/^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i\n    };\n    var labels={\n        queue:/^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i,\n        lyrics:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n        devices:/^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i\n    };\n    var triggers=Array.from(document.querySelectorAll(\'button,[role=\"button\"]\')).filter(function(b){\n        return b.isConnected && (controls[kind].test(String(b.getAttribute(\'data-testid\')||\'\')) || labels[kind].test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        controls:Math.min(triggers.length,99), buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n)("

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$3;

    invoke-direct {v2, p0, v3, v4, p1}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V

    invoke-virtual {p2, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    goto :goto_1

    :catch_0
    move-exception p2

    sget-object p2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aput-object v0, p2, p1

    .line 97
    :goto_1
    return-void
.end method

.method private queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 7

    .line 158
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    .line 159
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "ambiguous"

    if-eqz v2, :cond_0

    const-string v2, "File non disponible sur cette page Spotify"

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "Lecture refus\u00e9e"

    goto :goto_0

    :cond_1
    const-string v2, "busy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "Un panneau est d\u00e9j\u00e0 en cours"

    goto :goto_0

    :cond_2
    const-string v2, "close-unverified"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "Fermeture de la file non confirm\u00e9e"

    goto :goto_0

    :cond_3
    const-string v2, "File indisponible"

    :goto_0
    const/high16 v4, 0x41900000    # 18.0f

    const/4 v5, -0x1

    invoke-direct {p0, p1, v2, v5, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v2

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42200000    # 40.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v0, "Le bouton File d\u2019attente est absent de la page."

    goto :goto_1

    :cond_4
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Plusieurs contr\u00f4les ou panneaux possibles ; aucun choix arbitraire."

    goto :goto_1

    :cond_5
    const-string v0, "Touchez R\u00e9essayer pour relire la file."

    :goto_1
    const v1, -0x384424

    const/high16 v2, 0x41600000    # 14.0f

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p1

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v5, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 161
    return-void
.end method

.method private readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 16

    .line 100
    move-object/from16 v8, p0

    move/from16 v0, p1

    move-object/from16 v9, p4

    const-string v10, "Indisponible dans cette version"

    iget-wide v1, v8, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v3, 0x1

    add-long v11, v1, v3

    iput-wide v11, v8, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    if-nez v0, :cond_0

    const-string v1, "queue"

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const-string v1, "lyrics"

    goto :goto_0

    :cond_1
    const-string v1, "devices"

    .line 101
    :goto_0
    const-string v2, "Chargement\u2026"

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "G"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    move-object/from16 v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 104
    instance-of v3, v2, Landroid/webkit/WebView;

    if-nez v3, :cond_2

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 105
    :cond_2
    move-object v13, v2

    check-cast v13, Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "((function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n)("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    new-instance v15, Lcom/melodix/music/PreviewPlayerTiles$4;

    move-object v1, v15

    move-object/from16 v2, p0

    move-wide v3, v11

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p1

    invoke-direct/range {v1 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;I)V

    invoke-virtual {v13, v14, v15}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 123
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$5;

    move-object v1, v0

    move-object/from16 v2, p0

    move-wide v3, v11

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    const-wide/16 v1, 0xdac

    invoke-virtual {v8, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    :goto_1
    return-void
.end method

.method private readTrace(Landroid/app/Activity;)V
    .locals 2

    .line 70
    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_1

    return-void

    .line 71
    :cond_1
    :try_start_0
    const-string v0, "(function(){var t=window.__melodixOpenTrace;if(!t||typeof t!==\'object\')return \'\';var n=function(x){return typeof x===\'number\'&&isFinite(x)&&x>=0?String(Math.min(Math.round(x),9999999)):\'-\';};var k=t.kind===\'liked\'||t.kind===\'playlist\'?t.kind:\'-\';var ph=/^(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable)$/.test(String(t.phase))?t.phase:\'-\';return [k,ph,n(t.nav),n(t.ready),n(t.dom),n(t.classified),n(t.rendered),n(t.first),n(t.full),n(t.updates)].join(\',\');})()"

    new-instance v1, Lcom/melodix/music/PreviewPlayerTiles$2;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 75
    :catch_0
    move-exception p1

    :goto_1
    nop

    .line 76
    return-void
.end method

.method private recover(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 8

    .line 322
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v1, p1, -0x1

    const-string v2, "demarrage:recuperation"

    aput-object v2, v0, v1

    .line 323
    invoke-direct {p0, p2}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    invoke-direct {p0, p1, p2, p4, p5}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 324
    :cond_0
    :try_start_0
    const-string v2, "(function(){try{var b=document.querySelector(\'[data-testid=\"lyrics-button\"],[data-testid=\"control-button-lyrics\"]\');if(b&&(b.getAttribute(\'aria-pressed\')===\'true\'||b.getAttribute(\'data-active\')===\'true\'))b.click();document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}));window.__melodixDrawerUnsafe=false;window.__melodixDrawerLease=null;return \'ok\'}catch(e){return \'error\'}})()"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$15;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p3

    move v4, p1

    move-object v5, p2

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$15;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 326
    return-void

    .line 324
    :catch_0
    move-exception v0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    invoke-direct {p0, p1, p2, p4, p5}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method private removable(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 13

    .line 185
    move-object/from16 v7, p3

    const/4 v0, 0x0

    :goto_0
    invoke-virtual/range {p3 .. p3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v8, 0x1

    if-ge v0, v1, :cond_1

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "\u00c0 suivre"

    invoke-virtual {v2, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/2addr v0, v8

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    :goto_1
    move v9, v0

    .line 186
    if-gez v9, :cond_2

    return-void

    .line 187
    :cond_2
    move v10, v9

    :goto_2
    invoke-virtual/range {p3 .. p3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge v10, v0, :cond_3

    sub-int v3, v10, v9

    invoke-virtual {v7, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11, v8}, Landroid/view/View;->setClickable(Z)V

    .line 188
    new-instance v12, Lcom/melodix/music/PreviewPlayerTiles$6;

    move-object v0, v12

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;ILandroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v11, v12}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 202
    :cond_3
    return-void
.end method

.method private renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 22

    .line 257
    move-object/from16 v9, p0

    move/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    move-object/from16 v1, p6

    sget-object v2, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v3, v0, -0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p6 .. p6}, Lcom/melodix/music/PreviewPlayerTiles;->resultCode(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "journal"

    const-string v13, ""

    invoke-virtual {v1, v5, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 258
    const-string v2, "transfer"

    move-object/from16 v4, p7

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v4, "reason"

    const-string v5, "ok"

    const/4 v14, 0x0

    const/4 v15, 0x1

    if-eqz v2, :cond_3

    .line 259
    const-string v2, "transferred"

    invoke-virtual {v1, v2, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v5, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 260
    if-eqz v2, :cond_0

    invoke-virtual {v1, v4, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "close-unverified"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 261
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Transfert confirm\u00e9 ; fermeture non confirm\u00e9e"

    invoke-static {v1, v2, v15}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 262
    iput-object v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    invoke-direct {v9, v0, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 264
    :cond_0
    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    aget-object v1, v1, v3

    const-string v3, "target:already-active"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 265
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v3

    if-eqz v5, :cond_2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_1

    const-string v1, "Cet appareil est d\u00e9j\u00e0 actif"

    goto :goto_0

    :cond_1
    const-string v1, "Lecture transf\u00e9r\u00e9e (v\u00e9rifi\u00e9)"

    goto :goto_0

    :cond_2
    const-string v1, "Transfert non v\u00e9rifi\u00e9, R\u00e9essayer"

    :goto_0
    invoke-static {v3, v1, v14}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 266
    const-string v7, "run"

    const-string v8, ""

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 268
    :cond_3
    invoke-virtual {v1, v5, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v1, v4, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    invoke-direct {v9, v0, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 269
    :cond_4
    const-string v2, "body"

    invoke-virtual {v1, v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 270
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v1, "empty"

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    const-string v2, "lecture=non-confirmee:motif=empty"

    aput-object v2, v1, v3

    invoke-direct {v9, v0, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 271
    :cond_5
    iput-boolean v14, v9, Lcom/melodix/music/PreviewPlayerTiles;->recovering:Z

    iget-wide v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    iput-wide v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    aget-object v6, v5, v3

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ":rendu=natif"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    invoke-virtual/range {p4 .. p4}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {v12, v15}, Landroid/widget/Button;->setEnabled(Z)V

    .line 272
    const/4 v8, -0x2

    const/4 v7, 0x0

    const-string v6, "\n"

    const/4 v5, -0x1

    if-ne v0, v15, :cond_d

    .line 273
    :try_start_0
    const-string v0, "active"

    const-string v3, "-1"

    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move v0, v5

    .line 274
    :goto_1
    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 275
    new-array v2, v15, [Landroid/widget/TextView;

    aput-object v7, v2, v14

    .line 276
    move v3, v14

    :goto_2
    array-length v4, v1

    if-ge v3, v4, :cond_a

    const/16 v4, 0xc8

    if-ge v3, v4, :cond_a

    aget-object v4, v1, v3

    if-ltz v0, :cond_8

    if-ne v3, v0, :cond_6

    goto :goto_3

    :cond_6
    if-ge v3, v0, :cond_7

    const v6, -0x4c000001

    goto :goto_4

    :cond_7
    const v6, 0x59ffffff

    goto :goto_4

    :cond_8
    :goto_3
    move v6, v5

    :goto_4
    const/high16 v7, 0x41b00000    # 22.0f

    invoke-direct {v9, v10, v4, v6, v7}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v4

    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 v6, 0x40c00000    # 6.0f

    invoke-direct {v9, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {v9, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-virtual {v4, v14, v7, v14, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-ne v3, v0, :cond_9

    aput-object v4, v2, v14

    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 277
    :cond_a
    iget-boolean v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->lyricsLive:Z

    if-nez v1, :cond_b

    invoke-direct {v9, v11}, Lcom/melodix/music/PreviewPlayerTiles;->riseAll(Landroid/widget/LinearLayout;)V

    .line 278
    :cond_b
    if-ltz v0, :cond_c

    .line 280
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$10;

    invoke-direct {v0, v9, v2, v11}, Lcom/melodix/music/PreviewPlayerTiles$10;-><init>(Lcom/melodix/music/PreviewPlayerTiles;[Landroid/widget/TextView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 281
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$11;

    move-object v1, v0

    move-object/from16 v2, p0

    move-object/from16 v3, p3

    move-object/from16 v4, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/melodix/music/PreviewPlayerTiles$11;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-wide/16 v1, 0x9c4

    invoke-virtual {v9, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_5

    .line 282
    :cond_c
    iput-boolean v14, v9, Lcom/melodix/music/PreviewPlayerTiles;->lyricsLive:Z

    .line 283
    :goto_5
    return-void

    .line 285
    :cond_d
    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 287
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 288
    array-length v3, v1

    move v4, v14

    :goto_6
    const-string v7, "1"

    const-string v15, "\t"

    const/4 v14, 0x2

    if-ge v4, v3, :cond_f

    aget-object v8, v1, v4

    invoke-virtual {v8, v15, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v15

    array-length v5, v15

    if-le v5, v14, :cond_e

    aget-object v5, v15, v14

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_7

    :cond_e
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_7
    add-int/lit8 v4, v4, 0x1

    const/4 v5, -0x1

    const/4 v7, 0x0

    const/4 v8, -0x2

    const/4 v14, 0x0

    const/4 v15, 0x1

    goto :goto_6

    .line 289
    :cond_f
    nop

    .line 290
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    const/4 v1, 0x0

    const/4 v5, 0x0

    :goto_8
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 291
    const/4 v3, -0x1

    invoke-virtual {v2, v15, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    if-eqz v3, :cond_1b

    const/4 v3, 0x0

    aget-object v4, v2, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_10

    move/from16 v16, v3

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    const/4 v2, -0x1

    const/4 v12, -0x2

    const/16 v17, 0x0

    goto/16 :goto_13

    .line 292
    :cond_10
    aget-object v8, v2, v3

    array-length v3, v2

    if-le v3, v14, :cond_11

    aget-object v3, v2, v14

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    const/4 v3, 0x1

    goto :goto_9

    :cond_11
    const/4 v3, 0x0

    :goto_9
    array-length v4, v2

    const/4 v14, 0x1

    if-le v4, v14, :cond_12

    aget-object v2, v2, v14

    goto :goto_a

    :cond_12
    move-object v2, v13

    .line 293
    :goto_a
    const/high16 v4, 0x41500000    # 13.0f

    const v14, -0x485533

    if-eqz v3, :cond_13

    if-nez v5, :cond_13

    const-string v5, "Appareil actuel"

    invoke-direct {v9, v10, v5, v14, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v5

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x41f00000    # 30.0f

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v14

    move-object/from16 v21, v7

    const/4 v7, -0x1

    invoke-direct {v4, v7, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v14, 0x1

    goto :goto_b

    :cond_13
    move-object/from16 v21, v7

    .line 294
    move v14, v5

    :goto_b
    if-nez v3, :cond_14

    if-nez v1, :cond_14

    const-string v1, "S\u00e9lectionner un appareil"

    const/high16 v4, 0x41500000    # 13.0f

    const v5, -0x485533

    invoke-direct {v9, v10, v1, v5, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v1

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42200000    # 40.0f

    invoke-direct {v9, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const/4 v7, -0x1

    invoke-direct {v4, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v19, 0x1

    goto :goto_c

    .line 295
    :cond_14
    move/from16 v19, v1

    :goto_c
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, v10}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_15

    move-object v2, v13

    goto :goto_d

    :cond_15
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_d
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v3, :cond_16

    const-string v2, "\nActif \u00b7 lecture en cours"

    goto :goto_e

    :cond_16
    move-object v2, v13

    :goto_e
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v3, :cond_17

    const/4 v2, 0x1

    goto :goto_f

    :cond_17
    const/4 v2, 0x6

    :goto_f
    const/4 v5, -0x1

    invoke-static {v10, v1, v2, v5}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 296
    if-eqz v3, :cond_18

    move v1, v5

    goto :goto_10

    :cond_18
    const v1, -0x212b13

    :goto_10
    invoke-virtual {v7, v1}, Landroid/widget/Button;->setTextColor(I)V

    const/4 v4, 0x0

    invoke-virtual {v7, v4}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {v9, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-direct {v9, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    const/high16 v0, 0x41000000    # 8.0f

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v9, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v7, v2, v4, v1, v5}, Landroid/widget/Button;->setPadding(IIII)V

    .line 297
    const v1, 0x800013

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setGravity(I)V

    const/4 v5, 0x0

    invoke-virtual {v7, v5}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-static {v10, v3}, Lcom/melodix/music/PreviewPlayerSheet;->actionBackground(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 298
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v3, :cond_19

    const-string v2, ", appareil actif"

    goto :goto_11

    :cond_19
    const-string v2, ", transf\u00e9rer la lecture vers cet appareil"

    :goto_11
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 300
    if-nez v3, :cond_1a

    new-instance v4, Lcom/melodix/music/PreviewPlayerTiles$12;

    move-object v1, v4

    move-object/from16 v2, p0

    move/from16 v3, p1

    move-object v0, v4

    const/16 v16, 0x0

    move-object/from16 v4, p2

    move-object/from16 v17, v5

    const/4 v10, -0x1

    move-object/from16 v5, p3

    move-object/from16 v20, v6

    move-object/from16 v6, p4

    move-object v10, v7

    move-object/from16 v7, p5

    const/4 v12, -0x2

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$12;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v10, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_12

    :cond_1a
    move-object/from16 v17, v5

    move-object/from16 v20, v6

    move-object v10, v7

    const/4 v12, -0x2

    const/16 v16, 0x0

    .line 301
    :goto_12
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v0, v2, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {v9, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v11, v10, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 302
    move/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v12, p5

    move v5, v14

    move/from16 v1, v19

    move-object/from16 v6, v20

    move-object/from16 v7, v21

    const/4 v14, 0x2

    goto/16 :goto_8

    .line 291
    :cond_1b
    move-object/from16 v20, v6

    move-object/from16 v21, v7

    const/4 v2, -0x1

    const/4 v12, -0x2

    const/16 v16, 0x0

    const/16 v17, 0x0

    .line 290
    :goto_13
    move/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v12, p5

    move-object/from16 v6, v20

    move-object/from16 v7, v21

    const/4 v14, 0x2

    goto/16 :goto_8

    .line 303
    :cond_1c
    invoke-direct {v9, v11}, Lcom/melodix/music/PreviewPlayerTiles;->riseAll(Landroid/widget/LinearLayout;)V

    .line 304
    return-void
.end method

.method private renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 10

    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p4}, Lcom/melodix/music/PreviewPlayerTiles;->resultCode(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "journal"

    const-string v2, ""

    invoke-virtual {p4, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 170
    const-string v0, "ok"

    const/4 v1, 0x0

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "reason"

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 171
    :cond_0
    const-string v0, "now"

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const-string v4, "next"

    if-eqz v3, :cond_1

    invoke-virtual {p4, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 172
    const-string p4, "empty"

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string p4, "lecture=non-confirmee:motif=empty"

    sput-object p4, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 174
    :cond_1
    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ":rendu=natif"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const/high16 v5, 0x41500000    # 13.0f

    const v6, -0x587406

    const/4 v7, -0x1

    if-nez v3, :cond_2

    const-string v3, "En cours de lecture"

    invoke-direct {p0, p1, v3, v6, v5}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v3

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42000000    # 32.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    invoke-direct {v8, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 176
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Titres de la file"

    goto :goto_0

    :cond_3
    const-string v0, "\u00c0 suivre"

    :goto_0
    invoke-direct {p0, p1, v0, v6, v5}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42200000    # 40.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v3, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    invoke-virtual {p4, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 178
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    const p4, -0x384424

    const/high16 v0, 0x41600000    # 14.0f

    const-string v1, "Aucun titre \u00e0 suivre"

    invoke-direct {p0, p1, v1, p4, v0}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p1

    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p4, v7, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2

    .line 179
    :cond_4
    const-string v0, "\n"

    invoke-virtual {p4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    array-length v0, p4

    :goto_1
    if-ge v1, v0, :cond_5

    aget-object v2, p4, v1

    invoke-direct {p0, p1, p2, v2}, Lcom/melodix/music/PreviewPlayerTiles;->addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 180
    :cond_5
    :goto_2
    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-direct {p0, p2}, Lcom/melodix/music/PreviewPlayerTiles;->riseAll(Landroid/widget/LinearLayout;)V

    .line 181
    return-void
.end method

.method private static resultCode(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 2

    .line 36
    const-string v0, "ok"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "lecture=ok"

    return-object p0

    .line 37
    :cond_0
    const-string v0, "reason"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 38
    const-string v0, "(absent|ambiguous|disabled|panel|empty|close-unverified|command|error|target|unverified)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "unknown"

    .line 39
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lecture=non-confirmee:motif="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private riseAll(Landroid/widget/LinearLayout;)V
    .locals 2

    .line 203
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewUiRestyle;->rise(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 5

    .line 150
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 151
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    const v1, 0x40ffffff    # 7.9999995f

    const/high16 v2, 0x41600000    # 14.0f

    const-string v3, "\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\n\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac"

    invoke-direct {p0, p1, v3, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "Chargement de la file"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42600000    # 56.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 152
    :cond_0
    return-void
.end method

.method private syncVolume()V
    .locals 2

    .line 397
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 398
    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->readTrace(Landroid/app/Activity;)V

    .line 399
    :cond_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    .line 400
    return-void
.end method

.method private static validJobId(Ljava/lang/String;)Z
    .locals 1

    .line 155
    const-string v0, "[0-9]{1,16}:[0-9]{1,9}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private web(Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 3

    .line 147
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "G"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    check-cast p1, Landroid/webkit/WebView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    :cond_0
    return-object v0

    :catch_0
    move-exception p1

    return-object v0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 3

    .line 401
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 402
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 403
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$21;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerTiles$21;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 404
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$22;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerTiles$22;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
