.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# static fields
.field private static final PANEL_JOB:Ljava/lang/String; = "(function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    W.__melodixDrawerLease = job;\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            main: true,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0, rootAmbiguous = false;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {\n            // Spotify may give the trigger itself a device-picker testid.\n            // A button is not its own content panel and must not imply open.\n            return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');\n        });\n        // Nested wrappers can describe the same panel; unrelated roots are\n        // ambiguous and must never be treated as the current content.\n        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });\n        if (hits.length === 1) return hits[0];\n        if (hits.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        if (c && c !== b && c.isConnected && !c.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return c;\n        if (spec.main) {\n            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.\n            var main = document.querySelector(\'#main-view, main\');\n            return main && main.querySelector(\'[data-testid*=\"lyric\" i]\') ? main : null;\n        }\n        // Device picker opens as a popover/dialog mentioning devices.\n        var pops = Array.from(document.querySelectorAll(\'[role=\"dialog\"], [data-tippy-root], [id^=\"tippy\"]\')).filter(function(n) {\n            return n.isConnected && n !== b && /appareil|device|dispositivo|ger\u00e4t/i.test(String(n.getAttribute(\'aria-label\') || \'\'));\n        });\n        if (pops.length > 1) rootAmbiguous = true;\n        return pops.length === 1 ? pops[0] : null;\n    }\n    function lyricLines(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'[data-testid*=\"lyric\" i]\')).filter(function(n) {\n            // A button such as lyrics-close-button is a control, not a lyric\n            // line. Ignoring it lets the paragraph fallback read real lines.\n            return !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && (!n.children.length || !n.querySelector(\'[data-testid*=\"lyric\" i]\'));\n        });\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'p\'));\n        var lines = [], active = -1, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = text(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced ? active : -1, synced: synced};\n    }\n    function deviceRows(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    // The page is hidden: a panel (or one of its parents) can measure 0 px, and\n    // Spotify then draws no rows in it. Give it a size while it is read, then\n    // restore the original inline style exactly. No other change to the page.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            sized.push([n, n.getAttribute(\'style\')]);\n            if (cs.display === \'none\') n.style.setProperty(\'display\', \'block\', \'important\');\n            if (cs.visibility === \'hidden\') n.style.setProperty(\'visibility\', \'visible\', \'important\');\n            if (small) n.style.setProperty(\'min-height\', \'640px\', \'important\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute(\'style\'); else e[0].setAttribute(\'style\', e[1]); } catch (_) {} });\n        sized = [];\n    }\n    // Close only a unique, panel-specific control inside the recognised\n    // panel. An ambiguous or generic close button is never used.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            var known = kind===\'lyrics\' ? /^(lyrics-close-button|close-lyrics-button)$/.test(id) || /^(close lyrics|hide lyrics|fermer les paroles|masquer les paroles)$/i.test(label) :\n                /^(devices-close-button|close-devices-button)$/.test(id) || /^(close devices|close device picker|fermer les appareils|fermer la liste des appareils)$/i.test(label);\n            return known && n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n);\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button(); var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4000, forced = false;\n        (function step() {\n          try {\n            var r = null;\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null;\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r).length);\n            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\'); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); return;\n            }\n            var rows = deviceRows(r);\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); return; }\n                var targetNode = target[0].node;\n                if (targetNode.disabled || targetNode.matches(\':disabled\') || targetNode.closest(\'[aria-disabled=\"true\"]\') || hiddenBeforeTap(targetNode)) {\n                    log(\'target:disabled\'); finish(false, \'target\'); return;\n                }\n                try { targetNode.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                  try {\n                    var again = null;\n                    try {\n                        var r2 = root(button() || b), matches = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; }) : [];\n                        // Name alone is not a device identity if a duplicate\n                        // arrives after the tap. Do not claim confirmation.\n                        again = matches.length === 1 ? matches[0] : null;\n                    } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\');\n                  } catch (_) { finish(false, \'error\'); }\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\');\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n"

.field private static final PANEL_PROBE:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');});\n    var controls={\n        queue:/^(control-button-queue|queue-button)$/i,\n        lyrics:/^(lyrics-button|control-button-lyrics)$/i,\n        devices:/^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i\n    };\n    var labels={\n        queue:/^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i,\n        lyrics:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n        devices:/^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i\n    };\n    var triggers=Array.from(document.querySelectorAll(\'button,[role=\"button\"]\')).filter(function(b){\n        return b.isConnected && (controls[kind].test(String(b.getAttribute(\'data-testid\')||\'\')) || labels[kind].test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        controls:Math.min(triggers.length,99), buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n"

.field private static final PANEL_READ:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n"

.field private static final QUEUE_JOB:Ljava/lang/String; = "(function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    W.__melodixDrawerLease = job;\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0, rootAmbiguous = false;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\'))) {\n            var mainView = document.querySelector(\'#main-view, main\');\n            if (mainView && mainView.isConnected) return mainView;\n        }\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        // A chain of nested markers can describe one queue. Keep the outer\n        // wrapper so headers and rows belonging to that queue are retained;\n        // independent branches remain ambiguous and are never merged.\n        if (found.length > 1) {\n            var leaves = found.filter(function(n) { return !found.some(function(other) { return other !== n && n.contains(other); }); });\n            if (leaves.length === 1) {\n                var outer = found.filter(function(n) { return !found.some(function(other) { return other !== n && other.contains(n); }); });\n                if (outer.length === 1) return outer[0];\n            }\n            rootAmbiguous = true; return null;\n        }\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return controlled;\n        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.\n        var labelled = Array.from(document.querySelectorAll(\'aside, section, [role=\"region\"], [role=\"complementary\"], [role=\"dialog\"], div[aria-label]\')).filter(function(n) {\n            return n.isConnected && /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(n.getAttribute(\'aria-label\') || \'\').trim());\n        });\n        if (labelled.length > 1) { rootAmbiguous = true; return null; }\n        return labelled.length === 1 ? labelled[0] : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        if (!list.length) {\n            // No row markers: one row per track link, its closest list item or row-like block.\n            var seen = [];\n            Array.from(r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\')).forEach(function(a) {\n                var row = a.closest(\'li, [role=\"listitem\"], [draggable=\"true\"], [data-encore-id=\"listRow\"]\') || a.parentElement && a.parentElement.parentElement || a;\n                if (seen.indexOf(row) < 0) seen.push(row);\n            });\n            list = seen;\n        }\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration, current: n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-testid\') === \'queue-now-playing\'};\n        }).filter(function(x) { return x.title; });\n    }\n    // Failure-only structural fingerprint. Every character is a fixed category\n    // or a count capped at 9; no page text, IDs, hrefs or arbitrary labels leave\n    // the WebView. This does not read a different panel or perform any action.\n    function emptyShape(r, trigger) {\n        if (!r) return \'\';\n        var kind = 7;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) kind = 0;\n        else if (r.matches(\'[data-testid=\"queue-page\"]\')) kind = 1;\n        else if (r.matches(\'[data-testid=\"queue-view\"]\')) kind = 2;\n        else if (r.matches(\'[data-testid=\"queue-panel\"]\')) kind = 3;\n        else if (r.matches(\'[data-testid=\"NPV-queue\"]\')) kind = 4;\n        else if (trigger && trigger.getAttribute(\'aria-controls\') && document.getElementById(trigger.getAttribute(\'aria-controls\')) === r) kind = 5;\n        else kind = 6;\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'shape:\' + [kind, Math.min(r.children.length,9), count(\'*\'),\n            count(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\'),\n            count(\'a[href]\'), count(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\'),\n            count(\'a[href^=\"spotify:track:\"], a[href^=\"spotify:episode:\"]\'),\n            count(\'[data-uri], [data-track-uri], [data-spotify-uri]\'),\n            count(\'[data-testid*=\"track\" i]\'), count(\'li, [role=\"listitem\"]\'),\n            count(\'[role=\"row\"]\'), count(\'[data-testid*=\"queue\" i]\'),\n            count(\'[data-encore-id=\"listRow\"]\'), String(r.textContent || \'\').trim() ? 1 : 0].join(\'\');\n    }\n    // The page is hidden: a panel (or one of its parents) can measure 0 px, and\n    // Spotify then draws no rows in it. Give it a size while it is read, then\n    // restore the original inline style exactly. No other change to the page.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            sized.push([n, n.getAttribute(\'style\')]);\n            if (cs.display === \'none\') n.style.setProperty(\'display\', \'block\', \'important\');\n            if (cs.visibility === \'hidden\') n.style.setProperty(\'visibility\', \'visible\', \'important\');\n            if (small) n.style.setProperty(\'min-height\', \'640px\', \'important\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute(\'style\'); else e[0].setAttribute(\'style\', e[1]); } catch (_) {} });\n        sized = [];\n    }\n    // Only an explicitly named queue close control inside the recognised\n    // panel is eligible; generic close buttons elsewhere are never clicked.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            return n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n) &&\n                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d[\'\u2019]attente|masquer la file d[\'\u2019]attente)$/i.test(label));\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button();\n        var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4500, forced = false;\n        (function step() {\n          try {\n            var r = null, list = [];\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];\n            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                var marked = list.filter(function(x) { return x.current; });\n                job.now = marked.length === 1 ? line(marked[0]) : \'\';\n                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else {\n                log(r ? \'rows:0\' : \'panel:absent\');\n                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.\n                log(\'path:\' + (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) ? \'queue\' : \'other\'));\n                log(\'links:\' + Math.min(r ? r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\').length : 0, 99));\n                log(\'rowsdoc:\' + Math.min(document.querySelectorAll(\'[data-testid=\"tracklist-row\"], [role=\"row\"]\').length, 99));\n                if (r) log(emptyShape(r, b));\n                finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\');\n            }\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n"

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

.field private settledSerial:J

.field private final traceTick:Ljava/lang/Runnable;

.field private volumeRunning:Z

.field private webDialog:Lcom/melodix/music/PreviewPlayerSheet;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    const-string v0, "aucune"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 51
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "non observ\u00e9e"

    aput-object v1, v0, v2

    const-string v1, "non observ\u00e9e"

    aput-object v1, v0, v3

    const-string v1, "non observ\u00e9e"

    aput-object v1, v0, v4

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    .line 52
    new-array v0, v5, [J

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    .line 54
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    .line 58
    const-string v0, "non lue"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    .line 60
    const-string v0, "\nAffichage lecteur : non observ\u00e9"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    .line 205
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "aucune"

    aput-object v1, v0, v2

    const-string v1, "aucune"

    aput-object v1, v0, v3

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 13

    .prologue
    const/4 v12, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v11, 0x0

    const/4 v10, 0x3

    const/4 v1, 0x0

    .line 354
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    .line 121
    new-array v0, v10, [Ljava/lang/String;

    const-string v2, "File"

    aput-object v2, v0, v1

    const-string v2, "Paroles"

    aput-object v2, v0, v12

    const/4 v2, 0x2

    const-string v3, "Appareils"

    aput-object v3, v0, v2

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 122
    new-array v0, v10, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[I

    .line 123
    new-array v0, v10, [Landroid/widget/Button;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    .line 125
    const-wide/16 v2, -0x3e8

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    .line 148
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v0, "envoi"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    const-string v0, "envoi"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    .line 178
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    .line 206
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    .line 211
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    .line 354
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 355
    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/String;

    const-string v0, "File"

    aput-object v0, v5, v1

    const-string v0, "Paroles"

    aput-object v0, v5, v12

    const/4 v0, 0x2

    const-string v2, "Appareils"

    aput-object v2, v5, v0

    const-string v0, "Volume"

    aput-object v0, v5, v10

    .line 356
    const/4 v0, 0x4

    new-array v6, v0, [I

    fill-array-data v6, :array_1

    move v0, v1

    .line 357
    :goto_0
    array-length v2, v5

    if-lt v0, v2, :cond_0

    .line 370
    return-void

    .line 358
    :cond_0
    if-ne v0, v10, :cond_4

    new-instance v2, Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {v2, p1}, Lcom/melodix/music/PreviewPlayerVolume;-><init>(Landroid/content/Context;)V

    .line 359
    :goto_1
    aget-object v3, v5, v0

    aget v7, v6, v0

    const v8, -0x4b513b

    invoke-static {p1, v3, v7, v8}, Lcom/melodix/music/PreviewPanelIcon;->tile(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextSize(F)V

    const v3, -0x4b513b

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 360
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    const/high16 v7, 0x40800000    # 4.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/high16 v8, 0x40000000    # 2.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    const/high16 v9, 0x40800000    # 4.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    invoke-virtual {v2, v3, v7, v8, v9}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v3, 0x42600000    # 56.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 361
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v7, 0x14ffffff

    invoke-virtual {v3, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v7, 0x41900000    # 18.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v3, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const v8, 0x1fffffff

    invoke-virtual {v3, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 362
    invoke-virtual {v2, v11}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v11}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setElevation(F)V

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setTranslationZ(F)V

    invoke-virtual {v2, v11}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 363
    new-instance v7, Landroid/graphics/drawable/RippleDrawable;

    const v8, 0x447b3fe4

    invoke-static {v8}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v8

    invoke-direct {v7, v8, v3, v11}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 364
    if-ne v0, v10, :cond_5

    const-string v3, "Volume du lecteur indisponible"

    :goto_2
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 365
    if-ge v0, v10, :cond_1

    invoke-virtual {v2, v12}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_1
    if-ne v0, v10, :cond_6

    move v3, v4

    :goto_3
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setActivated(Z)V

    .line 366
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->fontScale:F

    const v8, 0x3fa66666    # 1.3f

    cmpl-float v3, v3, v8

    if-lez v3, :cond_7

    const/4 v3, -0x2

    :goto_4
    invoke-direct {v7, v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v0, :cond_2

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    iput v3, v7, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_2
    invoke-virtual {p0, v2, v7}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 367
    if-ge v0, v10, :cond_3

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aput-object v2, v3, v0

    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$21;

    invoke-direct {v3, p0, v0}, Lcom/melodix/music/PreviewPlayerTiles$21;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 357
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 358
    :cond_4
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    goto/16 :goto_1

    .line 364
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v7, v7, v0

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " : indisponible, page Spotify non accessible"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 365
    :cond_6
    const v3, 0x3f4ccccd    # 0.8f

    goto :goto_3

    .line 366
    :cond_7
    const/high16 v3, 0x42600000    # 56.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    goto :goto_4

    .line 122
    :array_0
    .array-data 4
        0x4
        0x5
        0x6
    .end array-data

    .line 356
    :array_1
    .array-data 4
        0x4
        0x5
        0x6
        0x1
    .end array-data
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->readTrace(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 98
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-void
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 178
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 178
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    return-wide v0
.end method

.method static synthetic access$13(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 34
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 152
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 179
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->parseObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$16(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 150
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerTiles;->validJobId(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerTiles;Z)V
    .locals 0

    .prologue
    .line 149
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 1

    .prologue
    .line 191
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    return-void
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 142
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$25(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 255
    invoke-direct/range {p0 .. p6}, Lcom/melodix/music/PreviewPlayerTiles;->confirmTransfer(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$26(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 264
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$27(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 206
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    return-wide v0
.end method

.method static synthetic access$28(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 206
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    return-wide v0
.end method

.method static synthetic access$29()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 58
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$30(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 212
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$31(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$32(Lcom/melodix/music/PreviewPlayerTiles;Z)V
    .locals 0

    .prologue
    .line 149
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobPending:Z

    return-void
.end method

.method static synthetic access$33(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$34(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 275
    invoke-direct/range {p0 .. p10}, Lcom/melodix/music/PreviewPlayerTiles;->pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$35(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 211
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$36(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$37(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 221
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$38(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;JLjava/lang/String;I)V
    .locals 1

    .prologue
    .line 290
    invoke-direct/range {p0 .. p6}, Lcom/melodix/music/PreviewPlayerTiles;->pollClosed(ILandroid/app/Activity;JLjava/lang/String;I)V

    return-void
.end method

.method static synthetic access$39(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerTiles;->resultCode(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4(J)V
    .locals 0

    .prologue
    .line 54
    sput-wide p0, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    return-void
.end method

.method static synthetic access$40(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$41(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 151
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->openedAt:J

    return-wide v0
.end method

.method static synthetic access$42(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$43(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$44(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 1

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    return v0
.end method

.method static synthetic access$45(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 1

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobPending:Z

    return v0
.end method

.method static synthetic access$46(Lcom/melodix/music/PreviewPlayerTiles;Lcom/melodix/music/PreviewPlayerSheet;)V
    .locals 0

    .prologue
    .line 124
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    return-void
.end method

.method static synthetic access$47(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 178
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-void
.end method

.method static synthetic access$48(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 206
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    return-void
.end method

.method static synthetic access$49(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 180
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$5()[J
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    return-object v0
.end method

.method static synthetic access$50(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 344
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method static synthetic access$51(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .prologue
    .line 307
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V

    return-void
.end method

.method static synthetic access$6()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$7(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 77
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->count(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 98
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    return-object v0
.end method

.method private activate(I)V
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 308
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v3

    .line 309
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v2

    if-nez v2, :cond_0

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-nez v2, :cond_0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    sub-long v4, v0, v4

    const-wide/16 v6, 0x190

    cmp-long v2, v4, v6

    if-gez v2, :cond_1

    .line 343
    :cond_0
    :goto_0
    return-void

    .line 310
    :cond_1
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v0, v0, p1

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/Button;->performHapticFeedback(I)Z

    invoke-direct {p0, p1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V

    .line 312
    :try_start_0
    new-instance v4, Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {v4, v3}, Lcom/melodix/music/PreviewPlayerSheet;-><init>(Landroid/app/Activity;)V

    .line 313
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v0, 0x41b00000    # 22.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    const/4 v1, 0x0

    const/high16 v2, 0x41b00000    # 22.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v7, v0, v1, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerSheet;->background(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 314
    invoke-virtual {v4}, Lcom/melodix/music/PreviewPlayerSheet;->dragListener()Landroid/view/View$OnTouchListener;

    move-result-object v0

    .line 315
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v2, "Glisser vers le bas pour fermer"

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 316
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v5, 0x66ffffff

    const v6, 0xffffff

    const v8, 0x4479c000    # 999.0f

    invoke-static {v3, v5, v6, v8}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42100000    # 36.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/high16 v8, 0x40800000    # 4.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42000000    # 32.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 317
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 318
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 319
    const-string v0, "LECTEUR"

    const v5, -0x4a5c2e

    const/high16 v6, 0x41200000    # 10.0f

    invoke-direct {p0, v3, v0, v5, v6}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v8, 0x41900000    # 18.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 320
    if-nez p1, :cond_3

    const-string v0, "File d\u2019attente"

    :goto_1
    const/4 v5, -0x1

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-direct {p0, v3, v0, v5, v6}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v8, -0x2

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 321
    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    const-string v0, "Appareils disponibles"

    :goto_2
    const v5, -0x485533

    const/high16 v6, 0x41500000    # 13.0f

    invoke-direct {p0, v3, v0, v5, v6}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v8, 0x42000000    # 32.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    const/4 v6, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v0, v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 322
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, ""

    const/4 v5, 0x3

    const v6, -0x212b13

    invoke-static {v3, v2, v5, v6}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "Fermer "

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v5, v5, p1

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setGravity(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinWidth(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v2, 0x42400000    # 48.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinHeight(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 323
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$16;

    invoke-direct {v2, p0, v4}, Lcom/melodix/music/PreviewPlayerTiles$16;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Lcom/melodix/music/PreviewPlayerSheet;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42200000    # 40.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v5, -0x2

    invoke-direct {v0, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 324
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    const/high16 v6, 0x41000000    # 8.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-virtual {v5, v0, v1, v2, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 325
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const v0, 0xcffffff

    const v2, 0x16ffffff

    const/high16 v6, 0x41900000    # 18.0f

    invoke-static {v3, v0, v2, v6}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 326
    const/high16 v0, 0x42f00000    # 120.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    const/high16 v6, 0x435c0000    # 220.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    sub-int/2addr v2, v6

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    if-ne p1, v9, :cond_5

    const/16 v0, 0x1cc

    :goto_3
    int-to-float v0, v0

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-direct {v6, v8, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "Actualiser"

    const/4 v1, 0x2

    const/4 v2, -0x1

    invoke-static {v3, v0, v1, v2}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Actualiser "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 v0, -0x1

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setTextColor(I)V

    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    const/16 v0, 0x11

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setGravity(I)V

    const/high16 v0, 0x42400000    # 48.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v0, 0x0

    invoke-static {v3, v0}, Lcom/melodix/music/PreviewPlayerSheet;->actionBackground(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 328
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v0, v0, p1

    invoke-virtual {v4, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-virtual {v4, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setCanceledOnTouchOutside(Z)V

    .line 329
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$17;

    invoke-direct {v0, p0, p1, v3}, Lcom/melodix/music/PreviewPlayerTiles$17;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V

    invoke-virtual {v4, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 336
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->openedAt:J

    const-string v0, "envoi"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    const-string v0, "envoi"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    .line 337
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$18;

    move-object v1, p0

    move v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/melodix/music/PreviewPlayerTiles$18;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Lcom/melodix/music/PreviewPlayerSheet;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 338
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/high16 v2, 0x42400000    # 48.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x41600000    # 14.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v7, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 339
    invoke-virtual {v4, v7}, Lcom/melodix/music/PreviewPlayerSheet;->showSheet(Landroid/view/View;)V

    invoke-virtual {v4}, Lcom/melodix/music/PreviewPlayerSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_6

    invoke-virtual {v4}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 342
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    :cond_2
    const-string v0, "Indisponible dans cette version"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 320
    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto/16 :goto_1

    .line 321
    :cond_4
    const-string v0, "Contenu du lecteur"

    goto/16 :goto_2

    .line 326
    :cond_5
    const/16 v0, 0x154

    goto/16 :goto_3

    .line 340
    :cond_6
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 341
    if-nez p1, :cond_7

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto/16 :goto_0

    :cond_7
    const-string v7, "run"

    const-string v8, ""

    move-object v1, p0

    move v2, p1

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 131
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 129
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 130
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 128
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 131
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x1

    const/high16 v7, 0x40c00000    # 6.0f

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 158
    const-string v0, "\t"

    invoke-virtual {p3, v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    array-length v0, v2

    if-eqz v0, :cond_0

    aget-object v0, v2, v5

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 162
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    array-length v0, v2

    if-le v0, v1, :cond_2

    aget-object v0, v2, v1

    :goto_1
    array-length v1, v2

    if-le v1, v3, :cond_3

    aget-object v1, v2, v3

    .line 160
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, ""

    :goto_3
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_4
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 161
    new-instance v1, Ljava/lang/StringBuilder;

    aget-object v2, v2, v5

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v0, ""

    :goto_5
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x41700000    # 15.0f

    invoke-direct {p0, p1, v0, v6, v1}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v0, v5, v1, v5, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 159
    :cond_2
    const-string v0, ""

    goto :goto_1

    :cond_3
    const-string v1, ""

    goto :goto_2

    .line 160
    :cond_4
    const-string v0, " \u00b7 "

    goto :goto_3

    :cond_5
    const-string v0, ""

    goto :goto_4

    .line 161
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    const-string v0, "[^a-z0-9:-]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-lt v0, v3, :cond_0

    .line 49
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "aucune"

    :goto_2
    return-object v0

    .line 45
    :cond_0
    aget-object v4, v2, v0

    .line 46
    const-string v5, "(opened|already-open|open-error|closed|close-error|panel:absent|root:ambiguous|button:absent|button:disabled|button:ambiguous:[0-9]{1,2}|rows:[0-9]{1,2}|lines:[0-9]{1,3}(:sync)?|devices:[0-9]{1,2}|sized:[0-9]{1,2}|h:[0-9]{1,4}|path:(queue|other)|links:[0-9]{1,2}|rowsdoc:[0-9]{1,2}|shape:[0-9]{14}|target:(ambiguous|absent|already-active)|transfer:(click|error|verified|unverified)|close:(verified|unverified|button))"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 45
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_3

    const/16 v5, 0x3e

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const/16 v5, 0x78

    if-le v4, v5, :cond_1

    goto :goto_1

    .line 49
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method

.method private confirmTransfer(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 13

    .prologue
    .line 256
    new-instance v3, Landroid/app/Dialog;

    invoke-direct {v3, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    const/high16 v5, 0x41800000    # 16.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v10, v1, v2, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 257
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xde8f4cd

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Transf\u00e9rer la lecture vers \u00ab "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p6

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00bb ?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    const/high16 v4, 0x41880000    # 17.0f

    invoke-direct {p0, p2, v1, v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 259
    new-instance v11, Landroid/widget/Button;

    invoke-direct {v11, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "Annuler"

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v1, Lcom/melodix/music/PreviewPlayerTiles$10;

    invoke-direct {v1, p0, v3}, Lcom/melodix/music/PreviewPlayerTiles$10;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 260
    new-instance v12, Landroid/widget/Button;

    invoke-direct {v12, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "Confirmer"

    invoke-virtual {v12, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Confirmer le transfert vers "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p6

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-virtual {v12, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v1, Lcom/melodix/music/PreviewPlayerTiles$11;

    move-object v2, p0

    move v4, p1

    move-object v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    invoke-direct/range {v1 .. v9}, Lcom/melodix/music/PreviewPlayerTiles$11;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v12, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 261
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v4, 0x42400000    # 48.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v4, 0x42400000    # 48.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 262
    invoke-virtual {v3, v10}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 263
    :cond_0
    return-void
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 77
    const/16 v0, 0x63

    invoke-virtual {p0, p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\nStructure File : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure Paroles : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aget-object v1, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure Appareils : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

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

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nAppareils (tiroir) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    aget-object v1, v1, v4

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

    move-result-object v1

    sget-wide v2, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, " ; relev\u00e9 il y a "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sget-wide v4, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " s"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 371
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method static formatTrace(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x7

    const/4 v5, 0x0

    .line 63
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string v0, "aucune ouverture observ\u00e9e"

    .line 66
    :goto_0
    return-object v0

    .line 64
    :cond_1
    const-string v0, "(liked|playlist|-),(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable|-)(,(-|\\d{1,7})){8}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "illisible"

    goto :goto_0

    .line 65
    :cond_2
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const-string v2, " ms"

    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "type="

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v0, v1, v5

    const-string v4, "liked"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "lik\u00e9s"

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", phase="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x1

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", navigation="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x2

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", page pr\u00eate="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x3

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", lignes DOM="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x4

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", lignes class\u00e9es="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x5

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", lignes envoy\u00e9es au natif="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x6

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 67
    const-string v3, ", premi\u00e8re liste="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v0, v1, v6

    const-string v4, "-"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "\u2014"

    :goto_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", liste compl\u00e8te="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v0, v1, v7

    const-string v4, "-"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "\u2014"

    :goto_3
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", mises \u00e0 jour="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x9

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_3
    aget-object v0, v1, v5

    const-string v4, "playlist"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "playlist"

    goto/16 :goto_1

    :cond_4
    const-string v0, "\u2014"

    goto/16 :goto_1

    .line 67
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    aget-object v4, v1, v6

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    aget-object v4, v1, v7

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method private line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 143
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextSize(F)V

    return-object v0
.end method

.method private loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 19

    .prologue
    .line 265
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v6

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    const-string v6, ""

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobId:Ljava/lang/String;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJobPending:Z

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v6, 0x1

    move/from16 v0, p1

    if-ne v0, v6, :cond_0

    const-string v16, "lyrics"

    .line 266
    :goto_0
    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$12;

    move-object/from16 v7, p0

    move-object/from16 v10, p3

    move/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    invoke-direct/range {v6 .. v14}, Lcom/melodix/music/PreviewPlayerTiles$12;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-string v7, "transfer"

    move-object/from16 v0, p6

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/16 v7, 0x2af8

    :goto_1
    int-to-long v10, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v10, v11}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 267
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v17

    if-nez v17, :cond_2

    sget-object v6, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v7, p1, -0x1

    const-string v8, "page:inaccessible"

    aput-object v8, v6, v7

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 274
    :goto_2
    return-void

    .line 265
    :cond_0
    const-string v16, "devices"

    goto :goto_0

    .line 266
    :cond_1
    const/16 v7, 0x1f40

    goto :goto_1

    .line 268
    :cond_2
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "((function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    W.__melodixDrawerLease = job;\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            main: true,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0, rootAmbiguous = false;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {\n            // Spotify may give the trigger itself a device-picker testid.\n            // A button is not its own content panel and must not imply open.\n            return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');\n        });\n        // Nested wrappers can describe the same panel; unrelated roots are\n        // ambiguous and must never be treated as the current content.\n        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });\n        if (hits.length === 1) return hits[0];\n        if (hits.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        if (c && c !== b && c.isConnected && !c.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return c;\n        if (spec.main) {\n            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.\n            var main = document.querySelector(\'#main-view, main\');\n            return main && main.querySelector(\'[data-testid*=\"lyric\" i]\') ? main : null;\n        }\n        // Device picker opens as a popover/dialog mentioning devices.\n        var pops = Array.from(document.querySelectorAll(\'[role=\"dialog\"], [data-tippy-root], [id^=\"tippy\"]\')).filter(function(n) {\n            return n.isConnected && n !== b && /appareil|device|dispositivo|ger\u00e4t/i.test(String(n.getAttribute(\'aria-label\') || \'\'));\n        });\n        if (pops.length > 1) rootAmbiguous = true;\n        return pops.length === 1 ? pops[0] : null;\n    }\n    function lyricLines(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'[data-testid*=\"lyric\" i]\')).filter(function(n) {\n            // A button such as lyrics-close-button is a control, not a lyric\n            // line. Ignoring it lets the paragraph fallback read real lines.\n            return !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && (!n.children.length || !n.querySelector(\'[data-testid*=\"lyric\" i]\'));\n        });\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'p\'));\n        var lines = [], active = -1, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = text(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced ? active : -1, synced: synced};\n    }\n    function deviceRows(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    // The page is hidden: a panel (or one of its parents) can measure 0 px, and\n    // Spotify then draws no rows in it. Give it a size while it is read, then\n    // restore the original inline style exactly. No other change to the page.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            sized.push([n, n.getAttribute(\'style\')]);\n            if (cs.display === \'none\') n.style.setProperty(\'display\', \'block\', \'important\');\n            if (cs.visibility === \'hidden\') n.style.setProperty(\'visibility\', \'visible\', \'important\');\n            if (small) n.style.setProperty(\'min-height\', \'640px\', \'important\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute(\'style\'); else e[0].setAttribute(\'style\', e[1]); } catch (_) {} });\n        sized = [];\n    }\n    // Close only a unique, panel-specific control inside the recognised\n    // panel. An ambiguous or generic close button is never used.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            var known = kind===\'lyrics\' ? /^(lyrics-close-button|close-lyrics-button)$/.test(id) || /^(close lyrics|hide lyrics|fermer les paroles|masquer les paroles)$/i.test(label) :\n                /^(devices-close-button|close-devices-button)$/.test(id) || /^(close devices|close device picker|fermer les appareils|fermer la liste des appareils)$/i.test(label);\n            return known && n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n);\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button(); var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4000, forced = false;\n        (function step() {\n          try {\n            var r = null;\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null;\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r).length);\n            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\'); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); return;\n            }\n            var rows = deviceRows(r);\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); return; }\n                var targetNode = target[0].node;\n                if (targetNode.disabled || targetNode.matches(\':disabled\') || targetNode.closest(\'[aria-disabled=\"true\"]\') || hiddenBeforeTap(targetNode)) {\n                    log(\'target:disabled\'); finish(false, \'target\'); return;\n                }\n                try { targetNode.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                  try {\n                    var again = null;\n                    try {\n                        var r2 = root(button() || b), matches = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; }) : [];\n                        // Name alone is not a device identity if a duplicate\n                        // arrives after the tap. Do not claim confirmation.\n                        again = matches.length === 1 ? matches[0] : null;\n                    } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\');\n                  } catch (_) { finish(false, \'error\'); }\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\');\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)("

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static/range {v16 .. v16}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static/range {p6 .. p6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static/range {p7 .. p7}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ");"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$13;

    move-object/from16 v7, p0

    move-object/from16 v10, p3

    move/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    move-object/from16 v15, p6

    invoke-direct/range {v6 .. v16}, Lcom/melodix/music/PreviewPlayerTiles$13;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v6}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 273
    :catch_0
    move-exception v6

    sget-object v6, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v7, p1, -0x1

    const-string v8, "demarrage:erreur"

    aput-object v8, v6, v7

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_2
.end method

.method private loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 10

    .prologue
    const/4 v4, 0x0

    .line 181
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobId:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJobPending:Z

    invoke-direct {p0, p1, p3}, Lcom/melodix/music/PreviewPlayerTiles;->skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {p4, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 182
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$6;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p1

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-wide/16 v4, 0x1f40

    invoke-virtual {p0, v0, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 183
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v8

    if-nez v8, :cond_0

    const-string v0, "page:inaccessible"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {p0, p1, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 190
    :goto_0
    return-void

    .line 184
    :cond_0
    :try_start_0
    const-string v9, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    W.__melodixDrawerLease = job;\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0, rootAmbiguous = false;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\'))) {\n            var mainView = document.querySelector(\'#main-view, main\');\n            if (mainView && mainView.isConnected) return mainView;\n        }\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        // A chain of nested markers can describe one queue. Keep the outer\n        // wrapper so headers and rows belonging to that queue are retained;\n        // independent branches remain ambiguous and are never merged.\n        if (found.length > 1) {\n            var leaves = found.filter(function(n) { return !found.some(function(other) { return other !== n && n.contains(other); }); });\n            if (leaves.length === 1) {\n                var outer = found.filter(function(n) { return !found.some(function(other) { return other !== n && other.contains(n); }); });\n                if (outer.length === 1) return outer[0];\n            }\n            rootAmbiguous = true; return null;\n        }\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return controlled;\n        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.\n        var labelled = Array.from(document.querySelectorAll(\'aside, section, [role=\"region\"], [role=\"complementary\"], [role=\"dialog\"], div[aria-label]\')).filter(function(n) {\n            return n.isConnected && /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(n.getAttribute(\'aria-label\') || \'\').trim());\n        });\n        if (labelled.length > 1) { rootAmbiguous = true; return null; }\n        return labelled.length === 1 ? labelled[0] : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        if (!list.length) {\n            // No row markers: one row per track link, its closest list item or row-like block.\n            var seen = [];\n            Array.from(r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\')).forEach(function(a) {\n                var row = a.closest(\'li, [role=\"listitem\"], [draggable=\"true\"], [data-encore-id=\"listRow\"]\') || a.parentElement && a.parentElement.parentElement || a;\n                if (seen.indexOf(row) < 0) seen.push(row);\n            });\n            list = seen;\n        }\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration, current: n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-testid\') === \'queue-now-playing\'};\n        }).filter(function(x) { return x.title; });\n    }\n    // Failure-only structural fingerprint. Every character is a fixed category\n    // or a count capped at 9; no page text, IDs, hrefs or arbitrary labels leave\n    // the WebView. This does not read a different panel or perform any action.\n    function emptyShape(r, trigger) {\n        if (!r) return \'\';\n        var kind = 7;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) kind = 0;\n        else if (r.matches(\'[data-testid=\"queue-page\"]\')) kind = 1;\n        else if (r.matches(\'[data-testid=\"queue-view\"]\')) kind = 2;\n        else if (r.matches(\'[data-testid=\"queue-panel\"]\')) kind = 3;\n        else if (r.matches(\'[data-testid=\"NPV-queue\"]\')) kind = 4;\n        else if (trigger && trigger.getAttribute(\'aria-controls\') && document.getElementById(trigger.getAttribute(\'aria-controls\')) === r) kind = 5;\n        else kind = 6;\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'shape:\' + [kind, Math.min(r.children.length,9), count(\'*\'),\n            count(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\'),\n            count(\'a[href]\'), count(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\'),\n            count(\'a[href^=\"spotify:track:\"], a[href^=\"spotify:episode:\"]\'),\n            count(\'[data-uri], [data-track-uri], [data-spotify-uri]\'),\n            count(\'[data-testid*=\"track\" i]\'), count(\'li, [role=\"listitem\"]\'),\n            count(\'[role=\"row\"]\'), count(\'[data-testid*=\"queue\" i]\'),\n            count(\'[data-encore-id=\"listRow\"]\'), String(r.textContent || \'\').trim() ? 1 : 0].join(\'\');\n    }\n    // The page is hidden: a panel (or one of its parents) can measure 0 px, and\n    // Spotify then draws no rows in it. Give it a size while it is read, then\n    // restore the original inline style exactly. No other change to the page.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            sized.push([n, n.getAttribute(\'style\')]);\n            if (cs.display === \'none\') n.style.setProperty(\'display\', \'block\', \'important\');\n            if (cs.visibility === \'hidden\') n.style.setProperty(\'visibility\', \'visible\', \'important\');\n            if (small) n.style.setProperty(\'min-height\', \'640px\', \'important\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute(\'style\'); else e[0].setAttribute(\'style\', e[1]); } catch (_) {} });\n        sized = [];\n    }\n    // Only an explicitly named queue close control inside the recognised\n    // panel is eligible; generic close buttons elsewhere are never clicked.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            return n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n) &&\n                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d[\'\u2019]attente|masquer la file d[\'\u2019]attente)$/i.test(label));\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button();\n        var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4500, forced = false;\n        (function step() {\n          try {\n            var r = null, list = [];\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];\n            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                var marked = list.filter(function(x) { return x.current; });\n                job.now = marked.length === 1 ? line(marked[0]) : \'\';\n                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else {\n                log(r ? \'rows:0\' : \'panel:absent\');\n                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.\n                log(\'path:\' + (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) ? \'queue\' : \'other\'));\n                log(\'links:\' + Math.min(r ? r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\').length : 0, 99));\n                log(\'rowsdoc:\' + Math.min(document.querySelectorAll(\'[data-testid=\"tracklist-row\"], [role=\"row\"]\').length, 99));\n                if (r) log(emptyShape(r, b));\n                finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\');\n            }\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)(\"run\");"

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$7;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p1

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$7;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v8, v9, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 189
    :catch_0
    move-exception v0

    const-string v0, "demarrage:erreur"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {p0, p1, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0
.end method

.method private message(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method private paintControls()V
    .locals 6

    .prologue
    .line 134
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 140
    return-void

    .line 135
    :cond_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v1, v1, v0

    if-nez v1, :cond_1

    .line 134
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 136
    :cond_1
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    const v2, 0x3f4ccccd    # 0.8f

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setAlpha(F)V

    .line 137
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

    .line 138
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " : consulter si disponible"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 213
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    .line 214
    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-ne p1, v2, :cond_0

    const-string v4, "Paroles non disponibles sur cette page Spotify"

    :goto_0
    const-string v5, "Le bouton correspondant est absent de la page."

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    :goto_1
    return-void

    .line 214
    :cond_0
    const-string v4, "Appareils non disponibles sur cette page Spotify"

    goto :goto_0

    .line 215
    :cond_1
    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    if-ne p1, v2, :cond_2

    const-string v4, "Bouton Paroles d\u00e9sactiv\u00e9"

    :goto_2
    const-string v5, "Le bouton Spotify est d\u00e9sactiv\u00e9 ; r\u00e9essayez plus tard."

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-string v4, "Appareils indisponibles pour le moment"

    goto :goto_2

    .line 216
    :cond_3
    const-string v1, "busy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v4, "Un panneau est d\u00e9j\u00e0 en cours"

    const-string v5, "Attendez sa fermeture avant de r\u00e9essayer."

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 217
    :cond_4
    const-string v1, "close-unverified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v4, "Fermeture du panneau non confirm\u00e9e"

    const-string v5, "Le contenu n\u2019a pas \u00e9t\u00e9 pr\u00e9sent\u00e9 comme confirm\u00e9 ; voir le diagnostic."

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 218
    :cond_5
    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v4, "Lecture refus\u00e9e"

    const-string v5, "Plusieurs contr\u00f4les ou panneaux possibles ; aucun choix arbitraire."

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 219
    :cond_6
    if-ne p1, v2, :cond_7

    const-string v4, "Paroles indisponibles"

    :goto_3
    if-ne p1, v2, :cond_8

    const-string v5, "Contenu non lu ; touchez R\u00e9essayer."

    :goto_4
    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    const-string v4, "Liste d\u2019appareils indisponible"

    goto :goto_3

    :cond_8
    const-string v5, "Liste non lue ; touchez R\u00e9essayer."

    goto :goto_4
.end method

.method private panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v3, -0x2

    const/4 v2, -0x1

    .line 208
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/high16 v0, 0x41900000    # 18.0f

    invoke-direct {p0, p1, p4, v2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 209
    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const v0, -0x384424

    const/high16 v1, 0x41600000    # 14.0f

    invoke-direct {p0, p1, p5, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 210
    return-void
.end method

.method private parseObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 179
    :try_start_0
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v2

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v2

    goto :goto_0
.end method

.method private pollClosed(ILandroid/app/Activity;JLjava/lang/String;I)V
    .locals 9

    .prologue
    .line 291
    const/16 v0, 0x2c

    if-gt p6, v0, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-nez v0, :cond_0

    .line 292
    if-nez p1, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    :goto_0
    cmp-long v0, p3, v0

    if-nez v0, :cond_0

    invoke-static {p5}, Lcom/melodix/music/PreviewPlayerTiles;->validJobId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 306
    :cond_0
    :goto_1
    return-void

    .line 292
    :cond_1
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    goto :goto_0

    .line 293
    :cond_2
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$15;

    move-object v1, p0

    move-wide v2, p3

    move v4, p1

    move-object v5, p2

    move-object v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$15;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JILandroid/app/Activity;Ljava/lang/String;I)V

    .line 305
    const-wide/16 v2, 0xfa

    .line 293
    invoke-virtual {p0, v0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1
.end method

.method private pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
    .locals 14

    .prologue
    .line 276
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "demarre:lectures="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p8

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    const/16 v2, 0x2c

    move/from16 v0, p8

    if-le v0, v2, :cond_0

    .line 287
    :goto_0
    return-void

    .line 277
    :cond_0
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$14;

    move-object v3, p0

    move-wide/from16 v4, p6

    move-object/from16 v6, p3

    move-object/from16 v7, p2

    move v8, p1

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p10

    move/from16 v12, p8

    move-object/from16 v13, p9

    invoke-direct/range {v2 .. v13}, Lcom/melodix/music/PreviewPlayerTiles$14;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;ILandroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;ILjava/lang/String;)V

    .line 286
    const-wide/16 v4, 0xfa

    .line 277
    invoke-virtual {p0, v2, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 11

    .prologue
    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "demarre:lectures="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p7

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    .line 193
    const/16 v2, 0x1e

    move/from16 v0, p7

    if-le v0, v2, :cond_1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    cmp-long v2, p5, v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-ne v2, p2, :cond_0

    const-string v2, "delai"

    sput-object v2, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {p0, p1, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 194
    :cond_1
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$8;

    move-object v3, p0

    move-wide/from16 v4, p5

    move-object v6, p2

    move-object v7, p1

    move-object v8, p3

    move-object v9, p4

    move/from16 v10, p7

    invoke-direct/range {v2 .. v10}, Lcom/melodix/music/PreviewPlayerTiles$8;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    .line 203
    const-wide/16 v4, 0xfa

    .line 194
    invoke-virtual {p0, v2, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private probe(ILandroid/app/Activity;)V
    .locals 6

    .prologue
    .line 79
    if-nez p1, :cond_0

    const-string v0, "queue"

    move-object v1, v0

    :goto_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    aget-wide v2, v0, p1

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    aput-wide v2, v0, p1

    .line 81
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v4, "G"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 82
    instance-of v4, v0, Landroid/webkit/WebView;

    if-nez v4, :cond_2

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const-string v1, "page inaccessible"

    aput-object v1, v0, p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_1
    return-void

    .line 79
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string v0, "lyrics"

    move-object v1, v0

    goto :goto_0

    :cond_1
    const-string v0, "devices"

    move-object v1, v0

    goto :goto_0

    .line 83
    :cond_2
    :try_start_1
    check-cast v0, Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "((function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');});\n    var controls={\n        queue:/^(control-button-queue|queue-button)$/i,\n        lyrics:/^(lyrics-button|control-button-lyrics)$/i,\n        devices:/^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i\n    };\n    var labels={\n        queue:/^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i,\n        lyrics:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n        devices:/^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i\n    };\n    var triggers=Array.from(document.querySelectorAll(\'button,[role=\"button\"]\')).filter(function(b){\n        return b.isConnected && (controls[kind].test(String(b.getAttribute(\'data-testid\')||\'\')) || labels[kind].test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        controls:Math.min(triggers.length,99), buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n)("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ");"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Lcom/melodix/music/PreviewPlayerTiles$3;

    invoke-direct {v4, p0, v2, v3, p1}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V

    invoke-virtual {v0, v1, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 96
    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const-string v1, "page inaccessible"

    aput-object v1, v0, p1

    goto :goto_1
.end method

.method private queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 153
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    .line 154
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v0, "absent"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "File non disponible sur cette page Spotify"

    :goto_0
    const/high16 v2, 0x41900000    # 18.0f

    invoke-direct {p0, p1, v0, v4, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    const-string v0, "absent"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Le bouton File d\u2019attente est absent de la page."

    :goto_1
    const v1, -0x384424

    const/high16 v2, 0x41600000    # 14.0f

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 156
    return-void

    .line 154
    :cond_0
    const-string v0, "ambiguous"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "Lecture refus\u00e9e"

    goto :goto_0

    :cond_1
    const-string v0, "busy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "Un panneau est d\u00e9j\u00e0 en cours"

    goto :goto_0

    :cond_2
    const-string v0, "close-unverified"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Fermeture de la file non confirm\u00e9e"

    goto :goto_0

    :cond_3
    const-string v0, "File indisponible"

    goto :goto_0

    .line 155
    :cond_4
    const-string v0, "ambiguous"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Plusieurs contr\u00f4les ou panneaux possibles ; aucun choix arbitraire."

    goto :goto_1

    :cond_5
    const-string v0, "Touchez R\u00e9essayer pour relire la file."

    goto :goto_1
.end method

.method private readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 10

    .prologue
    .line 100
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    if-nez p1, :cond_0

    const-string v2, "queue"

    move-object v3, v2

    .line 101
    :goto_0
    const-string v2, "Chargement\u2026"

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v6, "G"

    invoke-virtual {v2, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 104
    instance-of v6, v2, Landroid/webkit/WebView;

    if-nez v6, :cond_2

    const-string v2, "Indisponible dans cette version"

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_1
    return-void

    .line 100
    :cond_0
    const/4 v2, 0x1

    if-ne p1, v2, :cond_1

    const-string v2, "lyrics"

    move-object v3, v2

    goto :goto_0

    :cond_1
    const-string v2, "devices"

    move-object v3, v2

    goto :goto_0

    .line 105
    :cond_2
    :try_start_1
    move-object v0, v2

    check-cast v0, Landroid/webkit/WebView;

    move-object v8, v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "((function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n)("

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$4;

    move-object v3, p0

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    invoke-virtual {v8, v9, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 118
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$5;

    move-object v3, p0

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    const-wide/16 v4, 0xdac

    invoke-virtual {p0, v2, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 119
    :catch_0
    move-exception v2

    const-string v2, "Indisponible dans cette version"

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private readTrace(Landroid/app/Activity;)V
    .locals 3

    .prologue
    .line 70
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 76
    :goto_1
    return-void

    .line 70
    :cond_0
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    goto :goto_0

    .line 71
    :cond_1
    :try_start_0
    const-string v1, "(function(){var t=window.__melodixOpenTrace;if(!t||typeof t!==\'object\')return \'\';var n=function(x){return typeof x===\'number\'&&isFinite(x)&&x>=0?String(Math.min(Math.round(x),9999999)):\'-\';};var k=t.kind===\'liked\'||t.kind===\'playlist\'?t.kind:\'-\';var ph=/^(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable)$/.test(String(t.phase))?t.phase:\'-\';return [k,ph,n(t.nav),n(t.ready),n(t.dom),n(t.classified),n(t.rendered),n(t.first),n(t.full),n(t.updates)].join(\',\');})()"

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$2;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 18

    .prologue
    .line 222
    sget-object v6, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v7, p1, -0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static/range {p6 .. p6}, Lcom/melodix/music/PreviewPlayerTiles;->resultCode(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "journal"

    const-string v10, ""

    move-object/from16 v0, p6

    invoke-virtual {v0, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 223
    const-string v6, "transfer"

    move-object/from16 v0, p7

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 224
    const-string v6, "transferred"

    const/4 v7, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    const-string v7, "ok"

    const/4 v8, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v7

    .line 225
    if-eqz v6, :cond_0

    const-string v8, "reason"

    const-string v9, ""

    move-object/from16 v0, p6

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "close-unverified"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 226
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "Transfert confirm\u00e9 ; fermeture non confirm\u00e9e"

    const/4 v8, 0x1

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 227
    const-string v6, "close-unverified"

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 254
    :goto_0
    return-void

    .line 229
    :cond_0
    sget-object v8, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v9, p1, -0x1

    aget-object v8, v8, v9

    const-string v9, "target:already-active"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    .line 230
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v9

    if-eqz v7, :cond_2

    if-eqz v6, :cond_2

    if-eqz v8, :cond_1

    const-string v6, "Cet appareil est d\u00e9j\u00e0 actif"

    :goto_1
    const/4 v7, 0x0

    invoke-static {v9, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 231
    const-string v12, "run"

    const-string v13, ""

    move-object/from16 v6, p0

    move/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    invoke-direct/range {v6 .. v13}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 230
    :cond_1
    const-string v6, "Lecture transf\u00e9r\u00e9e (v\u00e9rifi\u00e9)"

    goto :goto_1

    :cond_2
    const-string v6, "Transfert non v\u00e9rifi\u00e9, R\u00e9essayer"

    goto :goto_1

    .line 233
    :cond_3
    const-string v6, "ok"

    const/4 v7, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_4

    const-string v6, "reason"

    const-string v7, ""

    move-object/from16 v0, p6

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0

    .line 234
    :cond_4
    const-string v6, "body"

    const-string v7, ""

    move-object/from16 v0, p6

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 235
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    const-string v6, "empty"

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    sget-object v6, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v7, p1, -0x1

    const-string v8, "lecture=non-confirmee:motif=empty"

    aput-object v8, v6, v7

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto/16 :goto_0

    .line 236
    :cond_5
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    sget-object v6, Lcom/melodix/music/PreviewPlayerTiles;->panelJournals:[Ljava/lang/String;

    add-int/lit8 v8, p1, -0x1

    aget-object v9, v6, v8

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ":rendu=natif"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-virtual/range {p4 .. p4}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v6, 0x1

    move-object/from16 v0, p5

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 237
    const/4 v6, 0x1

    move/from16 v0, p1

    if-ne v0, v6, :cond_a

    .line 238
    const/4 v6, -0x1

    :try_start_0
    const-string v8, "active"

    const-string v9, "-1"

    move-object/from16 v0, p6

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 239
    :goto_2
    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 240
    const/4 v7, 0x0

    :goto_3
    array-length v8, v10

    if-ge v7, v8, :cond_6

    const/16 v8, 0xc8

    if-lt v7, v8, :cond_7

    .line 241
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->riseAll(Landroid/widget/LinearLayout;)V

    goto/16 :goto_0

    .line 240
    :cond_7
    aget-object v11, v10, v7

    if-ne v7, v6, :cond_8

    const v8, -0x1fb762

    move v9, v8

    :goto_4
    if-ne v7, v6, :cond_9

    const/16 v8, 0x13

    :goto_5
    int-to-float v8, v8

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v11, v9, v8}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v8

    const/4 v9, 0x0

    const/high16 v11, 0x40800000    # 4.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v11

    const/4 v12, 0x0

    const/high16 v13, 0x40800000    # 4.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v13

    invoke-virtual {v8, v9, v11, v12, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x1

    const/4 v12, -0x2

    invoke-direct {v9, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, p4

    invoke-virtual {v0, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_8
    const/4 v8, -0x1

    move v9, v8

    goto :goto_4

    :cond_9
    const/16 v8, 0x11

    goto :goto_5

    .line 243
    :cond_a
    const-string v6, "\n"

    invoke-virtual {v7, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 244
    array-length v0, v15

    move/from16 v16, v0

    const/4 v6, 0x0

    move v14, v6

    :goto_6
    move/from16 v0, v16

    if-lt v14, v0, :cond_b

    .line 253
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->riseAll(Landroid/widget/LinearLayout;)V

    goto/16 :goto_0

    .line 244
    :cond_b
    aget-object v6, v15, v14

    .line 245
    const-string v7, "\t"

    const/4 v8, -0x1

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    array-length v6, v7

    if-eqz v6, :cond_c

    const/4 v6, 0x0

    aget-object v6, v7, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 244
    :cond_c
    :goto_7
    add-int/lit8 v6, v14, 0x1

    move v14, v6

    goto :goto_6

    .line 246
    :cond_d
    const/4 v6, 0x0

    aget-object v13, v7, v6

    array-length v6, v7

    const/4 v8, 0x2

    if-le v6, v8, :cond_f

    const/4 v6, 0x2

    aget-object v6, v7, v6

    const-string v8, "1"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    const/4 v6, 0x1

    :goto_8
    array-length v8, v7

    const/4 v9, 0x1

    if-le v8, v9, :cond_10

    const/4 v8, 0x1

    aget-object v7, v7, v8

    .line 247
    :goto_9
    new-instance v17, Landroid/widget/Button;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_11

    const-string v7, ""

    :goto_a
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v6, :cond_12

    const-string v7, "\nActif"

    :goto_b
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    if-eqz v6, :cond_13

    const v7, -0x1fb762

    :goto_c
    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setTextColor(I)V

    const/4 v7, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v7, 0x42600000    # 56.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 248
    const/16 v7, 0x11

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setGravity(I)V

    const/4 v7, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    move-object/from16 v0, p2

    invoke-static {v0, v6}, Lcom/melodix/music/PreviewPlayerSheet;->actionBackground(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 249
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v6, :cond_14

    const-string v7, ", appareil actif"

    :goto_d
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 250
    if-nez v6, :cond_e

    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$9;

    move-object/from16 v7, p0

    move/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-direct/range {v6 .. v13}, Lcom/melodix/music/PreviewPlayerTiles$9;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 251
    :cond_e
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_7

    .line 246
    :cond_f
    const/4 v6, 0x0

    goto/16 :goto_8

    :cond_10
    const-string v7, ""

    goto/16 :goto_9

    .line 247
    :cond_11
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\n"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_a

    :cond_12
    const-string v7, ""

    goto/16 :goto_b

    :cond_13
    const/4 v7, -0x1

    goto/16 :goto_c

    .line 249
    :cond_14
    const-string v7, ", transf\u00e9rer la lecture vers cet appareil"

    goto :goto_d

    :catch_0
    move-exception v8

    goto/16 :goto_2
.end method

.method private renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 8

    .prologue
    const/4 v1, 0x0

    const v7, -0x587406

    const/high16 v6, 0x41500000    # 13.0f

    const/4 v5, -0x1

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p4}, Lcom/melodix/music/PreviewPlayerTiles;->resultCode(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "journal"

    const-string v3, ""

    invoke-virtual {p4, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 165
    const-string v0, "ok"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "reason"

    const-string v1, ""

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 176
    :goto_0
    return-void

    .line 166
    :cond_0
    const-string v0, "now"

    const-string v2, ""

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "next"

    const-string v2, ""

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 167
    const-string v0, "empty"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v0, "lecture=non-confirmee:motif=empty"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0

    .line 169
    :cond_1
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ":rendu=natif"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v0, "now"

    const-string v2, ""

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 170
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "En cours de lecture"

    invoke-direct {p0, p1, v2, v7, v6}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42000000    # 32.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 171
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Titres de la file"

    :goto_1
    invoke-direct {p0, p1, v0, v7, v6}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    const-string v0, "next"

    const-string v2, ""

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v0, "Aucun titre \u00e0 suivre"

    const v1, -0x384424

    const/high16 v2, 0x41600000    # 14.0f

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    :cond_3
    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-direct {p0, p2}, Lcom/melodix/music/PreviewPlayerTiles;->riseAll(Landroid/widget/LinearLayout;)V

    goto/16 :goto_0

    .line 171
    :cond_4
    const-string v0, "\u00c0 suivre"

    goto :goto_1

    .line 174
    :cond_5
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    move v0, v1

    :goto_2
    if-ge v0, v3, :cond_3

    aget-object v1, v2, v0

    invoke-direct {p0, p1, p2, v1}, Lcom/melodix/music/PreviewPlayerTiles;->addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private static resultCode(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 36
    const-string v0, "ok"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "lecture=ok"

    .line 39
    :goto_0
    return-object v0

    .line 37
    :cond_0
    const-string v0, "reason"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 38
    const-string v1, "(absent|ambiguous|disabled|panel|empty|close-unverified|command|error|target|unverified)"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "unknown"

    .line 39
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "lecture=non-confirmee:motif="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private riseAll(Landroid/widget/LinearLayout;)V
    .locals 2

    .prologue
    .line 177
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewUiRestyle;->rise(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 5

    .prologue
    .line 145
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 146
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 147
    return-void

    .line 146
    :cond_0
    const-string v1, "\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac\n\u25ac\u25ac\u25ac\u25ac\u25ac\u25ac"

    const v2, 0x40ffffff    # 7.9999995f

    const/high16 v3, 0x41600000    # 14.0f

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "Chargement de la file"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/high16 v4, 0x42600000    # 56.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private syncVolume()V
    .locals 2

    .prologue
    .line 345
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    .line 346
    :goto_0
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->readTrace(Landroid/app/Activity;)V

    .line 347
    :cond_0
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    .line 348
    return-void

    .line 345
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static validJobId(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 150
    const-string v0, "[0-9]{1,16}:[0-9]{1,9}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private web(Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 142
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "G"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Landroid/webkit/WebView;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/webkit/WebView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 4

    .prologue
    .line 349
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {p0, v0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 350
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
    .locals 1

    .prologue
    .line 351
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$19;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$19;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 352
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$20;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$20;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
