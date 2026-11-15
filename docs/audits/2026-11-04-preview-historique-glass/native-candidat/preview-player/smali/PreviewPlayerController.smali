.class public final Lcom/melodix/music/PreviewPlayerController;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# static fields
.field private static final CORRECTION_MS:J = 0xfa0L

.field private static final DURATION:I = 0x7f09024b

.field private static final ELAPSED:I = 0x7f09024a

.field private static final FULL:I = 0x7f09023d

.field private static final FULL_BUTTON:I = 0x7f09023e

.field private static final MAX_STALE_MS:J = 0x5dcL

.field private static final MINI:I = 0x7f09024d

.field private static final MINI_BUTTON:I = 0x7f090238

.field private static final PAUSE_ICON:I = 0x7f080121

.field private static final PLAY_ICON:I = 0x7f080122

.field private static final RECONCILE_MS:J = 0x1f40L


# instance fields
.field private final activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private anchor:J

.field private base:D

.field private cachedDuration:J

.field private cachedElapsed:J

.field private cachedRemaining:J

.field private commandAt:J

.field private correction:D

.field private duration:J

.field private durationText:Ljava/lang/String;

.field private elapsedText:Ljava/lang/String;

.field private frameScheduled:Z

.field private final handler:Landroid/os/Handler;

.field private haveReal:Z

.field private intervalCount:I

.field private intervalIndex:I

.field private final intervals:[J

.field private moving:Z

.field private operation:I

.field private optimisticAt:J

.field private pending:Z

.field private pendingTarget:Z

.field private previousPosition:J

.field private previousProgressAt:J

.field private realPlaying:Z

.field private remainingText:Ljava/lang/String;

.field private serial:J

.field private shownPlaying:Z

.field private stateAt:J

.field private tapAt:J

.field private track:Ljava/lang/String;

.field private trackBefore:Ljava/lang/String;

.field private uiAt:J

.field private valid:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    .line 34
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 35
    const-string v0, "\ufffd\ufffd\ufffd"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const-string v0, "\ufffd\ufffd\ufffd"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v0, "Temps restant : \ufffd\ufffd\ufffd"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 39
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 40
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->previousProgressAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J

    .line 41
    const/16 v0, 0x3c

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 46
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 33
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method private static clock(J)Ljava/lang/String;
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const-wide/16 v6, 0x3c

    .line 56
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    invoke-static {v12, v13, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    rem-long v2, v0, v6

    div-long v4, v0, v6

    rem-long/2addr v4, v6

    const-wide/16 v6, 0xe10

    div-long/2addr v0, v6

    .line 57
    cmp-long v6, v0, v12

    if-lez v6, :cond_0

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v7, "%d:%02d:%02d"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v8, v9

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v8, v10

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v8, v11

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "%d:%02d"

    new-array v6, v11, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v6, v9

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v6, v10

    invoke-static {v0, v1, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private delta(J)Ljava/lang/String;
    .locals 5

    .prologue
    const-wide/16 v2, 0x0

    .line 172
    cmp-long v0, p1, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    :cond_0
    const-string v0, "\ufffd\ufffd\ufffd"

    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    sub-long v2, p1, v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private now()J
    .locals 2

    .prologue
    .line 47
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private position(J)D
    .locals 13

    .prologue
    const-wide/16 v0, 0x0

    const-wide/16 v4, 0x0

    .line 49
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v2, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 53
    :goto_0
    return-wide v0

    .line 50
    :cond_0
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v2, p1, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 51
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v6, :cond_1

    const-wide/16 v0, 0x5dc

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 52
    :cond_1
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    long-to-double v8, v0

    const-wide v10, 0x40af400000000000L    # 4000.0

    div-double/2addr v8, v10

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    mul-double/2addr v2, v6

    .line 53
    :goto_1
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v6, v6

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    long-to-double v0, v0

    add-double/2addr v0, v8

    add-double/2addr v0, v2

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    goto :goto_0

    :cond_2
    move-wide v2, v4

    .line 52
    goto :goto_1
.end method

.method private renderButtons()V
    .locals 4

    .prologue
    .line 96
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_1

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 97
    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_3

    const v1, 0x7f080121

    move v3, v1

    .line 98
    :goto_1
    const v1, 0x7f090238

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f09023e

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 99
    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 100
    :cond_2
    instance-of v0, v2, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, v2

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 97
    :cond_3
    const v1, 0x7f080122

    move v3, v1

    goto :goto_1
.end method

.method private renderProgress()V
    .locals 12

    .prologue
    .line 64
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 66
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 67
    const v1, 0x7f09024a

    const-string v2, "\ufffd\ufffd\ufffd"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    const-string v2, "\ufffd\ufffd\ufffd"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 68
    const v1, 0x7f09024d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v1, 0x7f09023d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 69
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 70
    if-nez v0, :cond_2

    const/4 v1, 0x0

    .line 71
    :goto_1
    instance-of v0, v1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    const-string v2, "Temps restant : \ufffd\ufffd\ufffd"

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    check-cast v1, Landroid/widget/TextView;

    const-string v0, "Temps restant : \ufffd\ufffd\ufffd"

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 70
    :cond_2
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 75
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-long v4, v4

    const-wide/16 v6, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v8, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 76
    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    const-wide/16 v10, 0x3e8

    div-long v10, v4, v10

    cmp-long v1, v8, v10

    if-eqz v1, :cond_4

    const-wide/16 v8, 0x3e8

    div-long v8, v4, v8

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    .line 77
    :cond_4
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    cmp-long v1, v4, v8

    if-eqz v1, :cond_5

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    const-wide/16 v8, 0x3e8

    div-long/2addr v4, v8

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    .line 78
    :cond_5
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    const-wide/16 v8, 0x3e8

    div-long v8, v6, v8

    cmp-long v1, v4, v8

    if-eqz v1, :cond_6

    const-wide/16 v4, 0x3e8

    div-long v4, v6, v4

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Temps restant : "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v7}, Lcom/melodix/music/PreviewPlayerController;->clock(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 79
    :cond_6
    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x3e8

    const-wide v8, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v8

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v8, v8

    div-double/2addr v2, v8

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    long-to-int v1, v2

    .line 80
    const v2, 0x7f09024d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v2, 0x7f09023d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 81
    const v1, 0x7f09024a

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 82
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 83
    if-nez v0, :cond_7

    const/4 v1, 0x0

    .line 84
    :goto_2
    instance-of v0, v1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    check-cast v1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 83
    :cond_7
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_2
.end method

.method private report()Ljava/lang/String;
    .locals 6

    .prologue
    .line 174
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gez v0, :cond_1

    const-string v0, "Appui : \ufffd\ufffd\ufffd\nCommande re\ufffd\ufffdue du pont : "

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    const-string v0, "\n\ufffd\ufffdtat du lecteur observ\ufffd\ufffd : "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    const-string v0, "\nInterface confirm\ufffd\ufffde : "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    const-string v0, "\nIntervalles position : "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v0, :cond_0

    const-string v0, "\ufffd\ufffd\ufffd"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget v2, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-lt v0, v2, :cond_2

    .line 186
    const-string v0, "\nLa r\ufffd\ufffdception du pont n\'est pas un accus\ufffd\ufffd Spotify ; le premier son n\'est pas mesur\ufffd\ufffd."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 175
    :cond_1
    const-string v0, "Appui : 0 ms\nCommande re\ufffd\ufffdue du pont : "

    goto :goto_0

    .line 182
    :cond_2
    if-lez v0, :cond_3

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    :cond_3
    iget v2, p0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget v3, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    sub-int/2addr v2, v3

    add-int/2addr v2, v0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v3, v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v3, v3

    rem-int/2addr v2, v3

    .line 184
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v2, v3, v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private scheduleFrame()V
    .locals 1

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 104
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 3

    .prologue
    const/16 v2, 0x3e8

    .line 88
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 89
    instance-of v1, v0, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 90
    check-cast v0, Landroid/widget/ProgressBar;

    .line 91
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 92
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v1

    if-eq v1, p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 94
    :cond_1
    return-void
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 60
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 61
    instance-of v0, v1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    :cond_0
    return-void
.end method


# virtual methods
.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 168
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 171
    return-void
.end method

.method public begin(I)V
    .locals 2

    .prologue
    .line 163
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 164
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 165
    return-void
.end method

.method public command()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 166
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    :cond_0
    return-void
.end method

.method public doFrame(J)V
    .locals 4

    .prologue
    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 107
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_1

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 110
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x5dc

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v2, v2

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    goto :goto_0
.end method

.method public showDiagnostics()V
    .locals 5

    .prologue
    .line 190
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 199
    :goto_0
    return-void

    .line 191
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 192
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 193
    const-string v3, "Copier"

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v4, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 198
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 22

    .prologue
    .line 114
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 115
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v8

    .line 116
    const-string v2, "playing"

    const/4 v3, 0x0

    invoke-virtual {v4, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 117
    const-string v2, "previewTrackUri"

    const-string v3, ""

    invoke-virtual {v4, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 118
    const-string v2, "previewPositionMs"

    const-wide/16 v6, -0x1

    invoke-virtual {v4, v2, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    const-string v2, "previewDurationMs"

    const-wide/16 v6, -0x1

    invoke-virtual {v4, v2, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 119
    const-string v2, "previewProgressValid"

    const/4 v3, 0x0

    invoke-virtual {v4, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    const-wide/16 v2, 0x0

    cmp-long v2, v14, v2

    if-lez v2, :cond_9

    const-wide/16 v2, 0x0

    cmp-long v2, v12, v2

    if-ltz v2, :cond_9

    cmp-long v2, v12, v14

    if-gtz v2, :cond_9

    const/4 v2, 0x1

    move v3, v2

    .line 120
    :goto_0
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v16

    .line 121
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v2, 0x0

    move v7, v2

    .line 122
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v2, :cond_b

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v2, :cond_b

    if-eqz v10, :cond_b

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_b

    if-nez v7, :cond_b

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_b

    const/4 v2, 0x1

    move v6, v2

    .line 123
    :goto_2
    if-eqz v3, :cond_c

    if-eqz v10, :cond_c

    if-nez v6, :cond_c

    const-string v2, "previewAdvancing"

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_c

    const/4 v2, 0x1

    move v5, v2

    .line 124
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v2, :cond_d

    if-eqz v3, :cond_d

    if-nez v7, :cond_d

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_d

    .line 125
    long-to-double v0, v12

    move-wide/from16 v18, v0

    sub-double v18, v16, v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->abs(D)D

    move-result-wide v18

    const-wide v20, 0x409f400000000000L    # 2000.0

    cmpl-double v2, v18, v20

    if-gtz v2, :cond_d

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v2, :cond_d

    if-eqz v5, :cond_d

    .line 124
    const/4 v2, 0x0

    move v4, v2

    .line 126
    :goto_4
    if-eqz v3, :cond_11

    .line 127
    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 128
    if-eqz v6, :cond_e

    const-wide/16 v2, 0x0

    long-to-double v14, v14

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->min(DD)D

    move-result-wide v14

    invoke-static {v2, v3, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    :goto_5
    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    .line 129
    if-nez v4, :cond_0

    if-eqz v6, :cond_10

    :cond_0
    const-wide/16 v2, 0x0

    :goto_6
    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 130
    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 131
    if-eqz v7, :cond_1

    const-wide/16 v2, -0x1

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousProgressAt:J

    const-wide/16 v2, -0x1

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J

    .line 132
    :cond_1
    if-eqz v10, :cond_2

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J

    cmp-long v2, v12, v2

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousProgressAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 133
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    move-object/from16 v0, p0

    iget v3, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->previousProgressAt:J

    sub-long v4, v8, v4

    aput-wide v4, v2, v3

    .line 134
    move-object/from16 v0, p0

    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v3, v3

    rem-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 135
    move-object/from16 v0, p0

    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v3, v3

    if-ge v2, v3, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 137
    :cond_2
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J

    cmp-long v2, v12, v2

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->previousProgressAt:J

    .line 139
    :cond_3
    :goto_7
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 140
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-ne v10, v2, :cond_4

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 141
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v2, :cond_5

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 142
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 143
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_8

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_8

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_8

    .line 144
    move-object/from16 v0, p0

    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_6

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-eq v10, v2, :cond_7

    :cond_6
    move-object/from16 v0, p0

    iget v2, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_8

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 145
    :cond_7
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 148
    :cond_8
    :goto_8
    return-void

    .line 119
    :cond_9
    const/4 v2, 0x0

    move v3, v2

    goto/16 :goto_0

    .line 121
    :cond_a
    const/4 v2, 0x1

    move v7, v2

    goto/16 :goto_1

    .line 122
    :cond_b
    const/4 v2, 0x0

    move v6, v2

    goto/16 :goto_2

    .line 123
    :cond_c
    const/4 v2, 0x0

    move v5, v2

    goto/16 :goto_3

    .line 124
    :cond_d
    const/4 v2, 0x1

    move v4, v2

    goto/16 :goto_4

    .line 128
    :cond_e
    if-eqz v4, :cond_f

    long-to-double v2, v12

    goto/16 :goto_5

    :cond_f
    const-wide/16 v2, 0x0

    long-to-double v14, v14

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->min(DD)D

    move-result-wide v14

    invoke-static {v2, v3, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    goto/16 :goto_5

    .line 129
    :cond_10
    long-to-double v2, v12

    sub-double v2, v2, v16

    goto/16 :goto_6

    .line 138
    :cond_11
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    const-wide/16 v2, -0x1

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousProgressAt:J

    const-wide/16 v2, -0x1

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/melodix/music/PreviewPlayerController;->previousPosition:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_7

    .line 147
    :catch_0
    move-exception v2

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    goto :goto_8
.end method

.method public tapPlayPause()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 150
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 151
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const/4 v2, -0x1

    .line 160
    :cond_0
    :goto_0
    return v2

    .line 152
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    .line 153
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_2

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->base:D

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 154
    :cond_2
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 155
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 156
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 157
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v3, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 159
    const-wide/16 v4, 0x1f40

    .line 157
    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 160
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_3
    move v0, v2

    .line 154
    goto :goto_1
.end method
