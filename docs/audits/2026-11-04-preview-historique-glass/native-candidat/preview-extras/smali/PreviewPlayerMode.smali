.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Only inspect the same controls used by the existing protected commands.\n    // No network access, credentials, navigation or playback clock.\n    var selectors = {\n        like:\'div[data-testid=\"now-playing-widget\"]>div:last-child>button\',\n        shuffle:\'button[data-testid=\"control-button-shuffle\"]\',\n        repeat:\'button[data-testid=\"control-button-repeat\"]\'\n    };\n    var functions = {like:\'actAddToFav\', shuffle:\'actShuffle\', repeat:\'actRepeat\'};\n    if (!Object.prototype.hasOwnProperty.call(selectors, kind)) return JSON.stringify({state:\'unknown\'});\n    var button = document.querySelector(selectors[kind]);\n    var raw = button && (button.getAttribute(\'aria-checked\') || (kind === \'shuffle\' ? button.getAttribute(\'aria-pressed\') : null));\n    var enabled = !!(button && button.isConnected && !button.disabled && button.getAttribute(\'aria-disabled\') !== \'true\' && typeof window[functions[kind]] === \'function\');\n    var valid = raw === \'true\' || raw === \'false\' || (kind !== \'like\' && raw === \'mixed\');\n    var title = \'\', track = \'\';\n    if (kind === \'like\') {\n        // The legacy selector is positional. Require a recognizable save control\n        // as well, so a different checked button can never be toggled as a like.\n        var testid = button ? String(button.getAttribute(\'data-testid\') || \'\').toLowerCase() : \'\';\n        var label = button ? String(button.getAttribute(\'aria-label\') || \'\').trim().toLowerCase() : \'\';\n        var saveControl = /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(testid) ||\n            /^(save to your library|remove from your library|add to liked songs|remove from liked songs|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s))$/.test(label);\n        enabled = enabled && saveControl;\n        var bar = document.querySelector(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link = bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        title = link ? String(link.textContent || \'\').trim() : \'\';\n        var href = link ? String(link.getAttribute(\'href\') || \'\') : \'\';\n        var match = /^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        track = match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        enabled = enabled && !!track && !!title;\n    }\n    var state = enabled && valid ? raw : \'unknown\';\n    if (action === \'query\') return JSON.stringify({state:state,track:track,title:title});\n    if (action !== \'invoke\' || state === \'unknown\' || state !== expectedState ||\n        (kind === \'like\' && (track !== expectedTrack || title !== expectedTitle)))\n        return JSON.stringify({sent:false});\n    try { window[functions[kind]](); return JSON.stringify({sent:true}); }\n    catch (_) { return JSON.stringify({sent:false}); }\n})\n"


# instance fields
.field private generation:J

.field private final handler:Landroid/os/Handler;

.field private kind:Ljava/lang/String;

.field private pending:Z

.field private pendingAt:J

.field private pendingState:Ljava/lang/String;

.field private pendingTrack:Ljava/lang/String;

.field private querySerial:J

.field private running:Z

.field private state:Ljava/lang/String;

.field private final tick:Ljava/lang/Runnable;

.field private title:Ljava/lang/String;

.field private track:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    .line 26
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 32
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 33
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 25
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingAt:J

    return-wide v0
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 24
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 23
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->invoke()V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 25
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    return-wide v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 25
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 37
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 41
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 38
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 39
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 37
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 41
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Only inspect the same controls used by the existing protected commands.\n    // No network access, credentials, navigation or playback clock.\n    var selectors = {\n        like:\'div[data-testid=\"now-playing-widget\"]>div:last-child>button\',\n        shuffle:\'button[data-testid=\"control-button-shuffle\"]\',\n        repeat:\'button[data-testid=\"control-button-repeat\"]\'\n    };\n    var functions = {like:\'actAddToFav\', shuffle:\'actShuffle\', repeat:\'actRepeat\'};\n    if (!Object.prototype.hasOwnProperty.call(selectors, kind)) return JSON.stringify({state:\'unknown\'});\n    var button = document.querySelector(selectors[kind]);\n    var raw = button && (button.getAttribute(\'aria-checked\') || (kind === \'shuffle\' ? button.getAttribute(\'aria-pressed\') : null));\n    var enabled = !!(button && button.isConnected && !button.disabled && button.getAttribute(\'aria-disabled\') !== \'true\' && typeof window[functions[kind]] === \'function\');\n    var valid = raw === \'true\' || raw === \'false\' || (kind !== \'like\' && raw === \'mixed\');\n    var title = \'\', track = \'\';\n    if (kind === \'like\') {\n        // The legacy selector is positional. Require a recognizable save control\n        // as well, so a different checked button can never be toggled as a like.\n        var testid = button ? String(button.getAttribute(\'data-testid\') || \'\').toLowerCase() : \'\';\n        var label = button ? String(button.getAttribute(\'aria-label\') || \'\').trim().toLowerCase() : \'\';\n        var saveControl = /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(testid) ||\n            /^(save to your library|remove from your library|add to liked songs|remove from liked songs|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s))$/.test(label);\n        enabled = enabled && saveControl;\n        var bar = document.querySelector(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link = bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        title = link ? String(link.textContent || \'\').trim() : \'\';\n        var href = link ? String(link.getAttribute(\'href\') || \'\') : \'\';\n        var match = /^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        track = match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        enabled = enabled && !!track && !!title;\n    }\n    var state = enabled && valid ? raw : \'unknown\';\n    if (action === \'query\') return JSON.stringify({state:state,track:track,title:title});\n    if (action !== \'invoke\' || state === \'unknown\' || state !== expectedState ||\n        (kind === \'like\' && (track !== expectedTrack || title !== expectedTitle)))\n        return JSON.stringify({sent:false});\n    try { window[functions[kind]](); return JSON.stringify({sent:true}); }\n    catch (_) { return JSON.stringify({sent:false}); }\n})\n("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private drawable(Ljava/lang/String;)I
    .locals 3

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "drawable"

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private invoke()V
    .locals 10

    .prologue
    const-wide/16 v8, 0x1

    .line 78
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0

    .line 80
    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingAt:J

    .line 81
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v4, v8

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    const/4 v6, 0x3

    invoke-virtual {p0, v6}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 82
    :try_start_0
    const-string v6, "invoke"

    invoke-direct {p0, v6, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerMode$4;

    invoke-direct {v2, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerMode$4;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0
.end method

.method private observe()V
    .locals 9

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v6

    if-nez v6, :cond_0

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 76
    :goto_0
    return-void

    .line 62
    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v0

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 63
    :try_start_0
    const-string v0, "query"

    const-string v1, ""

    const-string v7, ""

    const-string v8, ""

    invoke-direct {p0, v0, v1, v7, v8}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerMode$3;-><init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V

    invoke-virtual {v6, v7, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 75
    :catch_0
    move-exception v0

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0
.end method

.method private paint()V
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 91
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v4, "mixed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    move v3, v1

    .line 93
    :goto_1
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v5, "like"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    if-eqz v3, :cond_4

    const-string v5, "favon"

    :goto_2
    if-nez v0, :cond_5

    const-string v4, "Like indisponible"

    .line 96
    :goto_3
    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p0, v5}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 97
    :cond_0
    if-eqz v3, :cond_11

    const v3, -0x1fb762

    :goto_4
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ", en attente"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_1
    invoke-virtual {p0, v4}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 98
    if-eqz v0, :cond_12

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v3, :cond_12

    :goto_5
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    if-eqz v0, :cond_13

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_6
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    .line 99
    return-void

    :cond_2
    move v0, v2

    .line 91
    goto :goto_0

    :cond_3
    move v3, v2

    goto :goto_1

    .line 93
    :cond_4
    const-string v5, "favoff"

    goto :goto_2

    :cond_5
    if-eqz v3, :cond_6

    const-string v4, "Retirer des titres lik\u00e9s"

    goto :goto_3

    :cond_6
    const-string v4, "Ajouter aux titres lik\u00e9s"

    goto :goto_3

    .line 94
    :cond_7
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v5, "shuffle"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v5, "mixed"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    const-string v5, "smart_shuffle"

    :goto_7
    if-nez v0, :cond_9

    const-string v4, "Al\u00e9atoire indisponible"

    goto :goto_3

    :cond_8
    const-string v5, "shuffle"

    goto :goto_7

    :cond_9
    if-eqz v3, :cond_a

    const-string v4, "Lecture al\u00e9atoire activ\u00e9e"

    goto :goto_3

    :cond_a
    const-string v4, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto :goto_3

    .line 95
    :cond_b
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v5, "mixed"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    const-string v5, "repone"

    :goto_8
    if-nez v0, :cond_e

    const-string v4, "R\u00e9p\u00e9tition indisponible"

    goto/16 :goto_3

    :cond_c
    if-eqz v3, :cond_d

    const-string v5, "repon"

    goto :goto_8

    :cond_d
    const-string v5, "repoff"

    goto :goto_8

    :cond_e
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v6, "mixed"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    const-string v4, "R\u00e9p\u00e9ter le titre"

    goto/16 :goto_3

    :cond_f
    if-eqz v3, :cond_10

    const-string v4, "R\u00e9p\u00e9ter la liste"

    goto/16 :goto_3

    :cond_10
    const-string v4, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    goto/16 :goto_3

    .line 97
    :cond_11
    const v3, -0x363f16

    goto/16 :goto_4

    :cond_12
    move v2, v1

    .line 98
    goto :goto_5

    :cond_13
    const v0, 0x3eb33333    # 0.35f

    goto :goto_6
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 52
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

    .line 53
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v2

    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    move-object v0, v2

    goto :goto_0
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v0, v1

    .line 58
    :goto_0
    return v0

    .line 57
    :cond_1
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 58
    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_2

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method private sync()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 101
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    .line 102
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-nez v3, :cond_2

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 104
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v2

    .line 101
    goto :goto_0

    .line 103
    :cond_2
    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_1
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 46
    :goto_0
    return-object v1

    .line 45
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "G"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Landroid/webkit/WebView;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/webkit/WebView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1

    .line 46
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 105
    invoke-super {p0}, Landroid/widget/ImageButton;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x1

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    invoke-super {p0}, Landroid/widget/ImageButton;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 107
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 108
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
