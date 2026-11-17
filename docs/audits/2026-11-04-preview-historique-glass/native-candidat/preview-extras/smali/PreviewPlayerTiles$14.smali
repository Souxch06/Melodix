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

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$action:Ljava/lang/String;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$i:I

.field private final synthetic val$kind:Ljava/lang/String;

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$n:I

.field private final synthetic val$retry:Landroid/widget/Button;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;ILandroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 281
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

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 282
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$27(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_1

    .line 290
    :cond_0
    :goto_0
    return-void

    .line 282
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$22(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v12

    if-nez v12, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$30(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0

    .line 283
    :cond_2
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "((function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    W.__melodixDrawerLease = job;\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            main: true,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|appareils disponibles|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0, rootAmbiguous = false;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) {\n            // Spotify may give the trigger itself a device-picker testid.\n            // A button is not its own content panel and must not imply open.\n            return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\');\n        });\n        // Nested wrappers can describe the same panel; unrelated roots are\n        // ambiguous and must never be treated as the current content.\n        hits = hits.filter(function(n) { return !hits.some(function(other) { return other !== n && n.contains(other); }); });\n        if (hits.length === 1) return hits[0];\n        if (hits.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        if (c && c !== b && c.isConnected && !c.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return c;\n        if (spec.main) {\n            // Desktop layout: lyrics replace the main view; use it only when it shows lyric lines.\n            var main = document.querySelector(\'#main-view, main\');\n            return main && main.querySelector(\'[data-testid*=\"lyric\" i]\') ? main : null;\n        }\n        // Device picker opens as a popover/dialog mentioning devices.\n        var pops = Array.from(document.querySelectorAll(\'[role=\"dialog\"], [data-tippy-root], [id^=\"tippy\"]\')).filter(function(n) {\n            return n.isConnected && n !== b && /appareil|device|dispositivo|ger\u00e4t/i.test(String(n.getAttribute(\'aria-label\') || \'\'));\n        });\n        if (pops.length > 1) rootAmbiguous = true;\n        return pops.length === 1 ? pops[0] : null;\n    }\n    function lyricLines(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'[data-testid*=\"lyric\" i]\')).filter(function(n) { return !n.children.length || !n.querySelector(\'[data-testid*=\"lyric\" i]\'); });\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'p\'));\n        var lines = [], active = -1, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = text(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced ? active : -1, synced: synced};\n    }\n    function deviceRows(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    // The page is hidden: a panel (or one of its parents) can measure 0 px, and\n    // Spotify then draws no rows in it. Give it a size while it is read, then\n    // restore the original inline style exactly. No other change to the page.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            sized.push([n, n.getAttribute(\'style\')]);\n            if (cs.display === \'none\') n.style.setProperty(\'display\', \'block\', \'important\');\n            if (cs.visibility === \'hidden\') n.style.setProperty(\'visibility\', \'visible\', \'important\');\n            if (small) n.style.setProperty(\'min-height\', \'640px\', \'important\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute(\'style\'); else e[0].setAttribute(\'style\', e[1]); } catch (_) {} });\n        sized = [];\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Only the same explicitly open trigger may be toggled back. Do not\n        // click a replacement, a disabled control, or guess at browser history.\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && b.getAttribute(\'aria-disabled\') !== \'true\') {\n                b.click(); log(\'closed\');\n            }\n        } catch (_) { log(\'close-error\'); }\n        setTimeout(function() {\n            try {\n                var remains = root(b);\n                var hidden = remains && (remains.closest(\'[hidden], [aria-hidden=\"true\"]\') ||\n                    window.getComputedStyle(remains).display === \'none\' || window.getComputedStyle(remains).visibility === \'hidden\');\n                var after = button();\n                var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                var clearlyClosed = !rootAmbiguous && explicitlyClosed && (!remains || !!hidden);\n                done(!!clearlyClosed);\n            } catch (_) { done(false); }\n        }, 150);\n    }\n    try {\n        b = button(); var already = root(b);\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.getAttribute(\'aria-disabled\') === \'true\') && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4000, forced = false;\n        (function step() {\n          try {\n            var r = null;\n            try { r = root(button() || b); } catch (_) { r = null; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r).length);\n            if (!ready && r && !forced && Date.now() > end - 2000) { forced = true; giveSize(r); }\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\'); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); return;\n            }\n            var rows = deviceRows(r);\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); return; }\n                try { target[0].node.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                  try {\n                    var again = null;\n                    try { var r2 = root(button() || b); again = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; })[0] : null; } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\');\n                  } catch (_) { finish(false, \'error\'); }\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\');\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"poll\",\"\");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$14$1;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$serial:J

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$dialog:Landroid/app/Dialog;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    iget v9, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$n:I

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$action:Ljava/lang/String;

    iget-object v11, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$kind:Ljava/lang/String;

    move-object v1, p0

    invoke-direct/range {v0 .. v11}, Lcom/melodix/music/PreviewPlayerTiles$14$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles$14;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v13, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 289
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$30(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0
.end method
