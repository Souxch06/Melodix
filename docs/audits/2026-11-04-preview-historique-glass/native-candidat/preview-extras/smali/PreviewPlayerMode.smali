.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final CONFIRM_MS:J = 0x1388L

.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode )?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode )?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === \'repeat\') return true;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\') ? \'bar\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {result.reason=\'disabled\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=kind !== \'repeat\' && labels[kind].on.test(label) ? \'true\' :\n            kind !== \'repeat\' && labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (kind === \'repeat\' && typeof window.actRepeat !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Keep legacy commands when their exact target is known. Other recognized\n        // controls use the same explicit button click a user could make in Spotify.\n        var legacyLike=document.querySelector(\'div[data-testid=\"now-playing-widget\"]>div:last-child>button\');\n        if (kind === \'like\' && legacyLike === button && typeof window.actAddToFav === \'function\') window.actAddToFav();\n        else if (kind === \'shuffle\' && button.matches(\'button[data-testid=\"control-button-shuffle\"]\') && typeof window.actShuffle === \'function\') window.actShuffle();\n        else if (kind === \'repeat\') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n"

.field private static final TAP_GUARD_MS:J = 0x190L


# instance fields
.field private generation:J

.field private final handler:Landroid/os/Handler;

.field private kind:Ljava/lang/String;

.field private lastTap:J

.field private observedPending:Z

.field private pending:Z

.field private pendingState:Ljava/lang/String;

.field private pendingTrack:Ljava/lang/String;

.field private queryInFlight:Z

.field private querySerial:J

.field private queryStarted:J

.field private reason:Ljava/lang/String;

.field private running:Z

.field private state:Ljava/lang/String;

.field private final tick:Ljava/lang/Runnable;

.field private title:Ljava/lang/String;

.field private track:Ljava/lang/String;

.field private visibleSince:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "a"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 26
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

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    .line 28
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    .line 35
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 41
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 42
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 134
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return-void
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    return-void
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 149
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->invoke()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 46
    .local v0, "c":Landroid/content/Context;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v1, v3, :cond_0

    instance-of v3, v0, Landroid/content/ContextWrapper;

    if-nez v3, :cond_1

    .line 50
    :cond_0
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_3

    check-cast v0, Landroid/app/Activity;

    .end local v0    # "c":Landroid/content/Context;
    :goto_1
    return-object v0

    .line 47
    .restart local v0    # "c":Landroid/content/Context;
    :cond_1
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v3, v0

    .line 48
    check-cast v3, Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .local v2, "next":Landroid/content/Context;
    if-eq v2, v0, :cond_0

    move-object v0, v2

    .line 46
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 50
    .end local v2    # "next":Landroid/content/Context;
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "old"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "name"    # Ljava/lang/String;

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode )?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode )?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === \'repeat\') return true;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\') ? \'bar\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {result.reason=\'disabled\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=kind !== \'repeat\' && labels[kind].on.test(label) ? \'true\' :\n            kind !== \'repeat\' && labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (kind === \'repeat\' && typeof window.actRepeat !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Keep legacy commands when their exact target is known. Other recognized\n        // controls use the same explicit button click a user could make in Spotify.\n        var legacyLike=document.querySelector(\'div[data-testid=\"now-playing-widget\"]>div:last-child>button\');\n        if (kind === \'like\' && legacyLike === button && typeof window.actAddToFav === \'function\') window.actAddToFav();\n        else if (kind === \'shuffle\' && button.matches(\'button[data-testid=\"control-button-shuffle\"]\') && typeof window.actShuffle === \'function\') window.actShuffle();\n        else if (kind === \'repeat\') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n("

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
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 121
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
    .locals 12

    .prologue
    .line 100
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 101
    .local v6, "t":J
    iget-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v8, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v8

    if-nez v8, :cond_0

    iget-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v8, :cond_0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    sub-long v8, v6, v8

    const-wide/16 v10, 0x190

    cmp-long v8, v8, v10

    if-gez v8, :cond_1

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v9, "unknown"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 103
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "shuffle"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    const/4 v8, 0x3

    invoke-virtual {p0, v8}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shake()V

    .line 104
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v9

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v10, "bar"

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v8, "Lance un titre pour activer l\u2019al\u00e9atoire"

    :goto_1
    const/4 v10, 0x0

    invoke-static {v9, v8, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_2
    const-string v8, "Al\u00e9atoire indisponible, R\u00e9essayer"

    goto :goto_1

    .line 107
    :cond_3
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "like"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 108
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v5

    .local v5, "w":Landroid/webkit/WebView;
    if-nez v5, :cond_5

    const-string v8, "unknown"

    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v8, "web"

    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0

    .line 109
    :cond_5
    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .local v4, "old":Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    .local v2, "id":Ljava/lang/String;
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    .local v3, "name":Ljava/lang/String;
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    .line 110
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    const-wide/16 v10, 0x1

    add-long v0, v8, v10

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    .local v0, "g":J
    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    const/4 v8, 0x3

    invoke-virtual {p0, v8}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 111
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v9, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v9, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    .line 113
    const-wide/16 v10, 0x1388

    .line 111
    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 114
    :try_start_0
    const-string v8, "invoke"

    invoke-direct {p0, v8, v4, v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v9, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v5, v8, v9}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 119
    :catch_0
    move-exception v8

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    goto/16 :goto_0
.end method

.method private notConfirmed()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x0

    .line 31
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "shuffle"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v0, 0x1

    .line 32
    .local v0, "keepObserved":Z
    :goto_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v0, :cond_0

    const-string v2, "unknown"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    :cond_0
    const-string v2, "confirmation"

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 33
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v4, "shuffle"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "Al\u00e9atoire indisponible, R\u00e9essayer"

    :goto_1
    invoke-static {v3, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 34
    :cond_1
    return-void

    .end local v0    # "keepObserved":Z
    :cond_2
    move v0, v1

    .line 31
    goto :goto_0

    .line 33
    .restart local v0    # "keepObserved":Z
    :cond_3
    const-string v2, "Action non confirm\u00e9e. R\u00e9essayer"

    goto :goto_1
.end method

.method private observe()V
    .locals 12

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v8

    .local v8, "w":Landroid/webkit/WebView;
    if-nez v8, :cond_1

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 71
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 72
    .local v6, "now":J
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    sub-long v0, v6, v0

    const-wide/16 v10, 0x960

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    .line 73
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    .line 74
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    .local v2, "g":J
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v10, 0x1

    add-long v4, v0, v10

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 75
    .local v4, "serial":J
    :try_start_0
    const-string v0, "query"

    const-string v1, ""

    const-string v9, ""

    const-string v10, ""

    invoke-direct {p0, v0, v1, v9, v10}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerMode$3;-><init>(Lcom/melodix/music/PreviewPlayerMode;JJ)V

    invoke-virtual {v8, v9, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 89
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0
.end method

.method private paint()V
    .locals 12

    .prologue
    .line 135
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v8, "unknown"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const/4 v4, 0x0

    .line 136
    .local v4, "known":Z
    :goto_0
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 137
    .local v6, "shown":Ljava/lang/String;
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "shuffle"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v8, "false"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const-string v6, "true"

    .line 138
    :cond_0
    :goto_1
    const-string v7, "true"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    const-string v7, "mixed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    const/4 v0, 0x0

    .line 140
    .local v0, "active":Z
    :goto_2
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "like"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    if-eqz v0, :cond_9

    const-string v2, "favon"

    .local v2, "icon":Ljava/lang/String;
    :goto_3
    if-nez v4, :cond_a

    const-string v1, "Like indisponible"

    .line 143
    .local v1, "desc":Ljava/lang/String;
    :goto_4
    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v7, :cond_16

    if-nez v4, :cond_16

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    sub-long/2addr v8, v10

    const-wide/16 v10, 0x960

    cmp-long v7, v8, v10

    if-gez v7, :cond_16

    const/4 v5, 0x1

    .line 144
    .local v5, "loading":Z
    :goto_5
    if-eqz v5, :cond_17

    const v3, 0x108005f

    .local v3, "id":I
    :goto_6
    if-eqz v3, :cond_1

    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 145
    :cond_1
    if-nez v4, :cond_2

    new-instance v8, Ljava/lang/StringBuilder;

    if-eqz v5, :cond_18

    const-string v7, "Chargement : "

    :goto_7
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "like"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_19

    const-string v7, "Like"

    :goto_8
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "shuffle"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1b

    const-string v7, " ; n\u00e9cessite un contr\u00f4le et un \u00e9tat Spotify reconnus"

    :goto_9
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 146
    :cond_2
    if-eqz v0, :cond_1c

    const v7, -0x1fb762

    :goto_a
    invoke-virtual {p0, v7}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v7, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ", en attente"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "desc":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 147
    if-nez v4, :cond_4

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "shuffle"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1d

    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v7, :cond_1d

    :cond_4
    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v7, :cond_1d

    const/4 v7, 0x1

    :goto_b
    invoke-virtual {p0, v7}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "like"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f

    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v7, :cond_1e

    const v7, 0x3f266666    # 0.65f

    :goto_c
    invoke-virtual {p0, v7}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->invalidate()V

    .line 148
    return-void

    .line 135
    .end local v0    # "active":Z
    .end local v2    # "icon":Ljava/lang/String;
    .end local v3    # "id":I
    .end local v4    # "known":Z
    .end local v5    # "loading":Z
    .end local v6    # "shown":Ljava/lang/String;
    :cond_5
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 137
    .restart local v4    # "known":Z
    .restart local v6    # "shown":Ljava/lang/String;
    :cond_6
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v8, "true"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    const-string v6, "false"

    goto/16 :goto_1

    :cond_7
    const-string v6, "unknown"

    goto/16 :goto_1

    .line 138
    :cond_8
    const/4 v0, 0x1

    goto/16 :goto_2

    .line 140
    .restart local v0    # "active":Z
    :cond_9
    const-string v2, "favoff"

    goto/16 :goto_3

    .restart local v2    # "icon":Ljava/lang/String;
    :cond_a
    if-eqz v0, :cond_b

    const-string v1, "Retirer des titres lik\u00e9s"

    goto/16 :goto_4

    :cond_b
    const-string v1, "Ajouter aux titres lik\u00e9s"

    goto/16 :goto_4

    .line 141
    .end local v2    # "icon":Ljava/lang/String;
    :cond_c
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "shuffle"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    const-string v7, "mixed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    const-string v2, "smart_shuffle"

    .restart local v2    # "icon":Ljava/lang/String;
    :goto_d
    const-string v7, "unknown"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    const-string v1, "Al\u00e9atoire : \u00e9tat inconnu"

    .restart local v1    # "desc":Ljava/lang/String;
    :goto_e
    goto/16 :goto_4

    .end local v1    # "desc":Ljava/lang/String;
    .end local v2    # "icon":Ljava/lang/String;
    :cond_d
    const-string v2, "shuffle"

    goto :goto_d

    .restart local v2    # "icon":Ljava/lang/String;
    :cond_e
    if-eqz v0, :cond_f

    const-string v1, "Lecture al\u00e9atoire activ\u00e9e"

    goto :goto_e

    :cond_f
    const-string v1, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto :goto_e

    .line 142
    .end local v2    # "icon":Ljava/lang/String;
    :cond_10
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v8, "mixed"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    const-string v2, "repone"

    .restart local v2    # "icon":Ljava/lang/String;
    :goto_f
    if-nez v4, :cond_13

    const-string v1, "R\u00e9p\u00e9tition indisponible"

    .restart local v1    # "desc":Ljava/lang/String;
    :goto_10
    goto/16 :goto_4

    .end local v1    # "desc":Ljava/lang/String;
    .end local v2    # "icon":Ljava/lang/String;
    :cond_11
    if-eqz v0, :cond_12

    const-string v2, "repon"

    goto :goto_f

    :cond_12
    const-string v2, "repoff"

    goto :goto_f

    .restart local v2    # "icon":Ljava/lang/String;
    :cond_13
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v8, "mixed"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_14

    const-string v1, "R\u00e9p\u00e9ter le titre"

    goto :goto_10

    :cond_14
    if-eqz v0, :cond_15

    const-string v1, "R\u00e9p\u00e9ter la liste"

    goto :goto_10

    :cond_15
    const-string v1, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    goto :goto_10

    .line 143
    .restart local v1    # "desc":Ljava/lang/String;
    :cond_16
    const/4 v5, 0x0

    goto/16 :goto_5

    .line 144
    .restart local v5    # "loading":Z
    :cond_17
    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v3

    goto/16 :goto_6

    .line 145
    .restart local v3    # "id":I
    :cond_18
    const-string v7, "Indisponible : "

    goto/16 :goto_7

    :cond_19
    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "shuffle"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1a

    const-string v7, "Al\u00e9atoire"

    goto/16 :goto_8

    :cond_1a
    const-string v7, "R\u00e9p\u00e9tition"

    goto/16 :goto_8

    :cond_1b
    const-string v7, ""

    goto/16 :goto_9

    .line 146
    :cond_1c
    const v7, -0x363f16

    goto/16 :goto_a

    .line 147
    .end local v1    # "desc":Ljava/lang/String;
    :cond_1d
    const/4 v7, 0x0

    goto/16 :goto_b

    :cond_1e
    const/high16 v7, 0x3f800000    # 1.0f

    goto/16 :goto_c

    :cond_1f
    if-nez v4, :cond_21

    if-eqz v5, :cond_20

    const v7, 0x3f266666    # 0.65f

    goto/16 :goto_c

    :cond_20
    const v7, 0x3eb33333    # 0.35f

    goto/16 :goto_c

    :cond_21
    iget-boolean v7, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v7, :cond_22

    const v7, 0x3f266666    # 0.65f

    goto/16 :goto_c

    :cond_22
    const/high16 v7, 0x3f800000    # 1.0f

    goto/16 :goto_c
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 61
    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "x":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    check-cast v0, Ljava/lang/String;

    .end local v0    # "x":Ljava/lang/Object;
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_0
    return-object v1

    .restart local v0    # "x":Ljava/lang/Object;
    :cond_0
    move-object v1, v2

    .line 61
    goto :goto_0

    .line 62
    .end local v0    # "x":Ljava/lang/Object;
    :catch_0
    move-exception v1

    move-object v1, v2

    goto :goto_0
.end method

.method private reasonText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en cours de chargement"

    .line 132
    :goto_0
    return-object v0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "bar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "barre du lecteur Spotify absente ; lancer un titre"

    goto :goto_0

    .line 125
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "contr\u00f4le Spotify non reconnu ou absent"

    goto :goto_0

    .line 126
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "plusieurs contr\u00f4les possibles"

    goto :goto_0

    .line 127
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    goto :goto_0

    .line 128
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "identity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "titre ou identit\u00e9 non confirm\u00e9"

    goto :goto_0

    .line 129
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "command"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "commande indisponible"

    goto :goto_0

    .line 130
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "action non confirm\u00e9e"

    goto :goto_0

    .line 131
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "web"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    goto :goto_0

    .line 132
    :cond_8
    const-string v0, "\u00e9tat ou langue non reconnu"

    goto :goto_0
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 4
    .param p1, "candidate"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 65
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    .local v0, "a":Landroid/app/Activity;
    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 67
    :cond_0
    :goto_0
    return v2

    .line 66
    :cond_1
    const v3, 0x7f09023b

    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 67
    .local v1, "v":Landroid/view/View;
    instance-of v3, v1, Landroid/widget/TextView;

    if-eqz v3, :cond_0

    check-cast v1, Landroid/widget/TextView;

    .end local v1    # "v":Landroid/view/View;
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method private shake()V
    .locals 4

    .prologue
    .line 92
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    :goto_0
    return-void

    .line 93
    :cond_0
    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v1, v2

    .line 94
    .local v0, "shift":F
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 95
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x46

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerMode$4;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerMode$4;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    .line 97
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private sync()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 150
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v3

    if-nez v3, :cond_1

    move v0, v1

    .line 151
    .local v0, "visible":Z
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-nez v3, :cond_2

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    const-string v1, "web"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 153
    :cond_0
    :goto_1
    return-void

    .end local v0    # "visible":Z
    :cond_1
    move v0, v2

    .line 150
    goto :goto_0

    .line 152
    .restart local v0    # "visible":Z
    :cond_2
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v1, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v1, "unknown"

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_1
.end method

.method private web()Landroid/webkit/WebView;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 53
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 55
    :goto_0
    return-object v2

    .line 54
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "G"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .local v1, "w":Ljava/lang/Object;
    instance-of v3, v1, Landroid/webkit/WebView;

    if-eqz v3, :cond_1

    check-cast v1, Landroid/webkit/WebView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "w":Ljava/lang/Object;
    :goto_1
    move-object v2, v1

    goto :goto_0

    .restart local v1    # "w":Ljava/lang/Object;
    :cond_1
    move-object v1, v2

    goto :goto_1

    .line 55
    .end local v1    # "w":Ljava/lang/Object;
    :catch_0
    move-exception v3

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 154
    invoke-super {p0}, Landroid/widget/ImageButton;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getTag()Ljava/lang/Object;

    move-result-object v0

    .local v0, "t":Ljava/lang/Object;
    if-nez v0, :cond_0

    const-string v1, ""

    :goto_0
    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v2, 0x0

    .line 155
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

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-super {p0}, Landroid/widget/ImageButton;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "changed"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 156
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$7;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 157
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$8;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$8;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
