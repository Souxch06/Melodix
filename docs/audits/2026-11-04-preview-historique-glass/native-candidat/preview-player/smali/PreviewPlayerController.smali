.class public final Lcom/melodix/music/PreviewPlayerController;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;
.implements Ljava/lang/Runnable;


# static fields
.field private static final CORRECTION_MS:J = 0xfa0L

.field private static final DURATION:I = 0x7f09024b

.field private static final ELAPSED:I = 0x7f09024a

.field private static final FULL:I = 0x7f09023d

.field private static final FULL_BUTTON:I = 0x7f09023e

.field private static final MINI:I = 0x7f09024d

.field private static final MINI_BUTTON:I = 0x7f090238

.field private static final PAUSE_ICON:I = 0x7f080121

.field private static final PLAY_ICON:I = 0x7f080122

.field private static final RECONCILE_MS:J = 0x1f40L

.field private static firstCreateAt:J

.field private static firstHomeFrameMs:J

.field private static processHomeFrameMs:J

.field private static processStartAt:J


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

.field private bridgeAt:J

.field private cachedDuration:J

.field private cachedElapsed:J

.field private cachedRemaining:J

.field private commandAt:J

.field private correction:D

.field private duration:J

.field private durationText:Ljava/lang/String;

.field private elapsedText:Ljava/lang/String;

.field private foreground:Z

.field private frameAt:J

.field private frameScheduled:Z

.field private final glow:[Landroid/animation/ObjectAnimator;

.field private final glowFill:[Landroid/graphics/drawable/Drawable;

.field private glowSampleValid:Z

.field private final handler:Landroid/os/Handler;

.field private haveReal:Z

.field private identityArtist:Ljava/lang/String;

.field private identityDuration:J

.field private identityTitle:Ljava/lang/String;

.field private intervalCount:I

.field private intervalIndex:I

.field private final intervals:[J

.field private loadStage:Ljava/lang/String;

.field private measureHomeFrame:Z

.field private measurePlaylistFrame:Z

.field private measurementAt:J

.field private measurementPosition:J

.field private moving:Z

.field private navigationAt:J

.field private operation:I

.field private optimisticAt:J

.field private pageReadyAt:J

.field private pending:Z

.field private pendingPlaylist:Ljava/lang/String;

.field private pendingTarget:Z

.field private playbackState:Ljava/lang/String;

.field private playlistFrameMs:J

.field private playlistStart:J

.field private progressSource:Ljava/lang/String;

.field private realPlaying:Z

.field private remainingText:Ljava/lang/String;

.field private rowsAt:J

.field private serial:J

.field private shownPlaying:Z

.field private stageAtRows:Ljava/lang/String;

.field private stateAt:J

.field private tapAt:J

.field private final trace:[Ljava/lang/String;

.field private traceCount:I

.field private traceIndex:I

.field private traceScheduled:Z

.field private traceStart:J

.field private track:Ljava/lang/String;

.field private trackBefore:Ljava/lang/String;

.field private tupleIdentity:Z

.field private uiAt:J

.field private valid:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const-wide/16 v0, -0x1

    .line 64
    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const-wide/16 v2, -0x1

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    .line 40
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedElapsed:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->cachedRemaining:J

    .line 41
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    const-string v0, "Temps restant : \u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 44
    const-string v0, "none"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    .line 49
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 50
    const/16 v0, 0x78

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    .line 52
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 55
    new-array v0, v4, [Landroid/animation/ObjectAnimator;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    .line 56
    new-array v0, v4, [Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    .line 58
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    .line 59
    const/16 v0, 0x3c

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    .line 62
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 66
    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 72
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    .line 73
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 82
    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    .line 120
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerController;)J
    .locals 2

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    return-wide v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerController;)Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    return v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerController;Z)V
    .locals 0

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 223
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    return-void
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0

    .prologue
    .line 194
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    return-void
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method private static clock(J)Ljava/lang/String;
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const-wide/16 v6, 0x3c

    .line 133
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    invoke-static {v12, v13, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    rem-long v2, v0, v6

    div-long v4, v0, v6

    rem-long/2addr v4, v6

    const-wide/16 v6, 0xe10

    div-long/2addr v0, v6

    .line 134
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

    .line 363
    cmp-long v0, p1, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    :cond_0
    const-string v0, "\u2014"

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

.method private dominantPhase()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v4, 0x0

    const-wide/16 v10, 0x0

    .line 380
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    .line 381
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-gez v0, :cond_1

    :cond_0
    const-string v0, "ind\u00e9termin\u00e9e (phases manquantes)"

    .line 387
    :goto_0
    return-object v0

    .line 382
    :cond_1
    const/4 v0, 0x4

    new-array v5, v0, [J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long/2addr v0, v2

    aput-wide v0, v5, v4

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_2

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    sub-long/2addr v0, v2

    :goto_1
    aput-wide v0, v5, v7

    .line 383
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v10

    if-ltz v0, :cond_3

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    :goto_2
    sub-long v0, v2, v0

    aput-wide v0, v5, v8

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    sub-long/2addr v0, v2

    aput-wide v0, v5, v9

    .line 384
    const/4 v0, 0x4

    new-array v6, v0, [Ljava/lang/String;

    const-string v0, "attente pont"

    aput-object v0, v6, v4

    const-string v0, "navigation \u2192 page pr\u00eate"

    aput-object v0, v6, v7

    const-string v0, "page/pont \u2192 lignes"

    aput-object v0, v6, v8

    const-string v0, "lignes \u2192 frame"

    aput-object v0, v6, v9

    .line 385
    const-wide/16 v2, -0x1

    const-string v0, "ind\u00e9termin\u00e9e"

    move v1, v4

    .line 386
    :goto_3
    array-length v4, v5

    if-lt v1, v4, :cond_4

    .line 387
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " (phases observ\u00e9es uniquement)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 382
    :cond_2
    const-wide/16 v0, -0x1

    goto :goto_1

    .line 383
    :cond_3
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_2

    .line 386
    :cond_4
    aget-wide v8, v5, v1

    cmp-long v4, v8, v10

    if-ltz v4, :cond_5

    aget-wide v8, v5, v1

    cmp-long v4, v8, v2

    if-lez v4, :cond_5

    aget-wide v2, v5, v1

    aget-object v0, v6, v1

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method private now()J
    .locals 2

    .prologue
    .line 121
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private phaseDuration(JJ)Ljava/lang/String;
    .locals 5

    .prologue
    .line 376
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    cmp-long v0, p3, p1

    if-gez v0, :cond_1

    :cond_0
    const-string v0, "\u2014"

    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    sub-long v2, p3, p1

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

.method private position(J)D
    .locals 13

    .prologue
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    .line 123
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 130
    :goto_0
    return-wide v0

    .line 124
    :cond_0
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    sub-long v0, p1, v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 125
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v6, :cond_1

    .line 128
    :goto_1
    const-wide v2, 0x40af400000000000L    # 4000.0

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    neg-double v6, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    const-wide/high16 v8, 0x3ff4000000000000L    # 1.25

    mul-double/2addr v6, v8

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 129
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v6, :cond_2

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    long-to-double v10, v0

    div-double v2, v10, v2

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    mul-double/2addr v2, v6

    .line 130
    :goto_2
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

    :cond_1
    move-wide v0, v2

    .line 125
    goto :goto_1

    :cond_2
    move-wide v2, v4

    .line 129
    goto :goto_2
.end method

.method private progressStopReason()Ljava/lang/String;
    .locals 4

    .prologue
    .line 365
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_0

    const-string v0, "\u00e9tat du lecteur indisponible"

    .line 373
    :goto_0
    return-object v0

    .line 366
    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_1

    const-string v0, "pause demand\u00e9e"

    goto :goto_0

    .line 367
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "\u00e9tat ind\u00e9termin\u00e9, aucun signal audio fiable"

    goto :goto_0

    .line 368
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const-string v1, "paused"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "lecture en pause"

    goto :goto_0

    .line 369
    :cond_3
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-nez v0, :cond_4

    const-string v0, "identit\u00e9 titre/artiste/dur\u00e9e absente"

    goto :goto_0

    .line 370
    :cond_4
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-nez v0, :cond_5

    const-string v0, "position ou dur\u00e9e indisponible"

    goto :goto_0

    .line 371
    :cond_5
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_6

    const-string v0, "mouvement arr\u00eat\u00e9"

    goto :goto_0

    .line 372
    :cond_6
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v2, v2

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_7

    const-string v0, "fin du titre"

    goto :goto_0

    .line 373
    :cond_7
    const-string v0, "animation active"

    goto :goto_0
.end method

.method private static realMetadata(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 250
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "No Track"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 251
    const-string v0, "No Artist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucun titre"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 252
    const-string v0, "Lecture arr\u00eat\u00e9e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Aucune lecture en cours"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private renderButtons()V
    .locals 4

    .prologue
    .line 224
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v1, :cond_1

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 225
    :cond_1
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_3

    const v1, 0x7f080121

    move v3, v1

    .line 226
    :goto_1
    const v1, 0x7f090238

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f09023e

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 227
    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 228
    :cond_2
    instance-of v0, v2, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, v2

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 225
    :cond_3
    const v1, 0x7f080122

    move v3, v1

    goto :goto_1
.end method

.method private renderProgress()V
    .locals 12

    .prologue
    .line 141
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 142
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v2

    .line 143
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 144
    const v1, 0x7f09024a

    const-string v2, "\u2014"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    const-string v2, "\u2014"

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 145
    const v1, 0x7f09024d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v1, 0x7f09023d

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 146
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 147
    if-nez v0, :cond_2

    const/4 v1, 0x0

    .line 148
    :goto_1
    instance-of v0, v1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    const-string v2, "Temps restant : \u2014"

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 149
    check-cast v1, Landroid/widget/TextView;

    const-string v0, "Temps restant : \u2014"

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 147
    :cond_2
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 152
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-long v4, v4

    const-wide/16 v6, 0x0

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    sub-long/2addr v8, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 153
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

    .line 154
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

    .line 155
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

    .line 156
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

    .line 157
    const v2, 0x7f09024d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    const v2, 0x7f09023d

    invoke-direct {p0, v0, v2, v1}, Lcom/melodix/music/PreviewPlayerController;->setProgress(Landroid/app/Activity;II)V

    .line 158
    const v1, 0x7f09024a

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->elapsedText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    const v1, 0x7f09024b

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->durationText:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->text(Landroid/app/Activity;ILjava/lang/String;)V

    .line 159
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 160
    if-nez v0, :cond_7

    const/4 v1, 0x0

    .line 161
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

    .line 162
    check-cast v1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->remainingText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 160
    :cond_7
    const-string v1, "nativePlayerRemaining"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto :goto_2
.end method

.method private report()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v2, 0x0

    const-wide/16 v8, 0x0

    .line 390
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v0, "Diagnostic Preview (mesures locales)\n"

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 391
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    cmp-long v0, v0, v8

    if-gez v0, :cond_1

    const-string v0, "Appui : \u2014\nCommande re\u00e7ue du pont : "

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    const-string v0, "\nInterface optimiste : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    const-string v0, "\n\u00c9tat du lecteur observ\u00e9 : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    const-string v0, "\nInterface confirm\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    invoke-direct {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->delta(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    const-string v0, "\nD\u00e9marrage : processus \u2192 prochaine frame accueil avec donn\u00e9es (Android 12+) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 396
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    cmp-long v0, v4, v8

    if-gez v0, :cond_2

    const-string v0, "\u2014"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    const-string v0, "\nD\u00e9marrage : activit\u00e9 \u2192 prochaine frame accueil avec donn\u00e9es : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 398
    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v0, v4, v8

    if-gez v0, :cond_3

    const-string v0, "\u2014"

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    const-string v0, "\nPlaylist : appui \u2192 prochaine frame avec titres : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 400
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    cmp-long v0, v4, v8

    if-gez v0, :cond_4

    const-string v0, "\u2014"

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    const-string v0, "\nChargement playlist (\u00e9tat local, sans identifiant) : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    const-string v0, "\nSource position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    const-string v0, " ; identit\u00e9 de titre pr\u00e9sente : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_5

    const-string v0, "oui"

    :goto_4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    const-string v0, "\nAnimation barre : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    const-string v0, "\nIdentit\u00e9 titre/artiste/dur\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v0, :cond_6

    const-string v0, "oui"

    :goto_5
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    const-string v0, " ; \u00e9tat : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    const-string v0, " ; \u00e2ge de la mesure : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v4, v8

    if-gez v0, :cond_7

    const-string v0, "\u2014"

    :goto_6
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    const-string v0, "\nPlaylist \u2014 attente pont : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    const-string v0, " ; navigation \u2192 page pr\u00eate : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    const-string v0, " ; page pr\u00eate/pont \u2192 lignes : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v0, v0, v8

    if-ltz v0, :cond_8

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    :goto_7
    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    invoke-direct {p0, v0, v1, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    const-string v0, " ; lignes \u2192 frame pr\u00e9par\u00e9e : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->phaseDuration(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    const-string v0, "\nPhase dominante : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->dominantPhase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    const-string v0, " ; waiting-bridge avec lignes : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v4, v8

    if-gez v0, :cond_9

    const-string v0, "ind\u00e9termin\u00e9"

    :goto_8
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    const-string v0, "\nIntervalles position : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-nez v0, :cond_0

    const-string v0, "\u2014"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    move v0, v2

    .line 416
    :goto_9
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    if-lt v0, v1, :cond_b

    .line 421
    const-string v0, "\nHistorique (120 derni\u00e8res secondes au premier plan) :"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    :goto_a
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    if-lt v2, v0, :cond_d

    .line 426
    const-string v0, "\nMesures de pr\u00e9paration de frame, pas pr\u00e9sentation \u00e9cran. D\u00e9marrage hors lanceur ; premier son non mesur\u00e9. La r\u00e9ception du pont n\'est pas un accus\u00e9 Spotify."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 391
    :cond_1
    const-string v0, "Appui : 0 ms\nCommande re\u00e7ue du pont : "

    goto/16 :goto_0

    .line 396
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 398
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    sget-wide v4, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 400
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_3

    .line 403
    :cond_5
    const-string v0, "non"

    goto/16 :goto_4

    .line 405
    :cond_6
    const-string v0, "non"

    goto/16 :goto_5

    .line 407
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long/2addr v4, v6

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_6

    .line 410
    :cond_8
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto/16 :goto_7

    .line 413
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    const-string v4, "waiting-bridge"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "oui (corrig\u00e9 \u00e0 la r\u00e9ception)"

    goto/16 :goto_8

    :cond_a
    const-string v0, "non"

    goto/16 :goto_8

    .line 417
    :cond_b
    if-lez v0, :cond_c

    const-string v1, ", "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    :cond_c
    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    iget v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    sub-int/2addr v1, v4

    add-int/2addr v1, v0

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v4, v4

    add-int/2addr v1, v4

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v4, v4

    rem-int/2addr v1, v4

    .line 419
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    aget-wide v4, v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " ms"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_9

    .line 423
    :cond_d
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    sub-int/2addr v0, v1

    add-int/2addr v0, v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    .line 424
    const-string v1, "\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    aget-object v0, v4, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_a
.end method

.method private scheduleFrame()V
    .locals 1

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-nez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz v0, :cond_2

    :cond_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 232
    :cond_2
    return-void
.end method

.method private scheduleTrace()V
    .locals 4

    .prologue
    .line 174
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 175
    :cond_0
    return-void
.end method

.method private setProgress(Landroid/app/Activity;II)V
    .locals 3

    .prologue
    const/16 v2, 0x3e8

    .line 165
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 166
    instance-of v1, v0, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 167
    check-cast v0, Landroid/widget/ProgressBar;

    .line 168
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 169
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v1

    if-eq v1, p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 171
    :cond_1
    return-void
.end method

.method private stopGlow(I)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 191
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v2, v0, p1

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, p1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, p1

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v2, v0, p1

    .line 193
    :cond_1
    return-void
.end method

.method private syncGlow()V
    .locals 11

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v10, 0x2

    const/4 v2, 0x0

    .line 195
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 196
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v1, v5, :cond_0

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    .line 197
    :goto_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v6

    .line 198
    if-eqz v0, :cond_1

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v5, :cond_1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    if-eqz v1, :cond_1

    .line 199
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v1, :cond_1

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_1

    const-wide/16 v8, 0x0

    cmpl-double v1, v6, v8

    if-lez v1, :cond_1

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    long-to-double v8, v8

    .line 198
    cmpg-double v1, v6, v8

    if-gez v1, :cond_1

    .line 200
    :goto_1
    new-array v5, v10, [I

    fill-array-data v5, :array_0

    .line 201
    :goto_2
    array-length v1, v5

    if-lt v2, v1, :cond_2

    .line 222
    return-void

    :cond_0
    move v1, v3

    .line 196
    goto :goto_0

    :cond_1
    move v3, v2

    .line 198
    goto :goto_1

    .line 202
    :cond_2
    if-nez v0, :cond_4

    move-object v1, v4

    .line 204
    :goto_3
    if-eqz v3, :cond_7

    instance-of v6, v1, Landroid/widget/ProgressBar;

    if-eqz v6, :cond_7

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 205
    check-cast v1, Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 206
    instance-of v6, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v6, :cond_7

    .line 207
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 208
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    const v6, 0x102000d

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 211
    :goto_4
    if-nez v1, :cond_5

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 201
    :cond_3
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 202
    :cond_4
    aget v1, v5, v2

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    goto :goto_3

    .line 212
    :cond_5
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aget-object v6, v6, v2

    if-ne v1, v6, :cond_6

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v6, v6, v2

    if-eqz v6, :cond_6

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Landroid/animation/ObjectAnimator;->isStarted()Z

    move-result v6

    if-nez v6, :cond_3

    .line 213
    :cond_6
    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    .line 214
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glowFill:[Landroid/graphics/drawable/Drawable;

    aput-object v1, v6, v2

    .line 215
    const-string v6, "alpha"

    new-array v7, v10, [I

    fill-array-data v7, :array_1

    invoke-static {v1, v6, v7}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 216
    const-wide/16 v6, 0x640

    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 217
    invoke-virtual {v1, v10}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 218
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 219
    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController;->glow:[Landroid/animation/ObjectAnimator;

    aput-object v1, v6, v2

    .line 220
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_5

    :cond_7
    move-object v1, v4

    goto :goto_4

    .line 200
    nop

    :array_0
    .array-data 4
        0x7f09024d
        0x7f09023d
    .end array-data

    .line 215
    :array_1
    .array-data 4
        0x96
        0xff
    .end array-data
.end method

.method private text(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 137
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 138
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

    .line 139
    :cond_0
    return-void
.end method


# virtual methods
.method public activityCreated()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 84
    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    .line 88
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 90
    :try_start_0
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    move-result-wide v0

    .line 91
    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J
    :try_end_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 92
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public activityResumed()V
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    return-void
.end method

.method public activityStopped()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 189
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerController;->stopGlow(I)V

    return-void
.end method

.method public attachAbout(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 359
    new-instance v0, Lcom/melodix/music/PreviewPlayerController$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController$2;-><init>(Lcom/melodix/music/PreviewPlayerController;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 362
    return-void
.end method

.method public begin(I)V
    .locals 2

    .prologue
    .line 354
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    .line 355
    iput p1, p0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    .line 356
    return-void
.end method

.method public command()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 357
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
    .locals 7

    .prologue
    const/4 v6, 0x0

    const-wide/16 v4, 0x0

    .line 234
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->frameScheduled:Z

    .line 235
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 236
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 237
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    if-eqz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 238
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    .line 239
    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    cmp-long v2, v2, v0

    if-gtz v2, :cond_2

    sget-wide v2, Lcom/melodix/music/PreviewPlayerController;->processStartAt:J

    sub-long v2, v0, v2

    sput-wide v2, Lcom/melodix/music/PreviewPlayerController;->processHomeFrameMs:J

    .line 241
    :cond_2
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 242
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    sub-long v2, v0, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    .line 244
    :cond_3
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 245
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v0, :cond_0

    .line 246
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    .line 247
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    if-eqz v0, :cond_0

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

.method public loadState(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 68
    if-eqz p1, :cond_0

    const-string v0, "(waiting-bridge|waiting-token|pending|failed|no-data|data|timeout|unavailable):(token|no-token|unknown)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 70
    :cond_0
    return-void
.end method

.method public phase(Ljava/lang/String;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 75
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_0

    if-nez p1, :cond_1

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    .line 77
    const-string v2, "bridge-ready"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    goto :goto_0

    .line 78
    :cond_2
    const-string v2, "navigation"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    goto :goto_0

    .line 79
    :cond_3
    const-string v2, "page-ready|"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    .line 80
    const-string v2, "page-ready|"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    goto :goto_0
.end method

.method public playlistOpened(Ljava/lang/String;)V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 96
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->playlistFrameMs:J

    const-string v0, ""

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 97
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->frameAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->pageReadyAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->navigationAt:J

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->bridgeAt:J

    const-string v0, "\u2014"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 98
    if-eqz p1, :cond_1

    const-string v0, "(?i)^spotify:playlist:[a-z0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "spotify:collection:tracks"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    :cond_0
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    .line 101
    :cond_1
    return-void
.end method

.method public rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const-wide/16 v6, 0x0

    .line 103
    const-string v0, "home"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstCreateAt:J

    cmp-long v0, v0, v6

    if-ltz v0, :cond_0

    sget-wide v0, Lcom/melodix/music/PreviewPlayerController;->firstHomeFrameMs:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->measureHomeFrame:Z

    .line 104
    :cond_0
    const-string v0, "detail"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->playlistStart:J

    cmp-long v0, v0, v6

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingPlaylist:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 106
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 107
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-lt v0, v2, :cond_2

    .line 117
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 118
    return-void

    .line 108
    :cond_2
    :try_start_1
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 109
    if-eqz v2, :cond_4

    const-string v3, "uri"

    const-string v4, "id"

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "(?i)^spotify:track:[a-z0-9]+$"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 110
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->rowsAt:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->stageAtRows:Ljava/lang/String;

    .line 111
    :cond_3
    const-string v0, "data:unknown"

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->loadStage:Ljava/lang/String;

    .line 112
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurePlaylistFrame:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_1

    .line 107
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public run()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 177
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceScheduled:Z

    .line 178
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->foreground:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 188
    :cond_0
    :goto_0
    return-void

    .line 179
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v2

    .line 180
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    .line 181
    :cond_2
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    cmp-long v0, v0, v6

    if-gez v0, :cond_4

    const-string v0, "\u2014"

    .line 182
    :goto_1
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "+"

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->traceStart:J

    sub-long/2addr v2, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v2, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " s : identit\u00e9="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 183
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v1, :cond_5

    const-string v1, "oui"

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", \u00e9tat="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 184
    const-string v2, ", mesure="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->progressStopReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 182
    aput-object v0, v4, v5

    .line 185
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceIndex:I

    .line 186
    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController;->trace:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/melodix/music/PreviewPlayerController;->traceCount:I

    .line 187
    :cond_3
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleTrace()V

    goto :goto_0

    .line 181
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v4, v2, v4

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 183
    :cond_5
    const-string v1, "non"

    goto :goto_2
.end method

.method public showDiagnostics()V
    .locals 5

    .prologue
    .line 430
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 439
    :goto_0
    return-void

    .line 431
    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;

    move-result-object v1

    .line 432
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Diagnostic Preview"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 433
    const-string v3, "Copier"

    new-instance v4, Lcom/melodix/music/PreviewPlayerController$3;

    invoke-direct {v4, p0, v0, v1}, Lcom/melodix/music/PreviewPlayerController$3;-><init>(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 438
    const-string v1, "Fermer"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public snapshot(Ljava/lang/String;)V
    .locals 28

    .prologue
    .line 256
    :try_start_0
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 257
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v18

    .line 258
    const-string v4, "previewProgressValid"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 262
    const-string v4, "track"

    const-string v5, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "artist"

    const-string v6, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 263
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v6, :cond_1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 264
    :cond_0
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 265
    const-wide/16 v4, -0x1

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 267
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    .line 335
    :cond_2
    :goto_0
    return-void

    .line 270
    :cond_3
    const-string v4, "track"

    const-string v5, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v4, "artist"

    const-string v6, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 271
    const-string v6, "previewTrackUri"

    const-string v7, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 272
    const-string v6, "previewPositionMs"

    const-wide/16 v8, -0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v22

    const-string v6, "previewDurationMs"

    const-wide/16 v8, -0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v6, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 273
    const-string v9, "previewPlaybackState"

    const-string v8, "playing"

    const/4 v10, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_12

    const-string v8, "playing"

    :goto_1
    move-object/from16 v0, v17

    invoke-virtual {v0, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 274
    const-string v9, "playing"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_27

    const-string v9, "paused"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_27

    const-string v8, "unknown"

    move-object/from16 v16, v8

    .line 275
    :goto_2
    const-string v8, "playing"

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    .line 276
    const-string v8, "previewProgressValid"

    const/4 v9, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_13

    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_13

    const-wide/16 v8, 0x0

    cmp-long v8, v22, v8

    if-ltz v8, :cond_13

    cmp-long v8, v22, v6

    if-gtz v8, :cond_13

    const/4 v8, 0x1

    move v15, v8

    .line 277
    :goto_3
    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_14

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->realMetadata(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_14

    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_14

    const/4 v8, 0x1

    move v14, v8

    .line 278
    :goto_4
    if-eqz v14, :cond_15

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    if-eqz v8, :cond_15

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_15

    .line 279
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_15

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    cmp-long v8, v8, v6

    if-nez v8, :cond_15

    .line 280
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_4

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_4

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_15

    .line 278
    :cond_4
    const/4 v8, 0x0

    move v13, v8

    .line 281
    :goto_5
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->position(J)D

    move-result-wide v8

    .line 282
    if-nez v13, :cond_16

    if-eqz v15, :cond_16

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v24, 0x0

    cmp-long v10, v10, v24

    if-ltz v10, :cond_16

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v24, 0x7d0

    sub-long v10, v10, v24

    cmp-long v10, v22, v10

    if-gez v10, :cond_16

    const/4 v10, 0x1

    move v12, v10

    .line 283
    :goto_6
    if-eqz v15, :cond_17

    if-nez v13, :cond_5

    if-nez v12, :cond_5

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v24, 0x0

    cmp-long v10, v10, v24

    if-ltz v10, :cond_5

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    cmp-long v10, v22, v10

    if-eqz v10, :cond_17

    :cond_5
    const/4 v10, 0x1

    move v11, v10

    .line 284
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v10, :cond_18

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v10, :cond_18

    if-eqz v21, :cond_18

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v10, :cond_18

    if-nez v13, :cond_18

    const/4 v10, 0x1

    .line 285
    :goto_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    move/from16 v24, v0

    .line 286
    const-string v25, "previewProgressSource"

    const-string v26, "none"

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v25, "range"

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v25, "media"

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v25, "clock"

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_6

    const-string v17, "none"

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->progressSource:Ljava/lang/String;

    .line 288
    :cond_6
    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    .line 289
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/melodix/music/PreviewPlayerController;->tupleIdentity:Z

    .line 290
    if-eqz v13, :cond_7

    .line 291
    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput-boolean v8, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput-boolean v8, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const-wide/high16 v8, 0x7ff8000000000000L    # Double.NaN

    .line 292
    const-wide/16 v26, -0x1

    move-wide/from16 v0, v26

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    move-wide/from16 v0, v26

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    .line 294
    :cond_7
    if-eqz v14, :cond_19

    :goto_9
    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->identityTitle:Ljava/lang/String;

    if-eqz v14, :cond_1a

    :goto_a
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityArtist:Ljava/lang/String;

    .line 295
    if-eqz v14, :cond_1b

    move-wide v4, v6

    :goto_b
    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->identityDuration:J

    .line 296
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_8

    if-eqz v13, :cond_9

    :cond_8
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->track:Ljava/lang/String;

    .line 297
    :cond_9
    if-eqz v15, :cond_22

    .line 298
    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->duration:J

    .line 299
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_a

    if-nez v13, :cond_a

    if-nez v12, :cond_a

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 300
    :cond_a
    move-wide/from16 v0, v22

    long-to-double v4, v0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 308
    :cond_b
    :goto_c
    if-eqz v11, :cond_d

    .line 309
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_c

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_c

    if-eqz v21, :cond_c

    .line 310
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    move-object/from16 v0, p0

    iget v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    sub-long v6, v18, v6

    aput-wide v6, v4, v5

    .line 311
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    rem-int/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalIndex:I

    .line 312
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerController;->intervals:[J

    array-length v5, v5

    if-ge v4, v5, :cond_c

    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/melodix/music/PreviewPlayerController;->intervalCount:I

    .line 314
    :cond_c
    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementAt:J

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->measurementPosition:J

    .line 316
    :cond_d
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    .line 317
    if-eqz v14, :cond_21

    if-eqz v21, :cond_21

    if-nez v10, :cond_21

    const/4 v4, 0x1

    :goto_d
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    .line 322
    :goto_e
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/melodix/music/PreviewPlayerController;->playbackState:Ljava/lang/String;

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    .line 323
    const-string v4, "unknown"

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    .line 324
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->realPlaying:Z

    .line 325
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-eqz v4, :cond_e

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v21

    if-ne v0, v4, :cond_e

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 326
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    if-nez v4, :cond_f

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 328
    :cond_f
    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->scheduleFrame()V

    .line 329
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->tapAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->commandAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 330
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_10

    const-string v4, "unknown"

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    move/from16 v0, v21

    if-eq v0, v4, :cond_11

    .line 331
    :cond_10
    move-object/from16 v0, p0

    iget v4, v0, Lcom/melodix/music/PreviewPlayerController;->operation:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerController;->trackBefore:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 332
    :cond_11
    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->stateAt:J

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->uiAt:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 334
    :catch_0
    move-exception v4

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->glowSampleValid:Z

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->renderProgress()V

    invoke-direct/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    goto/16 :goto_0

    .line 273
    :cond_12
    :try_start_1
    const-string v8, "paused"

    goto/16 :goto_1

    .line 276
    :cond_13
    const/4 v8, 0x0

    move v15, v8

    goto/16 :goto_3

    .line 277
    :cond_14
    const/4 v8, 0x0

    move v14, v8

    goto/16 :goto_4

    .line 278
    :cond_15
    const/4 v8, 0x1

    move v13, v8

    goto/16 :goto_5

    .line 282
    :cond_16
    const/4 v10, 0x0

    move v12, v10

    goto/16 :goto_6

    .line 283
    :cond_17
    const/4 v10, 0x0

    move v11, v10

    goto/16 :goto_7

    .line 284
    :cond_18
    const/4 v10, 0x0

    goto/16 :goto_8

    .line 294
    :cond_19
    const-string v5, ""

    goto/16 :goto_9

    :cond_1a
    const-string v4, ""

    goto/16 :goto_a

    .line 295
    :cond_1b
    const-wide/16 v4, -0x1

    goto/16 :goto_b

    .line 301
    :cond_1c
    if-eqz v11, :cond_1d

    if-nez v21, :cond_1d

    if-nez v10, :cond_1d

    .line 302
    move-wide/from16 v0, v22

    long-to-double v4, v0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_c

    .line 303
    :cond_1d
    if-eqz v11, :cond_1e

    if-nez v10, :cond_1e

    .line 304
    const-wide/16 v4, 0x0

    long-to-double v6, v6

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    move-wide/from16 v0, v22

    long-to-double v4, v0

    sub-double/2addr v4, v8

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_c

    .line 305
    :cond_1e
    if-eqz v24, :cond_1f

    if-eqz v21, :cond_20

    if-nez v10, :cond_20

    :cond_1f
    if-nez v24, :cond_b

    if-eqz v21, :cond_b

    .line 306
    :cond_20
    const-wide/16 v4, 0x0

    long-to-double v6, v6

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    goto/16 :goto_c

    .line 317
    :cond_21
    const/4 v4, 0x0

    goto/16 :goto_d

    .line 318
    :cond_22
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    if-eqz v4, :cond_26

    if-nez v13, :cond_26

    if-eqz v14, :cond_26

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_26

    .line 319
    if-eqz v21, :cond_23

    if-eqz v10, :cond_24

    :cond_23
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/melodix/music/PreviewPlayerController;->base:D

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/melodix/music/PreviewPlayerController;->anchor:J

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/melodix/music/PreviewPlayerController;->correction:D

    .line 320
    :cond_24
    if-eqz v21, :cond_25

    if-nez v10, :cond_25

    const/4 v4, 0x1

    :goto_f
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z

    goto/16 :goto_e

    :cond_25
    const/4 v4, 0x0

    goto :goto_f

    .line 321
    :cond_26
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->valid:Z

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/melodix/music/PreviewPlayerController;->moving:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_e

    :cond_27
    move-object/from16 v16, v8

    goto/16 :goto_2
.end method

.method public tapPlayPause()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 337
    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V

    .line 338
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->haveReal:Z

    if-nez v0, :cond_1

    const/4 v2, -0x1

    .line 351
    :cond_0
    :goto_0
    return v2

    .line 339
    :cond_1
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v4

    .line 340
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

    .line 341
    :cond_2
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerController;->pending:Z

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->shownPlaying:Z

    .line 342
    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerController;->serial:J

    .line 343
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->renderButtons()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->syncGlow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerController;->now()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerController;->optimisticAt:J

    .line 344
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/melodix/music/PreviewPlayerController$1;

    invoke-direct {v3, p0, v4, v5}, Lcom/melodix/music/PreviewPlayerController$1;-><init>(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 350
    const-wide/16 v4, 0x1f40

    .line 344
    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 351
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerController;->pendingTarget:Z

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_3
    move v0, v2

    .line 341
    goto :goto_1
.end method
