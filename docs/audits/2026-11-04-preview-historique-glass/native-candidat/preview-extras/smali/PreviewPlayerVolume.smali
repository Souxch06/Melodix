.class public final Lcom/melodix/music/PreviewPlayerVolume;
.super Landroid/widget/Button;
.source "PreviewPlayerVolume.java"


# static fields
.field private static final SCRIPT:Ljava/lang/String; = "(function(action, requested) {\n    \'use strict\';\n    // Only a uniquely identified native range inside Spotify\'s volume-bar.\n    // No session data, network, Android audio or synthetic playback command.\n    var nodes=Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n){return n.isConnected;});\n    if(nodes.length!==1)return JSON.stringify({ok:false,reason:nodes.length?\'ambiguous\':\'absent\'});\n    var input=nodes[0];if(input.disabled||input.getAttribute(\'aria-disabled\')===\'true\')return JSON.stringify({ok:false,reason:\'disabled\'});\n    var min=input.hasAttribute(\'min\')?Number(input.min):0, max=input.hasAttribute(\'max\')?Number(input.max):100, current=Number(input.value);\n    if(!isFinite(min)||!isFinite(max)||max<=min||!isFinite(current)||current<min||current>max)return JSON.stringify({ok:false,reason:\'range\'});\n    if(action===\'query\')return JSON.stringify({ok:true,percent:Math.round(100*(current-min)/(max-min))});\n    if(action!==\'set\'||!isFinite(Number(requested))||Number(requested)<0||Number(requested)>100)return JSON.stringify({ok:false,reason:\'request\'});\n    try{\n        var value=min+(max-min)*Number(requested)/100;\n        var setter=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,\'value\').set;\n        setter.call(input,String(value));input.dispatchEvent(new Event(\'input\',{bubbles:true}));input.dispatchEvent(new Event(\'change\',{bubbles:true}));\n        return JSON.stringify({ok:true,sent:true});\n    }catch(_){return JSON.stringify({ok:false,reason:\'command\'});}\n})\n"


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

.field private running:Z

.field private sendScheduled:Z

.field private final sendTask:Ljava/lang/Runnable;

.field private serial:J

.field private slider:Landroid/widget/SeekBar;

.field private final tick:Ljava/lang/Runnable;

.field private valueLabel:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 37
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    .line 32
    const-wide/16 v0, -0x3e8

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastSent:J

    .line 33
    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    iput v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    .line 35
    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$1;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->tick:Ljava/lang/Runnable;

    .line 36
    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$2;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendTask:Ljava/lang/Runnable;

    .line 37
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
    .line 31
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->read()V

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 33
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return-void
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerVolume;)Z
    .locals 1

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    return v0
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/widget/SeekBar;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerVolume;)I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->lastNonZero:I

    return v0
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->enqueue(I)V

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerVolume;Z)V
    .locals 0

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerVolume;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerVolume;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/SeekBar;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    return-void
.end method

.method static synthetic access$22(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$23(Lcom/melodix/music/PreviewPlayerVolume;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    return-void
.end method

.method static synthetic access$24(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerVolume;Z)V
    .locals 0

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->sendScheduled:Z

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->send()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->open()V

    return-void
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerVolume;)J
    .locals 2

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerVolume;Z)V
    .locals 0

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerVolume;I)V
    .locals 0

    .prologue
    .line 33
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 39
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

.method private dp(F)I
    .locals 2

    .prologue
    .line 38
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
    .line 54
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

.method private open()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 63
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v1, :cond_1

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    :try_start_0
    new-instance v1, Landroid/app/Dialog;

    invoke-direct {v1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v3

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 66
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v4, -0x14e8f4cd

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    const v5, 0x1fffffff

    invoke-virtual {v3, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v4, 0x41e00000    # 28.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 67
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v4, "Volume du lecteur"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->valueLabel:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42300000    # 44.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    new-instance v3, Landroid/widget/SeekBar;

    invoke-direct {v3, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const/16 v4, 0x64

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    iget v4, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    const-string v4, "Volume du lecteur, de z\u00e9ro \u00e0 cent pour cent"

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    const/high16 v4, 0x42400000    # 48.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setMinHeight(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerVolume;->showValue(I)V

    .line 71
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$7;

    invoke-direct {v4, p0}, Lcom/melodix/music/PreviewPlayerVolume$7;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume;->slider:Landroid/widget/SeekBar;

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$8;

    invoke-direct {v4, p0}, Lcom/melodix/music/PreviewPlayerVolume$8;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 73
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "Fermer"

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x42400000    # 48.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setMinHeight(I)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$9;

    invoke-direct {v0, p0, v1}, Lcom/melodix/music/PreviewPlayerVolume$9;-><init>(Lcom/melodix/music/PreviewPlayerVolume;Landroid/app/Dialog;)V

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerVolume;->dp(F)I

    move-result v5

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$10;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$10;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 75
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 76
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    :cond_2
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Volume lecteur indisponible"

    invoke-static {v0, v1, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 75
    :cond_3
    :try_start_1
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private paint()V
    .locals 2

    .prologue
    .line 42
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_0

    const-string v0, "\u25d6))\nVolume \u2014"

    :goto_0
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setText(Ljava/lang/CharSequence;)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_2

    const-string v0, "Volume du lecteur indisponible"

    :goto_1
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-ltz v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setEnabled(Z)V

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-gez v0, :cond_4

    const v0, 0x3ee66666    # 0.45f

    :goto_3
    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->setAlpha(F)V

    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    if-nez v0, :cond_1

    const-string v0, "\u25d6\u00d7"

    :goto_4
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\nVolume "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " %"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "\u25d6))"

    goto :goto_4

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Volume du lecteur : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pour cent"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2

    :cond_4
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_3
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 41
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

.method private read()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    .line 44
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_1

    iput v8, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 45
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

    .line 46
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->readAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume;->serial:J

    .line 47
    :try_start_0
    const-string v1, "(function(action, requested) {\n    \'use strict\';\n    // Only a uniquely identified native range inside Spotify\'s volume-bar.\n    // No session data, network, Android audio or synthetic playback command.\n    var nodes=Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n){return n.isConnected;});\n    if(nodes.length!==1)return JSON.stringify({ok:false,reason:nodes.length?\'ambiguous\':\'absent\'});\n    var input=nodes[0];if(input.disabled||input.getAttribute(\'aria-disabled\')===\'true\')return JSON.stringify({ok:false,reason:\'disabled\'});\n    var min=input.hasAttribute(\'min\')?Number(input.min):0, max=input.hasAttribute(\'max\')?Number(input.max):100, current=Number(input.value);\n    if(!isFinite(min)||!isFinite(max)||max<=min||!isFinite(current)||current<min||current>max)return JSON.stringify({ok:false,reason:\'range\'});\n    if(action===\'query\')return JSON.stringify({ok:true,percent:Math.round(100*(current-min)/(max-min))});\n    if(action!==\'set\'||!isFinite(Number(requested))||Number(requested)<0||Number(requested)>100)return JSON.stringify({ok:false,reason:\'request\'});\n    try{\n        var value=min+(max-min)*Number(requested)/100;\n        var setter=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,\'value\').set;\n        setter.call(input,String(value));input.dispatchEvent(new Event(\'input\',{bubbles:true}));input.dispatchEvent(new Event(\'change\',{bubbles:true}));\n        return JSON.stringify({ok:true,sent:true});\n    }catch(_){return JSON.stringify({ok:false,reason:\'command\'});}\n})\n(\"query\",0);"

    new-instance v4, Lcom/melodix/music/PreviewPlayerVolume$4;

    invoke-direct {v4, p0, v2, v3}, Lcom/melodix/music/PreviewPlayerVolume$4;-><init>(Lcom/melodix/music/PreviewPlayerVolume;J)V

    invoke-virtual {v0, v1, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->readBusy:Z

    iput v8, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_0
.end method

.method private send()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 56
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->running:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->queued:I

    if-gez v0, :cond_1

    .line 61
    :cond_0
    :goto_0
    return-void

    .line 56
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

    .line 57
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->web()Landroid/webkit/WebView;

    move-result-object v1

    if-nez v1, :cond_2

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_0

    .line 58
    :cond_2
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "(function(action, requested) {\n    \'use strict\';\n    // Only a uniquely identified native range inside Spotify\'s volume-bar.\n    // No session data, network, Android audio or synthetic playback command.\n    var nodes=Array.from(document.querySelectorAll(\'[data-testid=\"volume-bar\"] input[type=\"range\"], input[data-testid=\"volume-bar\"][type=\"range\"]\')).filter(function(n){return n.isConnected;});\n    if(nodes.length!==1)return JSON.stringify({ok:false,reason:nodes.length?\'ambiguous\':\'absent\'});\n    var input=nodes[0];if(input.disabled||input.getAttribute(\'aria-disabled\')===\'true\')return JSON.stringify({ok:false,reason:\'disabled\'});\n    var min=input.hasAttribute(\'min\')?Number(input.min):0, max=input.hasAttribute(\'max\')?Number(input.max):100, current=Number(input.value);\n    if(!isFinite(min)||!isFinite(max)||max<=min||!isFinite(current)||current<min||current>max)return JSON.stringify({ok:false,reason:\'range\'});\n    if(action===\'query\')return JSON.stringify({ok:true,percent:Math.round(100*(current-min)/(max-min))});\n    if(action!==\'set\'||!isFinite(Number(requested))||Number(requested)<0||Number(requested)>100)return JSON.stringify({ok:false,reason:\'request\'});\n    try{\n        var value=min+(max-min)*Number(requested)/100;\n        var setter=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,\'value\').set;\n        setter.call(input,String(value));input.dispatchEvent(new Event(\'input\',{bubbles:true}));input.dispatchEvent(new Event(\'change\',{bubbles:true}));\n        return JSON.stringify({ok:true,sent:true});\n    }catch(_){return JSON.stringify({ok:false,reason:\'command\'});}\n})\n(\"set\","

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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

    .line 60
    :goto_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dragging:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/melodix/music/PreviewPlayerVolume$6;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerVolume$6;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 59
    :catch_0
    move-exception v0

    iput v6, p0, Lcom/melodix/music/PreviewPlayerVolume;->percent:I

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_1
.end method

.method private showValue(I)V
    .locals 3

    .prologue
    .line 53
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

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume;->mute:Landroid/widget/Button;

    if-nez p1, :cond_2

    const-string v0, "R\u00e9activer"

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void

    :cond_2
    const-string v0, "Silence"

    goto :goto_0
.end method

.method private sync()V
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v6, -0x1

    const/4 v2, 0x0

    .line 78
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

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->paint()V

    goto :goto_1
.end method

.method private web()Landroid/webkit/WebView;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 40
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
    .line 79
    invoke-super {p0}, Landroid/widget/Button;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerVolume;->sync()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 80
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

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 81
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$11;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$11;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 82
    invoke-super {p0, p1}, Landroid/widget/Button;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerVolume$12;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerVolume$12;-><init>(Lcom/melodix/music/PreviewPlayerVolume;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerVolume;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
