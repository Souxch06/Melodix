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

    .line 243
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

    .line 244
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$2300(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 245
    :cond_1
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "((function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) { return n.isConnected; });\n        if (hits.length >= 1) return hits[0];\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        return c && c.isConnected ? c : null;\n    }\n    function lyricLines(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'p\'));\n        var lines = [], active = -1, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = text(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced ? active : -1, synced: synced};\n    }\n    function deviceRows(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button(), already = root(b);\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var close = function() {\n            if (wasOpen) return;\n            setTimeout(function() {\n                try { var again = button() || b; if (again && (isOpen(again) || root(again))) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n            }, 120);\n        };\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null;\n            try { r = root(button() || b); } catch (_) { r = null; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r).length);\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); close(); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); close(); return;\n            }\n            var rows = deviceRows(r);\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); close(); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); close(); return; }\n                try { target[0].node.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); close(); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                    var again = null;\n                    try { var r2 = root(button() || b); again = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; })[0] : null; } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); close(); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\'); close();\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\'); close();\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)("

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

    .line 249
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$2300(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 250
    :goto_0
    return-void

    .line 244
    :cond_2
    :goto_1
    return-void
.end method
