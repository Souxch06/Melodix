.class public final Lcom/melodix/music/PreviewPlayerVolume;
.super Landroid/widget/Button;
.source "PreviewPlayerVolume.java"


# static fields
.field private static final SCRIPT:Ljava/lang/String; = "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each re-reading a DOM value where possible. This does\n    // not verify the player backend or audible output:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    function hidden(n) {\n        for (var el = n; el && el !== document.body; el = el.parentElement) {\n            var cs = window.getComputedStyle(el);\n            if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\') === \'true\' || cs.display === \'none\' || cs.visibility === \'hidden\') return true;\n        }\n        return false;\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var bars = Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"]\')).filter(function(n) { return n.isConnected; });\n    var bar0 = bars.length === 1 ? bars[0] : null;\n    var disabled = !!(input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\') || hidden(input))) || !!(bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || hidden(bar0)));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (list.length > 1 || bars.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n        if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n        if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: players.length > 1 ? \'ambiguous\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1 || bars.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, unverified: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = bar0;\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\', journal: journal.join(\'>\')});\n        if (players.length === 1) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n"

.field private static lastAction:Ljava/lang/String;

.field private static lastPage:Ljava/lang/String;


# instance fields
.field private commandAt:J

.field private commandPending:Z

.field private commandSerial:J

.field private dialog:Lcom/melodix/music/PreviewPlayerSheet;

.field private dragging:Z

.field private final handler:Landroid/os/Handler;

.field private lastNonZero:I

.field private lastSent:J

.field private mute:Landroid/widget/Button;

.field private percent:I

.field private queued:I

.field private readAt:J

.field private readBusy:Z

.field private reason:Ljava/lang/String;

.field private running:Z

.field private sendScheduled:Z

.field private final sendTask:Ljava/lang/Runnable;

.field private serial:J

.field private slider:Landroid/widget/SeekBar;

.field private statusLabel:Landroid/widget/TextView;

.field private final tick:Ljava/lang/Runnable;

.field private valueLabel:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const-string v0, "non observ\u00e9e"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    const-string v0, "aucune"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 51
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 28
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    .line 32
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    .line 33
    const/4 p1, -0x1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    .line 34
    const-string p1, "page non accessible"

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    .line 49
    new-instance p1, Lcom/melodix/music/PreviewPlayerVolume$1;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerVolume$1;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    .line 50
    new-instance p1, Lcom/melodix/music/PreviewPlayerVolume$2;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerVolume$2;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    .line 51
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->setEnabled(Z)V

    new-instance p1, Lcom/melodix/music/PreviewPlayerVolume$3;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerVolume$3;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/melodix/music/PreviewPlayerVolume;)Z
    .locals 0

    .line 26
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    return p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerVolume;)Z
    .locals 0

    .line 26
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    return p0
.end method

.method static synthetic access$1002(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    return p1
.end method

.method static synthetic access$102(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 0

    .line 26
    iget p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return p0
.end method

.method static synthetic access$1202(Lcom/melodix/music/PreviewPlayerVolume;I)I
    .locals 0

    .line 26
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return p1
.end method

.method static synthetic access$1300(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1400(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1502(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    sput-object p0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1600(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->method(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 0

    .line 26
    iget p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return p0
.end method

.method static synthetic access$1702(Lcom/melodix/music/PreviewPlayerVolume;I)I
    .locals 0

    .line 26
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return p1
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerVolume;)J
    .locals 2

    .line 26
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerVolume;)J
    .locals 2

    .line 26
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandAt:J

    return-wide v0
.end method

.method static synthetic access$2000(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2100(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static synthetic access$2102(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/SeekBar;)Landroid/widget/SeekBar;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    return-void
.end method

.method static synthetic access$2300(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->enqueue(I)V

    return-void
.end method

.method static synthetic access$2402(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    return p1
.end method

.method static synthetic access$2502(Lcom/melodix/music/PreviewPlayerVolume;Lcom/melodix/music/PreviewPlayerSheet;)Lcom/melodix/music/PreviewPlayerSheet;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    return-object p1
.end method

.method static synthetic access$2602(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$2702(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$2802(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/Button;)Landroid/widget/Button;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    return-object p1
.end method

.method static synthetic access$2900(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method static synthetic access$302(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    sput-object p0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V

    return-void
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/os/Handler;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$602(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    return p1
.end method

.method static synthetic access$700(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->send()V

    return-void
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->open()V

    return-void
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerVolume;)J
    .locals 2

    .line 26
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    return-wide v0
.end method

.method private action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;
    .locals 1

    .line 99
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 p1, 0x42400000    # 48.0f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 100
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/melodix/music/PreviewPlayerSheet;->actionBackground(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 3

    .line 53
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_2

    instance-of v2, v0, Landroid/app/Activity;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    :cond_0
    move-object v2, v0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, v0, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

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

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-char v3, p0, v2

    const/16 v4, 0x61

    if-lt v3, v4, :cond_0

    const/16 v4, 0x7a

    if-le v3, v4, :cond_1

    :cond_0
    const/16 v4, 0x3a

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3e

    if-eq v3, v4, :cond_1

    const/16 v4, 0x2d

    if-ne v3, v4, :cond_2

    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v4, 0x50

    if-le v3, v4, :cond_3

    goto :goto_1

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_5

    const-string p0, "aucune"

    goto :goto_2

    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_2
    return-object p0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 2

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nVolume lecteur \u2014 page : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; action : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ; son non v\u00e9rifi\u00e9"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private dp(F)I
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getResources()Landroid/content/res/Resources;

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

.method private enqueue(I)V
    .locals 4

    .line 85
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    const/16 v1, 0x64

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x64

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private interruptCommand()V
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    if-eqz v0, :cond_0

    const-string v0, "non confirm\u00e9e : interruption"

    :goto_0
    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    goto :goto_1

    :cond_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-ltz v0, :cond_1

    const-string v0, "non envoy\u00e9e : interruption"

    goto :goto_0

    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    return-void
.end method

.method private static method(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 37
    const-string v0, "range"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "curseur"

    goto :goto_0

    :cond_0
    const-string v0, "pointer"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "pointeur sur la barre"

    goto :goto_0

    :cond_1
    const-string v0, "media"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "\u00e9l\u00e9ment audio"

    goto :goto_0

    :cond_2
    const-string v0, "keyboard"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "clavier Ctrl (non v\u00e9rifi\u00e9)"

    goto :goto_0

    :cond_3
    const-string p0, "inconnue"

    :goto_0
    return-object p0
.end method

.method private open()V
    .locals 16

    .line 103
    move-object/from16 v1, p0

    const-string v0, "Actualiser"

    const-string v2, ""

    const-string v3, "sans-serif-medium"

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->activity()Landroid/app/Activity;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_3

    invoke-virtual {v4}, Landroid/app/Activity;->isDestroyed()Z

    move-result v5

    if-nez v5, :cond_3

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v5, :cond_0

    goto/16 :goto_1

    .line 105
    :cond_0
    const/4 v6, 0x0

    :try_start_0
    new-instance v7, Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {v7, v4}, Lcom/melodix/music/PreviewPlayerSheet;-><init>(Landroid/app/Activity;)V

    iput-object v7, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    .line 106
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 107
    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerSheet;->background(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    const/high16 v10, 0x41b00000    # 22.0f

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v10

    const/high16 v12, 0x41c00000    # 24.0f

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v13

    invoke-virtual {v8, v11, v6, v10, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 110
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v11, 0x11

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v13, "Glisser vers le bas pour fermer"

    invoke-virtual {v10, v13}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 111
    new-instance v13, Landroid/view/View;

    invoke-direct {v13, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v14, 0xffffff

    const v15, 0x4479c000    # 999.0f

    const v12, 0x66ffffff

    invoke-static {v4, v12, v14, v15}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-virtual {v13, v12}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42100000    # 36.0f

    invoke-direct {v1, v14}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v14

    const/high16 v15, 0x40800000    # 4.0f

    invoke-direct {v1, v15}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    invoke-direct {v12, v14, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v13, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    invoke-virtual {v7}, Lcom/melodix/music/PreviewPlayerSheet;->dragListener()Landroid/view/View$OnTouchListener;

    move-result-object v5

    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42000000    # 32.0f

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v12

    const/4 v13, -0x1

    invoke-direct {v5, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v10, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v10, 0x10

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 114
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 115
    new-instance v12, Landroid/widget/TextView;

    invoke-direct {v12, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v14, "LECTEUR"

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v14, 0x41200000    # 10.0f

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTextSize(F)V

    const v14, -0x66000001

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x41900000    # 18.0f

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v14

    invoke-direct {v15, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v12, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    new-instance v12, Landroid/widget/TextView;

    invoke-direct {v12, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v14, "Volume du lecteur"

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v14, 0x41a00000    # 20.0f

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {v3, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const v14, -0x43dc28f6    # -0.01f

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setLetterSpacing(F)V

    const/4 v14, 0x2

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setMaxLines(I)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    invoke-direct {v15, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v12, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v12, v6, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v10, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const/high16 v12, 0x41d00000    # 26.0f

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v10, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    invoke-static {v3, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 119
    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x429c0000    # 78.0f

    invoke-direct {v1, v11}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    const/high16 v12, 0x42400000    # 48.0f

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v15

    invoke-direct {v10, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    invoke-direct {v1, v4, v2, v6}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v3

    const/4 v10, 0x3

    const v11, -0x33000001    # -1.3421772E8f

    invoke-static {v4, v2, v10, v11}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setMinimumWidth(I)V

    const-string v2, "Fermer le panneau de volume"

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/melodix/music/PreviewPlayerVolume$7;

    invoke-direct {v2, v1, v7}, Lcom/melodix/music/PreviewPlayerVolume$7;-><init>(Lcom/melodix/music/PreviewPlayerVolume;Lcom/melodix/music/PreviewPlayerSheet;)V

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42200000    # 40.0f

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v10

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v2, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const-string v3, "Le volume du t\u00e9l\u00e9phone reste inchang\u00e9"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const v3, -0x66000001

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42080000    # 34.0f

    invoke-direct {v1, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    invoke-direct {v3, v13, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-direct {v1, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    const/high16 v10, 0x40800000    # 4.0f

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v10

    invoke-direct {v1, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v3

    const/high16 v11, 0x41000000    # 8.0f

    invoke-direct {v1, v11}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v15

    invoke-virtual {v2, v5, v10, v3, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v3, 0xcffffff

    const v5, 0x16ffffff

    invoke-static {v4, v3, v5, v9}, Lcom/melodix/music/PreviewPlayerSheet;->surface(Landroid/content/Context;IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 124
    new-instance v3, Landroid/widget/SeekBar;

    invoke-direct {v3, v4}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/16 v5, 0x64

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const-string v5, "Volume du lecteur, de z\u00e9ro \u00e0 cent pour cent"

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    invoke-static {v3}, Lcom/melodix/music/PreviewUiRestyle;->volumeBar(Landroid/widget/SeekBar;)V

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v9

    invoke-direct {v5, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 127
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v9, "0 %"

    const v10, -0x66000001

    invoke-static {v4, v9, v6, v10}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v9, 0x41300000    # 11.0f

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x41c00000    # 24.0f

    invoke-direct {v1, v15}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v10, v6, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v10, "100 %"

    const v11, -0x66000001

    const/4 v15, 0x1

    invoke-static {v4, v10, v15, v11}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v9, 0x5

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x41c00000    # 24.0f

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v9, v6, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x41c00000    # 24.0f

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v9

    invoke-direct {v5, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-direct {v1, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v3

    invoke-virtual {v2, v6, v3, v6, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 131
    const-string v3, "Silence"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v3, v5}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v9

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    invoke-direct {v1, v4, v0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v3

    const/4 v5, 0x2

    invoke-static {v4, v0, v5, v13}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v0, "Actualiser le volume du lecteur"

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v12}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v0, v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v4, 0x41000000    # 8.0f

    invoke-direct {v1, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v2, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    iget v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    .line 134
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v2, Lcom/melodix/music/PreviewPlayerVolume$8;

    invoke-direct {v2, v1}, Lcom/melodix/music/PreviewPlayerVolume$8;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v2, Lcom/melodix/music/PreviewPlayerVolume$9;

    invoke-direct {v2, v1}, Lcom/melodix/music/PreviewPlayerVolume$9;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 136
    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$10;

    invoke-direct {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume$10;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setCanceledOnTouchOutside(Z)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-direct {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume$11;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v7, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 138
    invoke-virtual {v7, v8}, Lcom/melodix/music/PreviewPlayerSheet;->showSheet(Landroid/view/View;)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    iget v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_1

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :cond_1
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_2

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Volume lecteur indisponible"

    invoke-static {v0, v2, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 140
    :goto_0
    return-void

    .line 103
    :cond_3
    :goto_1
    return-void
.end method

.method private paint()V
    .locals 6

    .line 58
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v1, :cond_0

    const-string v1, "Volume"

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " %"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    iget v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    move v2, v4

    :goto_1
    const v5, -0x4b513b

    invoke-static {v0, v1, v2, v5}, Lcom/melodix/music/PreviewPanelIcon;->tile(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setText(Ljava/lang/CharSequence;)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Volume du lecteur indisponible : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    goto :goto_2

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Volume du lecteur : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pour cent"

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 59
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setEnabled(Z)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_3

    const v0, 0x3f19999a    # 0.6f

    goto :goto_3

    :cond_3
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_3
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setAlpha(F)V

    .line 60
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    .line 61
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v1, :cond_4

    move v1, v4

    goto :goto_4

    :cond_4
    move v1, v3

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v1, :cond_5

    move v3, v4

    :cond_5
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 62
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const-string v1, "\u2014"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Indisponible : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 63
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_8

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const-string v1, "Le volume du t\u00e9l\u00e9phone reste inchang\u00e9"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_7
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    .line 65
    :cond_8
    :goto_5
    return-void
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 55
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

.method private read()V
    .locals 9

    .line 67
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "web"

    const/4 v2, -0x1

    if-nez v0, :cond_0

    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void

    .line 68
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v5, :cond_2

    iget v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v5, :cond_2

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    if-eqz v5, :cond_1

    iget-wide v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->readAt:J

    sub-long v5, v3, v5

    const-wide/16 v7, 0x960

    cmp-long v5, v5, v7

    if-gez v5, :cond_1

    goto :goto_1

    .line 69
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->readAt:J

    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    .line 70
    :try_start_0
    const-string v5, "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each re-reading a DOM value where possible. This does\n    // not verify the player backend or audible output:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    function hidden(n) {\n        for (var el = n; el && el !== document.body; el = el.parentElement) {\n            var cs = window.getComputedStyle(el);\n            if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\') === \'true\' || cs.display === \'none\' || cs.visibility === \'hidden\') return true;\n        }\n        return false;\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var bars = Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"]\')).filter(function(n) { return n.isConnected; });\n    var bar0 = bars.length === 1 ? bars[0] : null;\n    var disabled = !!(input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\') || hidden(input))) || !!(bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || hidden(bar0)));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (list.length > 1 || bars.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n        if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n        if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: players.length > 1 ? \'ambiguous\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1 || bars.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, unverified: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = bar0;\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\', journal: journal.join(\'>\')});\n        if (players.length === 1) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n(\"query\",0);"

    new-instance v6, Lcom/melodix/music/PreviewPlayerVolume$4;

    invoke-direct {v6, p0, v3, v4}, Lcom/melodix/music/PreviewPlayerVolume$4;-><init>(Lcom/melodix/music/PreviewPlayerVolume;J)V

    invoke-virtual {v0, v5, v6}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    .line 77
    :goto_0
    return-void

    .line 68
    :cond_2
    :goto_1
    return-void
.end method

.method private static reasonText(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 40
    const-string v0, "absent"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "curseur Spotify absent"

    return-object p0

    .line 41
    :cond_0
    const-string v0, "ambiguous"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "plusieurs curseurs possibles"

    return-object p0

    .line 42
    :cond_1
    const-string v0, "disabled"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "curseur Spotify d\u00e9sactiv\u00e9"

    return-object p0

    .line 43
    :cond_2
    const-string v0, "range"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "valeur du curseur invalide"

    return-object p0

    .line 44
    :cond_3
    const-string v0, "command"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "commande non confirm\u00e9e"

    return-object p0

    .line 45
    :cond_4
    const-string p0, "page ou r\u00e9ponse inaccessible"

    return-object p0
.end method

.method private send()V
    .locals 12

    .line 87
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v4, 0x1

    add-long v10, v2, v4

    iput-wide v10, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    .line 88
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v3

    if-nez v3, :cond_1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "web"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    const-string v0, "\u00e9chec"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void

    .line 89
    :cond_1
    const-string v4, "en attente"

    sput-object v4, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandAt:J

    .line 90
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each re-reading a DOM value where possible. This does\n    // not verify the player backend or audible output:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    function hidden(n) {\n        for (var el = n; el && el !== document.body; el = el.parentElement) {\n            var cs = window.getComputedStyle(el);\n            if (el.hasAttribute(\'hidden\') || el.getAttribute(\'aria-hidden\') === \'true\' || cs.display === \'none\' || cs.visibility === \'hidden\') return true;\n        }\n        return false;\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var bars = Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"]\')).filter(function(n) { return n.isConnected; });\n    var bar0 = bars.length === 1 ? bars[0] : null;\n    var disabled = !!(input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\') || hidden(input))) || !!(bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\') || hidden(bar0)));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (list.length > 1 || bars.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n        if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n        if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: players.length > 1 ? \'ambiguous\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1 || bars.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, unverified: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = bar0;\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\', journal: journal.join(\'>\')});\n        if (players.length === 1) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n(\"set\","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ");"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$5;

    move-object v6, v4

    move-object v7, p0

    invoke-direct/range {v6 .. v11}, Lcom/melodix/music/PreviewPlayerVolume$5;-><init>(Lcom/melodix/music/PreviewPlayerVolume;JJ)V

    invoke-virtual {v3, v0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_0

    :catch_0
    move-exception v0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandPending:Z

    iput v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "command"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u00e9chec : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    .line 96
    :goto_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerVolume$6;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerVolume$6;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 97
    :cond_2
    return-void

    .line 87
    :cond_3
    :goto_1
    return-void
.end method

.method private showValue(I)V
    .locals 5

    .line 79
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " %"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_4

    .line 81
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v1

    if-nez p1, :cond_1

    const-string v2, "R\u00e9activer"

    goto :goto_0

    :cond_1
    const-string v2, "Silence"

    :goto_0
    if-nez p1, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    const/4 v4, -0x1

    invoke-static {v1, v2, v3, v4}, Lcom/melodix/music/PreviewPanelIcon;->label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-nez p1, :cond_3

    const-string p1, "R\u00e9activer le volume du lecteur"

    goto :goto_2

    :cond_3
    const-string p1, "Mettre le lecteur en silence"

    :goto_2
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 84
    :cond_4
    return-void
.end method

.method private sync()V
    .locals 5

    .line 142
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->isAttachedToWindow()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-nez v3, :cond_1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_1
    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-eqz v0, :cond_3

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v3, 0x1

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->interruptCommand()V

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    iput v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_2
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    :cond_3
    :goto_1
    return-void
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .line 54
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->activity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

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

    move-object v1, v0

    :cond_1
    return-object v1

    :catch_0
    move-exception v0

    return-object v1
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    .line 143
    invoke-super {p0}, Landroid/widget/Button;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 5

    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->commandSerial:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->interruptCommand()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, -0x1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_0
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 145
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerVolume$12;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerVolume$12;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 146
    invoke-super {p0, p1}, Landroid/widget/Button;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerVolume$13;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerVolume$13;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
