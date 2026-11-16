.class public final Lcom/melodix/music/PreviewPlayerMode;
.super Landroid/widget/ImageButton;
.source "PreviewPlayerMode.java"


# static fields
.field private static final CONFIRM_MS:J = 0x1388L

.field private static final DIAGNOSTIC:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind===\'shuffle\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

.field private static final SCRIPT:Ljava/lang/String; = "(function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === \'repeat\') return true;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\') ? \'bar\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=kind !== \'repeat\' && labels[kind].on.test(label) ? \'true\' :\n            kind !== \'repeat\' && labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        if (!bar) bar=document.querySelector(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (kind === \'repeat\' && typeof window.actRepeat !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        if (kind === \'repeat\') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n"

.field private static final TAP_GUARD_MS:J = 0x190L

.field private static final after:[Ljava/lang/String;

.field private static final before:[Ljava/lang/String;

.field private static final last:[Ljava/lang/String;

.field private static final outcome:[Ljava/lang/String;

.field private static structure:Ljava/lang/String;


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
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "non observ\u00e9"

    aput-object v1, v0, v2

    const-string v1, "non observ\u00e9"

    aput-object v1, v0, v3

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "aucun appui"

    aput-object v1, v0, v2

    const-string v1, "aucun appui"

    aput-object v1, v0, v3

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "aucun appui"

    aput-object v1, v0, v2

    const-string v1, "aucun appui"

    aput-object v1, v0, v3

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "aucun appui"

    aput-object v1, v0, v2

    const-string v1, "aucun appui"

    aput-object v1, v0, v3

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    .line 28
    const-string v0, "non observ\u00e9e"

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    .line 51
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

    .line 53
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    .line 61
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$1;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    .line 68
    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$2;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerMode;)Z
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return v0
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    return-void
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerMode;)I
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    return v0
.end method

.method static synthetic access$17()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->observe()V

    return-void
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    return-void
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 178
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->sync()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerMode;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0

    .prologue
    .line 125
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->invoke()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 53
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerMode;)J
    .locals 2

    .prologue
    .line 53
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerMode;Z)V
    .locals 0

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerMode;->remember(Lorg/json/JSONObject;)V

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 72
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 76
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 73
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 74
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 72
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 76
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "|"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    const-string p0, "unknown"

    goto :goto_0
.end method

.method private beginDiagnostic()V
    .locals 3

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v2, v2, v0

    aput-object v2, v1, v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    const-string v2, "en attente d\'observation"

    aput-object v2, v1, v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v2, "en attente"

    aput-object v2, v1, v0

    :cond_0
    return-void
.end method

.method private call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(function(){var r=JSON.parse(((function(kind, action, expectedState, expectedTrack, expectedTitle) {\n    \'use strict\';\n    // Passive inspection of controls already in the page. A tap can only click\n    // a uniquely identified real control, after state/identity revalidation.\n    var labels = {\n        like: {\n            off: /^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on: /^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i\n        },\n        shuffle: {\n            off: /^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on: /^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i\n        }\n    };\n    if ([\'like\',\'shuffle\',\'repeat\'].indexOf(kind) < 0) return JSON.stringify({state:\'unknown\',reason:\'control\'});\n    var selector = kind === \'like\' ?\n        \'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\' :\n        kind === \'shuffle\' ? \'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\' :\n        \'button[data-testid=\"control-button-repeat\"]\';\n    var nodes = Array.from(document.querySelectorAll(selector)).filter(function(b) {\n        if (!b.isConnected) return false;\n        if (kind === \'repeat\') return true;\n        var id=String(b.getAttribute(\'data-testid\')||\'\').toLowerCase();\n        var label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n        if (kind === \'like\') return /^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id) || labels.like.off.test(label) || labels.like.on.test(label);\n        return /shuffle/.test(id) || labels.shuffle.off.test(label) || labels.shuffle.on.test(label);\n    });\n    var result={state:\'unknown\',track:\'\',title:\'\',reason:\'control\',sent:false};\n    if (!nodes.length) {\n        result.reason = document.readyState === \'loading\' ? \'page\' : (kind === \'shuffle\' && !document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\') ? \'bar\' : \'control\');\n        return JSON.stringify(result);\n    }\n    if (nodes.length !== 1) {result.reason=\'ambiguous\';return JSON.stringify(result);}\n    var button=nodes[0];\n    if (button.disabled || button.getAttribute(\'aria-disabled\') === \'true\') {\n        var description=String(button.getAttribute(\'aria-description\')||\'\').trim();\n        result.reason=kind===\'shuffle\' && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description)?\'restriction\':\'disabled\';\n        return JSON.stringify(result);\n    }\n    if (kind === \'like\' && /^(true|menu|dialog)$/i.test(String(button.getAttribute(\'aria-haspopup\')||\'\'))) {result.reason=\'menu\';return JSON.stringify(result);}\n    var raw=button.getAttribute(\'aria-checked\');\n    if (raw === null) raw=button.getAttribute(\'aria-pressed\');\n    var label=String(button.getAttribute(\'aria-label\')||\'\').trim();\n    if (raw === null) {\n        raw=kind !== \'repeat\' && labels[kind].on.test(label) ? \'true\' :\n            kind !== \'repeat\' && labels[kind].off.test(label) ? \'false\' : \'unknown\';\n    } else if (raw !== \'true\' && raw !== \'false\' && !(kind !== \'like\' && raw === \'mixed\')) raw=\'unknown\';\n    if (kind === \'like\') {\n        var bar=button.closest(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        if (!bar) bar=document.querySelector(\'[data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-bar\"]\');\n        var link=bar && bar.querySelector(\'a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]\');\n        result.title=link ? String(link.textContent||\'\').trim() : \'\';\n        var href=link ? String(link.getAttribute(\'href\')||\'\') : \'\';\n        var match=/^\\/(track|episode)\\/([a-z0-9]+)(?:[?#].*)?$/i.exec(href);\n        result.track=match ? match[1].toLowerCase()+\':\'+match[2] : \'\';\n        if (!result.track || !result.title) {result.reason=\'identity\';return JSON.stringify(result);}\n    }\n    if (raw === \'unknown\') {result.reason=\'state\';return JSON.stringify(result);}\n    if (kind === \'repeat\' && typeof window.actRepeat !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    if (typeof button.click !== \'function\') {result.reason=\'command\';return JSON.stringify(result);}\n    result.state=raw;result.reason=\'\';\n    if (action === \'query\') return JSON.stringify(result);\n    if (action !== \'invoke\' || raw !== expectedState ||\n        (kind === \'like\' && (raw !== \'false\' || result.track !== expectedTrack || result.title !== expectedTitle))) return JSON.stringify({sent:false});\n    try {\n        // Use the exact revalidated button; never call a legacy helper that\n        // schedules playback-related work. Never click an already-liked item.\n        if (kind === \'repeat\') window.actRepeat();\n        else button.click();\n        return JSON.stringify({sent:true});\n    } catch (_) { return JSON.stringify({sent:false}); }\n})\n)("

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

    const-string v1, "));r.diagnostic=("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(function(kind) {\n    \'use strict\';\n    // Passive, bounded, allowlisted observations only. No account, track or\n    // arbitrary page text is returned. This probe does not click or send data.\n    var specs={\n        shuffle:{selector:\'button[data-testid*=\"shuffle\" i], button[aria-label], [role=\"button\"][aria-label], [role=\"switch\"][aria-label]\', ids:/shuffle/i,\n            off:/^(enable shuffle|turn shuffle on|activate shuffle|activer (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe aktivieren|activar (el modo |la reproducci\u00f3n )?aleatori[oa]|ativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i,\n            on:/^(disable shuffle|turn shuffle off|deactivate shuffle|d\u00e9sactiver (la lecture |le mode |l[\'\u2019])?al\u00e9atoire|zufallswiedergabe deaktivieren|desactivar (el modo |la reproducci\u00f3n )?aleatori[oa]|desativar (a reprodu\u00e7\u00e3o )?aleat\u00f3ria)$/i},\n        like:{selector:\'[data-testid=\"now-playing-widget\"] button, [data-testid=\"now-playing-bar\"] button, [data-testid=\"now-playing-view\"] button, [data-testid=\"now-playing-panel\"] button, [data-testid=\"now-playing-view\"] [role=\"button\"], [data-testid=\"now-playing-bar\"] [role=\"button\"]\', ids:/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/i,\n            off:/^(save to your library|add to (your )?(liked songs|library)|ajouter (\u00e0|aux) (la biblioth\u00e8que|titres lik\u00e9s)|enregistrer dans (votre |la )?biblioth\u00e8que|in (deine |der )?bibliothek (aufnehmen|hinzuf\u00fcgen)|a\u00f1adir a (tu )?biblioteca|adicionar (\u00e0 biblioteca|aos t\u00edtulos curtidos))$/i,\n            on:/^(remove from (your )?(library|liked songs)|retirer (de la biblioth\u00e8que|des titres lik\u00e9s)|supprimer de (votre |la )?biblioth\u00e8que|aus (deiner |der )?bibliothek entfernen|quitar de (tu )?biblioteca|remover (da biblioteca|dos t\u00edtulos curtidos))$/i}\n    };\n    // Aggregate structure only: fixed testid/role and label categories, never\n    // arbitrary labels or identifiers that could contain a track or account.\n    function structure() {\n        var roots=Array.from(document.querySelectorAll(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"], [data-testid=\"now-playing-view\"], [data-testid=\"now-playing-panel\"]\'));\n        var nodes=[];roots.forEach(function(root){Array.from(root.querySelectorAll(\'button,[role=\"button\"],[role=\"switch\"],[role=\"slider\"],input[type=\"range\"]\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n        var st={bar:0,view:0,nodes:Math.min(nodes.length,99),playpause:0,repeat:0,shuffle:0,like:0,queue:0,volume:0,lyrics:0,connect:0,other:0,button:0,switch:0,slider:0,aria_shuffle:0,aria_like:0,aria_play:0,aria_pause:0,aria_other:0};\n        roots.forEach(function(r){if(/^(now-playing-view|now-playing-panel)$/.test(r.getAttribute(\'data-testid\')))st.view++;else st.bar++;});\n        nodes.forEach(function(n){\n            var id=String(n.getAttribute(\'data-testid\')||\'\').toLowerCase(), label=String(n.getAttribute(\'aria-label\')||\'\').trim(), role=String(n.getAttribute(\'role\')||\'\').toLowerCase();\n            var k=/^control-button-playpause$/.test(id)?\'playpause\':/repeat/.test(id)?\'repeat\':/shuffle/.test(id)?\'shuffle\':/^(add-button|remove-button|add-to-library-button|remove-from-library-button)$/.test(id)?\'like\':/^(queue-button|control-button-queue)$/.test(id)?\'queue\':/^(volume-bar|volume-slider)$/.test(id)?\'volume\':/^(lyrics-button|control-button-lyrics)$/.test(id)?\'lyrics\':/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/.test(id)?\'connect\':\'other\';\n            st[k]=Math.min(st[k]+1,99);if(role===\'switch\')st.switch++;else if(role===\'slider\'||n.tagName===\'INPUT\')st.slider++;else st.button++;\n            if(specs.shuffle.off.test(label)||specs.shuffle.on.test(label))st.aria_shuffle++;else if(specs.like.off.test(label)||specs.like.on.test(label))st.aria_like++;else if(/^(play|resume|lire|reprendre)$/i.test(label))st.aria_play++;else if(/^(pause|mettre en pause)$/i.test(label))st.aria_pause++;else if(label)st.aria_other++;\n        });\n        Object.keys(st).forEach(function(k){st[k]=Math.min(st[k],99);});return JSON.stringify(st);\n    }\n    var spec=specs[kind], out={kind:kind===\'shuffle\'?\'shuffle\':kind===\'like\'?\'like\':\'unknown\',reason:\'control\',count:0,state:\'unknown\',label:\'unknown\',command:\'unknown\',disabled:false,smart:false,structure:structure()};\n    if(!spec)return JSON.stringify(out);\n    var nodes=Array.from(document.querySelectorAll(spec.selector)).filter(function(b){\n        return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.off.test(String(b.getAttribute(\'aria-label\')||\'\').trim()) || spec.on.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n    });\n    out.count=Math.min(nodes.length,2);\n    if(nodes.length!==1){out.reason=nodes.length?\'ambiguous\':document.readyState===\'loading\'?\'page\':\'absent\';return JSON.stringify(out);}\n    var b=nodes[0], label=String(b.getAttribute(\'aria-label\')||\'\').trim();\n    out.label=spec.on.test(label)?\'on-action\':spec.off.test(label)?\'off-action\':label?\'unrecognized\':\'absent\';\n    out.disabled=!!b.disabled || b.getAttribute(\'aria-disabled\')===\'true\';\n    var raw=b.getAttribute(\'aria-checked\');if(raw===null)raw=b.getAttribute(\'aria-pressed\');\n    out.state=raw===\'true\'||raw===\'false\'||(kind===\'shuffle\'&&raw===\'mixed\')?raw:raw===null?(out.label===\'on-action\'?\'true\':out.label===\'off-action\'?\'false\':\'unknown\'):\'unknown\';\n    out.smart=kind===\'shuffle\' && out.state===\'mixed\';\n    var popup=String(b.getAttribute(\'aria-haspopup\')||\'\').toLowerCase();\n    if(kind===\'like\')out.command=popup===\'true\'||popup===\'menu\'||popup===\'dialog\'?\'menu\':\'unspecified\';\n    else out.command=\'toggle\';\n    var description=String(b.getAttribute(\'aria-description\')||\'\').trim();\n    var restricted=kind===\'shuffle\' && out.disabled && /^(shuffle is not available (with|for) (this account|this playback)|l[\'\u2019]al\u00e9atoire n[\'\u2019]est pas disponible avec (ce compte|cette lecture))$/i.test(description);\n    out.reason=restricted?\'restriction\':out.disabled?\'disabled\':out.state===\'unknown\'?\'state\':\'observed\';\n    return JSON.stringify(out);\n})\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");return JSON.stringify(r);})()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 29
    const/4 v0, 0x0

    const/16 v1, 0x63

    :try_start_0
    const-string v2, "0"

    invoke-virtual {p0, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "0"

    goto :goto_0
.end method

.method private diagnosticIndex()I
    .locals 2

    .prologue
    .line 30
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "shuffle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\nAl\u00e9atoire \u2014 actuel : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; avant : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; apr\u00e8s : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; r\u00e9sultat : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 49
    const-string v1, "\nLike \u2014 actuel : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; avant : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->before:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; apr\u00e8s : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; r\u00e9sultat : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure lecteur (comptes seulement ; autres libell\u00e9s masqu\u00e9s) : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private drawable(Ljava/lang/String;)I
    .locals 3

    .prologue
    .line 148
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
    const-wide/16 v10, 0x1

    const/4 v9, 0x3

    const/4 v8, 0x0

    .line 126
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 127
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getWindowVisibility()I

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v2, :cond_0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 128
    :cond_1
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 129
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v2

    if-ltz v2, :cond_2

    sget-object v3, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v4, "non envoy\u00e9"

    aput-object v4, v3, v2

    .line 130
    :cond_2
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "shuffle"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-virtual {p0, v9}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->shake()V

    .line 131
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v2, "bar"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Lance un titre pour activer l\u2019al\u00e9atoire"

    :goto_1
    invoke-static {v1, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    const-string v0, "Al\u00e9atoire indisponible, R\u00e9essayer"

    goto :goto_1

    .line 134
    :cond_4
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "true"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->sameNativeTitle(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    :cond_5
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v2

    if-nez v2, :cond_6

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    goto :goto_0

    .line 136
    :cond_6
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->lastTap:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->beginDiagnostic()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->track:Ljava/lang/String;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->title:Ljava/lang/String;

    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    .line 137
    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingTrack:Ljava/lang/String;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v4, v10

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v6, v10

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v8, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    invoke-virtual {p0, v9}, Lcom/melodix/music/PreviewPlayerMode;->performHapticFeedback(I)Z

    .line 138
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    new-instance v7, Lcom/melodix/music/PreviewPlayerMode$5;

    invoke-direct {v7, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerMode$5;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    .line 140
    const-wide/16 v8, 0x1388

    .line 138
    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 141
    :try_start_0
    const-string v6, "invoke"

    invoke-direct {p0, v6, v0, v1, v3}, Lcom/melodix/music/PreviewPlayerMode;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-direct {v1, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerMode$6;-><init>(Lcom/melodix/music/PreviewPlayerMode;J)V

    invoke-virtual {v2, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 146
    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->notConfirmed()V

    goto/16 :goto_0
.end method

.method private notConfirmed()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x0

    .line 56
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v0

    if-ltz v0, :cond_0

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->outcome:[Ljava/lang/String;

    const-string v3, "non confirm\u00e9"

    aput-object v3, v2, v0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "shuffle"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->observedPending:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v2, "unknown"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    .line 58
    :goto_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v0, :cond_1

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    :cond_1
    const-string v0, "confirmation"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 59
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->isShown()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "shuffle"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Al\u00e9atoire indisponible, R\u00e9essayer"

    :goto_1
    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 60
    :cond_2
    return-void

    :cond_3
    move v0, v1

    .line 57
    goto :goto_0

    .line 59
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v3, "like"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Impossible d\u2019ajouter aux titres lik\u00e9s, R\u00e9essayer"

    goto :goto_1

    :cond_5
    const-string v0, "Action non confirm\u00e9e. R\u00e9essayer"

    goto :goto_1
.end method

.method private observe()V
    .locals 9

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->web()Landroid/webkit/WebView;

    move-result-object v6

    if-nez v6, :cond_1

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 97
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 98
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x960

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 99
    :cond_2
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->queryStarted:J

    .line 100
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerMode;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v0

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerMode;->querySerial:J

    .line 101
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

    .line 115
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
    .locals 14

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    const v8, 0x3eb33333    # 0.35f

    const v6, 0x3f266666    # 0.65f

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 164
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v3, "unknown"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 165
    :goto_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    .line 166
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v5, "shuffle"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v4, :cond_0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v4, "false"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "true"

    .line 167
    :cond_0
    :goto_1
    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "mixed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    move v4, v1

    .line 169
    :goto_2
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "like"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    if-eqz v4, :cond_7

    const-string v5, "favon"

    :goto_3
    if-nez v0, :cond_8

    const-string v3, "Like indisponible"

    .line 172
    :goto_4
    iget-boolean v9, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v9, :cond_14

    if-nez v0, :cond_14

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iget-wide v12, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    sub-long/2addr v10, v12

    const-wide/16 v12, 0x960

    cmp-long v9, v10, v12

    if-gez v9, :cond_14

    move v9, v2

    .line 173
    :goto_5
    if-eqz v9, :cond_15

    const v5, 0x108005f

    :goto_6
    if-eqz v5, :cond_1

    invoke-virtual {p0, v5}, Lcom/melodix/music/PreviewPlayerMode;->setImageResource(I)V

    .line 174
    :cond_1
    if-nez v0, :cond_23

    new-instance v5, Ljava/lang/StringBuilder;

    if-eqz v9, :cond_16

    const-string v3, "Chargement : "

    :goto_7
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->reasonText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v10, "like"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    const-string v3, "Like"

    :goto_8
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v10, "shuffle"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    const-string v3, " ; n\u00e9cessite un contr\u00f4le et un \u00e9tat Spotify reconnus"

    :goto_9
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 175
    :goto_a
    if-eqz v4, :cond_1a

    const v3, -0x1fb762

    :goto_b
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setColorFilter(I)V

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v3, :cond_1b

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ", en attente"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_c
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerMode;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 176
    if-nez v0, :cond_2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v4, "shuffle"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-eqz v3, :cond_1c

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v4, "restriction"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    :cond_2
    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-nez v3, :cond_1c

    :goto_d
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerMode;->setEnabled(Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v2, "like"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v1, :cond_1d

    move v0, v6

    :goto_e
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->setAlpha(F)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->invalidate()V

    .line 177
    return-void

    :cond_3
    move v0, v2

    .line 164
    goto/16 :goto_0

    .line 166
    :cond_4
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->pendingState:Ljava/lang/String;

    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "false"

    goto/16 :goto_1

    :cond_5
    const-string v3, "unknown"

    goto/16 :goto_1

    :cond_6
    move v4, v2

    .line 167
    goto/16 :goto_2

    .line 169
    :cond_7
    const-string v5, "favoff"

    goto/16 :goto_3

    :cond_8
    if-eqz v4, :cond_9

    const-string v3, "Titre aim\u00e9"

    goto/16 :goto_4

    :cond_9
    const-string v3, "Ajouter aux titres lik\u00e9s"

    goto/16 :goto_4

    .line 170
    :cond_a
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v9, "shuffle"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    const-string v5, "mixed"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    const-string v5, "smart_shuffle"

    :goto_f
    const-string v9, "unknown"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const-string v3, "Al\u00e9atoire : \u00e9tat inconnu"

    goto/16 :goto_4

    :cond_b
    const-string v5, "shuffle"

    goto :goto_f

    :cond_c
    if-eqz v4, :cond_d

    const-string v3, "Lecture al\u00e9atoire activ\u00e9e"

    goto/16 :goto_4

    :cond_d
    const-string v3, "Lecture al\u00e9atoire d\u00e9sactiv\u00e9e"

    goto/16 :goto_4

    .line 171
    :cond_e
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v5, "mixed"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    const-string v5, "repone"

    :goto_10
    if-nez v0, :cond_11

    const-string v3, "R\u00e9p\u00e9tition indisponible"

    goto/16 :goto_4

    :cond_f
    if-eqz v4, :cond_10

    const-string v5, "repon"

    goto :goto_10

    :cond_10
    const-string v5, "repoff"

    goto :goto_10

    :cond_11
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->state:Ljava/lang/String;

    const-string v9, "mixed"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    const-string v3, "R\u00e9p\u00e9ter le titre"

    goto/16 :goto_4

    :cond_12
    if-eqz v4, :cond_13

    const-string v3, "R\u00e9p\u00e9ter la liste"

    goto/16 :goto_4

    :cond_13
    const-string v3, "R\u00e9p\u00e9tition d\u00e9sactiv\u00e9e"

    goto/16 :goto_4

    :cond_14
    move v9, v1

    .line 172
    goto/16 :goto_5

    .line 173
    :cond_15
    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerMode;->drawable(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_6

    .line 174
    :cond_16
    const-string v3, "Indisponible : "

    goto/16 :goto_7

    :cond_17
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerMode;->kind:Ljava/lang/String;

    const-string v10, "shuffle"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    const-string v3, "Al\u00e9atoire"

    goto/16 :goto_8

    :cond_18
    const-string v3, "R\u00e9p\u00e9tition"

    goto/16 :goto_8

    :cond_19
    const-string v3, ""

    goto/16 :goto_9

    .line 175
    :cond_1a
    const v3, -0x363f16

    goto/16 :goto_b

    :cond_1b
    move-object v3, v5

    goto/16 :goto_c

    :cond_1c
    move v2, v1

    .line 176
    goto/16 :goto_d

    :cond_1d
    if-eqz v0, :cond_1e

    move v0, v7

    goto/16 :goto_e

    :cond_1e
    move v0, v8

    goto/16 :goto_e

    :cond_1f
    if-nez v0, :cond_21

    if-eqz v9, :cond_20

    move v0, v6

    goto/16 :goto_e

    :cond_20
    move v0, v8

    goto/16 :goto_e

    :cond_21
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_22

    move v0, v6

    goto/16 :goto_e

    :cond_22
    move v0, v7

    goto/16 :goto_e

    :cond_23
    move-object v5, v3

    goto/16 :goto_a
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 87
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

    .line 88
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v2

    .line 87
    goto :goto_0

    .line 88
    :catch_0
    move-exception v0

    move-object v0, v2

    goto :goto_0
.end method

.method private reasonText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "page"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en cours de chargement"

    .line 161
    :goto_0
    return-object v0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "bar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "barre du lecteur Spotify absente ; lancer un titre"

    goto :goto_0

    .line 152
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "control"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "contr\u00f4le Spotify non reconnu ou absent"

    goto :goto_0

    .line 153
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "ambiguous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "plusieurs contr\u00f4les possibles"

    goto :goto_0

    .line 154
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "restriction"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "L\u2019al\u00e9atoire n\u2019est pas disponible avec ce compte ou cette lecture"

    goto :goto_0

    .line 155
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "disabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    goto :goto_0

    .line 156
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "menu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "menu de biblioth\u00e8que non v\u00e9rifi\u00e9"

    goto :goto_0

    .line 157
    :cond_6
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "identity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "titre ou identit\u00e9 non confirm\u00e9"

    goto :goto_0

    .line 158
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "command"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "commande indisponible"

    goto :goto_0

    .line 159
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "confirmation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "action non confirm\u00e9e"

    goto :goto_0

    .line 160
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    const-string v1, "web"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    goto/16 :goto_0

    .line 161
    :cond_a
    const-string v0, "\u00e9tat ou langue non reconnu"

    goto/16 :goto_0
.end method

.method private remember(Lorg/json/JSONObject;)V
    .locals 10

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->diagnosticIndex()I

    move-result v1

    if-gez v1, :cond_1

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 35
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "diagnostic"

    const-string v4, "{}"

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 36
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "structure"

    const-string v5, "{}"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 37
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x14

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "bar"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "view"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "nodes"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "playpause"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "repeat"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "shuffle"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "like"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string v7, "queue"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string v7, "volume"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string v7, "lyrics"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string v7, "connect"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string v7, "other"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "button"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, "switch"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, "slider"

    aput-object v7, v5, v6

    const/16 v6, 0xf

    const-string v7, "aria_shuffle"

    aput-object v7, v5, v6

    const/16 v6, 0x10

    const-string v7, "aria_like"

    aput-object v7, v5, v6

    const/16 v6, 0x11

    const-string v7, "aria_play"

    aput-object v7, v5, v6

    const/16 v6, 0x12

    const-string v7, "aria_pause"

    aput-object v7, v5, v6

    const/16 v6, 0x13

    const-string v7, "aria_other"

    aput-object v7, v5, v6

    .line 38
    array-length v6, v5

    :goto_1
    if-lt v0, v6, :cond_2

    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerMode;->structure:Ljava/lang/String;

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "\u00e9tat="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "state"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "true|false|mixed|unknown"

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 41
    const-string v3, ", motif="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "reason"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "control|page|absent|ambiguous|disabled|restriction|state|observed|unknown"

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 42
    const-string v3, ", commande="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "command"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "menu|unspecified|toggle|unknown"

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 43
    const-string v3, ", libell\u00e9="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "label"

    const-string v4, "unknown"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "on-action|off-action|unrecognized|absent|unknown"

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewPlayerMode;->allowed(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aput-object v0, v2, v1

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v2, :cond_0

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    aput-object v0, v2, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 45
    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    const-string v2, "observation indisponible"

    aput-object v2, v0, v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerMode;->pending:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/melodix/music/PreviewPlayerMode;->after:[Ljava/lang/String;

    sget-object v2, Lcom/melodix/music/PreviewPlayerMode;->last:[Ljava/lang/String;

    aget-object v2, v2, v1

    aput-object v2, v0, v1

    goto/16 :goto_0

    .line 38
    :cond_2
    :try_start_1
    aget-object v7, v5, v0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-lez v8, :cond_3

    const-string v8, ", "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v3, v7}, Lcom/melodix/music/PreviewPlayerMode;->count(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1
.end method

.method private sameNativeTitle(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 91
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v0, v1

    .line 93
    :goto_0
    return v0

    .line 92
    :cond_1
    const v2, 0x7f09023b

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 93
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

.method private shake()V
    .locals 4

    .prologue
    .line 118
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 124
    :goto_0
    return-void

    .line 119
    :cond_0
    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    .line 120
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 121
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerMode;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x46

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerMode$4;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerMode$4;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private sync()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 179
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

    .line 180
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    if-nez v3, :cond_2

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerMode;->running:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode;->visibleSince:J

    const-string v0, "web"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->reason:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->paint()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 182
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v2

    .line 179
    goto :goto_0

    .line 181
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

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerMode;->queryInFlight:Z

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

    .line 79
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerMode;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 81
    :goto_0
    return-object v1

    .line 80
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

    .line 81
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 183
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
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v2, 0x0

    .line 184
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

    .prologue
    .line 185
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

    .prologue
    .line 186
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerMode$8;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerMode$8;-><init>(Lcom/melodix/music/PreviewPlayerMode;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerMode;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
