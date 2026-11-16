.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# static fields
.field private static final PANEL_PROBE:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n"

.field private static final PANEL_READ:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n"

.field private static final QUEUE_JOB:Ljava/lang/String; = "(function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixQueueJob && W.__melodixQueueJob.status === \'running\' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        return controlled && controlled.isConnected ? controlled : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration};\n        }).filter(function(x) { return x.title; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button();\n        var already = root(b);\n        if (!b && !already) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null, list = [];\n            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                job.now = line(list[0]); job.next = list.slice(1).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); }\n            if (!wasOpen) {\n                setTimeout(function() {\n                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n                }, 100);\n            }\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n"

.field private static final observations:[Ljava/lang/String;

.field private static final probeSerial:[J

.field private static queueJournal:Ljava/lang/String;


# instance fields
.field private final controls:[Landroid/widget/Button;

.field private final icons:[Ljava/lang/String;

.field private lastAction:J

.field private final names:[Ljava/lang/String;

.field private queueSerial:J

.field private readSerial:J

.field private settledSerial:J

.field private volumeRunning:Z

.field private webDialog:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-string v0, "aucune"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 40
    const-string v0, "non observ\u00e9e"

    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    .line 41
    const/4 v0, 0x3

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

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
    .locals 10

    .line 202
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 87
    const-string p2, "Paroles"

    const-string v0, "Appareils"

    const-string v1, "File"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 88
    const-string p2, "\u266c"

    const-string v0, "\u25a3"

    const-string v1, "\u2630"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    .line 89
    const/4 p2, 0x3

    new-array v0, p2, [Landroid/widget/Button;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    .line 91
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    .line 136
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    .line 202
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 203
    const-string v1, "\u25a3\nAppareils"

    const-string v2, "\u25d6))\nVolume"

    const-string v3, "\u2630\nFile"

    const-string v4, "\u266c\nParoles"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 204
    move v2, v0

    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_7

    .line 205
    if-ne v2, p2, :cond_0

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {v4, p1}, Lcom/melodix/music/PreviewPlayerVolume;-><init>(Landroid/content/Context;)V

    goto :goto_1

    :cond_0
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 206
    :goto_1
    new-instance v5, Landroid/text/SpannableString;

    aget-object v6, v1, v2

    invoke-direct {v5, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 207
    new-instance v6, Landroid/text/style/RelativeSizeSpan;

    const v7, 0x400ccccd    # 2.2f

    invoke-direct {v6, v7}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    aget-object v7, v1, v2

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    const/16 v8, 0x21

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 208
    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41200000    # 10.0f

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTextSize(F)V

    const v5, -0x4b513b

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTextColor(I)V

    .line 209
    invoke-virtual {v4, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setSingleLine(Z)V

    invoke-virtual {v4, v3}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const/high16 v6, 0x40800000    # 4.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-virtual {v4, v5, v7, v3, v6}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v3, 0x42600000    # 56.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 210
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v6, 0x14ffffff

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const v8, 0x1fffffff

    invoke-virtual {v5, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 211
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setElevation(F)V

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setTranslationZ(F)V

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 212
    new-instance v8, Landroid/graphics/drawable/RippleDrawable;

    const v9, 0x447b3fe4

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-direct {v8, v9, v5, v7}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 213
    if-ne v2, p2, :cond_1

    const-string v5, "Volume du lecteur indisponible"

    goto :goto_2

    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v7, v7, v2

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " : indisponible, page Spotify non accessible"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v4, v5}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 214
    if-ge v2, p2, :cond_2

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_2
    if-ne v2, p2, :cond_3

    move v5, v6

    goto :goto_3

    :cond_3
    const v5, 0x3f4ccccd    # 0.8f

    :goto_3
    invoke-virtual {v4, v5}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setActivated(Z)V

    .line 215
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->fontScale:F

    const v8, 0x3fa66666    # 1.3f

    cmpl-float v7, v7, v8

    if-lez v7, :cond_4

    const/4 v3, -0x2

    goto :goto_4

    :cond_4
    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    :goto_4
    invoke-direct {v5, v0, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v2, :cond_5

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    iput v3, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_5
    invoke-virtual {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 216
    if-ge v2, p2, :cond_6

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aput-object v4, v3, v2

    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$13;

    invoke-direct {v3, p0, v2}, Lcom/melodix/music/PreviewPlayerTiles$13;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v4, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 219
    :cond_7
    return-void
.end method

.method static synthetic access$000()[J
    .locals 1

    .line 34
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    return-object v0
.end method

.method static synthetic access$100()[Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p7}, Lcom/melodix/music/PreviewPlayerTiles;->pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    return-void
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/melodix/music/PreviewPlayerTiles;F)I
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method static synthetic access$1600(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V

    return-void
.end method

.method static synthetic access$200(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 0

    .line 34
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->count(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$308(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$402(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method static synthetic access$508(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 4

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    return-wide v0
.end method

.method static synthetic access$702(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 34
    sput-object p0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->parseObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private activate(I)V
    .locals 17

    .line 159
    move-object/from16 v7, p0

    move/from16 v0, p1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v8

    .line 160
    iget-boolean v3, v7, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v3, :cond_8

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v3

    if-nez v3, :cond_8

    if-eqz v8, :cond_8

    invoke-virtual {v8}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_8

    invoke-virtual {v8}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v3, v7, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-nez v3, :cond_8

    iget-wide v3, v7, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x190

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    goto/16 :goto_5

    .line 161
    :cond_0
    iput-wide v1, v7, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    iget-object v1, v7, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v1, v1, v0

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/Button;->performHapticFeedback(I)Z

    invoke-direct {v7, v0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V

    .line 163
    :try_start_0
    new-instance v9, Landroid/app/Dialog;

    invoke-direct {v9, v8}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 164
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-direct {v7, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    const/high16 v5, 0x41000000    # 8.0f

    invoke-direct {v7, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v7, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/high16 v11, 0x41c00000    # 24.0f

    invoke-direct {v7, v11}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v11

    invoke-virtual {v10, v4, v5, v6, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 165
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v5, -0x14e8f4cd

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v7, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const v6, 0x1fffffff

    invoke-virtual {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v5, 0x41e00000    # 28.0f

    invoke-direct {v7, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    int-to-float v5, v5

    const/16 v6, 0x8

    new-array v6, v6, [F

    const/4 v11, 0x0

    aput v5, v6, v11

    aput v5, v6, v1

    const/4 v12, 0x2

    aput v5, v6, v12

    aput v5, v6, v2

    const/4 v2, 0x4

    const/4 v5, 0x0

    aput v5, v6, v2

    const/4 v2, 0x5

    aput v5, v6, v2

    const/4 v2, 0x6

    aput v5, v6, v2

    const/4 v2, 0x7

    aput v5, v6, v2

    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v10, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 166
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$7;

    invoke-direct {v2, v7, v9}, Lcom/melodix/music/PreviewPlayerTiles$7;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    .line 170
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v5, "\u2501\u2501\u2501\u2501"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    const v5, -0x66000001

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v5, "Glisser vers le bas pour fermer"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42000000    # 32.0f

    invoke-direct {v7, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/4 v12, -0x1

    invoke-direct {v5, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    if-nez v0, :cond_1

    const-string v4, "File d\u2019attente"

    goto :goto_0

    :cond_1
    iget-object v4, v7, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v4, v4, v0

    :goto_0
    invoke-direct {v7, v8, v4, v12, v3}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x42400000    # 48.0f

    invoke-direct {v7, v13}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v2, v12, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v14, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 173
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v14}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v0, :cond_2

    const/high16 v4, 0x43aa0000    # 340.0f

    goto :goto_1

    :cond_2
    const/high16 v4, 0x43200000    # 160.0f

    :goto_1
    invoke-direct {v7, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v3, v12, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    new-instance v15, Landroid/widget/Button;

    invoke-direct {v15, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "R\u00e9essayer"

    invoke-virtual {v15, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {v7, v13}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v15, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 175
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "Fermer"

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fermer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v7, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-direct {v7, v13}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 176
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-direct {v2, v7, v9}, Lcom/melodix/music/PreviewPlayerTiles$8;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    iget-object v2, v7, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v9, v2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v9, v10}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v9, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 178
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$9;

    invoke-direct {v2, v7}, Lcom/melodix/music/PreviewPlayerTiles$9;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v9, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 179
    iput-object v9, v7, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    .line 180
    const/4 v5, -0x2

    if-nez v0, :cond_3

    .line 181
    new-instance v4, Lcom/melodix/music/PreviewPlayerTiles$10;

    move-object v1, v4

    move-object/from16 v2, p0

    move-object v3, v8

    move-object v11, v4

    move-object v4, v9

    move-object v5, v14

    move-object/from16 v16, v6

    move-object v6, v15

    invoke-direct/range {v1 .. v6}, Lcom/melodix/music/PreviewPlayerTiles$10;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v15, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v13}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v1, v12, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v15, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v3, -0x2

    goto :goto_3

    .line 184
    :cond_3
    move-object/from16 v16, v6

    const-string v2, "Bient\u00f4t disponible"

    const/high16 v3, 0x41900000    # 18.0f

    invoke-direct {v7, v8, v2, v12, v3}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42200000    # 40.0f

    invoke-direct {v7, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v3, v12, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    if-ne v0, v1, :cond_4

    const-string v1, "Les paroles s\u2019afficheront ici dans une prochaine version."

    goto :goto_2

    :cond_4
    const-string v1, "La liste des appareils s\u2019affichera ici dans une prochaine version."

    :goto_2
    const v2, -0x384424

    const/high16 v3, 0x41600000    # 14.0f

    invoke-direct {v7, v8, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v12, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    :goto_3
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v13}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v1, v12, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v2, v16

    invoke-virtual {v10, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    invoke-virtual {v9}, Landroid/app/Dialog;->show()V

    invoke-virtual {v9}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_5

    invoke-virtual {v9}, Landroid/app/Dialog;->dismiss()V

    return-void

    .line 189
    :cond_5
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {v1, v12, v3}, Landroid/view/Window;->setLayout(II)V

    .line 190
    if-nez v0, :cond_6

    invoke-direct {v7, v8, v9, v14, v15}, Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :cond_6
    goto :goto_4

    :catch_0
    move-exception v0

    iget-object v0, v7, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_7

    iget-object v0, v7, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, v7, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    :cond_7
    const-string v0, "Indisponible dans cette version"

    invoke-direct {v7, v0}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    .line 192
    :goto_4
    return-void

    .line 160
    :cond_8
    :goto_5
    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 94
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    .line 95
    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 96
    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    .line 94
    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 97
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

    .line 121
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

    .line 122
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

    .line 123
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

    .line 124
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

    .line 125
    return-void

    .line 121
    :cond_6
    :goto_5
    return-void
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 39
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

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 2

    .line 43
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
    .locals 3

    .line 42
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

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private dp(F)I
    .locals 1

    .line 220
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

.method private line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;
    .locals 1

    .line 110
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextSize(F)V

    return-object v0
.end method

.method private loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 16

    .line 139
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

    .line 140
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$4;

    move-object v1, v0

    move-object/from16 v2, p0

    move-wide v3, v13

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const-wide/16 v1, 0x1770

    invoke-virtual {v9, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 141
    invoke-direct/range {p0 .. p1}, Lcom/melodix/music/PreviewPlayerTiles;->web(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "page:inaccessible"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 142
    :cond_0
    :try_start_0
    const-string v15, "((function(action) {\n    \'use strict\';\n    // Queue drawer source. One explicit tap = open the page\'s queue panel in the\n    // hidden page, read visible rows, then close it if it was closed before.\n    // No scrolling, navigation, storage, cookies, tokens or network.\n    var W = window;\n    if (action === \'poll\') return JSON.stringify(W.__melodixQueueJob || {status: \'none\'});\n    if (action !== \'run\') return JSON.stringify({status: \'none\'});\n    if (W.__melodixQueueJob && W.__melodixQueueJob.status === \'running\' && Date.now() - W.__melodixQueueJob.started < 8000) return JSON.stringify({status: \'busy\'});\n    var job = W.__melodixQueueJob = {status: \'running\', started: Date.now(), ok: false, reason: \'\', now: \'\', next: \'\', journal: []};\n    function log(code) { if (job.journal.length < 12) job.journal.push(code); }\n    function text(n) { return String(n && n.textContent || \'\').replace(/\\s+/g, \' \').trim().slice(0, 200); }\n    function button() {\n        var list = Array.from(document.querySelectorAll(\'button, [role=\"button\"]\')).filter(function(b) {\n            return b.isConnected && (/^(control-button-queue|queue-button)$/i.test(String(b.getAttribute(\'data-testid\') || \'\')) ||\n                /^(queue|play queue|file d[\'\u2019]attente|file de lecture|warteschlange|cola de reproducci\u00f3n|cola|fila de reprodu\u00e7\u00e3o|fila)$/i.test(String(b.getAttribute(\'aria-label\') || \'\').trim()));\n        });\n        return list.length === 1 ? list[0] : null;\n    }\n    function isOpen(b) { return b.getAttribute(\'aria-pressed\') === \'true\' || b.getAttribute(\'aria-expanded\') === \'true\' || b.getAttribute(\'data-active\') === \'true\'; }\n    function root(b) {\n        var selectors = \'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"], [data-testid=\"queue-panel\"], [data-testid=\"NPV-queue\"], aside[aria-label=\"Queue\"], aside[aria-label=\"File d\u2019attente\"], aside[aria-label=\"File d\\\'attente\"], section[aria-label=\"Queue\"], section[aria-label=\"File d\u2019attente\"], [role=\"region\"][aria-label=\"Queue\"], [role=\"region\"][aria-label=\"File d\u2019attente\"]\';\n        var found = Array.from(document.querySelectorAll(selectors)).filter(function(n) { return n.isConnected; });\n        if (found.length === 1) return found[0];\n        var id = b && b.getAttribute(\'aria-controls\');\n        var controlled = id ? document.getElementById(id) : null;\n        return controlled && controlled.isConnected ? controlled : null;\n    }\n    function rows(r) {\n        var list = Array.from(r.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\')).filter(function(n) {\n            return !n.querySelector(\'[data-testid=\"queue-tracklist-row\"], [data-testid=\"tracklist-row\"], [role=\"row\"]\');\n        });\n        return list.slice(0, 40).map(function(n) {\n            var t = n.querySelector(\'[data-testid=\"internal-track-link\"], a[href*=\"/track/\"], a[href*=\"/episode/\"], [data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\');\n            var artists = Array.from(n.querySelectorAll(\'a[href*=\"/artist/\"], a[href*=\"/show/\"]\')).map(text).filter(Boolean);\n            if (!artists.length) { var a = n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'); if (a) artists.push(text(a)); }\n            var duration = \'\';\n            Array.from(n.querySelectorAll(\'div, span\')).some(function(x) {\n                if (x.children.length) return false;\n                var v = text(x);\n                if (/^\\d{1,2}:\\d{2}(:\\d{2})?$/.test(v)) { duration = v; return true; }\n                return false;\n            });\n            return {title: text(t), artist: artists.join(\', \').slice(0, 200), duration: duration};\n        }).filter(function(x) { return x.title; });\n    }\n    function finish(ok, reason) { job.status = \'done\'; job.ok = ok; job.reason = reason || \'\'; }\n    try {\n        var b = button();\n        var already = root(b);\n        if (!b && !already) { log(\'button:absent\'); finish(false, \'absent\'); return JSON.stringify({status: \'started\'}); }\n        var wasOpen = !!already || (b && isOpen(b));\n        if (!wasOpen) { try { b.click(); log(\'opened\'); } catch (_) { log(\'open-error\'); finish(false, \'command\'); return JSON.stringify({status: \'started\'}); } }\n        else log(\'already-open\');\n        var end = Date.now() + 2500;\n        (function step() {\n            var r = null, list = [];\n            try { r = root(button() || b); list = r ? rows(r) : []; } catch (_) { list = []; }\n            if (!list.length && Date.now() < end) { setTimeout(step, 150); return; }\n            if (list.length) {\n                var line = function(x) { return [x.title, x.artist, x.duration].join(\'\\t\').replace(/\\n/g, \' \'); };\n                job.now = line(list[0]); job.next = list.slice(1).map(line).join(\'\\n\');\n                log(\'rows:\' + Math.min(list.length, 40));\n                finish(true, \'\');\n            } else { log(r ? \'rows:0\' : \'panel:absent\'); finish(false, r ? \'empty\' : \'panel\'); }\n            if (!wasOpen) {\n                setTimeout(function() {\n                    try { var again = button() || b; if (again && isOpen(again)) { again.click(); log(\'closed\'); } } catch (_) { log(\'close-error\'); }\n                }, 100);\n            }\n        })();\n        return JSON.stringify({status: \'started\'});\n    } catch (_) {\n        finish(false, \'error\');\n        return JSON.stringify({status: \'started\'});\n    }\n})\n)(\"run\");"

    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$5;

    move-object v1, v8

    move-object/from16 v2, p0

    move-wide v3, v13

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object v13, v8

    move-object/from16 v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    invoke-virtual {v0, v15, v13}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "demarrage:erreur"

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 146
    :goto_0
    return-void
.end method

.method private message(Ljava/lang/String;)V
    .locals 2

    .line 108
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

    .line 100
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_1

    .line 101
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v2, v2, v1

    if-nez v2, :cond_0

    goto :goto_1

    .line 102
    :cond_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    const v3, 0x3f4ccccd    # 0.8f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAlpha(F)V

    .line 103
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

    .line 104
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

    .line 105
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

    .line 100
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 107
    :cond_1
    return-void
.end method

.method private parseObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 137
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

.method private pollQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V
    .locals 11

    .line 148
    move-object v9, p0

    const/16 v0, 0x14

    move/from16 v8, p7

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

    .line 149
    :cond_1
    move-object v5, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    new-instance v10, Lcom/melodix/music/PreviewPlayerTiles$6;

    move-object v0, v10

    move-object v1, p0

    move-wide/from16 v2, p5

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    const-wide/16 v0, 0xfa

    invoke-virtual {p0, v10, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 157
    return-void
.end method

.method private probe(ILandroid/app/Activity;)V
    .locals 7

    .line 45
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

    .line 47
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "G"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 48
    instance-of v2, p2, Landroid/webkit/WebView;

    if-nez v2, :cond_2

    sget-object p2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aput-object v0, p2, p1

    return-void

    .line 49
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

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v2, p0, v3, v4, p1}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V

    invoke-virtual {p2, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    goto :goto_1

    :catch_0
    move-exception p2

    sget-object p2, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    aput-object v0, p2, p1

    .line 63
    :goto_1
    return-void
.end method

.method private queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 4

    .line 116
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queueSerial:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->settledSerial:J

    .line 117
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/high16 v0, 0x41900000    # 18.0f

    const-string v1, "File indisponible"

    const/4 v2, -0x1

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    const v0, -0x384424

    const/high16 v1, 0x41600000    # 14.0f

    const-string v3, "Touchez R\u00e9essayer pour relire la file."

    invoke-direct {p0, p1, v3, v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object p1

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 119
    return-void
.end method

.method private readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 11

    .line 66
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

    .line 67
    :goto_0
    const-string v3, "Chargement\u2026"

    invoke-virtual {p4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "G"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 70
    instance-of v3, p2, Landroid/webkit/WebView;

    if-nez v3, :cond_2

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 71
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

    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$2;

    move-object v5, v3

    move-object v6, p0

    move-wide v7, v1

    move-object v9, p3

    move-object v10, p4

    invoke-direct/range {v5 .. v10}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    invoke-virtual {p2, p1, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 84
    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$3;

    move-object v5, p1

    move-object v6, p0

    move-wide v7, v1

    move-object v9, p3

    move-object v10, p4

    invoke-direct/range {v5 .. v10}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    const-wide/16 p2, 0xdac

    invoke-virtual {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    :goto_1
    return-void
.end method

.method private renderQueue(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .locals 8

    .line 127
    const-string v0, "journal"

    const-string v1, ""

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->queueJournal:Ljava/lang/String;

    .line 128
    const-string v0, "ok"

    const/4 v2, 0x0

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerTiles;->queueFailed(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 129
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

    .line 130
    const-string v0, "\u00c0 suivre"

    invoke-direct {p0, p1, v0, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->line(Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v0

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42200000    # 40.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-direct {v3, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    const-string v0, "next"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 132
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

    .line 133
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

    .line 134
    :cond_2
    :goto_1
    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 135
    return-void
.end method

.method private skeleton(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 5

    .line 112
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 113
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

    .line 114
    :cond_0
    return-void
.end method

.method private syncVolume()V
    .locals 1

    .line 194
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

    .line 195
    :goto_0
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    .line 196
    return-void
.end method

.method private web(Landroid/app/Activity;)Landroid/webkit/WebView;
    .locals 3

    .line 109
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
    .locals 0

    .line 197
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 198
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

    .line 199
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$11;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerTiles$11;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 200
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerTiles$12;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerTiles$12;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
