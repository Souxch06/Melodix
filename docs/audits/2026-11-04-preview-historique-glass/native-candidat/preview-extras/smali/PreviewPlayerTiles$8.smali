.class Lcom/melodix/music/PreviewPlayerTiles$8;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$n:I

.field final synthetic val$retry:Landroid/widget/Button;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 174
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    iput p8, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 175
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 176
    :cond_1
    :try_start_0
    const-string v1, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixQueueJob && W.__melodixQueueJob.status === \'running\' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        return controlled && controlled.isConnected ? controlled : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration};\n        }).filter(function(x) { return x.title; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button();\n        var already = root(b);\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null, list = [];\n            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                job.now = line(list[0]); job.next = list.slice(1).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); }\n            if (!wasOpen) {\n                setTimeout(function() {\n                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n                }, 100);\n            }\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)(\"poll\");"

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$8$1;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerTiles$8$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles$8;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 181
    :goto_0
    return-void

    .line 175
    :cond_2
    :goto_1
    return-void
.end method
