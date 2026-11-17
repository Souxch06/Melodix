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

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$n:I

.field private final synthetic val$retry:Landroid/widget/Button;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V
    .locals 0

    .prologue
    .line 199
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

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerTiles$8;)Lcom/melodix/music/PreviewPlayerTiles;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 200
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_1

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 200
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$22(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v9

    if-nez v9, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$14(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0

    .line 201
    :cond_2
    :try_start_0
    const-string v10, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    W.__melodixDrawerLease = job;\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0, rootAmbiguous = false;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\'))) {\n            var mainView = document.querySelector(\'#main-view, main\');\n            if (mainView && mainView.isConnected) return mainView;\n        }\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        if (found.length === 1) return found[0];\n        if (found.length > 1) { rootAmbiguous = true; return null; }\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return controlled;\n        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.\n        var labelled = Array.from(document.querySelectorAll(\'aside, section, [role=\"region\"], [role=\"complementary\"], [role=\"dialog\"], div[aria-label]\')).filter(function(n) {\n            return n.isConnected && /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(n.getAttribute(\'aria-label\') || \'\').trim());\n        });\n        if (labelled.length > 1) { rootAmbiguous = true; return null; }\n        return labelled.length === 1 ? labelled[0] : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        if (!list.length) {\n            // No row markers: one row per track link, its closest list item or row-like block.\n            var seen = [];\n            Array.from(r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\')).forEach(function(a) {\n                var row = a.closest(\'li, [role=\"listitem\"], [draggable=\"true\"], [data-encore-id=\"listRow\"]\') || a.parentElement && a.parentElement.parentElement || a;\n                if (seen.indexOf(row) < 0) seen.push(row);\n            });\n            list = seen;\n        }\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration, current: n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-testid\') === \'queue-now-playing\'};\n        }).filter(function(x) { return x.title; });\n    }\n    // The page is hidden: a panel (or one of its parents) can measure 0 px, and\n    // Spotify then draws no rows in it. Give it a size while it is read, then\n    // restore the original inline style exactly. No other change to the page.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            sized.push([n, n.getAttribute(\'style\')]);\n            if (cs.display === \'none\') n.style.setProperty(\'display\', \'block\', \'important\');\n            if (cs.visibility === \'hidden\') n.style.setProperty(\'visibility\', \'visible\', \'important\');\n            if (small) n.style.setProperty(\'min-height\', \'640px\', \'important\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try { if (e[1] === null) e[0].removeAttribute(\'style\'); else e[0].setAttribute(\'style\', e[1]); } catch (_) {} });\n        sized = [];\n    }\n    // Only an explicitly named queue close control inside the recognised\n    // panel is eligible; generic close buttons elsewhere are never clicked.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            return n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n) &&\n                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d[\'\u2019]attente|masquer la file d[\'\u2019]attente)$/i.test(label));\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        setTimeout(function() {\n            try {\n                var remains = root(b);\n                var hidden = remains && (remains.closest(\'[hidden], [aria-hidden=\"true\"]\') ||\n                    window.getComputedStyle(remains).display === \'none\' || window.getComputedStyle(remains).visibility === \'hidden\');\n                var after = button();\n                var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                var clearlyClosed = closeAttempted && !rootAmbiguous && explicitlyClosed && (!remains || !!hidden);\n                done(!!clearlyClosed);\n            } catch (_) { done(false); }\n        }, 150);\n    }\n    try {\n        b = button();\n        var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4500, forced = false;\n        (function step() {\n          try {\n            var r = null, list = [];\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];\n            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                var marked = list.filter(function(x) { return x.current; });\n                job.now = marked.length === 1 ? line(marked[0]) : \'\';\n                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else {\n                log(r ? \'rows:0\' : \'panel:absent\');\n                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.\n                log(\'path:\' + (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) ? \'queue\' : \'other\'));\n                log(\'links:\' + Math.min(r ? r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\').length : 0, 99));\n                log(\'rowsdoc:\' + Math.min(document.querySelectorAll(\'[data-testid=\"tracklist-row\"], [role=\"row\"]\').length, 99));\n                finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\');\n            }\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)(\"poll\");"

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$8$1;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    iget v8, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$n:I

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$8$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles$8;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    invoke-virtual {v9, v10, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 207
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$14(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0
.end method
