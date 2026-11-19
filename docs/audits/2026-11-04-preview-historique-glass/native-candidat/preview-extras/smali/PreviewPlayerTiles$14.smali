.class Lcom/melodix/music/PreviewPlayerTiles$14;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$action:Ljava/lang/String;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$i:I

.field final synthetic val$kind:Ljava/lang/String;

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$n:I

.field final synthetic val$retry:Landroid/widget/Button;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;ILandroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 284
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iput p6, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    iput-object p9, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$kind:Ljava/lang/String;

    iput p10, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$n:I

    iput-object p11, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$action:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 285
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2400(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$serial:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 286
    :cond_1
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "((function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    W.__melodixDrawerLease = job;\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            main: true,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0, rootAmbiguous = false;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {\n            // Spotify may give the trigger itself a device-picker testid.\n            // A button is not its own content panel and must not imply open.\n            return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');\n        });\n        // Nested wrappers can describe the same panel; unrelated roots are\n        // ambiguous and must never be treated as the current content.\n        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });\n        if (hits.length === 1) return hits[0];\n        if (hits.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        if (c && c !== b && c.isConnected && !c.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return c;\n        if (spec.main) {\n            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.\n            var main = document.querySelector(\'#main-view, main\');\n            return main && main.querySelector(\'[data-testid*=\"lyric\" i]\') ? main : null;\n        }\n        // Device picker opens as a popover/dialog mentioning devices.\n        var pops = Array.from(document.querySelectorAll(\'[role=\"dialog\"], [data-tippy-root], [id^=\"tippy\"]\')).filter(function(n) {\n            return n.isConnected && n !== b && /appareil|device|dispositivo|ger\u00e4t/i.test(String(n.getAttribute(\'aria-label\') || \'\'));\n        });\n        if (pops.length > 1) rootAmbiguous = true;\n        return pops.length === 1 ? pops[0] : null;\n    }\n    // Exclude hidden descendants and embedded controls rather than treating\n    // all textContent inside a visible lyric element as a line.\n    function lyricText(n) {\n        if (!n || hiddenBeforeTap(n)) return \'\';\n        var parts = [], visited = 0;\n        function walk(node) {\n            if (++visited > 1000) return;\n            if (node.nodeType === 3) { parts.push(node.nodeValue || \'\'); return; }\n            if (node.nodeType !== 1) return;\n            if (node !== n) {\n                if (node.matches(\'button, [role=\"button\"], [role=\"switch\"]\') || node.hasAttribute(\'hidden\') || node.getAttribute(\'aria-hidden\') === \'true\') return;\n                var cs = window.getComputedStyle(node);\n                if (cs.display === \'none\' || cs.visibility === \'hidden\') return;\n            }\n            if (node.tagName === \'BR\') parts.push(\' \');\n            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);\n        }\n        walk(n);\n        return parts.join(\'\').replace(/\\s+/g, \' \').trim().slice(0, 300);\n    }\n    function lyricLines(r) {\n        // aria-controls by itself may point at unrelated content. Require a\n        // lyrics-specific root or a lyrics-specific line marker, not just <p>.\n        if (!r.matches(spec.roots) && !r.querySelector(\'[data-testid=\"fullscreen-lyric\"], [data-testid^=\"lyrics-line\"]\')) return {lines: [], active: -1, synced: false};\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'[data-testid*=\"lyric\" i]\')).filter(function(n) {\n            // A button such as lyrics-close-button is a control, not a lyric\n            // line. Ignoring it lets the paragraph fallback read real lines.\n            return !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && (!n.children.length || !n.querySelector(\'[data-testid*=\"lyric\" i]\'));\n        });\n        if (!nodes.length && r.matches(spec.roots)) nodes = Array.from(r.querySelectorAll(\'p\'));\n        nodes = nodes.filter(function(n) { return !hiddenBeforeTap(n) && !n.closest(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        var lines = [], active = -1, activeCount = 0, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = lyricText(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; activeCount++; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced && activeCount === 1 ? active : -1, synced: synced};\n    }\n    function trustedDevices(r) {\n        // A trigger\'s aria-controls alone does not prove the target is Spotify\'s\n        // device picker; never send a transfer into an arbitrary region.\n        return !!r && r.matches(spec.roots);\n    }\n    function deviceRows(r, includeHidden) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        nodes = nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return includeHidden || !hiddenBeforeTap(n); });\n        // Limit display only. Transfer ambiguity must consider every matching\n        // element, including hidden items beyond the first page of results.\n        if (!includeHidden) nodes = nodes.slice(0, 30);\n        return nodes.map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    // Temporarily size zero-height containers. Restore only properties that\n    // still have our value, preserving concurrent changes made by Spotify.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            var entry = {node:n, hadStyle:n.hasAttribute(\'style\'), props:[]};\n            sized.push(entry);\n            function set(prop, value) {\n                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);\n                n.style.setProperty(prop, value, \'important\');\n            }\n            if (cs.display === \'none\') set(\'display\', \'block\');\n            if (cs.visibility === \'hidden\') set(\'visibility\', \'visible\');\n            if (small) set(\'min-height\', \'640px\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try {\n            e.props.forEach(function(p) {\n                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== \'important\') return;\n                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);\n            });\n            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute(\'style\');\n        } catch (_) {} });\n        sized = [];\n    }\n    // Close only a unique, panel-specific control inside the recognised\n    // panel. An ambiguous or generic close button is never used.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            var known = kind===\'lyrics\' ? /^(lyrics-close-button|close-lyrics-button)$/.test(id) || /^(close lyrics|hide lyrics|fermer les paroles|masquer les paroles)$/i.test(label) :\n                /^(devices-close-button|close-devices-button)$/.test(id) || /^(close devices|close device picker|fermer les appareils|fermer la liste des appareils)$/i.test(label);\n            return known && n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n);\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button(); var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && !already && hiddenBeforeTap(b)) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4000, forced = false;\n        (function step() {\n          try {\n            var r = null;\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null;\n            if (kind === \'devices\' && action === \'transfer\' && r && !trustedDevices(r)) { log(\'target:absent\'); finish(false, \'target\'); return; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r, action === \'transfer\').length);\n            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\'); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); return;\n            }\n            var rows = deviceRows(r, action === \'transfer\');\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); return; }\n                var targetNode = target[0].node;\n                if (targetNode.disabled || targetNode.matches(\':disabled\') || targetNode.closest(\'[aria-disabled=\"true\"]\') || hiddenBeforeTap(targetNode)) {\n                    log(\'target:disabled\'); finish(false, \'target\'); return;\n                }\n                if (rows.filter(function(d) { return d.current; }).length > 1) { log(\'target:ambiguous\'); finish(false, \'target\'); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); return; }\n                try { targetNode.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                  try {\n                    var again = null;\n                    try {\n                        var r2 = root(button() || b), all = r2 === r && trustedDevices(r2) ? deviceRows(r2, true) : [];\n                        var matches = all.filter(function(d) { return d.name === wanted; });\n                        var activeCount = all.filter(function(d) { return d.current; }).length;\n                        // A duplicate, replacement, changed panel or conflicting\n                        // active states do not prove the original target is active.\n                        again = activeCount === 1 && matches.length === 1 && matches[0].node === targetNode && targetNode.isConnected && !targetNode.disabled && !targetNode.matches(\':disabled\') && !targetNode.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(targetNode) ? matches[0] : null;\n                    } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\');\n                  } catch (_) { finish(false, \'error\'); }\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\');\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$kind:Ljava/lang/String;

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",\"poll\",\"\");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$14$1;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerTiles$14$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles$14;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 293
    :goto_0
    return-void

    .line 285
    :cond_2
    :goto_1
    return-void
.end method
