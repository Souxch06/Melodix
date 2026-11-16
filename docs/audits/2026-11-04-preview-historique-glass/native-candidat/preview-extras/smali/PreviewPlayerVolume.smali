.class public final Lcom/melodix/music/PreviewPlayerVolume;
.super Landroid/widget/Button;
.source "PreviewPlayerVolume.java"


# static fields
.field private static final SCRIPT:Ljava/lang/String; = "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\'));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: disabled ? \'disabled\' : list.length > 1 ? \'ambiguous\' : input ? \'range\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    var bar0 = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n    if (bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\'))) return JSON.stringify({ok: false, reason: \'disabled\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n"

.field private static lastAction:Ljava/lang/String;

.field private static lastPage:Ljava/lang/String;


# instance fields
.field private dialog:Landroid/app/Dialog;

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

.field private final tick:Ljava/lang/Runnable;

.field private valueLabel:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
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

    .line 31
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    .line 33
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    .line 34
    const/4 p1, -0x1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    .line 35
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

    .line 29
    iget-boolean p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    return p0
.end method

.method static synthetic access$100(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V

    return-void
.end method

.method static synthetic access$1000(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1202(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    sput-object p0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1300(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->method(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 0

    .line 29
    iget p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return p0
.end method

.method static synthetic access$1402(Lcom/melodix/music/PreviewPlayerVolume;I)I
    .locals 0

    .line 29
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return p1
.end method

.method static synthetic access$1500(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void
.end method

.method static synthetic access$1602(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    sput-object p0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1700(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1800(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static synthetic access$1802(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/SeekBar;)Landroid/widget/SeekBar;
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/os/Handler;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->enqueue(I)V

    return-void
.end method

.method static synthetic access$2102(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 29
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    return p1
.end method

.method static synthetic access$2202(Lcom/melodix/music/PreviewPlayerVolume;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$2402(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/Button;)Landroid/widget/Button;
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method static synthetic access$302(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 29
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    return p1
.end method

.method static synthetic access$400(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->send()V

    return-void
.end method

.method static synthetic access$500(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->open()V

    return-void
.end method

.method static synthetic access$600(Lcom/melodix/music/PreviewPlayerVolume;)J
    .locals 2

    .line 29
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    return-wide v0
.end method

.method static synthetic access$702(Lcom/melodix/music/PreviewPlayerVolume;Z)Z
    .locals 0

    .line 29
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    return p1
.end method

.method static synthetic access$800(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 0

    .line 29
    iget p0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return p0
.end method

.method static synthetic access$902(Lcom/melodix/music/PreviewPlayerVolume;I)I
    .locals 0

    .line 29
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return p1
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

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 p1, 0x42400000    # 48.0f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 100
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    if-eqz p3, :cond_0

    const p1, -0x9cca5e

    goto :goto_0

    :cond_0
    const p1, 0x21ffffff

    :goto_0
    const p2, 0x33ffffff

    const/high16 p3, 0x41800000    # 16.0f

    invoke-direct {p0, p1, p2, p3}, Lcom/melodix/music/PreviewPlayerVolume;->surface(IIF)Landroid/graphics/drawable/GradientDrawable;

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

    .line 39
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

    .line 37
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

    .line 82
    const/16 v0, 0x64

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

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

.method private static method(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 38
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

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v2, :cond_0

    goto/16 :goto_1

    .line 105
    :cond_0
    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Landroid/app/Dialog;

    invoke-direct {v3, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v3, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    .line 106
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-direct {v1, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    const/high16 v8, 0x41200000    # 10.0f

    invoke-direct {v1, v8}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v8

    invoke-direct {v1, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v9

    const/high16 v10, 0x41c00000    # 24.0f

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-virtual {v4, v7, v8, v9, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 107
    const v7, -0x14e8f4cd

    const v8, 0x1fffffff

    const/high16 v9, 0x41e00000    # 28.0f

    invoke-direct {v1, v7, v8, v9}, Lcom/melodix/music/PreviewPlayerVolume;->surface(IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v8, "\u2501\u2501\u2501\u2501"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v8, 0x41600000    # 14.0f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v8, 0x11

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    const v8, -0x77000001

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    const/4 v12, -0x1

    invoke-direct {v8, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v8, "Volume du lecteur"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v8, 0x41b00000    # 22.0f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x42200000    # 40.0f

    invoke-direct {v1, v11}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v8, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v8, "Le volume du t\u00e9l\u00e9phone reste inchang\u00e9"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v8, -0x384424

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v11, 0x41500000    # 13.0f

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x42100000    # 36.0f

    invoke-direct {v1, v13}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v13

    invoke-direct {v11, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v11, 0x41800000    # 16.0f

    invoke-direct {v1, v11}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v13

    const/high16 v14, 0x41400000    # 12.0f

    invoke-direct {v1, v14}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v15

    invoke-direct {v1, v11}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v1, v14}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    invoke-virtual {v7, v13, v15, v11, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v5, 0x1affffff

    const v11, 0x20ffffff

    invoke-direct {v1, v5, v11, v6}, Lcom/melodix/music/PreviewPlayerVolume;->surface(IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 112
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42400000    # 48.0f

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v6, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/16 v6, 0x64

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v6, v1, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const-string v6, "Volume du lecteur, de z\u00e9ro \u00e0 cent pour cent"

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const v6, -0x368509

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const v6, 0x55ffffff    # 3.518437E13f

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/16 v6, -0x1001

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v6, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 116
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v11, "0 %"

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v6, v14}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v13

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v11, v2, v13, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v11, "100 %"

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v6, v14}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v8, 0x5

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v8, v2, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v8

    invoke-direct {v6, v12, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v5, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-direct {v1, v14}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    const/high16 v8, 0x41000000    # 8.0f

    invoke-direct {v1, v8}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v10

    invoke-virtual {v5, v2, v7, v2, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 120
    const-string v7, "Silence"

    const/4 v10, 0x1

    invoke-direct {v1, v0, v7, v10}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v7

    iput-object v7, v1, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget-object v7, v1, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v10, v2, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    const-string v7, "Actualiser"

    invoke-direct {v1, v0, v7, v2}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v7

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v11

    invoke-direct {v10, v2, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-direct {v1, v8}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v8

    iput v8, v10, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v5, v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    iget v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {v1, v5}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    .line 123
    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v8, Lcom/melodix/music/PreviewPlayerVolume$7;

    invoke-direct {v8, v1}, Lcom/melodix/music/PreviewPlayerVolume$7;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v5, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v5, v1, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v8, Lcom/melodix/music/PreviewPlayerVolume$8;

    invoke-direct {v8, v1}, Lcom/melodix/music/PreviewPlayerVolume$8;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v5, v8}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 125
    new-instance v5, Lcom/melodix/music/PreviewPlayerVolume$9;

    invoke-direct {v5, v1}, Lcom/melodix/music/PreviewPlayerVolume$9;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v7, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    const-string v5, "Fermer"

    invoke-direct {v1, v0, v5, v2}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v0

    new-instance v5, Lcom/melodix/music/PreviewPlayerVolume$10;

    invoke-direct {v5, v1, v3}, Lcom/melodix/music/PreviewPlayerVolume$10;-><init>(Lcom/melodix/music/PreviewPlayerVolume;Landroid/app/Dialog;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v9}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-direct {v5, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 127
    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-direct {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume$11;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v3, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 128
    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {v3}, Landroid/app/Dialog;->dismiss()V

    return-void

    :cond_1
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v3, 0x50

    invoke-virtual {v0, v3}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {v0, v12, v6}, Landroid/view/Window;->setLayout(II)V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    iget v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :cond_2
    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_3

    iget-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v3, "Volume lecteur indisponible"

    invoke-static {v0, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 130
    :goto_0
    return-void

    .line 103
    :cond_4
    :goto_1
    return-void
.end method

.method private paint()V
    .locals 5

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-nez v1, :cond_0

    const-string v1, "\u25d6\u00d7"

    goto :goto_0

    :cond_0
    const-string v1, "\u25d6))"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v1, :cond_1

    const-string v1, "Volume"

    goto :goto_1

    :cond_1
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

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 59
    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 60
    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x400ccccd    # 2.2f

    invoke-direct {v2, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v3, 0x21

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v0, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 61
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->setText(Ljava/lang/CharSequence;)V

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

    .line 62
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

    .line 63
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_7

    .line 64
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const/4 v2, 0x1

    if-ltz v1, :cond_4

    move v1, v2

    goto :goto_4

    :cond_4
    move v1, v4

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v1, :cond_5

    move v4, v2

    :cond_5
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 65
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

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

    .line 66
    :cond_6
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_7

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    .line 68
    :cond_7
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

    .line 70
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

    .line 71
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

    .line 72
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->readAt:J

    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    .line 73
    :try_start_0
    const-string v5, "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\'));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: disabled ? \'disabled\' : list.length > 1 ? \'ambiguous\' : input ? \'range\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    var bar0 = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n    if (bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\'))) return JSON.stringify({ok: false, reason: \'disabled\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n(\"query\",0);"

    new-instance v6, Lcom/melodix/music/PreviewPlayerVolume$4;

    invoke-direct {v6, p0, v3, v4}, Lcom/melodix/music/PreviewPlayerVolume$4;-><init>(Lcom/melodix/music/PreviewPlayerVolume;J)V

    invoke-virtual {v0, v5, v6}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
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

    .line 80
    :goto_0
    return-void

    .line 71
    :cond_2
    :goto_1
    return-void
.end method

.method private static reasonText(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 41
    const-string v0, "absent"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "curseur Spotify absent"

    return-object p0

    .line 42
    :cond_0
    const-string v0, "ambiguous"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "plusieurs curseurs possibles"

    return-object p0

    .line 43
    :cond_1
    const-string v0, "disabled"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "curseur Spotify d\u00e9sactiv\u00e9"

    return-object p0

    .line 44
    :cond_2
    const-string v0, "range"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "valeur du curseur invalide"

    return-object p0

    .line 45
    :cond_3
    const-string v0, "command"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "commande non confirm\u00e9e"

    return-object p0

    .line 46
    :cond_4
    const-string p0, "page ou r\u00e9ponse inaccessible"

    return-object p0
.end method

.method private send()V
    .locals 7

    .line 84
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

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    .line 85
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v4

    if-nez v4, :cond_1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "web"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    const-string v0, "\u00e9chec"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void

    .line 86
    :cond_1
    const-string v5, "en attente"

    sput-object v5, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    .line 87
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\'));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: disabled ? \'disabled\' : list.length > 1 ? \'ambiguous\' : input ? \'range\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    var bar0 = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n    if (bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\'))) return JSON.stringify({ok: false, reason: \'disabled\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n(\"set\","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v5, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ");"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v5, Lcom/melodix/music/PreviewPlayerVolume$5;

    invoke-direct {v5, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerVolume$5;-><init>(Lcom/melodix/music/PreviewPlayerVolume;J)V

    invoke-virtual {v4, v0, v5}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    goto :goto_0

    :catch_0
    move-exception v0

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

    .line 93
    :goto_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerVolume$6;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerVolume$6;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 94
    :cond_2
    return-void

    .line 84
    :cond_3
    :goto_1
    return-void
.end method

.method private showValue(I)V
    .locals 3

    .line 81
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

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-nez p1, :cond_1

    const-string p1, "R\u00e9activer"

    goto :goto_0

    :cond_1
    const-string p1, "Silence"

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method private surface(IIF)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 96
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-direct {p0, p3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method private sync()V
    .locals 5

    .line 131
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

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

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

    .line 132
    invoke-super {p0}, Landroid/widget/Button;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 5

    .line 133
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, -0x1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 134
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

    .line 135
    invoke-super {p0, p1}, Landroid/widget/Button;->onWindowVisibilityChanged(I)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/melodix/music/PreviewPlayerVolume$13;

    invoke-direct {p1, p0}, Lcom/melodix/music/PreviewPlayerVolume$13;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
