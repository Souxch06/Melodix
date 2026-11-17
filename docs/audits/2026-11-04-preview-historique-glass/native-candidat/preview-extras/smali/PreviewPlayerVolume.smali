.class public final Lcom/melodix/music/PreviewPlayerVolume;
.super Landroid/widget/Button;
.source "PreviewPlayerVolume.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;
    }
.end annotation


# static fields
.field private static final SCRIPT:Ljava/lang/String; = "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\'));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: disabled ? \'disabled\' : list.length > 1 ? \'ambiguous\' : input ? \'range\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    var bar0 = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n    if (bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\'))) return JSON.stringify({ok: false, reason: \'disabled\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n"

.field private static lastAction:Ljava/lang/String;

.field private static lastPage:Ljava/lang/String;


# instance fields
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

    .prologue
    .line 44
    const-string v0, "non observ\u00e9e"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    const-string v0, "aucune"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 59
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 39
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    .line 41
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    .line 42
    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    .line 43
    const-string v0, "page non accessible"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    .line 57
    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$1;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    .line 58
    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$2;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setEnabled(Z)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$3;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$3;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerVolume;)Z
    .locals 1

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return v0
.end method

.method static synthetic access$11(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$14(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 44
    sput-object p0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$15(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->method(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 42
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void
.end method

.method static synthetic access$18(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerVolume;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$19(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 44
    sput-object p0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return v0
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    return-void
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 125
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->enqueue(I)V

    return-void
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerVolume;Z)V
    .locals 0

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    return-void
.end method

.method static synthetic access$25(Lcom/melodix/music/PreviewPlayerVolume;Lcom/melodix/music/PreviewPlayerSheet;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    return-void
.end method

.method static synthetic access$26(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/SeekBar;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-void
.end method

.method static synthetic access$27(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$28(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$29(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerVolume;Z)V
    .locals 0

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    return-void
.end method

.method static synthetic access$30(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 191
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->send()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 151
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->open()V

    return-void
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerVolume;)J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerVolume;Z)V
    .locals 0

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 42
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return-void
.end method

.method private action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;
    .locals 2

    .prologue
    .line 148
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 149
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-direct {p0, p3}, Lcom/melodix/music/PreviewPlayerVolume;->pill(Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-lt v0, v3, :cond_1

    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "aucune"

    :goto_1
    return-object v0

    :cond_1
    aget-char v4, v2, v0

    const/16 v5, 0x61

    if-lt v4, v5, :cond_2

    const/16 v5, 0x7a

    if-le v4, v5, :cond_3

    :cond_2
    const/16 v5, 0x3a

    if-eq v4, v5, :cond_3

    const/16 v5, 0x3e

    if-eq v4, v5, :cond_3

    const/16 v5, 0x2d

    if-ne v4, v5, :cond_4

    :cond_3
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const/16 v5, 0x50

    if-gt v4, v5, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 2

    .prologue
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\nVolume lecteur \u2014 page : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

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
    .locals 2

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private enqueue(I)V
    .locals 8

    .prologue
    .line 125
    const/4 v0, 0x0

    const/16 v1, 0x64

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    const-wide/16 v0, 0x0

    const-wide/16 v2, 0x64

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    sub-long/2addr v4, v6

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private iconLabel(Ljava/lang/String;II)Ljava/lang/CharSequence;
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v6, 0x0

    const/high16 v3, 0x41900000    # 18.0f

    .line 113
    new-instance v2, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v0

    invoke-direct {v2, v0, p2, p3}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;-><init>(III)V

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v0

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v3

    invoke-virtual {v2, v6, v6, v0, v3}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->setBounds(IIII)V

    .line 114
    new-instance v3, Landroid/text/SpannableString;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "\ufffc  "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 116
    new-instance v4, Landroid/text/style/ImageSpan;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1d

    if-lt v0, v5, :cond_0

    const/4 v0, 0x2

    :goto_0
    invoke-direct {v4, v2, v0}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    const/16 v0, 0x21

    invoke-virtual {v3, v4, v6, v1, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    return-object v3

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private static method(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    const-string v0, "range"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "curseur"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "pointer"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "pointeur sur la barre"

    goto :goto_0

    :cond_1
    const-string v0, "media"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "\u00e9l\u00e9ment audio"

    goto :goto_0

    :cond_2
    const-string v0, "keyboard"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "clavier Ctrl (non v\u00e9rifi\u00e9)"

    goto :goto_0

    :cond_3
    const-string v0, "inconnue"

    goto :goto_0
.end method

.method private open()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 152
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v1, :cond_1

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    :try_start_0
    new-instance v1, Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {v1, v0}, Lcom/melodix/music/PreviewPlayerSheet;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    .line 155
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 156
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v4, 0x41e00000    # 28.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    int-to-float v4, v4

    const/16 v5, 0x8

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v4, v5, v6

    const/4 v6, 0x1

    aput v4, v5, v6

    const/4 v6, 0x2

    aput v4, v5, v6

    const/4 v6, 0x3

    aput v4, v5, v6

    const/4 v4, 0x4

    const/4 v6, 0x0

    aput v6, v5, v4

    const/4 v4, 0x5

    const/4 v6, 0x0

    aput v6, v5, v4

    const/4 v4, 0x6

    const/4 v6, 0x0

    aput v6, v5, v4

    const/4 v4, 0x7

    const/4 v6, 0x0

    aput v6, v5, v4

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 157
    const/4 v4, 0x2

    new-array v4, v4, [I

    fill-array-data v4, :array_0

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    const v5, 0x24ffffff

    invoke-virtual {v3, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 158
    const/high16 v3, 0x41b00000    # 22.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v3

    const/4 v4, 0x0

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 160
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v4, "Glisser vers le bas pour fermer"

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 161
    new-instance v4, Landroid/view/View;

    invoke-direct {v4, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v5, 0x66ffffff

    const v6, 0xffffff

    const v7, 0x4479c000    # 999.0f

    invoke-direct {p0, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerVolume;->surface(IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42100000    # 36.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    const/high16 v7, 0x40800000    # 4.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerSheet;->dragListener()Landroid/view/View$OnTouchListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42000000    # 32.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 164
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 165
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "LECTEUR"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41200000    # 10.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const v6, -0x4a5c2e

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/high16 v8, 0x41900000    # 18.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v8

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "Volume du lecteur"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, 0x0

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 169
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x429c0000    # 78.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    const-string v4, "\u00d7"

    const/4 v5, 0x0

    invoke-direct {p0, v0, v4, v5}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v4

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setMinWidth(I)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setMinimumWidth(I)V

    const-string v5, "Fermer le panneau de volume"

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v5, Lcom/melodix/music/PreviewPlayerVolume$7;

    invoke-direct {v5, p0, v1}, Lcom/melodix/music/PreviewPlayerVolume$7;-><init>(Lcom/melodix/music/PreviewPlayerVolume;Lcom/melodix/music/PreviewPlayerSheet;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42200000    # 40.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const-string v4, "Le volume du t\u00e9l\u00e9phone reste inchang\u00e9"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const v4, -0x485533

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42080000    # 34.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v4, 0x41400000    # 12.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    const/high16 v5, 0x40800000    # 4.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    const/high16 v6, 0x41400000    # 12.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    const/high16 v7, 0x41000000    # 8.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v4, 0xcffffff

    const v5, 0x16ffffff

    const/high16 v6, 0x41900000    # 18.0f

    invoke-direct {p0, v4, v5, v6}, Lcom/melodix/music/PreviewPlayerVolume;->surface(IIF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 174
    new-instance v4, Landroid/widget/SeekBar;

    invoke-direct {v4, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/16 v5, 0x64

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/4 v5, 0x0

    iget v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const-string v5, "Volume du lecteur, de z\u00e9ro \u00e0 cent pour cent"

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 175
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const v5, -0x466a13

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const v5, 0x33ffffff

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/4 v5, -0x1

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 177
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "0 %"

    const/4 v7, 0x0

    const v8, -0x43512b

    invoke-direct {p0, v6, v7, v8}, Lcom/melodix/music/PreviewPlayerVolume;->iconLabel(Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v6, -0x485533

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41300000    # 11.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/high16 v8, 0x41c00000    # 24.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "100 %"

    const/4 v7, 0x1

    const v8, -0x43512b

    invoke-direct {p0, v6, v7, v8}, Lcom/melodix/music/PreviewPlayerVolume;->iconLabel(Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v6, -0x485533

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41300000    # 11.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v6, 0x5

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/high16 v8, 0x41c00000    # 24.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v7, 0x41c00000    # 24.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 179
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v4, 0x0

    const/high16 v5, 0x41600000    # 14.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 181
    const-string v4, "Silence"

    const/4 v5, 0x1

    invoke-direct {p0, v0, v4, v5}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, 0x0

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    const-string v4, "Actualiser"

    const/4 v5, 0x0

    invoke-direct {p0, v0, v4, v5}, Lcom/melodix/music/PreviewPlayerVolume;->action(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v0

    const-string v4, "Actualiser"

    const/4 v5, 0x2

    const/4 v6, -0x1

    invoke-direct {p0, v4, v5, v6}, Lcom/melodix/music/PreviewPlayerVolume;->iconLabel(Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v4, "Actualiser le volume du lecteur"

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v4, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v5, 0x41000000    # 8.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v3, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    const/4 v3, 0x0

    iget v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    .line 184
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$8;

    invoke-direct {v4, p0}, Lcom/melodix/music/PreviewPlayerVolume$8;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$9;

    invoke-direct {v4, p0}, Lcom/melodix/music/PreviewPlayerVolume$9;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 186
    new-instance v3, Lcom/melodix/music/PreviewPlayerVolume$10;

    invoke-direct {v3, p0}, Lcom/melodix/music/PreviewPlayerVolume$10;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setCanceledOnTouchOutside(Z)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$11;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v1, v0}, Lcom/melodix/music/PreviewPlayerSheet;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 188
    invoke-virtual {v1, v2}, Lcom/melodix/music/PreviewPlayerSheet;->showSheet(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 189
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    :cond_2
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Volume lecteur indisponible"

    invoke-static {v0, v1, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 157
    :array_0
    .array-data 4
        -0xdfe8d1
        -0xeef1e7
    .end array-data
.end method

.method private paint()V
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-nez v0, :cond_1

    const-string v0, "\u25d6\u00d7"

    :goto_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_2

    const-string v0, "Volume"

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 67
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 68
    new-instance v4, Landroid/text/style/RelativeSizeSpan;

    const v5, 0x400ccccd    # 2.2f

    invoke-direct {v4, v5}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v5, 0xa

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v5, 0x21

    invoke-virtual {v3, v4, v2, v0, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 69
    invoke-virtual {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->setText(Ljava/lang/CharSequence;)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Volume du lecteur indisponible : "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 70
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setEnabled(Z)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_4

    const v0, 0x3f19999a    # 0.6f

    :goto_3
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setAlpha(F)V

    .line 71
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 72
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v0, :cond_5

    move v0, v1

    :goto_4
    invoke-virtual {v3, v0}, Landroid/widget/SeekBar;->setEnabled(Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v3, :cond_6

    :goto_5
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 73
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_7

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const-string v1, "\u2014"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Indisponible : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    :cond_0
    :goto_6
    return-void

    .line 66
    :cond_1
    const-string v0, "\u25d6))"

    goto/16 :goto_0

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " %"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 69
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Volume du lecteur : "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " pour cent"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 70
    :cond_4
    const/high16 v0, 0x3f800000    # 1.0f

    goto/16 :goto_3

    :cond_5
    move v0, v2

    .line 72
    goto :goto_4

    :cond_6
    move v1, v2

    goto :goto_5

    .line 74
    :cond_7
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->statusLabel:Landroid/widget/TextView;

    const-string v1, "Le volume du t\u00e9l\u00e9phone reste inchang\u00e9"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_8
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    goto :goto_6
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 63
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

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v2

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v2

    goto :goto_0
.end method

.method private pill(Z)Landroid/graphics/drawable/GradientDrawable;
    .locals 3

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 143
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, 0x4479c000    # 999.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 144
    if-eqz p1, :cond_0

    const v1, -0xa8be84

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v1

    const v2, 0x45bca2ed

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 145
    :goto_0
    return-object v0

    .line 144
    :cond_0
    const v1, 0xcffffff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v1

    const v2, 0x20ffffff

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    goto :goto_0
.end method

.method private read()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    .line 78
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iput v8, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "web"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    .line 88
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v1, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    if-eqz v1, :cond_2

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->readAt:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x960

    cmp-long v1, v4, v6

    if-ltz v1, :cond_0

    .line 80
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->readAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    .line 81
    :try_start_0
    const-string v1, "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\'));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: disabled ? \'disabled\' : list.length > 1 ? \'ambiguous\' : input ? \'range\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    var bar0 = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n    if (bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\'))) return JSON.stringify({ok: false, reason: \'disabled\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n(\"query\",0);"

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$4;

    invoke-direct {v4, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerVolume$4;-><init>(Lcom/melodix/music/PreviewPlayerVolume;J)V

    invoke-virtual {v0, v1, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput v8, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "web"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastPage:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_0
.end method

.method private static reasonText(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    const-string v0, "absent"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "curseur Spotify absent"

    .line 54
    :goto_0
    return-object v0

    .line 50
    :cond_0
    const-string v0, "ambiguous"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "plusieurs curseurs possibles"

    goto :goto_0

    .line 51
    :cond_1
    const-string v0, "disabled"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "curseur Spotify d\u00e9sactiv\u00e9"

    goto :goto_0

    .line 52
    :cond_2
    const-string v0, "range"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "valeur du curseur invalide"

    goto :goto_0

    .line 53
    :cond_3
    const-string v0, "command"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "commande non confirm\u00e9e"

    goto :goto_0

    .line 54
    :cond_4
    const-string v0, "page ou r\u00e9ponse inaccessible"

    goto :goto_0
.end method

.method private send()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 127
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v0, :cond_1

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 127
    :cond_1
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    .line 128
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v1

    if-nez v1, :cond_2

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "web"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    const-string v0, "\u00e9chec"

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_0

    .line 129
    :cond_2
    const-string v4, "en attente"

    sput-object v4, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    .line 130
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "(function(action, requested) {\n    \'use strict\';\n    // Spotify player volume only; never Android audio, session data or network.\n    // Methods in order, each verified by reading the value again:\n    // (a) native range setter + input/change, (b) pointer on the volume track,\n    // (c) volume of the page\'s own media element.\n    var journal = [];\n    function ranges() {\n        return Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n) { return n.isConnected; });\n    }\n    function readRange(input) {\n        if (!input) return null;\n        var min = input.hasAttribute(\'min\') ? Number(input.min) : 0, max = input.hasAttribute(\'max\') ? Number(input.max) : 100, current = Number(input.value);\n        if (!isFinite(min) || !isFinite(max) || max <= min || !isFinite(current) || current < min || current > max) return null;\n        return {percent: Math.round(100 * (current - min) / (max - min)), min: min, max: max};\n    }\n    function media() {\n        return Array.from(document.querySelectorAll(\'audio, video\')).filter(function(m) { return typeof m.volume === \'number\' && isFinite(m.volume); });\n    }\n    var list = ranges(), input = list.length === 1 ? list[0] : null;\n    var disabled = input && (input.disabled || input.matches(\':disabled\') || input.closest(\'[aria-disabled=\"true\"]\'));\n    var current = disabled ? null : readRange(input);\n    if (action === \'query\') {\n        if (current) return JSON.stringify({ok: true, percent: current.percent, method: \'range\'});\n        var players = media();\n        if (players.length === 1) return JSON.stringify({ok: true, percent: Math.round(players[0].volume * 100), method: \'media\'});\n        return JSON.stringify({ok: false, reason: disabled ? \'disabled\' : list.length > 1 ? \'ambiguous\' : input ? \'range\' : \'absent\'});\n    }\n    var target = Number(requested);\n    if (action !== \'set\' || !isFinite(target) || target < 0 || target > 100) return JSON.stringify({ok: false, reason: \'request\'});\n    // Never act on a disabled, duplicated or out-of-range Spotify control.\n    if (disabled) return JSON.stringify({ok: false, reason: \'disabled\'});\n    if (list.length > 1) return JSON.stringify({ok: false, reason: \'ambiguous\'});\n    if (input && !current) return JSON.stringify({ok: false, reason: \'range\'});\n    var bar0 = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n    if (bar0 && (bar0.getAttribute(\'aria-disabled\') === \'true\' || bar0.closest(\'[aria-disabled=\"true\"], fieldset:disabled\'))) return JSON.stringify({ok: false, reason: \'disabled\'});\n    function near(p) { return p !== null && Math.abs(p - target) <= 2; }\n    function done(method) { return JSON.stringify({ok: true, sent: true, method: method, journal: journal.join(\'>\')}); }\n    // (a) native setter on the unique range.\n    if (current) {\n        try {\n            var value = current.min + (current.max - current.min) * target / 100;\n            var setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, \'value\').set;\n            setter.call(input, String(value));\n            input.dispatchEvent(new Event(\'input\', {bubbles: true}));\n            input.dispatchEvent(new Event(\'change\', {bubbles: true}));\n            var after = readRange(input);\n            if (near(after ? after.percent : null)) { journal.push(\'a:ok\'); return done(\'range\'); }\n            journal.push(\'a:unchanged\');\n        } catch (_) { journal.push(\'a:error\'); }\n    } else journal.push(disabled ? \'a:disabled\' : \'a:absent\');\n    // (b) pointer press at the target position on the visible track.\n    try {\n        var bar = document.querySelector(\'[data-testid=\"volume-bar\"]\');\n        var track = bar && (bar.querySelector(\'[data-testid=\"progress-bar\"]\') || bar.querySelector(\'[role=\"slider\"]\') || bar);\n        var box = track ? track.getBoundingClientRect() : null;\n        if (box && box.width > 4) {\n            var x = box.left + box.width * target / 100, y = box.top + box.height / 2;\n            var base = {bubbles: true, cancelable: true, clientX: x, clientY: y, button: 0, buttons: 1, pointerId: 1, pointerType: \'mouse\', isPrimary: true};\n            var Pointer = typeof PointerEvent === \'function\' ? PointerEvent : MouseEvent;\n            track.dispatchEvent(new Pointer(\'pointerdown\', base));\n            track.dispatchEvent(new MouseEvent(\'mousedown\', base));\n            document.dispatchEvent(new Pointer(\'pointerup\', base));\n            document.dispatchEvent(new MouseEvent(\'mouseup\', base));\n            var again = readRange(input || (ranges()[0] || null));\n            if (near(again ? again.percent : null)) { journal.push(\'b:ok\'); return done(\'pointer\'); }\n            journal.push(\'b:unchanged\');\n        } else journal.push(\'b:no-track\');\n    } catch (_) { journal.push(\'b:error\'); }\n    // (c) the page\'s own media element(s).\n    try {\n        var players = media();\n        if (players.length) {\n            players.forEach(function(m) { m.volume = target / 100; });\n            if (players.every(function(m) { return Math.abs(m.volume * 100 - target) <= 1; })) { journal.push(\'c:ok\'); return done(\'media\'); }\n            journal.push(\'c:unchanged\');\n        } else journal.push(\'c:absent\');\n    } catch (_) { journal.push(\'c:error\'); }\n    // (d) web-player keyboard volume (Ctrl+Up/Down, mute Ctrl+Shift+Down):\n    // unverifiable, so reported as sent only, never as a confirmed value.\n    try {\n        var from = Number(arguments[2]);\n        var target2 = document.body;\n        var send = function(code, shift) {\n            [\'keydown\', \'keyup\'].forEach(function(type) {\n                target2.dispatchEvent(new KeyboardEvent(type, {key: code, code: code, ctrlKey: true, shiftKey: !!shift, bubbles: true, cancelable: true}));\n            });\n        };\n        if (target === 0) { send(\'ArrowDown\', true); journal.push(\'d:ctrl-shift-down\'); return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')}); }\n        if (isFinite(from) && from >= 0) {\n            var steps = Math.min(10, Math.round(Math.abs(target - from) / 10));\n            for (var k = 0; k < steps; k++) send(target > from ? \'ArrowUp\' : \'ArrowDown\', false);\n            journal.push(\'d:ctrl-\' + (target > from ? \'up\' : \'down\') + \'x\' + steps);\n            if (steps) return JSON.stringify({ok: true, sent: true, unverified: true, method: \'keyboard\', journal: journal.join(\'>\')});\n        } else journal.push(\'d:no-start\');\n    } catch (_) { journal.push(\'d:error\'); }\n    return JSON.stringify({ok: false, reason: \'command\', journal: journal.join(\'>\')});\n})\n(\"set\","

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

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

    invoke-direct {v4, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerVolume$5;-><init>(Lcom/melodix/music/PreviewPlayerVolume;J)V

    invoke-virtual {v1, v0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerVolume$6;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerVolume$6;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    const-string v0, "command"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u00e9chec : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->reason:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/PreviewPlayerVolume;->lastAction:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_1
.end method

.method private showValue(I)V
    .locals 4

    .prologue
    .line 119
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " %"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_1

    .line 121
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-nez p1, :cond_2

    const-string v0, "R\u00e9activer"

    move-object v1, v0

    :goto_0
    if-nez p1, :cond_3

    const/4 v0, 0x1

    :goto_1
    const/4 v3, -0x1

    invoke-direct {p0, v1, v0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->iconLabel(Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-nez p1, :cond_4

    const-string v0, "R\u00e9activer le volume du lecteur"

    :goto_2
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 124
    :cond_1
    return-void

    .line 121
    :cond_2
    const-string v0, "Silence"

    move-object v1, v0

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 122
    :cond_4
    const-string v0, "Mettre le lecteur en silence"

    goto :goto_2
.end method

.method private surface(IIF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .prologue
    .line 139
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-direct {p0, p3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method private sync()V
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v6, -0x1

    const/4 v2, 0x0

    .line 191
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-nez v3, :cond_2

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_1
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->activity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
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

    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 192
    invoke-super {p0}, Landroid/widget/Button;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 193
    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    :cond_0
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 194
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$12;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$12;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 195
    invoke-super {p0, p1}, Landroid/widget/Button;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$13;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$13;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
