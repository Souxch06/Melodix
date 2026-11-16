.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final CONFIRM_MS:J = 0x1388L

.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture )?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture )?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === \'repeat\') return true;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : \'control\';\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {result.reason=\'disabled\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=kind !== \'repeat\' && labels[kind].on.test(label) ? \'true\' :\n            kind !== \'repeat\' && labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (kind === \'repeat\' && typeof window.actRepeat !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Keep legacy commands when their exact target is known. Other recognized\n        // controls use the same explicit button click a user could make in Spotify.\n        var legacyLike=document.querySelector(\'div[data-testid=\"now-playing-widget\"]>div:last-child>button\');\n        if (kind === \'like\' && legacyLike === button && typeof window.actAddToFav === \'function\') window.actAddToFav();\n        else if (kind === \'shuffle\' && button.matches(\'button[data-testid=\"control-button-shuffle\"]\') && typeof window.actShuffle === \'function\') window.actShuffle();\n        else if (kind === \'repeat\') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n"

.field private static final TAP_GUARD_MS:J = 0x190L


# instance fields
.field private generation:J

.field private final handler:Landroid/os/Handler;

.field private kind:Ljava/lang/String;

.field private lastTap:J

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
    .line 38
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 24
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

    .line 26
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    .line 32
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 39
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 116
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 25
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 87
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->invoke()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 25
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 43
    .local v0, "c":Landroid/content/Context;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v1, v3, :cond_0

    instance-of v3, v0, Landroid/content/ContextWrapper;

    if-nez v3, :cond_1

    .line 47
    :cond_0
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_3

    check-cast v0, Landroid/app/Activity;

    .end local v0    # "c":Landroid/content/Context;
    :goto_1
    return-object v0

    .line 44
    .restart local v0    # "c":Landroid/content/Context;
    :cond_1
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v3, v0

    .line 45
    check-cast v3, Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .local v2, "next":Landroid/content/Context;
    if-eq v2, v0, :cond_0

    move-object v0, v2

    .line 43
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 47
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
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture )?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture )?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === \'repeat\') return true;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : \'control\';\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {result.reason=\'disabled\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=kind !== \'repeat\' && labels[kind].on.test(label) ? \'true\' :\n            kind !== \'repeat\' && labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (kind === \'repeat\' && typeof window.actRepeat !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Keep legacy commands when their exact target is known. Other recognized\n        // controls use the same explicit button click a user could make in Spotify.\n        var legacyLike=document.querySelector(\'div[data-testid=\"now-playing-widget\"]>div:last-child>button\');\n        if (kind === \'like\' && legacyLike === button && typeof window.actAddToFav === \'function\') window.actAddToFav();\n        else if (kind === \'shuffle\' && button.matches(\'button[data-testid=\"control-button-shuffle\"]\') && typeof window.actShuffle === \'function\') window.actShuffle();\n        else if (kind === \'repeat\') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n("

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
    .line 104
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
    .locals 14

    .prologue
    const-wide/16 v12, 0x1

    .line 88
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 89
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

    if-ltz v8, :cond_0

    .line 90
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v9, "unknown"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "like"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v5

    .local v5, "w":Landroid/webkit/WebView;
    if-nez v5, :cond_2

    const-string v8, "unknown"

    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v8, "web"

    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0

    .line 92
    :cond_2
    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .local v4, "old":Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    .local v2, "id":Ljava/lang/String;
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    .local v3, "name":Ljava/lang/String;
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    .line 93
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long v0, v8, v12

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    .local v0, "g":J
    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v8, v12

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    const/4 v8, 0x3

    invoke-virtual {p0, v8}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 94
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v9, Lcom/melodix/music/PreviewPlayerMode$4;

    invoke-direct {v9, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerMode$4;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    .line 96
    const-wide/16 v10, 0x1388

    .line 94
    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 97
    :try_start_0
    const-string v8, "invoke"

    invoke-direct {p0, v8, v4, v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v9, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v5, v8, v9}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 102
    :catch_0
    move-exception v8

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    goto :goto_0
.end method

.method private notConfirmed()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v2, 0x0

    .line 29
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "confirmation"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 30
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Action non confirm\u00e9e. R\u00e9essayer"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 31
    :cond_0
    return-void
.end method

.method private observe()V
    .locals 12

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v8

    .local v8, "w":Landroid/webkit/WebView;
    if-nez v8, :cond_1

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 69
    .local v6, "now":J
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    sub-long v0, v6, v0

    const-wide/16 v10, 0x960

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    .line 70
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    .line 71
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    .local v2, "g":J
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v10, 0x1

    add-long v4, v0, v10

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 72
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

    .line 85
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
    .locals 10

    .prologue
    .line 117
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "unknown"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v4, 0x0

    .local v4, "known":Z
    :goto_0
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "true"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "mixed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    const/4 v0, 0x0

    .line 119
    .local v0, "active":Z
    :goto_1
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v7, "like"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    if-eqz v0, :cond_5

    const-string v2, "favon"

    .local v2, "icon":Ljava/lang/String;
    :goto_2
    if-nez v4, :cond_6

    const-string v1, "Like indisponible"

    .line 122
    .local v1, "desc":Ljava/lang/String;
    :goto_3
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v6, :cond_12

    if-nez v4, :cond_12

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x960

    cmp-long v6, v6, v8

    if-gez v6, :cond_12

    const/4 v5, 0x1

    .line 123
    .local v5, "loading":Z
    :goto_4
    if-eqz v5, :cond_13

    const v3, 0x108005f

    .local v3, "id":I
    :goto_5
    if-eqz v3, :cond_0

    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 124
    :cond_0
    if-nez v4, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    if-eqz v5, :cond_14

    const-string v6, "Chargement : "

    :goto_6
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "like"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_15

    const-string v6, "Like"

    :goto_7
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 125
    :cond_1
    if-eqz v0, :cond_17

    const v6, -0x1fb762

    :goto_8
    invoke-virtual {p0, v6}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v6, :cond_2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ", en attente"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "desc":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 126
    if-eqz v4, :cond_18

    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v6, :cond_18

    const/4 v6, 0x1

    :goto_9
    invoke-virtual {p0, v6}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v7, "like"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v6, :cond_19

    const v6, 0x3f266666    # 0.65f

    :goto_a
    invoke-virtual {p0, v6}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    .line 127
    return-void

    .line 117
    .end local v0    # "active":Z
    .end local v2    # "icon":Ljava/lang/String;
    .end local v3    # "id":I
    .end local v4    # "known":Z
    .end local v5    # "loading":Z
    :cond_3
    const/4 v4, 0x1

    goto/16 :goto_0

    .restart local v4    # "known":Z
    :cond_4
    const/4 v0, 0x1

    goto/16 :goto_1

    .line 119
    .restart local v0    # "active":Z
    :cond_5
    const-string v2, "favoff"

    goto/16 :goto_2

    .restart local v2    # "icon":Ljava/lang/String;
    :cond_6
    if-eqz v0, :cond_7

    const-string v1, "Retirer des titres lik\u00e9s"

    goto/16 :goto_3

    :cond_7
    const-string v1, "Ajouter aux titres lik\u00e9s"

    goto/16 :goto_3

    .line 120
    .end local v2    # "icon":Ljava/lang/String;
    :cond_8
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v7, "shuffle"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "mixed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    const-string v2, "smart_shuffle"

    .restart local v2    # "icon":Ljava/lang/String;
    :goto_b
    if-nez v4, :cond_a

    const-string v1, "Al\u00e9atoire indisponible"

    .restart local v1    # "desc":Ljava/lang/String;
    :goto_c
    goto/16 :goto_3

    .end local v1    # "desc":Ljava/lang/String;
    .end local v2    # "icon":Ljava/lang/String;
    :cond_9
    const-string v2, "shuffle"

    goto :goto_b

    .restart local v2    # "icon":Ljava/lang/String;
    :cond_a
    if-eqz v0, :cond_b

    const-string v1, "Lecture al\u00e9atoire activ\u00e9e"

    goto :goto_c

    :cond_b
    const-string v1, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto :goto_c

    .line 121
    .end local v2    # "icon":Ljava/lang/String;
    :cond_c
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "mixed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    const-string v2, "repone"

    .restart local v2    # "icon":Ljava/lang/String;
    :goto_d
    if-nez v4, :cond_f

    const-string v1, "R\u00e9p\u00e9tition indisponible"

    .restart local v1    # "desc":Ljava/lang/String;
    :goto_e
    goto/16 :goto_3

    .end local v1    # "desc":Ljava/lang/String;
    .end local v2    # "icon":Ljava/lang/String;
    :cond_d
    if-eqz v0, :cond_e

    const-string v2, "repon"

    goto :goto_d

    :cond_e
    const-string v2, "repoff"

    goto :goto_d

    .restart local v2    # "icon":Ljava/lang/String;
    :cond_f
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v7, "mixed"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    const-string v1, "R\u00e9p\u00e9ter le titre"

    goto :goto_e

    :cond_10
    if-eqz v0, :cond_11

    const-string v1, "R\u00e9p\u00e9ter la liste"

    goto :goto_e

    :cond_11
    const-string v1, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    goto :goto_e

    .line 122
    .restart local v1    # "desc":Ljava/lang/String;
    :cond_12
    const/4 v5, 0x0

    goto/16 :goto_4

    .line 123
    .restart local v5    # "loading":Z
    :cond_13
    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v3

    goto/16 :goto_5

    .line 124
    .restart local v3    # "id":I
    :cond_14
    const-string v6, "Indisponible : "

    goto/16 :goto_6

    :cond_15
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v8, "shuffle"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16

    const-string v6, "Al\u00e9atoire"

    goto/16 :goto_7

    :cond_16
    const-string v6, "R\u00e9p\u00e9tition"

    goto/16 :goto_7

    .line 125
    :cond_17
    const v6, -0x363f16

    goto/16 :goto_8

    .line 126
    .end local v1    # "desc":Ljava/lang/String;
    :cond_18
    const/4 v6, 0x0

    goto/16 :goto_9

    :cond_19
    const/high16 v6, 0x3f800000    # 1.0f

    goto/16 :goto_a

    :cond_1a
    if-nez v4, :cond_1c

    if-eqz v5, :cond_1b

    const v6, 0x3f266666    # 0.65f

    goto/16 :goto_a

    :cond_1b
    const v6, 0x3eb33333    # 0.35f

    goto/16 :goto_a

    :cond_1c
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v6, :cond_1d

    const v6, 0x3f266666    # 0.65f

    goto/16 :goto_a

    :cond_1d
    const/high16 v6, 0x3f800000    # 1.0f

    goto/16 :goto_a
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 58
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

    .line 59
    :goto_0
    return-object v1

    .restart local v0    # "x":Ljava/lang/Object;
    :cond_0
    move-object v1, v2

    .line 58
    goto :goto_0

    .line 59
    .end local v0    # "x":Ljava/lang/Object;
    :catch_0
    move-exception v1

    move-object v1, v2

    goto :goto_0
.end method

.method private reasonText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en cours de chargement"

    .line 114
    :goto_0
    return-object v0

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "contr\u00f4le Spotify non reconnu ou absent"

    goto :goto_0

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "plusieurs contr\u00f4les possibles"

    goto :goto_0

    .line 109
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    goto :goto_0

    .line 110
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "identity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "titre ou identit\u00e9 non confirm\u00e9"

    goto :goto_0

    .line 111
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "command"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "commande indisponible"

    goto :goto_0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "action non confirm\u00e9e"

    goto :goto_0

    .line 113
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "web"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    goto :goto_0

    .line 114
    :cond_7
    const-string v0, "\u00e9tat ou langue non reconnu"

    goto :goto_0
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 4
    .param p1, "candidate"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 62
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    .local v0, "a":Landroid/app/Activity;
    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 64
    :cond_0
    :goto_0
    return v2

    .line 63
    :cond_1
    const v3, 0x7f09023b

    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 64
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

.method private sync()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 129
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

    .line 130
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

    .line 132
    :cond_0
    :goto_1
    return-void

    .end local v0    # "visible":Z
    :cond_1
    move v0, v2

    .line 129
    goto :goto_0

    .line 131
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

    .line 50
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 52
    :goto_0
    return-object v2

    .line 51
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

    .line 52
    .end local v1    # "w":Ljava/lang/Object;
    :catch_0
    move-exception v3

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 133
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

    .line 134
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
    .line 135
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 136
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$7;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$7;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
