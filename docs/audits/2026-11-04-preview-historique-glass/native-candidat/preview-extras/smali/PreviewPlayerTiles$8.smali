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

    .line 204
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

    .line 205
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1000(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 206
    :cond_1
    :try_start_0
    const-string v1, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixDrawerUnsafe) return JSON.stringify({status: \'blocked\'});\n    if (W.__melodixDrawerLease && W.__melodixDrawerLease.status === \'running\') return JSON.stringify({status: \'busy\'});\n    var counter = Number(W.__melodixDrawerCounter);\n    W.__melodixDrawerCounter = isFinite(counter) && counter >= 0 && counter < 999999999 ? Math.floor(counter) + 1 : 1;\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), id: String(Date.now()) + \':\' + W.__melodixDrawerCounter, ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    W.__melodixDrawerLease = job;\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    // textContent includes aria-hidden nodes and embedded controls. Only read\n    // visible text, with a bounded walk, so hidden metadata cannot leak into a title.\n    function text(n) {\n        if (!n || hiddenBeforeTap(n)) return \'\';\n        var parts = [], visited = 0;\n        function walk(node) {\n            if (++visited > 1000) return;\n            if (node.nodeType === 3) { parts.push(node.nodeValue || \'\'); return; }\n            if (node.nodeType !== 1) return;\n            if (node !== n) {\n                if (node.matches(\'button, [role=\"button\"], [role=\"switch\"]\') || node.hasAttribute(\'hidden\') || node.getAttribute(\'aria-hidden\') === \'true\') return;\n                var cs = window.getComputedStyle(node);\n                if (cs.display === \'none\' || cs.visibility === \'hidden\') return;\n            }\n            if (node.tagName === \'BR\') parts.push(\' \');\n            for (var child = node.firstChild; child; child = child.nextSibling) walk(child);\n        }\n        walk(n);\n        return parts.join(\'\').replace(/\\s+/g, \' \').trim().slice(0, 200);\n    }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0, rootAmbiguous = false;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        // Narrow page: Spotify opens the queue as its own page (/queue) in the main view.\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\'))) {\n            var mainView = document.querySelector(\'#main-view, main\');\n            if (mainView && mainView.isConnected) return mainView;\n        }\n        var selectors = \'#queue-panel, [data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected && n !== b && !n.matches(\'button, [role=\"button\"], [role=\"switch\"]\'); });\n        // A chain of nested markers can describe one queue. Keep the outer\n        // wrapper so headers and rows belonging to that queue are retained;\n        // independent branches remain ambiguous and are never merged.\n        if (found.length > 1) {\n            var leaves = found.filter(function(n) { return !found.some(function(other) { return other !== n && n.contains(other); }); });\n            if (leaves.length === 1) {\n                var outer = found.filter(function(n) { return !found.some(function(other) { return other !== n && other.contains(n); }); });\n                if (outer.length === 1) return outer[0];\n            }\n            rootAmbiguous = true; return null;\n        }\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        if (controlled && controlled !== b && controlled.isConnected && !controlled.matches(\'button, [role=\"button\"], [role=\"switch\"]\')) return controlled;\n        // Desktop layout: the queue opens in the right-hand panel, labelled in any language.\n        var labelled = Array.from(document.querySelectorAll(\'aside, section, [role=\"region\"], [role=\"complementary\"], [role=\"dialog\"], div[aria-label]\')).filter(function(n) {\n            return n.isConnected && /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(n.getAttribute(\'aria-label\') || \'\').trim());\n        });\n        if (labelled.length > 1) { rootAmbiguous = true; return null; }\n        return labelled.length === 1 ? labelled[0] : null;\n    }\n    // Title fallbacks are permitted only inside a queue-specific region, not\n    // an arbitrary aria-controls target or a playlist elsewhere in the page.\n    function queueScope(r) {\n        if (!r) return false;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) return true;\n        if (r.matches(\'#queue-panel, [data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"]\')) return true;\n        return /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola( de reproducci\u00f3n)?|fila( de reprodu\u00e7\u00e3o)?)$/i.test(String(r.getAttribute(\'aria-label\') || \'\').trim());\n    }\n    function titleFallback(n) {\n        // These are specific track-title markers, not positional text guesses\n        // or generic album/artist links. Reject multiple distinct candidates.\n        var candidates = Array.from(n.querySelectorAll(\'[class*=\"ListRowTitle__ListRowText\"]\')).filter(function(el) {\n            return el.isConnected && !el.closest(\'button, [role=\"button\"], [role=\"switch\"]\') && !hiddenBeforeTap(el) && !!text(el);\n        });\n        candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });\n        return candidates.length === 1 ? candidates[0] : null;\n    }\n    // Spotify\'s queue may use an explicit Encore title rather than a track\n    // link. This is limited to actual rows under #queue-panel, never a\n    // neighbouring history or an arbitrary aria-controls target.\n    function semanticTitle(n) {\n        if (!n.closest(\'#queue-panel\')) return null;\n        var titles = Array.from(n.querySelectorAll(\'[data-encore-id=\"listRowTitle\"]\')).filter(function(el) {\n            if (!el.isConnected || hiddenBeforeTap(el) || !text(el) || el.closest(\'button, [role=\"switch\"]\') || el.querySelector(\'a[href*=\"/artist/\"], [data-encore-id=\"listRowSubtitle\"]\')) return false;\n            var clickable = el.closest(\'[role=\"button\"]\');\n            // A row itself may be clickable; a separate action control is not a song.\n            return !clickable || (n.contains(clickable) && !!clickable.querySelector(\'[data-encore-id=\"listRowSubtitle\"]\'));\n        });\n        titles = titles.filter(function(el) { return !titles.some(function(other) { return other !== el && el.contains(other); }); });\n        return titles.length === 1 ? titles[0] : null;\n    }\n    function rows(r) {\n        if (!queueScope(r)) return [];\n        // A labelled outer sidebar can contain both queue and listening history.\n        // If there is an explicit queue panel, read only that subtree.\n        var panels = r.matches(\'#queue-panel\') ? [r] : Array.from(r.querySelectorAll(\'#queue-panel\'));\n        if (panels.length > 1) return [];\n        var scope = panels.length === 1 ? panels[0] : r;\n        var list = Array.from(scope.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !hiddenBeforeTap(n) && !n.closest(\'#history-panel\') && !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        if (!list.length) {\n            // No row markers: one row per track link, its closest list item or row-like block.\n            var seen = [];\n            Array.from(scope.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\')).forEach(function(a) {\n                var row = a.closest(\'li, [role=\"listitem\"], [draggable=\"true\"], [data-encore-id=\"listRow\"]\') || a.parentElement && a.parentElement.parentElement || a;\n                if (!hiddenBeforeTap(a) && !hiddenBeforeTap(row) && !a.closest(\'#history-panel\') && seen.indexOf(row) < 0) seen.push(row);\n            });\n            list = seen;\n        }\n        if (!list.length && queueScope(r)) {\n            // Newer Encore queue rows may have a title marker without any\n            // track href. Only row containers bearing that marker qualify.\n            var marked = Array.from(scope.querySelectorAll(\'li, [role=\"listitem\"], [data-encore-id=\"listRow\"]\')).filter(function(n) { return !hiddenBeforeTap(n) && !n.closest(\'#history-panel\') && (!!semanticTitle(n) || !!titleFallback(n)); });\n            list = marked.filter(function(n) { return !marked.some(function(other) { return other !== n && n.contains(other); }); });\n        }\n        // Scan beyond invalid/placeholder rows, but cap the work. Only the\n        // first 40 validated rows are ultimately returned.\n        var output = [];\n        list.slice(0, 400).some(function(n) {\n            var candidates = Array.from(n.querySelectorAll(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });\n            candidates = candidates.filter(function(el) { return !candidates.some(function(other) { return el !== other && el.contains(other); }); });\n            if (candidates.length > 1) return false;\n            var t = candidates[0] || null;\n            var semantic = !t ? semanticTitle(n) : null;\n            if (!t) t = semantic;\n            if (!t && queueScope(r)) t = titleFallback(n);\n            var artistRoot = semantic ? n.querySelector(\'[data-encore-id=\"listRowSubtitle\"]\') : n;\n            var artists = artistRoot ? Array.from(artistRoot.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).filter(function(el) { return !hiddenBeforeTap(el); }).map(text).filter(Boolean) : [];\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            if (!artists.length && t && queueScope(r)) {\n                var details = Array.from(n.querySelectorAll(\'[class*=\"ListRowDetails__ListRowDetailText\"]\')).filter(function(el) { return !hiddenBeforeTap(el) && !!text(el); });\n                if (details.length === 1) artists.push(text(details[0]));\n            }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            var item = {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration, current: n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-testid\') === \'queue-now-playing\'};\n            if (item.title) output.push(item);\n            return output.length >= 40;\n        });\n        return output;\n    }\n    // Failure-only structural fingerprint. Every character is a fixed category\n    // or a count capped at 9; no page text, IDs, hrefs or arbitrary labels leave\n    // the WebView. This does not read a different panel or perform any action.\n    function emptyShape(r, trigger) {\n        if (!r) return \'\';\n        var kind = 7;\n        if (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) && r.matches(\'#main-view, main\')) kind = 0;\n        else if (r.matches(\'[data-testid=\"queue-page\"]\')) kind = 1;\n        else if (r.matches(\'[data-testid=\"queue-view\"]\')) kind = 2;\n        else if (r.matches(\'[data-testid=\"queue-panel\"]\')) kind = 3;\n        else if (r.matches(\'[data-testid=\"NPV-queue\"]\')) kind = 4;\n        else if (r.matches(\'#queue-panel\')) kind = 8;\n        else if (trigger && trigger.getAttribute(\'aria-controls\') && document.getElementById(trigger.getAttribute(\'aria-controls\')) === r) kind = 5;\n        else kind = 6;\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'shape:\' + [kind, Math.min(r.children.length,9), count(\'*\'),\n            count(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\'),\n            count(\'a[href]\'), count(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\'),\n            count(\'a[href^=\"spotify:track:\"], a[href^=\"spotify:episode:\"]\'),\n            count(\'[data-uri], [data-track-uri], [data-spotify-uri]\'),\n            count(\'[data-testid*=\"track\" i]\'), count(\'li, [role=\"listitem\"]\'),\n            count(\'[role=\"row\"]\'), count(\'[data-testid*=\"queue\" i]\'),\n            count(\'[data-encore-id=\"listRow\"]\'), String(r.textContent || \'\').trim() ? 1 : 0].join(\'\');\n    }\n    // Extra bounded categories diagnose which supported row shapes exist if\n    // extraction still fails. Never return selectors, text or attribute values.\n    function emptyDetail(r) {\n        if (!r) return \'\';\n        function count(selector) { return Math.min(r.querySelectorAll(selector).length, 9); }\n        return \'detail:\' + [count(\'#queue-panel\'), count(\'[class*=\"ListRowTitle__ListRowText\"]\'),\n            count(\'[class*=\"ListRowDetails__ListRowDetailText\"]\'), count(\'a[href*=\"/artist/\"]\'),\n            count(\'a[href*=\"/album/\"]\'), count(\'[data-context-item-type=\"track\"], [data-context-item-type=\"episode\"]\'),\n            count(\'[role=\"gridcell\"]\'), count(\'[data-encore-id=\"text\"]\'), count(\'[data-flip-id*=\"section-header-\"]\')].join(\'\');\n    }\n    function semanticDetail(r) {\n        var panels = Array.from(r.querySelectorAll(\'#queue-panel\'));\n        if (r.matches(\'#queue-panel\')) panels.unshift(r);\n        if (panels.length !== 1) return \'sem:\' + Math.min(panels.length, 9) + \'0000\';\n        var panel = panels[0], titles = Array.from(panel.querySelectorAll(\'[data-encore-id=\"listRowTitle\"]\'));\n        var rowCount = Array.from(panel.querySelectorAll(\'li, [role=\"listitem\"], [role=\"row\"], [data-encore-id=\"listRow\"]\')).filter(function(n) { return !!semanticTitle(n); }).length;\n        return \'sem:\' + [1, Math.min(titles.length,9), Math.min(panel.querySelectorAll(\'[data-encore-id=\"listRowSubtitle\"]\').length,9), Math.min(rowCount,9), Math.min(titles.filter(hiddenBeforeTap).length,9)].join(\'\');\n    }\n    // Temporarily size zero-height containers. Restore only properties that\n    // still have our value, preserving concurrent changes made by Spotify.\n    var sized = [];\n    function giveSize(r) {\n        var h = 0;\n        try { h = Math.round(r.getBoundingClientRect().height); } catch (_) {}\n        for (var n = r; n && n !== document.body && sized.length < 12; n = n.parentElement) {\n            var cs = window.getComputedStyle(n), small = false;\n            try { small = n.getBoundingClientRect().height < 2; } catch (_) {}\n            if (cs.display !== \'none\' && cs.visibility !== \'hidden\' && !small) continue;\n            var entry = {node:n, hadStyle:n.hasAttribute(\'style\'), props:[]};\n            sized.push(entry);\n            function set(prop, value) {\n                entry.props.push([prop, n.style.getPropertyValue(prop), n.style.getPropertyPriority(prop), value]);\n                n.style.setProperty(prop, value, \'important\');\n            }\n            if (cs.display === \'none\') set(\'display\', \'block\');\n            if (cs.visibility === \'hidden\') set(\'visibility\', \'visible\');\n            if (small) set(\'min-height\', \'640px\');\n        }\n        log(\'sized:\' + sized.length + \',h:\' + Math.min(h, 9999));\n    }\n    function restoreSize() {\n        sized.forEach(function(e) { try {\n            e.props.forEach(function(p) {\n                if (e.node.style.getPropertyValue(p[0]) !== p[3] || e.node.style.getPropertyPriority(p[0]) !== \'important\') return;\n                if (p[1]) e.node.style.setProperty(p[0], p[1], p[2]); else e.node.style.removeProperty(p[0]);\n            });\n            if (!e.hadStyle && !e.node.style.length) e.node.removeAttribute(\'style\');\n        } catch (_) {} });\n        sized = [];\n    }\n    // Only an explicitly named queue close control inside the recognised\n    // panel is eligible; generic close buttons elsewhere are never clicked.\n    function explicitCloser(r, trigger) {\n        if (!r || rootAmbiguous) return null;\n        var candidates = Array.from(r.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(n) {\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim();\n            return n.isConnected && n!==trigger && !n.disabled && !n.matches(\':disabled\') && n.getAttribute(\'aria-disabled\')!==\'true\' &&\n                !n.closest(\'[aria-disabled=\"true\"]\') && !hiddenBeforeTap(n) &&\n                (/^(queue-close-button|close-queue-button)$/.test(id) || /^(close (the )?(play )?queue|fermer la file d[\'\u2019]attente|masquer la file d[\'\u2019]attente)$/i.test(label));\n        });\n        return candidates.length===1 ? candidates[0] : null;\n    }\n    // A connected but hidden panel is not evidence that it was open before\n    // this tap; it can be a stale, pre-rendered, collapsed Spotify container.\n    function hiddenBeforeTap(n) {\n        if (!n) return false;\n        try {\n            for (var el=n; el && el !== document.body; el=el.parentElement) {\n                var cs=window.getComputedStyle(el);\n                if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\')===\'true\' || cs.display===\'none\' || cs.visibility===\'hidden\') return true;\n            }\n            return false;\n        } catch (e) { throw e; }\n    }\n    var b = null, wasOpen = true, openedHere = false, finishing = false;\n    function finish(ok, reason) {\n        if (finishing) return;\n        finishing = true;\n        restoreSize();\n        function done(closeOk) {\n            if (openedHere) log(closeOk ? \'close:verified\' : \'close:unverified\');\n            job.status = \'done\'; job.ok = ok && closeOk;\n            job.reason = closeOk ? (reason || \'\') : \'close-unverified\';\n            if (!closeOk) W.__melodixDrawerUnsafe = true;\n            if (W.__melodixDrawerLease === job) W.__melodixDrawerLease = null;\n        }\n        if (!openedHere) { done(true); return; }\n        // Prefer the exact open trigger; otherwise use only a unique explicit\n        // close control scoped to this recognised panel. Never guess history.\n        var closeAttempted = false;\n        try {\n            if (b && b.isConnected && button() === b && isOpen(b) && !hiddenBeforeTap(b) && !b.disabled && !b.matches(\':disabled\') && !b.closest(\'[aria-disabled=\"true\"]\')) {\n                b.click(); closeAttempted = true; log(\'closed\');\n            } else {\n                var currentRoot = root(b), closer = explicitCloser(currentRoot, b);\n                if (closer) { closer.click(); closeAttempted = true; log(\'close:button\'); }\n            }\n        } catch (_) { log(\'close-error\'); }\n        // The close animation and the aria state can settle asynchronously.\n        // Inspect for a bounded interval; never send a second close click.\n        // If the same unique trigger has no state attributes, a successful\n        // panel-specific close plus disappearance of the recognised root is\n        // evidence of closure. A replacement trigger, a new visible root, or\n        // an ambiguous root is never accepted as confirmation.\n        if (!closeAttempted) { done(false); return; }\n        var closeDeadline = Date.now() + 900;\n        (function verifyClose() {\n            setTimeout(function() {\n                try {\n                    var remains = root(b), hidden = remains && hiddenBeforeTap(remains);\n                    var after = button();\n                    if (rootAmbiguous || after !== b || !b.isConnected) { done(false); return; }\n                    var explicitlyClosed = after && (after.getAttribute(\'aria-pressed\') === \'false\' || after.getAttribute(\'aria-expanded\') === \'false\' || after.getAttribute(\'data-active\') === \'false\') && !isOpen(after);\n                    var noState = after && !after.hasAttribute(\'aria-pressed\') && !after.hasAttribute(\'aria-expanded\') && !after.hasAttribute(\'data-active\');\n                    var clearlyClosed = closeAttempted && !rootAmbiguous && after === b && b.isConnected && !isOpen(b) && (explicitlyClosed || noState) && (!remains || !!hidden);\n                    if (clearlyClosed) { done(true); return; }\n                    if (Date.now() < closeDeadline) { verifyClose(); return; }\n                    done(false);\n                } catch (_) { done(false); }\n            }, 150);\n        })();\n    }\n    try {\n        b = button();\n        var already = root(b);\n        if (already && hiddenBeforeTap(already)) already = null;\n        if (rootAmbiguous) { log(\'root:ambiguous\'); finish(false, \'ambiguous\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && (b.disabled || b.matches(\':disabled\') || b.closest(\'[aria-disabled=\"true\"]\')) && !already) { log(\'button:disabled\'); finish(false, \'disabled\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        if (b && !already && hiddenBeforeTap(b)) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\', id: job.id}); }\n        wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { openedHere = true; b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\', id: job.id}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 4500, forced = false;\n        (function step() {\n          try {\n            var r = null, list = [];\n            r = root(button() || b); if (r && hiddenBeforeTap(r)) r = null; list = r ? rows(r) : [];\n            if (!list.length && r && !forced && Date.now() > end - 3500) { forced = true; giveSize(r); }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                var marked = list.filter(function(x) { return x.current; });\n                job.now = marked.length === 1 ? line(marked[0]) : \'\';\n                job.next = list.filter(function(x) { return marked.length !== 1 || x !== marked[0]; }).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else {\n                log(r ? \'rows:0\' : \'panel:absent\');\n                // Counts only, to locate the queue next time: route, links in the panel, rows in the page.\n                log(\'path:\' + (/^\\/queue(?:\\/|$)/.test(String(location.pathname || \'\')) ? \'queue\' : \'other\'));\n                log(\'links:\' + Math.min(r ? r.querySelectorAll(\'a[href*=\"/track/\"], a[href*=\"/episode/\"]\').length : 0, 99));\n                log(\'rowsdoc:\' + Math.min(document.querySelectorAll(\'[data-testid=\"tracklist-row\"], [role=\"row\"]\').length, 99));\n                if (r) { log(emptyShape(r, b)); log(emptyDetail(r)); log(semanticDetail(r)); }\n                finish(false, rootAmbiguous ? \'ambiguous\' : r ? \'empty\' : \'panel\');\n            }\n          } catch (_) { finish(false, \'error\'); }\n        })();\n        return JSON.stringify({status: \'started\', id: job.id});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\', id: job.id});\n    }\n})\n)(\"poll\");"

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$8$1;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerTiles$8$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles$8;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 213
    :goto_0
    return-void

    .line 205
    :cond_2
    :goto_1
    return-void
.end method
