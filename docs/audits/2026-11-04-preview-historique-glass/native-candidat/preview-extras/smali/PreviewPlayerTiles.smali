.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# static fields
.field private static final PANEL_JOB:Ljava/lang/String; = "(function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) { return n.isConnected; });\n        if (hits.length >= 1) return hits[0];\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        return c && c.isConnected ? c : null;\n    }\n    function lyricLines(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'p\'));\n        var lines = [], active = -1, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = text(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced ? active : -1, synced: synced};\n    }\n    function deviceRows(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button(), already = root(b);\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var close = function() {\n            if (wasOpen) return;\n            setTimeout(function() {\n                try { var again = button() || b; if (again && (isOpen(again) || root(again))) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n            }, 120);\n        };\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null;\n            try { r = root(button() || b); } catch (_) { r = null; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r).length);\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); close(); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); close(); return;\n            }\n            var rows = deviceRows(r);\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); close(); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); close(); return; }\n                try { target[0].node.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); close(); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                    var again = null;\n                    try { var r2 = root(button() || b); again = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; })[0] : null; } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); close(); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\'); close();\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\'); close();\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n"

.field private static final PANEL_PROBE:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n"

.field private static final PANEL_READ:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n"

.field private static final QUEUE_JOB:Ljava/lang/String; = "(function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixQueueJob && W.__melodixQueueJob.status === \'running\' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        return controlled && controlled.isConnected ? controlled : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration};\n        }).filter(function(x) { return x.title; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button();\n        var already = root(b);\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null, list = [];\n            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                job.now = line(list[0]); job.next = list.slice(1).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); }\n            if (!wasOpen) {\n                setTimeout(function() {\n                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n                }, 100);\n            }\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n"

.field private static final TRACE_READ:Ljava/lang/String; = "(function(){var t=window.__melodixOpenTrace;if(!t||typeof t!==\'object\')return \'\';var n=function(x){return typeof x===\'number\'&&isFinite(x)&&x>=0?String(Math.min(Math.round(x),9999999)):\'-\';};var k=t.kind===\'liked\'||t.kind===\'playlist\'?t.kind:\'-\';var ph=/^(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable)$/.test(String(t.phase))?t.phase:\'-\';return [k,ph,n(t.nav),n(t.ready),n(t.dom),n(t.classified),n(t.rendered),n(t.first),n(t.full),n(t.updates)].join(\',\');})()"

.field static displayReport:Ljava/lang/String;

.field private static final observations:[Ljava/lang/String;

.field private static openTrace:Ljava/lang/String;

.field private static panelJournal:Ljava/lang/String;

.field private static final probeSerial:[J

.field private static queueJournal:Ljava/lang/String;

.field private static traceAt:J


# instance fields
.field private final controls:[Landroid/widget/Button;

.field private final icons:[Ljava/lang/String;

.field private lastAction:J

.field private final names:[Ljava/lang/String;

.field private openedAt:J

.field private panelReason:Ljava/lang/String;

.field private panelSerial:J

.field private panelSettled:J

.field private panelStep:Ljava/lang/String;

.field private queueReason:Ljava/lang/String;

.field private queueSerial:J

.field private queueStep:Ljava/lang/String;

.field private readSerial:J

.field private settledSerial:J

.field private final traceTick:Ljava/lang/Runnable;

.field private volumeRunning:Z

.field private webDialog:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 38
    const-string v0, "aucune"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 41
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "non observ\u00e9e"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    sput-object v2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    .line 42
    new-array v1, v1, [J

    fill-array-data v1, :array_0

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    .line 44
    const-wide/16 v1, -0x1

    sput-wide v1, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    .line 48
    const-string v1, "non lue"

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    .line 50
    const-string v1, "\nAffichage lecteur : non observ\u00e9"

    sput-object v1, Lcom/melodix/music/PreviewPlayerTiles;->displayReport:Ljava/lang/String;

    .line 185
    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournal:Ljava/lang/String;

    return-void

    :array_0
    .array-data 8
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    .line 296
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    new-instance p2, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {p2, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    .line 111
    const/4 p2, 0x3

    new-array v0, p2, [Ljava/lang/String;

    const-string v1, "File"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "Paroles"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-string v1, "Appareils"

    const/4 v4, 0x2

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 112
    new-array v0, p2, [Ljava/lang/String;

    const-string v1, "\u2630"

    aput-object v1, v0, v2

    const-string v1, "\u266c"

    aput-object v1, v0, v3

    const-string v1, "\u25a3"

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    .line 113
    new-array v0, p2, [Landroid/widget/Button;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    .line 115
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    .line 139
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v1, "envoi"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    .line 162
    const-wide/16 v5, -0x1

    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    .line 186
    iput-wide v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    .line 191
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    .line 296
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 297
    const/4 v0, 0x4

    new-array v1, v0, [Ljava/lang/String;

    const-string v5, "\u2630\nFile"

    aput-object v5, v1, v2

    const-string v5, "\u266c\nParoles"

    aput-object v5, v1, v3

    const-string v5, "\u25a3\nAppareils"

    aput-object v5, v1, v4

    const-string v4, "\u25d6))\nVolume"

    aput-object v4, v1, p2

    .line 298
    move v4, v2

    :goto_0
    if-ge v4, v0, :cond_7

    .line 299
    if-ne v4, p2, :cond_0

    new-instance v5, Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {v5, p1}, Lcom/melodix/music/PreviewPlayerVolume;-><init>(Landroid/content/Context;)V

    goto :goto_1

    :cond_0
    new-instance v5, Landroid/widget/Button;

    invoke-direct {v5, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 300
    :goto_1
    new-instance v6, Landroid/text/SpannableString;

    aget-object v7, v1, v4

    invoke-direct {v6, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 301
    new-instance v7, Landroid/text/style/RelativeSizeSpan;

    const v8, 0x400ccccd    # 2.2f

    invoke-direct {v7, v8}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    aget-object v8, v1, v4

    const/16 v9, 0xa

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    const/16 v9, 0x21

    invoke-virtual {v6, v7, v2, v8, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 302
    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41200000    # 10.0f

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextSize(F)V

    const v6, -0x4b513b

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextColor(I)V

    .line 303
    invoke-virtual {v5, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setSingleLine(Z)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v6, 0x40000000    # 2.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/high16 v8, 0x40800000    # 4.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-virtual {v5, v7, v9, v6, v8}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v6, 0x42600000    # 56.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 304
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v8, 0x14ffffff

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v8, 0x41900000    # 18.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    const v10, 0x1fffffff

    invoke-virtual {v7, v9, v10}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 305
    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v5, v9}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Landroid/widget/Button;->setElevation(F)V

    invoke-virtual {v5, v10}, Landroid/widget/Button;->setTranslationZ(F)V

    invoke-virtual {v5, v9}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 306
    new-instance v10, Landroid/graphics/drawable/RippleDrawable;

    const v11, 0x447b3fe4

    invoke-static {v11}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v11

    invoke-direct {v10, v11, v7, v9}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, v10}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 307
    if-ne v4, p2, :cond_1

    const-string v7, "Volume du lecteur indisponible"

    goto :goto_2

    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v9, v9, v4

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " : indisponible, page Spotify non accessible"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_2
    invoke-virtual {v5, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 308
    if-ge v4, p2, :cond_2

    invoke-virtual {v5, v3}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_2
    if-ne v4, p2, :cond_3

    move v7, v8

    goto :goto_3

    :cond_3
    const v7, 0x3f4ccccd    # 0.8f

    :goto_3
    invoke-virtual {v5, v7}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setActivated(Z)V

    .line 309
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v9, v9, Landroid/content/res/Configuration;->fontScale:F

    const v10, 0x3fa66666    # 1.3f

    cmpl-float v9, v9, v10

    if-lez v9, :cond_4

    const/4 v6, -0x2

    goto :goto_4

    :cond_4
    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    :goto_4
    invoke-direct {v7, v2, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v4, :cond_5

    const/high16 v6, 0x41000000    # 8.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    iput v6, v7, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_5
    invoke-virtual {p0, v5, v7}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 310
    if-ge v4, p2, :cond_6

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aput-object v5, v6, v4

    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$21;

    invoke-direct {v6, p0, v4}, Lcom/melodix/music/PreviewPlayerTiles$21;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 313
    :cond_7
    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Activity;
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->readTrace(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    return-wide v0
.end method

.method static synthetic access$1102(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->parseObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    return-void
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p6}, Lcom/melodix/music/PreviewPlayerTiles;->confirmTransfer(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    return-wide v0
.end method

.method static synthetic access$2008(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    return-wide v0
.end method

.method static synthetic access$202(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->openTrace:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    return-wide v0
.end method

.method static synthetic access$2202(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournal:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2402(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p10}, Lcom/melodix/music/PreviewPlayerTiles;->pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/melodix/music/PreviewPlayerTiles;F)I
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$2800(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->openedAt:J

    return-wide v0
.end method

.method static synthetic access$2900(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$3000(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method static synthetic access$302(J)J
    .locals 0

    .line 34
    sput-wide p0, Lcom/melodix/music/PreviewPlayerTiles;->traceAt:J

    return-wide p0
.end method

.method static synthetic access$3100(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V

    return-void
.end method

.method static synthetic access$400()[J
    .locals 1

    .line 34
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    return-object v0
.end method

.method static synthetic access$500()[Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 0

    .line 34
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->count(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$708(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$802(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method static synthetic access$908(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method private activate(I)V
    .locals 18

    .line 253
    move-object/from16 v9, p0

    move/from16 v0, p1

    const-string v1, "envoi"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v8

    .line 254
    iget-boolean v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v4, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v4

    if-nez v4, :cond_6

    if-eqz v8, :cond_6

    invoke-virtual {v8}, Landroid/app/Activity;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {v8}, Landroid/app/Activity;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-nez v4, :cond_6

    iget-wide v4, v9, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x190

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    goto/16 :goto_4

    .line 255
    :cond_0
    iput-wide v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    iget-object v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v2, v2, v0

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->performHapticFeedback(I)Z

    invoke-direct {v9, v0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V

    .line 257
    :try_start_0
    new-instance v10, Landroid/app/Dialog;

    invoke-direct {v10, v8}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 258
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const/high16 v6, 0x41000000    # 8.0f

    invoke-direct {v9, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/high16 v12, 0x41c00000    # 24.0f

    invoke-direct {v9, v12}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v12

    invoke-virtual {v11, v5, v6, v7, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 259
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v6, -0x14e8f4cd

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v9, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const v7, 0x1fffffff

    invoke-virtual {v5, v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v6, 0x41e00000    # 28.0f

    invoke-direct {v9, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    int-to-float v6, v6

    const/16 v7, 0x8

    new-array v7, v7, [F

    const/4 v12, 0x0

    aput v6, v7, v12

    aput v6, v7, v2

    const/4 v13, 0x2

    aput v6, v7, v13

    aput v6, v7, v3

    const/4 v3, 0x4

    const/4 v6, 0x0

    aput v6, v7, v3

    const/4 v3, 0x5

    aput v6, v7, v3

    const/4 v3, 0x6

    aput v6, v7, v3

    const/4 v3, 0x7

    aput v6, v7, v3

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v11, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 260
    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$15;

    invoke-direct {v3, v9, v10}, Lcom/melodix/music/PreviewPlayerTiles$15;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    .line 264
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "\u2501\u2501\u2501\u2501"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    const v6, -0x66000001

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v6, "Glisser vers le bas pour fermer"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42000000    # 32.0f

    invoke-direct {v9, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/4 v13, -0x1

    invoke-direct {v6, v13, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 265
    if-nez v0, :cond_1

    const-string v5, "File d\u2019attente"

    goto :goto_0

    :cond_1
    iget-object v5, v9, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v5, v5, v0

    :goto_0
    invoke-direct {v9, v8, v5, v13, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42400000    # 48.0f

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v3, v13, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 266
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v15, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 267
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v15}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    if-ne v0, v2, :cond_2

    const/high16 v5, 0x43e60000    # 460.0f

    goto :goto_1

    :cond_2
    const/high16 v5, 0x43aa0000    # 340.0f

    :goto_1
    invoke-direct {v9, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v4, v13, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 268
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v3, "R\u00e9essayer"

    invoke-virtual {v7, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-virtual {v7, v3}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 269
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v3, "Fermer"

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

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

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 270
    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$16;

    invoke-direct {v3, v9, v10}, Lcom/melodix/music/PreviewPlayerTiles$16;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    iget-object v3, v9, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v10, v3}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v11}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v10, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 272
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$17;

    invoke-direct {v2, v9, v0}, Lcom/melodix/music/PreviewPlayerTiles$17;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v10, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 277
    iput-object v10, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->openedAt:J

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueStep:Ljava/lang/String;

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelStep:Ljava/lang/String;

    .line 278
    new-instance v5, Lcom/melodix/music/PreviewPlayerTiles$18;

    move-object v1, v5

    move-object/from16 v2, p0

    move/from16 v3, p1

    move-object v4, v8

    move-object v12, v5

    move-object v5, v10

    move-object/from16 v16, v6

    move-object v6, v15

    move-object/from16 v17, v7

    invoke-direct/range {v1 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$18;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    move-object/from16 v6, v17

    invoke-virtual {v6, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v1, v13, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 280
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v1, v13, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v2, v16

    invoke-virtual {v11, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 281
    invoke-virtual {v10}, Landroid/app/Dialog;->show()V

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_3

    invoke-virtual {v10}, Landroid/app/Dialog;->dismiss()V

    return-void

    .line 282
    :cond_3
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    const/4 v2, -0x2

    invoke-virtual {v1, v13, v2}, Landroid/view/Window;->setLayout(II)V

    .line 283
    if-nez v0, :cond_4

    invoke-direct {v9, v8, v10, v15, v6}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_2

    :cond_4
    const-string v7, "run"

    const-string v11, ""

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object v3, v8

    move-object v4, v10

    move-object v5, v15

    move-object v8, v11

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    :goto_2
    goto :goto_3

    :catch_0
    move-exception v0

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_5

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    :cond_5
    const-string v0, "Indisponible dans cette version"

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    .line 285
    :goto_3
    return-void

    .line 254
    :cond_6
    :goto_4
    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 118
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 119
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 120
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 118
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 121
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

    .line 147
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

    .line 148
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

    .line 149
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

    .line 150
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

    .line 151
    return-void

    .line 147
    :cond_6
    :goto_5
    return-void
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    aget-char v3, p0, v2

    const/16 v4, 0x61

    if-lt v3, v4, :cond_0

    const/16 v4, 0x7a

    if-le v3, v4, :cond_2

    :cond_0
    const/16 v4, 0x30

    if-lt v3, v4, :cond_1

    const/16 v4, 0x39

    if-le v3, v4, :cond_2

    :cond_1
    const/16 v4, 0x3a

    if-eq v3, v4, :cond_2

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_2

    const/16 v4, 0x2c

    if-eq v3, v4, :cond_2

    const/16 v4, 0x3e

    if-ne v3, v4, :cond_3

    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v4, 0x78

    if-le v3, v4, :cond_4

    goto :goto_1

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_6

    const-string p0, "aucune"

    goto :goto_2

    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_2
    return-object p0
.end method

.method private confirmTransfer(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 16

    .line 224
    move-object/from16 v9, p0

    move-object/from16 v4, p2

    move-object/from16 v8, p6

    new-instance v10, Landroid/app/Dialog;

    invoke-direct {v10, v4}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v0, 0x41a00000    # 20.0f

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {v9, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v9, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v11, v1, v3, v5, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 225
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xde8f4cd

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-direct {v9, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Transf\u00e9rer la lecture vers \u00ab "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00bb ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x41880000    # 17.0f

    const/4 v12, -0x1

    invoke-direct {v9, v4, v0, v12, v1}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v12, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 227
    new-instance v13, Landroid/widget/Button;

    invoke-direct {v13, v4}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "Annuler"

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v14, 0x42400000    # 48.0f

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$10;

    invoke-direct {v0, v9, v10}, Lcom/melodix/music/PreviewPlayerTiles$10;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    new-instance v15, Landroid/widget/Button;

    invoke-direct {v15, v4}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "Confirmer"

    invoke-virtual {v15, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Confirmer le transfert vers "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    invoke-virtual {v15, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v7, Lcom/melodix/music/PreviewPlayerTiles$11;

    move-object v0, v7

    move-object/from16 v1, p0

    move-object v2, v10

    move/from16 v3, p1

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object v12, v7

    move-object/from16 v7, p5

    invoke-direct/range {v0 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$11;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v15, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v13, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v14}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 230
    invoke-virtual {v10, v11}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v10}, Landroid/app/Dialog;->show()V

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 231
    :cond_0
    return-void
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 2

    .line 67
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

    .line 43
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

    const/4 v2, 0x1

    aget-object v1, v1, v2

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

    const-string v1, "\nParoles/Appareils (tiroir) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->panelJournal:Ljava/lang/String;

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

    .line 314
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

    .line 53
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 54
    :cond_0
    const-string v0, "(liked|playlist|-),(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable|-)(,(-|\\d{1,7})){8}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "illisible"

    return-object p0

    .line 55
    :cond_1
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 56
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

    .line 57
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

    .line 56
    return-object p0

    .line 53
    :cond_6
    :goto_3
    const-string p0, "aucune ouverture observ\u00e9e"

    return-object p0
.end method

.method private line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;
    .locals 1

    .line 134
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextSize(F)V

    return-object v0
.end method

.method private loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 19

    .line 233
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

    invoke-direct {v12, v14, v15}, Lcom/melodix/music/PreviewPlayerTiles;->skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v1, 0x1

    if-ne v13, v1, :cond_0

    const-string v1, "lyrics"

    goto :goto_0

    :cond_0
    const-string v1, "devices"

    :goto_0
    move-object/from16 v16, v1

    .line 234
    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$12;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide v3, v9

    move-object/from16 v5, p3

    move/from16 v6, p1

    move-object/from16 v7, p2

    move-wide/from16 v17, v9

    move-object v10, v8

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    invoke-direct/range {v1 .. v9}, Lcom/melodix/music/PreviewPlayerTiles$12;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-string v1, "transfer"

    move-object/from16 v9, p6

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-wide/16 v1, 0x2328

    goto :goto_1

    :cond_1
    const-wide/16 v1, 0x1770

    :goto_1
    invoke-virtual {v12, v10, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 235
    invoke-direct {v12, v14}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v10

    if-nez v10, :cond_2

    const-string v0, "page:inaccessible"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournal:Ljava/lang/String;

    invoke-direct {v12, v13, v14, v15, v11}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 236
    :cond_2
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "((function(kind, action, wanted) {\n    \'use strict\';\n    // Lyrics and devices drawers. One explicit tap = open the page panel in the\n    // hidden page, read it, close it if it was closed. A device transfer is a\n    // separate, explicitly confirmed action, verified by re-reading the list.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window, jobs = W.__melodixPanelJobs = W.__melodixPanelJobs || {};\n    if (kind !== \'lyrics\' && kind !== \'devices\') return JSON.stringify({status: \'done\', ok: false, reason: \'kind\'});\n    if (action === \'poll\') return JSON.stringify(jobs[kind] || {status: \'none\'});\n    if (action !== \'run\' && action !== \'transfer\') return JSON.stringify({status: \'none\'});\n    if (jobs[kind] && jobs[kind].status === \'running\' && Date.now() - jobs[kind].started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = jobs[kind] = {status: \'running\', started: Date.now(), ok: false, reason: \'\', body: \'\', active: -1, synced: false, transferred: false, journal: []};\n    function log(c) { if (job.journal.length < 12) job.journal.push(c); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 300); }\n    var specs = {\n        lyrics: {\n            ids: /^(lyrics-button|control-button-lyrics)$/i,\n            label: /^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i,\n            roots: \'[data-testid=\"lyrics-container\"], [data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"]\'\n        },\n        devices: {\n            ids: /^(control-button-connect|connect-device-picker|device-picker|connect-button)$/i,\n            label: /^(connect to a device|connect to a device\\.\\.\\.|se connecter \u00e0 un appareil|connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i,\n            roots: \'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"], [data-testid=\"connect-device-picker\"], [role=\"dialog\"][aria-label*=\"appareil\" i], [role=\"dialog\"][aria-label*=\"device\" i]\'\n        }\n    };\n    var spec = specs[kind], found = 0;\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\') || \'\')) || spec.label.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var hits = Array.from(document.querySelectorAll(spec.roots)).filter(function(n) { return n.isConnected; });\n        if (hits.length >= 1) return hits[0];\n        var id = b && b.getAttribute(\'aria-controls\'), c = id ? document.getElementById(id) : null;\n        return c && c.isConnected ? c : null;\n    }\n    function lyricLines(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"fullscreen-lyric\"], [data-testid=\"lyrics-line\"]\'));\n        if (!nodes.length) nodes = Array.from(r.querySelectorAll(\'p\'));\n        var lines = [], active = -1, synced = false;\n        nodes.slice(0, 200).forEach(function(n) {\n            var t = text(n); if (!t) return;\n            if (n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'data-active\') === \'true\') { active = lines.length; synced = true; }\n            if (n.hasAttribute(\'data-start-time\') || n.hasAttribute(\'data-time\')) synced = true;\n            lines.push(t);\n        });\n        return {lines: lines, active: synced ? active : -1, synced: synced};\n    }\n    function deviceRows(r) {\n        var nodes = Array.from(r.querySelectorAll(\'[data-testid=\"device-list-item\"], [data-testid=\"device-picker-row\"], [role=\"option\"], li button\'));\n        var seen = [];\n        return nodes.filter(function(n) { if (seen.indexOf(n) >= 0) return false; seen.push(n); return true; }).slice(0, 30).map(function(n) {\n            var nameNode = n.querySelector(\'[data-testid=\"device-name\"], [data-encore-id=\"text\"]\');\n            var name = text(nameNode || n).slice(0, 80);\n            var typeNode = n.querySelector(\'[data-testid=\"device-type\"]\');\n            var current = n.getAttribute(\'aria-selected\') === \'true\' || n.getAttribute(\'aria-current\') === \'true\' || n.getAttribute(\'aria-checked\') === \'true\';\n            return {node: n, name: name, type: typeNode ? text(typeNode).slice(0, 40) : \'\', current: current};\n        }).filter(function(d) { return d.name; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button(), already = root(b);\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var close = function() {\n            if (wasOpen) return;\n            setTimeout(function() {\n                try { var again = button() || b; if (again && (isOpen(again) || root(again))) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n            }, 120);\n        };\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null;\n            try { r = root(button() || b); } catch (_) { r = null; }\n            var ready = r && (kind === \'lyrics\' ? lyricLines(r).lines.length : deviceRows(r).length);\n            if (!ready && Date.now() < end) { setTimeout(step, 150); return; }\n            if (!ready) { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); close(); return; }\n            if (kind === \'lyrics\') {\n                var l = lyricLines(r);\n                job.body = l.lines.join(\'\\n\'); job.active = l.active; job.synced = l.synced;\n                log(\'lines:\' + Math.min(l.lines.length, 200) + (l.synced ? \':sync\' : \'\'));\n                finish(true, \'\'); close(); return;\n            }\n            var rows = deviceRows(r);\n            if (action === \'transfer\') {\n                var target = rows.filter(function(d) { return d.name === wanted; });\n                if (target.length !== 1) { log(\'target:\' + (target.length ? \'ambiguous\' : \'absent\')); finish(false, \'target\'); close(); return; }\n                if (target[0].current) { log(\'target:already-active\'); job.transferred = true; finish(true, \'\'); close(); return; }\n                try { target[0].node.click(); log(\'transfer:click\'); } catch (_) { log(\'transfer:error\'); finish(false, \'command\'); close(); return; }\n                var until = Date.now() + 3000;\n                (function verify() {\n                    var again = null;\n                    try { var r2 = root(button() || b); again = r2 ? deviceRows(r2).filter(function(d) { return d.name === wanted; })[0] : null; } catch (_) { again = null; }\n                    if (again && again.current) { log(\'transfer:verified\'); job.transferred = true; finish(true, \'\'); close(); return; }\n                    if (Date.now() < until) { setTimeout(verify, 200); return; }\n                    log(\'transfer:unverified\'); finish(false, \'unverified\'); close();\n                })();\n                return;\n            }\n            job.body = rows.map(function(d) { return [d.name, d.type, d.current ? \'1\' : \'\'].join(\'\\t\'); }).join(\'\\n\');\n            log(\'devices:\' + rows.length);\n            finish(true, \'\'); close();\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {v16 .. v16}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p6 .. p6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static/range {p7 .. p7}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$13;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide/from16 v3, v17

    move-object/from16 v5, p3

    move/from16 v6, p1

    move-object/from16 v7, p2

    move-object v12, v8

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-object v13, v10

    move-object/from16 v10, p6

    move-object/from16 v11, v16

    invoke-direct/range {v1 .. v11}, Lcom/melodix/music/PreviewPlayerTiles$13;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v13, v0, v12}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    move-object/from16 v1, p0

    goto :goto_2

    :catch_0
    move-exception v0

    const-string v0, "demarrage:erreur"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->panelJournal:Ljava/lang/String;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p5

    invoke-direct {v1, v2, v14, v15, v3}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 240
    :goto_2
    return-void
.end method

.method private loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 16

    .line 165
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    iget-wide v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    const-wide/16 v2, 0x1

    add-long v13, v0, v2

    iput-wide v13, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    invoke-direct {v9, v10, v11}, Lcom/melodix/music/PreviewPlayerTiles;->skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 166
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$6;

    move-object v1, v0

    move-object/from16 v2, p0

    move-wide v3, v13

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-wide/16 v1, 0x1770

    invoke-virtual {v9, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 167
    invoke-direct/range {p0 .. p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "page:inaccessible"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 168
    :cond_0
    :try_start_0
    const-string v15, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixQueueJob && W.__melodixQueueJob.status === \'running\' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    // Several copies of a control can exist (player bar and full view). Prefer\n    // the one in the player bar, then the only visible one; otherwise refuse.\n    function pickOne(list) {\n        if (list.length <= 1) return list[0] || null;\n        var bar = list.filter(function(b) { return !!b.closest(\'[data-testid=\"now-playing-bar\"]\'); });\n        if (bar.length === 1) return bar[0];\n        var shown = (bar.length ? bar : list).filter(function(b) { return b.getClientRects().length > 0; });\n        return shown.length === 1 ? shown[0] : null;\n    }\n    var found = 0;\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        found = list.length;\n        return pickOne(list);\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        return controlled && controlled.isConnected ? controlled : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration};\n        }).filter(function(x) { return x.title; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button();\n        var already = root(b);\n        if (!b && !already) { log(found > 1 ? \'button:ambiguous:\' + Math.min(found, 9) : \'button:absent\'); finish(false, found > 1 ? \'ambiguous\' : \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null, list = [];\n            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                job.now = line(list[0]); job.next = list.slice(1).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); }\n            if (!wasOpen) {\n                setTimeout(function() {\n                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n                }, 100);\n            }\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)(\"run\");"

    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$7;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide v3, v13

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object v13, v8

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$7;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v0, v15, v13}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "demarrage:erreur"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 172
    :goto_0
    return-void
.end method

.method private message(Ljava/lang/String;)V
    .locals 2

    .line 132
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
    .locals 7

    .line 124
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_1

    .line 125
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v2, v2, v1

    if-nez v2, :cond_0

    goto :goto_1

    .line 126
    :cond_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    const v3, 0x3f4ccccd    # 0.8f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAlpha(F)V

    .line 127
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 128
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x400ccccd    # 2.2f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v6, 0xa

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/16 v6, 0x21

    invoke-virtual {v4, v5, v0, v3, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 129
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " : consulter si disponible"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 124
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 131
    :cond_1
    return-void
.end method

.method private panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 9

    .line 193
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    .line 194
    const-string v1, "absent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne p1, v2, :cond_0

    const-string p1, "Paroles non disponibles sur cette page Spotify"

    goto :goto_0

    :cond_0
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

    .line 195
    :cond_1
    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v7, "Lecture refus\u00e9e"

    const-string v8, "Plusieurs boutons possibles dans la page ; aucun n\u2019a \u00e9t\u00e9 touch\u00e9."

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v3 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 196
    :cond_2
    if-ne p1, v2, :cond_3

    const-string v0, "Paroles indisponibles pour ce titre"

    goto :goto_1

    :cond_3
    const-string v0, "Aucun autre appareil d\u00e9tect\u00e9"

    :goto_1
    move-object v7, v0

    if-ne p1, v2, :cond_4

    const-string p1, "Touchez R\u00e9essayer pour relire les paroles."

    goto :goto_2

    :cond_4
    const-string p1, "Touchez R\u00e9essayer pour relire la liste."

    :goto_2
    move-object v8, p1

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v3 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method private panelMessage(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 188
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

    .line 189
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

    .line 190
    return-void
.end method

.method private parseObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 163
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

.method private pollPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 242
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

    const/16 v0, 0x22

    if-le v10, v0, :cond_0

    return-void

    .line 243
    :cond_0
    new-instance v13, Lcom/melodix/music/PreviewPlayerTiles$14;

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

    invoke-direct/range {v0 .. v11}, Lcom/melodix/music/PreviewPlayerTiles$14;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;ILandroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;ILjava/lang/String;)V

    const-wide/16 v0, 0xfa

    invoke-virtual {p0, v13, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 251
    return-void
.end method

.method private pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 11

    .line 174
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

    .line 175
    const/16 v0, 0x14

    if-le v8, v0, :cond_1

    iget-wide v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    cmp-long v0, p5, v0

    if-nez v0, :cond_0

    iget-object v0, v9, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

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

    .line 176
    :cond_1
    move-object v5, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    new-instance v10, Lcom/melodix/music/PreviewPlayerTiles$8;

    move-object v0, v10

    move-object v1, p0

    move-wide/from16 v2, p5

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$8;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    const-wide/16 v0, 0xfa

    invoke-virtual {p0, v10, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 184
    return-void
.end method

.method private probe(ILandroid/app/Activity;)V
    .locals 7

    .line 69
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

    .line 71
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "G"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 72
    instance-of v2, p2, Landroid/webkit/WebView;

    if-nez v2, :cond_2

    sget-object p2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aput-object v0, p2, p1

    return-void

    .line 73
    :cond_2
    check-cast p2, Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "((function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n)("

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

    .line 86
    goto :goto_1

    :catch_0
    move-exception p2

    sget-object p2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aput-object v0, p2, p1

    .line 87
    :goto_1
    return-void
.end method

.method private queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 7

    .line 142
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    .line 143
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

    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "Le bouton File d\u2019attente est absent de la page."

    goto :goto_1

    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Plusieurs boutons possibles dans la page ; aucun n\u2019a \u00e9t\u00e9 touch\u00e9."

    goto :goto_1

    :cond_3
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

    .line 145
    return-void
.end method

.method private readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 11

    .line 90
    const-string v0, "Indisponible dans cette version"

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    if-nez p1, :cond_0

    const-string p1, "queue"

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    if-ne p1, v3, :cond_1

    const-string p1, "lyrics"

    goto :goto_0

    :cond_1
    const-string p1, "devices"

    .line 91
    :goto_0
    const-string v3, "Chargement\u2026"

    invoke-virtual {p4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "G"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 94
    instance-of v3, p2, Landroid/webkit/WebView;

    if-nez v3, :cond_2

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 95
    :cond_2
    check-cast p2, Landroid/webkit/WebView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "((function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n)("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, ");"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$4;

    move-object v5, v3

    move-object v6, p0

    move-wide v7, v1

    move-object v9, p3

    move-object v10, p4

    invoke-direct/range {v5 .. v10}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    invoke-virtual {p2, p1, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 108
    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$5;

    move-object v5, p1

    move-object v6, p0

    move-wide v7, v1

    move-object v9, p3

    move-object v10, p4

    invoke-direct/range {v5 .. v10}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    const-wide/16 p2, 0xdac

    invoke-virtual {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    :goto_1
    return-void
.end method

.method private readTrace(Landroid/app/Activity;)V
    .locals 2

    .line 60
    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_1

    return-void

    .line 61
    :cond_1
    :try_start_0
    const-string v0, "(function(){var t=window.__melodixOpenTrace;if(!t||typeof t!==\'object\')return \'\';var n=function(x){return typeof x===\'number\'&&isFinite(x)&&x>=0?String(Math.min(Math.round(x),9999999)):\'-\';};var k=t.kind===\'liked\'||t.kind===\'playlist\'?t.kind:\'-\';var ph=/^(none|open|ready|dom|dom-empty|classified|classified-empty|rendered|unavailable)$/.test(String(t.phase))?t.phase:\'-\';return [k,ph,n(t.nav),n(t.ready),n(t.dom),n(t.classified),n(t.rendered),n(t.first),n(t.full),n(t.updates)].join(\',\');})()"

    new-instance v1, Lcom/melodix/music/PreviewPlayerTiles$2;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 65
    :catch_0
    move-exception p1

    :goto_1
    nop

    .line 66
    return-void
.end method

.method private renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 22

    .line 199
    move-object/from16 v9, p0

    move/from16 v0, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    move-object/from16 v1, p6

    const-string v2, "journal"

    const-string v13, ""

    invoke-virtual {v1, v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/melodix/music/PreviewPlayerTiles;->panelJournal:Ljava/lang/String;

    .line 200
    const-string v2, "transfer"

    move-object/from16 v3, p7

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "ok"

    const/4 v14, 0x0

    if-eqz v2, :cond_1

    .line 201
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v3, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "transferred"

    invoke-virtual {v1, v3, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Lecture transf\u00e9r\u00e9e (v\u00e9rifi\u00e9)"

    goto :goto_0

    :cond_0
    const-string v1, "Transfert non v\u00e9rifi\u00e9, R\u00e9essayer"

    :goto_0
    invoke-static {v2, v1, v14}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 202
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

    .line 204
    :cond_1
    invoke-virtual {v1, v3, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "reason"

    invoke-virtual {v1, v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelReason:Ljava/lang/String;

    invoke-direct {v9, v0, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->panelFailed(ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 205
    :cond_2
    iget-wide v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelSerial:J

    iput-wide v2, v9, Lcom/melodix/music/PreviewPlayerTiles;->panelSettled:J

    invoke-virtual/range {p4 .. p4}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Landroid/widget/Button;->setEnabled(Z)V

    .line 206
    const-string v2, "body"

    invoke-virtual {v1, v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 207
    const/4 v8, -0x2

    const v16, -0x1fb762

    const-string v7, "\n"

    const/4 v6, -0x1

    if-ne v0, v15, :cond_6

    .line 208
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

    move v0, v6

    .line 209
    :goto_1
    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 210
    move v2, v14

    :goto_2
    array-length v3, v1

    if-ge v2, v3, :cond_5

    const/16 v3, 0xc8

    if-ge v2, v3, :cond_5

    aget-object v3, v1, v2

    if-ne v2, v0, :cond_3

    move/from16 v4, v16

    goto :goto_3

    :cond_3
    move v4, v6

    :goto_3
    if-ne v2, v0, :cond_4

    const/high16 v5, 0x41980000    # 19.0f

    goto :goto_4

    :cond_4
    const/high16 v5, 0x41880000    # 17.0f

    :goto_4
    invoke-direct {v9, v10, v3, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v3

    const/high16 v4, 0x40800000    # 4.0f

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v9, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-virtual {v3, v14, v5, v14, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 211
    :cond_5
    return-void

    .line 213
    :cond_6
    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 214
    array-length v4, v5

    move v3, v14

    :goto_5
    if-ge v3, v4, :cond_10

    aget-object v1, v5, v3

    .line 215
    const-string v2, "\t"

    invoke-virtual {v1, v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    if-eqz v2, :cond_f

    aget-object v2, v1, v14

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    move/from16 v18, v3

    move/from16 v19, v4

    move-object/from16 v20, v5

    move v2, v6

    move-object/from16 v21, v7

    move v9, v8

    goto/16 :goto_d

    .line 216
    :cond_7
    aget-object v2, v1, v14

    array-length v6, v1

    const/4 v8, 0x2

    if-le v6, v8, :cond_8

    aget-object v6, v1, v8

    const-string v8, "1"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    move v6, v15

    goto :goto_6

    :cond_8
    move v6, v14

    :goto_6
    array-length v8, v1

    if-le v8, v15, :cond_9

    aget-object v1, v1, v15

    goto :goto_7

    :cond_9
    move-object v1, v13

    .line 217
    :goto_7
    new-instance v8, Landroid/widget/Button;

    invoke-direct {v8, v10}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_a

    move-object v1, v13

    goto :goto_8

    :cond_a
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_8
    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v6, :cond_b

    const-string v14, "\nActif"

    goto :goto_9

    :cond_b
    move-object v14, v13

    :goto_9
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    if-eqz v6, :cond_c

    move/from16 v1, v16

    goto :goto_a

    :cond_c
    const/4 v1, -0x1

    :goto_a
    invoke-virtual {v8, v1}, Landroid/widget/Button;->setTextColor(I)V

    const/4 v14, 0x0

    invoke-virtual {v8, v14}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v1, 0x42600000    # 56.0f

    invoke-direct {v9, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-virtual {v8, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v6, :cond_d

    const-string v15, ", appareil actif"

    goto :goto_b

    :cond_d
    const-string v15, ", transf\u00e9rer la lecture vers cet appareil"

    :goto_b
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 219
    if-nez v6, :cond_e

    new-instance v15, Lcom/melodix/music/PreviewPlayerTiles$9;

    move-object v1, v15

    move-object/from16 v17, v2

    move-object/from16 v2, p0

    move/from16 v18, v3

    move/from16 v3, p1

    move/from16 v19, v4

    move-object/from16 v4, p2

    move-object/from16 v20, v5

    move-object/from16 v5, p3

    const/4 v14, -0x1

    move-object/from16 v6, p4

    move-object/from16 v21, v7

    move-object/from16 v7, p5

    move-object v14, v8

    const/4 v9, -0x2

    move-object/from16 v8, v17

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$9;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_c

    :cond_e
    move/from16 v18, v3

    move/from16 v19, v4

    move-object/from16 v20, v5

    move-object/from16 v21, v7

    move-object v14, v8

    const/4 v9, -0x2

    .line 220
    :goto_c
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v14, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_d

    .line 215
    :cond_f
    move/from16 v18, v3

    move/from16 v19, v4

    move-object/from16 v20, v5

    move v2, v6

    move-object/from16 v21, v7

    move v9, v8

    .line 214
    :goto_d
    add-int/lit8 v3, v18, 0x1

    move v6, v2

    move v8, v9

    move/from16 v4, v19

    move-object/from16 v5, v20

    move-object/from16 v7, v21

    const/4 v14, 0x0

    const/4 v15, 0x1

    move-object/from16 v9, p0

    goto/16 :goto_5

    .line 222
    :cond_10
    return-void
.end method

.method private renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 8

    .line 153
    const-string v0, "journal"

    const-string v1, ""

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 154
    const-string v0, "ok"

    const/4 v2, 0x0

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "reason"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueReason:Ljava/lang/String;

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 155
    :cond_0
    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v0, "En cours de lecture"

    const v3, -0x587406

    const/high16 v4, 0x41500000    # 13.0f

    invoke-direct {p0, p1, v0, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42000000    # 32.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "now"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 156
    const-string v0, "\u00c0 suivre"

    invoke-direct {p0, p1, v0, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42200000    # 40.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v3, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    const-string v0, "next"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 158
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const p4, -0x384424

    const/high16 v0, 0x41600000    # 14.0f

    const-string v1, "Aucun titre \u00e0 suivre"

    invoke-direct {p0, p1, v1, p4, v0}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p1

    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p4, v7, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 159
    :cond_1
    const-string v0, "\n"

    invoke-virtual {p4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    array-length v0, p4

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v1, p4, v2

    invoke-direct {p0, p1, p2, v1}, Lcom/melodix/music/PreviewPlayerTiles;->addRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 160
    :cond_2
    :goto_1
    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 161
    return-void
.end method

.method private skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 5

    .line 136
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 137
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

    .line 138
    :cond_0
    return-void
.end method

.method private syncVolume()V
    .locals 2

    .line 287
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

    .line 288
    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->readTrace(Landroid/app/Activity;)V

    .line 289
    :cond_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    .line 290
    return-void
.end method

.method private web(Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 3

    .line 133
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

    .line 291
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

    .line 292
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->traceTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 293
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$19;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerTiles$19;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 294
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$20;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerTiles$20;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
